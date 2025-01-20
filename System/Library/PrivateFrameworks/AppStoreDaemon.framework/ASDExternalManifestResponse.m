@interface ASDExternalManifestResponse
+ (BOOL)supportsSecureCoding;
- (ASDExternalManifestResponse)initWithCoder:(id)a3;
- (ASDExternalManifestResponse)initWithError:(id)a3;
- (ASDExternalManifestResponse)initWithResults:(id)a3;
- (NSArray)results;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDExternalManifestResponse

- (ASDExternalManifestResponse)initWithResults:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDExternalManifestResponse;
  v5 = [(ASDRequestResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];
    results = v5->_results;
    v5->_results = (NSArray *)v6;
  }
  return v5;
}

- (ASDExternalManifestResponse)initWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASDExternalManifestResponse;
  v3 = [(ASDRequestResponse *)&v7 initWithError:a3];
  id v4 = v3;
  if (v3)
  {
    results = v3->_results;
    v3->_results = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ASDExternalManifestResponse;
  v5 = -[ASDRequestResponse copyWithZone:](&v9, sel_copyWithZone_);
  uint64_t v6 = [(NSArray *)self->_results copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDExternalManifestResponse)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  objc_super v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"results"];

  objc_super v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"error"];

  if (v9)
  {
    v10 = [(ASDExternalManifestResponse *)self initWithError:v9];
  }
  else
  {
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = (void *)MEMORY[0x1E4F1CBF0];
    }
    v10 = [(ASDExternalManifestResponse *)self initWithResults:v11];
  }
  v12 = v10;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v5 = [(ASDRequestResponse *)self error];

  if (v5)
  {
    uint64_t v6 = [(ASDRequestResponse *)self error];
    objc_super v7 = ASDErrorWithSafeUserInfo(v6);
    +[ASDCoding securelyEncodeObject:v7 forKey:@"error" withCoder:v4 error:&v8];
  }
  else
  {
    +[ASDCoding securelyEncodeObject:self->_results forKey:@"results" withCoder:v4 error:&v8];
  }
  if (v8) {
    [v4 encodeObject:v8 forKey:@"error"];
  }
}

- (NSArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
}

@end