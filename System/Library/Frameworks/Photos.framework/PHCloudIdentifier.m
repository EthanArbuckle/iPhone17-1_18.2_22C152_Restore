@interface PHCloudIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)_notFoundIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)archivalStringValue;
- (NSString)fingerPrint;
- (NSString)identifierCode;
- (NSString)localCloudIdentifier;
- (PHCloudIdentifier)initWithArchivalStringValue:(id)a3;
- (PHCloudIdentifier)initWithCoder:(id)a3;
- (PHCloudIdentifier)initWithLocalCloudIdentifier:(id)a3 identifierCode:(id)a4 fingerPrint:(id)a5;
- (id)initAsNotFoundIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHCloudIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_identifierCode, 0);

  objc_storeStrong((id *)&self->_localCloudIdentifier, 0);
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (NSString)identifierCode
{
  return self->_identifierCode;
}

- (NSString)localCloudIdentifier
{
  return self->_localCloudIdentifier;
}

- (PHCloudIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];

  v6 = [(PHCloudIdentifier *)self initWithStringValue:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PHCloudIdentifier *)self stringValue];
  [v4 encodeObject:v5 forKey:@"stringValue"];
}

- (unint64_t)hash
{
  v2 = [(PHCloudIdentifier *)self stringValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHCloudIdentifier *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(PHCloudIdentifier *)self identifierCode];
      v7 = [(PHCloudIdentifier *)v5 identifierCode];
      if ([v6 isEqualToString:v7])
      {
        v8 = [(PHCloudIdentifier *)self localCloudIdentifier];
        v9 = [(PHCloudIdentifier *)v5 localCloudIdentifier];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (NSString)archivalStringValue
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 addObject:self->_localCloudIdentifier];
  [v3 addObject:self->_identifierCode];
  [v3 addObject:self->_fingerPrint];
  id v4 = [v3 componentsJoinedByString:@":"];

  return (NSString *)v4;
}

- (id)initAsNotFoundIdentifier
{
  v8.receiver = self;
  v8.super_class = (Class)PHCloudIdentifier;
  v2 = [(PHCloudIdentifier *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    localCloudIdentifier = v2->_localCloudIdentifier;
    v2->_localCloudIdentifier = (NSString *)&stru_1EEAC1950;

    identifierCode = v3->_identifierCode;
    v3->_identifierCode = (NSString *)&stru_1EEAC1950;

    fingerPrint = v3->_fingerPrint;
    v3->_fingerPrint = (NSString *)&stru_1EEAC1950;
  }
  return v3;
}

- (PHCloudIdentifier)initWithLocalCloudIdentifier:(id)a3 identifierCode:(id)a4 fingerPrint:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHCloudIdentifier;
  v12 = [(PHCloudIdentifier *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localCloudIdentifier, a3);
    objc_storeStrong((id *)&v13->_identifierCode, a4);
    objc_storeStrong((id *)&v13->_fingerPrint, a5);
    if (![(NSString *)v13->_identifierCode length]
      || ![(NSString *)v13->_localCloudIdentifier length])
    {

      v13 = 0;
    }
  }

  return v13;
}

- (PHCloudIdentifier)initWithArchivalStringValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@":"];
  if ((unint64_t)[v5 count] > 1)
  {
    v7 = [v5 objectAtIndexedSubscript:0];
    objc_super v8 = [v5 objectAtIndexedSubscript:1];
    if ((unint64_t)[v5 count] < 3)
    {
      id v9 = &stru_1EEAC1950;
    }
    else
    {
      id v9 = [v5 objectAtIndexedSubscript:2];
    }
    v6 = [(PHCloudIdentifier *)self initWithLocalCloudIdentifier:v7 identifierCode:v8 fingerPrint:v9];
  }
  else
  {
    if ((dyld_program_sdk_at_least() & 1) == 0)
    {
      id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"stringValue cannot be initialized as a PHCloudIdentifier" userInfo:0];
      objc_exception_throw(v11);
    }
    v6 = 0;
    v7 = self;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_notFoundIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PHCloudIdentifier__notFoundIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_notFoundIdentifier_onceToken != -1) {
    dispatch_once(&_notFoundIdentifier_onceToken, block);
  }
  v2 = (void *)_notFoundIdentifier_sNotFoundCloudIdentifier;

  return v2;
}

void __40__PHCloudIdentifier__notFoundIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initAsNotFoundIdentifier];
  v2 = (void *)_notFoundIdentifier_sNotFoundCloudIdentifier;
  _notFoundIdentifier_sNotFoundCloudIdentifier = v1;
}

@end