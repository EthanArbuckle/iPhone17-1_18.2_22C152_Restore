@interface GEOLPRLicensePlateValidationRule
+ (BOOL)isValid:(id)a3;
+ (Class)impliedPowerTypeKeyType;
+ (Class)impliedVehicleTypeKeyType;
+ (Class)validationRangesType;
- (BOOL)hasMaxLength;
- (BOOL)hasMinLength;
- (BOOL)hasRegularExpression;
- (BOOL)hasValidCharacters;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLPRLicensePlateValidationRule)init;
- (GEOLPRLicensePlateValidationRule)initWithData:(id)a3;
- (GEOLPRLicensePlateValidationRule)initWithDictionary:(id)a3;
- (GEOLPRLicensePlateValidationRule)initWithJSON:(id)a3;
- (NSMutableArray)impliedPowerTypeKeys;
- (NSMutableArray)impliedVehicleTypeKeys;
- (NSMutableArray)validationRanges;
- (NSString)regularExpression;
- (NSString)validCharacters;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)impliedPowerTypeKeyAtIndex:(unint64_t)a3;
- (id)impliedVehicleTypeKeyAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)validationRangesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)impliedPowerTypeKeysCount;
- (unint64_t)impliedVehicleTypeKeysCount;
- (unint64_t)validationRangesCount;
- (unsigned)maxLength;
- (unsigned)minLength;
- (void)_addNoFlagsImpliedPowerTypeKey:(uint64_t)a1;
- (void)_addNoFlagsImpliedVehicleTypeKey:(uint64_t)a1;
- (void)_addNoFlagsValidationRanges:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readImpliedPowerTypeKeys;
- (void)_readImpliedVehicleTypeKeys;
- (void)_readRegularExpression;
- (void)_readValidCharacters;
- (void)_readValidationRanges;
- (void)addImpliedPowerTypeKey:(id)a3;
- (void)addImpliedVehicleTypeKey:(id)a3;
- (void)addValidationRanges:(id)a3;
- (void)clearImpliedPowerTypeKeys;
- (void)clearImpliedVehicleTypeKeys;
- (void)clearValidationRanges;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasMaxLength:(BOOL)a3;
- (void)setHasMinLength:(BOOL)a3;
- (void)setImpliedPowerTypeKeys:(id)a3;
- (void)setImpliedVehicleTypeKeys:(id)a3;
- (void)setMaxLength:(unsigned int)a3;
- (void)setMinLength:(unsigned int)a3;
- (void)setRegularExpression:(id)a3;
- (void)setValidCharacters:(id)a3;
- (void)setValidationRanges:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLPRLicensePlateValidationRule

- (GEOLPRLicensePlateValidationRule)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLPRLicensePlateValidationRule;
  v2 = [(GEOLPRLicensePlateValidationRule *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLPRLicensePlateValidationRule)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLPRLicensePlateValidationRule;
  v3 = [(GEOLPRLicensePlateValidationRule *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRegularExpression
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegularExpression_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRegularExpression
{
  return self->_regularExpression != 0;
}

- (NSString)regularExpression
{
  -[GEOLPRLicensePlateValidationRule _readRegularExpression]((uint64_t)self);
  regularExpression = self->_regularExpression;

  return regularExpression;
}

- (void)setRegularExpression:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_regularExpression, a3);
}

- (unsigned)minLength
{
  return self->_minLength;
}

- (void)setMinLength:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_minLength = a3;
}

- (void)setHasMinLength:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMinLength
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_maxLength = a3;
}

- (void)setHasMaxLength:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasMaxLength
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readValidCharacters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValidCharacters_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasValidCharacters
{
  return self->_validCharacters != 0;
}

- (NSString)validCharacters
{
  -[GEOLPRLicensePlateValidationRule _readValidCharacters]((uint64_t)self);
  validCharacters = self->_validCharacters;

  return validCharacters;
}

- (void)setValidCharacters:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_validCharacters, a3);
}

- (void)_readValidationRanges
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readValidationRanges_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)validationRanges
{
  -[GEOLPRLicensePlateValidationRule _readValidationRanges]((uint64_t)self);
  validationRanges = self->_validationRanges;

  return validationRanges;
}

