@interface HDCodableMedicalUserDomainConcept
- (BOOL)hasCountryCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)countryCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)categoryTypes;
- (int64_t)categoryTypesAtIndex:(unint64_t)a3;
- (unint64_t)categoryTypesCount;
- (unint64_t)hash;
- (void)addCategoryTypes:(int64_t)a3;
- (void)clearCategoryTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCategoryTypes:(int64_t *)a3 count:(unint64_t)a4;
- (void)setCountryCode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicalUserDomainConcept

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HDCodableMedicalUserDomainConcept;
  [(HDCodableMedicalUserDomainConcept *)&v3 dealloc];
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (unint64_t)categoryTypesCount
{
  return self->_categoryTypes.count;
}

- (int64_t)categoryTypes
{
  return self->_categoryTypes.list;
}

- (void)clearCategoryTypes
{
}

- (void)addCategoryTypes:(int64_t)a3
{
}

- (int64_t)categoryTypesAtIndex:(unint64_t)a3
{
  p_categoryTypes = &self->_categoryTypes;
  unint64_t count = self->_categoryTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_categoryTypes->list[a3];
}

- (void)setCategoryTypes:(int64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicalUserDomainConcept;
  v4 = [(HDCodableMedicalUserDomainConcept *)&v8 description];
  v5 = [(HDCodableMedicalUserDomainConcept *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  countryCode = self->_countryCode;
  if (countryCode) {
    [v3 setObject:countryCode forKey:@"countryCode"];
  }
  v6 = PBRepeatedInt64NSArray();
  [v4 setObject:v6 forKey:@"categoryTypes"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicalUserDomainConceptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_countryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  p_categoryTypes = &self->_categoryTypes;
  if (p_categoryTypes->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_categoryTypes->count);
  }
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if (self->_countryCode) {
    objc_msgSend(v7, "setCountryCode:");
  }
  if ([(HDCodableMedicalUserDomainConcept *)self categoryTypesCount])
  {
    [v7 clearCategoryTypes];
    unint64_t v4 = [(HDCodableMedicalUserDomainConcept *)self categoryTypesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addCategoryTypes:", -[HDCodableMedicalUserDomainConcept categoryTypesAtIndex:](self, "categoryTypesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_countryCode copyWithZone:a3];
  id v7 = (void *)v5[4];
  v5[4] = v6;

  PBRepeatedInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((countryCode = self->_countryCode, !((unint64_t)countryCode | v4[4]))
     || -[NSString isEqual:](countryCode, "isEqual:")))
  {
    char IsEqual = PBRepeatedInt64IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v2 = [(NSString *)self->_countryCode hash];
  return PBRepeatedInt64Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  objc_super v8 = v4;
  if (v4[4])
  {
    -[HDCodableMedicalUserDomainConcept setCountryCode:](self, "setCountryCode:");
    unint64_t v4 = v8;
  }
  uint64_t v5 = [v4 categoryTypesCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[HDCodableMedicalUserDomainConcept addCategoryTypes:](self, "addCategoryTypes:", [v8 categoryTypesAtIndex:i]);
  }
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end