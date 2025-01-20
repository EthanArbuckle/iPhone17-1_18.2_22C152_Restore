@interface _INPBSaveHealthSampleIntent
+ (BOOL)supportsSecureCoding;
+ (Class)sampleMetadataType;
+ (Class)valuesType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasObjectType;
- (BOOL)hasRecordDate;
- (BOOL)hasUnit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)sampleMetadatas;
- (NSArray)values;
- (_INPBDateTimeRange)recordDate;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBSaveHealthSampleIntent)initWithCoder:(id)a3;
- (_INPBWellnessUnitType)unit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)objectTypeAsString:(int)a3;
- (id)sampleMetadataAtIndex:(unint64_t)a3;
- (id)valuesAtIndex:(unint64_t)a3;
- (int)StringAsObjectType:(id)a3;
- (int)objectType;
- (unint64_t)hash;
- (unint64_t)sampleMetadatasCount;
- (unint64_t)valuesCount;
- (void)addSampleMetadata:(id)a3;
- (void)addValues:(id)a3;
- (void)clearSampleMetadatas;
- (void)clearValues;
- (void)encodeWithCoder:(id)a3;
- (void)setHasObjectType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setObjectType:(int)a3;
- (void)setRecordDate:(id)a3;
- (void)setSampleMetadatas:(id)a3;
- (void)setUnit:(id)a3;
- (void)setValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBSaveHealthSampleIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_sampleMetadatas, 0);
  objc_storeStrong((id *)&self->_recordDate, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (NSArray)values
{
  return self->_values;
}

- (_INPBWellnessUnitType)unit
{
  return self->_unit;
}

- (NSArray)sampleMetadatas
{
  return self->_sampleMetadatas;
}

- (_INPBDateTimeRange)recordDate
{
  return self->_recordDate;
}

- (int)objectType
{
  return self->_objectType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (id)dictionaryRepresentation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBSaveHealthSampleIntent *)self intentMetadata];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBSaveHealthSampleIntent *)self hasObjectType])
  {
    uint64_t v6 = [(_INPBSaveHealthSampleIntent *)self objectType];
    if (v6 >= 0x4B)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E551B2A0[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"objectType"];
  }
  v8 = [(_INPBSaveHealthSampleIntent *)self recordDate];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"recordDate"];

  if ([(NSArray *)self->_sampleMetadatas count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v11 = self->_sampleMetadatas;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v32 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"sampleMetadata"];
  }
  v17 = [(_INPBSaveHealthSampleIntent *)self unit];
  v18 = [v17 dictionaryRepresentation];
  [v3 setObject:v18 forKeyedSubscript:@"unit"];

  if ([(NSArray *)self->_values count])
  {
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v20 = self->_values;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v28 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v27 + 1) + 8 * j) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"values"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBSaveHealthSampleIntent *)self hasObjectType]) {
    uint64_t v4 = 2654435761 * self->_objectType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(_INPBDateTimeRange *)self->_recordDate hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSArray *)self->_sampleMetadatas hash];
  unint64_t v8 = [(_INPBWellnessUnitType *)self->_unit hash];
  return v7 ^ v8 ^ [(NSArray *)self->_values hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntent *)self intentMetadata];
  unint64_t v6 = [v4 intentMetadata];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v7 = [(_INPBSaveHealthSampleIntent *)self intentMetadata];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(_INPBSaveHealthSampleIntent *)self intentMetadata];
    v10 = [v4 intentMetadata];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  int v12 = [(_INPBSaveHealthSampleIntent *)self hasObjectType];
  if (v12 != [v4 hasObjectType]) {
    goto LABEL_31;
  }
  if ([(_INPBSaveHealthSampleIntent *)self hasObjectType])
  {
    if ([v4 hasObjectType])
    {
      int objectType = self->_objectType;
      if (objectType != [v4 objectType]) {
        goto LABEL_31;
      }
    }
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntent *)self recordDate];
  unint64_t v6 = [v4 recordDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v14 = [(_INPBSaveHealthSampleIntent *)self recordDate];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBSaveHealthSampleIntent *)self recordDate];
    v17 = [v4 recordDate];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntent *)self sampleMetadatas];
  unint64_t v6 = [v4 sampleMetadatas];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v19 = [(_INPBSaveHealthSampleIntent *)self sampleMetadatas];
  if (v19)
  {
    v20 = (void *)v19;
    uint64_t v21 = [(_INPBSaveHealthSampleIntent *)self sampleMetadatas];
    uint64_t v22 = [v4 sampleMetadatas];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntent *)self unit];
  unint64_t v6 = [v4 unit];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_30;
  }
  uint64_t v24 = [(_INPBSaveHealthSampleIntent *)self unit];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_INPBSaveHealthSampleIntent *)self unit];
    long long v27 = [v4 unit];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBSaveHealthSampleIntent *)self values];
  unint64_t v6 = [v4 values];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v29 = [(_INPBSaveHealthSampleIntent *)self values];
    if (!v29)
    {

LABEL_34:
      BOOL v34 = 1;
      goto LABEL_32;
    }
    long long v30 = (void *)v29;
    long long v31 = [(_INPBSaveHealthSampleIntent *)self values];
    long long v32 = [v4 values];
    char v33 = [v31 isEqual:v32];

    if (v33) {
      goto LABEL_34;
    }
  }
  else
  {
LABEL_30:
  }
