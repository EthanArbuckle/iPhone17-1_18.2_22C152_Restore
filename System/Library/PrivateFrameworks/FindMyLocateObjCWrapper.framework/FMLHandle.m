@interface FMLHandle
+ (FMLHandle)handleWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (id)comparisonIdentifier;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
@end

@implementation FMLHandle

+ (FMLHandle)handleWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setIdentifier:v3];

  return (FMLHandle *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(FMLHandle *)self comparisonIdentifier];
    v7 = [v5 comparisonIdentifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)comparisonIdentifier
{
  v2 = [(FMLHandle *)self identifier];
  id v3 = [v2 lowercaseString];

  return v3;
}

- (unint64_t)hash
{
  v2 = [(FMLHandle *)self comparisonIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(FMLHandle *)self identifier];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(FMLHandle *)self identifier];
  v6 = [v3 stringWithFormat:@"<%@ %p [%@]>", v4, self, v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end