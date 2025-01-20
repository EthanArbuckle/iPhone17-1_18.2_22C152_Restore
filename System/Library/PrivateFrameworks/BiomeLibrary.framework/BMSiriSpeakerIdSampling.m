@interface BMSiriSpeakerIdSampling
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriSpeakerIdSampling)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriSpeakerIdSampling)initWithTimestamp:(id)a3 onDeviceSampleIdentifiers:(id)a4 enrollmentIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)onDeviceSampleIdentifiers;
- (NSDate)timestamp;
- (NSString)description;
- (NSString)enrollmentIdentifier;
- (id)_onDeviceSampleIdentifiersJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriSpeakerIdSampling

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"onDeviceSampleIdentifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_88265];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"enrollmentIdentifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentIdentifier, 0);

  objc_storeStrong((id *)&self->_onDeviceSampleIdentifiers, 0);
}

- (NSString)enrollmentIdentifier
{
  return self->_enrollmentIdentifier;
}

- (NSArray)onDeviceSampleIdentifiers
{
  return self->_onDeviceSampleIdentifiers;
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
    v6 = [(BMSiriSpeakerIdSampling *)self timestamp];
    uint64_t v7 = [v5 timestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriSpeakerIdSampling *)self timestamp];
      v10 = [v5 timestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMSiriSpeakerIdSampling *)self onDeviceSampleIdentifiers];
    uint64_t v14 = [v5 onDeviceSampleIdentifiers];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriSpeakerIdSampling *)self onDeviceSampleIdentifiers];
      v17 = [v5 onDeviceSampleIdentifiers];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMSiriSpeakerIdSampling *)self enrollmentIdentifier];
    v20 = [v5 enrollmentIdentifier];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMSiriSpeakerIdSampling *)self enrollmentIdentifier];
      v22 = [v5 enrollmentIdentifier];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (NSDate)timestamp
{
  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriSpeakerIdSampling *)self timestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMSiriSpeakerIdSampling *)self timestamp];
    [v5 timeIntervalSince1970];
    v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }

  uint64_t v7 = [(BMSiriSpeakerIdSampling *)self _onDeviceSampleIdentifiersJSONArray];
  v8 = [(BMSiriSpeakerIdSampling *)self enrollmentIdentifier];
  v14[0] = @"timestamp";
  v9 = v6;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v9;
  v14[1] = @"onDeviceSampleIdentifiers";
  v10 = v7;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  v14[2] = @"enrollmentIdentifier";
  int v11 = v8;
  if (!v8)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  if (v8)
  {
    if (v7) {
      goto LABEL_12;
    }
LABEL_17:

    if (v6) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v7) {
    goto LABEL_17;
  }
LABEL_12:
  if (v6) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v12;
}

- (id)_onDeviceSampleIdentifiersJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMSiriSpeakerIdSampling *)self onDeviceSampleIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSiriSpeakerIdSampling)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"timestamp"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v20 = v6;
      id v21 = [v19 alloc];
      [v20 doubleValue];
      double v23 = v22;

      id v7 = (id)[v21 initWithTimeIntervalSince1970:v23];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v33 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        id v7 = [v33 dateFromString:v6];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v43 = *MEMORY[0x1E4F502C8];
            uint64_t v63 = *MEMORY[0x1E4F28568];
            id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
            v64[0] = v8;
            long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
            id v44 = (id)[v42 initWithDomain:v43 code:2 userInfo:v11];
            id v7 = 0;
            v32 = 0;
            *a4 = v44;
            goto LABEL_40;
          }
          id v7 = 0;
          v32 = 0;
          goto LABEL_42;
        }
        id v7 = v6;
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [v5 objectForKeyedSubscript:@"onDeviceSampleIdentifiers"];
  v9 = [MEMORY[0x1E4F1CA98] null];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v45 = v7;
    v46 = v5;
    v47 = self;

    id v8 = 0;
  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v61 = *MEMORY[0x1E4F28568];
          long long v11 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"onDeviceSampleIdentifiers"];
          v62 = v11;
          id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          id v35 = (id)[v48 initWithDomain:v34 code:2 userInfo:v18];
          v32 = 0;
          *a4 = v35;
          goto LABEL_39;
        }
        v32 = 0;
        goto LABEL_41;
      }
    }
    id v45 = v7;
    v46 = v5;
    v47 = self;
  }
  long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v8 = v8;
  uint64_t v12 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (!v12) {
    goto LABEL_18;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v51;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v51 != v14) {
        objc_enumerationMutation(v8);
      }
      uint64_t v16 = *(void *)(*((void *)&v50 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v24 = a4;
        if (a4)
        {
          id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v26 = *MEMORY[0x1E4F502C8];
          uint64_t v58 = *MEMORY[0x1E4F28568];
          v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"onDeviceSampleIdentifiers"];
          v59 = v17;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          v28 = v25;
          uint64_t v29 = v26;
LABEL_27:
          id *v24 = (id)[v28 initWithDomain:v29 code:2 userInfo:v27];

          v32 = 0;
          id v18 = v8;
          id v5 = v46;
          self = v47;
          goto LABEL_28;
        }
LABEL_29:
        v32 = 0;
        id v18 = v8;
        id v5 = v46;
        self = v47;
        id v7 = v45;
        goto LABEL_39;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v56 = *MEMORY[0x1E4F28568];
          v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"onDeviceSampleIdentifiers"];
          v57 = v17;
          v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          v28 = v30;
          uint64_t v29 = v31;
          v24 = a4;
          goto LABEL_27;
        }
        goto LABEL_29;
      }
      [v11 addObject:v16];
    }
    uint64_t v13 = [v8 countByEnumeratingWithState:&v50 objects:v60 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_18:

  id v5 = v46;
  v17 = [v46 objectForKeyedSubscript:@"enrollmentIdentifier"];
  if (!v17)
  {
    id v18 = 0;
    self = v47;
    goto LABEL_37;
  }
  objc_opt_class();
  self = v47;
  if (objc_opt_isKindOfClass())
  {
    id v18 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v17;
LABEL_37:
    id v7 = v45;
    self = [(BMSiriSpeakerIdSampling *)self initWithTimestamp:v45 onDeviceSampleIdentifiers:v11 enrollmentIdentifier:v18];
    v32 = self;
  }
  else
  {
    if (a4)
    {
      id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v38 = *MEMORY[0x1E4F502C8];
      uint64_t v54 = *MEMORY[0x1E4F28568];
      v39 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"enrollmentIdentifier"];
      v55 = v39;
      v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
      uint64_t v41 = v38;
      self = v47;
      *a4 = (id)[v37 initWithDomain:v41 code:2 userInfo:v40];
    }
    id v18 = 0;
    v32 = 0;
LABEL_28:
    id v7 = v45;
  }

