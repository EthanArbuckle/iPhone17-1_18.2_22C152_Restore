@interface BMHealthMedicationsAddedMed
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMHealthMedicationsAddedMed)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMHealthMedicationsAddedMed)initWithMedicationName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)medicationName;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMHealthMedicationsAddedMed

- (void).cxx_destruct
{
}

- (NSString)medicationName
{
  return self->_medicationName;
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
    v6 = [(BMHealthMedicationsAddedMed *)self medicationName];
    v7 = [v5 medicationName];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMHealthMedicationsAddedMed *)self medicationName];
      v9 = [v5 medicationName];
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
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMHealthMedicationsAddedMed *)self medicationName];
  id v4 = (void *)v3;
  v8 = @"medicationName";
  if (v3)
  {
    v9 = @"medication_name";
    v10[0] = v3;
    id v5 = (void *)v3;
  }
  else
  {
    v2 = [MEMORY[0x1E4F1CA98] null];
    v9 = @"medication_name";
    v10[0] = v2;
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v8 count:2];
  if (!v4)
  {
  }

  return v6;
}

- (BMHealthMedicationsAddedMed)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"medicationName"];
  if (!v7
    && ([v6 objectForKeyedSubscript:@"medication_name"],
        (id v7 = (id)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_7:
    self = [(BMHealthMedicationsAddedMed *)self initWithMedicationName:a4];
    v8 = self;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v7;
    a4 = (id *)v7;
    goto LABEL_7;
  }
  if (a4)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v11 = *MEMORY[0x1E4F502C8];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"medicationName"];
    v15[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    *a4 = (id)[v10 initWithDomain:v11 code:2 userInfo:v13];

    v8 = 0;
    a4 = 0;
  }
  else
  {
    v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMHealthMedicationsAddedMed *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  if (self->_medicationName) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BMHealthMedicationsAddedMed;
  id v5 = [(BMEventBase *)&v23 init];
  if (!v5) {
    goto LABEL_25;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
        if (v11++ >= 9)
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
        uint64_t v19 = PBReaderReadString();
        medicationName = v5->_medicationName;
        v5->_medicationName = (NSString *)v19;
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
    v21 = 0;
  else {
LABEL_25:
  }
    v21 = v5;

  return v21;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMHealthMedicationsAddedMed *)self medicationName];
  id v5 = (void *)[v3 initWithFormat:@"BMHealthMedicationsAddedMed with medicationName: %@", v4];

  return (NSString *)v5;
}

- (BMHealthMedicationsAddedMed)initWithMedicationName:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMHealthMedicationsAddedMed;
  id v6 = [(BMEventBase *)&v8 init];
  if (v6)
  {
    v6->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v6->_medicationName, a3);
  }

  return v6;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"medicationName" number:1 type:13 subMessageClass:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5E80;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"medicationName" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"medication_name" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    objc_super v8 = [[BMHealthMedicationsAddedMed alloc] initByReadFrom:v7];
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