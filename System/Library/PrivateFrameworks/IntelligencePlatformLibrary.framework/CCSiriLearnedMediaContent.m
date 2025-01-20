@interface CCSiriLearnedMediaContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCSiriLearnedMediaContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCSiriLearnedMediaContent)initWithUserPhrasedSongName:(id)a3 userPhrasedArtistName:(id)a4 userPhrasedAlbumName:(id)a5 userPhrasedEntityName:(id)a6 userPhrasedVersion:(id)a7 suggestedAdamId:(id)a8 error:(id *)a9;
- (NSString)suggestedAdamId;
- (NSString)userPhrasedAlbumName;
- (NSString)userPhrasedArtistName;
- (NSString)userPhrasedEntityName;
- (NSString)userPhrasedSongName;
- (NSString)userPhrasedVersion;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCSiriLearnedMediaContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAdamId, 0);
  objc_storeStrong((id *)&self->_userPhrasedVersion, 0);
  objc_storeStrong((id *)&self->_userPhrasedEntityName, 0);
  objc_storeStrong((id *)&self->_userPhrasedAlbumName, 0);
  objc_storeStrong((id *)&self->_userPhrasedArtistName, 0);
  objc_storeStrong((id *)&self->_userPhrasedSongName, 0);
}

- (CCSiriLearnedMediaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"userPhrasedSongName"];
    v10 = [v6 objectForKeyedSubscript:@"userPhrasedArtistName"];
    v11 = [v6 objectForKeyedSubscript:@"userPhrasedAlbumName"];
    v12 = [v6 objectForKeyedSubscript:@"userPhrasedEntityName"];
    v13 = [v6 objectForKeyedSubscript:@"userPhrasedVersion"];
    v14 = [v6 objectForKeyedSubscript:@"suggestedAdamId"];
    v15 = [[CCSiriLearnedMediaContent alloc] initWithUserPhrasedSongName:v9 userPhrasedArtistName:v10 userPhrasedAlbumName:v11 userPhrasedEntityName:v12 userPhrasedVersion:v13 suggestedAdamId:v14 error:a4];
  }
  else
  {
    CCSetError();
    v15 = 0;
  }

  return v15;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_userPhrasedSongName)
  {
    v4 = [(CCSiriLearnedMediaContent *)self userPhrasedSongName];
    [v3 setObject:v4 forKeyedSubscript:@"userPhrasedSongName"];
  }
  if (self->_userPhrasedArtistName)
  {
    v5 = [(CCSiriLearnedMediaContent *)self userPhrasedArtistName];
    [v3 setObject:v5 forKeyedSubscript:@"userPhrasedArtistName"];
  }
  if (self->_userPhrasedAlbumName)
  {
    id v6 = [(CCSiriLearnedMediaContent *)self userPhrasedAlbumName];
    [v3 setObject:v6 forKeyedSubscript:@"userPhrasedAlbumName"];
  }
  if (self->_userPhrasedEntityName)
  {
    v7 = [(CCSiriLearnedMediaContent *)self userPhrasedEntityName];
    [v3 setObject:v7 forKeyedSubscript:@"userPhrasedEntityName"];
  }
  if (self->_userPhrasedVersion)
  {
    id v8 = [(CCSiriLearnedMediaContent *)self userPhrasedVersion];
    [v3 setObject:v8 forKeyedSubscript:@"userPhrasedVersion"];
  }
  if (self->_suggestedAdamId)
  {
    v9 = [(CCSiriLearnedMediaContent *)self suggestedAdamId];
    [v3 setObject:v9 forKeyedSubscript:@"suggestedAdamId"];
  }
  v10 = (void *)[v3 copy];

  return v10;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v11 = (void (**)(id, void *))a3;
  if (self->_userPhrasedSongName)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:62159 stringValue:self->_userPhrasedSongName];
    v11[2](v11, v5);
  }
  if (self->_userPhrasedArtistName)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:62160 stringValue:self->_userPhrasedArtistName];
    v11[2](v11, v6);
  }
  if (self->_userPhrasedAlbumName)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:62161 stringValue:self->_userPhrasedAlbumName];
    v11[2](v11, v7);
  }
  if (self->_userPhrasedEntityName)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:62162 stringValue:self->_userPhrasedEntityName];
    v11[2](v11, v8);
  }
  if (self->_userPhrasedVersion)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:62163 stringValue:self->_userPhrasedVersion];
    v11[2](v11, v9);
  }
  if (self->_suggestedAdamId)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:62164 stringValue:self->_suggestedAdamId];
    v11[2](v11, v10);
  }
}

- (NSString)suggestedAdamId
{
  v2 = (void *)[(NSString *)self->_suggestedAdamId copy];
  return (NSString *)v2;
}

- (NSString)userPhrasedVersion
{
  v2 = (void *)[(NSString *)self->_userPhrasedVersion copy];
  return (NSString *)v2;
}

- (NSString)userPhrasedEntityName
{
  v2 = (void *)[(NSString *)self->_userPhrasedEntityName copy];
  return (NSString *)v2;
}

- (NSString)userPhrasedAlbumName
{
  v2 = (void *)[(NSString *)self->_userPhrasedAlbumName copy];
  return (NSString *)v2;
}

- (NSString)userPhrasedArtistName
{
  v2 = (void *)[(NSString *)self->_userPhrasedArtistName copy];
  return (NSString *)v2;
}

