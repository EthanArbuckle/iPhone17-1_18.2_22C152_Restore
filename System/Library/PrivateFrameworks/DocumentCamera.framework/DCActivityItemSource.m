@interface DCActivityItemSource
- (DCActivityItemSource)initWithDocumentInfoCollection:(id)a3;
- (ICDocCamDocumentInfoCollection)docInfoCollection;
- (NSString)attachmentTypeUTI;
- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setDocInfoCollection:(id)a3;
@end

@implementation DCActivityItemSource

- (DCActivityItemSource)initWithDocumentInfoCollection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DCActivityItemSource;
  v5 = [(DCActivityItemSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(DCActivityItemSource *)v5 setDocInfoCollection:v4];
  }

  return v6;
}

- (NSString)attachmentTypeUTI
{
  return (NSString *)(id)*MEMORY[0x263F01A80];
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF8F8], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return 0;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return &stru_26C7D5180;
}

- (id)activityViewController:(id)a3 attachmentNameForActivityType:(id)a4
{
  id v4 = [(DCActivityItemSource *)self docInfoCollection];
  v5 = [v4 title];

  if (![v5 length])
  {
    uint64_t v6 = +[DCLocalization localizedStringForKey:@"Scanned Documents" value:@"Scanned Documents" table:@"Localizable"];

    v5 = (void *)v6;
  }
  v7 = [v5 pathExtension];
  char v8 = [v7 isEqual:@"pdf"];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [v5 stringByAppendingPathExtension:@"pdf"];

    v5 = (void *)v9;
  }

  return v5;
}

- (ICDocCamDocumentInfoCollection)docInfoCollection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_docInfoCollection);

  return (ICDocCamDocumentInfoCollection *)WeakRetained;
}

- (void)setDocInfoCollection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end