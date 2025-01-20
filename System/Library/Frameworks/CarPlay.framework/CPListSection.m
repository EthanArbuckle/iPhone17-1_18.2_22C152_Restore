@interface CPListSection
+ (BOOL)supportsSecureCoding;
- (CPButton)headerButton;
- (CPListSection)initWithCoder:(id)a3;
- (CPListSection)initWithItems:(NSArray *)items;
- (CPListSection)initWithItems:(NSArray *)items header:(NSString *)header headerSubtitle:(NSString *)headerSubtitle headerImage:(UIImage *)headerImage headerButton:(CPButton *)headerButton sectionIndexTitle:(NSString *)sectionIndexTitle;
- (CPListSection)initWithItems:(NSArray *)items header:(NSString *)header sectionIndexTitle:(NSString *)sectionIndexTitle;
- (CPListTemplate)listTemplate;
- (NSArray)items;
- (NSString)header;
- (NSString)headerSubtitle;
- (NSString)sectionIndexTitle;
- (NSUInteger)indexOfItem:(id)item;
- (NSUUID)identifier;
- (UIImage)headerImage;
- (id)itemAtIndex:(NSUInteger)index;
- (int64_t)index;
- (int64_t)numberOfItems;
- (unint64_t)sectionHeaderStyle;
- (void)_commonInitWithItems:(id)a3 header:(id)a4 headerSubtitle:(id)a5 headerImage:(id)a6 headerButton:(id)a7 sectionIndexTitle:(id)a8;
- (void)encodeWithCoder:(id)a3;
- (void)replaceItemAtIndex:(unint64_t)a3 withItem:(id)a4;
- (void)replaceItems:(id)a3;
- (void)setHeaderImage:(UIImage *)headerImage;
- (void)setIndex:(int64_t)a3;
- (void)setListTemplate:(id)a3;
- (void)setSectionHeaderStyle:(unint64_t)a3;
@end

@implementation CPListSection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPListSection)initWithItems:(NSArray *)items header:(NSString *)header sectionIndexTitle:(NSString *)sectionIndexTitle
{
  v8 = items;
  v9 = header;
  v10 = sectionIndexTitle;
  v13.receiver = self;
  v13.super_class = (Class)CPListSection;
  v11 = [(CPListSection *)&v13 init];
  if (v11)
  {
    v11->_sectionHeaderStyle = [(NSString *)v9 length] != 0;
    [(CPListSection *)v11 _commonInitWithItems:v8 header:v9 headerSubtitle:0 headerImage:0 headerButton:0 sectionIndexTitle:v10];
  }

  return v11;
}

- (CPListSection)initWithItems:(NSArray *)items header:(NSString *)header headerSubtitle:(NSString *)headerSubtitle headerImage:(UIImage *)headerImage headerButton:(CPButton *)headerButton sectionIndexTitle:(NSString *)sectionIndexTitle
{
  v14 = items;
  v15 = header;
  v16 = headerSubtitle;
  v17 = headerImage;
  v18 = headerButton;
  v19 = sectionIndexTitle;
  v23.receiver = self;
  v23.super_class = (Class)CPListSection;
  v20 = [(CPListSection *)&v23 init];
  v21 = v20;
  if (v20)
  {
    v20->_sectionHeaderStyle = 2;
    [(CPListSection *)v20 _commonInitWithItems:v14 header:v15 headerSubtitle:v16 headerImage:v17 headerButton:v18 sectionIndexTitle:v19];
  }

  return v21;
}

