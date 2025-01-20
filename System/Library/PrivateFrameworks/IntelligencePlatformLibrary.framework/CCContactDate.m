@interface CCContactDate
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasDay;
- (BOOL)hasMonth;
- (BOOL)hasYear;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCContactDate)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCContactDate)initWithLabel:(id)a3 year:(id)a4 month:(id)a5 day:(id)a6 error:(id *)a7;
- (NSString)label;
- (id)jsonDictionary;
- (unsigned)day;
- (unsigned)month;
- (unsigned)year;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasDay:(BOOL)a3;
- (void)setHasMonth:(BOOL)a3;
- (void)setHasYear:(BOOL)a3;
@end

@implementation CCContactDate

- (void).cxx_destruct
{
}

- (void)setHasDay:(BOOL)a3
{
  self->_hasDay = a3;
}

- (BOOL)hasDay
{
  return self->_hasDay;
}

- (void)setHasMonth:(BOOL)a3
{
  self->_hasMonth = a3;
}

- (BOOL)hasMonth
{
  return self->_hasMonth;
}

- (void)setHasYear:(BOOL)a3
{
  self->_hasYear = a3;
}

- (BOOL)hasYear
{
  return self->_hasYear;
}

- (unsigned)day
{
  return self->_day;
}

- (unsigned)month
{
  return self->_month;
}

- (unsigned)year
{
  return self->_year;
}

- (CCContactDate)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"label"];
    v10 = [v6 objectForKeyedSubscript:@"year"];
    v11 = [v6 objectForKeyedSubscript:@"month"];
    v12 = [v6 objectForKeyedSubscript:@"day"];
    v13 = [[CCContactDate alloc] initWithLabel:v9 year:v10 month:v11 day:v12 error:a4];
  }
  else
  {
    CCSetError();
    v13 = 0;
  }

  return v13;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_label)
  {
    v4 = [(CCContactDate *)self label];
    [v3 setObject:v4 forKeyedSubscript:@"label"];
  }
  if (self->_hasYear)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCContactDate year](self, "year"));
    [v3 setObject:v5 forKeyedSubscript:@"year"];
  }
  if (self->_hasMonth)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCContactDate month](self, "month"));
    [v3 setObject:v6 forKeyedSubscript:@"month"];
  }
  if (self->_hasDay)
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCContactDate day](self, "day"));
    [v3 setObject:v7 forKeyedSubscript:@"day"];
  }
  id v8 = (void *)[v3 copy];

  return v8;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  int v4 = a4;
  v14 = (void (**)(id, void *))a3;
  if (self->_label)
  {
    switch(v4)
    {
      case 19701:
        uint64_t v6 = 19713;
        break;
      case 19705:
        uint64_t v6 = 19769;
        break;
      case 19702:
        uint64_t v6 = 19740;
        break;
      default:
        goto LABEL_9;
    }
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:v6 stringValue:self->_label];
    v14[2](v14, v7);
  }
LABEL_9:
  if (!self->_hasYear) {
    goto LABEL_17;
  }
  switch(v4)
  {
    case 19701:
      uint64_t v8 = 19734;
      break;
    case 19705:
      uint64_t v8 = 19773;
      break;
    case 19702:
      uint64_t v8 = 19737;
      break;
    default:
      goto LABEL_17;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:v8 uint32Value:self->_year];
  v14[2](v14, v9);

LABEL_17:
  if (!self->_hasMonth) {
    goto LABEL_25;
  }
  switch(v4)
  {
    case 19701:
      uint64_t v10 = 19735;
      break;
    case 19705:
      uint64_t v10 = 19774;
      break;
    case 19702:
      uint64_t v10 = 19738;
      break;
    default:
      goto LABEL_25;
  }
  v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:v10 uint32Value:self->_month];
  v14[2](v14, v11);

LABEL_25:
  if (!self->_hasDay) {
    goto LABEL_33;
  }
  switch(v4)
  {
    case 19701:
      uint64_t v12 = 19736;
      break;
    case 19705:
      uint64_t v12 = 19775;
      break;
    case 19702:
      uint64_t v12 = 19739;
      break;
    default:
      goto LABEL_33;
  }
  v13 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:v12 uint32Value:self->_day];
  v14[2](v14, v13);

LABEL_33:
}

- (NSString)label
{
  v2 = (void *)[(NSString *)self->_label copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v6];
  uint64_t v8 = (int *)MEMORY[0x263F317C8];
  v9 = (int *)MEMORY[0x263F317C0];
  uint64_t v10 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v7[*MEMORY[0x263F317C8]] >= *(void *)&v7[*MEMORY[0x263F317C0]]) {
    goto LABEL_60;
  }
  v11 = 0;
  uint64_t v12 = (int *)MEMORY[0x263F317B0];
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
          goto LABEL_61;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v7[*v10] = 1;
LABEL_17:
    if (*(void *)&v7[*v10]) {
      goto LABEL_61;
    }
