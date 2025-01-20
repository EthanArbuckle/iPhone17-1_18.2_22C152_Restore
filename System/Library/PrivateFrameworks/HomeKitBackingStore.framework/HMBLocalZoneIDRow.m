@interface HMBLocalZoneIDRow
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMBLocalZoneIDRow)initWithCoder:(id)a3;
- (HMBLocalZoneIDRow)initWithName:(id)a3 token:(id)a4;
- (NSData)token;
- (NSString)name;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)labels;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMBLocalZoneIDRow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSData)token
{
  return self->_token;
}

- (NSString)name
{
  return self->_name;
}

- (HMBLocalZoneIDRow)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBLZR.name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMBLZR.token"];

  v7 = [(HMBLocalZoneIDRow *)self initWithName:v5 token:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMBLocalZoneIDRow *)self name];
  [v4 encodeObject:v5 forKey:@"HMBLZR.name"];

  id v6 = [(HMBLocalZoneIDRow *)self token];
  [v4 encodeObject:v6 forKey:@"HMBLZR.token"];
}

- (unint64_t)hash
{
  v2 = [(HMBLocalZoneIDRow *)self token];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [v4 conformsToProtocol:&unk_1F2C528F8];
  char v6 = 0;
  if (v4 && v5)
  {
    v7 = [v4 token];
    v8 = [(HMBLocalZoneIDRow *)self token];
    char v6 = [v7 isEqual:v8];
  }
  return v6;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBLocalZoneIDRow *)self name];
  int v5 = (void *)[v3 initWithName:@"Name" value:v4];
  v8[0] = v5;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int v5 = [(HMBLocalZoneIDRow *)self name];
  char v6 = [(HMBLocalZoneIDRow *)self token];
  v7 = (void *)[v4 initWithName:v5 token:v6];

  return v7;
}

- (id)labels
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMBLocalZoneIDRow *)self name];
  v8[0] = v3;
  id v4 = [(HMBLocalZoneIDRow *)self token];
  int v5 = [v4 base64EncodedStringWithOptions:0];
  v8[1] = v5;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

- (HMBLocalZoneIDRow)initWithName:(id)a3 token:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBLocalZoneIDRow;
  v9 = [(HMBLocalZoneIDRow *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_token, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  return @"HMBLocalZoneIDRow";
}

@end