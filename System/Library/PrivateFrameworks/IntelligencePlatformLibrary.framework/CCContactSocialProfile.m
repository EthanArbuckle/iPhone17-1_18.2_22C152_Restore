@interface CCContactSocialProfile
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCContactSocialProfile)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCContactSocialProfile)initWithLabel:(id)a3 urlString:(id)a4 username:(id)a5 userIdentifier:(id)a6 serviceName:(id)a7 error:(id *)a8;
- (NSString)label;
- (NSString)serviceName;
- (NSString)urlString;
- (NSString)userIdentifier;
- (NSString)username;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCContactSocialProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (CCContactSocialProfile)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"label"];
    v10 = [v6 objectForKeyedSubscript:@"urlString"];
    v11 = [v6 objectForKeyedSubscript:@"username"];
    v12 = [v6 objectForKeyedSubscript:@"userIdentifier"];
    v13 = [v6 objectForKeyedSubscript:@"serviceName"];
    v14 = [[CCContactSocialProfile alloc] initWithLabel:v9 urlString:v10 username:v11 userIdentifier:v12 serviceName:v13 error:a4];
  }
  else
  {
    CCSetError();
    v14 = 0;
  }

  return v14;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_label)
  {
    v4 = [(CCContactSocialProfile *)self label];
    [v3 setObject:v4 forKeyedSubscript:@"label"];
  }
  if (self->_urlString)
  {
    v5 = [(CCContactSocialProfile *)self urlString];
    [v3 setObject:v5 forKeyedSubscript:@"urlString"];
  }
  if (self->_username)
  {
    id v6 = [(CCContactSocialProfile *)self username];
    [v3 setObject:v6 forKeyedSubscript:@"username"];
  }
  if (self->_userIdentifier)
  {
    v7 = [(CCContactSocialProfile *)self userIdentifier];
    [v3 setObject:v7 forKeyedSubscript:@"userIdentifier"];
  }
  if (self->_serviceName)
  {
    id v8 = [(CCContactSocialProfile *)self serviceName];
    [v3 setObject:v8 forKeyedSubscript:@"serviceName"];
  }
  v9 = (void *)[v3 copy];

  return v9;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v10 = (void (**)(id, void *))a3;
  if (self->_label)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19760 stringValue:self->_label];
    v10[2](v10, v5);
  }
  if (self->_urlString)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19761 stringValue:self->_urlString];
    v10[2](v10, v6);
  }
  if (self->_username)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19762 stringValue:self->_username];
    v10[2](v10, v7);
  }
  if (self->_userIdentifier)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19763 stringValue:self->_userIdentifier];
    v10[2](v10, v8);
  }
  if (self->_serviceName)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19764 stringValue:self->_serviceName];
    v10[2](v10, v9);
  }
}

- (NSString)serviceName
{
  v2 = (void *)[(NSString *)self->_serviceName copy];
  return (NSString *)v2;
}

- (NSString)userIdentifier
{
  v2 = (void *)[(NSString *)self->_userIdentifier copy];
  return (NSString *)v2;
}

- (NSString)username
{
  v2 = (void *)[(NSString *)self->_username copy];
  return (NSString *)v2;
}

- (NSString)urlString
{
  v2 = (void *)[(NSString *)self->_urlString copy];
  return (NSString *)v2;
}

- (NSString)label
{
  v2 = (void *)[(NSString *)self->_label copy];
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
            goto LABEL_34;
          }
LABEL_18:
          switch((v15 >> 3))
          {
            case 1u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 16;
              goto LABEL_26;
            case 2u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 24;
              goto LABEL_26;
            case 3u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 32;
              goto LABEL_26;
            case 4u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 40;
              goto LABEL_26;
            case 5u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 48;
LABEL_26:
              v22 = *(Class *)((char *)&self->super.super.isa + v21);
              *(Class *)((char *)&self->super.super.isa + v21) = v20;
              goto LABEL_27;
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
LABEL_27:
              }
              if (*(void *)&v6[*v7] >= *(void *)&v6[*v8]) {
                goto LABEL_31;
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
LABEL_34:
      v24 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v24);
      v25 = CCInvalidBufferErrorForMessage();
      CCSetError();

      goto LABEL_35;
    }
LABEL_31:
    if (v10)
    {
      CCSetError();
LABEL_35:

      BOOL v26 = 0;
      goto LABEL_37;
    }
  }
  if (*(void *)&v6[*v9]) {
    goto LABEL_34;
  }
  BOOL v26 = 1;
LABEL_37:

  return v26;
}

- (CCContactSocialProfile)initWithLabel:(id)a3 urlString:(id)a4 username:(id)a5 userIdentifier:(id)a6 serviceName:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v30 = a7;
  char v18 = objc_opt_new();
  if (!v14)
  {
    id v20 = 0;
LABEL_5:
    v29 = self;
    if (v15)
    {
      objc_opt_class();
      int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      id v22 = v20;

      if (!IsInstanceOfExpectedClass) {
        goto LABEL_11;
      }
      CCPBDataWriterWriteStringField();
      if (!v16)
      {
LABEL_8:
        id v20 = v22;
        if (v17) {
          goto LABEL_9;
        }
        goto LABEL_16;
      }
    }
    else
    {
      id v22 = v20;
      if (!v16) {
        goto LABEL_8;
      }
    }
    objc_opt_class();
    int v25 = CCValidateIsInstanceOfExpectedClass();
    id v20 = v22;

    if (!v25)
    {
LABEL_20:
      CCSetError();
      v24 = 0;
      goto LABEL_21;
    }
    CCPBDataWriterWriteStringField();
    if (v17)
    {
LABEL_9:
      objc_opt_class();
      int v23 = CCValidateIsInstanceOfExpectedClass();
      id v22 = v20;

      if (v23)
      {
        CCPBDataWriterWriteStringField();
LABEL_17:
        if (!v30)
        {
          id v20 = v22;
          goto LABEL_23;
        }
        objc_opt_class();
        int v26 = CCValidateIsInstanceOfExpectedClass();
        id v20 = v22;

        if (v26)
        {
          CCPBDataWriterWriteStringField();
LABEL_23:
          v27 = [v18 immutableData];
          v24 = [(CCItemMessage *)v29 initWithData:v27 error:a8];

          self = v24;
          goto LABEL_24;
        }
        goto LABEL_20;
      }
LABEL_11:
      CCSetError();
      v24 = 0;
      id v20 = v22;
LABEL_21:
      self = v29;
      goto LABEL_24;
    }
LABEL_16:
    id v22 = v20;
    goto LABEL_17;
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
  v24 = 0;
LABEL_24:

  return v24;
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
  return 19668;
}

@end