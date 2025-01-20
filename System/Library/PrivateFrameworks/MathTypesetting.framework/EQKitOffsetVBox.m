@interface EQKitOffsetVBox
- (BOOL)isEqual:(id)a3;
- (EQKitOffsetVBox)initWithChildBoxes:(id)a3;
- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4;
- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4 offset:(double)a5;
- (double)offset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5;
@end

@implementation EQKitOffsetVBox

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3
{
  return [(EQKitOffsetVBox *)self initWithChildBoxes:a3 pivotIndex:0 offset:0.0];
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4
{
  return [(EQKitOffsetVBox *)self initWithChildBoxes:a3 pivotIndex:a4 offset:0.0];
}

- (EQKitOffsetVBox)initWithChildBoxes:(id)a3 pivotIndex:(unint64_t)a4 offset:(double)a5
{
  v7.receiver = self;
  v7.super_class = (Class)EQKitOffsetVBox;
  result = [(EQKitVBox *)&v7 initWithChildBoxes:a3 pivotIndex:a4];
  if (result) {
    result->_offset = a5;
  }
  return result;
}

- (void)p_cacheDimensionsForHeight:(double *)a3 depth:(double *)a4 width:(double *)a5
{
  v8.receiver = self;
  v8.super_class = (Class)EQKitOffsetVBox;
  [(EQKitVBox *)&v8 p_cacheDimensionsForHeight:a3 depth:a4 width:a5];
  *a3 = self->_offset + *a3;
  *a4 = *a4 - self->_offset;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(EQKitCompoundBox *)self childBoxes];
  unint64_t v6 = [(EQKitVBox *)self pivotIndex];
  [(EQKitOffsetVBox *)self offset];
  objc_super v7 = objc_msgSend(v4, "initWithChildBoxes:pivotIndex:offset:", v5, v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EQKitOffsetVBox;
  if ([(EQKitVBox *)&v11 isEqual:v4])
  {
    id v5 = v4;
    [(EQKitOffsetVBox *)self offset];
    double v7 = v6;
    [v5 offset];
    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitCompoundBox *)self height];
  uint64_t v6 = v5;
  [(EQKitCompoundBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitCompoundBox *)self width];
  uint64_t v10 = v9;
  objc_super v11 = [(EQKitCompoundBox *)self childBoxes];
  unint64_t v12 = [(EQKitVBox *)self pivotIndex];
  [(EQKitOffsetVBox *)self offset];
  v14 = [v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f childBoxes=%@ pivotIndex=%lu offset=%f", v4, self, v6, v8, v10, v11, v12, v13];

  return v14;
}

- (double)offset
{
  return self->_offset;
}

@end