@interface ARQuickLookPreviewItem
- (ARQuickLookPreviewItem)initWithFileAtURL:(NSURL *)url;
- (BOOL)allowsContentScaling;
- (BOOL)forceIgnoreMuteSwitch;
- (BOOL)wantsStatusPillHidden;
- (NSDictionary)previewOptions;
- (NSURL)canonicalWebPageURL;
- (NSURL)fileURL;
- (void)setAllowsContentScaling:(BOOL)allowsContentScaling;
- (void)setCanonicalWebPageURL:(NSURL *)canonicalWebPageURL;
- (void)setFileURL:(id)a3;
- (void)setForceIgnoreMuteSwitch:(BOOL)a3;
- (void)setWantsStatusPillHidden:(BOOL)a3;
@end

@implementation ARQuickLookPreviewItem

- (ARQuickLookPreviewItem)initWithFileAtURL:(NSURL *)url
{
  v5 = url;
  v10.receiver = self;
  v10.super_class = (Class)ARQuickLookPreviewItem;
  v6 = [(ARQuickLookPreviewItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, url);
    canonicalWebPageURL = v7->_canonicalWebPageURL;
    v7->_canonicalWebPageURL = 0;

    *(_WORD *)&v7->_allowsContentScaling = 1;
    v7->_forceIgnoreMuteSwitch = 0;
  }

  return v7;
}

- (NSDictionary)previewOptions
{
  v11[4] = *MEMORY[0x263EF8340];
  v10[0] = @"ARQLCanonicalWebPageURL";
  v3 = [(ARQuickLookPreviewItem *)self canonicalWebPageURL];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x263EFF9D0] null];
  }
  v11[0] = v4;
  v10[1] = @"allowObjectScaling";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[ARQuickLookPreviewItem allowsContentScaling](self, "allowsContentScaling"));
  v11[1] = v5;
  v10[2] = @"ARQLWantsStatusPillHiddenKey";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ARQuickLookPreviewItem wantsStatusPillHidden](self, "wantsStatusPillHidden"));
  v11[2] = v6;
  v10[3] = @"ARQLForceIgnoreMuteSwitchKey";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ARQuickLookPreviewItem forceIgnoreMuteSwitch](self, "forceIgnoreMuteSwitch"));
  v11[3] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  if (!v3) {

  }
  return (NSDictionary *)v8;
}

- (NSURL)canonicalWebPageURL
{
  return self->_canonicalWebPageURL;
}

- (void)setCanonicalWebPageURL:(NSURL *)canonicalWebPageURL
{
}

- (BOOL)allowsContentScaling
{
  return self->_allowsContentScaling;
}

- (void)setAllowsContentScaling:(BOOL)allowsContentScaling
{
  self->_allowsContentScaling = allowsContentScaling;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
}

- (BOOL)wantsStatusPillHidden
{
  return self->_wantsStatusPillHidden;
}

- (void)setWantsStatusPillHidden:(BOOL)a3
{
  self->_wantsStatusPillHidden = a3;
}

- (BOOL)forceIgnoreMuteSwitch
{
  return self->_forceIgnoreMuteSwitch;
}

- (void)setForceIgnoreMuteSwitch:(BOOL)a3
{
  self->_forceIgnoreMuteSwitch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);

  objc_storeStrong((id *)&self->_canonicalWebPageURL, 0);
}

@end