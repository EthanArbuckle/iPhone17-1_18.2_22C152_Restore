@interface _INPBQueryHealthSampleIntent
+ (BOOL)supportsSecureCoding;
+ (Class)recordDateType;
+ (Class)thresholdValuesType;
- (BOOL)hasExpectedResultType;
- (BOOL)hasIntentMetadata;
- (BOOL)hasObjectType;
- (BOOL)hasQuestionType;
- (BOOL)hasUnit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)recordDates;
- (NSArray)thresholdValues;
- (_INPBIntentMetadata)intentMetadata;
- (_INPBQueryHealthSampleIntent)initWithCoder:(id)a3;
- (_INPBWellnessUnitType)unit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)expectedResultTypeAsString:(int)a3;
- (id)objectTypeAsString:(int)a3;
- (id)questionTypeAsString:(int)a3;
- (id)recordDateAtIndex:(unint64_t)a3;
- (id)thresholdValuesAtIndex:(unint64_t)a3;
- (int)StringAsExpectedResultType:(id)a3;
- (int)StringAsObjectType:(id)a3;
- (int)StringAsQuestionType:(id)a3;
- (int)expectedResultType;
- (int)objectType;
- (int)questionType;
- (unint64_t)hash;
- (unint64_t)recordDatesCount;
- (unint64_t)thresholdValuesCount;
- (void)addRecordDate:(id)a3;
- (void)addThresholdValues:(id)a3;
- (void)clearRecordDates;
- (void)clearThresholdValues;
- (void)encodeWithCoder:(id)a3;
- (void)setExpectedResultType:(int)a3;
- (void)setHasExpectedResultType:(BOOL)a3;
- (void)setHasObjectType:(BOOL)a3;
- (void)setHasQuestionType:(BOOL)a3;
- (void)setIntentMetadata:(id)a3;
- (void)setObjectType:(int)a3;
- (void)setQuestionType:(int)a3;
- (void)setRecordDates:(id)a3;
- (void)setThresholdValues:(id)a3;
- (void)setUnit:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBQueryHealthSampleIntent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_thresholdValues, 0);
  objc_storeStrong((id *)&self->_recordDates, 0);

  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

- (_INPBWellnessUnitType)unit
{
  return self->_unit;
}

- (NSArray)thresholdValues
{
  return self->_thresholdValues;
}

- (NSArray)recordDates
{
  return self->_recordDates;
}

- (int)questionType
{
  return self->_questionType;
}

