@interface AXSSKeyboardCommand
+ (BOOL)supportsSecureCoding;
+ (id)commandWithStandardCommandIdentifier:(id)a3;
- (AXSSKeyboardCommand)initWithCoder:(id)a3;
- (AXSSKeyboardCommand)initWithStandardCommandIdentifier:(id)a3;
- (AXSSKeyboardCommand)initWithType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCommand:(id)a3;
- (NSString)localizedName;
- (NSString)standardCommandIdentifier;
- (NSString)type;
- (id)_initWithType:(id)a3 standardCommandIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AXSSKeyboardCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)commandWithStandardCommandIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithStandardCommandIdentifier:v4];

  return v5;
}

- (id)_initWithType:(id)a3 standardCommandIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXSSKeyboardCommand;
  v9 = [(AXSSKeyboardCommand *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (AXSSKeyboardCommand)initWithStandardCommandIdentifier:(id)a3
{
  return (AXSSKeyboardCommand *)[(AXSSKeyboardCommand *)self _initWithType:@"Standard" standardCommandIdentifier:a3];
}

- (AXSSKeyboardCommand)initWithType:(id)a3
{
  return (AXSSKeyboardCommand *)[(AXSSKeyboardCommand *)self _initWithType:a3 standardCommandIdentifier:0];
}

- (AXSSKeyboardCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"standardCommandIdentifier"];
    self = (AXSSKeyboardCommand *)[(AXSSKeyboardCommand *)self _initWithType:v5 standardCommandIdentifier:v6];

    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AXSSKeyboardCommand *)self type];
  [v4 encodeObject:v5 forKey:@"type"];

  id v6 = [(AXSSKeyboardCommand *)self standardCommandIdentifier];
  [v4 encodeObject:v6 forKey:@"standardCommandIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(AXSSKeyboardCommand *)self type];
  id v6 = [(AXSSKeyboardCommand *)self standardCommandIdentifier];
  id v7 = (void *)[v4 _initWithType:v5 standardCommandIdentifier:v6];

  return v7;
}

- (NSString)localizedName
{
  v3 = [(AXSSKeyboardCommand *)self type];
  int v4 = [v3 isEqualToString:@"Standard"];

  if (v4)
  {
    v5 = [(AXSSKeyboardCommand *)self standardCommandIdentifier];
    id v6 = [NSString stringWithFormat:@"COMMAND_%@", v5];
    id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:v6 value:&stru_1F0C5BA58 table:@"FullKeyboardAccess"];
  }
  else
  {
    id v8 = &stru_1F0C5BA58;
  }

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(AXSSKeyboardCommand *)self isEqualToCommand:v4];

  return v5;
}

- (BOOL)isEqualToCommand:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXSSKeyboardCommand *)self type];
  int v6 = [v5 isEqualToString:@"Standard"];

  if (v6)
  {
    id v7 = [v4 type];
    if ([v7 isEqualToString:@"Standard"])
    {
      id v8 = [v4 standardCommandIdentifier];
      v9 = [(AXSSKeyboardCommand *)self standardCommandIdentifier];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(AXSSKeyboardCommand *)self type];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(AXSSKeyboardCommand *)self standardCommandIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)AXSSKeyboardCommand;
  v3 = [(AXSSKeyboardCommand *)&v8 description];
  uint64_t v4 = [(AXSSKeyboardCommand *)self type];
  BOOL v5 = [(AXSSKeyboardCommand *)self standardCommandIdentifier];
  unint64_t v6 = [v3 stringByAppendingFormat:@" - type: %@, command identifier: %@", v4, v5];

  return v6;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)standardCommandIdentifier
{
  return self->_standardCommandIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardCommandIdentifier, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end