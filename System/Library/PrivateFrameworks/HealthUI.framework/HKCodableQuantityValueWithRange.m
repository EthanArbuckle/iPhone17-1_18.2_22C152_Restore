@interface HKCodableQuantityValueWithRange
+ (Class)codeType;
- (BOOL)hasQuantityValue;
- (BOOL)hasReferenceRangeMax;
- (BOOL)hasReferenceRangeMin;
- (BOOL)hasTextualValue;
- (BOOL)hasValueTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)quantityValue;
- (HKCodableQuantity)referenceRangeMax;
- (HKCodableQuantity)referenceRangeMin;
- (NSMutableArray)codes;
- (NSString)textualValue;
- (NSString)valueTitle;
- (id)codeAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)codesCount;
- (unint64_t)hash;
- (void)addCode:(id)a3;
- (void)clearCodes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCodes:(id)a3;
- (void)setQuantityValue:(id)a3;
- (void)setReferenceRangeMax:(id)a3;
- (void)setReferenceRangeMin:(id)a3;
- (void)setTextualValue:(id)a3;
- (void)setValueTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableQuantityValueWithRange

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

- (BOOL)hasQuantityValue
{
  return self->_quantityValue != 0;
}

- (BOOL)hasTextualValue
{
  return self->_textualValue != 0;
}

- (BOOL)hasReferenceRangeMin
{
  return self->_referenceRangeMin != 0;
}

- (BOOL)hasReferenceRangeMax
{
  return self->_referenceRangeMax != 0;
}

