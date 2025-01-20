@interface MLSequence
+ (BOOL)supportsSecureCoding;
+ (MLSequence)emptySequenceWithType:(MLFeatureType)type;
+ (MLSequence)sequenceWithInt64Array:(NSArray *)int64Values;
+ (MLSequence)sequenceWithStringArray:(NSArray *)stringValues;
+ (id)sequenceFromArray:(id)a3 error:(id *)a4;
- (MLFeatureType)type;
- (MLSequence)initWithArray:(id)a3 type:(int64_t)a4;
- (MLSequence)initWithCoder:(id)a3;
- (NSArray)featureValues;
- (NSArray)int64Values;
- (NSArray)stringValues;
- (NSArray)values;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLSequence

- (void).cxx_destruct
{
}

- (NSArray)values
{
  return self->_values;
}

- (MLFeatureType)type
{
  return self->_type;
}

- (MLSequence)initWithCoder:(id)a3
{
  v12[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (int)[v4 decodeIntForKey:@"type"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  v12[4] = objc_opt_class();
  v12[5] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:6];
  [v6 addObjectsFromArray:v7];

  v8 = [v4 allowedClasses];
  [v6 unionSet:v8];

  v9 = [v4 decodeObjectOfClasses:v6 forKey:@"values"];

  v10 = [(MLSequence *)self initWithArray:v9 type:v5];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[MLSequence type](self, "type"), @"type");
  id v5 = [(MLSequence *)self values];
  [v4 encodeObject:v5 forKey:@"values"];
}

- (NSArray)int64Values
{
  if (self->_type == 1) {
    return self->_values;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (NSArray)stringValues
{
  if (self->_type == 3) {
    return self->_values;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (MLSequence)initWithArray:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLSequence;
  v8 = [(MLSequence *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a4;
    objc_storeStrong((id *)&v8->_values, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MLSequence)sequenceWithInt64Array:(NSArray *)int64Values
{
  id v4 = int64Values;
  id v5 = (void *)[objc_alloc((Class)a1) initWithArray:v4 type:1];

  return (MLSequence *)v5;
}

+ (MLSequence)sequenceWithStringArray:(NSArray *)stringValues
{
  id v4 = stringValues;
  id v5 = (void *)[objc_alloc((Class)a1) initWithArray:v4 type:3];

  return (MLSequence *)v5;
}

+ (id)sequenceFromArray:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v12 = 0;
    int64_t v7 = +[MLFeatureTypeUtils featureTypeForValuesInArray:v6 error:&v12];
    id v8 = v12;
    v9 = v8;
    if (v8)
    {
      v10 = 0;
      if (a4) {
        *a4 = v8;
      }
    }
    else
    {
      v10 = (void *)[objc_alloc((Class)a1) initWithArray:v6 type:v7];
    }
  }
  else
  {
    v10 = (void *)[objc_alloc((Class)a1) initWithArray:v6 type:0];
  }

  return v10;
}

+ (MLSequence)emptySequenceWithType:(MLFeatureType)type
{
  id v4 = objc_alloc((Class)a1);
  id v5 = (void *)[v4 initWithArray:MEMORY[0x1E4F1CBF0] type:type];

  return (MLSequence *)v5;
}

- (NSArray)featureValues
{
  id v2 = [[MLSequnceAsFeatureValueArray alloc] initWrappingSequence:self];

  return (NSArray *)v2;
}

@end