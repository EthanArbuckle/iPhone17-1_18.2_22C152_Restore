@interface BMSiriAssistantSuggestionFeaturesSuggestionDetails
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)initWithSuggestionId:(id)a3 targetOwner:(id)a4 sourceOwner:(id)a5 classificationCentroid:(id)a6 channel:(id)a7 confidence:(id)a8;
- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)initWithSuggestionId:(id)a3 targetOwner:(id)a4 sourceOwner:(id)a5 classificationCentroid:(id)a6 channel:(id)a7 confidence:(id)a8 deliveryVehicle:(id)a9;
- (BOOL)hasConfidence;
- (BOOL)isEqual:(id)a3;
- (NSString)channel;
- (NSString)classificationCentroid;
- (NSString)deliveryVehicle;
- (NSString)description;
- (NSString)sourceOwner;
- (NSString)suggestionId;
- (NSString)targetOwner;
- (double)confidence;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriAssistantSuggestionFeaturesSuggestionDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryVehicle, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_classificationCentroid, 0);
  objc_storeStrong((id *)&self->_sourceOwner, 0);
  objc_storeStrong((id *)&self->_targetOwner, 0);

  objc_storeStrong((id *)&self->_suggestionId, 0);
}

- (NSString)deliveryVehicle
{
  return self->_deliveryVehicle;
}

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)channel
{
  return self->_channel;
}

- (NSString)classificationCentroid
{
  return self->_classificationCentroid;
}

- (NSString)sourceOwner
{
  return self->_sourceOwner;
}

- (NSString)targetOwner
{
  return self->_targetOwner;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
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
    v6 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self suggestionId];
    uint64_t v7 = [v5 suggestionId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self suggestionId];
      v10 = [v5 suggestionId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_30;
      }
    }
    v13 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self targetOwner];
    uint64_t v14 = [v5 targetOwner];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self targetOwner];
      v17 = [v5 targetOwner];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_30;
      }
    }
    v19 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self sourceOwner];
    uint64_t v20 = [v5 sourceOwner];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self sourceOwner];
      v23 = [v5 sourceOwner];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_30;
      }
    }
    v25 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self classificationCentroid];
    uint64_t v26 = [v5 classificationCentroid];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self classificationCentroid];
      v29 = [v5 classificationCentroid];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_30;
      }
    }
    v31 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self channel];
    uint64_t v32 = [v5 channel];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self channel];
      v35 = [v5 channel];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_30;
      }
    }
    if (![(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self hasConfidence]
      && ![v5 hasConfidence]
      || [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self hasConfidence]
      && [v5 hasConfidence]
      && ([(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self confidence],
          double v38 = v37,
          [v5 confidence],
          v38 == v39))
    {
      v40 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self deliveryVehicle];
      v41 = [v5 deliveryVehicle];
      if (v40 == v41)
      {
        char v12 = 1;
      }
      else
      {
        v42 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self deliveryVehicle];
        v43 = [v5 deliveryVehicle];
        char v12 = [v42 isEqual:v43];
      }
      goto LABEL_31;
    }
LABEL_30:
    char v12 = 0;
LABEL_31:

    goto LABEL_32;
  }
  char v12 = 0;
LABEL_32:

  return v12;
}

- (id)jsonDictionary
{
  v26[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self suggestionId];
  uint64_t v4 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self targetOwner];
  id v5 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self sourceOwner];
  int v24 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self classificationCentroid];
  v6 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self channel];
  if (![(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self hasConfidence]
    || ([(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self confidence], fabs(v7) == INFINITY))
  {
    v9 = 0;
  }
  else
  {
    [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self confidence];
    v8 = NSNumber;
    [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self confidence];
    v9 = objc_msgSend(v8, "numberWithDouble:");
  }
  v10 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self deliveryVehicle];
  v25[0] = @"suggestionId";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v11;
  v26[0] = v11;
  v25[1] = @"targetOwner";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v12;
  v26[1] = v12;
  v25[2] = @"sourceOwner";
  v13 = v5;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v3;
  v26[2] = v13;
  v25[3] = @"classificationCentroid";
  uint64_t v14 = v24;
  if (!v24)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v4;
  v26[3] = v14;
  v25[4] = @"channel";
  v15 = v6;
  if (!v6)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[4] = v15;
  v25[5] = @"confidence";
  v16 = v9;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[5] = v16;
  v25[6] = @"deliveryVehicle";
  v17 = v10;
  if (!v10)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[6] = v17;
  int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];
  if (v10)
  {
    if (v9) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_21;
    }
  }

