@interface ACHEarnedInstance
+ (BOOL)supportsSecureCoding;
+ (id)_allTemplateUniqueNames;
- ($02FB07F485EFC64008691ED20BDF3B27)packedEarnedDateComponents;
- (ACHEarnedInstance)init;
- (ACHEarnedInstance)initWithCodable:(id)a3;
- (ACHEarnedInstance)initWithCoder:(id)a3;
- (ACHSyncIdentity)syncIdentity;
- (BOOL)isEqual:(id)a3;
- (HKQuantity)value;
- (NSDate)createdDate;
- (NSDateComponents)earnedDateComponents;
- (NSString)externalIdentifier;
- (NSString)templateUniqueName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)compareEarnedDateWithEarnedInstance:(id)a3;
- (unint64_t)hash;
- (unint64_t)key;
- (unsigned)creatorDevice;
- (void)encodeWithCoder:(id)a3;
- (void)setCreatedDate:(id)a3;
- (void)setCreatorDevice:(unsigned __int8)a3;
- (void)setEarnedDateComponents:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setKey:(unint64_t)a3;
- (void)setPackedEarnedDateComponents:(id)a3;
- (void)setSyncIdentity:(id)a3;
- (void)setTemplateUniqueName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation ACHEarnedInstance

- (ACHEarnedInstance)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACHEarnedInstance;
  result = [(ACHEarnedInstance *)&v3 init];
  if (result)
  {
    result->_packedEarnedDateComponents.valid = 0;
    *(_DWORD *)&result->_packedEarnedDateComponents.year = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ACHEarnedInstance *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(ACHEarnedInstance *)self key];
      if (v6 == [(ACHEarnedInstance *)v5 key])
      {
        v7 = [(ACHEarnedInstance *)self templateUniqueName];
        uint64_t v8 = [(ACHEarnedInstance *)v5 templateUniqueName];
        if (v7 == (void *)v8)
        {
        }
        else
        {
          v9 = (void *)v8;
          v10 = [(ACHEarnedInstance *)self templateUniqueName];
          v11 = [(ACHEarnedInstance *)v5 templateUniqueName];
          int v12 = [v10 isEqualToString:v11];

          if (!v12) {
            goto LABEL_11;
          }
        }
        if ((((*(unsigned int *)&v5->_packedEarnedDateComponents.year | ((unint64_t)v5->_packedEarnedDateComponents.valid << 32)) ^ (*(unsigned int *)&self->_packedEarnedDateComponents.year | ((unint64_t)self->_packedEarnedDateComponents.valid << 32))) & 0x1FFFFFFFFLL) == 0)
        {
          v15 = [(ACHEarnedInstance *)self createdDate];
          uint64_t v16 = [(ACHEarnedInstance *)v5 createdDate];
          if (v15 == (void *)v16)
          {
          }
          else
          {
            v17 = (void *)v16;
            v18 = [(ACHEarnedInstance *)self createdDate];
            v19 = [(ACHEarnedInstance *)v5 createdDate];
            int v20 = [v18 isEqual:v19];

            if (!v20) {
              goto LABEL_11;
            }
          }
          int v21 = [(ACHEarnedInstance *)self creatorDevice];
          if (v21 == [(ACHEarnedInstance *)v5 creatorDevice])
          {
            v22 = [(ACHEarnedInstance *)self value];
            [v22 _value];
            v23 = [(ACHEarnedInstance *)v5 value];
            [v23 _value];
            uint64_t v24 = HKCompareDoubles();

            if (!v24)
            {
              v25 = [(ACHEarnedInstance *)self externalIdentifier];
              uint64_t v26 = [(ACHEarnedInstance *)v5 externalIdentifier];
              if (v25 == (void *)v26)
              {
                char v13 = 1;
                v27 = v25;
              }
              else
              {
                v27 = (void *)v26;
                v28 = [(ACHEarnedInstance *)self externalIdentifier];
                v29 = [(ACHEarnedInstance *)v5 externalIdentifier];
                char v13 = [v28 isEqual:v29];
              }
              goto LABEL_12;
            }
          }
        }
      }
LABEL_11:
      char v13 = 0;
LABEL_12:

      goto LABEL_13;
    }
    char v13 = 0;
  }
