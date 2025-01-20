@interface BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData)initWithTimeReference:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)timeReference;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData

- (void).cxx_destruct
{
}

- (NSString)timeReference
{
  return self->_timeReference;
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
    v6 = [(BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData *)self timeReference];
    v7 = [v5 timeReference];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData *)self timeReference];
      v9 = [v5 timeReference];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)jsonDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData *)self timeReference];
  v6 = @"timeReference";
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

- (BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v6 = [a3 objectForKeyedSubscript:@"timeReference"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_4:
    self = [(BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData *)self initWithTimeReference:a4];
    v7 = self;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a4 = v6;
    goto LABEL_4;
  }
  if (a4)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F502C8];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"timeReference"];
    v14[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = (id)[v9 initWithDomain:v10 code:2 userInfo:v12];

    v7 = 0;
    a4 = 0;
  }
  else
  {
    v7 = 0;
  }
LABEL_5:

  return v7;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  if (self->_timeReference) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData;
  id v5 = [(BMEventBase *)&v24 init];
  if (!v5) {
    goto LABEL_25;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        if (v11++ >= 9)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      if ((v12 >> 3) == 1)
      {
        uint64_t v20 = PBReaderReadString();
        timeReference = v5->_timeReference;
        v5->_timeReference = (NSString *)v20;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_24;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_24:
  }
    v22 = 0;
  else {
LABEL_25:
  }
    v22 = v5;

  return v22;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData *)self timeReference];
  id v5 = (void *)[v3 initWithFormat:@"BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData with timeReference: %@", v4];

  return (NSString *)v5;
}

- (BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData)initWithTimeReference:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData;
  v6 = [(BMEventBase *)&v8 init];
  if (v6)
  {
    v6->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v6->_timeReference, a3);
  }

  return v6;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeReference" number:1 type:13 subMessageClass:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6D50;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeReference" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    objc_super v8 = [[BMPersonalizedSensingMomentsContextMomentsContextTimeMetaData alloc] initByReadFrom:v7];
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