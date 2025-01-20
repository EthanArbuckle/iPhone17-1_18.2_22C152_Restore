@interface FAFamilyCloudKitProperties
+ (BOOL)supportsSecureCoding;
- (FAFamilyCloudKitProperties)initWithCoder:(id)a3;
- (FAFamilyCloudKitProperties)initWithDictionaryRepresentation:(id)a3;
- (NSDictionary)dictionary;
- (NSString)bundleID;
- (NSString)participantID;
- (NSString)shareID;
- (NSString)zoneID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FAFamilyCloudKitProperties

- (void).cxx_destruct
{
}

- (FAFamilyCloudKitProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FAFamilyCloudKitProperties *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_dictionary"];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v11;
  }
  return v5;
}

- (FAFamilyCloudKitProperties)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FAFamilyCloudKitProperties;
  v5 = [(FAFamilyCloudKitProperties *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"ck-bundle-id"];
}

- (NSString)shareID
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"ck-share-id"];
}

- (NSString)zoneID
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"ck-zone-id"];
}

- (NSString)participantID
{
  return (NSString *)[(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"ck-participant-id"];
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

@end