@interface MLMultiArrayConstraint
+ (BOOL)supportsSecureCoding;
+ (MLMultiArrayConstraint)constraintWithShape:(id)a3 dataType:(int64_t)a4;
+ (MLMultiArrayConstraint)constraintWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5;
- (BOOL)isAllowedDataType:(int64_t)a3 error:(id *)a4;
- (BOOL)isAllowedShape:(id)a3 error:(id *)a4;
- (BOOL)isAllowedValue:(id)a3 error:(id *)a4;
- (BOOL)isAllowedValue:(id)a3 isNeuralNetworkInputOrOutput:(BOOL)a4 usingRank5Mapping:(BOOL)a5 featureName:(id)a6 error:(id *)a7;
- (MLMultiArrayConstraint)initWithCoder:(id)a3;
- (MLMultiArrayConstraint)initWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5;
- (MLMultiArrayConstraint)initWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5 defaultOptionalValue:(id)a6;
- (MLMultiArrayDataType)dataType;
- (MLMultiArrayShapeConstraint)shapeConstraint;
- (NSArray)shape;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultOptionalValue;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLMultiArrayConstraint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeConstraint, 0);
  objc_storeStrong((id *)&self->_shape, 0);

  objc_storeStrong((id *)&self->_defaultOptionalValue, 0);
}

- (MLMultiArrayShapeConstraint)shapeConstraint
{
  return self->_shapeConstraint;
}

- (MLMultiArrayConstraint)initWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5 defaultOptionalValue:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MLMultiArrayConstraint;
  v14 = [(MLMultiArrayConstraint *)&v23 init];
  if (v14)
  {
    v15 = (MLMultiArrayShapeConstraint *)v12;
    if (!v15)
    {
      uint64_t v16 = [v11 count];
      v17 = [MLMultiArrayShapeConstraint alloc];
      v18 = v17;
      if (v16)
      {
        v24[0] = v11;
        v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
        v15 = [(MLMultiArrayShapeConstraint *)v18 initWithEnumeratedShapes:v19];
      }
      else
      {
        v15 = [(MLMultiArrayShapeConstraint *)v17 initUnspecified];
      }
    }
    objc_storeStrong((id *)&v14->_shape, a3);
    shapeConstraint = v14->_shapeConstraint;
    v14->_dataType = a4;
    v14->_shapeConstraint = v15;
    v21 = v15;

    objc_storeStrong((id *)&v14->_defaultOptionalValue, a6);
  }

  return v14;
}

- (MLMultiArrayDataType)dataType
{
  return self->_dataType;
}

- (BOOL)isAllowedValue:(id)a3 isNeuralNetworkInputOrOutput:(BOOL)a4 usingRank5Mapping:(BOOL)a5 featureName:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  if (a4)
  {
    if ([v12 isUndefined])
    {
      if (a7)
      {
        v14 = @"MultiArrayConstraint cannot check undefined values";
LABEL_16:
        +[MLModelErrorUtils featureTypeErrorWithFormat:v14];
        BOOL v15 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_37;
      }
      goto LABEL_17;
    }
    if ([v12 type] != 5)
    {
      if (a7)
      {
        v14 = @"MultiArrayConstraint only allows MultiArray Feature Values";
        goto LABEL_16;
      }
LABEL_17:
      BOOL v15 = 0;
      goto LABEL_37;
    }
    NSUInteger v16 = [(NSArray *)self->_shape count];
    v17 = [v12 multiArrayValue];
    v18 = [v17 shape];

    uint64_t v19 = [v18 count];
    uint64_t v20 = v19;
    if (v9)
    {
      if (v16 != v19)
      {
        if (v16 + 2 == v19)
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (v16)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              objc_super v23 = [v18 objectAtIndexedSubscript:i + 2];
              [v21 setObject:v23 atIndexedSubscript:i];
            }
          }
          goto LABEL_13;
        }
        if (v16 == 1 && v19 == 5)
        {
          v28 = [v18 objectAtIndexedSubscript:3];
          if ([v28 integerValue] == 1)
          {
            v29 = [v18 objectAtIndexedSubscript:4];
            uint64_t v30 = [v29 integerValue];

            if (v30 == 1)
            {
              v31 = [v18 objectAtIndexedSubscript:2];
              v34[0] = v31;
              id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];

LABEL_13:
              BOOL v15 = [(MLMultiArrayConstraint *)self isAllowedShape:v21 error:a7];

LABEL_36:
              goto LABEL_37;
            }
          }
          else
          {
          }
          if (a7)
          {
            v32 = @"Neural network model expects vector inputs, but non-unit height or width dimensions were provided.";
            goto LABEL_34;
          }
        }
        else if (a7)
        {
          v32 = @"Neural Network (<=version 3) inputs can only be of size 1, 3, or 5.";
LABEL_34:
          +[MLModelErrorUtils featureTypeErrorWithFormat:v32];
          BOOL v15 = 0;
          *a7 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
LABEL_35:
        BOOL v15 = 0;
        goto LABEL_36;
      }
    }
    else if (v19 != v16)
    {
      if (v19)
      {
        v24 = [(MLMultiArrayShapeConstraint *)self->_shapeConstraint shapeSet];
        uint64_t v25 = [v24 count];

        if (v25 == 1)
        {
          if (a7)
          {
            v26 = [NSNumber numberWithUnsignedInteger:v16];
            v27 = [NSNumber numberWithUnsignedInteger:v20];
            *a7 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"According to model description, feature '%@' must be of rank %@, instead got a multi-array value of rank %@.", v13, v26, v27];
          }
          goto LABEL_35;
        }
      }
    }
    BOOL v15 = [(MLMultiArrayConstraint *)self isAllowedShape:v18 error:a7];
    goto LABEL_36;
  }
  BOOL v15 = [(MLMultiArrayConstraint *)self isAllowedValue:v12 error:a7];
