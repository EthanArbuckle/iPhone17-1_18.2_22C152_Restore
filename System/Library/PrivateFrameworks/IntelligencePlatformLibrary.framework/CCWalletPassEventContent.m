@interface CCWalletPassEventContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCWalletPassEventContent)initWithArtistIDs:(id)a3 awayTeamAbbreviation:(id)a4 awayTeamName:(id)a5 eventName:(id)a6 eventType:(id)a7 genre:(id)a8 homeTeamAbbreviation:(id)a9 homeTeamName:(id)a10 performerNames:(id)a11 error:(id *)a12;
- (CCWalletPassEventContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (NSArray)artistIDs;
- (NSArray)performerNames;
- (NSString)awayTeamAbbreviation;
- (NSString)awayTeamName;
- (NSString)eventName;
- (NSString)eventType;
- (NSString)genre;
- (NSString)homeTeamAbbreviation;
- (NSString)homeTeamName;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCWalletPassEventContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performerNames, 0);
  objc_storeStrong((id *)&self->_homeTeamName, 0);
  objc_storeStrong((id *)&self->_homeTeamAbbreviation, 0);
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_awayTeamName, 0);
  objc_storeStrong((id *)&self->_awayTeamAbbreviation, 0);
  objc_storeStrong((id *)&self->_artistIDs, 0);
}

- (CCWalletPassEventContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v18 = [v6 objectForKeyedSubscript:@"artistIDs"];
    v9 = [v6 objectForKeyedSubscript:@"awayTeamAbbreviation"];
    v19 = [v6 objectForKeyedSubscript:@"awayTeamName"];
    v10 = [v6 objectForKeyedSubscript:@"eventName"];
    v11 = [v6 objectForKeyedSubscript:@"eventType"];
    v12 = [v6 objectForKeyedSubscript:@"genre"];
    [v6 objectForKeyedSubscript:@"homeTeamAbbreviation"];
    v17 = v20 = self;
    v13 = [v6 objectForKeyedSubscript:@"homeTeamName"];
    v14 = [v6 objectForKeyedSubscript:@"performerNames"];
    v15 = [[CCWalletPassEventContent alloc] initWithArtistIDs:v18 awayTeamAbbreviation:v9 awayTeamName:v19 eventName:v10 eventType:v11 genre:v12 homeTeamAbbreviation:v17 homeTeamName:v13 performerNames:v14 error:a4];

    self = v20;
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
  if (self->_artistIDs)
  {
    v4 = [(CCWalletPassEventContent *)self artistIDs];
    [v3 setObject:v4 forKeyedSubscript:@"artistIDs"];
  }
  if (self->_awayTeamAbbreviation)
  {
    v5 = [(CCWalletPassEventContent *)self awayTeamAbbreviation];
    [v3 setObject:v5 forKeyedSubscript:@"awayTeamAbbreviation"];
  }
  if (self->_awayTeamName)
  {
    id v6 = [(CCWalletPassEventContent *)self awayTeamName];
    [v3 setObject:v6 forKeyedSubscript:@"awayTeamName"];
  }
  if (self->_eventName)
  {
    v7 = [(CCWalletPassEventContent *)self eventName];
    [v3 setObject:v7 forKeyedSubscript:@"eventName"];
  }
  if (self->_eventType)
  {
    id v8 = [(CCWalletPassEventContent *)self eventType];
    [v3 setObject:v8 forKeyedSubscript:@"eventType"];
  }
  if (self->_genre)
  {
    v9 = [(CCWalletPassEventContent *)self genre];
    [v3 setObject:v9 forKeyedSubscript:@"genre"];
  }
  if (self->_homeTeamAbbreviation)
  {
    v10 = [(CCWalletPassEventContent *)self homeTeamAbbreviation];
    [v3 setObject:v10 forKeyedSubscript:@"homeTeamAbbreviation"];
  }
  if (self->_homeTeamName)
  {
    v11 = [(CCWalletPassEventContent *)self homeTeamName];
    [v3 setObject:v11 forKeyedSubscript:@"homeTeamName"];
  }
  if (self->_performerNames)
  {
    v12 = [(CCWalletPassEventContent *)self performerNames];
    [v3 setObject:v12 forKeyedSubscript:@"performerNames"];
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v14 = (void (**)(id, void *))a3;
  if (self->_artistIDs)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46124 repeatedStringValue:self->_artistIDs];
    v14[2](v14, v5);
  }
  if (self->_awayTeamAbbreviation)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46125 stringValue:self->_awayTeamAbbreviation];
    v14[2](v14, v6);
  }
  if (self->_awayTeamName)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46126 stringValue:self->_awayTeamName];
    v14[2](v14, v7);
  }
  if (self->_eventName)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46127 stringValue:self->_eventName];
    v14[2](v14, v8);
  }
  if (self->_eventType)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46128 stringValue:self->_eventType];
    v14[2](v14, v9);
  }
  if (self->_genre)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46129 stringValue:self->_genre];
    v14[2](v14, v10);
  }
  if (self->_homeTeamAbbreviation)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46130 stringValue:self->_homeTeamAbbreviation];
    v14[2](v14, v11);
  }
  if (self->_homeTeamName)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46131 stringValue:self->_homeTeamName];
    v14[2](v14, v12);
  }
  if (self->_performerNames)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46132 repeatedStringValue:self->_performerNames];
    v14[2](v14, v13);
  }
}

