@interface CCSiriCompanionContextAudioContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasNowPlayingCount;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCSiriCompanionContextAudioContent)initWithAppBundleId:(id)a3 mediaCategories:(id)a4 subscriptionStatus:(unsigned int)a5 localizedAppName:(id)a6 nowPlayingCount:(id)a7 error:(id *)a8;
- (CCSiriCompanionContextAudioContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum)mediaCategories;
- (NSString)appBundleId;
- (NSString)localizedAppName;
- (id)jsonDictionary;
- (int)nowPlayingCount;
- (unsigned)subscriptionStatus;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasNowPlayingCount:(BOOL)a3;
@end

@implementation CCSiriCompanionContextAudioContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_mediaCategories, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (void)setHasNowPlayingCount:(BOOL)a3
{
  self->_hasNowPlayingCount = a3;
}

- (BOOL)hasNowPlayingCount
{
  return self->_hasNowPlayingCount;
}

- (int)nowPlayingCount
{
  return self->_nowPlayingCount;
}

- (unsigned)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum)mediaCategories
{
  return self->_mediaCategories;
}

- (CCSiriCompanionContextAudioContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  uint64_t v38 = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"appBundleId"];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"mediaCategories"];
    if (v10)
    {
      v11 = (void *)v10;
      v32 = v9;
      objc_opt_class();
      id v37 = v8;
      char v12 = CCValidateIsInstanceOfExpectedClass();
      id v13 = v8;

      if ((v12 & 1) == 0)
      {
        CCSetError();
        v23 = 0;
        v14 = v11;
        id v8 = v13;
        v9 = v32;
LABEL_21:

        goto LABEL_22;
      }
      v31 = self;
      v14 = objc_opt_new();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v15 = v11;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v34;
        id v30 = v6;
        while (2)
        {
          uint64_t v19 = 0;
          v20 = v13;
          do
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v15);
            }
            v21 = *(void **)(*((void *)&v33 + 1) + 8 * v19);
            objc_opt_class();
            int v22 = CCValidateIsInstanceOfExpectedClass();
            id v13 = v20;

            if (!v22)
            {
              CCSetError();

              v23 = 0;
              v14 = v15;
              id v8 = v13;
              self = v31;
              v9 = v32;
              id v6 = v30;
              goto LABEL_21;
            }
            objc_msgSend(v14, "appendEnumValue:", objc_msgSend(v21, "unsignedIntValue"));
            ++v19;
            v20 = v13;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
          id v6 = v30;
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v8 = v13;
      self = v31;
      v9 = v32;
    }
    else
    {
      v14 = 0;
    }
    v24 = [v6 objectForKeyedSubscript:@"subscriptionStatus"];
    v25 = v24;
    if (v24) {
      uint64_t v26 = [v24 unsignedIntegerValue];
    }
    else {
      uint64_t v26 = 0;
    }
    v27 = [v6 objectForKeyedSubscript:@"localizedAppName"];
    v28 = [v6 objectForKeyedSubscript:@"nowPlayingCount"];
    v23 = [[CCSiriCompanionContextAudioContent alloc] initWithAppBundleId:v9 mediaCategories:v14 subscriptionStatus:v26 localizedAppName:v27 nowPlayingCount:v28 error:a4];

    goto LABEL_21;
  }
  CCSetError();
  v23 = 0;
LABEL_22:

  return v23;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_appBundleId)
  {
    v4 = [(CCSiriCompanionContextAudioContent *)self appBundleId];
    [v3 setObject:v4 forKeyedSubscript:@"appBundleId"];
  }
  if (self->_mediaCategories)
  {
    v5 = objc_opt_new();
    id v6 = [(CCSiriCompanionContextAudioContent *)self mediaCategories];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__CCSiriCompanionContextAudioContent_jsonDictionary__block_invoke;
    v13[3] = &unk_26539CC90;
    id v14 = v5;
    id v7 = v5;
    [v6 enumerateEnumValuesWithBlock:v13];

    [v3 setObject:v7 forKeyedSubscript:@"mediaCategories"];
  }
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCSiriCompanionContextAudioContent subscriptionStatus](self, "subscriptionStatus"));
  [v3 setObject:v8 forKeyedSubscript:@"subscriptionStatus"];

  if (self->_localizedAppName)
  {
    v9 = [(CCSiriCompanionContextAudioContent *)self localizedAppName];
    [v3 setObject:v9 forKeyedSubscript:@"localizedAppName"];
  }
  if (self->_hasNowPlayingCount)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[CCSiriCompanionContextAudioContent nowPlayingCount](self, "nowPlayingCount"));
    [v3 setObject:v10 forKeyedSubscript:@"nowPlayingCount"];
  }
  v11 = (void *)[v3 copy];

  return v11;
}

