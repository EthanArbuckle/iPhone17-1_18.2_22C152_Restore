@interface HMBLocalZoneIDUnshared
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMBLocalZoneIDUnshared)initWithName:(id)a3;
- (NSData)token;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)labels;
- (unint64_t)hash;
@end

@implementation HMBLocalZoneIDUnshared

- (void).cxx_destruct
{
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  v2 = [(HMBLocalZoneIDUnshared *)self token];
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
    v8 = [(HMBLocalZoneIDUnshared *)self token];
    char v6 = [v7 isEqual:v8];
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int v5 = [(HMBLocalZoneIDUnshared *)self name];
  char v6 = (void *)[v4 initWithName:v5];

  return v6;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(HMBLocalZoneIDUnshared *)self name];
  id v4 = [v2 stringWithFormat:@"<HMBLocalZoneIDUnshared: %@>", v3];

  return v4;
}

- (NSData)token
{
  v2 = [(HMBLocalZoneIDUnshared *)self name];
  unint64_t v3 = [v2 dataUsingEncoding:10];

  return (NSData *)v3;
}

- (id)labels
{
  v8[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(HMBLocalZoneIDUnshared *)self name];
  v8[0] = v3;
  id v4 = [(HMBLocalZoneIDUnshared *)self token];
  int v5 = [v4 base64EncodedStringWithOptions:0];
  v8[1] = v5;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

- (HMBLocalZoneIDUnshared)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMBLocalZoneIDUnshared;
  char v6 = [(HMBLocalZoneIDUnshared *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

+ (id)shortDescription
{
  return @"HMBLocalZoneIDUnshared";
}

@end