- (NSArray)performerNames
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_performerNames copyItems:1];
  return (NSArray *)v2;
}

- (NSString)homeTeamName
{
  v2 = (void *)[(NSString *)self->_homeTeamName copy];
  return (NSString *)v2;
}

- (NSString)homeTeamAbbreviation
{
  v2 = (void *)[(NSString *)self->_homeTeamAbbreviation copy];
  return (NSString *)v2;
}

- (NSString)genre
{
  v2 = (void *)[(NSString *)self->_genre copy];
  return (NSString *)v2;
}

- (NSString)eventType
{
  v2 = (void *)[(NSString *)self->_eventType copy];
  return (NSString *)v2;
}

- (NSString)eventName
{
  v2 = (void *)[(NSString *)self->_eventName copy];
  return (NSString *)v2;
}

- (NSString)awayTeamName
{
  v2 = (void *)[(NSString *)self->_awayTeamName copy];
  return (NSString *)v2;
}

- (NSString)awayTeamAbbreviation
{
  v2 = (void *)[(NSString *)self->_awayTeamAbbreviation copy];
  return (NSString *)v2;
}

- (NSArray)artistIDs
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_artistIDs copyItems:1];
  return (NSArray *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]])
  {
    v34 = 0;
    v35 = 0;
    goto LABEL_44;
  }
  v34 = 0;
  v35 = 0;
  v9 = 0;
  v10 = (int *)MEMORY[0x263F317B8];
  v11 = (int *)MEMORY[0x263F317B0];
LABEL_3:
  if (*(void *)&v6[*v10]) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v9 == 0;
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
        if (*(void *)&v6[*v10]) {
          goto LABEL_44;
        }
LABEL_18:
        switch((v15 >> 3))
        {
          case 1u:
            v20 = CCPBReaderReadStringNoCopy();
            if (!v35) {
              v35 = objc_opt_new();
            }
            if (!v20) {
              goto LABEL_38;
            }
            v21 = v35;
            goto LABEL_37;
          case 2u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            uint64_t v23 = 24;
            goto LABEL_32;
          case 3u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            uint64_t v23 = 32;
            goto LABEL_32;
          case 4u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            uint64_t v23 = 40;
            goto LABEL_32;
          case 5u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            uint64_t v23 = 48;
            goto LABEL_32;
          case 6u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            uint64_t v23 = 56;
            goto LABEL_32;
          case 7u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            uint64_t v23 = 64;
            goto LABEL_32;
          case 8u:
            CCPBReaderReadStringNoCopy();
            v22 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v9 = 0;
            uint64_t v23 = 72;
LABEL_32:
            v20 = *(Class *)((char *)&self->super.super.isa + v23);
            *(Class *)((char *)&self->super.super.isa + v23) = v22;
            goto LABEL_40;
          case 9u:
            v20 = CCPBReaderReadStringNoCopy();
            if (!v34) {
              v34 = objc_opt_new();
            }
            if (v20)
            {
              v21 = v34;
LABEL_37:
              [v21 addObject:v20];
            }
LABEL_38:
            v9 = 0;
            goto LABEL_40;
          default:
            if (CCPBReaderSkipValueWithTag())
            {
              v9 = 0;
            }
            else
            {
              v24 = (objc_class *)objc_opt_class();
              v20 = NSStringFromClass(v24);
              v9 = CCSkipFieldErrorForMessage();
LABEL_40:
            }
            if (*(void *)&v6[*v7] >= *(void *)&v6[*v8]) {
              goto LABEL_45;
            }
            goto LABEL_3;
        }
      }
    }
    *(void *)&v6[*v10] = 1;
LABEL_17:
    if (!*(void *)&v6[*v10]) {
      goto LABEL_18;
    }
LABEL_44:
    v9 = 0;
  }
LABEL_45:
  v25 = (NSArray *)[v35 copy];
  artistIDs = self->_artistIDs;
  self->_artistIDs = v25;

  v27 = (NSArray *)[v34 copy];
  performerNames = self->_performerNames;
  self->_performerNames = v27;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v6[*MEMORY[0x263F317B8]])
    {
      BOOL v32 = 1;
      goto LABEL_50;
    }
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    v31 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v32 = 0;
LABEL_50:

  return v32;
}

- (CCWalletPassEventContent)initWithArtistIDs:(id)a3 awayTeamAbbreviation:(id)a4 awayTeamName:(id)a5 eventName:(id)a6 eventType:(id)a7 genre:(id)a8 homeTeamAbbreviation:(id)a9 homeTeamName:(id)a10 performerNames:(id)a11 error:(id *)a12
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v56 = a7;
  id v60 = a8;
  id v59 = a9;
  id v58 = a10;
  id v57 = a11;
  v21 = objc_opt_new();
  if (!v17)
  {
    v54 = a12;
    id v23 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  uint64_t v77 = 0;
  int v22 = CCValidateArrayValues();
  id v23 = 0;
  if (v22)
  {
    v54 = a12;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v24 = v17;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v73 objects:v79 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v74 != v27) {
            objc_enumerationMutation(v24);
          }
          CCPBDataWriterWriteStringField();
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v73 objects:v79 count:16];
      }
      while (v26);
    }