void __52__CCSiriCompanionContextAudioContent_jsonDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  uint64_t v10 = (void (**)(id, void *))a3;
  if (self->_appBundleId)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:56511 stringValue:self->_appBundleId];
    v10[2](v10, v5);
  }
  if (self->_mediaCategories)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:56512 repeatedEnumValue:self->_mediaCategories];
    v10[2](v10, v6);
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:56513 enumValue:self->_subscriptionStatus];
  v10[2](v10, v7);

  if (self->_localizedAppName)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:56514 stringValue:self->_localizedAppName];
    v10[2](v10, v8);
  }
  if (self->_hasNowPlayingCount)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:56515 int32Value:self->_nowPlayingCount];
    v10[2](v10, v9);
  }
}

- (NSString)localizedAppName
{
  v2 = (void *)[(NSString *)self->_localizedAppName copy];
  return (NSString *)v2;
}

- (NSString)appBundleId
{
  v2 = (void *)[(NSString *)self->_appBundleId copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  id v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]])
  {
    v9 = 0;
LABEL_54:
    uint64_t v10 = 0;
  }
  else
  {
    v9 = 0;
    uint64_t v10 = 0;
    v11 = (int *)MEMORY[0x263F317B8];
    char v12 = (int *)MEMORY[0x263F317B0];
    do
    {
      if (*(void *)&v6[*v11]) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = v10 == 0;
      }
      if (!v13) {
        break;
      }
      char v14 = 0;
      unsigned int v15 = 0;
      unint64_t v16 = 0;
      while (1)
      {
        uint64_t v17 = *v7;
        unint64_t v18 = *(void *)&v6[v17];
        if (v18 == -1 || v18 >= *(void *)&v6[*v8]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v6[*v12] + v18);
        *(void *)&v6[v17] = v18 + 1;
        v16 |= (unint64_t)(v19 & 0x7F) << v14;
        if ((v19 & 0x80) == 0) {
          goto LABEL_17;
        }
        v14 += 7;
        BOOL v20 = v15++ >= 9;
        if (v20)
        {
          unint64_t v16 = 0;
          if (*(void *)&v6[*v11]) {
            goto LABEL_54;
          }
          goto LABEL_18;
        }
      }
      *(void *)&v6[*v11] = 1;
LABEL_17:
      if (*(void *)&v6[*v11]) {
        goto LABEL_54;
      }
LABEL_18:
      switch((v16 >> 3))
      {
        case 1u:
          CCPBReaderReadStringNoCopy();
          v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = 32;
          goto LABEL_33;
        case 2u:
          if (!v9) {
            v9 = objc_opt_new();
          }
          CCPBReaderAppendRepeatedEnumFieldValues();
          goto LABEL_34;
        case 3u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (2)
          {
            uint64_t v26 = *v7;
            unint64_t v27 = *(void *)&v6[v26];
            if (v27 == -1 || v27 >= *(void *)&v6[*v8])
            {
              *(void *)&v6[*v11] = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)&v6[*v12] + v27);
              *(void *)&v6[v26] = v27 + 1;
              v25 |= (unint64_t)(v28 & 0x7F) << v23;
              if (v28 < 0)
              {
                v23 += 7;
                BOOL v20 = v24++ >= 9;
                if (v20)
                {
                  LODWORD(v25) = 0;
                  goto LABEL_45;
                }
                continue;
              }
            }
            break;
          }
          if (*(void *)&v6[*v11]) {
            LODWORD(v25) = 0;
          }
LABEL_45:
          uint64_t v10 = 0;
          self->_subscriptionStatus = v25;
          continue;
        case 4u:
          CCPBReaderReadStringNoCopy();
          v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v22 = 48;
LABEL_33:
          v29 = *(Class *)((char *)&self->super.super.isa + v22);
          *(Class *)((char *)&self->super.super.isa + v22) = v21;

