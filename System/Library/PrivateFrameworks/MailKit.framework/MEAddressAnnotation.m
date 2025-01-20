@interface MEAddressAnnotation
+ (BOOL)supportsSecureCoding;
+ (MEAddressAnnotation)errorWithLocalizedDescription:(NSString *)localizedDescription;
+ (MEAddressAnnotation)successWithLocalizedDescription:(NSString *)localizedDescription;
+ (MEAddressAnnotation)warningWithLocalizedDescription:(NSString *)localizedDescription;
- (MEAddressAnnotation)initWithCoder:(id)a3;
- (MEAddressAnnotation)initWithEmailAddressTokenIconType:(int64_t)a3 localizedDescription:(id)a4;
- (NSString)localizedDescription;
- (NSString)originatorExtensionDisplayName;
- (id)_iconTypeDescription;
- (id)description;
- (int64_t)iconType;
- (void)encodeWithCoder:(id)a3;
- (void)setOriginatorExtensionDisplayName:(id)a3;
@end

@implementation MEAddressAnnotation

- (MEAddressAnnotation)initWithEmailAddressTokenIconType:(int64_t)a3 localizedDescription:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MEAddressAnnotation;
  v8 = [(MEAddressAnnotation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_iconType = a3;
    objc_storeStrong((id *)&v8->_localizedDescription, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MEAddressAnnotation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"EFPropertyKey_iconType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_localizedDescription"];
  id v7 = [(MEAddressAnnotation *)self initWithEmailAddressTokenIconType:v5 localizedDescription:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[MEAddressAnnotation iconType](self, "iconType"), @"EFPropertyKey_iconType");
  id v4 = [(MEAddressAnnotation *)self localizedDescription];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_localizedDescription"];
}

- (id)_iconTypeDescription
{
  unint64_t iconType = self->_iconType;
  if (iconType > 2) {
    return &stru_26C713DA8;
  }
  else {
    return off_264282F60[iconType];
  }
}

- (id)description
{
  v3 = NSString;
  originatorExtensionDisplayName = self->_originatorExtensionDisplayName;
  id v5 = [(MEAddressAnnotation *)self _iconTypeDescription];
  v6 = [v3 stringWithFormat:@"App Extension Name:%@ IconType:%@ Description:%@}", originatorExtensionDisplayName, v5, self->_localizedDescription];

  return v6;
}

+ (MEAddressAnnotation)errorWithLocalizedDescription:(NSString *)localizedDescription
{
  v3 = localizedDescription;
  id v4 = [[MEAddressAnnotation alloc] initWithEmailAddressTokenIconType:0 localizedDescription:v3];

  return v4;
}

+ (MEAddressAnnotation)warningWithLocalizedDescription:(NSString *)localizedDescription
{
  v3 = localizedDescription;
  id v4 = [[MEAddressAnnotation alloc] initWithEmailAddressTokenIconType:1 localizedDescription:v3];

  return v4;
}

+ (MEAddressAnnotation)successWithLocalizedDescription:(NSString *)localizedDescription
{
  v3 = localizedDescription;
  id v4 = [[MEAddressAnnotation alloc] initWithEmailAddressTokenIconType:2 localizedDescription:v3];

  return v4;
}

- (int64_t)iconType
{
  return self->_iconType;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)originatorExtensionDisplayName
{
  return self->_originatorExtensionDisplayName;
}

- (void)setOriginatorExtensionDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorExtensionDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
}

@end