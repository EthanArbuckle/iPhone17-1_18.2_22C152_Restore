@interface CCPodcastContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCPodcastContent)initWithEntity:(id)a3 entityType:(unsigned int)a4 error:(id *)a5;
- (CCPodcastContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCPodcastPlaylist)playlist;
- (CCPodcastShow)show;
- (id)jsonDictionary;
- (unsigned)entityType;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCPodcastContent

+ (unsigned)itemType
{
  return -23352;
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_show, 0);
}

- (CCPodcastContent)initWithEntity:(id)a3 entityType:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = objc_opt_new();
  if (v8 && a4 == 1)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v11 = 0;
    if (IsInstanceOfExpectedClass) {
      goto LABEL_8;
    }
LABEL_10:
    CCSetError();
    v15 = 0;
    goto LABEL_11;
  }
  id v11 = 0;
  if (!v8 || a4 != 2) {
    goto LABEL_9;
  }
  objc_opt_class();
  uint64_t v17 = 0;
  int v12 = CCValidateIsInstanceOfExpectedClass();
  id v11 = 0;
  if (!v12) {
    goto LABEL_10;
  }
LABEL_8:
  v13 = [v8 data];
  CCPBDataWriterWriteDataField();

LABEL_9:
  v14 = objc_msgSend(v9, "immutableData", v17);
  self = [(CCItemMessage *)self initWithData:v14 error:a5];

  v15 = self;
LABEL_11:

  return v15;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  v9 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]]) {
    goto LABEL_30;
  }
  id v10 = 0;
  id v11 = (int *)MEMORY[0x263F317B0];
  do
  {
    if (*(void *)&v6[*v9]) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (!v12) {
      break;
    }
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
          goto LABEL_31;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    if (*(void *)&v6[*v9]) {
      goto LABEL_31;
    }
LABEL_18:
    if ((v15 >> 3) == 2)
    {
      v25 = [CCPodcastPlaylist alloc];
      v26 = CCPBReaderReadDataNoCopy();
      id v37 = 0;
      v27 = [(CCItemMessage *)v25 initWithData:v26 error:&v37];
      id v10 = v37;
      playlist = self->_playlist;
      self->_playlist = v27;

      if (!v10)
      {
        show = self->_show;
        self->_show = 0;

        self->_entityType = 2;
      }
    }
    else if ((v15 >> 3) == 1)
    {
      v20 = [CCPodcastShow alloc];
      v21 = CCPBReaderReadDataNoCopy();
      id v38 = 0;
      v22 = [(CCItemMessage *)v20 initWithData:v21 error:&v38];
      id v10 = v38;
      v23 = self->_show;
      self->_show = v22;

      if (!v10)
      {
        self->_entityType = 1;
        v24 = self->_playlist;
        self->_playlist = 0;
      }
    }
    else if (CCPBReaderSkipValueWithTag())
    {
      id v10 = 0;
    }
    else
    {
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      CCSkipFieldErrorForMessage();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
  }
  else
  {
LABEL_30:
    if (!*(void *)&v6[*v9])
    {
      id v10 = 0;
      BOOL v35 = 1;
      goto LABEL_34;
    }
LABEL_31:
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    v34 = CCInvalidBufferErrorForMessage();
    CCSetError();

    id v10 = 0;
  }
  BOOL v35 = 0;
LABEL_34:

  return v35;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 23352) > 6u) {
    return 0;
  }
  else {
    return off_26539C920[(unsigned __int16)(a3 + 23352)];
  }
}

- (unsigned)entityType
{
  return self->_entityType;
}

- (CCPodcastContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  v20[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"show"];
    if (v9)
    {
      v20[0] = 0;
      id v10 = [[CCPodcastShow alloc] initWithJSONDictionary:v9 error:v20];
      id v11 = v20[0];
      BOOL v12 = v11;
      if (!v10 || v11)
      {
        CCSetError();
        goto LABEL_15;
      }

      v9 = v10;
    }
    BOOL v12 = [v6 objectForKeyedSubscript:@"playlist"];
    if (!v12)
    {
LABEL_10:
      if (v9)
      {
        unint64_t v15 = v9;
        uint64_t v16 = 1;
      }
      else
      {
        uint64_t v16 = 0;
      }
      id v10 = v9;
      if (v12)
      {
        id v10 = v12;

        uint64_t v16 = 2;
      }
      unint64_t v17 = [[CCPodcastContent alloc] initWithEntity:v10 entityType:v16 error:a4];
      goto LABEL_20;
    }
    id v19 = 0;
    char v13 = [[CCPodcastPlaylist alloc] initWithJSONDictionary:v12 error:&v19];
    unsigned int v14 = (CCPodcastShow *)v19;
    id v10 = v14;
    if (v13 && !v14)
    {

      BOOL v12 = v13;
      goto LABEL_10;
    }
    CCSetError();

LABEL_15:
    unint64_t v17 = 0;
LABEL_20:

    goto LABEL_21;
  }
  CCSetError();
  unint64_t v17 = 0;
LABEL_21:

  return v17;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_show)
  {
    v4 = [(CCPodcastContent *)self show];
    id v5 = [v4 jsonDictionary];
    [v3 setObject:v5 forKeyedSubscript:@"show"];
  }
  if (self->_playlist)
  {
    id v6 = [(CCPodcastContent *)self playlist];
    v7 = [v6 jsonDictionary];
    [v3 setObject:v7 forKeyedSubscript:@"playlist"];
  }
  id v8 = (void *)[v3 copy];

  return v8;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v7 = (void (**)(id, void *))a3;
  if (self->_show)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42185 subMessageValue:self->_show];
    v7[2](v7, v5);
  }
  if (self->_playlist)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42186 subMessageValue:self->_playlist];
    v7[2](v7, v6);
  }
}

- (CCPodcastPlaylist)playlist
{
  v2 = (void *)[(CCPodcastPlaylist *)self->_playlist copy];
  return (CCPodcastPlaylist *)v2;
}

- (CCPodcastShow)show
{
  v2 = (void *)[(CCPodcastShow *)self->_show copy];
  return (CCPodcastShow *)v2;
}

@end