LABEL_12:
    v29 = v56;
    if (v18)
    {
      objc_opt_class();
      id v72 = v23;
      int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      id v31 = v23;

      if (!IsInstanceOfExpectedClass) {
        goto LABEL_39;
      }
      CCPBDataWriterWriteStringField();
      if (!v19)
      {
LABEL_15:
        id v23 = v31;
        if (v20) {
          goto LABEL_16;
        }
        goto LABEL_24;
      }
    }
    else
    {
      id v31 = v23;
      if (!v19) {
        goto LABEL_15;
      }
    }
    objc_opt_class();
    id v71 = v31;
    int v38 = CCValidateIsInstanceOfExpectedClass();
    id v23 = v31;

    if (!v38) {
      goto LABEL_51;
    }
    CCPBDataWriterWriteStringField();
    if (v20)
    {
LABEL_16:
      objc_opt_class();
      id v70 = v23;
      int v32 = CCValidateIsInstanceOfExpectedClass();
      id v31 = v23;

      if (!v32) {
        goto LABEL_39;
      }
      CCPBDataWriterWriteStringField();
      if (!v56) {
        goto LABEL_18;
      }
      goto LABEL_25;
    }
LABEL_24:
    id v31 = v23;
    if (!v56)
    {
LABEL_18:
      id v23 = v31;
LABEL_27:
      if (v60)
      {
        v33 = v19;
        v34 = v20;
        objc_opt_class();
        id v68 = v23;
        int v40 = CCValidateIsInstanceOfExpectedClass();
        v37 = v60;
        id v41 = v23;

        if (!v40)
        {
          CCSetError();
          v35 = 0;
          id v23 = v41;
LABEL_53:
          v36 = self;
          goto LABEL_54;
        }
        CCPBDataWriterWriteStringField();
        id v20 = v34;
        id v19 = v33;
      }
      else
      {
        id v41 = v23;
      }
      if (!v59)
      {
        id v23 = v41;
        goto LABEL_36;
      }
      objc_opt_class();
      id v67 = v41;
      int v42 = CCValidateIsInstanceOfExpectedClass();
      id v23 = v41;

      if (v42)
      {
        CCPBDataWriterWriteStringField();
LABEL_36:
        if (!v58)
        {
          id v31 = v23;
          goto LABEL_41;
        }
        objc_opt_class();
        id v66 = v23;
        int v43 = CCValidateIsInstanceOfExpectedClass();
        id v31 = v23;

        if (v43)
        {
          CCPBDataWriterWriteStringField();
LABEL_41:
          if (!v57)
          {
            v33 = v19;
            v34 = v20;
            id v23 = v31;
            v50 = self;
LABEL_56:
            v52 = [v21 immutableData];
            v53 = [(CCItemMessage *)v50 initWithData:v52 error:v54];

            v36 = v53;
            v35 = v53;
            goto LABEL_20;
          }
          objc_opt_class();
          id v65 = v31;
          int v44 = CCValidateArrayValues();
          id v23 = v31;

          if (v44)
          {
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v45 = v57;
            uint64_t v46 = [v45 countByEnumeratingWithState:&v61 objects:v78 count:16];
            if (v46)
            {
              uint64_t v47 = v46;
              uint64_t v48 = *(void *)v62;
              do
              {
                for (uint64_t j = 0; j != v47; ++j)
                {
                  if (*(void *)v62 != v48) {
                    objc_enumerationMutation(v45);
                  }
                  CCPBDataWriterWriteStringField();
                }
                uint64_t v47 = [v45 countByEnumeratingWithState:&v61 objects:v78 count:16];
              }
              while (v47);
            }
            v33 = v19;
            v34 = v20;

            v50 = self;
            v29 = v56;
            goto LABEL_56;
          }
          goto LABEL_51;
        }
LABEL_39:
        v33 = v19;
        v34 = v20;
        CCSetError();
        v35 = 0;
        id v23 = v31;
LABEL_52:
        v37 = v60;
        goto LABEL_53;
      }
LABEL_51:
      v33 = v19;
      v34 = v20;
      CCSetError();
      v35 = 0;
      goto LABEL_52;
    }
LABEL_25:
    objc_opt_class();
    id v69 = v31;
    int v39 = CCValidateIsInstanceOfExpectedClass();
    id v23 = v31;

    if (!v39) {
      goto LABEL_51;
    }
    CCPBDataWriterWriteStringField();
    goto LABEL_27;
  }
  v33 = v19;
  v34 = v20;
  CCSetError();
  v35 = 0;
  v36 = self;
  v29 = v56;
LABEL_20:
  v37 = v60;
LABEL_54:

  return v35;
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
  return 0;
}

+ (unsigned)itemType
{
  return -19416;
}

@end