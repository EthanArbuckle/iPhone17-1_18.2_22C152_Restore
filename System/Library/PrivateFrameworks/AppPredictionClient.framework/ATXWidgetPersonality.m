@interface ATXWidgetPersonality
+ (BOOL)supportsSecureCoding;
+ (id)stringRepresentationForATXHomeScreenWidgetDescriptor:(id)a3;
+ (id)stringRepresentationForExtensionBundleId:(id)a3 kind:(id)a4;
+ (id)widgetBundleIdForWidgetPersonalityStringRepresentation:(id)a3;
+ (id)widgetKindForWidgetPersonalityStringRepresentation:(id)a3;
- (ATXWidgetPersonality)initWithCoder:(id)a3;
- (ATXWidgetPersonality)initWithDescriptor:(id)a3;
- (ATXWidgetPersonality)initWithExtensionBundleId:(id)a3 kind:(id)a4;
- (ATXWidgetPersonality)initWithStringRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)extensionBundleId;
- (NSString)kind;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stringRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXWidgetPersonality

- (ATXWidgetPersonality)initWithExtensionBundleId:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXWidgetPersonality;
  v8 = [(ATXWidgetPersonality *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    extensionBundleId = v8->_extensionBundleId;
    v8->_extensionBundleId = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    kind = v8->_kind;
    v8->_kind = (NSString *)v11;
  }
  return v8;
}

- (ATXWidgetPersonality)initWithStringRepresentation:(id)a3
{
  id v4 = a3;
  v5 = +[ATXWidgetPersonality widgetBundleIdForWidgetPersonalityStringRepresentation:v4];
  id v6 = +[ATXWidgetPersonality widgetKindForWidgetPersonalityStringRepresentation:v4];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(ATXWidgetPersonality *)self initWithExtensionBundleId:v5 kind:v6];
    v8 = self;
  }

  return v8;
}

- (ATXWidgetPersonality)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 extensionBundleIdentifier];
  id v6 = [v4 kind];

  BOOL v7 = [(ATXWidgetPersonality *)self initWithExtensionBundleId:v5 kind:v6];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  extensionBundleId = self->_extensionBundleId;
  id v5 = a3;
  [v5 encodeObject:extensionBundleId forKey:@"extensionBundleId"];
  [v5 encodeObject:self->_kind forKey:@"kind"];
}

- (ATXWidgetPersonality)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleId"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];

  BOOL v7 = [(ATXWidgetPersonality *)self initWithExtensionBundleId:v5 kind:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXWidgetPersonality *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      extensionBundleId = self->_extensionBundleId;
      BOOL v7 = v5->_extensionBundleId;
      if (extensionBundleId == v7)
      {
      }
      else
      {
        v8 = v7;
        uint64_t v9 = extensionBundleId;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v12 = self->_kind;
      v13 = v12;
      if (v12 == v5->_kind) {
        char v11 = 1;
      }
      else {
        char v11 = -[NSString isEqual:](v12, "isEqual:");
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_extensionBundleId hash];
  return [(NSString *)self->_kind hash] - v3 + 32 * v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  extensionBundleId = self->_extensionBundleId;
  kind = self->_kind;

  return (id)[v4 initWithExtensionBundleId:extensionBundleId kind:kind];
}

- (id)description
{
  NSUInteger v3 = objc_opt_new();
  [v3 appendFormat:@"Extension bundle id: %@; ", self->_extensionBundleId];
  [v3 appendFormat:@"kind: %@; ", self->_kind];

  return v3;
}

- (id)stringRepresentation
{
  NSUInteger v3 = objc_opt_class();
  extensionBundleId = self->_extensionBundleId;
  kind = self->_kind;

  return (id)[v3 stringRepresentationForExtensionBundleId:extensionBundleId kind:kind];
}

+ (id)stringRepresentationForATXHomeScreenWidgetDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [v4 avocadoDescriptor];
  id v6 = [v5 extensionBundleIdentifier];
  BOOL v7 = [v4 avocadoDescriptor];

  v8 = [v7 kind];
  uint64_t v9 = [a1 stringRepresentationForExtensionBundleId:v6 kind:v8];

  return v9;
}

+ (id)stringRepresentationForExtensionBundleId:(id)a3 kind:(id)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithFormat:@"%@:%@", v7, v6];

  return v8;
}

+ (id)widgetBundleIdForWidgetPersonalityStringRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@":"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 substringToIndex:v4];
  }

  return v5;
}

+ (id)widgetKindForWidgetPersonalityStringRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@":"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [v3 substringFromIndex:v4 + 1];
  }

  return v5;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (NSString)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_extensionBundleId, 0);
}

@end