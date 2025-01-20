@interface MAFloatMatrix
+ (Class)wrapperClass;
+ (id)onesWithRows:(int64_t)a3 columns:(int64_t)a4;
+ (id)zerosWithRows:(int64_t)a3 columns:(int64_t)a4;
- (BOOL)isApproximatelyEqualTo:(id)a3;
- (BOOL)isApproximatelyEqualTo:(id)a3 epsilon:(float)a4;
- (BOOL)isEqual:(id)a3;
- (MAFloatMatrix)init;
- (MAFloatMatrix)initWithArray:(id)a3;
- (MAFloatMatrix)initWithData:(id)a3 rows:(int64_t)a4 columns:(int64_t)a5;
- (MAFloatMatrix)initWithFloats:(const float *)a3 rows:(int64_t)a4 columns:(int64_t)a5;
- (MAFloatMatrix)initWithWrapper:(id)a3;
- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)wrapper;
- (float)floatAtRow:(int64_t)a3 column:(int64_t)a4;
- (float)mean;
- (float)sum;
- (float)sumOfSquares;
- (id)array;
- (id)data;
- (id)description;
- (id)matrixByAddingScalar:(float)a3;
- (id)matrixByAppendingColumn:(id)a3;
- (id)matrixByAppendingColumnsOfMatrix:(id)a3;
- (id)matrixByAppendingRow:(id)a3;
- (id)matrixBySubtractingMatrix:(id)a3;
- (id)matrixBySubtractingScalar:(float)a3;
- (id)meanAlongAxis:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)row:(int64_t)a3;
- (id)sumAlongAxis:(unint64_t)a3;
- (int64_t)columns;
- (int64_t)count;
- (int64_t)rows;
- (unint64_t)hash;
@end

@implementation MAFloatMatrix

- (void).cxx_destruct
{
}

- (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper)wrapper
{
  return self->_wrapper;
}

- (id)description
{
  v2 = [(MAFloatMatrix *)self wrapper];
  v3 = [v2 description];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[MAMutableFloatMatrix allocWithZone:a3];
  v5 = [(MAFloatMatrix *)self wrapper];
  v6 = (void *)[v5 mutableCopy];
  v7 = [(MAFloatMatrix *)v4 initWithWrapper:v6];

  return v7;
}

+ (id)onesWithRows:(int64_t)a3 columns:(int64_t)a4
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "wrapperClass"), "onesWithRows:columns:", a3, a4);
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWrapper:v4];

  return v5;
}

+ (id)zerosWithRows:(int64_t)a3 columns:(int64_t)a4
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "wrapperClass"), "zerosWithRows:columns:", a3, a4);
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithWrapper:v4];

  return v5;
}

+ (Class)wrapperClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  v2 = [(MAFloatMatrix *)self wrapper];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MAFloatMatrix *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MAFloatMatrix *)self wrapper];
      v7 = [(MAFloatMatrix *)v5 wrapper];

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
  v6 = (MAFloatMatrix *)a3;
  if (v6 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v6;
      char v8 = [(MAFloatMatrix *)self wrapper];
      v9 = [(MAFloatMatrix *)v7 wrapper];

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
  v4 = (MAFloatMatrix *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MAFloatMatrix *)self wrapper];
      v7 = [(MAFloatMatrix *)v5 wrapper];

      char v8 = [v6 isApproximatelyEqualTo:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)meanAlongAxis:(unint64_t)a3
{
  v5 = [MAFloatVector alloc];
  v6 = [(MAFloatMatrix *)self wrapper];
  v7 = [v6 meanAlongAxis:a3];
  char v8 = [(MAFloatVector *)v5 initWithWrapper:v7];

  return v8;
}

- (id)sumAlongAxis:(unint64_t)a3
{
  v5 = [MAFloatVector alloc];
  v6 = [(MAFloatMatrix *)self wrapper];
  v7 = [v6 sumAlongAxis:a3];
  char v8 = [(MAFloatVector *)v5 initWithWrapper:v7];

  return v8;
}

- (id)matrixByAppendingColumnsOfMatrix:(id)a3
{
  id v4 = a3;
  v5 = [MAFloatMatrix alloc];
  v6 = [(MAFloatMatrix *)self wrapper];
  v7 = [v4 wrapper];

  char v8 = [v6 matrixByAppendingColumnsOfMatrix:v7];
  v9 = [(MAFloatMatrix *)v5 initWithWrapper:v8];

  return v9;
}

- (id)matrixByAppendingColumn:(id)a3
{
  id v4 = a3;
  v5 = [MAFloatMatrix alloc];
  v6 = [(MAFloatMatrix *)self wrapper];
  v7 = [v4 wrapper];

  char v8 = [v6 matrixByAppendingColumnVector:v7];
  v9 = [(MAFloatMatrix *)v5 initWithWrapper:v8];

  return v9;
}

