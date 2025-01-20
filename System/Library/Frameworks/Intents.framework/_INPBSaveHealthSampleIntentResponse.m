@interface _INPBSaveHealthSampleIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)sampleUuidsType;
+ (Class)valuesDefaultUnitType;
+ (Class)valuesUserProvidedUnitType;
- (BOOL)hasDefaultUnit;
- (BOOL)hasPunchoutUrl;
- (BOOL)hasRecordDate;
- (BOOL)hasUserProvidedUnit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)sampleUuids;
- (NSArray)valuesDefaultUnits;
- (NSArray)valuesUserProvidedUnits;
- (_INPBDateTimeRange)recordDate;
- (_INPBSaveHealthSampleIntentResponse)initWithCoder:(id)a3;
- (_INPBString)defaultUnit;
- (_INPBString)punchoutUrl;
- (_INPBString)userProvidedUnit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)sampleUuidsAtIndex:(unint64_t)a3;
- (id)valuesDefaultUnitAtIndex:(unint64_t)a3;
- (id)valuesUserProvidedUnitAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sampleUuidsCount;
- (unint64_t)valuesDefaultUnitsCount;
- (unint64_t)valuesUserProvidedUnitsCount;
- (void)addSampleUuids:(id)a3;
- (void)addValuesDefaultUnit:(id)a3;
- (void)addValuesUserProvidedUnit:(id)a3;
- (void)clearSampleUuids;
- (void)clearValuesDefaultUnits;
- (void)clearValuesUserProvidedUnits;
- (void)encodeWithCoder:(id)a3;
- (void)setDefaultUnit:(id)a3;
- (void)setPunchoutUrl:(id)a3;
- (void)setRecordDate:(id)a3;
- (void)setSampleUuids:(id)a3;
- (void)setUserProvidedUnit:(id)a3;
- (void)setValuesDefaultUnits:(id)a3;
- (void)setValuesUserProvidedUnits:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSaveHealthSampleIntentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesUserProvidedUnits, 0);
  objc_storeStrong((id *)&self->_valuesDefaultUnits, 0);
  objc_storeStrong((id *)&self->_userProvidedUnit, 0);
  objc_storeStrong((id *)&self->_sampleUuids, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);
  objc_storeStrong((id *)&self->_punchoutUrl, 0);

  objc_storeStrong((id *)&self->_defaultUnit, 0);
}

- (NSArray)valuesUserProvidedUnits
{
  return self->_valuesUserProvidedUnits;
}

- (NSArray)valuesDefaultUnits
{
  return self->_valuesDefaultUnits;
}

- (_INPBString)userProvidedUnit
{
  return self->_userProvidedUnit;
}

- (NSArray)sampleUuids
{
  return self->_sampleUuids;
}

- (_INPBDateTimeRange)recordDate
{
  return self->_recordDate;
}

- (_INPBString)punchoutUrl
{
  return self->_punchoutUrl;
}

- (_INPBString)defaultUnit
{
  return self->_defaultUnit;
}

