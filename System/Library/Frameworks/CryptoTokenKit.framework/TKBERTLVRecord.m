@interface TKBERTLVRecord
+ (NSData)dataForTag:(TKTLVTag)tag;
+ (id)parseFromDataSource:(id)a3;
+ (id)zuluDateFormatter;
+ (unint64_t)encodeNumber:(unint64_t)a3 into:(char *)a4;
- (TKBERTLVRecord)initWithPropertyList:(id)a3;
- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag records:(NSArray *)records;
- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag value:(NSData *)value;
- (id)propertyList;
@end

@implementation TKBERTLVRecord

- (id)propertyList
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(TKTLVRecord *)self tag];
  v4 = 0;
  if (v3 > 23)
  {
    switch(v3)
    {
      case 24:
        id v30 = [NSString alloc];
        id v31 = [(TKTLVRecord *)self value];
        uint64_t v32 = [v31 bytes];
        v33 = [(TKTLVRecord *)self value];
        v9 = objc_msgSend(v30, "initWithBytes:length:encoding:", v32, objc_msgSend(v33, "length"), 4);

        if (!v9)
        {
          v4 = 0;
          goto LABEL_46;
        }
        v34 = [(id)objc_opt_class() zuluDateFormatter];
        v4 = [v34 dateFromString:v9];
        break;
      case 48:
        v9 = [MEMORY[0x1E4F1CA48] array];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        v35 = [(TKTLVRecord *)self value];
        v34 = +[TKTLVRecord sequenceOfRecordsFromData:v35];

        uint64_t v36 = [v34 countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (!v36)
        {
LABEL_37:

          v4 = [MEMORY[0x1E4F1C978] arrayWithArray:v9];
          goto LABEL_46;
        }
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v54;
LABEL_31:
        uint64_t v39 = 0;
        while (1)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v34);
          }
          v4 = [*(id *)(*((void *)&v53 + 1) + 8 * v39) propertyList];
          if (!v4) {
            break;
          }
          [v9 addObject:v4];

          if (v37 == ++v39)
          {
            uint64_t v37 = [v34 countByEnumeratingWithState:&v53 objects:v58 count:16];
            if (v37) {
              goto LABEL_31;
            }
            goto LABEL_37;
          }
        }
        break;
      case 49:
        v9 = [MEMORY[0x1E4F1CA48] array];
        v10 = [MEMORY[0x1E4F1CA48] array];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        v11 = [(TKTLVRecord *)self value];
        v12 = +[TKTLVRecord sequenceOfRecordsFromData:v11];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v50;
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v50 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [*(id *)(*((void *)&v49 + 1) + 8 * i) value];
              v18 = +[TKTLVRecord sequenceOfRecordsFromData:v17];

              v19 = [v18 objectAtIndexedSubscript:0];
              v20 = [v19 propertyList];

              v21 = [v18 objectAtIndexedSubscript:1];
              v22 = [v21 propertyList];

              if (v20) {
                BOOL v23 = v22 == 0;
              }
              else {
                BOOL v23 = 1;
              }
              if (v23)
              {

                v4 = 0;
                goto LABEL_39;
              }
              [v9 addObject:v20];
              [v10 addObject:v22];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v49 objects:v57 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9];
LABEL_39:

        goto LABEL_46;
      default:
        goto LABEL_47;
    }

LABEL_46:
    goto LABEL_47;
  }
  switch(v3)
  {
    case 1:
      id v5 = [(TKTLVRecord *)self value];
      v6 = (unsigned char *)[v5 bytes];

      v7 = (id *)MEMORY[0x1E4F1CFD0];
      if (!*v6) {
        v7 = (id *)MEMORY[0x1E4F1CFC8];
      }
      id v8 = *v7;
      goto LABEL_44;
    case 2:
      v24 = [(TKTLVRecord *)self value];
      unint64_t v25 = [v24 length];

      if (v25 <= 8)
      {
        id v40 = [(TKTLVRecord *)self value];
        v41 = (unsigned __int8 *)[v40 bytes];

        for (uint64_t j = (uint64_t)(char)*v41 >> 7; ; uint64_t j = v47 | (unint64_t)(j << 8))
        {
          id v43 = [(TKTLVRecord *)self value];
          uint64_t v44 = [v43 bytes];
          v45 = [(TKTLVRecord *)self value];
          unint64_t v46 = v44 + [v45 length];

          if ((unint64_t)v41 >= v46) {
            break;
          }
          unsigned int v47 = *v41++;
        }
        id v8 = [NSNumber numberWithLongLong:j];
LABEL_44:
        v4 = v8;
      }
      else
      {
        v4 = 0;
      }
      break;
    case 4:
      id v8 = [(TKTLVRecord *)self value];
      goto LABEL_44;
    case 5:
      id v8 = [MEMORY[0x1E4F1CA98] null];
      goto LABEL_44;
    case 12:
      id v26 = [NSString alloc];
      id v27 = [(TKTLVRecord *)self value];
      uint64_t v28 = [v27 bytes];
      v29 = [(TKTLVRecord *)self value];
      v4 = objc_msgSend(v26, "initWithBytes:length:encoding:", v28, objc_msgSend(v29, "length"), 4);

      break;
    default:
      break;
  }
