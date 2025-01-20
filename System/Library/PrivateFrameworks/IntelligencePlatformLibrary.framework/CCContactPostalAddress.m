@interface CCContactPostalAddress
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCContactPostalAddress)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCContactPostalAddress)initWithLabel:(id)a3 street:(id)a4 subLocality:(id)a5 city:(id)a6 subAdministrativeArea:(id)a7 state:(id)a8 postalCode:(id)a9 country:(id)a10 ISOCountryCode:(id)a11 error:(id *)a12;
- (NSString)ISOCountryCode;
- (NSString)city;
- (NSString)country;
- (NSString)label;
- (NSString)postalCode;
- (NSString)state;
- (NSString)street;
- (NSString)subAdministrativeArea;
- (NSString)subLocality;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCContactPostalAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subLocality, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (CCContactPostalAddress)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v18 = [v6 objectForKeyedSubscript:@"label"];
    v9 = [v6 objectForKeyedSubscript:@"street"];
    v19 = [v6 objectForKeyedSubscript:@"subLocality"];
    v10 = [v6 objectForKeyedSubscript:@"city"];
    v11 = [v6 objectForKeyedSubscript:@"subAdministrativeArea"];
    v12 = [v6 objectForKeyedSubscript:@"state"];
    [v6 objectForKeyedSubscript:@"postalCode"];
    v17 = v20 = self;
    v13 = [v6 objectForKeyedSubscript:@"country"];
    v14 = [v6 objectForKeyedSubscript:@"ISOCountryCode"];
    v15 = [[CCContactPostalAddress alloc] initWithLabel:v18 street:v9 subLocality:v19 city:v10 subAdministrativeArea:v11 state:v12 postalCode:v17 country:v13 ISOCountryCode:v14 error:a4];

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
  if (self->_label)
  {
    v4 = [(CCContactPostalAddress *)self label];
    [v3 setObject:v4 forKeyedSubscript:@"label"];
  }
  if (self->_street)
  {
    v5 = [(CCContactPostalAddress *)self street];
    [v3 setObject:v5 forKeyedSubscript:@"street"];
  }
  if (self->_subLocality)
  {
    id v6 = [(CCContactPostalAddress *)self subLocality];
    [v3 setObject:v6 forKeyedSubscript:@"subLocality"];
  }
  if (self->_city)
  {
    v7 = [(CCContactPostalAddress *)self city];
    [v3 setObject:v7 forKeyedSubscript:@"city"];
  }
  if (self->_subAdministrativeArea)
  {
    id v8 = [(CCContactPostalAddress *)self subAdministrativeArea];
    [v3 setObject:v8 forKeyedSubscript:@"subAdministrativeArea"];
  }
  if (self->_state)
  {
    v9 = [(CCContactPostalAddress *)self state];
    [v3 setObject:v9 forKeyedSubscript:@"state"];
  }
  if (self->_postalCode)
  {
    v10 = [(CCContactPostalAddress *)self postalCode];
    [v3 setObject:v10 forKeyedSubscript:@"postalCode"];
  }
  if (self->_country)
  {
    v11 = [(CCContactPostalAddress *)self country];
    [v3 setObject:v11 forKeyedSubscript:@"country"];
  }
  if (self->_ISOCountryCode)
  {
    v12 = [(CCContactPostalAddress *)self ISOCountryCode];
    [v3 setObject:v12 forKeyedSubscript:@"ISOCountryCode"];
  }
  v13 = (void *)[v3 copy];

  return v13;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v14 = (void (**)(id, void *))a3;
  if (self->_label)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19749 stringValue:self->_label];
    v14[2](v14, v5);
  }
  if (self->_street)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19750 stringValue:self->_street];
    v14[2](v14, v6);
  }
  if (self->_subLocality)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19751 stringValue:self->_subLocality];
    v14[2](v14, v7);
  }
  if (self->_city)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19752 stringValue:self->_city];
    v14[2](v14, v8);
  }
  if (self->_subAdministrativeArea)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19753 stringValue:self->_subAdministrativeArea];
    v14[2](v14, v9);
  }
  if (self->_state)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19754 stringValue:self->_state];
    v14[2](v14, v10);
  }
  if (self->_postalCode)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19755 stringValue:self->_postalCode];
    v14[2](v14, v11);
  }
  if (self->_country)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19756 stringValue:self->_country];
    v14[2](v14, v12);
  }
  if (self->_ISOCountryCode)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19757 stringValue:self->_ISOCountryCode];
    v14[2](v14, v13);
  }
}

- (NSString)ISOCountryCode
{
  v2 = (void *)[(NSString *)self->_ISOCountryCode copy];
  return (NSString *)v2;
}

- (NSString)country
{
  v2 = (void *)[(NSString *)self->_country copy];
  return (NSString *)v2;
}

- (NSString)postalCode
{
  v2 = (void *)[(NSString *)self->_postalCode copy];
  return (NSString *)v2;
}

- (NSString)state
{
  v2 = (void *)[(NSString *)self->_state copy];
  return (NSString *)v2;
}

- (NSString)subAdministrativeArea
{
  v2 = (void *)[(NSString *)self->_subAdministrativeArea copy];
  return (NSString *)v2;
}

- (NSString)city
{
  v2 = (void *)[(NSString *)self->_city copy];
  return (NSString *)v2;
}

- (NSString)subLocality
{
  v2 = (void *)[(NSString *)self->_subLocality copy];
  return (NSString *)v2;
}

- (NSString)street
{
  v2 = (void *)[(NSString *)self->_street copy];
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
            goto LABEL_38;
          }
