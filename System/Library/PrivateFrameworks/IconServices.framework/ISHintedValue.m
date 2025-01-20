@interface ISHintedValue
- (BOOL)sizeOutsideHintedRange:(CGSize)a3;
- (ISHintedValue)init;
- (ISHintedValue)initWithOptions:(unint64_t)a3;
- (NSMutableArray)dimensions;
- (NSMutableArray)values;
- (double)interpolationFactorForSize:(CGSize)a3;
- (double)scaleFactorForSize:(CGSize)a3;
- (id)hintedValueForIndex:(int64_t)a3;
- (id)hintedValueForSize:(CGSize)a3;
- (int64_t)indexForSize:(CGSize)a3;
- (unint64_t)options;
- (void)addHintedValue:(id)a3 forSize:(CGSize)a4;
- (void)setOptions:(unint64_t)a3;
@end

@implementation ISHintedValue

- (ISHintedValue)init
{
  return [(ISHintedValue *)self initWithOptions:0];
}

- (ISHintedValue)initWithOptions:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ISHintedValue;
  v4 = [(ISHintedValue *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    dimensions = v4->_dimensions;
    v4->_dimensions = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    values = v4->_values;
    v4->_values = (NSMutableArray *)v7;

    v4->_options = a3;
  }
  return v4;
}

- (int64_t)indexForSize:(CGSize)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3.width <= a3.height) {
    double height = a3.height;
  }
  else {
    double height = a3.width;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_dimensions;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      int64_t v10 = v7 + v6;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "doubleValue", (void)v13);
        if (height <= v11)
        {
          int64_t v10 = v7 + v9;
          goto LABEL_15;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      int64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)addHintedValue:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  unint64_t v7 = -[ISHintedValue indexForSize:](self, "indexForSize:", width, height);
  double v8 = 0.0;
  if (v7 < [(NSMutableArray *)self->_dimensions count])
  {
    uint64_t v9 = [(NSMutableArray *)self->_dimensions objectAtIndexedSubscript:v7];
    [v9 doubleValue];
    double v8 = v10;
  }
  if (width <= height) {
    double v11 = height;
  }
  else {
    double v11 = width;
  }
  if (v8 <= v11)
  {
    dimensions = self->_dimensions;
    long long v16 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSMutableArray *)dimensions addObject:v16];

    [(NSMutableArray *)self->_values addObject:v17];
  }
  else
  {
    unint64_t v12 = v7 + ((uint64_t)~v7 >> 63);
    long long v13 = self->_dimensions;
    long long v14 = objc_msgSend(NSNumber, "numberWithDouble:");
    [(NSMutableArray *)v13 insertObject:v14 atIndex:v12];

    [(NSMutableArray *)self->_values insertObject:v17 atIndex:v12];
  }
}

- (id)hintedValueForSize:(CGSize)a3
{
  int64_t v4 = -[ISHintedValue indexForSize:](self, "indexForSize:", a3.width, a3.height);
  return [(ISHintedValue *)self hintedValueForIndex:v4];
}

- (id)hintedValueForIndex:(int64_t)a3
{
  unint64_t v5 = [(NSMutableArray *)self->_values count];
  values = self->_values;
  if (v5 <= a3) {
    [(NSMutableArray *)values lastObject];
  }
  else {
  unint64_t v7 = [(NSMutableArray *)values objectAtIndexedSubscript:a3];
  }
  return v7;
}

- (BOOL)sizeOutsideHintedRange:(CGSize)a3
{
  if (a3.width <= a3.height) {
    double height = a3.height;
  }
  else {
    double height = a3.width;
  }
  unint64_t v5 = [(NSMutableArray *)self->_dimensions lastObject];
  [v5 doubleValue];
  double v7 = v6;

  if (height > v7) {
    return 1;
  }
  uint64_t v9 = [(NSMutableArray *)self->_dimensions firstObject];
  [v9 doubleValue];
  BOOL v8 = height < v10;

  return v8;
}

- (double)scaleFactorForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = 1.0;
  if ([(NSMutableArray *)self->_dimensions count])
  {
    if (width <= height) {
      double width = height;
    }
    double v7 = [(NSMutableArray *)self->_dimensions lastObject];
    [v7 doubleValue];
    double v9 = v8;

    dimensions = self->_dimensions;
    if (width > v9)
    {
      double v11 = [(NSMutableArray *)dimensions lastObject];
LABEL_8:
      long long v15 = v11;
      [v11 doubleValue];
      double v6 = width / v16;

      return v6;
    }
    unint64_t v12 = [(NSMutableArray *)dimensions firstObject];
    [v12 doubleValue];
    double v14 = v13;

    if (width < v14)
    {
      double v11 = [(NSMutableArray *)self->_dimensions firstObject];
      goto LABEL_8;
    }
  }
  return v6;
}

- (double)interpolationFactorForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = -[ISHintedValue indexForSize:](self, "indexForSize:");
  if (v6 >= (unint64_t)[(NSMutableArray *)self->_dimensions count])
  {
    uint64_t v6 = [(NSMutableArray *)self->_dimensions count] - 1;
    double v7 = 1.0;
  }
  else
  {
    double v7 = 0.0;
  }
  uint64_t v8 = v6 - 1;
  if (v6 >= 1)
  {
    double v9 = [(NSMutableArray *)self->_dimensions objectAtIndexedSubscript:v6];
    [v9 doubleValue];
    double v11 = v10;

    unint64_t v12 = [(NSMutableArray *)self->_dimensions objectAtIndexedSubscript:v8];
    [v12 doubleValue];
    double v14 = v13;
LABEL_6:

    goto LABEL_8;
  }
  double v14 = 0.0;
  double v11 = 0.0;
  if (!v6)
  {
    unint64_t v12 = [(NSMutableArray *)self->_dimensions objectAtIndexedSubscript:0];
    [v12 doubleValue];
    double v11 = v17;
    goto LABEL_6;
  }
LABEL_8:
  if (width <= height) {
    double v15 = height;
  }
  else {
    double v15 = width;
  }
  return v7 + (v15 - v14) / (v11 - v14);
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (NSMutableArray)dimensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)values
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end