LABEL_39:
LABEL_40:

LABEL_41:
LABEL_42:

  return v32;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriSpeakerIdSampling *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = self->_onDeviceSampleIdentifiers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_enrollmentIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)BMSiriSpeakerIdSampling;
  id v5 = [(BMEventBase *)&v34 init];
  if (!v5) {
    goto LABEL_35;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        if (v12++ >= 9)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      unint64_t v21 = v13 >> 3;
      if ((v13 >> 3) == 3)
      {
        uint64_t v25 = PBReaderReadString();
        enrollmentIdentifier = v5->_enrollmentIdentifier;
        v5->_enrollmentIdentifier = (NSString *)v25;
      }
      else if (v21 == 2)
      {
        uint64_t v27 = PBReaderReadString();
        if (!v27) {
          goto LABEL_37;
        }
        v28 = (void *)v27;
        [v6 addObject:v27];
      }
      else if (v21 == 1)
      {
        v5->_hasRaw_timestamp = 1;
        uint64_t v22 = *v7;
        unint64_t v23 = *(void *)&v4[v22];
        if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v8])
        {
          double v24 = *(double *)(*(void *)&v4[*v10] + v23);
          *(void *)&v4[v22] = v23 + 8;
        }
        else
        {
          v4[*v9] = 1;
          double v24 = 0.0;
        }
        v5->_raw_timestamp = v24;
      }
      else if (!PBReaderSkipValueWithTag())
      {
LABEL_37:

        goto LABEL_34;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v29 = [v6 copy];
  onDeviceSampleIdentifiers = v5->_onDeviceSampleIdentifiers;
  v5->_onDeviceSampleIdentifiers = (NSArray *)v29;

  int v31 = v4[*v9];
  if (v31) {
LABEL_34:
  }
    v32 = 0;
  else {
LABEL_35:
  }
    v32 = v5;

  return v32;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriSpeakerIdSampling *)self timestamp];
  id v5 = [(BMSiriSpeakerIdSampling *)self onDeviceSampleIdentifiers];
  uint64_t v6 = [(BMSiriSpeakerIdSampling *)self enrollmentIdentifier];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMSiriSpeakerIdSampling with timestamp: %@, onDeviceSampleIdentifiers: %@, enrollmentIdentifier: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSiriSpeakerIdSampling)initWithTimestamp:(id)a3 onDeviceSampleIdentifiers:(id)a4 enrollmentIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriSpeakerIdSampling;
  char v11 = [(BMEventBase *)&v14 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasRaw_timestamp = 1;
      [v8 timeIntervalSince1970];
    }
    else
    {
      v11->_hasRaw_timestamp = 0;
      double v12 = -1.0;
    }
    v11->_raw_timestamp = v12;
    objc_storeStrong((id *)&v11->_onDeviceSampleIdentifiers, a4);
    objc_storeStrong((id *)&v11->_enrollmentIdentifier, a5);
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:1 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"onDeviceSampleIdentifiers", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"enrollmentIdentifier" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7650;
}

id __34__BMSiriSpeakerIdSampling_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _onDeviceSampleIdentifiersJSONArray];
  id v4 = BMConvertObjectToJSONString();

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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriSpeakerIdSampling alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[8] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end