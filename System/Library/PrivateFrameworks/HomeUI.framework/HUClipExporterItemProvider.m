@interface HUClipExporterItemProvider
- (HUClipExporterItemProvider)initWithURL:(id)a3;
- (NSURL)clipURL;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)item;
- (void)setClipURL:(id)a3;
@end

@implementation HUClipExporterItemProvider

- (HUClipExporterItemProvider)initWithURL:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HUClipExporterItemProvider.m", 19, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HUClipExporterItemProvider;
  v7 = [(UIActivityItemProvider *)&v11 initWithPlaceholderItem:v6];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_clipURL, a3);
  }

  return v8;
}

- (id)item
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [(UIActivityItemProvider *)self activityType];
  int v4 = [v3 isEqual:*MEMORY[0x1E4F43590]];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v6 = [(HUClipExporterItemProvider *)self clipURL];
    v7 = (void *)[v5 initWithContentsOfURL:v6];

    v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      uint64_t v13 = [v7 length];
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Exporting data for AirDrop dropping with bytes = %lu", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(UIActivityItemProvider *)self activityType];
      int v12 = 138412290;
      uint64_t v13 = (uint64_t)v10;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Exporting data for activity type = %@", (uint8_t *)&v12, 0xCu);
    }
    v7 = [(HUClipExporterItemProvider *)self clipURL];
  }

  return v7;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return @"public.mpeg-4";
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  int v4 = [(HUClipExporterItemProvider *)self clipURL];
  id v5 = [v4 lastPathComponent];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@".mp4" withString:&stru_1F18F92B8];

  v7 = NSString;
  v8 = _HULocalizedStringWithDefaultValue(@"HUCameraExportSubject", @"HUCameraExportSubject", 1);
  v9 = [v7 stringWithFormat:@"%@ - %@", v8, v6];

  return v9;
}

- (NSURL)clipURL
{
  return self->_clipURL;
}

- (void)setClipURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end