LABEL_21:
  if (!v6) {

  }
  if (!v24) {
  if (v5)
  }
  {
    if (v22) {
      goto LABEL_27;
    }
LABEL_34:

    if (v23) {
      goto LABEL_28;
    }
    goto LABEL_35;
  }

  if (!v22) {
    goto LABEL_34;
  }
LABEL_27:
  if (v23) {
    goto LABEL_28;
  }
LABEL_35:

LABEL_28:

  return v18;
}

- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"suggestionId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"targetOwner"];
    v55 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          uint64_t v20 = 0;
          goto LABEL_29;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v68 = *MEMORY[0x1E4F28568];
        id v57 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"targetOwner"];
        id v69 = v57;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        uint64_t v11 = v30 = a4;
        id v31 = (id)[v28 initWithDomain:v29 code:2 userInfo:v11];
        uint64_t v20 = 0;
        id v10 = 0;
        *int v30 = v31;
        goto LABEL_28;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"sourceOwner"];
    v54 = v9;
    id v56 = v10;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v55)
        {
          id v57 = 0;
          uint64_t v20 = 0;
          goto LABEL_28;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v66 = *MEMORY[0x1E4F28568];
        v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"sourceOwner"];
        v67 = v21;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        v34 = v32;
        id v10 = v56;
        id v35 = (id)[v34 initWithDomain:v33 code:2 userInfo:v12];
        uint64_t v20 = 0;
        id v57 = 0;
        id *v55 = v35;
LABEL_27:

        v9 = v54;
LABEL_28:

        goto LABEL_29;
      }
      id v57 = v11;
    }
    else
    {
      id v57 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"classificationCentroid"];
    v51 = v7;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v55)
        {
          v21 = 0;
          uint64_t v20 = 0;
          goto LABEL_27;
        }
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v64 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"classificationCentroid"];
        id v65 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        double v38 = v36;
        id v10 = v56;
        id v39 = (id)[v38 initWithDomain:v37 code:2 userInfo:v13];
        uint64_t v20 = 0;
        v21 = 0;
        id *v55 = v39;
        goto LABEL_26;
      }
      id v53 = v12;
    }
    else
    {
      id v53 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"channel"];
    id v52 = v8;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v55)
        {
          id v14 = 0;
          uint64_t v20 = 0;
          goto LABEL_25;
        }
        v16 = self;
        id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v62 = *MEMORY[0x1E4F28568];
        id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"channel"];
        id v63 = v17;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        id v42 = (id)[v40 initWithDomain:v41 code:2 userInfo:v15];
        uint64_t v20 = 0;
        id v14 = 0;
        id *v55 = v42;
LABEL_24:

        self = v16;
        id v8 = v52;
        id v10 = v56;
LABEL_25:
        v21 = v53;
LABEL_26:

        double v7 = v51;
        goto LABEL_27;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    v15 = [v6 objectForKeyedSubscript:@"confidence"];
    id v50 = v14;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      v16 = self;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v55)
        {
          id v17 = 0;
          uint64_t v20 = 0;
          goto LABEL_24;
        }
        id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v44 = *MEMORY[0x1E4F502C8];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidence"];
        id v61 = v19;
        int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v18];
        uint64_t v20 = 0;
        id v17 = 0;
        id *v55 = v45;
        goto LABEL_23;
      }
      id v17 = v15;
    }
    else
    {
      v16 = self;
      id v17 = 0;
    }
    int v18 = [v6 objectForKeyedSubscript:@"deliveryVehicle"];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v55)
        {
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v58 = *MEMORY[0x1E4F28568];
          v46 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deliveryVehicle"];
          v59 = v46;
          v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id *v55 = (id)[v49 initWithDomain:v48 code:2 userInfo:v47];
        }
        id v19 = 0;
        uint64_t v20 = 0;
        goto LABEL_23;
      }
      id v19 = v18;
    }
    else
    {
      id v19 = 0;
    }
    uint64_t v20 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)v16 initWithSuggestionId:v52 targetOwner:v56 sourceOwner:v57 classificationCentroid:v53 channel:v50 confidence:v17 deliveryVehicle:v19];
    v16 = v20;