- (id)dictionaryRepresentation
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSaveHealthSampleIntentResponse *)self defaultUnit];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"defaultUnit"];

  v6 = [(_INPBSaveHealthSampleIntentResponse *)self punchoutUrl];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"punchoutUrl"];

  v8 = [(_INPBSaveHealthSampleIntentResponse *)self recordDate];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"recordDate"];

  if ([(NSArray *)self->_sampleUuids count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v11 = self->_sampleUuids;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v42 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"sampleUuids"];
  }
  v17 = [(_INPBSaveHealthSampleIntentResponse *)self userProvidedUnit];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"userProvidedUnit"];

  if ([(NSArray *)self->_valuesDefaultUnits count])
  {
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v20 = self->_valuesDefaultUnits;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v38 + 1) + 8 * j) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"valuesDefaultUnit"];
  }
  if ([(NSArray *)self->_valuesUserProvidedUnits count])
  {
    v26 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v27 = self->_valuesUserProvidedUnits;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v35 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * k), "dictionaryRepresentation", (void)v34);
          [v26 addObject:v32];
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v29);
    }

    [v3 setObject:v26 forKeyedSubscript:@"valuesUserProvidedUnit"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBString *)self->_defaultUnit hash];
  unint64_t v4 = [(_INPBString *)self->_punchoutUrl hash] ^ v3;
  unint64_t v5 = [(_INPBDateTimeRange *)self->_recordDate hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_sampleUuids hash];
  unint64_t v7 = [(_INPBString *)self->_userProvidedUnit hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_valuesDefaultUnits hash];
  return v6 ^ v8 ^ [(NSArray *)self->_valuesUserProvidedUnits hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntentResponse *)self defaultUnit];
  uint64_t v6 = [v4 defaultUnit];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(_INPBSaveHealthSampleIntentResponse *)self defaultUnit];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    v9 = [(_INPBSaveHealthSampleIntentResponse *)self defaultUnit];
    v10 = [v4 defaultUnit];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntentResponse *)self punchoutUrl];
  uint64_t v6 = [v4 punchoutUrl];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(_INPBSaveHealthSampleIntentResponse *)self punchoutUrl];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_INPBSaveHealthSampleIntentResponse *)self punchoutUrl];
    v15 = [v4 punchoutUrl];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntentResponse *)self recordDate];
  uint64_t v6 = [v4 recordDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(_INPBSaveHealthSampleIntentResponse *)self recordDate];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_INPBSaveHealthSampleIntentResponse *)self recordDate];
    v20 = [v4 recordDate];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntentResponse *)self sampleUuids];
  uint64_t v6 = [v4 sampleUuids];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v22 = [(_INPBSaveHealthSampleIntentResponse *)self sampleUuids];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    v24 = [(_INPBSaveHealthSampleIntentResponse *)self sampleUuids];
    v25 = [v4 sampleUuids];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntentResponse *)self userProvidedUnit];
  uint64_t v6 = [v4 userProvidedUnit];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v27 = [(_INPBSaveHealthSampleIntentResponse *)self userProvidedUnit];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    uint64_t v29 = [(_INPBSaveHealthSampleIntentResponse *)self userProvidedUnit];
    uint64_t v30 = [v4 userProvidedUnit];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntentResponse *)self valuesDefaultUnits];
  uint64_t v6 = [v4 valuesDefaultUnits];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v32 = [(_INPBSaveHealthSampleIntentResponse *)self valuesDefaultUnits];
  if (v32)
  {
    v33 = (void *)v32;
    long long v34 = [(_INPBSaveHealthSampleIntentResponse *)self valuesDefaultUnits];
    long long v35 = [v4 valuesDefaultUnits];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntentResponse *)self valuesUserProvidedUnits];
  uint64_t v6 = [v4 valuesUserProvidedUnits];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v37 = [(_INPBSaveHealthSampleIntentResponse *)self valuesUserProvidedUnits];
    if (!v37)
    {

LABEL_40:
      BOOL v42 = 1;
      goto LABEL_38;
    }
    long long v38 = (void *)v37;
    long long v39 = [(_INPBSaveHealthSampleIntentResponse *)self valuesUserProvidedUnits];
    long long v40 = [v4 valuesUserProvidedUnits];
    char v41 = [v39 isEqual:v40];

    if (v41) {
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
  }
LABEL_37:
  BOOL v42 = 0;
LABEL_38:

  return v42;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSaveHealthSampleIntentResponse allocWithZone:](_INPBSaveHealthSampleIntentResponse, "allocWithZone:") init];
  id v6 = [(_INPBString *)self->_defaultUnit copyWithZone:a3];
  [(_INPBSaveHealthSampleIntentResponse *)v5 setDefaultUnit:v6];

  id v7 = [(_INPBString *)self->_punchoutUrl copyWithZone:a3];
  [(_INPBSaveHealthSampleIntentResponse *)v5 setPunchoutUrl:v7];

  id v8 = [(_INPBDateTimeRange *)self->_recordDate copyWithZone:a3];
  [(_INPBSaveHealthSampleIntentResponse *)v5 setRecordDate:v8];

  v9 = (void *)[(NSArray *)self->_sampleUuids copyWithZone:a3];
  [(_INPBSaveHealthSampleIntentResponse *)v5 setSampleUuids:v9];

  id v10 = [(_INPBString *)self->_userProvidedUnit copyWithZone:a3];
  [(_INPBSaveHealthSampleIntentResponse *)v5 setUserProvidedUnit:v10];

  int v11 = (void *)[(NSArray *)self->_valuesDefaultUnits copyWithZone:a3];
  [(_INPBSaveHealthSampleIntentResponse *)v5 setValuesDefaultUnits:v11];

  uint64_t v12 = (void *)[(NSArray *)self->_valuesUserProvidedUnits copyWithZone:a3];
  [(_INPBSaveHealthSampleIntentResponse *)v5 setValuesUserProvidedUnits:v12];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSaveHealthSampleIntentResponse *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSaveHealthSampleIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSaveHealthSampleIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSaveHealthSampleIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSaveHealthSampleIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBSaveHealthSampleIntentResponse *)self defaultUnit];

  if (v5)
  {
    id v6 = [(_INPBSaveHealthSampleIntentResponse *)self defaultUnit];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBSaveHealthSampleIntentResponse *)self punchoutUrl];

  if (v7)
  {
    id v8 = [(_INPBSaveHealthSampleIntentResponse *)self punchoutUrl];
    PBDataWriterWriteSubmessage();
  }
  v9 = [(_INPBSaveHealthSampleIntentResponse *)self recordDate];

  if (v9)
  {
    id v10 = [(_INPBSaveHealthSampleIntentResponse *)self recordDate];
    PBDataWriterWriteSubmessage();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  int v11 = self->_sampleUuids;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v13);
  }

  int v16 = [(_INPBSaveHealthSampleIntentResponse *)self userProvidedUnit];

  if (v16)
  {
    uint64_t v17 = [(_INPBSaveHealthSampleIntentResponse *)self userProvidedUnit];
    PBDataWriterWriteSubmessage();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v18 = self->_valuesDefaultUnits;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteSubmessage();
        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v20);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v23 = self->_valuesUserProvidedUnits;
  uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v29;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteSubmessage();
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v25);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSaveHealthSampleIntentResponseReadFrom(self, (uint64_t)a3);
}

- (id)valuesUserProvidedUnitAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_valuesUserProvidedUnits objectAtIndexedSubscript:a3];
}

- (unint64_t)valuesUserProvidedUnitsCount
{
  return [(NSArray *)self->_valuesUserProvidedUnits count];
}

- (void)addValuesUserProvidedUnit:(id)a3
{
  id v4 = a3;
  valuesUserProvidedUnits = self->_valuesUserProvidedUnits;
  id v8 = v4;
  if (!valuesUserProvidedUnits)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_valuesUserProvidedUnits;
    self->_valuesUserProvidedUnits = v6;

    id v4 = v8;
    valuesUserProvidedUnits = self->_valuesUserProvidedUnits;
  }
  [(NSArray *)valuesUserProvidedUnits addObject:v4];
}

- (void)clearValuesUserProvidedUnits
{
}

- (void)setValuesUserProvidedUnits:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  valuesUserProvidedUnits = self->_valuesUserProvidedUnits;
  self->_valuesUserProvidedUnits = v4;

  MEMORY[0x1F41817F8](v4, valuesUserProvidedUnits);
}

- (id)valuesDefaultUnitAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_valuesDefaultUnits objectAtIndexedSubscript:a3];
}

- (unint64_t)valuesDefaultUnitsCount
{
  return [(NSArray *)self->_valuesDefaultUnits count];
}

- (void)addValuesDefaultUnit:(id)a3
{
  id v4 = a3;
  valuesDefaultUnits = self->_valuesDefaultUnits;
  id v8 = v4;
  if (!valuesDefaultUnits)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_valuesDefaultUnits;
    self->_valuesDefaultUnits = v6;

    id v4 = v8;
    valuesDefaultUnits = self->_valuesDefaultUnits;
  }
  [(NSArray *)valuesDefaultUnits addObject:v4];
}

- (void)clearValuesDefaultUnits
{
}

- (void)setValuesDefaultUnits:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  valuesDefaultUnits = self->_valuesDefaultUnits;
  self->_valuesDefaultUnits = v4;

  MEMORY[0x1F41817F8](v4, valuesDefaultUnits);
}

- (BOOL)hasUserProvidedUnit
{
  return self->_userProvidedUnit != 0;
}

- (void)setUserProvidedUnit:(id)a3
{
}

- (id)sampleUuidsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_sampleUuids objectAtIndexedSubscript:a3];
}

- (unint64_t)sampleUuidsCount
{
  return [(NSArray *)self->_sampleUuids count];
}

- (void)addSampleUuids:(id)a3
{
  id v4 = a3;
  sampleUuids = self->_sampleUuids;
  id v8 = v4;
  if (!sampleUuids)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sampleUuids;
    self->_sampleUuids = v6;

    id v4 = v8;
    sampleUuids = self->_sampleUuids;
  }
  [(NSArray *)sampleUuids addObject:v4];
}

- (void)clearSampleUuids
{
}

- (void)setSampleUuids:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  sampleUuids = self->_sampleUuids;
  self->_sampleUuids = v4;

  MEMORY[0x1F41817F8](v4, sampleUuids);
}

- (BOOL)hasRecordDate
{
  return self->_recordDate != 0;
}

- (void)setRecordDate:(id)a3
{
}

- (BOOL)hasPunchoutUrl
{
  return self->_punchoutUrl != 0;
}

- (void)setPunchoutUrl:(id)a3
{
}

- (BOOL)hasDefaultUnit
{
  return self->_defaultUnit != 0;
}

- (void)setDefaultUnit:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)valuesUserProvidedUnitType
{
  return (Class)objc_opt_class();
}

+ (Class)valuesDefaultUnitType
{
  return (Class)objc_opt_class();
}

+ (Class)sampleUuidsType
{
  return (Class)objc_opt_class();
}

@end