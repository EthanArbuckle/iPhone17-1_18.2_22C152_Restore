@interface CAMVideoThumbnailOutputConfigurationCommand
- (CAMVideoThumbnailOutputConfiguration)configuration;
- (CAMVideoThumbnailOutputConfigurationCommand)initWithCoder:(id)a3;
- (CAMVideoThumbnailOutputConfigurationCommand)initWithConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMVideoThumbnailOutputConfigurationCommand

- (CAMVideoThumbnailOutputConfigurationCommand)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMVideoThumbnailOutputConfigurationCommand;
  v6 = [(CAMCaptureCommand *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = v7;
  }

  return v7;
}

- (void)executeWithContext:(id)a3
{
  id v6 = [a3 currentVideoThumbnailOutput];
  if (v6)
  {
    v4 = [(CAMVideoThumbnailOutputConfigurationCommand *)self configuration];
    [v4 thumbnailSize];
    objc_msgSend(v6, "setThumbnailSize:");
    id v5 = [v4 filters];
    [v6 setFilters:v5];
  }
}

- (CAMVideoThumbnailOutputConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

- (CAMVideoThumbnailOutputConfigurationCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMVideoThumbnailOutputConfigurationCommand;
  id v5 = [(CAMCaptureCommand *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"CAMVideoThumbnailOutputConfigurationKey"];
    configuration = v5->_configuration;
    v5->_configuration = (CAMVideoThumbnailOutputConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMVideoThumbnailOutputConfigurationCommand;
  id v4 = a3;
  [(CAMCaptureCommand *)&v6 encodeWithCoder:v4];
  id v5 = [(CAMVideoThumbnailOutputConfigurationCommand *)self configuration];
  [v4 encodeObject:v5 forKey:@"CAMVideoThumbnailOutputConfigurationKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMVideoThumbnailOutputConfigurationCommand;
  id v4 = [(CAMCaptureCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(CAMVideoThumbnailOutputConfigurationCommand *)self configuration];
  objc_super v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

@end