LABEL_13:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ACHEarnedInstance *)self key];
  v4 = [(ACHEarnedInstance *)self templateUniqueName];
  uint64_t v5 = [v4 hash] ^ v3;
  unint64_t v6 = [(ACHEarnedInstance *)self earnedDateComponents];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(ACHEarnedInstance *)self createdDate];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  uint64_t v10 = [(ACHEarnedInstance *)self creatorDevice];
  v11 = [(ACHEarnedInstance *)self value];
  uint64_t v12 = v9 ^ v10 ^ [v11 hash];
  char v13 = [(ACHEarnedInstance *)self externalIdentifier];
  unint64_t v14 = v12 ^ [v13 hash];

  return v14;
}

- (int64_t)compareEarnedDateWithEarnedInstance:(id)a3
{
  if (!a3) {
    return 1;
  }
  unint64_t v3 = *(unsigned int *)&self->_packedEarnedDateComponents.year | ((unint64_t)self->_packedEarnedDateComponents.valid << 32);
  unint64_t v4 = *((unsigned int *)a3 + 6) | ((unint64_t)*((unsigned __int8 *)a3 + 28) << 32);
  uint64_t v5 = HIDWORD(v3) & 1;
  uint64_t v6 = HIDWORD(v4) & 1;
  if (v5 == v6)
  {
    if ((unsigned __int16)*((_DWORD *)a3 + 6) != (unsigned __int16)*(_DWORD *)&self->_packedEarnedDateComponents.year)
    {
      unint64_t v7 = (unsigned __int16)*(_DWORD *)&self->_packedEarnedDateComponents.year;
      BOOL v8 = v7 >= (unsigned __int16)*((_DWORD *)a3 + 6);
      BOOL v9 = v7 > (unsigned __int16)*((_DWORD *)a3 + 6);
    }
    else if (BYTE2(*((_DWORD *)a3 + 6)) != BYTE2(*(_DWORD *)&self->_packedEarnedDateComponents.year))
    {
      unint64_t v14 = BYTE2(*(_DWORD *)&self->_packedEarnedDateComponents.year);
      BOOL v8 = v14 >= BYTE2(*((_DWORD *)a3 + 6));
      BOOL v9 = v14 > BYTE2(*((_DWORD *)a3 + 6));
    }
    else
    {
      unint64_t v15 = v4 >> 24;
      unint64_t v16 = HIBYTE(*(_DWORD *)&self->_packedEarnedDateComponents.year);
      BOOL v8 = v16 >= v15;
      BOOL v9 = v16 > v15;
    }
    if (v8) {
      int64_t v17 = 0;
    }
    else {
      int64_t v17 = -1;
    }
    if (v9) {
      return 1;
    }
    else {
      return v17;
    }
  }
  if ((v3 & 0x100000000) != 0 && v6 == 0) {
    return 1;
  }
  uint64_t v12 = (v4 & 0x100000000) != 0 && v5 == 0;
  return v12 << 63 >> 63;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[ACHEarnedInstance allocWithZone:](ACHEarnedInstance, "allocWithZone:") init];
  v5->_key = [(ACHEarnedInstance *)self key];
  v5->_uniqueNameIndex = self->_uniqueNameIndex;
  int v6 = *(_DWORD *)&self->_packedEarnedDateComponents.year;
  v5->_packedEarnedDateComponents.valid = self->_packedEarnedDateComponents.valid;
  *(_DWORD *)&v5->_packedEarnedDateComponents.year = v6;
  unint64_t v7 = [(ACHEarnedInstance *)self createdDate];
  uint64_t v8 = [v7 copyWithZone:a3];
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  v5->_creatorDevice = [(ACHEarnedInstance *)self creatorDevice];
  uint64_t v10 = [(ACHEarnedInstance *)self value];
  uint64_t v11 = [v10 copy];
  value = v5->_value;
  v5->_value = (HKQuantity *)v11;

  char v13 = [(ACHEarnedInstance *)self externalIdentifier];
  uint64_t v14 = [v13 copy];
  externalIdentifier = v5->_externalIdentifier;
  v5->_externalIdentifier = (NSString *)v14;

  return v5;
}

