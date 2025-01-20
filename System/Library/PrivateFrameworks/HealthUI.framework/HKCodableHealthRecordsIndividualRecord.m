@interface HKCodableHealthRecordsIndividualRecord
+ (Class)codeType;
+ (Class)valueWithRangeType;
- (BOOL)hasDateData;
- (BOOL)hasProviderURI;
- (BOOL)hasRecordTitle;
- (BOOL)hasRecordUUID;
- (BOOL)hasTextualValue;
- (BOOL)hasUcumUnitString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)codes;
- (NSMutableArray)valueWithRanges;
- (NSString)providerURI;
- (NSString)recordTitle;
- (NSString)recordUUID;
- (NSString)textualValue;
- (NSString)ucumUnitString;
- (double)dateData;
- (id)codeAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valueWithRangeAtIndex:(unint64_t)a3;
- (unint64_t)codesCount;
- (unint64_t)hash;
- (unint64_t)valueWithRangesCount;
- (void)addCode:(id)a3;
- (void)addValueWithRange:(id)a3;
- (void)clearCodes;
- (void)clearValueWithRanges;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCodes:(id)a3;
- (void)setDateData:(double)a3;
- (void)setHasDateData:(BOOL)a3;
- (void)setProviderURI:(id)a3;
- (void)setRecordTitle:(id)a3;
- (void)setRecordUUID:(id)a3;
- (void)setTextualValue:(id)a3;
- (void)setUcumUnitString:(id)a3;
- (void)setValueWithRanges:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableHealthRecordsIndividualRecord

- (void)clearCodes
{
}

- (void)addCode:(id)a3
{
  id v4 = a3;
  codes = self->_codes;
  id v8 = v4;
  if (!codes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_codes;
    self->_codes = v6;

    id v4 = v8;
    codes = self->_codes;
  }
  [(NSMutableArray *)codes addObject:v4];
}

- (unint64_t)codesCount
{
  return [(NSMutableArray *)self->_codes count];
}

- (id)codeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_codes objectAtIndex:a3];
}

+ (Class)codeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRecordTitle
{
  return self->_recordTitle != 0;
}

- (void)setDateData:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dateData = a3;
}

- (void)setHasDateData:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateData
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearValueWithRanges
{
}

- (void)addValueWithRange:(id)a3
{
  id v4 = a3;
  valueWithRanges = self->_valueWithRanges;
  id v8 = v4;
  if (!valueWithRanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_valueWithRanges;
    self->_valueWithRanges = v6;

    id v4 = v8;
    valueWithRanges = self->_valueWithRanges;
  }
  [(NSMutableArray *)valueWithRanges addObject:v4];
}

- (unint64_t)valueWithRangesCount
{
  return [(NSMutableArray *)self->_valueWithRanges count];
}

- (id)valueWithRangeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_valueWithRanges objectAtIndex:a3];
}

+ (Class)valueWithRangeType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTextualValue
{
  return self->_textualValue != 0;
}

- (BOOL)hasUcumUnitString
{
  return self->_ucumUnitString != 0;
}

- (BOOL)hasProviderURI
{
  return self->_providerURI != 0;
}