LABEL_18:
    switch((v16 >> 3))
    {
      case 1u:
        CCPBReaderReadStringNoCopy();
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        label = self->_label;
        self->_label = v21;

        v11 = 0;
        continue;
      case 2u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        while (1)
        {
          uint64_t v26 = *v8;
          unint64_t v27 = *(void *)&v7[v26];
          if (v27 == -1 || v27 >= *(void *)&v7[*v9]) {
            break;
          }
          char v28 = *(unsigned char *)(*(void *)&v7[*v12] + v27);
          *(void *)&v7[v26] = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0) {
            goto LABEL_44;
          }
          v23 += 7;
          BOOL v20 = v24++ >= 9;
          if (v20)
          {
            LODWORD(v25) = 0;
            goto LABEL_46;
          }
        }
        *(void *)&v7[*v10] = 1;
LABEL_44:
        if (*(void *)&v7[*v10]) {
          LODWORD(v25) = 0;
        }
LABEL_46:
        v11 = 0;
        self->_year = v25;
        uint64_t v41 = 16;
        goto LABEL_55;
      case 3u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        while (2)
        {
          uint64_t v32 = *v8;
          unint64_t v33 = *(void *)&v7[v32];
          if (v33 == -1 || v33 >= *(void *)&v7[*v9])
          {
            *(void *)&v7[*v10] = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)&v7[*v12] + v33);
            *(void *)&v7[v32] = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              BOOL v20 = v30++ >= 9;
              if (v20)
              {
                LODWORD(v31) = 0;
                goto LABEL_50;
              }
              continue;
            }
          }
          break;
        }
        if (*(void *)&v7[*v10]) {
          LODWORD(v31) = 0;
        }
LABEL_50:
        v11 = 0;
        self->_month = v31;
        uint64_t v41 = 17;
        goto LABEL_55;
      case 4u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v37 = 0;
        break;
      default:
        if (CCPBReaderSkipValueWithTag())
        {
          v11 = 0;
        }
        else
        {
          v42 = (objc_class *)objc_opt_class();
          NSStringFromClass(v42);
          v50 = self;
          v43 = a4;
          v45 = id v44 = v6;
          v11 = CCSkipFieldErrorForMessage();

          id v6 = v44;
          a4 = v43;
          self = v50;
        }
        continue;
    }
    while (1)
    {
      uint64_t v38 = *v8;
      unint64_t v39 = *(void *)&v7[v38];
      if (v39 == -1 || v39 >= *(void *)&v7[*v9]) {
        break;
      }
      char v40 = *(unsigned char *)(*(void *)&v7[*v12] + v39);
      *(void *)&v7[v38] = v39 + 1;
      v37 |= (unint64_t)(v40 & 0x7F) << v35;
      if ((v40 & 0x80) == 0) {
        goto LABEL_52;
      }
      v35 += 7;
      BOOL v20 = v36++ >= 9;
      if (v20)
      {
        LODWORD(v37) = 0;
        goto LABEL_54;
      }
    }
    *(void *)&v7[*v10] = 1;
LABEL_52:
    if (*(void *)&v7[*v10]) {
      LODWORD(v37) = 0;
    }
LABEL_54:
    v11 = 0;
    self->_day = v37;
    uint64_t v41 = 18;
LABEL_55:
    *((unsigned char *)&self->super.super.isa + v41) = 1;
  }
  while (*(void *)&v7[*v8] < *(void *)&v7[*v9]);
  if (v11)
  {
    CCSetError();
  }
  else
  {
LABEL_60:
    if (!*(void *)&v7[*v10])
    {
      BOOL v48 = 1;
      goto LABEL_64;
    }
LABEL_61:
    v46 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v46);
    v47 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v48 = 0;
LABEL_64:

  return v48;
}

- (CCContactDate)initWithLabel:(id)a3 year:(id)a4 month:(id)a5 day:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  unint64_t v16 = objc_opt_new();
  if (v12)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v18 = 0;
    if (!IsInstanceOfExpectedClass) {
      goto LABEL_16;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v18 = 0;
  }
  if (v13)
  {
    objc_opt_class();
    int v19 = CCValidateIsInstanceOfExpectedClass();
    id v20 = v18;

    if (!v19) {
      goto LABEL_17;
    }
    [v13 unsignedIntValue];
    CCPBDataWriterWriteUint32Field();
    if (!v14) {
      goto LABEL_8;
    }
  }
  else
  {
    id v20 = v18;
    if (!v14)
    {
LABEL_8:
      id v18 = v20;
      if (!v15) {
        goto LABEL_15;
      }
LABEL_13:
      objc_opt_class();
      id v26 = v18;
      int v22 = CCValidateIsInstanceOfExpectedClass();
      id v20 = v18;

      if (v22)
      {
        [v15 unsignedIntValue];
        CCPBDataWriterWriteUint32Field();
        id v18 = v20;
        goto LABEL_15;
      }
LABEL_17:
      CCSetError();
      unsigned int v24 = 0;
      id v18 = v20;
      goto LABEL_18;
    }
  }
  objc_opt_class();
  int v21 = CCValidateIsInstanceOfExpectedClass();
  id v18 = v20;

  if (!v21)
  {
LABEL_16:
    CCSetError();
    unsigned int v24 = 0;
    goto LABEL_18;
  }
  [v14 unsignedIntValue];
  CCPBDataWriterWriteUint32Field();
  if (v15) {
    goto LABEL_13;
  }
LABEL_15:
  char v23 = objc_msgSend(v16, "immutableData", v26);
  self = [(CCItemMessage *)self initWithData:v23 error:a7];

  unsigned int v24 = self;
LABEL_18:

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