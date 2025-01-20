@interface LNEmptySystemProtocolMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNEmptySystemProtocolMetadata)init;
- (NSString)description;
- (unint64_t)hash;
@end

@implementation LNEmptySystemProtocolMetadata

- (LNEmptySystemProtocolMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)LNEmptySystemProtocolMetadata;
  return [(LNEmptySystemProtocolMetadata *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNEmptySystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    char isKindOfClass = 1;
  }
  else if (v4)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 1;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p>", v5, self];

  return (NSString *)v6;
}

@end