- (int)objectType
{
  return self->_objectType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)expectedResultType
{
  return self->_expectedResultType;
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBQueryHealthSampleIntent *)self hasExpectedResultType])
  {
    uint64_t v4 = [(_INPBQueryHealthSampleIntent *)self expectedResultType];
    if (v4 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E55170F0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"expectedResultType"];
  }
  v6 = [(_INPBQueryHealthSampleIntent *)self intentMetadata];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"intentMetadata"];

  if ([(_INPBQueryHealthSampleIntent *)self hasObjectType])
  {
    uint64_t v8 = [(_INPBQueryHealthSampleIntent *)self objectType];
    if (v8 >= 0x4B)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E5517140[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"objectType"];
  }
  if ([(_INPBQueryHealthSampleIntent *)self hasQuestionType])
  {
    uint64_t v10 = [(_INPBQueryHealthSampleIntent *)self questionType];
    if (v10 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E5517398[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"questionType"];
  }
  if ([(NSArray *)self->_recordDates count])
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v13 = self->_recordDates;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v33 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"recordDate"];
  }
  if ([(NSArray *)self->_thresholdValues count])
  {
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v20 = self->_thresholdValues;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v29 + 1) + 8 * j) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"thresholdValues"];
  }
  v26 = [(_INPBQueryHealthSampleIntent *)self unit];
  v27 = [v26 dictionaryRepresentation];
  [v3 setObject:v27 forKeyedSubscript:@"unit"];

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBQueryHealthSampleIntent *)self hasExpectedResultType]) {
    uint64_t v3 = 2654435761 * self->_expectedResultType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBIntentMetadata *)self->_intentMetadata hash];
  if ([(_INPBQueryHealthSampleIntent *)self hasObjectType]) {
    uint64_t v5 = 2654435761 * self->_objectType;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBQueryHealthSampleIntent *)self hasQuestionType]) {
    uint64_t v6 = 2654435761 * self->_questionType;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSArray *)self->_recordDates hash];
  uint64_t v8 = [(NSArray *)self->_thresholdValues hash];
  return v7 ^ v8 ^ [(_INPBWellnessUnitType *)self->_unit hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  int v5 = [(_INPBQueryHealthSampleIntent *)self hasExpectedResultType];
  if (v5 != [v4 hasExpectedResultType]) {
    goto LABEL_34;
  }
  if ([(_INPBQueryHealthSampleIntent *)self hasExpectedResultType])
  {
    if ([v4 hasExpectedResultType])
    {
      int expectedResultType = self->_expectedResultType;
      if (expectedResultType != [v4 expectedResultType]) {
        goto LABEL_34;
      }
    }
  }
  uint64_t v7 = [(_INPBQueryHealthSampleIntent *)self intentMetadata];
  uint64_t v8 = [v4 intentMetadata];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_33;
  }
  uint64_t v9 = [(_INPBQueryHealthSampleIntent *)self intentMetadata];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    v11 = [(_INPBQueryHealthSampleIntent *)self intentMetadata];
    v12 = [v4 intentMetadata];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  int v14 = [(_INPBQueryHealthSampleIntent *)self hasObjectType];
  if (v14 != [v4 hasObjectType]) {
    goto LABEL_34;
  }
  if ([(_INPBQueryHealthSampleIntent *)self hasObjectType])
  {
    if ([v4 hasObjectType])
    {
      int objectType = self->_objectType;
      if (objectType != [v4 objectType]) {
        goto LABEL_34;
      }
    }
  }
  int v16 = [(_INPBQueryHealthSampleIntent *)self hasQuestionType];
  if (v16 != [v4 hasQuestionType]) {
    goto LABEL_34;
  }
  if ([(_INPBQueryHealthSampleIntent *)self hasQuestionType])
  {
    if ([v4 hasQuestionType])
    {
      int questionType = self->_questionType;
      if (questionType != [v4 questionType]) {
        goto LABEL_34;
      }
    }
  }
  uint64_t v7 = [(_INPBQueryHealthSampleIntent *)self recordDates];
  uint64_t v8 = [v4 recordDates];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_33;
  }
  uint64_t v18 = [(_INPBQueryHealthSampleIntent *)self recordDates];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(_INPBQueryHealthSampleIntent *)self recordDates];
    uint64_t v21 = [v4 recordDates];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_INPBQueryHealthSampleIntent *)self thresholdValues];
  uint64_t v8 = [v4 thresholdValues];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_33;
  }
  uint64_t v23 = [(_INPBQueryHealthSampleIntent *)self thresholdValues];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(_INPBQueryHealthSampleIntent *)self thresholdValues];
    v26 = [v4 thresholdValues];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_34;
    }
  }
  else
  {
  }
  uint64_t v7 = [(_INPBQueryHealthSampleIntent *)self unit];
  uint64_t v8 = [v4 unit];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v28 = [(_INPBQueryHealthSampleIntent *)self unit];
    if (!v28)
    {

LABEL_37:
      BOOL v33 = 1;
      goto LABEL_35;
    }
    long long v29 = (void *)v28;
    long long v30 = [(_INPBQueryHealthSampleIntent *)self unit];
    long long v31 = [v4 unit];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_37;
    }
  }
  else
  {
LABEL_33:
  }
LABEL_34:
  BOOL v33 = 0;
