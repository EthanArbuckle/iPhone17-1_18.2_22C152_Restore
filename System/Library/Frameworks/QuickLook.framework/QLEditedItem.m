@interface QLEditedItem
- (NSURL)editedFileURL;
- (QLEditedItem)initWithItem:(id)a3 editedFileURL:(id)a4;
- (QLPreviewItem)item;
- (void)setEditedFileURL:(id)a3;
- (void)setItem:(id)a3;
@end

@implementation QLEditedItem

- (QLEditedItem)initWithItem:(id)a3 editedFileURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)QLEditedItem;
  v9 = [(QLEditedItem *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    objc_storeStrong((id *)&v10->_editedFileURL, a4);
    v11 = v10;
  }

  return v10;
}

- (QLPreviewItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (NSURL)editedFileURL
{
  return self->_editedFileURL;
}

- (void)setEditedFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editedFileURL, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

@end