- (id)description
{
  unint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)ACHEarnedInstance;
  unint64_t v4 = [(ACHEarnedInstance *)&v13 description];
  unint64_t v5 = [(ACHEarnedInstance *)self key];
  int v6 = [(ACHEarnedInstance *)self templateUniqueName];
  unint64_t v7 = [(ACHEarnedInstance *)self earnedDateComponents];
  uint64_t v8 = [(ACHEarnedInstance *)self createdDate];
  BOOL v9 = [(ACHEarnedInstance *)self value];
  uint64_t v10 = [(ACHEarnedInstance *)self externalIdentifier];
  uint64_t v11 = [v3 stringWithFormat:@"%@(Key: %lu\nTemplate Unique Name: %@\nEarned Date: %@\nCreated Date (MM-dd-yyyy HH:mm:ss): %@\nValue: %@\nExternal Identifier: %@\nCreator Device [1 = Watch, 2= Phone]: %lu\n)", v4, v5, v6, v7, v8, v9, v10, -[ACHEarnedInstance creatorDevice](self, "creatorDevice")];

  return v11;
}

- (id)debugDescription
{
  unint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)ACHEarnedInstance;
  unint64_t v4 = [(ACHEarnedInstance *)&v13 description];
  unint64_t v5 = [(ACHEarnedInstance *)self key];
  int v6 = [(ACHEarnedInstance *)self templateUniqueName];
  unint64_t v7 = [(ACHEarnedInstance *)self earnedDateComponents];
  uint64_t v8 = [(ACHEarnedInstance *)self createdDate];
  BOOL v9 = [(ACHEarnedInstance *)self value];
  uint64_t v10 = [(ACHEarnedInstance *)self externalIdentifier];
  uint64_t v11 = [v3 stringWithFormat:@"%@(key=%lu, templateUniqueName=%@, earnedDate=%@, createdDate=%@, value=%@, externalIdentifier=%@, creatorDevice=%lu\n)", v4, v5, v6, v7, v8, v9, v10, -[ACHEarnedInstance creatorDevice](self, "creatorDevice")];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHEarnedInstance)initWithCodable:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ACHEarnedInstance;
  unint64_t v5 = [(ACHEarnedInstance *)&v30 init];
  if (v5)
  {
    -[ACHEarnedInstance setKey:](v5, "setKey:", [v4 key]);
    int v6 = [v4 templateUniqueName];
    [(ACHEarnedInstance *)v5 setTemplateUniqueName:v6];

    unint64_t v7 = (void *)MEMORY[0x263EFF910];
    [v4 createdDate];
    uint64_t v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    [(ACHEarnedInstance *)v5 setCreatedDate:v8];

    BOOL v9 = [v4 earnedDateComponents];
    uint64_t v10 = ACHYearMonthDayDateComponentsFromString(v9);
    [(ACHEarnedInstance *)v5 setEarnedDateComponents:v10];

    -[ACHEarnedInstance setCreatorDevice:](v5, "setCreatorDevice:", [v4 creatorDevice]);
    [v4 value];
    double v12 = v11;
    objc_super v13 = [v4 valueUnitString];
    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x263F0A630];
      unint64_t v15 = [MEMORY[0x263F0A830] unitFromString:v13];
      unint64_t v16 = [v14 quantityWithUnit:v15 doubleValue:v12];
      [(ACHEarnedInstance *)v5 setValue:v16];
    }
    if ([v4 hasExternalIdentifier])
    {
      int64_t v17 = [v4 externalIdentifier];
      [(ACHEarnedInstance *)v5 setExternalIdentifier:v17];
    }
    if ([v4 hasSyncIdentity])
    {
      v18 = [v4 syncIdentity];
      v19 = [v18 hardwareIdentifier];

      int v20 = [v4 syncIdentity];
      int v21 = [v20 databaseIdentifier];

      if (v19 && v21)
      {
        v22 = [v4 syncIdentity];
        uint64_t v23 = [v22 instanceDiscriminator];
        uint64_t v24 = (void *)v23;
        v25 = &stru_26D0EC7B0;
        if (v23) {
          v25 = (__CFString *)v23;
        }
        uint64_t v26 = v25;

        v27 = [[ACHSyncIdentity alloc] initWithHardwareIdentifier:v19 databaseIdentifier:v21 instanceDiscriminator:v26];
        [(ACHEarnedInstance *)v5 setSyncIdentity:v27];
      }
      else
      {
        ACHLogTemplates();
        v27 = (ACHSyncIdentity *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v27->super, OS_LOG_TYPE_ERROR)) {
          -[ACHTemplate initWithCodable:](&v27->super);
        }
      }
    }
    v28 = v5;
  }
  return v5;
}

