@interface TKTokenID
+ (BOOL)supportsSecureCoding;
+ (id)encodedCertificateID:(id)a3;
+ (id)encodedKeyID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)classID;
- (NSString)instanceID;
- (NSString)stringRepresentation;
- (TKTokenID)initWithClassID:(id)a3 instanceID:(id)a4;
- (TKTokenID)initWithCoder:(id)a3;
- (TKTokenID)initWithTokenID:(id)a3;
- (id)decodedCertificateID:(id)a3 error:(id *)a4;
- (id)decodedKeyID:(id)a3 error:(id *)a4;
- (id)decodedObjectID:(id)a3 isCertificate:(BOOL *)a4 error:(id *)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TKTokenID

- (TKTokenID)initWithTokenID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)TKTokenID;
    v5 = [(TKTokenID *)&v10 init];
    if (v5)
    {
      if ([v4 hasSuffix:@":"])
      {
        objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = (NSString *)v4;
      }
      stringRepresentation = v5->_stringRepresentation;
      v5->_stringRepresentation = v6;
    }
    self = v5;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)classID
{
  v2 = [(TKTokenID *)self stringRepresentation];
  v3 = [v2 componentsSeparatedByString:@":"];
  id v4 = [v3 firstObject];

  return (NSString *)v4;
}

- (NSString)stringRepresentation
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenID)initWithClassID:(id)a3 instanceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = [NSString stringWithFormat:@"%@:%@", v6, v7];
  }
  else
  {
    id v8 = v6;
  }
  v9 = v8;
  objc_super v10 = [(TKTokenID *)self initWithTokenID:v8];

  return v10;
}

- (TKTokenID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenID"];

  id v6 = [(TKTokenID *)self initWithTokenID:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TKTokenID *)self stringRepresentation];
  [v4 encodeObject:v5 forKey:@"tokenID"];
}

- (unint64_t)hash
{
  v2 = [(TKTokenID *)self stringRepresentation];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(TKTokenID *)self stringRepresentation];
    id v6 = [v4 stringRepresentation];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)instanceID
{
  v2 = [(TKTokenID *)self stringRepresentation];
  unint64_t v3 = [v2 componentsSeparatedByString:@":"];

  if ((unint64_t)[v3 count] < 2)
  {
    id v4 = &stru_1F19EDBB0;
  }
  else
  {
    id v4 = [v3 objectAtIndexedSubscript:1];
  }

  return (NSString *)v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<tkid:%@>", self->_stringRepresentation];
}

+ (id)encodedKeyID:(id)a3
{
  id v3 = a3;
  id v4 = [[TKBERTLVRecord alloc] initWithPropertyList:v3];
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"failed to serialize objectID '%@'", v3 format];
  }
  id v5 = [(TKTLVRecord *)v4 data];

  return v5;
}

+ (id)encodedCertificateID:(id)a3
{
  id v3 = [a1 encodedKeyID:a3];
  id v4 = [[TKBERTLVRecord alloc] initWithTag:0x5FC8C6BFE112 value:v3];
  id v5 = [(TKTLVRecord *)v4 data];

  return v5;
}

- (id)decodedObjectID:(id)a3 isCertificate:(BOOL *)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = +[TKTLVRecord recordFromData:v8];
  if ([v9 tag] == 0x5FC8C6BFE112)
  {
    objc_super v10 = [v9 value];
    v11 = [(TKTokenID *)self decodedObjectID:v10 isCertificate:a4 error:a5];

    if (!v11) {
      goto LABEL_13;
    }
    BOOL v12 = 1;
  }
  else
  {
    uint64_t v13 = [v9 propertyList];
    if (v13)
    {
      v11 = (void *)v13;
      BOOL v12 = 0;
    }
    else
    {
      v14 = [(TKTokenID *)self stringRepresentation];
      int v15 = [v14 isEqualToString:*MEMORY[0x1E4F3B8A8]];

      if (v15)
      {
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:0];
        v11 = [v16 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
      }
      else
      {
        v11 = 0;
      }
      BOOL v12 = 0;
      if (a5 && !v11)
      {
        v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v21 = *MEMORY[0x1E4F28568];
        v22[0] = @"corrupted objectID detected";
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
        *a5 = [v17 errorWithDomain:@"CryptoTokenKit" code:-3 userInfo:v18];

        BOOL v12 = 0;
        v11 = 0;
      }
    }
  }
  *a4 = v12;
LABEL_13:
  id v19 = v11;

  return v19;
}

- (id)decodedKeyID:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  char v9 = 0;
  id v5 = [(TKTokenID *)self decodedObjectID:a3 isCertificate:&v9 error:a4];
  if (v5 && v9)
  {

    if (a4)
    {
      id v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F28228];
      v11[0] = @"Expecting key, but provided certificate objectID";
      char v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      *a4 = [v6 errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:v7];
    }
    id v5 = 0;
  }

  return v5;
}

- (id)decodedCertificateID:(id)a3 error:(id *)a4
{
  char v6 = 0;
  id v4 = [(TKTokenID *)self decodedObjectID:a3 isCertificate:&v6 error:a4];

  return v4;
}

- (void).cxx_destruct
{
}

@end