- (void)_commonInitWithItems:(id)a3 header:(id)a4 headerSubtitle:(id)a5 headerImage:(id)a6 headerButton:(id)a7 sectionIndexTitle:(id)a8
{
  v15 = (NSArray *)a3;
  id v16 = a4;
  v17 = (NSString *)a5;
  v18 = (UIImage *)a6;
  v19 = (CPButton *)a7;
  v20 = (NSString *)a8;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __103__CPListSection__commonInitWithItems_header_headerSubtitle_headerImage_headerButton_sectionIndexTitle___block_invoke;
  v34[3] = &__block_descriptor_40_e37_v32__0___CPListTemplateItem__8Q16_B24l;
  v34[4] = a2;
  [(NSArray *)v15 enumerateObjectsUsingBlock:v34];
  v21 = [MEMORY[0x263F08C38] UUID];
  identifier = self->_identifier;
  self->_identifier = v21;

  items = self->_items;
  self->_items = v15;
  v24 = v15;

  objc_storeStrong((id *)&self->_header, a4);
  sectionIndexTitle = self->_sectionIndexTitle;
  self->_sectionIndexTitle = v20;
  v26 = v20;

  headerImage = self->_headerImage;
  self->_headerImage = v18;
  v28 = v18;

  headerSubtitle = self->_headerSubtitle;
  self->_headerSubtitle = v17;
  v30 = v17;

  headerButton = self->_headerButton;
  self->_headerButton = v19;
  v32 = v19;

  NSUInteger v33 = [(NSString *)self->_headerSubtitle length];
  if (!v33 && !self->_headerImage && !self->_headerButton) {
    self->_sectionHeaderStyle = [v16 length] != 0;
  }
}

void __103__CPListSection__commonInitWithItems_header_headerSubtitle_headerImage_headerButton_sectionIndexTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v8 = *(const char **)(a1 + 32);
  id v12 = v3;
  if (([v7 containsObject:object_getClass(v12)] & 1) == 0)
  {
    v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = *MEMORY[0x263EFF4A0];
    v11 = NSStringFromSelector(v8);
    [v9 raise:v10, @"Unsupported object %@ passed to %@. Allowed classes: %@", v12, v11, v7, 0 format];
  }
}

- (CPListSection)initWithItems:(NSArray *)items
{
  return [(CPListSection *)self initWithItems:items header:0 sectionIndexTitle:0];
}

- (int64_t)numberOfItems
{
  v2 = [(CPListSection *)self items];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)itemAtIndex:(NSUInteger)index
{
  v4 = [(CPListSection *)self items];
  uint64_t v5 = [v4 objectAtIndexedSubscript:index];

  return v5;
}

- (NSUInteger)indexOfItem:(id)item
{
  id v4 = item;
  if ([v4 conformsToProtocol:&unk_26C970E68])
  {
    uint64_t v5 = [v4 identifier];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(CPListSection *)self items];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __29__CPListSection_indexOfItem___block_invoke;
  v10[3] = &unk_26430A6F8;
  id v11 = v5;
  id v7 = v5;
  NSUInteger v8 = [v6 indexOfObjectPassingTest:v10];

  return v8;
}

uint64_t __29__CPListSection_indexOfItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_26C970E68])
  {
    id v4 = [v3 identifier];
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v5 = [*(id *)(a1 + 32) isEqual:v4];

  return v5;
}

- (void)replaceItemAtIndex:(unint64_t)a3 withItem:(id)a4
{
  id v7 = a4;
  NSUInteger v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  id v20 = v7;
  if (([v11 containsObject:object_getClass(v20)] & 1) == 0)
  {
    id v12 = (void *)MEMORY[0x263EFF940];
    uint64_t v13 = *MEMORY[0x263EFF4A0];
    v14 = NSStringFromSelector(a2);
    [v12 raise:v13, @"Unsupported object %@ passed to %@. Allowed classes: %@", v20, v14, v11, 0 format];
  }
  v15 = (void *)MEMORY[0x263EFF980];
  id v16 = [(CPListSection *)self items];
  v17 = [v15 arrayWithArray:v16];

  [v17 replaceObjectAtIndex:a3 withObject:v20];
  v18 = (NSArray *)[v17 copy];
  items = self->_items;
  self->_items = v18;
}

