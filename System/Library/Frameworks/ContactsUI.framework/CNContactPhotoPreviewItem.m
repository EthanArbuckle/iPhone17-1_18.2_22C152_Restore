@interface CNContactPhotoPreviewItem
- (NSString)previewItemTitle;
- (NSURL)previewItemURL;
- (void)setPreviewItemTitle:(id)a3;
- (void)setPreviewItemURL:(id)a3;
@end

@implementation CNContactPhotoPreviewItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewItemTitle, 0);

  objc_storeStrong((id *)&self->_previewItemURL, 0);
}

- (void)setPreviewItemTitle:(id)a3
{
}

- (NSString)previewItemTitle
{
  return self->_previewItemTitle;
}

- (void)setPreviewItemURL:(id)a3
{
}

- (NSURL)previewItemURL
{
  return self->_previewItemURL;
}

@end