LABEL_31:
  BOOL v34 = 0;
LABEL_32:

  return v34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBSaveHealthSampleIntent allocWithZone:](_INPBSaveHealthSampleIntent, "allocWithZone:") init];
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBSaveHealthSampleIntent *)v5 setIntentMetadata:v6];

  if ([(_INPBSaveHealthSampleIntent *)self hasObjectType]) {
    [(_INPBSaveHealthSampleIntent *)v5 setObjectType:[(_INPBSaveHealthSampleIntent *)self objectType]];
  }
  id v7 = [(_INPBDateTimeRange *)self->_recordDate copyWithZone:a3];
  [(_INPBSaveHealthSampleIntent *)v5 setRecordDate:v7];

  unint64_t v8 = (void *)[(NSArray *)self->_sampleMetadatas copyWithZone:a3];
  [(_INPBSaveHealthSampleIntent *)v5 setSampleMetadatas:v8];

  id v9 = [(_INPBWellnessUnitType *)self->_unit copyWithZone:a3];
  [(_INPBSaveHealthSampleIntent *)v5 setUnit:v9];

  v10 = (void *)[(NSArray *)self->_values copyWithZone:a3];
  [(_INPBSaveHealthSampleIntent *)v5 setValues:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBSaveHealthSampleIntent *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBSaveHealthSampleIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBSaveHealthSampleIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        unint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBSaveHealthSampleIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBSaveHealthSampleIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBSaveHealthSampleIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBSaveHealthSampleIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBSaveHealthSampleIntent *)self hasObjectType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(_INPBSaveHealthSampleIntent *)self recordDate];

  if (v7)
  {
    unint64_t v8 = [(_INPBSaveHealthSampleIntent *)self recordDate];
    PBDataWriterWriteSubmessage();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = self->_sampleMetadatas;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  uint64_t v14 = [(_INPBSaveHealthSampleIntent *)self unit];

  if (v14)
  {
    v15 = [(_INPBSaveHealthSampleIntent *)self unit];
    PBDataWriterWriteSubmessage();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v16 = self->_values;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSaveHealthSampleIntentReadFrom(self, (uint64_t)a3);
}

- (id)valuesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_values objectAtIndexedSubscript:a3];
}

- (unint64_t)valuesCount
{
  return [(NSArray *)self->_values count];
}

- (void)addValues:(id)a3
{
  id v4 = a3;
  values = self->_values;
  id v8 = v4;
  if (!values)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_values;
    self->_values = v6;

    id v4 = v8;
    values = self->_values;
  }
  [(NSArray *)values addObject:v4];
}

- (void)clearValues
{
}

- (void)setValues:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  values = self->_values;
  self->_values = v4;

  MEMORY[0x1F41817F8](v4, values);
}

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (void)setUnit:(id)a3
{
}