- (NSString)userPhrasedSongName
{
  v2 = (void *)[(NSString *)self->_userPhrasedSongName copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  v9 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] < *(void *)&v6[*MEMORY[0x263F317C0]])
  {
    v10 = 0;
    v11 = (int *)MEMORY[0x263F317B0];
    id v28 = v5;
LABEL_3:
    if (*(void *)&v6[*v9]) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (v12)
    {
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v7;
        unint64_t v17 = *(void *)&v6[v16];
        if (v17 == -1 || v17 >= *(void *)&v6[*v8]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v6[*v11] + v17);
        *(void *)&v6[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0) {
          goto LABEL_17;
        }
        v13 += 7;
        if (v14++ >= 9)
        {
          unint64_t v15 = 0;
          if (*(void *)&v6[*v9]) {
            goto LABEL_35;
          }
LABEL_18:
          switch((v15 >> 3))
          {
            case 1u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 16;
              goto LABEL_27;
            case 2u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 24;
              goto LABEL_27;
            case 3u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 32;
              goto LABEL_27;
            case 4u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 40;
              goto LABEL_27;
            case 5u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 48;
              goto LABEL_27;
            case 6u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 56;
LABEL_27:
              v22 = *(Class *)((char *)&self->super.super.isa + v21);
              *(Class *)((char *)&self->super.super.isa + v21) = v20;
              goto LABEL_28;
            default:
              if (CCPBReaderSkipValueWithTag())
              {
                v10 = 0;
                id v5 = v28;
              }
              else
              {
                v23 = (objc_class *)objc_opt_class();
                v22 = NSStringFromClass(v23);
                v10 = CCSkipFieldErrorForMessage();
                id v5 = v28;
LABEL_28:
              }
              if (*(void *)&v6[*v7] >= *(void *)&v6[*v8]) {
                goto LABEL_32;
              }
              goto LABEL_3;
          }
        }
      }
      *(void *)&v6[*v9] = 1;
LABEL_17:
      if (!*(void *)&v6[*v9]) {
        goto LABEL_18;
      }
LABEL_35:
      v24 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v24);
      v25 = CCInvalidBufferErrorForMessage();
      CCSetError();

      goto LABEL_36;
    }
LABEL_32:
    if (v10)
    {
      CCSetError();
LABEL_36:

      BOOL v26 = 0;
      goto LABEL_38;
    }
  }
  if (*(void *)&v6[*v9]) {
    goto LABEL_35;
  }
  BOOL v26 = 1;
LABEL_38:

  return v26;
}

- (CCSiriLearnedMediaContent)initWithUserPhrasedSongName:(id)a3 userPhrasedArtistName:(id)a4 userPhrasedAlbumName:(id)a5 userPhrasedEntityName:(id)a6 userPhrasedVersion:(id)a7 suggestedAdamId:(id)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v35 = a8;
  v19 = objc_opt_new();
  if (!v14)
  {
    v34 = a9;
    id v21 = 0;
    if (!v15) {
      goto LABEL_4;
    }
LABEL_11:
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v22 = v21;

    if (!IsInstanceOfExpectedClass)
    {
LABEL_22:
      CCSetError();
      v32 = 0;
      id v21 = v22;
      goto LABEL_24;
    }
    CCPBDataWriterWriteStringField();
    if (v16) {
      goto LABEL_5;
    }
LABEL_13:
    id v21 = v22;
    if (!v17) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  int v20 = CCValidateIsInstanceOfExpectedClass();
  id v21 = 0;
  if (!v20) {
    goto LABEL_23;
  }
  v34 = a9;
  CCPBDataWriterWriteStringField();
  if (v15) {
    goto LABEL_11;
  }
LABEL_4:
  id v22 = v21;
  if (!v16) {
    goto LABEL_13;
  }
LABEL_5:
  objc_opt_class();
  int v23 = CCValidateIsInstanceOfExpectedClass();
  id v21 = v22;

  if (!v23)
  {
LABEL_23:
    CCSetError();
    v32 = 0;
    goto LABEL_24;
  }
  CCPBDataWriterWriteStringField();
  if (!v17)
  {
LABEL_7:
    id v22 = v21;
    if (v18) {
      goto LABEL_8;
    }
LABEL_16:
    id v21 = v22;
    goto LABEL_17;
  }
LABEL_14:
  objc_opt_class();
  int v26 = CCValidateIsInstanceOfExpectedClass();
  id v22 = v21;

  if (!v26) {
    goto LABEL_22;
  }
  CCPBDataWriterWriteStringField();
  if (!v18) {
    goto LABEL_16;
  }
LABEL_8:
  objc_opt_class();
  int v24 = CCValidateIsInstanceOfExpectedClass();
  id v21 = v22;

  if (!v24) {
    goto LABEL_23;
  }
  CCPBDataWriterWriteStringField();
LABEL_17:
  v27 = v35;
  if (v35)
  {
    objc_opt_class();
    int v28 = CCValidateIsInstanceOfExpectedClass();
    id v29 = v21;

    if (!v28)
    {
      CCSetError();
      v32 = 0;
      id v21 = v29;
      goto LABEL_25;
    }
    CCPBDataWriterWriteStringField();
    id v21 = v29;
  }
  v30 = [v19 immutableData];
  v31 = [(CCItemMessage *)self initWithData:v30 error:v34];

  self = v31;
  v32 = v31;
LABEL_24:
  v27 = v35;
LABEL_25:

  return v32;
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
  if ((unsigned __int16)(a3 + 3378) > 6u) {
    return 0;
  }
  else {
    return off_26539CB68[(unsigned __int16)(a3 + 3378)];
  }
}

+ (unsigned)itemType
{
  return -3378;
}

@end