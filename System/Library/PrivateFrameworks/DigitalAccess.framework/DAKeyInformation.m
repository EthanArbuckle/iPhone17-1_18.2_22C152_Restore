@interface DAKeyInformation
+ (BOOL)supportsSecureCoding;
+ (id)alishaKeyWithPublicKeyIdentifier:(id)a3 alishaKeyInformation:(id)a4;
- (DAAlishaKeyInformation)alishaKeyInformation;
- (DAHomeKeyInformation)homeKeyInformation;
- (DAHydraKeyInformation)hydraKeyInformation;
- (DAKeyInformation)initWithCoder:(id)a3;
- (DAKeyInformation)initWithEndpoint:(id)a3;
- (NSString)publicKeyIdentifier;
- (id)description;
- (int64_t)keyType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAKeyInformation

- (DAKeyInformation)initWithEndpoint:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  v21.receiver = self;
  v21.super_class = (Class)DAKeyInformation;
  self = [(DAKeyInformation *)&v21 init];
  if (!self)
  {
LABEL_5:
    uint64_t v10 = [v4 endPointType];
    KmlLogFunc2(OS_LOG_TYPE_ERROR, (uint64_t)"-[DAKeyInformation initWithEndpoint:]", 75, @"Invalid EP type %d", v11, v12, v13, v14, v10);
LABEL_6:
    v15 = 0;
    goto LABEL_14;
  }
  v5 = [v4 publicKeyIdentifier];
  kmlUtilHexStringFromData(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  publicKeyIdentifier = self->_publicKeyIdentifier;
  self->_publicKeyIdentifier = v6;

  switch([v4 endPointType])
  {
    case 1:
      self->_keyType = 1;
      v8 = +[DAAlishaKeyInformation withEndpoint:v4];
      alishaKeyInformation = self->_alishaKeyInformation;
      self->_alishaKeyInformation = v8;
      break;
    case 2:
      int64_t v16 = 2;
      goto LABEL_12;
    case 3:
      int64_t v17 = 3;
      goto LABEL_10;
    case 4:
      int64_t v17 = 5;
LABEL_10:
      self->_keyType = v17;
      v18 = +[DAHomeKeyInformation withEndpoint:v4];
      alishaKeyInformation = self->_homeKeyInformation;
      self->_homeKeyInformation = v18;
      break;
    case 5:
      int64_t v16 = 4;
LABEL_12:
      self->_keyType = v16;
      v19 = +[DAHydraKeyInformation withEndpoint:v4];
      alishaKeyInformation = self->_hydraKeyInformation;
      self->_hydraKeyInformation = v19;
      break;
    default:
      goto LABEL_5;
  }

  self = self;
  v15 = self;
LABEL_14:

  return v15;
}

+ (id)alishaKeyWithPublicKeyIdentifier:(id)a3 alishaKeyInformation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  v8 = (void *)v7[2];
  v7[1] = 1;
  v7[2] = v5;
  id v9 = v5;

  uint64_t v10 = (void *)v7[3];
  v7[3] = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t keyType = self->_keyType;
  id v5 = a3;
  [v5 encodeInteger:keyType forKey:@"keyType"];
  [v5 encodeObject:self->_publicKeyIdentifier forKey:@"publicKeyIdentifier"];
  [v5 encodeObject:self->_alishaKeyInformation forKey:@"alishaKeyInformation"];
  [v5 encodeObject:self->_hydraKeyInformation forKey:@"hydraKeyInformation"];
  [v5 encodeObject:self->_homeKeyInformation forKey:@"homeKeyInformation"];
}

- (DAKeyInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAKeyInformation;
  id v5 = [(DAKeyInformation *)&v15 init];
  if (v5)
  {
    v5->_int64_t keyType = [v4 decodeIntegerForKey:@"keyType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyIdentifier"];
    publicKeyIdentifier = v5->_publicKeyIdentifier;
    v5->_publicKeyIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alishaKeyInformation"];
    alishaKeyInformation = v5->_alishaKeyInformation;
    v5->_alishaKeyInformation = (DAAlishaKeyInformation *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hydraKeyInformation"];
    hydraKeyInformation = v5->_hydraKeyInformation;
    v5->_hydraKeyInformation = (DAHydraKeyInformation *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeKeyInformation"];
    homeKeyInformation = v5->_homeKeyInformation;
    v5->_homeKeyInformation = (DAHomeKeyInformation *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  [v3 appendFormat:@"    KeyId      : %@\n", self->_publicKeyIdentifier];
  objc_msgSend(v3, "appendFormat:", @"    KeyType    : %d\n", self->_keyType);
  unint64_t v4 = self->_keyType - 1;
  if (v4 <= 4) {
    [v3 appendFormat:@"%@", *(Class *)((char *)&self->super.isa + qword_214D8FD60[v4])];
  }

  return v3;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (NSString)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (DAAlishaKeyInformation)alishaKeyInformation
{
  return self->_alishaKeyInformation;
}

- (DAHydraKeyInformation)hydraKeyInformation
{
  return self->_hydraKeyInformation;
}

- (DAHomeKeyInformation)homeKeyInformation
{
  return self->_homeKeyInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKeyInformation, 0);
  objc_storeStrong((id *)&self->_hydraKeyInformation, 0);
  objc_storeStrong((id *)&self->_alishaKeyInformation, 0);

  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
}

@end