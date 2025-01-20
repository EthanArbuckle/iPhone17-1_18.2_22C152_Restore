@interface ASDIAPInfoResponse
+ (BOOL)supportsSecureCoding;
- (ASDIAPInfoResponse)initWithCoder:(id)a3;
- (ASDIAPInfoResponse)initWithError:(id)a3;
- (ASDIAPInfoResponse)initWithIAPs:(id)a3;
- (NSDictionary)iaps;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDIAPInfoResponse

- (ASDIAPInfoResponse)initWithIAPs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDIAPInfoResponse;
  v5 = [(ASDRequestResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    iaps = v5->_iaps;
    v5->_iaps = (NSDictionary *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)iaps
{
  return self->_iaps;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ASDIAPInfoResponse)initWithCoder:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:3];
  v7 = objc_msgSend(v4, "setWithArray:", v6, v11, v12);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"ASDIAPInfoResponseIAPsCodingKey"];

  objc_super v9 = [(ASDIAPInfoResponse *)self initWithIAPs:v8];
  return v9;
}

- (ASDIAPInfoResponse)initWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASDIAPInfoResponse;
  v3 = [(ASDRequestResponse *)&v7 initWithError:a3];
  id v4 = v3;
  if (v3)
  {
    iaps = v3->_iaps;
    v3->_iaps = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v4;
}

@end