@interface LNVisibilityMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)assistantOnly;
- (BOOL)isDiscoverable;
- (BOOL)isEqual:(id)a3;
- (BOOL)visibleForUse:(int64_t)a3;
- (LNVisibilityMetadata)initWithCoder:(id)a3;
- (LNVisibilityMetadata)initWithIsDiscoverable:(BOOL)a3 assistantOnly:(BOOL)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNVisibilityMetadata

- (LNVisibilityMetadata)initWithIsDiscoverable:(BOOL)a3 assistantOnly:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)LNVisibilityMetadata;
  v6 = [(LNVisibilityMetadata *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_isDiscoverable = a3;
    v6->_assistantOnly = a4;
    v8 = v6;
  }

  return v7;
}

- (LNVisibilityMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"isDiscoverable"];
  uint64_t v6 = [v4 decodeBoolForKey:@"assistantOnly"];

  return [(LNVisibilityMetadata *)self initWithIsDiscoverable:v5 assistantOnly:v6];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[LNVisibilityMetadata isDiscoverable](self, "isDiscoverable"), @"isDiscoverable");
  objc_msgSend(v4, "encodeBool:forKey:", -[LNVisibilityMetadata assistantOnly](self, "assistantOnly"), @"assistantOnly");
}

- (BOOL)isDiscoverable
{
  return self->_isDiscoverable;
}

- (BOOL)assistantOnly
{
  return self->_assistantOnly;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNVisibilityMetadata *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
    goto LABEL_10;
  }
  uint64_t v6 = v4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v6 = 0;
    goto LABEL_7;
  }
  BOOL v7 = [(LNVisibilityMetadata *)self isDiscoverable];
  if (v7 != [(LNVisibilityMetadata *)v6 isDiscoverable])
  {
LABEL_7:
    LOBYTE(v9) = 0;
    goto LABEL_8;
  }
  BOOL v8 = [(LNVisibilityMetadata *)self assistantOnly];
  BOOL v9 = v8 ^ [(LNVisibilityMetadata *)v6 assistantOnly] ^ 1;
LABEL_8:

LABEL_10:
  return v9;
}

- (unint64_t)hash
{
  BOOL v3 = [(LNVisibilityMetadata *)self isDiscoverable];
  return v3 ^ [(LNVisibilityMetadata *)self assistantOnly];
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  if ([(LNVisibilityMetadata *)self isDiscoverable]) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if ([(LNVisibilityMetadata *)self assistantOnly]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  BOOL v8 = [v3 stringWithFormat:@"<%@: %p, isDiscoverable: %@, assistantOnly: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  if (a3 == 1)
  {
    return [(LNVisibilityMetadata *)self isDiscoverable];
  }
  else
  {
    if (!a3)
    {
      if ([(LNVisibilityMetadata *)self isDiscoverable]) {
        char v3 = ![(LNVisibilityMetadata *)self assistantOnly];
      }
      else {
        char v3 = 0;
      }
    }
    return v3 & 1;
  }
}

@end