@interface CSLPRFStingSettingsModelAccessibilityItem
+ (BOOL)supportsSecureCoding;
+ (id)defaultItems;
- (BOOL)isEqual:(id)a3;
- (CSLPRFStingSettingsModelAccessibilityItem)initWithActionType:(unint64_t)a3;
- (CSLPRFStingSettingsModelAccessibilityItem)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CSLPRFStingSettingsModelAccessibilityItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  [v3 appendString:self->_identifier withName:@"identifier" skipIfEmpty:1];
  [v3 appendString:self->_title withName:@"title" skipIfEmpty:1];
  v4 = [v3 build];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  identifier = self->_identifier;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __53__CSLPRFStingSettingsModelAccessibilityItem_isEqual___block_invoke;
  v18[3] = &unk_264A0B520;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendString:identifier counterpart:v18];
  title = self->_title;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __53__CSLPRFStingSettingsModelAccessibilityItem_isEqual___block_invoke_2;
  v16 = &unk_264A0B520;
  id v17 = v7;
  id v10 = v7;
  id v11 = (id)[v5 appendString:title counterpart:&v13];
  LOBYTE(title) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)title;
}

uint64_t __53__CSLPRFStingSettingsModelAccessibilityItem_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) identifier];
}

uint64_t __53__CSLPRFStingSettingsModelAccessibilityItem_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) title];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendString:self->_identifier];
  id v5 = (id)[v3 appendString:self->_title];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CSLPRFStingSettingsModelAccessibilityItem);
  id v5 = (void *)[(NSString *)self->_identifier copy];
  [(CSLPRFStingSettingsModelAccessibilityItem *)v4 setIdentifier:v5];

  unint64_t v6 = (void *)[(NSString *)self->_title copy];
  [(CSLPRFStingSettingsModelAccessibilityItem *)v4 setTitle:v6];

  return v4;
}

- (CSLPRFStingSettingsModelAccessibilityItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSLPRFStingSettingsModelAccessibilityItem;
  id v5 = [(CSLPRFStingSettingsModelAccessibilityItem *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;
  }
  return v5;
}

- (CSLPRFStingSettingsModelAccessibilityItem)initWithActionType:(unint64_t)a3
{
  if (a3 > 0xC) {
    id v5 = 0;
  }
  else {
    id v5 = off_264A0ADB0[a3];
  }
  uint64_t v6 = v5;
  id v7 = CSLPRFStingAccessibilityActionTypeName(a3);
  if (-[__CFString length](v6, "length") && [v7 length])
  {
    v15.receiver = self;
    v15.super_class = (Class)CSLPRFStingSettingsModelAccessibilityItem;
    uint64_t v8 = [(CSLPRFStingSettingsModelAccessibilityItem *)&v15 init];
    v9 = v8;
    if (v8)
    {
      if (a3 > 0xC) {
        id v10 = 0;
      }
      else {
        id v10 = off_264A0ADB0[a3];
      }
      objc_storeStrong((id *)&v8->_identifier, v10);
      uint64_t v12 = CSLPRFStingAccessibilityActionTypeName(a3);
      title = v9->_title;
      v9->_title = (NSString *)v12;
    }
    self = v9;
    objc_super v11 = self;
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultItems
{
  v2 = [MEMORY[0x263EFF980] array];
  for (uint64_t i = 0; i != 14; ++i)
  {
    if (i)
    {
      id v4 = [[CSLPRFStingSettingsModelAccessibilityItem alloc] initWithActionType:i];
      if (v4) {
        [v2 addObject:v4];
      }
    }
  }
  id v5 = [v2 sortedArrayUsingComparator:&__block_literal_global_2454];

  return v5;
}

uint64_t __57__CSLPRFStingSettingsModelAccessibilityItem_defaultItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 title];
  uint64_t v6 = [v4 title];

  uint64_t v7 = [v5 localizedCompare:v6];
  return v7;
}

@end