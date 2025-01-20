@interface ATXTimeSinceUserWakeupDataSource
- (ATXTimeSinceUserWakeupDataSource)initWithDevice:(id)a3;
- (void)timeIntervalSinceUserWakeupWithCallback:(id)a3;
@end

@implementation ATXTimeSinceUserWakeupDataSource

- (ATXTimeSinceUserWakeupDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimeSinceUserWakeupDataSource;
  v6 = [(ATXTimeSinceUserWakeupDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void)timeIntervalSinceUserWakeupWithCallback:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v5 = (void (**)(id, void *, void))a3;
  id v6 = [v4 alloc];
  id v12 = (id)[v6 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v7 = [v12 objectForKey:*MEMORY[0x1E4F4B708]];
  v8 = NSNumber;
  objc_super v9 = [(ATXHeuristicDevice *)self->_device now];
  v10 = v9;
  if (v7) {
    [v9 timeIntervalSinceDate:v7];
  }
  else {
    [v9 timeIntervalSinceReferenceDate];
  }
  v11 = objc_msgSend(v8, "numberWithDouble:");
  v5[2](v5, v11, 0);
}

- (void).cxx_destruct
{
}

@end