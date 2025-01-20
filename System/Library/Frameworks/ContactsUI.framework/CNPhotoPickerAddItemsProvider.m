@interface CNPhotoPickerAddItemsProvider
- (BOOL)allowsEmoji;
- (BOOL)allowsMonograms;
- (BOOL)allowsPhotoFromLibraryItem;
- (BOOL)allowsTakePhotoItem;
- (CNPhotoPickerAddItemsProvider)initWithVisualIdentity:(id)a3;
- (CNPhotoPickerAddItemsProvider)initWithVisualIdentity:(id)a3 allowsTakePhotoItem:(BOOL)a4 allowsPhotoFromLibraryItem:(BOOL)a5 allowsMonograms:(BOOL)a6 allowsEmoji:(BOOL)a7;
- (CNVisualIdentity)visualIdentity;
- (NSString)identifier;
- (id)addItemOfType:(unint64_t)a3;
- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8;
- (id)symbolImageNameForAddItemType:(unint64_t)a3;
- (void)setAllowsEmoji:(BOOL)a3;
- (void)setAllowsMonograms:(BOOL)a3;
- (void)setAllowsPhotoFromLibraryItem:(BOOL)a3;
- (void)setAllowsTakePhotoItem:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation CNPhotoPickerAddItemsProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualIdentity, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setAllowsEmoji:(BOOL)a3
{
  self->_allowsEmoji = a3;
}

- (BOOL)allowsEmoji
{
  return self->_allowsEmoji;
}

- (void)setAllowsMonograms:(BOOL)a3
{
  self->_allowsMonograms = a3;
}

- (BOOL)allowsMonograms
{
  return self->_allowsMonograms;
}

- (void)setAllowsPhotoFromLibraryItem:(BOOL)a3
{
  self->_allowsPhotoFromLibraryItem = a3;
}

- (BOOL)allowsPhotoFromLibraryItem
{
  return self->_allowsPhotoFromLibraryItem;
}

- (void)setAllowsTakePhotoItem:(BOOL)a3
{
  self->_allowsTakePhotoItem = a3;
}

- (BOOL)allowsTakePhotoItem
{
  return self->_allowsTakePhotoItem;
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)symbolImageNameForAddItemType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"camera";
  }
  else {
    return off_1E549B150[a3 - 1];
  }
}

- (id)addItemOfType:(unint64_t)a3
{
  v4 = -[CNPhotoPickerAddItemsProvider symbolImageNameForAddItemType:](self, "symbolImageNameForAddItemType:");
  v5 = [[CNPhotoPickerGlyphProviderItem alloc] initWithSymbolImageNamed:v4 withAddItemType:a3];

  return v5;
}

- (id)loadItemsForSize:(CGSize)a3 scale:(double)a4 RTL:(BOOL)a5 renderingQueue:(id)a6 callbackQueue:(id)a7 itemDelegate:(id)a8
{
  v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a5, a6, a7, a8, a3.width, a3.height, a4);
  if ([(CNPhotoPickerAddItemsProvider *)self allowsTakePhotoItem])
  {
    v10 = [(CNPhotoPickerAddItemsProvider *)self addItemOfType:0];
    [v9 addObject:v10];
  }
  if ([(CNPhotoPickerAddItemsProvider *)self allowsPhotoFromLibraryItem])
  {
    v11 = [(CNPhotoPickerAddItemsProvider *)self addItemOfType:1];
    [v9 addObject:v11];
  }
  if ([(CNPhotoPickerAddItemsProvider *)self allowsMonograms])
  {
    v12 = [(CNPhotoPickerAddItemsProvider *)self addItemOfType:2];
    [v9 addObject:v12];
  }
  if ([(CNPhotoPickerAddItemsProvider *)self allowsEmoji])
  {
    v13 = [(CNPhotoPickerAddItemsProvider *)self addItemOfType:3];
    [v9 addObject:v13];
  }
  v14 = (void *)[v9 copy];

  return v14;
}

- (CNPhotoPickerAddItemsProvider)initWithVisualIdentity:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNPhotoPickerAddItemsProvider;
  v6 = [(CNPhotoPickerAddItemsProvider *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_visualIdentity, a3);
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v11 = v7;
  }

  return v7;
}

- (CNPhotoPickerAddItemsProvider)initWithVisualIdentity:(id)a3 allowsTakePhotoItem:(BOOL)a4 allowsPhotoFromLibraryItem:(BOOL)a5 allowsMonograms:(BOOL)a6 allowsEmoji:(BOOL)a7
{
  v11 = [(CNPhotoPickerAddItemsProvider *)self initWithVisualIdentity:a3];
  v12 = v11;
  if (v11)
  {
    v11->_allowsTakePhotoItem = a4;
    v11->_allowsPhotoFromLibraryItem = a5;
    v11->_allowsMonograms = a6;
    v11->_allowsEmoji = a7;
    objc_super v13 = v11;
  }

  return v12;
}

@end