- (id)sampleMetadataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_sampleMetadatas objectAtIndexedSubscript:a3];
}

- (unint64_t)sampleMetadatasCount
{
  return [(NSArray *)self->_sampleMetadatas count];
}

- (void)addSampleMetadata:(id)a3
{
  id v4 = a3;
  sampleMetadatas = self->_sampleMetadatas;
  id v8 = v4;
  if (!sampleMetadatas)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_sampleMetadatas;
    self->_sampleMetadatas = v6;

    id v4 = v8;
    sampleMetadatas = self->_sampleMetadatas;
  }
  [(NSArray *)sampleMetadatas addObject:v4];
}

- (void)clearSampleMetadatas
{
}

- (void)setSampleMetadatas:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  sampleMetadatas = self->_sampleMetadatas;
  self->_sampleMetadatas = v4;

  MEMORY[0x1F41817F8](v4, sampleMetadatas);
}

- (BOOL)hasRecordDate
{
  return self->_recordDate != 0;
}

- (void)setRecordDate:(id)a3
{
}

- (int)StringAsObjectType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BASAL_BODY_TEMPERATURE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BIOTIN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BLOOD_ALCOHOL_CONTENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BLOOD_GLUCOSE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BLOOD_PRESSURE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BLOOD_PRESSURE_DIASTOLIC"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BLOOD_PRESSURE_SYSTOLIC"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"BLOOD_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BODY_FAT_PERCENTAGE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BODY_MASS_INDEX"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BODY_TEMPERATURE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CAFFEINE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CALCIUM"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CARBOHYDRATES"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CHLORIDE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"CHROMIUM"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"COPPER"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"DIETARY_CHOLESTEROL"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"DIETARY_SUGAR"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ELECTRODERMAL_ACTIVITY"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"ENERGY_CONSUMED"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"FAT_MONOUN_SATURATED"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FAT_POLYUN_SATURATED"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"FAT_SATURATED"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"FAT_TOTAL"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"FIBER"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"FOLATE"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"FORCED_EXPIRATORY_VOLUME"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"FORCED_VITAL_CAPACITY"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"HEART_RATE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"HEART_RATE_VARIABILITY_SDNN"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"HEIGHT"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"INHALER_USAGE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"INSULIN_DELIVERY"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"IODINE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"IRON"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"LEAN_BODY_MASS"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"MAGNESIUM"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"MANGANESE"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"MOLYBDENUM"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"NIACIN"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"NUMBER_OF_TIMES_FALLEN"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"OXYGEN_SATURATION"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"PANTOTHENIC_ACID"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"PEAK_EXPIRATORY_FLOW_RATE"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"PERIPHERAL_PERFUSION_INDEX"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"PHOSPHORUS"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"POTASSIUM"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"PROTEIN"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"RESPIRATORY_RATE"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"RESTINGHEART_RATE"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"RIBOFLAVIN"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"SELENIUM"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"SODIUM"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"THIAMIN"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"UV_INDEX"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"VITAMIN_A"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"VITAMIN_B12"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"VITAMIN_B6"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"VITAMIN_C"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"VITAMIN_D"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"VITAMIN_E"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"VITAMIN_K"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"WAIST_CIRCUMFERENCE"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"WALKING_HEART_RATE_AVERAGE"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"WATER"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"WEIGHT"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"ZINC"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"CERVICAL_MUCUS_QUALITY"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"OVULATION_TEST_RESULT"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"MENSTRUAL_FLOW"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"INTERMENSTRUAL_BLEEDING"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"SEXUAL_ACTIVITY"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"MINDFUL_SESSION"])
  {
    int v4 = 74;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)objectTypeAsString:(int)a3
{
  if (a3 >= 0x4B)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551B2A0[a3];
  }

  return v3;
}

- (void)setHasObjectType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasObjectType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setObjectType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int objectType = a3;
  }
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIntentMetadata:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)valuesType
{
  return (Class)objc_opt_class();
}

+ (Class)sampleMetadataType
{
  return (Class)objc_opt_class();
}

@end