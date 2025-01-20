@interface MUBrowseCategoryItem
- (GEOSearchCategory)searchCategory;
- (MUBrowseCategoryItem)initWithCategory:(id)a3 nightMode:(BOOL)a4;
- (NSString)title;
- (UIImage)image;
- (id)imageWithSearchCategory:(id)a3 nightMode:(BOOL)a4;
@end

@implementation MUBrowseCategoryItem

- (MUBrowseCategoryItem)initWithCategory:(id)a3 nightMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MUBrowseCategoryItem;
  v8 = [(MUBrowseCategoryItem *)&v15 init];
  if (v8)
  {
    v9 = [v7 shortDisplayString];
    uint64_t v10 = [v9 copy];
    title = v8->_title;
    v8->_title = (NSString *)v10;

    uint64_t v12 = [(MUBrowseCategoryItem *)v8 imageWithSearchCategory:v7 nightMode:v4];
    image = v8->_image;
    v8->_image = (UIImage *)v12;

    objc_storeStrong((id *)&v8->_searchCategory, a3);
  }

  return v8;
}

- (id)imageWithSearchCategory:(id)a3 nightMode:(BOOL)a4
{
  v5 = (void *)MEMORY[0x1E4F30EB8];
  v6 = [a3 styleAttributes];
  id v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 nativeScale];
  LOBYTE(v10) = a4;
  v8 = objc_msgSend(v5, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v6, 4, 1, 0, 0, 0, v10);

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end