@interface CRSIconLayoutState
+ (BOOL)supportsSecureCoding;
- (BOOL)displaysOEMIcon;
- (CRSIconLayoutState)initWithCoder:(id)a3;
- (CRSIconLayoutState)initWithPages:(id)a3 hiddenIcons:(id)a4;
- (NSArray)hiddenIcons;
- (NSArray)pages;
- (NSString)oemIconLabel;
- (id)description;
- (id)iconOrder;
- (unint64_t)columns;
- (unint64_t)rows;
- (void)encodeWithCoder:(id)a3;
- (void)setColumns:(unint64_t)a3;
- (void)setDisplaysOEMIcon:(BOOL)a3;
- (void)setOemIconLabel:(id)a3;
- (void)setRows:(unint64_t)a3;
@end

@implementation CRSIconLayoutState

- (CRSIconLayoutState)initWithPages:(id)a3 hiddenIcons:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRSIconLayoutState;
  v8 = [(CRSIconLayoutState *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    pages = v8->_pages;
    v8->_pages = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    hiddenIcons = v8->_hiddenIcons;
    v8->_hiddenIcons = (NSArray *)v11;
  }
  return v8;
}

- (id)iconOrder
{
  v3 = (void *)MEMORY[0x263EFF980];
  v4 = [(CRSIconLayoutState *)self pages];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(CRSIconLayoutState *)self pages];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __31__CRSIconLayoutState_iconOrder__block_invoke;
  v10[3] = &unk_264443020;
  id v11 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v10];

  v8 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];

  return v8;
}

void __31__CRSIconLayoutState_iconOrder__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a2;
  v5 = [v4 icons];
  id v6 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  id v7 = [v4 icons];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __31__CRSIconLayoutState_iconOrder__block_invoke_2;
  v11[3] = &unk_264442FF8;
  id v12 = v6;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v11];

  uint64_t v9 = *(void **)(a1 + 32);
  v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
  [v9 addObject:v10];
}

uint64_t __31__CRSIconLayoutState_iconOrder__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bundleIdentifier];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }
  return MEMORY[0x270F9A758]();
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  v16.receiver = self;
  v16.super_class = (Class)CRSIconLayoutState;
  id v4 = [(CRSIconLayoutState *)&v16 description];
  v5 = [v3 stringWithString:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(CRSIconLayoutState *)self pages];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendFormat:@"  page: %@", *(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRSIconLayoutState)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRSIconLayoutState;
  v5 = [(CRSIconLayoutState *)&v21 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"CRSIconLayoutStatePages"];
    pages = v5->_pages;
    v5->_pages = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    long long v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"CRSIconLayoutHiddenIcons"];
    hiddenIcons = v5->_hiddenIcons;
    v5->_hiddenIcons = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRSIconLayoutOEMIconLabel"];
    oemIconLabel = v5->_oemIconLabel;
    v5->_oemIconLabel = (NSString *)v16;

    v5->_displaysOEMIcon = [v4 decodeBoolForKey:@"CRSIconLayoutDisplaysOEMIcon"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRSIconLayoutRows"];
    v5->_rows = [v18 unsignedIntegerValue];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CRSIconLayoutColumns"];
    v5->_columns = [v19 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CRSIconLayoutState *)self pages];
  [v4 encodeObject:v5 forKey:@"CRSIconLayoutStatePages"];

  id v6 = [(CRSIconLayoutState *)self hiddenIcons];
  [v4 encodeObject:v6 forKey:@"CRSIconLayoutHiddenIcons"];

  uint64_t v7 = [(CRSIconLayoutState *)self oemIconLabel];
  [v4 encodeObject:v7 forKey:@"CRSIconLayoutOEMIconLabel"];

  objc_msgSend(v4, "encodeBool:forKey:", -[CRSIconLayoutState displaysOEMIcon](self, "displaysOEMIcon"), @"CRSIconLayoutDisplaysOEMIcon");
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRSIconLayoutState rows](self, "rows"));
  [v4 encodeObject:v8 forKey:@"CRSIconLayoutRows"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRSIconLayoutState columns](self, "columns"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"CRSIconLayoutColumns"];
}

- (NSArray)pages
{
  return self->_pages;
}

- (NSArray)hiddenIcons
{
  return self->_hiddenIcons;
}

- (NSString)oemIconLabel
{
  return self->_oemIconLabel;
}

- (void)setOemIconLabel:(id)a3
{
}

- (BOOL)displaysOEMIcon
{
  return self->_displaysOEMIcon;
}

- (void)setDisplaysOEMIcon:(BOOL)a3
{
  self->_displaysOEMIcon = a3;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oemIconLabel, 0);
  objc_storeStrong((id *)&self->_hiddenIcons, 0);
  objc_storeStrong((id *)&self->_pages, 0);
}

@end