- (ACHEarnedInstance)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  int v6 = (objc_class *)objc_opt_class();
  unint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = [v4 decodeObjectOfClass:v5 forKey:v7];

  if ([v8 length])
  {
    BOOL v9 = [[ACHCodableEarnedInstance alloc] initWithData:v8];
    if (v9)
    {
      self = [(ACHEarnedInstance *)self initWithCodable:v9];

      BOOL v9 = (ACHCodableEarnedInstance *)self;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return (ACHEarnedInstance *)v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = ACHCodableFromEarnedInstance(self);
  uint64_t v5 = [v4 data];
  if ([v5 length])
  {
    int v6 = (objc_class *)objc_opt_class();
    unint64_t v7 = NSStringFromClass(v6);
    [v8 encodeObject:v5 forKey:v7];
  }
}

- (NSDateComponents)earnedDateComponents
{
  if (self->_packedEarnedDateComponents.valid)
  {
    v2 = ACHDateComponentsForYearMonthDay(self->_packedEarnedDateComponents.year, self->_packedEarnedDateComponents.month, self->_packedEarnedDateComponents.day);
  }
  else
  {
    v2 = 0;
  }

  return (NSDateComponents *)v2;
}

- (void)setEarnedDateComponents:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unsigned __int16 v5 = [v4 year];
    unsigned __int8 v6 = [v4 month];
    unsigned __int8 v7 = [v4 day];

    BOOL v8 = 1;
  }
  else
  {
    unsigned __int16 v5 = 0;
    unsigned __int8 v6 = 0;
    unsigned __int8 v7 = 0;
    BOOL v8 = 0;
  }
  self->_packedEarnedDateComponents.year = v5;
  self->_packedEarnedDateComponents.month = v6;
  self->_packedEarnedDateComponents.day = v7;
  self->_packedEarnedDateComponents.valid = v8;
}

+ (id)_allTemplateUniqueNames
{
  if (_allTemplateUniqueNames_onceToken != -1) {
    dispatch_once(&_allTemplateUniqueNames_onceToken, &__block_literal_global_298);
  }
  v2 = (void *)_allTemplateUniqueNames_allTemplateUniqueNames;

  return v2;
}

uint64_t __44__ACHEarnedInstance__allTemplateUniqueNames__block_invoke()
{
  _allTemplateUniqueNames_allTemplateUniqueNames = [MEMORY[0x263EFF980] array];

  return MEMORY[0x270F9A758]();
}

- (NSString)templateUniqueName
{
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  unint64_t v3 = [(id)objc_opt_class() _allTemplateUniqueNames];
  unint64_t uniqueNameIndex = self->_uniqueNameIndex;
  if (uniqueNameIndex >= [v3 count])
  {
    unsigned __int16 v5 = 0;
  }
  else
  {
    unsigned __int16 v5 = [v3 objectAtIndexedSubscript:self->_uniqueNameIndex];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);

  return (NSString *)v5;
}

- (void)setTemplateUniqueName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__lock);
  id v4 = [(id)objc_opt_class() _allTemplateUniqueNames];
  unint64_t v5 = [v4 indexOfObject:v6];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_unint64_t uniqueNameIndex = [v4 count];
    [v4 addObject:v6];
  }
  else
  {
    self->_unint64_t uniqueNameIndex = v5;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__lock);
}

- (unsigned)creatorDevice
{
  return self->_creatorDevice;
}

- (void)setCreatorDevice:(unsigned __int8)a3
{
  self->_creatorDevice = a3;
}

- (unint64_t)key
{
  return self->_key;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (HKQuantity)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
}

- (ACHSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
}

- ($02FB07F485EFC64008691ED20BDF3B27)packedEarnedDateComponents
{
  return ($02FB07F485EFC64008691ED20BDF3B27)(*(unsigned int *)&self->_packedEarnedDateComponents.year | ((unint64_t)self->_packedEarnedDateComponents.valid << 32));
}

- (void)setPackedEarnedDateComponents:(id)a3
{
  self->_packedEarnedDateComponents = ($DF469B387FBA7E543935CF1F2373AD6C)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end