LABEL_34:
          uint64_t v10 = 0;
          continue;
        case 5u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          break;
        default:
          if (CCPBReaderSkipValueWithTag())
          {
            uint64_t v10 = 0;
          }
          else
          {
            long long v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            v47 = self;
            id v37 = v9;
            v39 = id v38 = v5;
            uint64_t v10 = CCSkipFieldErrorForMessage();

            id v5 = v38;
            v9 = v37;
            self = v47;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v7;
        unint64_t v34 = *(void *)&v6[v33];
        if (v34 == -1 || v34 >= *(void *)&v6[*v8]) {
          break;
        }
        char v35 = *(unsigned char *)(*(void *)&v6[*v12] + v34);
        *(void *)&v6[v33] = v34 + 1;
        v32 |= (unint64_t)(v35 & 0x7F) << v30;
        if ((v35 & 0x80) == 0) {
          goto LABEL_47;
        }
        v30 += 7;
        BOOL v20 = v31++ >= 9;
        if (v20)
        {
          LODWORD(v32) = 0;
          goto LABEL_49;
        }
      }
      *(void *)&v6[*v11] = 1;
LABEL_47:
      if (*(void *)&v6[*v11]) {
        LODWORD(v32) = 0;
      }
LABEL_49:
      uint64_t v10 = 0;
      self->_nowPlayingCount = v32;
      self->_hasNowPlayingCount = 1;
    }
    while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  }
  uint64_t v40 = (CCSiriCompanionContextAudioContentMediaCategoriesRepeatedEnum *)objc_msgSend(v9, "copy", v47);
  mediaCategories = self->_mediaCategories;
  self->_mediaCategories = v40;

  if (v10)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v6[*MEMORY[0x263F317B8]])
    {
      BOOL v45 = 1;
      goto LABEL_60;
    }
    v42 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v42);
    v44 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v45 = 0;
LABEL_60:

  return v45;
}

- (CCSiriCompanionContextAudioContent)initWithAppBundleId:(id)a3 mediaCategories:(id)a4 subscriptionStatus:(unsigned int)a5 localizedAppName:(id)a6 nowPlayingCount:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  unint64_t v18 = objc_opt_new();
  if (!v14)
  {
    id v20 = 0;
LABEL_5:
    char v30 = self;
    if (v15)
    {
      objc_opt_class();
      int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      id v22 = v20;

      if (!IsInstanceOfExpectedClass)
      {
        CCSetError();
        uint64_t v25 = 0;
        id v20 = v22;
LABEL_23:
        self = v30;
        goto LABEL_24;
      }
      CCPBDataWriterWriteRepeatedUInt32Field();
      if (!a5)
      {
LABEL_8:
        id v20 = v22;
        if (v16)
        {
LABEL_9:
          objc_opt_class();
          int v23 = CCValidateIsInstanceOfExpectedClass();
          id v24 = v20;

          if (!v23)
          {
            CCSetError();
            uint64_t v25 = 0;
            id v20 = v24;
            goto LABEL_23;
          }
          CCPBDataWriterWriteStringField();
          if (!v17)
          {
LABEL_11:
            id v20 = v24;
LABEL_19:
            char v28 = objc_msgSend(v18, "immutableData", v30);
            uint64_t v25 = (CCSiriCompanionContextAudioContent *)(id)[v31 initWithData:v28 error:a8];

            self = v25;
            goto LABEL_24;
          }
          goto LABEL_17;
        }
LABEL_16:
        id v24 = v20;
        if (!v17) {
          goto LABEL_11;
        }
LABEL_17:
        objc_opt_class();
        int v27 = CCValidateIsInstanceOfExpectedClass();
        id v20 = v24;

        if (v27)
        {
          [v17 intValue];
          CCPBDataWriterWriteInt32Field();
          goto LABEL_19;
        }
        goto LABEL_21;
      }
    }
    else
    {
      id v22 = v20;
      if (!a5) {
        goto LABEL_8;
      }
    }
    int v26 = CCValidateEnumField();
    id v20 = v22;

    if (!v26)
    {
LABEL_21:
      CCSetError();
      uint64_t v25 = 0;
      goto LABEL_23;
    }
    CCPBDataWriterWriteUint32Field();
    if (v16) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
  objc_opt_class();
  int v19 = CCValidateIsInstanceOfExpectedClass();
  id v20 = 0;
  if (v19)
  {
    CCPBDataWriterWriteStringField();
    goto LABEL_5;
  }
  CCSetError();
  uint64_t v25 = 0;
LABEL_24:

  return v25;
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 9026) > 5u) {
    return 0;
  }
  else {
    return off_26539CD28[(unsigned __int16)(a3 + 9026)];
  }
}

+ (unsigned)itemType
{
  return -9026;
}

@end