LABEL_35:

  return v33;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBQueryHealthSampleIntent allocWithZone:](_INPBQueryHealthSampleIntent, "allocWithZone:") init];
  if ([(_INPBQueryHealthSampleIntent *)self hasExpectedResultType]) {
    [(_INPBQueryHealthSampleIntent *)v5 setExpectedResultType:[(_INPBQueryHealthSampleIntent *)self expectedResultType]];
  }
  id v6 = [(_INPBIntentMetadata *)self->_intentMetadata copyWithZone:a3];
  [(_INPBQueryHealthSampleIntent *)v5 setIntentMetadata:v6];

  if ([(_INPBQueryHealthSampleIntent *)self hasObjectType]) {
    [(_INPBQueryHealthSampleIntent *)v5 setObjectType:[(_INPBQueryHealthSampleIntent *)self objectType]];
  }
  if ([(_INPBQueryHealthSampleIntent *)self hasQuestionType]) {
    [(_INPBQueryHealthSampleIntent *)v5 setQuestionType:[(_INPBQueryHealthSampleIntent *)self questionType]];
  }
  uint64_t v7 = (void *)[(NSArray *)self->_recordDates copyWithZone:a3];
  [(_INPBQueryHealthSampleIntent *)v5 setRecordDates:v7];

  uint64_t v8 = (void *)[(NSArray *)self->_thresholdValues copyWithZone:a3];
  [(_INPBQueryHealthSampleIntent *)v5 setThresholdValues:v8];

  id v9 = [(_INPBWellnessUnitType *)self->_unit copyWithZone:a3];
  [(_INPBQueryHealthSampleIntent *)v5 setUnit:v9];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBQueryHealthSampleIntent *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBQueryHealthSampleIntent)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBQueryHealthSampleIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBQueryHealthSampleIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBQueryHealthSampleIntent *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(_INPBQueryHealthSampleIntent *)self hasExpectedResultType]) {
    PBDataWriterWriteInt32Field();
  }
  int v5 = [(_INPBQueryHealthSampleIntent *)self intentMetadata];

  if (v5)
  {
    id v6 = [(_INPBQueryHealthSampleIntent *)self intentMetadata];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBQueryHealthSampleIntent *)self hasObjectType]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBQueryHealthSampleIntent *)self hasQuestionType]) {
    PBDataWriterWriteInt32Field();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = self->_recordDates;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v9);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = self->_thresholdValues;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  v17 = [(_INPBQueryHealthSampleIntent *)self unit];

  if (v17)
  {
    uint64_t v18 = [(_INPBQueryHealthSampleIntent *)self unit];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBQueryHealthSampleIntentReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (void)setUnit:(id)a3
{
}

- (id)thresholdValuesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_thresholdValues objectAtIndexedSubscript:a3];
}

- (unint64_t)thresholdValuesCount
{
  return [(NSArray *)self->_thresholdValues count];
}

- (void)addThresholdValues:(id)a3
{
  id v4 = a3;
  thresholdValues = self->_thresholdValues;
  id v8 = v4;
  if (!thresholdValues)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_thresholdValues;
    self->_thresholdValues = v6;

    id v4 = v8;
    thresholdValues = self->_thresholdValues;
  }
  [(NSArray *)thresholdValues addObject:v4];
}

- (void)clearThresholdValues
{
}

- (void)setThresholdValues:(id)a3
{
  self->_thresholdValues = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)recordDateAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_recordDates objectAtIndexedSubscript:a3];
}

- (unint64_t)recordDatesCount
{
  return [(NSArray *)self->_recordDates count];
}

- (void)addRecordDate:(id)a3
{
  id v4 = a3;
  recordDates = self->_recordDates;
  id v8 = v4;
  if (!recordDates)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_recordDates;
    self->_recordDates = v6;

    id v4 = v8;
    recordDates = self->_recordDates;
  }
  [(NSArray *)recordDates addObject:v4];
}

- (void)clearRecordDates
{
}

- (void)setRecordDates:(id)a3
{
  self->_recordDates = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (int)StringAsQuestionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_QUESTION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VERIFICATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"QUANTIFICATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TEMPORAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COMPARISON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"QUALITY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SPEED_RATE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"INSTANCE_COUNT"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)questionTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5517398[a3];
  }

  return v3;
}

- (void)setHasQuestionType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasQuestionType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setQuestionType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int questionType = a3;
  }
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
    id v3 = off_1E5517140[a3];
  }

  return v3;
}

- (void)setHasObjectType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasObjectType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setObjectType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
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

- (int)StringAsExpectedResultType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_RESULT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RAW"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AVERAGE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MINIMUM"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAXIMUM"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUM"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FIRST"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LAST"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ABOVE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BELOW"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)expectedResultTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55170F0[a3];
  }

  return v3;
}

- (void)setHasExpectedResultType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpectedResultType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExpectedResultType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int expectedResultType = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)thresholdValuesType
{
  return (Class)objc_opt_class();
}

+ (Class)recordDateType
{
  return (Class)objc_opt_class();
}

@end