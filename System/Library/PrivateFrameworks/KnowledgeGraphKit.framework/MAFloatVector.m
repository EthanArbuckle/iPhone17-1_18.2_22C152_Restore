@interface MAFloatVector
+ (Class)wrapperClass;
+ (id)meanVectorWithFloatVectors:(id)a3;
+ (id)onesOfCount:(int64_t)a3;
+ (id)vectorRepeatingFloat:(float)a3 count:(int64_t)a4;
+ (id)zerosOfCount:(int64_t)a3;
- (BOOL)_isArrayOfFloats:(id)a3;
- (BOOL)isApproximatelyEqualTo:(id)a3;
- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4;
- (BOOL)isEqual:(id)a3;
- (MAFloatVector)init;
- (MAFloatVector)initWithArray:(id)a3;
- (MAFloatVector)initWithData:(id)a3;
- (MAFloatVector)initWithFloats:(const float *)a3 count:(int64_t)a4;
- (MAFloatVector)initWithWrapper:(id)a3;
- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)wrapper;
- (float)dotProductWithVector:(id)a3;
- (float)floatAtIndex:(int64_t)a3;
- (float)mean;
- (float)standardDeviation;
- (float)sum;
- (float)sumOfSquares;
- (id)array;
- (id)data;
- (id)debugDescription;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sliceFromStart:(int64_t)a3 toEnd:(int64_t)a4;
- (id)vectorByAddingScalar:(float)a3;
- (id)vectorByAddingVector:(id)a3;
- (id)vectorByAppendingArray:(id)a3;
- (id)vectorByAppendingDoubles:(const double *)a3 count:(int64_t)a4;
- (id)vectorByAppendingFloat:(float)a3;
- (id)vectorByAppendingFloats:(const float *)a3 count:(int64_t)a4;
- (id)vectorByAppendingVector:(id)a3;
- (id)vectorByDividingByScalar:(float)a3;
- (id)vectorByElementwiseMultiplyingByVector:(id)a3;
- (id)vectorByElementwiseNaturalLogarithm;
- (id)vectorByElementwiseNaturalLogarithmIfPositive;
- (id)vectorByElementwiseRaisingToExponent:(float)a3;
- (id)vectorByMultiplyingByScalar:(float)a3;
- (id)vectorBySubtractingScalar:(float)a3;
- (id)vectorBySubtractingVector:(id)a3;
- (int64_t)count;
- (unint64_t)hash;
@end

@implementation MAFloatVector

- (void).cxx_destruct
{
}

- (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper)wrapper
{
  return self->_wrapper;
}

- (BOOL)_isArrayOfFloats:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    BOOL v5 = strcmp("f", (const char *)[v4 objCType]) == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)debugDescription
{
  v2 = [(MAFloatVector *)self wrapper];
  id v3 = [v2 debugDescription];

  return v3;
}

- (id)description
{
  v2 = [(MAFloatVector *)self wrapper];
  id v3 = [v2 description];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[MAMutableFloatVector allocWithZone:a3];
  BOOL v5 = [(MAFloatVector *)self wrapper];
  v6 = (void *)[v5 mutableCopy];
  v7 = [(MAFloatVector *)v4 initWithWrapper:v6];

  return v7;
}

+ (id)meanVectorWithFloatVectors:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 count];
  BOOL v5 = [v3 objectAtIndexedSubscript:0];
  uint64_t v6 = [v5 count];

  v7 = +[MAFloatVector zerosOfCount:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addVector:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  *(float *)&double v13 = (float)v4;
  [v7 divideByScalar:v13];

  return v7;
}

+ (id)vectorRepeatingFloat:(float)a3 count:(int64_t)a4
{
  id v7 = objc_alloc((Class)a1);
  id v8 = (void *)[a1 wrapperClass];
  *(float *)&double v9 = a3;
  uint64_t v10 = [v8 repeatingFloat:a4 count:v9];
  uint64_t v11 = (void *)[v7 initWithWrapper:v10];

  return v11;
}

+ (id)onesOfCount:(int64_t)a3
{
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1, "wrapperClass"), "onesOfCount:", a3);
  id v7 = (void *)[v5 initWithWrapper:v6];

  return v7;
}

+ (id)zerosOfCount:(int64_t)a3
{
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1, "wrapperClass"), "zerosOfCount:", a3);
  id v7 = (void *)[v5 initWithWrapper:v6];

  return v7;
}