- (void)setValidationRanges:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  validationRanges = self->_validationRanges;
  self->_validationRanges = v4;
}

- (void)clearValidationRanges
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  validationRanges = self->_validationRanges;

  [(NSMutableArray *)validationRanges removeAllObjects];
}

- (void)addValidationRanges:(id)a3
{
  id v4 = a3;
  -[GEOLPRLicensePlateValidationRule _readValidationRanges]((uint64_t)self);
  -[GEOLPRLicensePlateValidationRule _addNoFlagsValidationRanges:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsValidationRanges:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)validationRangesCount
{
  -[GEOLPRLicensePlateValidationRule _readValidationRanges]((uint64_t)self);
  validationRanges = self->_validationRanges;

  return [(NSMutableArray *)validationRanges count];
}

- (id)validationRangesAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateValidationRule _readValidationRanges]((uint64_t)self);
  validationRanges = self->_validationRanges;

  return (id)[(NSMutableArray *)validationRanges objectAtIndex:a3];
}

+ (Class)validationRangesType
{
  return (Class)objc_opt_class();
}

- (void)_readImpliedPowerTypeKeys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImpliedPowerTypeKeys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)impliedPowerTypeKeys
{
  -[GEOLPRLicensePlateValidationRule _readImpliedPowerTypeKeys]((uint64_t)self);
  impliedPowerTypeKeys = self->_impliedPowerTypeKeys;

  return impliedPowerTypeKeys;
}

- (void)setImpliedPowerTypeKeys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  impliedPowerTypeKeys = self->_impliedPowerTypeKeys;
  self->_impliedPowerTypeKeys = v4;
}

- (void)clearImpliedPowerTypeKeys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  impliedPowerTypeKeys = self->_impliedPowerTypeKeys;

  [(NSMutableArray *)impliedPowerTypeKeys removeAllObjects];
}

- (void)addImpliedPowerTypeKey:(id)a3
{
  id v4 = a3;
  -[GEOLPRLicensePlateValidationRule _readImpliedPowerTypeKeys]((uint64_t)self);
  -[GEOLPRLicensePlateValidationRule _addNoFlagsImpliedPowerTypeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImpliedPowerTypeKey:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)impliedPowerTypeKeysCount
{
  -[GEOLPRLicensePlateValidationRule _readImpliedPowerTypeKeys]((uint64_t)self);
  impliedPowerTypeKeys = self->_impliedPowerTypeKeys;

  return [(NSMutableArray *)impliedPowerTypeKeys count];
}

- (id)impliedPowerTypeKeyAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateValidationRule _readImpliedPowerTypeKeys]((uint64_t)self);
  impliedPowerTypeKeys = self->_impliedPowerTypeKeys;

  return (id)[(NSMutableArray *)impliedPowerTypeKeys objectAtIndex:a3];
}

+ (Class)impliedPowerTypeKeyType
{
  return (Class)objc_opt_class();
}

- (void)_readImpliedVehicleTypeKeys
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLPRLicensePlateValidationRuleReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImpliedVehicleTypeKeys_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)impliedVehicleTypeKeys
{
  -[GEOLPRLicensePlateValidationRule _readImpliedVehicleTypeKeys]((uint64_t)self);
  impliedVehicleTypeKeys = self->_impliedVehicleTypeKeys;

  return impliedVehicleTypeKeys;
}

- (void)setImpliedVehicleTypeKeys:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  impliedVehicleTypeKeys = self->_impliedVehicleTypeKeys;
  self->_impliedVehicleTypeKeys = v4;
}

- (void)clearImpliedVehicleTypeKeys
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  impliedVehicleTypeKeys = self->_impliedVehicleTypeKeys;

  [(NSMutableArray *)impliedVehicleTypeKeys removeAllObjects];
}