- (void)replaceItems:(id)a3
{
  self->_items = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (CPListSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CPListSection;
  uint64_t v5 = [(CPListSection *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPSectionIdentifierKey"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    NSUInteger v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"kCPSectionItemsKey"];
    items = v5->_items;
    v5->_items = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPSectionHeaderKey"];
    header = v5->_header;
    v5->_header = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPSectionIndexTitleKey"];
    sectionIndexTitle = v5->_sectionIndexTitle;
    v5->_sectionIndexTitle = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPSectionHeaderSubtitleKey"];
    headerSubtitle = v5->_headerSubtitle;
    v5->_headerSubtitle = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPSectionHeaderImageKey"];
    headerImage = v5->_headerImage;
    v5->_headerImage = (UIImage *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPSectionHeaderButtonKey"];
    headerButton = v5->_headerButton;
    v5->_headerButton = (CPButton *)v24;

    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPSectionHeaderStyleKey"];
    v5->_sectionHeaderStyle = [v26 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPListSection *)self identifier];
  [v4 encodeObject:v5 forKey:@"kCPSectionIdentifierKey"];

  uint64_t v6 = [(CPListSection *)self items];
  [v4 encodeObject:v6 forKey:@"kCPSectionItemsKey"];

  id v7 = [(CPListSection *)self header];
  [v4 encodeObject:v7 forKey:@"kCPSectionHeaderKey"];

  NSUInteger v8 = [(CPListSection *)self sectionIndexTitle];
  [v4 encodeObject:v8 forKey:@"kCPSectionIndexTitleKey"];

  uint64_t v9 = [(CPListSection *)self headerSubtitle];
  [v4 encodeObject:v9 forKey:@"kCPSectionHeaderSubtitleKey"];

  uint64_t v10 = [(CPListSection *)self headerImage];
  [v4 encodeObject:v10 forKey:@"kCPSectionHeaderImageKey"];

  uint64_t v11 = [(CPListSection *)self headerButton];
  [v4 encodeObject:v11 forKey:@"kCPSectionHeaderButtonKey"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CPListSection sectionHeaderStyle](self, "sectionHeaderStyle"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"kCPSectionHeaderStyleKey"];
}

- (void)setHeaderImage:(UIImage *)headerImage
{
  uint64_t v5 = headerImage;
  uint64_t v11 = v5;
  if (!self->_sectionHeaderStyle)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Setting a header image requires section header text to be set."];
    goto LABEL_15;
  }
  uint64_t v6 = self->_headerImage;
  if (!v5 || v6)
  {
    if (v5 || !v6)
    {
      objc_storeStrong((id *)&self->_headerImage, headerImage);
      goto LABEL_14;
    }
    self->_headerImage = 0;

    if ([(NSString *)self->_headerSubtitle length] || self->_headerImage || self->_headerButton) {
      goto LABEL_14;
    }
    unint64_t v7 = [(NSString *)self->_header length] != 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_headerImage, headerImage);
    unint64_t v7 = 2;
  }
  self->_sectionHeaderStyle = v7;
LABEL_14:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listTemplate);
  uint64_t v9 = self->_headerImage;
  uint64_t v10 = [(CPListSection *)self identifier];
  [WeakRetained updateHeaderImage:v9 forSectionIdentifier:v10];

LABEL_15:
}

- (NSString)header
{
  return self->_header;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (CPButton)headerButton
{
  return self->_headerButton;
}

- (NSString)sectionIndexTitle
{
  return self->_sectionIndexTitle;
}

- (NSArray)items
{
  return self->_items;
}

- (CPListTemplate)listTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listTemplate);

  return (CPListTemplate *)WeakRetained;
}

- (void)setListTemplate:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (unint64_t)sectionHeaderStyle
{
  return self->_sectionHeaderStyle;
}

- (void)setSectionHeaderStyle:(unint64_t)a3
{
  self->_sectionHeaderStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_listTemplate);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitle, 0);
  objc_storeStrong((id *)&self->_headerButton, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);

  objc_storeStrong((id *)&self->_header, 0);
}

@end