+ (Class)wrapperClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  v2 = [(MAFloatVector *)self wrapper];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (MAFloatVector *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(MAFloatVector *)self wrapper];
      id v7 = [(MAFloatVector *)v5 wrapper];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4
{
  uint64_t v6 = (MAFloatVector *)a3;
  if (v6 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      char v8 = [(MAFloatVector *)self wrapper];
      double v9 = [(MAFloatVector *)v7 wrapper];

      *(float *)&double v10 = a4;
      char v11 = [v8 isApproximatelyEqualTo:v9 epsilon:v10];
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (BOOL)isApproximatelyEqualTo:(id)a3
{
  unint64_t v4 = (MAFloatVector *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(MAFloatVector *)self wrapper];
      id v7 = [(MAFloatVector *)v5 wrapper];

      char v8 = [v6 isApproximatelyEqualTo:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)sliceFromStart:(int64_t)a3 toEnd:(int64_t)a4
{
  uint64_t v6 = [(MAFloatVector *)self wrapper];
  id v7 = [v6 sliceFromStart:a3 toEnd:a4];

  char v8 = [[MAFloatVector alloc] initWithWrapper:v7];
  return v8;
}

- (id)vectorByAppendingArray:(id)a3
{
  id v4 = a3;
  id v5 = [(MAFloatVector *)self wrapper];
  uint64_t v6 = (void *)[v5 mutableCopy];

  [v6 appendArray:v4];
  id v7 = [[MAFloatVector alloc] initWithWrapper:v6];

  return v7;
}

- (id)vectorByAppendingVector:(id)a3
{
  id v4 = a3;
  id v5 = [(MAFloatVector *)self wrapper];
  uint64_t v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 wrapper];

  [v6 appendVector:v7];
  char v8 = [[MAFloatVector alloc] initWithWrapper:v6];

  return v8;
}

- (id)vectorByAppendingDoubles:(const double *)a3 count:(int64_t)a4
{
  uint64_t v6 = [(MAFloatVector *)self wrapper];
  id v7 = (void *)[v6 mutableCopy];

  [v7 appendDoubles:a3 count:a4];
  char v8 = [[MAFloatVector alloc] initWithWrapper:v7];

  return v8;
}

- (id)vectorByAppendingFloats:(const float *)a3 count:(int64_t)a4
{
  uint64_t v6 = [(MAFloatVector *)self wrapper];
  id v7 = (void *)[v6 mutableCopy];

  [v7 appendFloats:a3 count:a4];
  char v8 = [[MAFloatVector alloc] initWithWrapper:v7];

  return v8;
}

- (id)vectorByAppendingFloat:(float)a3
{
  id v4 = [(MAFloatVector *)self wrapper];
  id v5 = (void *)[v4 mutableCopy];

  *(float *)&double v6 = a3;
  [v5 appendFloat:v6];
  id v7 = [[MAFloatVector alloc] initWithWrapper:v5];

  return v7;
}

- (id)vectorByElementwiseNaturalLogarithmIfPositive
{
  unint64_t v3 = [MAFloatVector alloc];
  id v4 = [(MAFloatVector *)self wrapper];
  id v5 = [v4 naturalLogarithmIfPositive];
  double v6 = [(MAFloatVector *)v3 initWithWrapper:v5];

  return v6;
}

- (id)vectorByElementwiseNaturalLogarithm
{
  unint64_t v3 = [MAFloatVector alloc];
  id v4 = [(MAFloatVector *)self wrapper];
  id v5 = [v4 naturalLogarithm];
  double v6 = [(MAFloatVector *)v3 initWithWrapper:v5];

  return v6;
}

- (id)vectorByElementwiseRaisingToExponent:(float)a3
{
  id v5 = [MAFloatVector alloc];
  double v6 = [(MAFloatVector *)self wrapper];
  *(float *)&double v7 = a3;
  char v8 = [v6 vectorByElementwiseRaisingToExponent:v7];
  double v9 = [(MAFloatVector *)v5 initWithWrapper:v8];

  return v9;
}

- (float)dotProductWithVector:(id)a3
{
  id v4 = a3;
  id v5 = [(MAFloatVector *)self wrapper];
  double v6 = [v4 wrapper];

  [v5 dotProductWithWrapper:v6];
  float v8 = v7;

  return v8;
}

- (id)vectorByElementwiseMultiplyingByVector:(id)a3
{
  id v4 = a3;
  id v5 = [MAFloatVector alloc];
  double v6 = [(MAFloatVector *)self wrapper];
  float v7 = [v4 wrapper];

  float v8 = [v6 vectorByElementwiseMultiplyingByWrapper:v7];
  double v9 = [(MAFloatVector *)v5 initWithWrapper:v8];

  return v9;
}

- (id)vectorByDividingByScalar:(float)a3
{
  id v5 = [MAFloatVector alloc];
  double v6 = [(MAFloatVector *)self wrapper];
  *(float *)&double v7 = a3;
  float v8 = [v6 vectorByDividingByScalar:v7];
  double v9 = [(MAFloatVector *)v5 initWithWrapper:v8];

  return v9;
}

- (id)vectorByMultiplyingByScalar:(float)a3
{
  id v5 = [MAFloatVector alloc];
  double v6 = [(MAFloatVector *)self wrapper];
  *(float *)&double v7 = a3;
  float v8 = [v6 vectorByMultiplyingByScalar:v7];
  double v9 = [(MAFloatVector *)v5 initWithWrapper:v8];

  return v9;
}

- (id)vectorByAddingScalar:(float)a3
{
  id v5 = [MAFloatVector alloc];
  double v6 = [(MAFloatVector *)self wrapper];
  *(float *)&double v7 = a3;
  float v8 = [v6 vectorByAddingScalar:v7];
  double v9 = [(MAFloatVector *)v5 initWithWrapper:v8];

  return v9;
}

- (id)vectorBySubtractingScalar:(float)a3
{
  id v5 = [MAFloatVector alloc];
  double v6 = [(MAFloatVector *)self wrapper];
  *(float *)&double v7 = a3;
  float v8 = [v6 vectorBySubtractingScalar:v7];
  double v9 = [(MAFloatVector *)v5 initWithWrapper:v8];

  return v9;
}

- (id)vectorByAddingVector:(id)a3
{
  id v4 = a3;
  id v5 = [MAFloatVector alloc];
  double v6 = [(MAFloatVector *)self wrapper];
  double v7 = [v4 wrapper];

  float v8 = [v6 vectorByAddingVector:v7];
  double v9 = [(MAFloatVector *)v5 initWithWrapper:v8];

  return v9;
}

- (id)vectorBySubtractingVector:(id)a3
{
  id v4 = a3;
  id v5 = [MAFloatVector alloc];
  double v6 = [(MAFloatVector *)self wrapper];
  double v7 = [v4 wrapper];

  float v8 = [v6 vectorBySubtractingVector:v7];
  double v9 = [(MAFloatVector *)v5 initWithWrapper:v8];

  return v9;
}

- (id)data
{
  v2 = [(MAFloatVector *)self wrapper];
  unint64_t v3 = [v2 data];

  return v3;
}

- (id)array
{
  v2 = [(MAFloatVector *)self wrapper];
  unint64_t v3 = [v2 array];

  return v3;
}

- (float)floatAtIndex:(int64_t)a3
{
  id v4 = [(MAFloatVector *)self wrapper];
  [v4 floatAtIndex:a3];
  float v6 = v5;

  return v6;
}

- (float)standardDeviation
{
  v2 = [(MAFloatVector *)self wrapper];
  [v2 standardDeviation];
  float v4 = v3;

  return v4;
}

- (float)mean
{
  v2 = [(MAFloatVector *)self wrapper];
  [v2 mean];
  float v4 = v3;

  return v4;
}

- (float)sumOfSquares
{
  v2 = [(MAFloatVector *)self wrapper];
  [v2 sumOfSquares];
  float v4 = v3;

  return v4;
}

- (float)sum
{
  v2 = [(MAFloatVector *)self wrapper];
  [v2 sum];
  float v4 = v3;

  return v4;
}

- (int64_t)count
{
  v2 = [(MAFloatVector *)self wrapper];
  int64_t v3 = [v2 count];

  return v3;
}

- (MAFloatVector)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  unint64_t v6 = [v4 length];

  return [(MAFloatVector *)self initWithFloats:v5 count:v6 >> 2];
}

- (MAFloatVector)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAFloatVector;
  uint64_t v5 = [(MAFloatVector *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass")), "initWithArray:", v4);
    wrapper = v5->_wrapper;
    v5->_wrapper = (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper *)v6;
  }
  return v5;
}

- (MAFloatVector)initWithFloats:(const float *)a3 count:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MAFloatVector;
  uint64_t v6 = [(MAFloatVector *)&v10 init];
  if (v6)
  {
    uint64_t v7 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass")), "initWithFloats:count:", a3, a4);
    wrapper = v6->_wrapper;
    v6->_wrapper = (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper *)v7;
  }
  return v6;
}

- (MAFloatVector)initWithWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAFloatVector;
  uint64_t v6 = [(MAFloatVector *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrapper, a3);
  }

  return v7;
}

- (MAFloatVector)init
{
  v6.receiver = self;
  v6.super_class = (Class)MAFloatVector;
  v2 = [(MAFloatVector *)&v6 init];
  if (v2)
  {
    int64_t v3 = (_TtC17KnowledgeGraphKit20MAFloatVectorWrapper *)objc_alloc_init((Class)[(id)objc_opt_class() wrapperClass]);
    wrapper = v2->_wrapper;
    v2->_wrapper = v3;
  }
  return v2;
}

@end