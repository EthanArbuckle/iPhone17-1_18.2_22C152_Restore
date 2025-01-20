@interface INWellnessObjectResultValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (INDateComponentsRange)recordDate;
- (INWellnessObjectResultValue)initWithCoder:(id)a3;
- (INWellnessObjectResultValue)initWithRecordDate:(id)a3 unit:(id)a4 values:(id)a5 resultType:(int64_t)a6;
- (NSArray)values;
- (NSString)unit;
- (id)_dictionaryRepresentation;
- (id)description;
- (id)descriptionAtIndent:(unint64_t)a3;
- (int64_t)resultType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INWellnessObjectResultValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_unit, 0);

  objc_storeStrong((id *)&self->_recordDate, 0);
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (NSArray)values
{
  return self->_values;
}

- (NSString)unit
{
  return self->_unit;
}

- (INDateComponentsRange)recordDate
{
  return self->_recordDate;
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"recordDate";
  recordDate = self->_recordDate;
  v4 = recordDate;
  if (!recordDate)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"unit";
  unit = self->_unit;
  v6 = unit;
  if (!unit)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"values";
  values = self->_values;
  v8 = values;
  if (!values)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (values)
  {
    if (unit) {
      goto LABEL_9;
    }
LABEL_14:

    if (recordDate) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!unit) {
    goto LABEL_14;
  }
LABEL_9:
  if (recordDate) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  v5 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)INWellnessObjectResultValue;
  v6 = [(INWellnessObjectResultValue *)&v11 description];
  v7 = [(INWellnessObjectResultValue *)self _dictionaryRepresentation];
  v8 = [v7 descriptionAtIndent:a3];
  v9 = [v5 stringWithFormat:@"%@ %@", v6, v8];

  return v9;
}

- (id)description
{
  return [(INWellnessObjectResultValue *)self descriptionAtIndent:0];
}

- (void)encodeWithCoder:(id)a3
{
  recordDate = self->_recordDate;
  id v5 = a3;
  [v5 encodeObject:recordDate forKey:@"recordDate"];
  [v5 encodeObject:self->_unit forKey:@"unit"];
  [v5 encodeObject:self->_values forKey:@"values"];
  [v5 encodeInteger:self->_resultType forKey:@"resultType"];
}

- (INWellnessObjectResultValue)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unit"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v9 = [v7 setWithArray:v8];
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"values"];

  uint64_t v11 = [v4 decodeIntegerForKey:@"resultType"];
  v12 = (INWellnessObjectResultValue *)[objc_alloc((Class)objc_opt_class()) initWithRecordDate:v5 unit:v6 values:v10 resultType:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (id *)v4;
    recordDate = self->_recordDate;
    if (recordDate)
    {
      if (v5[1])
      {
        v7 = [(INDateComponentsRange *)recordDate startDateComponents];
        v8 = [v7 date];
        v9 = [v5[1] startDateComponents];
        v10 = [v9 date];
        int v11 = [v8 isEqual:v10];

        if (!v11) {
          goto LABEL_11;
        }
      }
    }
    if ((unit = self->_unit) != 0 && ![(NSString *)unit isEqualToString:v5[2]]
      || (values = self->_values) != 0 && ![(NSArray *)values isEqual:v5[3]])
    {
LABEL_11:
      BOOL v14 = 0;
    }
    else
    {
      BOOL v14 = self->_resultType == (void)v5[4];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INDateComponentsRange *)self->_recordDate hash];
  NSUInteger v4 = [(NSString *)self->_unit hash] ^ v3;
  return v4 ^ [(NSArray *)self->_values hash] ^ self->_resultType;
}

- (INWellnessObjectResultValue)initWithRecordDate:(id)a3 unit:(id)a4 values:(id)a5 resultType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INWellnessObjectResultValue;
  BOOL v14 = [(INWellnessObjectResultValue *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_recordDate, a3);
    objc_storeStrong((id *)&v15->_unit, a4);
    objc_storeStrong((id *)&v15->_values, a5);
    v15->_resultType = a6;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end