LABEL_47:

  return v4;
}

+ (id)parseFromDataSource:(id)a3
{
  id v4 = a3;
  if (![v4 bytesSafeToRead:1]) {
    goto LABEL_17;
  }
  uint64_t v5 = [v4 ptr];
  unsigned int v6 = [v4 fetchByte];
  unint64_t v7 = v6;
  if ((~v6 & 0x1FLL) == 0)
  {
    while (!HIBYTE(v7) && [v4 bytesSafeToRead:1])
    {
      unsigned int v8 = [v4 fetchByte];
      unint64_t v7 = v8 | (v7 << 8);
      if ((v8 & 0x80) == 0) {
        goto LABEL_6;
      }
    }
    goto LABEL_17;
  }
LABEL_6:
  if (![v4 bytesSafeToRead:1]) {
    goto LABEL_17;
  }
  unsigned int v9 = [v4 fetchByte];
  uint64_t v10 = v9;
  if ((v9 & 0x80) == 0)
  {
LABEL_8:
    v11 = [v4 fetchDataWithLength:v10];
    if (v11)
    {
      v17.receiver = a1;
      v17.super_class = (Class)&OBJC_METACLASS___TKBERTLVRecord;
      id v12 = objc_msgSendSuper2(&v17, sel_alloc);
      uint64_t v13 = [v4 dataFromPtr:v5];
      uint64_t v14 = (void *)[v12 initWithTag:v7 value:v11 data:v13];
    }
    else
    {
      uint64_t v14 = 0;
    }

    goto LABEL_18;
  }
  uint64_t v14 = 0;
  if (v9 != 128 && v9 <= 0x88)
  {
    uint64_t v15 = v9 & 0x7F;
    if (!v15)
    {
      uint64_t v10 = 0;
      goto LABEL_8;
    }
    uint64_t v10 = 0;
    while ([v4 bytesSafeToRead:1])
    {
      --v15;
      uint64_t v10 = [v4 fetchByte] | (unint64_t)(v10 << 8);
      if (!v15) {
        goto LABEL_8;
      }
    }
LABEL_17:
    uint64_t v14 = 0;
  }
LABEL_18:

  return v14;
}

- (TKBERTLVRecord)initWithPropertyList:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((id)*MEMORY[0x1E4F1CFD0] != v4 && *MEMORY[0x1E4F1CFC8] != (void)v4)
    {
      uint64_t v11 = [v4 longLongValue];
      uint64_t v12 = v11;
      uint64_t v13 = -9;
      uint64_t v14 = 56;
      do
      {
        unint64_t v15 = v11 >> v14;
        ++v13;
        if (!v14) {
          break;
        }
        v14 -= 8;
      }
      while (v15 - 1 > 0xFD);
      uint64_t v16 = ((v15 >> 7) & 1 ^ ((unint64_t)v11 >> 63)) - v13;
      objc_super v17 = [MEMORY[0x1E4F1CA58] dataWithLength:v16];
      if (v16 >= 1)
      {
        uint64_t v18 = 0;
        char v19 = 8 * v16 - 8;
        do
        {
          *(unsigned char *)([v17 mutableBytes] + v18++) = v12 >> v19;
          v19 -= 8;
        }
        while (v16 != v18);
      }
      uint64_t v10 = [[TKBERTLVRecord alloc] initWithTag:2 value:v17];

      goto LABEL_16;
    }
    LOBYTE(v48) = [v4 BOOLValue];
    unsigned int v6 = [TKBERTLVRecord alloc];
    unint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v48 length:1];
    unsigned int v8 = [(TKBERTLVRecord *)v6 initWithTag:1 value:v7];

LABEL_22:
    self = v8;
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    uint64_t v10 = [[TKBERTLVRecord alloc] initWithTag:4 value:v9];

LABEL_16:
    self = v10;
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = (void *)MEMORY[0x1E4F1C9B8];
    id v21 = v4;
    uint64_t v22 = [v21 UTF8String];
    uint64_t v23 = [v21 lengthOfBytesUsingEncoding:4];

    v24 = [v20 dataWithBytes:v22 length:v23];
    unint64_t v25 = [TKBERTLVRecord alloc];
    uint64_t v26 = 12;
LABEL_21:
    unsigned int v8 = [(TKBERTLVRecord *)v25 initWithTag:v26 value:v24];

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = [TKBERTLVRecord alloc];
    v24 = [MEMORY[0x1E4F1C9B8] data];
    unint64_t v25 = v27;
    uint64_t v26 = 5;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = [(id)objc_opt_class() zuluDateFormatter];
    id v31 = [v30 stringFromDate:v4];

    uint64_t v32 = (void *)MEMORY[0x1E4F1C9B8];
    id v33 = v31;
    v34 = objc_msgSend(v32, "dataWithBytes:length:", objc_msgSend(v33, "UTF8String"), objc_msgSend(v33, "lengthOfBytesUsingEncoding:", 4));
    v35 = [[TKBERTLVRecord alloc] initWithTag:24 value:v34];

