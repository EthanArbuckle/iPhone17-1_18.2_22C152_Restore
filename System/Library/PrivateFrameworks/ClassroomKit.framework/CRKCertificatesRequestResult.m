@interface CRKCertificatesRequestResult
+ (BOOL)supportsSecureCoding;
+ (id)invalidResult;
+ (id)resultWithCertificateDataCollection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResult:(id)a3;
- (BOOL)isValidRequest;
- (CRKCertificatesRequestResult)initWithCoder:(id)a3;
- (CRKCertificatesRequestResult)initWithIsValidRequest:(BOOL)a3 certificateDataCollection:(id)a4;
- (NSArray)certificateDataCollection;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CRKCertificatesRequestResult

- (CRKCertificatesRequestResult)initWithIsValidRequest:(BOOL)a3 certificateDataCollection:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKCertificatesRequestResult;
  v7 = [(CRKCertificatesRequestResult *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_validRequest = a3;
    uint64_t v9 = [v6 copy];
    certificateDataCollection = v8->_certificateDataCollection;
    v8->_certificateDataCollection = (NSArray *)v9;
  }
  return v8;
}

+ (id)invalidResult
{
  v2 = (void *)[objc_alloc((Class)a1) initWithIsValidRequest:0 certificateDataCollection:0];

  return v2;
}

+ (id)resultWithCertificateDataCollection:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIsValidRequest:1 certificateDataCollection:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKCertificatesRequestResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKCertificatesRequestResult;
  v5 = [(CRKCertificatesRequestResult *)&v13 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validRequest"];
    v5->_validRequest = [v6 BOOLValue];

    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"certificateDataCollection"];
    certificateDataCollection = v5->_certificateDataCollection;
    v5->_certificateDataCollection = (NSArray *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithBool:", -[CRKCertificatesRequestResult isValidRequest](self, "isValidRequest"));
  [v5 encodeObject:v6 forKey:@"validRequest"];

  id v7 = [(CRKCertificatesRequestResult *)self certificateDataCollection];
  [v5 encodeObject:v7 forKey:@"certificateDataCollection"];
}

- (unint64_t)hash
{
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKCertificatesRequestResult isValidRequest](self, "isValidRequest"));
  uint64_t v4 = [v3 hash];
  id v5 = [(CRKCertificatesRequestResult *)self certificateDataCollection];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CRKCertificatesRequestResult *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"-[CRKCertificatesRequestResult isEqual:]"];
      v11 = (objc_class *)objc_opt_class();
      objc_super v12 = NSStringFromClass(v11);
      objc_super v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      [v9 handleFailureInFunction:v10, @"CRKCertificatesRequestResult.m", 78, @"expected %@, got %@", v12, v14 file lineNumber description];
    }
    BOOL v7 = [(CRKCertificatesRequestResult *)self isEqualToResult:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToResult:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isValidRequest];
  if (v5 == [(CRKCertificatesRequestResult *)self isValidRequest])
  {
    BOOL v7 = [v4 certificateDataCollection];
    uint64_t v8 = [(CRKCertificatesRequestResult *)self certificateDataCollection];
    char v6 = [v7 isEqualToArray:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(CRKCertificatesRequestResult *)self isValidRequest];
  char v6 = [(CRKCertificatesRequestResult *)self certificateDataCollection];
  BOOL v7 = (void *)[v4 initWithIsValidRequest:v5 certificateDataCollection:v6];

  return v7;
}

- (BOOL)isValidRequest
{
  return self->_validRequest;
}

- (NSArray)certificateDataCollection
{
  return self->_certificateDataCollection;
}

- (void).cxx_destruct
{
}

@end