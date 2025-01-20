@interface CCRadioStationContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCRadioStationContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCRadioStationContent)initWithName:(id)a3 callSign:(id)a4 frequency:(id)a5 channel:(id)a6 signalType:(unsigned int)a7 error:(id *)a8;
- (NSString)callSign;
- (NSString)channel;
- (NSString)frequency;
- (NSString)name;
- (id)jsonDictionary;
- (unsigned)signalType;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCRadioStationContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_frequency, 0);
  objc_storeStrong((id *)&self->_callSign, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (unsigned)signalType
{
  return self->_signalType;
}

- (CCRadioStationContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"name"];
    v10 = [v6 objectForKeyedSubscript:@"callSign"];
    v11 = [v6 objectForKeyedSubscript:@"frequency"];
    v12 = [v6 objectForKeyedSubscript:@"channel"];
    v13 = [v6 objectForKeyedSubscript:@"signalType"];
    v14 = v13;
    if (v13) {
      uint64_t v15 = [v13 unsignedIntegerValue];
    }
    else {
      uint64_t v15 = 0;
    }
    v16 = [[CCRadioStationContent alloc] initWithName:v9 callSign:v10 frequency:v11 channel:v12 signalType:v15 error:a4];
  }
  else
  {
    CCSetError();
    v16 = 0;
  }

  return v16;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_name)
  {
    v4 = [(CCRadioStationContent *)self name];
    [v3 setObject:v4 forKeyedSubscript:@"name"];
  }
  if (self->_callSign)
  {
    v5 = [(CCRadioStationContent *)self callSign];
    [v3 setObject:v5 forKeyedSubscript:@"callSign"];
  }
  if (self->_frequency)
  {
    id v6 = [(CCRadioStationContent *)self frequency];
    [v3 setObject:v6 forKeyedSubscript:@"frequency"];
  }
  if (self->_channel)
  {
    v7 = [(CCRadioStationContent *)self channel];
    [v3 setObject:v7 forKeyedSubscript:@"channel"];
  }
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCRadioStationContent signalType](self, "signalType"));
  [v3 setObject:v8 forKeyedSubscript:@"signalType"];

  v9 = (void *)[v3 copy];
  return v9;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v10 = (void (**)(id, void *))a3;
  if (self->_name)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:49069 stringValue:self->_name];
    v10[2](v10, v5);
  }
  if (self->_callSign)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:49070 stringValue:self->_callSign];
    v10[2](v10, v6);
  }
  if (self->_frequency)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:49071 stringValue:self->_frequency];
    v10[2](v10, v7);
  }
  if (self->_channel)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:49072 stringValue:self->_channel];
    v10[2](v10, v8);
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:49073 enumValue:self->_signalType];
  v10[2](v10, v9);
}

- (NSString)channel
{
  v2 = (void *)[(NSString *)self->_channel copy];
  return (NSString *)v2;
}

- (NSString)frequency
{
  v2 = (void *)[(NSString *)self->_frequency copy];
  return (NSString *)v2;
}

- (NSString)callSign
{
  v2 = (void *)[(NSString *)self->_callSign copy];
  return (NSString *)v2;
}

