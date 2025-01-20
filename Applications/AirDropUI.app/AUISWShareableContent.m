@interface AUISWShareableContent
- (AUISWShareableContent)initWithContent:(id)a3;
- (LPLinkMetadata)metadata;
- (NSArray)itemProviders;
- (SWShareableContent)content;
- (UIImage)previewImage;
- (void)setPreviewImage:(id)a3;
@end

@implementation AUISWShareableContent

- (AUISWShareableContent)initWithContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AUISWShareableContent;
  v6 = [(AUISWShareableContent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_content, a3);
  }

  return v7;
}

- (NSArray)itemProviders
{
  v3 = [(AUISWShareableContent *)self content];
  char v4 = objc_opt_respondsToSelector();

  id v5 = [(AUISWShareableContent *)self content];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 itemProviders];
  }
  else
  {
    v8 = [v5 itemProvider];
    v10 = v8;
    v7 = +[NSArray arrayWithObjects:&v10 count:1];
  }

  return (NSArray *)v7;
}

- (LPLinkMetadata)metadata
{
  v3 = [(AUISWShareableContent *)self content];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AUISWShareableContent *)self content];
    v6 = [v5 metadata];
  }
  else
  {
    v6 = 0;
  }

  return (LPLinkMetadata *)v6;
}

- (SWShareableContent)content
{
  return self->_content;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImage, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end