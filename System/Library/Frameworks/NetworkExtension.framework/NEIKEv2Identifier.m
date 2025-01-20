@interface NEIKEv2Identifier
+ (id)copyTypeDescription;
+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4;
+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4 zone:(_NSZone *)a5;
- (BOOL)isEqual:(id)a3;
- (NSData)identifierData;
- (NSString)stringValue;
- (id)copyShortDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)hash;
- (unint64_t)identifierType;
- (void)setIdentifierData:(id)a3;
@end

@implementation NEIKEv2Identifier

- (void).cxx_destruct
{
}

- (void)setIdentifierData:(id)a3
{
}

- (NSData)identifierData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    unint64_t v6 = [(NEIKEv2Identifier *)self identifierType];
    if (v6 == [v5 identifierType])
    {
      v7 = [(NEIKEv2Identifier *)self identifierData];
      v8 = [v5 identifierData];
      char v9 = [v7 isEqual:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(NEIKEv2Identifier *)self identifierData];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NEIKEv2Identifier *)self identifierType] + v4;

  return v5;
}

- (NSString)stringValue
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(NEIKEv2Identifier *)self identifierData];
  unint64_t v5 = (void *)[v3 initWithData:v4 encoding:4];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_opt_class();
  unint64_t v6 = [(NEIKEv2Identifier *)self identifierType];
  v7 = [(NEIKEv2Identifier *)self identifierData];
  v8 = (void *)[v7 copy];
  char v9 = (void *)[v5 createIdentifierWithType:v6 data:v8 zone:a3];

  return v9;
}

- (id)description
{
  return [(NEIKEv2Identifier *)self descriptionWithIndent:0 options:14];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if ([(NEIKEv2Identifier *)self identifierType] != 13)
  {
    char v9 = [(NEIKEv2Identifier *)self stringValue];
    if (!v9)
    {
      v10 = [(NEIKEv2Identifier *)self identifierData];
      char v9 = [v10 base64EncodedStringWithOptions:0];
    }
    [v7 appendPrettyObject:v9 withName:@"Value" andIndent:v5 options:a4];
  }

  return v7;
}

- (unint64_t)identifierType
{
  return 0;
}

- (id)copyShortDescription
{
  id v3 = (void *)[(id)objc_opt_class() copyTypeDescription];
  if ([(NEIKEv2Identifier *)self identifierType] == 13)
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = [(NEIKEv2Identifier *)self stringValue];
    if (!v5)
    {
      unint64_t v6 = [(NEIKEv2Identifier *)self identifierData];
      uint64_t v5 = [v6 base64EncodedStringWithOptions:0];
    }
    id v4 = (id)[[NSString alloc] initWithFormat:@"%@:%@", v3, v5];
  }
  return v4;
}

+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4
{
  return (id)[a1 createIdentifierWithType:a3 data:a4 zone:0];
}

+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4 zone:(_NSZone *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 1uLL:
      if (objc_msgSend(v7, "length", 0, 0) == 4)
      {
        LOWORD(v23) = 528;
        char v9 = (char *)&v23 + 4;
        v10 = v8;
        uint64_t v11 = 4;
        goto LABEL_11;
      }
      v13 = ne_log_obj();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      goto LABEL_27;
    case 2uLL:
      v12 = +[NEIKEv2FQDNIdentifier allocWithZone:a5];
      v13 = [[NSString alloc] initWithData:v8 encoding:4];
      v14 = [(NEIKEv2FQDNIdentifier *)v12 initWithFQDN:v13];
      goto LABEL_12;
    case 3uLL:
      v20 = +[NEIKEv2UserFQDNIdentifier allocWithZone:a5];
      v13 = [[NSString alloc] initWithData:v8 encoding:4];
      v14 = [(NEIKEv2UserFQDNIdentifier *)v20 initWithUserFQDN:v13];
      goto LABEL_12;
    case 5uLL:
      LODWORD(v25) = 0;
      if (objc_msgSend(v7, "length", 0, 0, 0, v25) == 16)
      {
        LOWORD(v23) = 7708;
        char v9 = (char *)&v24;
        v10 = v8;
        uint64_t v11 = 16;
LABEL_11:
        objc_msgSend(v10, "getBytes:length:", v9, v11, v23);
        v13 = [MEMORY[0x1E4F38BC8] endpointWithAddress:&v23];
        v14 = [+[NEIKEv2AddressIdentifier allocWithZone:a5] initWithAddress:v13];
LABEL_12:
        v21 = v14;
      }
      else
      {
        v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_27:
          *(_DWORD *)buf = 67109120;
          int v27 = [v8 length];
          _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "Invalid address length %u", buf, 8u);
        }
LABEL_20:
        v21 = 0;
      }

      goto LABEL_24;
    case 9uLL:
      v19 = [+[NEIKEv2ASN1DNIdentifier allocWithZone:a5] initWithData:v7];
      goto LABEL_23;
    case 0xBuLL:
      v19 = [+[NEIKEv2KeyIDIdentifier allocWithZone:a5] initWithKeyID:v7];
      goto LABEL_23;
    case 0xDuLL:
      if ([v7 length])
      {
        v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          v16 = "NULL identifier should not contain data";
          v17 = v15;
          uint32_t v18 = 2;
LABEL_26:
          _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, v18);
        }
LABEL_16:

        v21 = 0;
      }
      else
      {
        v19 = [+[NEIKEv2NULLIdentifier allocWithZone:a5] init];
LABEL_23:
        v21 = v19;
      }
LABEL_24:

      return v21;
    default:
      v15 = ne_log_obj();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      LODWORD(v23) = 67109120;
      HIDWORD(v23) = a3;
      v16 = "Unknown identifier type %u";
      v17 = v15;
      uint32_t v18 = 8;
      goto LABEL_26;
  }
}

+ (id)copyTypeDescription
{
  return @"Invalid";
}

@end