- (BOOL)hasValueTitle
{
  return self->_valueTitle != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableQuantityValueWithRange;
  id v4 = [(HKCodableQuantityValueWithRange *)&v8 description];
  v5 = [(HKCodableQuantityValueWithRange *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_codes count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_codes, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v5 = self->_codes;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"code"];
  }
  quantityValue = self->_quantityValue;
  if (quantityValue)
  {
    v12 = [(HKCodableQuantity *)quantityValue dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"quantityValue"];
  }
  textualValue = self->_textualValue;
  if (textualValue) {
    [v3 setObject:textualValue forKey:@"textualValue"];
  }
  referenceRangeMin = self->_referenceRangeMin;
  if (referenceRangeMin)
  {
    v15 = [(HKCodableQuantity *)referenceRangeMin dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"referenceRangeMin"];
  }
  referenceRangeMax = self->_referenceRangeMax;
  if (referenceRangeMax)
  {
    v17 = [(HKCodableQuantity *)referenceRangeMax dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"referenceRangeMax"];
  }
  valueTitle = self->_valueTitle;
  if (valueTitle) {
    [v3 setObject:valueTitle forKey:@"valueTitle"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableQuantityValueWithRangeReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_codes;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_quantityValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_textualValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_referenceRangeMin) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_referenceRangeMax) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_valueTitle) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(HKCodableQuantityValueWithRange *)self codesCount])
  {
    [v9 clearCodes];
    unint64_t v4 = [(HKCodableQuantityValueWithRange *)self codesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HKCodableQuantityValueWithRange *)self codeAtIndex:i];
        [v9 addCode:v7];
      }
    }
  }
  if (self->_quantityValue) {
    objc_msgSend(v9, "setQuantityValue:");
  }
  uint64_t v8 = v9;
  if (self->_textualValue)
  {
    objc_msgSend(v9, "setTextualValue:");
    uint64_t v8 = v9;
  }
  if (self->_referenceRangeMin)
  {
    objc_msgSend(v9, "setReferenceRangeMin:");
    uint64_t v8 = v9;
  }
  if (self->_referenceRangeMax)
  {
    objc_msgSend(v9, "setReferenceRangeMax:");
    uint64_t v8 = v9;
  }
  if (self->_valueTitle)
  {
    objc_msgSend(v9, "setValueTitle:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = self->_codes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v10), "copyWithZone:", a3, (void)v23);
        [v5 addCode:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  id v12 = [(HKCodableQuantity *)self->_quantityValue copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  uint64_t v14 = [(NSString *)self->_textualValue copyWithZone:a3];
  uint64_t v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(HKCodableQuantity *)self->_referenceRangeMin copyWithZone:a3];
  v17 = (void *)v5[4];
  v5[4] = v16;

  id v18 = [(HKCodableQuantity *)self->_referenceRangeMax copyWithZone:a3];
  v19 = (void *)v5[3];
  v5[3] = v18;

  uint64_t v20 = [(NSString *)self->_valueTitle copyWithZone:a3];
  long long v21 = (void *)v5[6];
  v5[6] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((codes = self->_codes, !((unint64_t)codes | v4[1]))
     || -[NSMutableArray isEqual:](codes, "isEqual:"))
    && ((quantityValue = self->_quantityValue, !((unint64_t)quantityValue | v4[2]))
     || -[HKCodableQuantity isEqual:](quantityValue, "isEqual:"))
    && ((textualValue = self->_textualValue, !((unint64_t)textualValue | v4[5]))
     || -[NSString isEqual:](textualValue, "isEqual:"))
    && ((referenceRangeMin = self->_referenceRangeMin, !((unint64_t)referenceRangeMin | v4[4]))
     || -[HKCodableQuantity isEqual:](referenceRangeMin, "isEqual:"))
    && ((referenceRangeMax = self->_referenceRangeMax, !((unint64_t)referenceRangeMax | v4[3]))
     || -[HKCodableQuantity isEqual:](referenceRangeMax, "isEqual:")))
  {
    valueTitle = self->_valueTitle;
    if ((unint64_t)valueTitle | v4[6]) {
      char v11 = -[NSString isEqual:](valueTitle, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_codes hash];
  unint64_t v4 = [(HKCodableQuantity *)self->_quantityValue hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_textualValue hash];
  unint64_t v6 = v4 ^ v5 ^ [(HKCodableQuantity *)self->_referenceRangeMin hash];
  unint64_t v7 = [(HKCodableQuantity *)self->_referenceRangeMax hash];
  return v6 ^ v7 ^ [(NSString *)self->_valueTitle hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (id *)a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v4[1];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        -[HKCodableQuantityValueWithRange addCode:](self, "addCode:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  quantityValue = self->_quantityValue;
  id v11 = v4[2];
  if (quantityValue)
  {
    if (v11) {
      -[HKCodableQuantity mergeFrom:](quantityValue, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[HKCodableQuantityValueWithRange setQuantityValue:](self, "setQuantityValue:");
  }
  if (v4[5]) {
    -[HKCodableQuantityValueWithRange setTextualValue:](self, "setTextualValue:");
  }
  referenceRangeMin = self->_referenceRangeMin;
  id v13 = v4[4];
  if (referenceRangeMin)
  {
    if (v13) {
      -[HKCodableQuantity mergeFrom:](referenceRangeMin, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[HKCodableQuantityValueWithRange setReferenceRangeMin:](self, "setReferenceRangeMin:");
  }
  referenceRangeMax = self->_referenceRangeMax;
  id v15 = v4[3];
  if (referenceRangeMax)
  {
    if (v15) {
      -[HKCodableQuantity mergeFrom:](referenceRangeMax, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[HKCodableQuantityValueWithRange setReferenceRangeMax:](self, "setReferenceRangeMax:");
  }
  if (v4[6]) {
    -[HKCodableQuantityValueWithRange setValueTitle:](self, "setValueTitle:");
  }
}

- (NSMutableArray)codes
{
  return self->_codes;
}

- (void)setCodes:(id)a3
{
}

- (HKCodableQuantity)quantityValue
{
  return self->_quantityValue;
}

- (void)setQuantityValue:(id)a3
{
}

- (NSString)textualValue
{
  return self->_textualValue;
}

- (void)setTextualValue:(id)a3
{
}

- (HKCodableQuantity)referenceRangeMin
{
  return self->_referenceRangeMin;
}

- (void)setReferenceRangeMin:(id)a3
{
}

- (HKCodableQuantity)referenceRangeMax
{
  return self->_referenceRangeMax;
}

- (void)setReferenceRangeMax:(id)a3
{
}

- (NSString)valueTitle
{
  return self->_valueTitle;
}

- (void)setValueTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTitle, 0);
  objc_storeStrong((id *)&self->_textualValue, 0);
  objc_storeStrong((id *)&self->_referenceRangeMin, 0);
  objc_storeStrong((id *)&self->_referenceRangeMax, 0);
  objc_storeStrong((id *)&self->_quantityValue, 0);
  objc_storeStrong((id *)&self->_codes, 0);
}

@end