LABEL_18:
          switch((v15 >> 3))
          {
            case 1u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 16;
              goto LABEL_30;
            case 2u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 24;
              goto LABEL_30;
            case 3u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 32;
              goto LABEL_30;
            case 4u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 40;
              goto LABEL_30;
            case 5u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 48;
              goto LABEL_30;
            case 6u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 56;
              goto LABEL_30;
            case 7u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 64;
              goto LABEL_30;
            case 8u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 72;
              goto LABEL_30;
            case 9u:
              CCPBReaderReadStringNoCopy();
              v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
              v10 = 0;
              uint64_t v21 = 80;
LABEL_30:
              v22 = *(Class *)((char *)&self->super.super.isa + v21);
              *(Class *)((char *)&self->super.super.isa + v21) = v20;
              goto LABEL_31;
            default:
              if (CCPBReaderSkipValueWithTag())
              {
                v10 = 0;
              }
              else
              {
                v23 = (objc_class *)objc_opt_class();
                v22 = NSStringFromClass(v23);
                v10 = CCSkipFieldErrorForMessage();
LABEL_31:
              }
              if (*(void *)&v6[*v7] >= *(void *)&v6[*v8]) {
                goto LABEL_35;
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
LABEL_38:
      v24 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v24);
      v25 = CCInvalidBufferErrorForMessage();
      CCSetError();

      goto LABEL_39;
    }
LABEL_35:
    if (v10)
    {
      CCSetError();
LABEL_39:

      BOOL v26 = 0;
      goto LABEL_41;
    }
  }
  if (*(void *)&v6[*v9]) {
    goto LABEL_38;
  }
  BOOL v26 = 1;
LABEL_41:

  return v26;
}

- (CCContactPostalAddress)initWithLabel:(id)a3 street:(id)a4 subLocality:(id)a5 city:(id)a6 subAdministrativeArea:(id)a7 state:(id)a8 postalCode:(id)a9 country:(id)a10 ISOCountryCode:(id)a11 error:(id *)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v42 = a8;
  id v40 = a9;
  id v41 = a10;
  id v39 = a11;
  v22 = objc_opt_new();
  if (v17)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v24 = 0;
    if (!IsInstanceOfExpectedClass) {
      goto LABEL_25;
    }
    CCPBDataWriterWriteStringField();
    if (!v18)
    {
LABEL_4:
      id v25 = v24;
      if (v19) {
        goto LABEL_5;
      }
LABEL_13:
      id v24 = v25;
      if (!v20) {
        goto LABEL_7;
      }
LABEL_14:
      objc_opt_class();
      int v29 = CCValidateIsInstanceOfExpectedClass();
      id v25 = v24;

      if (!v29) {
        goto LABEL_32;
      }
      CCPBDataWriterWriteStringField();
      if (v21) {
        goto LABEL_8;
      }
LABEL_16:
      id v24 = v25;
      goto LABEL_17;
    }
  }
  else
  {
    id v24 = 0;
    if (!v18) {
      goto LABEL_4;
    }
  }
  objc_opt_class();
  int v28 = CCValidateIsInstanceOfExpectedClass();
  id v25 = v24;

  if (!v28) {
    goto LABEL_32;
  }
  CCPBDataWriterWriteStringField();
  if (!v19) {
    goto LABEL_13;
  }
LABEL_5:
  objc_opt_class();
  int v26 = CCValidateIsInstanceOfExpectedClass();
  id v24 = v25;

  if (!v26) {
    goto LABEL_25;
  }
  CCPBDataWriterWriteStringField();
  if (v20) {
    goto LABEL_14;
  }
LABEL_7:
  id v25 = v24;
  if (!v21) {
    goto LABEL_16;
  }
LABEL_8:
  objc_opt_class();
  int v27 = CCValidateIsInstanceOfExpectedClass();
  id v24 = v25;

  if (!v27) {
    goto LABEL_25;
  }
  CCPBDataWriterWriteStringField();
LABEL_17:
  if (v42)
  {
    objc_opt_class();
    int v30 = CCValidateIsInstanceOfExpectedClass();
    id v25 = v24;

    if (v30)
    {
      CCPBDataWriterWriteStringField();
      goto LABEL_21;
    }
LABEL_32:
    CCSetError();
    v32 = 0;
    id v24 = v25;
    goto LABEL_33;
  }
  id v25 = v24;
LABEL_21:
  if (!v40)
  {
    id v24 = v25;
    if (!v41) {
      goto LABEL_24;
    }
    goto LABEL_27;
  }
  objc_opt_class();
  int v31 = CCValidateIsInstanceOfExpectedClass();
  id v24 = v25;

  if (!v31)
  {
LABEL_25:
    CCSetError();
    v32 = 0;
LABEL_33:
    v35 = self;
    goto LABEL_34;
  }
  CCPBDataWriterWriteStringField();
  if (v41)
  {
LABEL_27:
    objc_opt_class();
    int v33 = CCValidateIsInstanceOfExpectedClass();
    id v25 = v24;

    if (v33)
    {
      CCPBDataWriterWriteStringField();
      goto LABEL_29;
    }
    goto LABEL_32;
  }
LABEL_24:
  id v25 = v24;
LABEL_29:
  if (v39)
  {
    objc_opt_class();
    int v34 = CCValidateIsInstanceOfExpectedClass();
    id v24 = v25;

    v35 = self;
    if (!v34)
    {
      CCSetError();
      v32 = 0;
      goto LABEL_34;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v24 = v25;
    v35 = self;
  }
  v37 = [v22 immutableData];
  v35 = [(CCItemMessage *)v35 initWithData:v37 error:a12];

  v32 = v35;
LABEL_34:

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
  return 0;
}

+ (unsigned)itemType
{
  return 19668;
}

@end