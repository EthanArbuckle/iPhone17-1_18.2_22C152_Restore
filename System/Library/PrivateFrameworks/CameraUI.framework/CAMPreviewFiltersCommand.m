@interface CAMPreviewFiltersCommand
- (CAMPreviewFiltersCommand)initWithCoder:(id)a3;
- (CAMPreviewFiltersCommand)initWithFilters:(id)a3 captureMode:(int64_t)a4;
- (CAMPreviewFiltersCommand)initWithSubcommands:(id)a3;
- (NSArray)filters;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_mode;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMPreviewFiltersCommand

- (void)executeWithContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[CAMCaptureCapabilities capabilities];
  if ([v5 hasFilteringEntitlement])
  {
    uint64_t v6 = [(CAMPreviewFiltersCommand *)self filters];
    if (v6) {
      v7 = (void *)v6;
    }
    else {
      v7 = (void *)MEMORY[0x263EFFA68];
    }
    v8 = [v4 currentVideoPreviewLayer];
    v9 = [v8 videoPreviewFilters];
    BOOL v10 = +[CAMEffectFilterManager areFilters:v7 equalTo:v9];

    if (!v10)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v8 videoPreviewFilters];
        v12 = +[CAMEffectFilterManager namesFromFilters:v17];
        v13 = [v12 componentsJoinedByString:@","];
        v14 = +[CAMEffectFilterManager namesFromFilters:v7];
        v15 = [v14 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        __int16 v20 = 2114;
        v21 = v15;
        _os_log_impl(&dword_2099F8000, v11, OS_LOG_TYPE_DEFAULT, "CAMPreviewFiltersCommand: changing video preview filters from [%{public}@] to [%{public}@]", buf, 0x16u);
      }
      [v8 setVideoPreviewFilters:v7];
      v16 = objc_alloc_init(CAMSystemPressureMitigationCommand);
      [(CAMCaptureCommand *)self addSubcommand:v16];
    }
    objc_msgSend(v4, "updateControlEnablementForFilters:captureMode:", v7, -[CAMPreviewFiltersCommand _mode](self, "_mode"));
  }
}

- (NSArray)filters
{
  return self->_filters;
}

- (void).cxx_destruct
{
}

- (CAMPreviewFiltersCommand)initWithFilters:(id)a3 captureMode:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMPreviewFiltersCommand;
  v8 = [(CAMCaptureCommand *)&v12 initWithSubcommands:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filters, a3);
    v9->__mode = a4;
    BOOL v10 = v9;
  }

  return v9;
}

- (CAMPreviewFiltersCommand)initWithSubcommands:(id)a3
{
  return [(CAMPreviewFiltersCommand *)self initWithFilters:0 captureMode:0];
}

- (CAMPreviewFiltersCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAMPreviewFiltersDataKey"];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v14 = 0;
    v9 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v8 fromData:v5 error:&v14];
    id v10 = v14;
    if (v10)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CAMPreviewFiltersCommand initWithCoder:]((uint64_t)v10, v11);
      }
    }
  }
  else
  {
    v9 = 0;
  }
  objc_super v12 = -[CAMPreviewFiltersCommand initWithFilters:captureMode:](self, "initWithFilters:captureMode:", v9, [v4 decodeIntegerForKey:@"CAMPreviewFiltersModeKey"]);

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMPreviewFiltersCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v10 encodeWithCoder:v4];
  v5 = [(CAMPreviewFiltersCommand *)self filters];
  if (v5)
  {
    id v9 = 0;
    uint64_t v6 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v9];
    id v7 = v9;
    if (v7)
    {
      v8 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CAMPreviewFiltersCommand encodeWithCoder:]((uint64_t)v7, v8);
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v4 encodeObject:v6 forKey:@"CAMPreviewFiltersDataKey"];
  objc_msgSend(v4, "encodeInteger:forKey:", -[CAMPreviewFiltersCommand _mode](self, "_mode"), @"CAMPreviewFiltersModeKey");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMPreviewFiltersCommand;
  id v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMPreviewFiltersCommand *)self filters];
  uint64_t v6 = (void *)v4[3];
  v4[3] = v5;

  v4[4] = [(CAMPreviewFiltersCommand *)self _mode];
  return v4;
}

- (int64_t)_mode
{
  return self->__mode;
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive filters: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Failed to archive filters: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end