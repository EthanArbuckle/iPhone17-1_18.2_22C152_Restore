@interface DCDocumentInfoCollectionActivityItemSource
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation DCDocumentInfoCollectionActivityItemSource

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = NSURL;
  v4 = [(DCActivityItemSource *)self docInfoCollection];
  v5 = +[DCDocCamPDFGenerator versionPDFPathForDocumentInfoCollection:v4];
  v6 = [v3 fileURLWithPath:v5];

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)*MEMORY[0x263F01A28];
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  v4 = [(DCActivityItemSource *)self docInfoCollection];
  v5 = [v4 title];

  v6 = (__CFString *)UTTypeCopyPreferredTagWithClass((CFStringRef)*MEMORY[0x263F01AC8], (CFStringRef)*MEMORY[0x263F01910]);
  if (v6)
  {
    v7 = [v5 pathExtension];
    char v8 = [v7 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [v5 stringByAppendingPathExtension:v6];

      v5 = (void *)v9;
    }
  }

  return v5;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v5 = NSURL;
  id v6 = a4;
  v7 = [(DCActivityItemSource *)self docInfoCollection];
  char v8 = +[DCDocCamPDFGenerator versionPDFPathForDocumentInfoCollection:v7];
  uint64_t v9 = [v5 fileURLWithPath:v8];

  LODWORD(v5) = [v6 isEqualToString:*MEMORY[0x263F1CFB0]];
  if (v5)
  {

    uint64_t v9 = 0;
  }

  return v9;
}

@end