LABEL_37:

  return v15;
}

- (BOOL)isAllowedShape:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(NSArray *)self->_shape count]) {
    BOOL v7 = [(MLMultiArrayShapeConstraint *)self->_shapeConstraint isAllowedShape:v6 error:a4];
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (NSArray)shape
{
  return self->_shape;
}

- (MLMultiArrayConstraint)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:3];
  objc_msgSend(v6, "addObjectsFromArray:", v7, v14, v15);

  v8 = [v5 allowedClasses];
  [v6 unionSet:v8];

  BOOL v9 = [v5 decodeObjectOfClasses:v6 forKey:@"shape"];
  uint64_t v10 = [v5 decodeIntegerForKey:@"dataType"];
  id v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"shapeConstraint"];

  id v12 = [(MLMultiArrayConstraint *)self initWithShape:v9 dataType:v10 shapeConstraint:v11];
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MLMultiArrayConstraint *)self shape];
  [v4 encodeObject:v5 forKey:@"shape"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[MLMultiArrayConstraint dataType](self, "dataType"), @"dataType");
  id v6 = [(MLMultiArrayConstraint *)self shapeConstraint];
  [v4 encodeObject:v6 forKey:@"shapeConstraint"];
}

- (id)description
{
  v3 = NSString;
  id v4 = +[MLMultiArrayUtils stringForDataType:self->_dataType];
  id v5 = [(NSArray *)self->_shape componentsJoinedByString:@" × "];
  id v6 = [v3 stringWithFormat:@"%@, %@", v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[MLMultiArrayConstraint allocWithZone:a3];
  shape = self->_shape;
  int64_t dataType = self->_dataType;
  shapeConstraint = self->_shapeConstraint;

  return [(MLMultiArrayConstraint *)v4 initWithShape:shape dataType:dataType shapeConstraint:shapeConstraint];
}

- (id)defaultOptionalValue
{
  return self->_defaultOptionalValue;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isUndefined])
  {
    if (a4)
    {
      BOOL v7 = @"MultiArrayConstraint cannot check undefined values";
LABEL_9:
      +[MLModelErrorUtils featureTypeErrorWithFormat:v7];
      BOOL v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if ([v6 type] != 5)
  {
    if (a4)
    {
      BOOL v7 = @"MultiArrayConstraint only allows MultiArray Feature Values";
      goto LABEL_9;
    }
LABEL_10:
    BOOL v10 = 0;
    goto LABEL_13;
  }
  v8 = [v6 multiArrayValue];
  BOOL v9 = [v8 shape];
  if ([(MLMultiArrayConstraint *)self isAllowedShape:v9 error:a4]) {
    BOOL v10 = -[MLMultiArrayConstraint isAllowedDataType:error:](self, "isAllowedDataType:error:", [v8 dataType], a4);
  }
  else {
    BOOL v10 = 0;
  }

LABEL_13:
  return v10;
}

- (BOOL)isAllowedDataType:(int64_t)a3 error:(id *)a4
{
  int64_t dataType = self->_dataType;
  if (a4 && dataType != a3)
  {
    BOOL v7 = +[MLMultiArrayUtils stringForDataType:dataType];
    v8 = +[MLMultiArrayUtils stringForDataType:a3];
    *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"MultiArray dataType should be %@ but is %@", v7, v8];
  }
  return dataType == a3;
}

- (MLMultiArrayConstraint)initWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5
{
  return [(MLMultiArrayConstraint *)self initWithShape:a3 dataType:a4 shapeConstraint:a5 defaultOptionalValue:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MLMultiArrayConstraint)constraintWithShape:(id)a3 dataType:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = (void *)[objc_alloc((Class)a1) initWithShape:v6 dataType:a4 shapeConstraint:0 defaultOptionalValue:0];

  return (MLMultiArrayConstraint *)v7;
}

+ (MLMultiArrayConstraint)constraintWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  BOOL v10 = (void *)[objc_alloc((Class)a1) initWithShape:v9 dataType:a4 shapeConstraint:v8];

  return (MLMultiArrayConstraint *)v10;
}

@end