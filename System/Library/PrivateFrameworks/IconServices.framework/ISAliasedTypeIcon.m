@interface ISAliasedTypeIcon
+ (BOOL)supportsSecureCoding;
- (ISAliasedTypeIcon)initWithType:(id)a3 moniker:(id)a4;
- (ISIcon)moniker;
- (id)description;
@end

@implementation ISAliasedTypeIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ISAliasedTypeIcon)initWithType:(id)a3 moniker:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ISAliasedTypeIcon;
  v8 = [(ISTypeIcon *)&v11 initWithType:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_moniker, a4);
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ISAliasedTypeIcon;
  v4 = [(ISTypeIcon *)&v8 description];
  v5 = [(ISAliasedTypeIcon *)self moniker];
  v6 = [v3 stringWithFormat:@"%@, Moniker: %@", v4, v5];

  return v6;
}

- (ISIcon)moniker
{
  return (ISIcon *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
}

@end