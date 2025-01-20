@interface CBFloatArray2D
- (CBFloatArray2D)initWithValues:(float *)a3 andCountCols:(unint64_t)a4 andRows:(unint64_t)a5;
- (float)getCol:(unint64_t)a3 andRow:(unint64_t)a4;
@end

@implementation CBFloatArray2D

- (CBFloatArray2D)initWithValues:(float *)a3 andCountCols:(unint64_t)a4 andRows:(unint64_t)a5
{
  v11 = self;
  SEL v10 = a2;
  v9 = a3;
  unint64_t v8 = a4;
  unint64_t v7 = a5;
  v6.receiver = self;
  v6.super_class = (Class)CBFloatArray2D;
  v11 = [(CBFloatArray *)&v6 initWithValues:a3 andCount:a4 * a5];
  if (v11)
  {
    v11->_cols = v8;
    v11->_rows = v7;
  }
  return v11;
}

- (float)getCol:(unint64_t)a3 andRow:(unint64_t)a4
{
  -[CBFloatArray get:](self, "get:", a3 + a4 * self->_cols, a4, a3, a2, self);
  return result;
}

@end