- (void)addImpliedVehicleTypeKey:(id)a3
{
  id v4 = a3;
  -[GEOLPRLicensePlateValidationRule _readImpliedVehicleTypeKeys]((uint64_t)self);
  -[GEOLPRLicensePlateValidationRule _addNoFlagsImpliedVehicleTypeKey:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsImpliedVehicleTypeKey:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)impliedVehicleTypeKeysCount
{
  -[GEOLPRLicensePlateValidationRule _readImpliedVehicleTypeKeys]((uint64_t)self);
  impliedVehicleTypeKeys = self->_impliedVehicleTypeKeys;

  return [(NSMutableArray *)impliedVehicleTypeKeys count];
}

- (id)impliedVehicleTypeKeyAtIndex:(unint64_t)a3
{
  -[GEOLPRLicensePlateValidationRule _readImpliedVehicleTypeKeys]((uint64_t)self);
  impliedVehicleTypeKeys = self->_impliedVehicleTypeKeys;

  return (id)[(NSMutableArray *)impliedVehicleTypeKeys objectAtIndex:a3];
}

+ (Class)impliedVehicleTypeKeyType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLPRLicensePlateValidationRule;
  id v4 = [(GEOLPRLicensePlateValidationRule *)&v8 description];
  id v5 = [(GEOLPRLicensePlateValidationRule *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLPRLicensePlateValidationRule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 regularExpression];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"regularExpression";
      }
      else {
        objc_super v6 = @"regular_expression";
      }
      [v4 setObject:v5 forKey:v6];
    }

    char v7 = *(unsigned char *)(a1 + 76);
    if ((v7 & 2) != 0)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
      if (a2) {
        v9 = @"minLength";
      }
      else {
        v9 = @"min_length";
      }
      [v4 setObject:v8 forKey:v9];

      char v7 = *(unsigned char *)(a1 + 76);
    }
    if (v7)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
      if (a2) {
        v11 = @"maxLength";
      }
      else {
        v11 = @"max_length";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = [(id)a1 validCharacters];
    if (v12)
    {
      if (a2) {
        v13 = @"validCharacters";
      }
      else {
        v13 = @"valid_characters";
      }
      [v4 setObject:v12 forKey:v13];
    }

    if ([*(id *)(a1 + 48) count])
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = objc_msgSend(v20, "dictionaryRepresentation", (void)v28);
            }
            objc_msgSend(v14, "addObject:", v21, (void)v28);
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"validationRanges";
      }
      else {
        v22 = @"validation_ranges";
      }
      objc_msgSend(v4, "setObject:forKey:", v14, v22, (void)v28);
    }
    if (*(void *)(a1 + 16))
    {
      v23 = [(id)a1 impliedPowerTypeKeys];
      if (a2) {
        v24 = @"impliedPowerTypeKey";
      }
      else {
        v24 = @"implied_power_type_key";
      }
      [v4 setObject:v23 forKey:v24];
    }
    if (*(void *)(a1 + 24))
    {
      v25 = [(id)a1 impliedVehicleTypeKeys];
      if (a2) {
        v26 = @"impliedVehicleTypeKey";
      }
      else {
        v26 = @"implied_vehicle_type_key";
      }
      [v4 setObject:v25 forKey:v26];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLPRLicensePlateValidationRule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLPRLicensePlateValidationRule)initWithDictionary:(id)a3
{
  return (GEOLPRLicensePlateValidationRule *)-[GEOLPRLicensePlateValidationRule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"regularExpression";
      }
      else {
        objc_super v6 = @"regular_expression";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setRegularExpression:v8];
      }
      if (a3) {
        v9 = @"minLength";
      }
      else {
        v9 = @"min_length";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMinLength:", objc_msgSend(v10, "unsignedIntValue"));
      }

      if (a3) {
        v11 = @"maxLength";
      }
      else {
        v11 = @"max_length";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setMaxLength:", objc_msgSend(v12, "unsignedIntValue"));
      }

      if (a3) {
        v13 = @"validCharacters";
      }
      else {
        v13 = @"valid_characters";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = (void *)[v14 copy];
        [a1 setValidCharacters:v15];
      }
      if (a3) {
        uint64_t v16 = @"validationRanges";
      }
      else {
        uint64_t v16 = @"validation_ranges";
      }
      uint64_t v17 = [v5 objectForKeyedSubscript:v16];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v46 = v17;
        id v47 = v5;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v18 = v17;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v56 objects:v62 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v57;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v57 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v56 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v24 = [GEOLPRValidationRange alloc];
                if (a3) {
                  uint64_t v25 = [(GEOLPRValidationRange *)v24 initWithJSON:v23];
                }
                else {
                  uint64_t v25 = [(GEOLPRValidationRange *)v24 initWithDictionary:v23];
                }
                v26 = (void *)v25;
                objc_msgSend(a1, "addValidationRanges:", v25, v46, v47);
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v56 objects:v62 count:16];
          }
          while (v20);
        }

        uint64_t v17 = v46;
        id v5 = v47;
      }

      if (a3) {
        v27 = @"impliedPowerTypeKey";
      }
      else {
        v27 = @"implied_power_type_key";
      }
      long long v28 = objc_msgSend(v5, "objectForKeyedSubscript:", v27, v46, v47);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v29 = v28;
        uint64_t v30 = [v29 countByEnumeratingWithState:&v52 objects:v61 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v53 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = *(void **)(*((void *)&v52 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v35 = (void *)[v34 copy];
                [a1 addImpliedPowerTypeKey:v35];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v52 objects:v61 count:16];
          }
          while (v31);
        }
      }
      if (a3) {
        v36 = @"impliedVehicleTypeKey";
      }
      else {
        v36 = @"implied_vehicle_type_key";
      }
      v37 = [v5 objectForKeyedSubscript:v36];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v38 = v37;
        uint64_t v39 = [v38 countByEnumeratingWithState:&v48 objects:v60 count:16];
        if (v39)
        {
          uint64_t v40 = v39;
          uint64_t v41 = *(void *)v49;
          do
          {
            for (uint64_t k = 0; k != v40; ++k)
            {
              if (*(void *)v49 != v41) {
                objc_enumerationMutation(v38);
              }
              v43 = *(void **)(*((void *)&v48 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v44 = (void *)[v43 copy];
                [a1 addImpliedVehicleTypeKey:v44];
              }
            }
            uint64_t v40 = [v38 countByEnumeratingWithState:&v48 objects:v60 count:16];
          }
          while (v40);
        }
      }
    }
  }

  return a1;
}

