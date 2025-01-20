@interface DMTConfigurationPrimitive
- (DMTConfigurationPrimitive)initWithDictionary:(id)a3 error:(id *)a4;
- (NSDictionary)rawDictionary;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)type;
- (NSString)uuid;
@end

@implementation DMTConfigurationPrimitive

- (DMTConfigurationPrimitive)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DMTConfigurationPrimitive;
  v7 = [(DMTConfigurationPrimitive *)&v28 init];
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = [v6 copy];
  rawDictionary = v7->_rawDictionary;
  v7->_rawDictionary = (NSDictionary *)v8;

  id v27 = 0;
  uint64_t v10 = DMTValidateProfileString(v6, @"PayloadDisplayName", 1, &v27);
  id v11 = v27;
  displayName = v7->_displayName;
  v7->_displayName = (NSString *)v10;

  id v26 = v11;
  uint64_t v13 = DMTValidateProfileString(v6, @"PayloadIdentifier", 0, &v26);
  id v14 = v26;

  identifier = v7->_identifier;
  v7->_identifier = (NSString *)v13;

  id v25 = v14;
  uint64_t v16 = DMTValidateProfileString(v6, @"PayloadType", 0, &v25);
  id v17 = v25;

  type = v7->_type;
  v7->_type = (NSString *)v16;

  id v24 = v17;
  uint64_t v19 = DMTValidateProfileString(v6, @"PayloadUUID", 0, &v24);
  id v20 = v24;

  uuid = v7->_uuid;
  v7->_uuid = (NSString *)v19;

  if (v20)
  {
    if (a4)
    {
      id v20 = v20;
      v22 = 0;
      *a4 = v20;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
LABEL_5:
    v22 = v7;
    id v20 = 0;
  }

  return v22;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSDictionary)rawDictionary
{
  return self->_rawDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawDictionary, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end