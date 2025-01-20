@interface BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation)initWithStreet:(id)a3 city:(id)a4 state:(id)a5 country:(id)a6 encodedLocation:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSData)encodedLocation;
- (NSString)city;
- (NSString)country;
- (NSString)description;
- (NSString)state;
- (NSString)street;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedLocation, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);

  objc_storeStrong((id *)&self->_street, 0);
}

- (NSData)encodedLocation
{
  return self->_encodedLocation;
}

- (NSString)country
{
  return self->_country;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)city
{
  return self->_city;
}

- (NSString)street
{
  return self->_street;
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
    v6 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self street];
    uint64_t v7 = [v5 street];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self street];
      v10 = [v5 street];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self city];
    uint64_t v14 = [v5 city];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self city];
      v17 = [v5 city];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    v19 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self state];
    uint64_t v20 = [v5 state];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self state];
      v23 = [v5 state];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_17;
      }
    }
    v25 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self country];
    uint64_t v26 = [v5 country];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self country];
      v29 = [v5 country];
      int v30 = [v28 isEqual:v29];

      if (!v30)
      {
LABEL_17:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v31 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self encodedLocation];
    v32 = [v5 encodedLocation];
    if (v31 == v32)
    {
      char v12 = 1;
    }
    else
    {
      v33 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self encodedLocation];
      v34 = [v5 encodedLocation];
      char v12 = [v33 isEqual:v34];
    }
    goto LABEL_23;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (id)jsonDictionary
{
  v23[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self street];
  id v4 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self city];
  id v5 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self state];
  v6 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self country];
  uint64_t v7 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self encodedLocation];
  v8 = [v7 base64EncodedStringWithOptions:0];

  int v18 = @"street";
  uint64_t v9 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v16 = v9;
  v23[0] = v9;
  v19 = @"city";
  v10 = v4;
  if (!v4)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v9, v18, v19);
  }
  v23[1] = v10;
  uint64_t v20 = @"state";
  int v11 = v5;
  if (!v5)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[2] = v11;
  v21 = @"country";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[3] = v12;
  v22 = @"encodedLocation";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v13;
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, &v18, 5, v16);
  if (v8)
  {
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v6)
    {
LABEL_13:
      if (v5) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (v5)
  {
LABEL_14:
    if (v4) {
      goto LABEL_15;
    }
LABEL_22:

    if (v3) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!v4) {
    goto LABEL_22;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v14;
}

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"street"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"city"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v37 = 0;
          uint64_t v16 = 0;
          goto LABEL_20;
        }
        v31 = a4;
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v44 = *MEMORY[0x1E4F28568];
        id v35 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"city"];
        id v45 = v35;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        uint64_t v16 = 0;
        id v37 = 0;
        id *v31 = (id)[v21 initWithDomain:v22 code:2 userInfo:v10];
        goto LABEL_19;
      }
      id v37 = v9;
    }
    else
    {
      id v37 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"state"];
    id v34 = v8;
    v36 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v35 = 0;
          uint64_t v16 = 0;
          goto LABEL_19;
        }
        v23 = a4;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v42 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"state"];
        id v43 = v13;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        uint64_t v16 = 0;
        id v35 = 0;
        id *v23 = (id)[v24 initWithDomain:v25 code:2 userInfo:v11];
LABEL_18:

        self = v36;
        id v8 = v34;
LABEL_19:

        goto LABEL_20;
      }
      id v35 = v10;
    }
    else
    {
      id v35 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"country"];
    char v12 = a4;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v13 = 0;
          uint64_t v16 = 0;
          goto LABEL_18;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v40 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"country"];
        id v41 = v15;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v27 = (id)[v32 initWithDomain:v26 code:2 userInfo:v14];
        uint64_t v16 = 0;
        id v13 = 0;
        *char v12 = v27;
        goto LABEL_17;
      }
      id v13 = v11;
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"encodedLocation"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v12)
        {
          id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v30 = *MEMORY[0x1E4F502C8];
          uint64_t v38 = *MEMORY[0x1E4F28568];
          v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"encodedLocation"];
          v39 = v28;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          *char v12 = (id)[v33 initWithDomain:v30 code:2 userInfo:v29];
        }
        id v15 = 0;
        uint64_t v16 = 0;
        goto LABEL_17;
      }
      id v15 = v14;
    }
    else
    {
      id v15 = 0;
    }
    uint64_t v16 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)v36 initWithStreet:v34 city:v37 state:v35 country:v13 encodedLocation:v15];
    v36 = v16;
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    uint64_t v16 = 0;
    id v8 = 0;
    goto LABEL_21;
  }
  int v18 = a4;
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v46 = *MEMORY[0x1E4F28568];
  id v37 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"street"];
  v47[0] = v37;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
  uint64_t v16 = 0;
  id v8 = 0;
  *int v18 = (id)[v19 initWithDomain:v20 code:2 userInfo:v9];
LABEL_20:

LABEL_21:
  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_street)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_city)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_country)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_encodedLocation)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation;
  id v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_31;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 24;
          goto LABEL_27;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_27;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_27;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_27;
        case 5u:
          uint64_t v20 = PBReaderReadData();
          uint64_t v21 = 56;
LABEL_27:
          uint64_t v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_30;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_30:
  }
    v23 = 0;
  else {
LABEL_31:
  }
    v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self street];
  id v5 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self city];
  id v6 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self state];
  uint64_t v7 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self country];
  id v8 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation *)self encodedLocation];
  uint64_t v9 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation with street: %@, city: %@, state: %@, country: %@, encodedLocation: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation)initWithStreet:(id)a3 city:(id)a4 state:(id)a5 country:(id)a6 encodedLocation:(id)a7
{
  id v19 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation;
  v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_street, a3);
    objc_storeStrong((id *)&v17->_city, a4);
    objc_storeStrong((id *)&v17->_state, a5);
    objc_storeStrong((id *)&v17->_country, a6);
    objc_storeStrong((id *)&v17->_encodedLocation, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"street" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"city", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"state" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"country" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"encodedLocation" number:5 type:14 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6348;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"street" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"city" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"state" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"country" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"encodedLocation" dataType:4 requestOnly:0 fieldNumber:5 protoDataType:14 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentLocation alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[4] = 2;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end