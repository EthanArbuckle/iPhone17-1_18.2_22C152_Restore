@interface _UIDocumentPickerContainerContainerItem
- (BRContainer)container;
- (_UIDocumentPickerContainerContainerItem)initWithContainer:(id)a3;
- (id)_blockingThumbnailWithSize:(CGSize)a3 scale:(double)a4 wantsBorder:(BOOL *)a5;
- (id)modificationDate;
- (id)sortPath;
- (id)subtitle;
- (id)title;
- (id)url;
- (int64_t)type;
- (void)_modelChanged;
@end

@implementation _UIDocumentPickerContainerContainerItem

- (_UIDocumentPickerContainerContainerItem)initWithContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentPickerContainerContainerItem;
  v6 = [(_UIDocumentPickerContainerItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_container, a3);
  }

  return v7;
}

- (BRContainer)container
{
  return self->_container;
}

- (int64_t)type
{
  return 2;
}

- (id)title
{
  v2 = self->_container;
  v3 = [(BRContainer *)v2 localizedName];

  if (v3)
  {
    v4 = [(BRContainer *)v2 localizedName];
  }
  else
  {
    id v5 = [(BRContainer *)v2 identifier];
    uint64_t v6 = [v5 rangeOfString:@"." options:4];
    uint64_t v8 = v7;

    objc_super v9 = [(BRContainer *)v2 identifier];
    v4 = v9;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [v9 substringFromIndex:v6 + v8];

      v4 = (void *)v10;
    }
  }

  return v4;
}

- (void)_modelChanged
{
  id v7 = [(_UIDocumentPickerContainerItem *)self model];
  v3 = [v7 modelObjects];
  v4 = -[_UIDocumentPickerContainerItem _formattedSubtitleForNumberOfItems:](self, "_formattedSubtitleForNumberOfItems:", [v3 count]);
  id v5 = (NSString *)[v4 copy];
  cachedSubtitle = self->_cachedSubtitle;
  self->_cachedSubtitle = v5;
}

- (id)subtitle
{
  return self->_cachedSubtitle;
}

- (id)url
{
  return (id)[(BRContainer *)self->_container documentsURL];
}

- (id)_blockingThumbnailWithSize:(CGSize)a3 scale:(double)a4 wantsBorder:(BOOL *)a5
{
  double height = a3.height;
  double width = a3.width;
  if (a5) {
    *a5 = 0;
  }
  objc_super v9 = objc_opt_class();
  uint64_t v10 = [(BRContainer *)self->_container documentsURL];
  v11 = objc_msgSend(v9, "_blockingFolderIconForURL:container:size:scale:", v10, self->_container, width, height, a4);

  return v11;
}

- (id)modificationDate
{
  v2 = [(_UIDocumentPickerContainerContainerItem *)self container];
  v3 = [v2 lastServerUpdate];

  return v3;
}

- (id)sortPath
{
  v3 = (void *)MEMORY[0x230F720E0](self, a2);
  v4 = [(_UIDocumentPickerContainerContainerItem *)self title];
  id v5 = [v4 stringByAppendingString:@"/"];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_cachedSubtitle, 0);
}

@end