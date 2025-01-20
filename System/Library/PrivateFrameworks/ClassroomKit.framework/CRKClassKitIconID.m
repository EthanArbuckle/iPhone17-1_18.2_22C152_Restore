@interface CRKClassKitIconID
+ (id)stringBySanitizingString:(id)a3;
- (CRKClassKitIconID)init;
- (CRKClassKitIconID)initWithClass:(id)a3;
- (CRKClassKitIconID)initWithIconID:(id)a3;
- (CRKClassKitIconID)initWithMascotIdentifier:(id)a3 colorIdentifier:(id)a4;
- (NSString)colorIdentifier;
- (NSString)mascotIdentifier;
- (NSString)stringValue;
- (void)setColorIdentifier:(id)a3;
- (void)setMascotIdentifier:(id)a3;
@end

@implementation CRKClassKitIconID

- (CRKClassKitIconID)initWithClass:(id)a3
{
  v4 = [a3 iconID];
  v5 = [(CRKClassKitIconID *)self initWithIconID:v4];

  return v5;
}

- (CRKClassKitIconID)initWithIconID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 rangeOfString:@"*" options:4];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = [(id)objc_opt_class() stringBySanitizingString:v5];
      v9 = [(CRKClassKitIconID *)self initWithMascotIdentifier:v8 colorIdentifier:0];
    }
    else
    {
      uint64_t v10 = v6;
      uint64_t v11 = v7;
      v12 = [v5 substringToIndex:v6];
      v13 = [v5 substringFromIndex:v10 + v11];
      v14 = [(id)objc_opt_class() stringBySanitizingString:v12];

      v15 = [(id)objc_opt_class() stringBySanitizingString:v13];

      v9 = [(CRKClassKitIconID *)self initWithMascotIdentifier:v14 colorIdentifier:v15];
    }
  }
  else
  {
    v9 = [(CRKClassKitIconID *)self initWithMascotIdentifier:0 colorIdentifier:0];
  }

  return v9;
}

+ (id)stringBySanitizingString:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 whitespaceCharacterSet];
  uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v6 length] && (objc_msgSend(v6, "isEqualToString:", @"(null)") & 1) == 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (CRKClassKitIconID)init
{
  return [(CRKClassKitIconID *)self initWithMascotIdentifier:0 colorIdentifier:0];
}

- (CRKClassKitIconID)initWithMascotIdentifier:(id)a3 colorIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKClassKitIconID;
  v8 = [(CRKClassKitIconID *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    mascotIdentifier = v8->_mascotIdentifier;
    v8->_mascotIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    colorIdentifier = v8->_colorIdentifier;
    v8->_colorIdentifier = (NSString *)v11;
  }
  return v8;
}

- (NSString)stringValue
{
  uint64_t v3 = [(CRKClassKitIconID *)self mascotIdentifier];
  id v4 = (void *)v3;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  else {
    v5 = &stru_26D7E7B00;
  }
  id v6 = v5;

  uint64_t v7 = [(CRKClassKitIconID *)self colorIdentifier];
  v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = &stru_26D7E7B00;
  }
  uint64_t v10 = v9;

  uint64_t v11 = [NSString stringWithFormat:@"%@*%@", v6, v10];

  return (NSString *)v11;
}

- (NSString)mascotIdentifier
{
  return self->_mascotIdentifier;
}

- (void)setMascotIdentifier:(id)a3
{
}

- (NSString)colorIdentifier
{
  return self->_colorIdentifier;
}

- (void)setColorIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorIdentifier, 0);

  objc_storeStrong((id *)&self->_mascotIdentifier, 0);
}

@end