@interface AKAttestationData
+ (BOOL)supportsSecureCoding;
- (AKAttestationData)initWithCoder:(id)a3;
- (AKAttestationData)initWithDictionary:(id)a3;
- (NSDictionary)attestationHeaders;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAttestationHeaders:(id)a3;
@end

@implementation AKAttestationData

- (void).cxx_destruct
{
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAttestationData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAttestationData;
  v5 = [(AKAttestationData *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attestationHeaders = v5->_attestationHeaders;
    v5->_attestationHeaders = (NSDictionary *)v6;
  }
  return v5;
}

- (AKAttestationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKAttestationData;
  v5 = [(AKAttestationData *)&v14 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_attestationHeaders"];
    attestationHeaders = v5->_attestationHeaders;
    v5->_attestationHeaders = (NSDictionary *)v11;
  }
  return v5;
}

- (NSDictionary)attestationHeaders
{
  return self->_attestationHeaders;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSDictionary *)self->_attestationHeaders copy];
  uint64_t v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NSDictionary *)self->_attestationHeaders allKeys];
  uint64_t v7 = [v3 stringWithFormat:@"%@ %@", v5, v6];

  return v7;
}

- (void)setAttestationHeaders:(id)a3
{
}

@end