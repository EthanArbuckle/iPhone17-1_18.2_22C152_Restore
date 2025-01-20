@interface ATXCurrentLocationDataSource
- (ATXCurrentLocationDataSource)initWithDevice:(id)a3;
- (void)obtainOneTimeLocationWithCallback:(id)a3;
@end

@implementation ATXCurrentLocationDataSource

- (ATXCurrentLocationDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXCurrentLocationDataSource;
  v6 = [(ATXCurrentLocationDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)obtainOneTimeLocationWithCallback:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727308))
  {
    id v5 = [(ATXHeuristicDevice *)self->_device locationManager];

    if (v5)
    {
      v6 = [(ATXHeuristicDevice *)self->_device locationManager];
      v7 = [v6 getCurrentLocation];

      if (v7)
      {
        v16[0] = @"lat";
        v8 = NSNumber;
        [v7 coordinate];
        objc_super v9 = objc_msgSend(v8, "numberWithDouble:");
        v16[1] = @"lon";
        v17[0] = v9;
        v10 = NSNumber;
        [v7 coordinate];
        v12 = [v10 numberWithDouble:v11];
        v17[1] = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

        v4[2](v4, v13, 0);
      }
      else
      {
        v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F1E6C8] code:0 userInfo:0];
        ((void (**)(id, void *, void *))v4)[2](v4, 0, v15);
      }
    }
    else
    {
      v14 = __atxlog_handle_heuristic();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[ATXCurrentLocationDataSource obtainOneTimeLocationWithCallback:](v14);
      }

      v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
      ((void (**)(id, void *, void *))v4)[2](v4, (void *)MEMORY[0x1E4F1CC08], v7);
    }
  }
  else
  {
    v4[2](v4, (void *)MEMORY[0x1E4F1CC08], 0);
  }
}

- (void).cxx_destruct
{
}

- (void)obtainOneTimeLocationWithCallback:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0F43000, log, OS_LOG_TYPE_FAULT, "Someone tried to use location but a location manager was not set", v1, 2u);
}

@end