LABEL_23:

    id v14 = v50;
    goto LABEL_24;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    uint64_t v20 = 0;
    id v8 = 0;
    goto LABEL_30;
  }
  id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v24 = *MEMORY[0x1E4F502C8];
  uint64_t v70 = *MEMORY[0x1E4F28568];
  uint64_t v25 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"suggestionId"];
  v71[0] = v25;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
  uint64_t v26 = v23;
  id v10 = (id)v25;
  id v27 = (id)[v26 initWithDomain:v24 code:2 userInfo:v9];
  uint64_t v20 = 0;
  id v8 = 0;
  *a4 = v27;
LABEL_29:

LABEL_30:
  return v20;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_suggestionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_targetOwner)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceOwner)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_classificationCentroid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasConfidence)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_deliveryVehicle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMSiriAssistantSuggestionFeaturesSuggestionDetails;
  id v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_38;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
          goto LABEL_31;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
          goto LABEL_31;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_31;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_31;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_31;
        case 6u:
          v5->_hasConfidence = 1;
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v7])
          {
            double v24 = *(double *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v24 = 0.0;
          }
          v5->_confidence = v24;
          break;
        case 7u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 72;
LABEL_31:
          uint64_t v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_37;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_37:
  }
    uint64_t v26 = 0;
  else {
LABEL_38:
  }
    uint64_t v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self suggestionId];
  id v5 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self targetOwner];
  id v6 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self sourceOwner];
  double v7 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self classificationCentroid];
  id v8 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self channel];
  v9 = NSNumber;
  [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self confidence];
  char v10 = objc_msgSend(v9, "numberWithDouble:");
  unsigned int v11 = [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self deliveryVehicle];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMSiriAssistantSuggestionFeaturesSuggestionDetails with suggestionId: %@, targetOwner: %@, sourceOwner: %@, classificationCentroid: %@, channel: %@, confidence: %@, deliveryVehicle: %@", v4, v5, v6, v7, v8, v10, v11];

  return (NSString *)v12;
}

- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)initWithSuggestionId:(id)a3 targetOwner:(id)a4 sourceOwner:(id)a5 classificationCentroid:(id)a6 channel:(id)a7 confidence:(id)a8 deliveryVehicle:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)BMSiriAssistantSuggestionFeaturesSuggestionDetails;
  int v18 = [(BMEventBase *)&v26 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_suggestionId, a3);
    objc_storeStrong((id *)&v18->_targetOwner, a4);
    objc_storeStrong((id *)&v18->_sourceOwner, a5);
    objc_storeStrong((id *)&v18->_classificationCentroid, a6);
    objc_storeStrong((id *)&v18->_channel, a7);
    if (v16)
    {
      v18->_hasConfidence = 1;
      [v16 doubleValue];
    }
    else
    {
      v18->_hasConfidence = 0;
      double v19 = -1.0;
    }
    v18->_confidence = v19;
    objc_storeStrong((id *)&v18->_deliveryVehicle, a9);
  }

  return v18;
}

+ (id)protoFields
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionId" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"targetOwner", 2, 13, 0, v2);
  v11[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sourceOwner" number:3 type:13 subMessageClass:0];
  v11[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"classificationCentroid" number:4 type:13 subMessageClass:0];
  v11[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"channel" number:5 type:13 subMessageClass:0];
  v11[4] = v6;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidence" number:6 type:0 subMessageClass:0];
  v11[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deliveryVehicle" number:7 type:13 subMessageClass:0];
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3B70;
}

+ (id)columns
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestionId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"targetOwner" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sourceOwner" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"classificationCentroid" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"channel" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidence" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deliveryVehicle" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v11[0] = v2;
  v11[1] = v3;
  v11[2] = v4;
  v11[3] = v5;
  v11[4] = v6;
  v11[5] = v7;
  v11[6] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];

  return v9;
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriAssistantSuggestionFeaturesSuggestionDetails alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMSiriAssistantSuggestionFeaturesSuggestionDetails)initWithSuggestionId:(id)a3 targetOwner:(id)a4 sourceOwner:(id)a5 classificationCentroid:(id)a6 channel:(id)a7 confidence:(id)a8
{
  return [(BMSiriAssistantSuggestionFeaturesSuggestionDetails *)self initWithSuggestionId:a3 targetOwner:a4 sourceOwner:a5 classificationCentroid:a6 channel:a7 confidence:a8 deliveryVehicle:0];
}

@end