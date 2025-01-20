@interface HDSyncPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HDSyncPredicate)initWithCoder:(id)a3;
- (HDSyncPredicate)initWithExcludedSyncProvenances:(id)a3 dateInterval:(id)a4 includedObjectTypes:(id)a5 defaultMaximumObjectAge:(id)a6 defaultMaximumTombstoneAge:(id)a7 maximumObjectAgeByType:(id)a8;
- (NSDateInterval)dateInterval;
- (NSDictionary)maximumObjectAgeByType;
- (NSNumber)defaultMaximumObjectAge;
- (NSNumber)defaultMaximumTombstoneAge;
- (NSSet)excludedSyncProvenances;
- (NSSet)includedObjectTypes;
- (id)maximumObjectAgeForType:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSyncPredicate

- (HDSyncPredicate)initWithExcludedSyncProvenances:(id)a3 dateInterval:(id)a4 includedObjectTypes:(id)a5 defaultMaximumObjectAge:(id)a6 defaultMaximumTombstoneAge:(id)a7 maximumObjectAgeByType:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)HDSyncPredicate;
  v20 = [(HDSyncPredicate *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    excludedSyncProvenances = v20->_excludedSyncProvenances;
    v20->_excludedSyncProvenances = (NSSet *)v21;

    uint64_t v23 = [v15 copy];
    dateInterval = v20->_dateInterval;
    v20->_dateInterval = (NSDateInterval *)v23;

    uint64_t v25 = [v16 copy];
    includedObjectTypes = v20->_includedObjectTypes;
    v20->_includedObjectTypes = (NSSet *)v25;

    uint64_t v27 = [v17 copy];
    defaultMaximumObjectAge = v20->_defaultMaximumObjectAge;
    v20->_defaultMaximumObjectAge = (NSNumber *)v27;

    uint64_t v29 = [v18 copy];
    defaultMaximumTombstoneAge = v20->_defaultMaximumTombstoneAge;
    v20->_defaultMaximumTombstoneAge = (NSNumber *)v29;

    uint64_t v31 = [v19 copy];
    maximumObjectAgeByType = v20->_maximumObjectAgeByType;
    v20->_maximumObjectAgeByType = (NSDictionary *)v31;
  }
  return v20;
}

- (id)maximumObjectAgeForType:(id)a3
{
  defaultMaximumObjectAge = [(NSDictionary *)self->_maximumObjectAgeByType objectForKeyedSubscript:a3];
  v5 = defaultMaximumObjectAge;
  if (!defaultMaximumObjectAge) {
    defaultMaximumObjectAge = self->_defaultMaximumObjectAge;
  }
  id v6 = defaultMaximumObjectAge;

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_excludedSyncProvenances hash];
  uint64_t v4 = [(NSDateInterval *)self->_dateInterval hash] ^ v3;
  uint64_t v5 = [(NSSet *)self->_includedObjectTypes hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_defaultMaximumObjectAge hash];
  uint64_t v7 = [(NSNumber *)self->_defaultMaximumTombstoneAge hash];
  return v6 ^ v7 ^ [(NSDictionary *)self->_maximumObjectAgeByType hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  excludedSyncProvenances = self->_excludedSyncProvenances;
  uint64_t v6 = (NSSet *)v4[1];
  if (excludedSyncProvenances != v6 && (!v6 || !-[NSSet isEqual:](excludedSyncProvenances, "isEqual:"))) {
    goto LABEL_20;
  }
  dateInterval = self->_dateInterval;
  v8 = (NSDateInterval *)v4[2];
  if (dateInterval != v8 && (!v8 || !-[NSDateInterval isEqual:](dateInterval, "isEqual:"))) {
    goto LABEL_20;
  }
  includedObjectTypes = self->_includedObjectTypes;
  v10 = (NSSet *)v4[3];
  if (includedObjectTypes != v10 && (!v10 || !-[NSSet isEqual:](includedObjectTypes, "isEqual:"))) {
    goto LABEL_20;
  }
  defaultMaximumObjectAge = self->_defaultMaximumObjectAge;
  v12 = (NSNumber *)v4[4];
  if (defaultMaximumObjectAge != v12
    && (!v12 || !-[NSNumber isEqual:](defaultMaximumObjectAge, "isEqual:")))
  {
    goto LABEL_20;
  }
  defaultMaximumTombstoneAge = self->_defaultMaximumTombstoneAge;
  id v14 = (NSNumber *)v4[5];
  if (defaultMaximumTombstoneAge != v14
    && (!v14 || !-[NSNumber isEqual:](defaultMaximumTombstoneAge, "isEqual:")))
  {
    goto LABEL_20;
  }
  maximumObjectAgeByType = self->_maximumObjectAgeByType;
  id v16 = (NSDictionary *)v4[6];
  if (maximumObjectAgeByType == v16)
  {
    char v17 = 1;
    goto LABEL_21;
  }
  if (v16) {
    char v17 = -[NSDictionary isEqual:](maximumObjectAgeByType, "isEqual:");
  }
  else {
LABEL_20:
  }
    char v17 = 0;
LABEL_21:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  excludedSyncProvenances = self->_excludedSyncProvenances;
  id v5 = a3;
  [v5 encodeObject:excludedSyncProvenances forKey:@"hdsp_esp"];
  [v5 encodeObject:self->_dateInterval forKey:@"hdsp_interval"];
  [v5 encodeObject:self->_includedObjectTypes forKey:@"hdsp_types"];
  [v5 encodeObject:self->_defaultMaximumObjectAge forKey:@"hdsp_oage"];
  [v5 encodeObject:self->_defaultMaximumTombstoneAge forKey:@"hdsp_tage"];
  [v5 encodeObject:self->_maximumObjectAgeByType forKey:@"hdsp_ages"];
}

- (HDSyncPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
  uint64_t v6 = [v4 decodeObjectOfClasses:v5 forKey:@"hdsp_esp"];

  if (v6)
  {
    id v18 = [HDSyncPredicate alloc];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hdsp_interval"];
    id v19 = self;
    v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "hk_typesForSetOf:", objc_opt_class());
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"hdsp_types"];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hdsp_oage"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hdsp_tage"];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v12, "hk_typesForDictionaryMapping:to:", v13, objc_opt_class());
    id v15 = [v4 decodeObjectOfClasses:v14 forKey:@"hdsp_ages"];
    id v16 = [(HDSyncPredicate *)v18 initWithExcludedSyncProvenances:v6 dateInterval:v7 includedObjectTypes:v9 defaultMaximumObjectAge:v10 defaultMaximumTombstoneAge:v11 maximumObjectAgeByType:v15];

    self = v19;
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (NSSet)excludedSyncProvenances
{
  return self->_excludedSyncProvenances;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSSet)includedObjectTypes
{
  return self->_includedObjectTypes;
}

- (NSNumber)defaultMaximumObjectAge
{
  return self->_defaultMaximumObjectAge;
}

- (NSNumber)defaultMaximumTombstoneAge
{
  return self->_defaultMaximumTombstoneAge;
}

- (NSDictionary)maximumObjectAgeByType
{
  return self->_maximumObjectAgeByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumObjectAgeByType, 0);
  objc_storeStrong((id *)&self->_defaultMaximumTombstoneAge, 0);
  objc_storeStrong((id *)&self->_defaultMaximumObjectAge, 0);
  objc_storeStrong((id *)&self->_includedObjectTypes, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);

  objc_storeStrong((id *)&self->_excludedSyncProvenances, 0);
}

@end