- (NSString)name
{
  v2 = (void *)[(NSString *)self->_name copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v6];
  id v8 = (int *)MEMORY[0x263F317C8];
  v9 = (int *)MEMORY[0x263F317C0];
  v10 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v7[*MEMORY[0x263F317C8]] >= *(void *)&v7[*MEMORY[0x263F317C0]]) {
    goto LABEL_41;
  }
  v11 = 0;
  v12 = (int *)MEMORY[0x263F317B0];
  do
  {
    if (*(void *)&v7[*v10]) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v11 == 0;
    }
    if (!v13) {
      break;
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = *v8;
      unint64_t v18 = *(void *)&v7[v17];
      if (v18 == -1 || v18 >= *(void *)&v7[*v9]) {
        break;
      }
      char v19 = *(unsigned char *)(*(void *)&v7[*v12] + v18);
      *(void *)&v7[v17] = v18 + 1;
      v16 |= (unint64_t)(v19 & 0x7F) << v14;
      if ((v19 & 0x80) == 0) {
        goto LABEL_17;
      }
      v14 += 7;
      BOOL v20 = v15++ >= 9;
      if (v20)
      {
        unint64_t v16 = 0;
        if (*(void *)&v7[*v10]) {
          goto LABEL_42;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v7[*v10] = 1;
LABEL_17:
    if (*(void *)&v7[*v10]) {
      goto LABEL_42;
    }
LABEL_18:
    switch((v16 >> 3))
    {
      case 1u:
        CCPBReaderReadStringNoCopy();
        v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = 24;
        goto LABEL_25;
      case 2u:
        CCPBReaderReadStringNoCopy();
        v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = 32;
        goto LABEL_25;
      case 3u:
        CCPBReaderReadStringNoCopy();
        v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = 40;
        goto LABEL_25;
      case 4u:
        CCPBReaderReadStringNoCopy();
        v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
        uint64_t v22 = 48;
LABEL_25:
        v23 = *(Class *)((char *)&self->super.super.isa + v22);
        *(Class *)((char *)&self->super.super.isa + v22) = v21;

        v11 = 0;
        continue;
      case 5u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        break;
      default:
        if (CCPBReaderSkipValueWithTag())
        {
          v11 = 0;
        }
        else
        {
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          id v37 = v6;
          v32 = v31 = a4;
          v11 = CCSkipFieldErrorForMessage();

          a4 = v31;
          id v6 = v37;
        }
        continue;
    }
    while (1)
    {
      uint64_t v27 = *v8;
      unint64_t v28 = *(void *)&v7[v27];
      if (v28 == -1 || v28 >= *(void *)&v7[*v9]) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)&v7[*v12] + v28);
      *(void *)&v7[v27] = v28 + 1;
      v26 |= (unint64_t)(v29 & 0x7F) << v24;
      if ((v29 & 0x80) == 0) {
        goto LABEL_34;
      }
      v24 += 7;
      BOOL v20 = v25++ >= 9;
      if (v20)
      {
        LODWORD(v26) = 0;
        goto LABEL_36;
      }
    }
    *(void *)&v7[*v10] = 1;
LABEL_34:
    if (*(void *)&v7[*v10]) {
      LODWORD(v26) = 0;
    }
LABEL_36:
    v11 = 0;
    self->_signalType = v26;
  }
  while (*(void *)&v7[*v8] < *(void *)&v7[*v9]);
  if (v11)
  {
    CCSetError();
  }
  else
  {
LABEL_41:
    if (!*(void *)&v7[*v10])
    {
      BOOL v35 = 1;
      goto LABEL_45;
    }
LABEL_42:
    v33 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v33);
    v34 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v35 = 0;
LABEL_45:

  return v35;
}

- (CCRadioStationContent)initWithName:(id)a3 callSign:(id)a4 frequency:(id)a5 channel:(id)a6 signalType:(unsigned int)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v17 = objc_opt_new();
  if (!v13)
  {
    id v19 = 0;
LABEL_5:
    v30 = self;
    if (v14)
    {
      objc_opt_class();
      int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      id v21 = v19;

      if (!IsInstanceOfExpectedClass) {
        goto LABEL_11;
      }
      CCPBDataWriterWriteStringField();
      if (!v15)
      {
LABEL_8:
        id v19 = v21;
        if (v16) {
          goto LABEL_9;
        }
        goto LABEL_16;
      }
    }
    else
    {
      id v21 = v19;
      if (!v15) {
        goto LABEL_8;
      }
    }
    objc_opt_class();
    int v24 = CCValidateIsInstanceOfExpectedClass();
    id v19 = v21;

    if (!v24)
    {
LABEL_20:
      CCSetError();
      v23 = 0;
      goto LABEL_21;
    }
    CCPBDataWriterWriteStringField();
    if (v16)
    {
LABEL_9:
      objc_opt_class();
      int v22 = CCValidateIsInstanceOfExpectedClass();
      id v21 = v19;

      if (v22)
      {
        CCPBDataWriterWriteStringField();
LABEL_17:
        if (!a7)
        {
          id v19 = v21;
          goto LABEL_23;
        }
        int v25 = CCValidateEnumField();
        id v19 = v21;

        if (v25)
        {
          CCPBDataWriterWriteUint32Field();
LABEL_23:
          uint64_t v26 = [v17 immutableData];
          uint64_t v27 = [(CCItemMessage *)v30 initWithData:v26 error:a8];

          self = v27;
          v23 = v27;
          goto LABEL_24;
        }
        goto LABEL_20;
      }
LABEL_11:
      CCSetError();
      v23 = 0;
      id v19 = v21;
LABEL_21:
      self = v30;
      goto LABEL_24;
    }
LABEL_16:
    id v21 = v19;
    goto LABEL_17;
  }
  objc_opt_class();
  int v18 = CCValidateIsInstanceOfExpectedClass();
  id v19 = 0;
  if (v18)
  {
    CCPBDataWriterWriteStringField();
    goto LABEL_5;
  }
  CCSetError();
  v23 = 0;
LABEL_24:

  return v23;
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
  if ((unsigned __int16)(a3 + 16470) > 7u) {
    return 0;
  }
  else {
    return *(&off_26539C9B0 + (unsigned __int16)(a3 + 16470));
  }
}

+ (unsigned)itemType
{
  return -16470;
}

@end