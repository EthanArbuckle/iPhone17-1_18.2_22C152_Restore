@interface BCMutableSecureUserDatum
+ (BOOL)supportsSecureCoding;
- (BCMutableSecureUserDatum)initWithCloudData:(id)a3;
- (BCMutableSecureUserDatum)initWithCoder:(id)a3;
- (BCMutableSecureUserDatum)initWithKey:(id)a3;
- (BCMutableSecureUserDatum)initWithRecord:(id)a3;
- (NSString)description;
- (NSString)key;
- (NSString)value;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (void)encodeWithCoder:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation BCMutableSecureUserDatum

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BCMutableSecureUserDatum;
  id v4 = a3;
  [(BCMutableCloudData *)&v6 encodeWithCoder:v4];
  v5 = [(BCMutableSecureUserDatum *)self value];
  [v4 encodeObject:v5 forKey:@"value"];
}

- (NSString)value
{
  return self->_value;
}

- (BCMutableSecureUserDatum)initWithCloudData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BCMutableSecureUserDatum;
  v5 = [(BCMutableCloudData *)&v15 initWithCloudData:v4];
  if (v5)
  {
    objc_super v6 = BUProtocolCast();
    v7 = v6;
    if (v6)
    {
      v8 = [v6 key];
      v9 = (NSString *)[v8 copy];
      key = v5->_key;
      v5->_key = v9;

      v11 = [v7 value];
      v12 = (NSString *)[v11 copy];
      value = v5->_value;
      v5->_value = v12;
    }
    else
    {
      value = sub_1000083A0();
      if (os_log_type_enabled(value, OS_LOG_TYPE_ERROR)) {
        sub_1001E905C();
      }
      v11 = v5;
      v5 = 0;
    }
  }
  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (BCMutableSecureUserDatum)initWithKey:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E91D8();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCMutableSecureUserDatum;
  id v5 = [(BCMutableCloudData *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    self = (BCMutableSecureUserDatum *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v6;
LABEL_7:
  }
  return (BCMutableSecureUserDatum *)v5;
}

- (BCMutableSecureUserDatum)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    value = sub_1000083A0();
    if (os_log_type_enabled(value, OS_LOG_TYPE_ERROR)) {
      sub_1001E920C();
    }
    id v5 = 0;
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)BCMutableSecureUserDatum;
  id v5 = [(BCMutableCloudData *)&v11 initWithRecord:v4];
  if (v5)
  {
    uint64_t v6 = +[BCCloudData localIdentifierFromRecord:v4];
    key = v5->_key;
    v5->_key = (NSString *)v6;

    self = [v4 objectForKey:@"value"];
    v8 = (NSString *)[(BCMutableSecureUserDatum *)self copy];
    value = v5->_value;
    v5->_value = v8;
LABEL_7:
  }
  return v5;
}

- (NSString)description
{
  v3 = [(BCMutableSecureUserDatum *)self key];
  id v4 = [(BCMutableSecureUserDatum *)self value];
  id v5 = +[NSString stringWithFormat:@"key: %@, value: %@", v3, v4];

  return (NSString *)v5;
}

- (id)recordType
{
  return @"SecureUserData";
}

- (id)zoneName
{
  return @"SecureUserDataZone";
}

- (id)configuredRecordFromAttributes
{
  v6.receiver = self;
  v6.super_class = (Class)BCMutableSecureUserDatum;
  v3 = [(BCMutableCloudData *)&v6 configuredRecordFromAttributes];
  id v4 = [(BCMutableSecureUserDatum *)self value];
  [v3 setObject:v4 forKey:@"value"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BCMutableSecureUserDatum)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BCMutableSecureUserDatum;
  id v5 = [(BCMutableCloudData *)&v12 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(BCMutableCloudData *)v5 localRecordID];
    key = v6->_key;
    v6->_key = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v6->_value;
    v6->_value = (NSString *)v9;
  }
  return v6;
}

- (void)setValue:(id)a3
{
}

@end