LABEL_27:
    self = v35;
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v36 = v4;
    uint64_t v37 = [MEMORY[0x1E4F1CA48] array];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v38 = v36;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v55 != v40) {
            objc_enumerationMutation(v38);
          }
          v42 = [[TKBERTLVRecord alloc] initWithPropertyList:*(void *)(*((void *)&v54 + 1) + 8 * i)];
          if (!v42)
          {

            goto LABEL_44;
          }
          [v37 addObject:v42];
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v54 objects:v58 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }

    v35 = [[TKBERTLVRecord alloc] initWithTag:48 records:v37];
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_44;
  }
  id v43 = v4;
  uint64_t v48 = 0;
  long long v49 = &v48;
  uint64_t v50 = 0x3032000000;
  long long v51 = __Block_byref_object_copy_;
  long long v52 = __Block_byref_object_dispose_;
  id v53 = [MEMORY[0x1E4F1CA48] array];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __55__TKBERTLVRecord_TKPropertyList__initWithPropertyList___block_invoke;
  v47[3] = &unk_1E63C80B8;
  v47[4] = &v48;
  [v43 enumerateKeysAndObjectsUsingBlock:v47];
  uint64_t v44 = v49[5];
  if (v44)
  {
    v45 = [TKBERTLVRecord alloc];
    unint64_t v46 = [(TKBERTLVRecord *)v45 initWithTag:49 records:v49[5]];

    self = v46;
  }
  _Block_object_dispose(&v48, 8);

  if (!v44)
  {
LABEL_44:
    uint64_t v28 = 0;
    goto LABEL_24;
  }
LABEL_23:
  self = self;
  uint64_t v28 = self;
LABEL_24:

  return v28;
}

- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag records:(NSArray *)records
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = records;
  unint64_t v7 = [MEMORY[0x1E4F1CA58] data];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v8 = v6;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "data", (void)v16);
        [v7 appendData:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(TKBERTLVRecord *)self initWithTag:tag value:v7];
  return v14;
}

- (TKBERTLVRecord)initWithTag:(TKTLVTag)tag value:(NSData *)value
{
  v15[1] = *MEMORY[0x1E4F143B8];
  unsigned int v6 = value;
  unint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithBytes:length:", &v14, objc_msgSend((id)objc_opt_class(), "encodeNumber:into:", tag, &v14));
  unint64_t v8 = [(NSData *)v6 length];
  if (v8 > 0x7F)
  {
    uint64_t v10 = [(id)objc_opt_class() encodeNumber:v8 into:v15];
    uint64_t v9 = v10 + 1;
    LOBYTE(v8) = v10 ^ 0x80;
  }
  else
  {
    uint64_t v9 = 1;
  }
  char v14 = v8;
  [v7 appendBytes:&v14 length:v9];
  [v7 appendData:v6];
  v13.receiver = self;
  v13.super_class = (Class)TKBERTLVRecord;
  uint64_t v11 = [(TKTLVRecord *)&v13 initWithTag:tag value:v6 data:v7];

  return v11;
}

+ (unint64_t)encodeNumber:(unint64_t)a3 into:(char *)a4
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"BER-TLV tag number must not be 0"];
  }
  unint64_t result = 0;
  int v7 = 0;
  for (uint64_t i = 56; i != -8; i -= 8)
  {
    v7 |= ((255 << i) & a3) != 0;
    if (v7)
    {
      *a4++ = ((255 << i) & a3) >> i;
      ++result;
    }
  }
  return result;
}

+ (NSData)dataForTag:(TKTLVTag)tag
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 encodeNumber:tag into:v6];
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:v3];

  return (NSData *)v4;
}

+ (id)zuluDateFormatter
{
  if (zuluDateFormatter_onceToken != -1) {
    dispatch_once(&zuluDateFormatter_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)zuluDateFormatter_formatter;

  return v2;
}

uint64_t __51__TKBERTLVRecord_TKPropertyList__zuluDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)zuluDateFormatter_formatter;
  zuluDateFormatter_formatter = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [(id)zuluDateFormatter_formatter setTimeZone:v2];

  uint64_t v3 = [MEMORY[0x1E4F1CA20] systemLocale];
  [(id)zuluDateFormatter_formatter setLocale:v3];

  id v4 = (void *)zuluDateFormatter_formatter;

  return [v4 setDateFormat:@"yyyyMMddHHmmss.SSSS'Z'"];
}

void __55__TKBERTLVRecord_TKPropertyList__initWithPropertyList___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [[TKBERTLVRecord alloc] initWithPropertyList:v8];

  uint64_t v10 = [[TKBERTLVRecord alloc] initWithPropertyList:v7];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    objc_super v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    *a4 = 1;
  }
  else
  {
    char v14 = [TKBERTLVRecord alloc];
    v17[0] = v9;
    v17[1] = v10;
    unint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    long long v16 = [(TKBERTLVRecord *)v14 initWithTag:48 records:v15];

    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v16];
  }
}

@end