- (BOOL)hasRecordUUID
{
  return self->_recordUUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableHealthRecordsIndividualRecord;
  id v4 = [(HKCodableHealthRecordsIndividualRecord *)&v8 description];
  v5 = [(HKCodableHealthRecordsIndividualRecord *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_codes count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_codes, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v5 = self->_codes;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v29 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"code"];
  }
  recordTitle = self->_recordTitle;
  if (recordTitle) {
    [v3 setObject:recordTitle forKey:@"recordTitle"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithDouble:self->_dateData];
    [v3 setObject:v12 forKey:@"dateData"];
  }
  if ([(NSMutableArray *)self->_valueWithRanges count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_valueWithRanges, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v14 = self->_valueWithRanges;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (void)v25);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"valueWithRange"];
  }
  textualValue = self->_textualValue;
  if (textualValue) {
    [v3 setObject:textualValue forKey:@"textualValue"];
  }
  ucumUnitString = self->_ucumUnitString;
  if (ucumUnitString) {
    [v3 setObject:ucumUnitString forKey:@"ucumUnitString"];
  }
  providerURI = self->_providerURI;
  if (providerURI) {
    [v3 setObject:providerURI forKey:@"providerURI"];
  }
  recordUUID = self->_recordUUID;
  if (recordUUID) {
    [v3 setObject:recordUUID forKey:@"recordUUID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHealthRecordsIndividualRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_codes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_recordTitle) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_valueWithRanges;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_textualValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_ucumUnitString) {
    PBDataWriterWriteStringField();
  }
  if (self->_providerURI) {
    PBDataWriterWriteStringField();
  }
  if (self->_recordUUID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v13 = a3;
  if ([(HKCodableHealthRecordsIndividualRecord *)self codesCount])
  {
    [v13 clearCodes];
    unint64_t v4 = [(HKCodableHealthRecordsIndividualRecord *)self codesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableHealthRecordsIndividualRecord *)self codeAtIndex:i];
        [v13 addCode:v7];
      }
    }
  }
  if (self->_recordTitle) {
    objc_msgSend(v13, "setRecordTitle:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v13 + 1) = *(void *)&self->_dateData;
    *((unsigned char *)v13 + 72) |= 1u;
  }
  if ([(HKCodableHealthRecordsIndividualRecord *)self valueWithRangesCount])
  {
    [v13 clearValueWithRanges];
    unint64_t v8 = [(HKCodableHealthRecordsIndividualRecord *)self valueWithRangesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(HKCodableHealthRecordsIndividualRecord *)self valueWithRangeAtIndex:j];
        [v13 addValueWithRange:v11];
      }
    }
  }
  if (self->_textualValue) {
    objc_msgSend(v13, "setTextualValue:");
  }
  uint64_t v12 = v13;
  if (self->_ucumUnitString)
  {
    objc_msgSend(v13, "setUcumUnitString:");
    uint64_t v12 = v13;
  }
  if (self->_providerURI)
  {
    objc_msgSend(v13, "setProviderURI:");
    uint64_t v12 = v13;
  }
  if (self->_recordUUID)
  {
    objc_msgSend(v13, "setRecordUUID:");
    uint64_t v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = self->_codes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addCode:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_recordTitle copyWithZone:a3];
  id v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_dateData;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v14 = self->_valueWithRanges;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v18), "copyWithZone:", a3, (void)v29);
        [(id)v5 addValueWithRange:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_textualValue copyWithZone:a3];
  long long v21 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v20;

  uint64_t v22 = [(NSString *)self->_ucumUnitString copyWithZone:a3];
  v23 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v22;

  uint64_t v24 = [(NSString *)self->_providerURI copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v24;

  uint64_t v26 = [(NSString *)self->_recordUUID copyWithZone:a3];
  long long v27 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v26;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  codes = self->_codes;
  if ((unint64_t)codes | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](codes, "isEqual:")) {
      goto LABEL_21;
    }
  }
  recordTitle = self->_recordTitle;
  if ((unint64_t)recordTitle | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](recordTitle, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_dateData != *((double *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
LABEL_21:
    char v12 = 0;
    goto LABEL_22;
  }
  valueWithRanges = self->_valueWithRanges;
  if ((unint64_t)valueWithRanges | *((void *)v4 + 8)
    && !-[NSMutableArray isEqual:](valueWithRanges, "isEqual:"))
  {
    goto LABEL_21;
  }
  textualValue = self->_textualValue;
  if ((unint64_t)textualValue | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](textualValue, "isEqual:")) {
      goto LABEL_21;
    }
  }
  ucumUnitString = self->_ucumUnitString;
  if ((unint64_t)ucumUnitString | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](ucumUnitString, "isEqual:")) {
      goto LABEL_21;
    }
  }
  providerURI = self->_providerURI;
  if ((unint64_t)providerURI | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](providerURI, "isEqual:")) {
      goto LABEL_21;
    }
  }
  recordUUID = self->_recordUUID;
  if ((unint64_t)recordUUID | *((void *)v4 + 5)) {
    char v12 = -[NSString isEqual:](recordUUID, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_codes hash];
  NSUInteger v4 = [(NSString *)self->_recordTitle hash];
  if (*(unsigned char *)&self->_has)
  {
    double dateData = self->_dateData;
    double v7 = -dateData;
    if (dateData >= 0.0) {
      double v7 = self->_dateData;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  uint64_t v10 = v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_valueWithRanges hash];
  NSUInteger v11 = [(NSString *)self->_textualValue hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_ucumUnitString hash];
  NSUInteger v13 = v10 ^ v12 ^ [(NSString *)self->_providerURI hash];
  return v13 ^ [(NSString *)self->_recordUUID hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HKCodableHealthRecordsIndividualRecord *)self addCode:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 4)) {
    -[HKCodableHealthRecordsIndividualRecord setRecordTitle:](self, "setRecordTitle:");
  }
  if (*((unsigned char *)v4 + 72))
  {
    self->_double dateData = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 8);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[HKCodableHealthRecordsIndividualRecord addValueWithRange:](self, "addValueWithRange:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 6)) {
    -[HKCodableHealthRecordsIndividualRecord setTextualValue:](self, "setTextualValue:");
  }
  if (*((void *)v4 + 7)) {
    -[HKCodableHealthRecordsIndividualRecord setUcumUnitString:](self, "setUcumUnitString:");
  }
  if (*((void *)v4 + 3)) {
    -[HKCodableHealthRecordsIndividualRecord setProviderURI:](self, "setProviderURI:");
  }
  if (*((void *)v4 + 5)) {
    -[HKCodableHealthRecordsIndividualRecord setRecordUUID:](self, "setRecordUUID:");
  }
}

- (NSMutableArray)codes
{
  return self->_codes;
}

- (void)setCodes:(id)a3
{
}

- (NSString)recordTitle
{
  return self->_recordTitle;
}

- (void)setRecordTitle:(id)a3
{
}

- (double)dateData
{
  return self->_dateData;
}

- (NSMutableArray)valueWithRanges
{
  return self->_valueWithRanges;
}

- (void)setValueWithRanges:(id)a3
{
}

- (NSString)textualValue
{
  return self->_textualValue;
}

- (void)setTextualValue:(id)a3
{
}

- (NSString)ucumUnitString
{
  return self->_ucumUnitString;
}

- (void)setUcumUnitString:(id)a3
{
}

- (NSString)providerURI
{
  return self->_providerURI;
}

- (void)setProviderURI:(id)a3
{
}

- (NSString)recordUUID
{
  return self->_recordUUID;
}

- (void)setRecordUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueWithRanges, 0);
  objc_storeStrong((id *)&self->_ucumUnitString, 0);
  objc_storeStrong((id *)&self->_textualValue, 0);
  objc_storeStrong((id *)&self->_recordUUID, 0);
  objc_storeStrong((id *)&self->_recordTitle, 0);
  objc_storeStrong((id *)&self->_providerURI, 0);
  objc_storeStrong((id *)&self->_codes, 0);
}

@end