@interface _INPBWellnessObjectResultValue
+ (BOOL)supportsSecureCoding;
+ (Class)valuesType;
- (BOOL)hasRecordDate;
- (BOOL)hasResultType;
- (BOOL)hasUnit;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)values;
- (_INPBDateTimeRange)recordDate;
- (_INPBString)unit;
- (_INPBWellnessObjectResultValue)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)resultTypeAsString:(int)a3;
- (id)valuesAtIndex:(unint64_t)a3;
- (int)StringAsResultType:(id)a3;
- (int)resultType;
- (unint64_t)hash;
- (unint64_t)valuesCount;
- (void)addValues:(id)a3;
- (void)clearValues;
- (void)encodeWithCoder:(id)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setRecordDate:(id)a3;
- (void)setResultType:(int)a3;
- (void)setUnit:(id)a3;
- (void)setValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBWellnessObjectResultValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_unit, 0);

  objc_storeStrong((id *)&self->_recordDate, 0);
}

- (NSArray)values
{
  return self->_values;
}

- (_INPBString)unit
{
  return self->_unit;
}

- (int)resultType
{
  return self->_resultType;
}

- (_INPBDateTimeRange)recordDate
{
  return self->_recordDate;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBWellnessObjectResultValue *)self recordDate];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"recordDate"];

  if ([(_INPBWellnessObjectResultValue *)self hasResultType])
  {
    uint64_t v6 = [(_INPBWellnessObjectResultValue *)self resultType];
    if (v6 >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E551BB30[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"resultType"];
  }
  v8 = [(_INPBWellnessObjectResultValue *)self unit];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"unit"];

  if ([(NSArray *)self->_values count])
  {
    v10 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_values;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKeyedSubscript:@"values"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBDateTimeRange *)self->_recordDate hash];
  if ([(_INPBWellnessObjectResultValue *)self hasResultType]) {
    uint64_t v4 = 2654435761 * self->_resultType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  unint64_t v6 = [(_INPBString *)self->_unit hash];
  return v5 ^ v6 ^ [(NSArray *)self->_values hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  unint64_t v5 = [(_INPBWellnessObjectResultValue *)self recordDate];
  unint64_t v6 = [v4 recordDate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v7 = [(_INPBWellnessObjectResultValue *)self recordDate];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBWellnessObjectResultValue *)self recordDate];
    v10 = [v4 recordDate];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  int v12 = [(_INPBWellnessObjectResultValue *)self hasResultType];
  if (v12 != [v4 hasResultType]) {
    goto LABEL_21;
  }
  if ([(_INPBWellnessObjectResultValue *)self hasResultType])
  {
    if ([v4 hasResultType])
    {
      int resultType = self->_resultType;
      if (resultType != [v4 resultType]) {
        goto LABEL_21;
      }
    }
  }
  unint64_t v5 = [(_INPBWellnessObjectResultValue *)self unit];
  unint64_t v6 = [v4 unit];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBWellnessObjectResultValue *)self unit];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBWellnessObjectResultValue *)self unit];
    v17 = [v4 unit];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  unint64_t v5 = [(_INPBWellnessObjectResultValue *)self values];
  unint64_t v6 = [v4 values];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v19 = [(_INPBWellnessObjectResultValue *)self values];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    long long v20 = (void *)v19;
    long long v21 = [(_INPBWellnessObjectResultValue *)self values];
    v22 = [v4 values];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[_INPBWellnessObjectResultValue allocWithZone:](_INPBWellnessObjectResultValue, "allocWithZone:") init];
  id v6 = [(_INPBDateTimeRange *)self->_recordDate copyWithZone:a3];
  [(_INPBWellnessObjectResultValue *)v5 setRecordDate:v6];

  if ([(_INPBWellnessObjectResultValue *)self hasResultType]) {
    [(_INPBWellnessObjectResultValue *)v5 setResultType:[(_INPBWellnessObjectResultValue *)self resultType]];
  }
  id v7 = [(_INPBString *)self->_unit copyWithZone:a3];
  [(_INPBWellnessObjectResultValue *)v5 setUnit:v7];

  v8 = (void *)[(NSArray *)self->_values copyWithZone:a3];
  [(_INPBWellnessObjectResultValue *)v5 setValues:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBWellnessObjectResultValue *)self data];
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBWellnessObjectResultValue)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBWellnessObjectResultValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBWellnessObjectResultValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBWellnessObjectResultValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(_INPBWellnessObjectResultValue *)self recordDate];

  if (v5)
  {
    id v6 = [(_INPBWellnessObjectResultValue *)self recordDate];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBWellnessObjectResultValue *)self hasResultType]) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(_INPBWellnessObjectResultValue *)self unit];

  if (v7)
  {
    v8 = [(_INPBWellnessObjectResultValue *)self unit];
    PBDataWriterWriteSubmessage();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_values;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBWellnessObjectResultValueReadFrom(self, (uint64_t)a3);
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

- (int)StringAsResultType:(id)a3
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

- (id)resultTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551BB30[a3];
  }

  return v3;
}

- (void)setHasResultType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasResultType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResultType:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int resultType = a3;
  }
}

- (BOOL)hasRecordDate
{
  return self->_recordDate != 0;
}

- (void)setRecordDate:(id)a3
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

@end