- (GEOLPRLicensePlateValidationRule)initWithJSON:(id)a3
{
  return (GEOLPRLicensePlateValidationRule *)-[GEOLPRLicensePlateValidationRule _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_58;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_58;
    }
    GEOLPRLicensePlateValidationRuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOLPRLicensePlateValidationRuleCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRLicensePlateValidationRuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRLicensePlateValidationRuleReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 3u))
  {
    uint64_t v19 = self->_reader;
    objc_sync_enter(v19);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v20 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v20];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLPRLicensePlateValidationRule *)self readAll:0];
    if (self->_regularExpression) {
      PBDataWriterWriteStringField();
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      char flags = (char)self->_flags;
    }
    if (flags) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_validCharacters) {
      PBDataWriterWriteStringField();
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    char v7 = self->_validationRanges;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v8);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v11 = self->_impliedPowerTypeKeys;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v12);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = self->_impliedVehicleTypeKeys;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v16);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v17 = (id *)a3;
  [(GEOLPRLicensePlateValidationRule *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 14) = self->_readerMarkPos;
  *((_DWORD *)v17 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_regularExpression) {
    objc_msgSend(v17, "setRegularExpression:");
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v17 + 18) = self->_minLength;
    *((unsigned char *)v17 + 76) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *((_DWORD *)v17 + 17) = self->_maxLength;
    *((unsigned char *)v17 + 76) |= 1u;
  }
  if (self->_validCharacters) {
    objc_msgSend(v17, "setValidCharacters:");
  }
  if ([(GEOLPRLicensePlateValidationRule *)self validationRangesCount])
  {
    [v17 clearValidationRanges];
    unint64_t v5 = [(GEOLPRLicensePlateValidationRule *)self validationRangesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOLPRLicensePlateValidationRule *)self validationRangesAtIndex:i];
        [v17 addValidationRanges:v8];
      }
    }
  }
  if ([(GEOLPRLicensePlateValidationRule *)self impliedPowerTypeKeysCount])
  {
    [v17 clearImpliedPowerTypeKeys];
    unint64_t v9 = [(GEOLPRLicensePlateValidationRule *)self impliedPowerTypeKeysCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOLPRLicensePlateValidationRule *)self impliedPowerTypeKeyAtIndex:j];
        [v17 addImpliedPowerTypeKey:v12];
      }
    }
  }
  if ([(GEOLPRLicensePlateValidationRule *)self impliedVehicleTypeKeysCount])
  {
    [v17 clearImpliedVehicleTypeKeys];
    unint64_t v13 = [(GEOLPRLicensePlateValidationRule *)self impliedVehicleTypeKeysCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(GEOLPRLicensePlateValidationRule *)self impliedVehicleTypeKeyAtIndex:k];
        [v17 addImpliedVehicleTypeKey:v16];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    char v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOLPRLicensePlateValidationRuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLPRLicensePlateValidationRule *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_regularExpression copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_minLength;
    *(unsigned char *)(v5 + 76) |= 2u;
    char flags = (char)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 68) = self->_maxLength;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_validCharacters copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  unint64_t v14 = self->_validationRanges;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addValidationRanges:v18];
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v15);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v19 = self->_impliedPowerTypeKeys;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v34 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addImpliedPowerTypeKey:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v20);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = self->_impliedVehicleTypeKeys;
  uint64_t v24 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v8);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * k), "copyWithZone:", a3, (void)v29);
        [(id)v5 addImpliedVehicleTypeKey:v27];
      }
      uint64_t v24 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v24);
  }
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  [(GEOLPRLicensePlateValidationRule *)self readAll:1];
  [v4 readAll:1];
  regularExpression = self->_regularExpression;
  if ((unint64_t)regularExpression | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](regularExpression, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_minLength != *((_DWORD *)v4 + 18)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 76) & 2) != 0)
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_maxLength != *((_DWORD *)v4 + 17)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
    goto LABEL_22;
  }
  validCharacters = self->_validCharacters;
  if ((unint64_t)validCharacters | *((void *)v4 + 5)
    && !-[NSString isEqual:](validCharacters, "isEqual:"))
  {
    goto LABEL_22;
  }
  validationRanges = self->_validationRanges;
  if ((unint64_t)validationRanges | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](validationRanges, "isEqual:")) {
      goto LABEL_22;
    }
  }
  impliedPowerTypeKeys = self->_impliedPowerTypeKeys;
  if ((unint64_t)impliedPowerTypeKeys | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](impliedPowerTypeKeys, "isEqual:")) {
      goto LABEL_22;
    }
  }
  impliedVehicleTypeKeys = self->_impliedVehicleTypeKeys;
  if ((unint64_t)impliedVehicleTypeKeys | *((void *)v4 + 3)) {
    char v10 = -[NSMutableArray isEqual:](impliedVehicleTypeKeys, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_23:

  return v10;
}

- (unint64_t)hash
{
  [(GEOLPRLicensePlateValidationRule *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_regularExpression hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_minLength;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_maxLength;
LABEL_6:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_validCharacters hash];
  uint64_t v7 = [(NSMutableArray *)self->_validationRanges hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_impliedPowerTypeKeys hash];
  return v6 ^ v8 ^ [(NSMutableArray *)self->_impliedVehicleTypeKeys hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 4)) {
    -[GEOLPRLicensePlateValidationRule setRegularExpression:](self, "setRegularExpression:");
  }
  char v5 = *((unsigned char *)v4 + 76);
  if ((v5 & 2) != 0)
  {
    self->_minLength = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v4 + 76);
  }
  if (v5)
  {
    self->_maxLength = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[GEOLPRLicensePlateValidationRule setValidCharacters:](self, "setValidCharacters:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        [(GEOLPRLicensePlateValidationRule *)self addValidationRanges:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v4 + 2);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(GEOLPRLicensePlateValidationRule *)self addImpliedPowerTypeKey:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 3);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[GEOLPRLicensePlateValidationRule addImpliedVehicleTypeKey:](self, "addImpliedVehicleTypeKey:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationRanges, 0);
  objc_storeStrong((id *)&self->_validCharacters, 0);
  objc_storeStrong((id *)&self->_regularExpression, 0);
  objc_storeStrong((id *)&self->_impliedVehicleTypeKeys, 0);
  objc_storeStrong((id *)&self->_impliedPowerTypeKeys, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end