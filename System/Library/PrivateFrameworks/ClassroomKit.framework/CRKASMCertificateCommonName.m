@interface CRKASMCertificateCommonName
+ (id)commonNameWithString:(id)a3;
- (CRKASMCertificateCommonName)initWithPrefix:(id)a3 userIdentifier:(id)a4;
- (CRKASMCertificateCommonName)initWithPrefix:(id)a3 userIdentifier:(id)a4 UUID:(id)a5;
- (NSString)prefix;
- (NSString)stringValue;
- (NSString)userIdentifier;
- (NSUUID)UUID;
@end

@implementation CRKASMCertificateCommonName

+ (id)commonNameWithString:(id)a3
{
  if (a3)
  {
    v4 = [a3 componentsSeparatedByString:@" "];
    if ((unint64_t)[v4 count] >= 4)
    {
      v6 = NSString;
      v7 = [v4 objectAtIndexedSubscript:0];
      v8 = [v4 objectAtIndexedSubscript:1];
      v9 = [v6 stringWithFormat:@"%@ %@", v7, v8];

      v5 = 0;
      if ([v9 hasSuffix:@": ASM"])
      {
        v10 = objc_msgSend(v4, "subarrayWithRange:", 2, objc_msgSend(v4, "count") - 3);
        v11 = [v10 componentsJoinedByString:@" "];
        if ([v11 length])
        {
          v12 = [v4 lastObject];
          v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v12];
          if (v13) {
            v5 = (void *)[objc_alloc((Class)a1) initWithPrefix:v9 userIdentifier:v11 UUID:v13];
          }
          else {
            v5 = 0;
          }
        }
        else
        {
          v5 = 0;
        }
      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CRKASMCertificateCommonName)initWithPrefix:(id)a3 userIdentifier:(id)a4
{
  v6 = (void *)MEMORY[0x263F08C38];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 UUID];
  v10 = [(CRKASMCertificateCommonName *)self initWithPrefix:v8 userIdentifier:v7 UUID:v9];

  return v10;
}

- (CRKASMCertificateCommonName)initWithPrefix:(id)a3 userIdentifier:(id)a4 UUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMCertificateCommonName;
  v11 = [(CRKASMCertificateCommonName *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    prefix = v11->_prefix;
    v11->_prefix = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    userIdentifier = v11->_userIdentifier;
    v11->_userIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_UUID, a5);
  }

  return v11;
}

- (NSString)stringValue
{
  v3 = NSString;
  v4 = [(CRKASMCertificateCommonName *)self prefix];
  v5 = [(CRKASMCertificateCommonName *)self userIdentifier];
  v6 = [(CRKASMCertificateCommonName *)self UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"%@ %@ %@", v4, v5, v7];

  return (NSString *)v8;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_prefix, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end