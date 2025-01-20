@interface BMSafariBrowsingAssistantServerRequestContextStarted
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantServerRequestContextStarted)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSafariBrowsingAssistantServerRequestContextStarted)initWithRequestType:(int)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)requestType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantServerRequestContextStarted

- (int)requestType
{
  return self->_requestType;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(BMSafariBrowsingAssistantServerRequestContextStarted *)self requestType];
    int v7 = [v5 requestType];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)jsonDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariBrowsingAssistantServerRequestContextStarted requestType](self, "requestType"));
  int v6 = @"requestType";
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (BMSafariBrowsingAssistantServerRequestContextStarted)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v6 = [a3 objectForKeyedSubscript:@"requestType"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_9:
    self = -[BMSafariBrowsingAssistantServerRequestContextStarted initWithRequestType:](self, "initWithRequestType:", [a4 intValue]);
    BOOL v8 = self;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = v6;
LABEL_8:
    a4 = v7;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [NSNumber numberWithInt:BMSafariBrowsingAssistantRequestTypeFromString(v6)];
    goto LABEL_8;
  }
  if (a4)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F502C8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"requestType"];
    v15[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a4 = (id)[v10 initWithDomain:v11 code:2 userInfo:v13];

    a4 = 0;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantServerRequestContextStarted *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMSafariBrowsingAssistantServerRequestContextStarted;
  id v5 = [(BMEventBase *)&v27 init];
  if (!v5) {
    goto LABEL_38;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  BOOL v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      if ((v12 >> 3) == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        while (1)
        {
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
          *(void *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_30;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_32;
          }
        }
        v4[*v8] = 1;
LABEL_30:
        if (v4[*v8]) {
          LODWORD(v21) = 0;
        }
LABEL_32:
        if (v21 >= 3) {
          LODWORD(v21) = 0;
        }
        v5->_requestType = v21;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_37;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_37:
  }
    v25 = 0;
  else {
LABEL_38:
  }
    v25 = v5;

  return v25;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMSafariBrowsingAssistantRequestTypeAsString([(BMSafariBrowsingAssistantServerRequestContextStarted *)self requestType]);
  id v5 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistantServerRequestContextStarted with requestType: %@", v4];

  return (NSString *)v5;
}

- (BMSafariBrowsingAssistantServerRequestContextStarted)initWithRequestType:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BMSafariBrowsingAssistantServerRequestContextStarted;
  id v4 = [(BMEventBase *)&v6 init];
  if (v4)
  {
    v4->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v4->_requestType = a3;
  }
  return v4;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"requestType" number:1 type:4 subMessageClass:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF56A0;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"requestType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    BOOL v8 = [[BMSafariBrowsingAssistantServerRequestContextStarted alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end