- (id)matrixByAppendingRow:(id)a3
{
  id v4 = a3;
  v5 = [(MAFloatMatrix *)self wrapper];
  v6 = (void *)[v5 mutableCopy];

  v7 = [v4 wrapper];

  [v6 appendRow:v7];
  char v8 = [[MAFloatMatrix alloc] initWithWrapper:v6];

  return v8;
}

- (id)matrixByAddingScalar:(float)a3
{
  v5 = [MAFloatMatrix alloc];
  v6 = [(MAFloatMatrix *)self wrapper];
  *(float *)&double v7 = a3;
  char v8 = [v6 matrixByAddingScalar:v7];
  v9 = [(MAFloatMatrix *)v5 initWithWrapper:v8];

  return v9;
}

- (id)matrixBySubtractingScalar:(float)a3
{
  v5 = [MAFloatMatrix alloc];
  v6 = [(MAFloatMatrix *)self wrapper];
  *(float *)&double v7 = a3;
  char v8 = [v6 matrixBySubtractingScalar:v7];
  v9 = [(MAFloatMatrix *)v5 initWithWrapper:v8];

  return v9;
}

- (id)matrixBySubtractingMatrix:(id)a3
{
  id v4 = a3;
  v5 = [MAFloatMatrix alloc];
  v6 = [(MAFloatMatrix *)self wrapper];
  double v7 = [v4 wrapper];

  char v8 = [v6 matrixBySubtractingMatrix:v7];
  v9 = [(MAFloatMatrix *)v5 initWithWrapper:v8];

  return v9;
}

- (id)data
{
  v2 = [(MAFloatMatrix *)self wrapper];
  unint64_t v3 = [v2 data];

  return v3;
}

- (id)array
{
  v2 = [(MAFloatMatrix *)self wrapper];
  unint64_t v3 = [v2 array];

  return v3;
}

- (id)row:(int64_t)a3
{
  v5 = [MAFloatVector alloc];
  v6 = [(MAFloatMatrix *)self wrapper];
  double v7 = [v6 row:a3];
  char v8 = [(MAFloatVector *)v5 initWithWrapper:v7];

  return v8;
}

- (float)floatAtRow:(int64_t)a3 column:(int64_t)a4
{
  v6 = [(MAFloatMatrix *)self wrapper];
  [v6 floatAtRow:a3 column:a4];
  float v8 = v7;

  return v8;
}

- (float)mean
{
  v2 = [(MAFloatMatrix *)self wrapper];
  [v2 mean];
  float v4 = v3;

  return v4;
}

- (float)sumOfSquares
{
  v2 = [(MAFloatMatrix *)self wrapper];
  [v2 sumOfSquares];
  float v4 = v3;

  return v4;
}

- (float)sum
{
  v2 = [(MAFloatMatrix *)self wrapper];
  [v2 sum];
  float v4 = v3;

  return v4;
}

- (int64_t)count
{
  v2 = [(MAFloatMatrix *)self wrapper];
  int64_t v3 = [v2 count];

  return v3;
}

- (int64_t)columns
{
  v2 = [(MAFloatMatrix *)self wrapper];
  int64_t v3 = [v2 columns];

  return v3;
}

- (int64_t)rows
{
  v2 = [(MAFloatMatrix *)self wrapper];
  int64_t v3 = [v2 rows];

  return v3;
}

- (MAFloatMatrix)initWithData:(id)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  id v8 = a3;
  v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "wrapperClass"), "wrapperWithData:rows:columns:", v8, a4, a5);

  double v10 = [(MAFloatMatrix *)self initWithWrapper:v9];
  return v10;
}

- (MAFloatMatrix)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAFloatMatrix;
  v5 = [(MAFloatMatrix *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass")), "initWithRows:", v4);
    wrapper = v5->_wrapper;
    v5->_wrapper = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)v6;
  }
  return v5;
}

- (MAFloatMatrix)initWithFloats:(const float *)a3 rows:(int64_t)a4 columns:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)MAFloatMatrix;
  id v8 = [(MAFloatMatrix *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "wrapperClass")), "initWithFloats:rows:columns:", a3, a4, a5);
    wrapper = v8->_wrapper;
    v8->_wrapper = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)v9;
  }
  return v8;
}

- (MAFloatMatrix)initWithWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAFloatMatrix;
  uint64_t v6 = [(MAFloatMatrix *)&v9 init];
  float v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_wrapper, a3);
  }

  return v7;
}

- (MAFloatMatrix)init
{
  v6.receiver = self;
  v6.super_class = (Class)MAFloatMatrix;
  v2 = [(MAFloatMatrix *)&v6 init];
  if (v2)
  {
    int64_t v3 = (_TtC17KnowledgeGraphKit20MAFloatMatrixWrapper *)objc_alloc_init((Class)[(id)objc_opt_class() wrapperClass]);
    wrapper = v2->_wrapper;
    v2->_wrapper = v3;
  }
  return v2;
}

@end