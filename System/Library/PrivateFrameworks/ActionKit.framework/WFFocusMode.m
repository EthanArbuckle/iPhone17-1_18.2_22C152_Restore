@interface WFFocusMode
+ (BOOL)supportsSecureCoding;
- (NSString)colorName;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)symbolName;
- (WFFocusMode)initWithCoder:(id)a3;
- (WFFocusMode)initWithFCActivityDescribing:(id)a3;
- (WFFocusMode)initWithIdentifier:(id)a3 displayName:(id)a4 symbolName:(id)a5 colorName:(id)a6;
- (WFImage)symbolImage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFocusMode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorName, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFFocusMode)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colorName"];

  v9 = [(WFFocusMode *)self initWithIdentifier:v5 displayName:v6 symbolName:v7 colorName:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFFocusMode *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(WFFocusMode *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  v7 = [(WFFocusMode *)self symbolName];
  [v4 encodeObject:v7 forKey:@"symbolName"];

  id v8 = [(WFFocusMode *)self colorName];
  [v4 encodeObject:v8 forKey:@"colorName"];
}

- (WFImage)symbolImage
{
  v3 = (void *)MEMORY[0x263F85308];
  id v4 = [(WFFocusMode *)self symbolName];
  v5 = [v3 systemImageNamed:v4 configuration:0 renderingMode:2];

  v6 = (void *)MEMORY[0x263F851A8];
  v7 = [(WFFocusMode *)self colorName];
  id v8 = [v6 colorWithFocusColorName:v7];

  if (v8)
  {
    uint64_t v9 = [v5 imageWithTintColor:v8];

    v5 = (void *)v9;
  }

  return (WFImage *)v5;
}

- (WFFocusMode)initWithIdentifier:(id)a3 displayName:(id)a4 symbolName:(id)a5 colorName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)WFFocusMode;
  v14 = [(WFFocusMode *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    symbolName = v14->_symbolName;
    v14->_symbolName = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    colorName = v14->_colorName;
    v14->_colorName = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

- (WFFocusMode)initWithFCActivityDescribing:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityIdentifier];
  v6 = [v4 activityDisplayName];
  v7 = [v4 activitySymbolImageName];
  id v8 = [v4 activityColorName];

  uint64_t v9 = [(WFFocusMode *)self initWithIdentifier:v5 displayName:v6 symbolName:v7 colorName:v8];
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end