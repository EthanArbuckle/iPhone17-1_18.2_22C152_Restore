@interface CAMOverlayDiscreteFloatRange
+ (BOOL)supportsSecureCoding;
- (BOOL)containsValue:(id)a3;
- (BOOL)isDiscrete;
- (BOOL)isEqualToRange:(id)a3;
- (BOOL)isFloatingPoint;
- (BOOL)isValueExpectedType:(id)a3;
- (CAMOverlayDiscreteFloatRange)initWithCoder:(id)a3;
- (CAMOverlayDiscreteFloatRange)initWithMinimum:(double)a3 maximum:(double)a4 step:(double)a5;
- (CAMOverlayDiscreteFloatRange)initWithValues:(id)a3;
- (NSArray)_explicitStorage;
- (NSString)description;
- (double)_implicitStep;
- (double)maximum;
- (double)minimum;
- (double)valueClosestToValue:(double)a3;
- (id)indexesOfValuesInRange:(id)a3;
- (id)valueAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)indexOfValue:(id)a3;
- (unint64_t)indexOfValueClosestToValue:(double)a3;
- (unint64_t)indexOfValueGreaterThanValue:(double)a3;
- (unint64_t)indexOfValueLessThanValue:(double)a3;
- (unint64_t)rangeType;
- (unint64_t)valueType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAMOverlayDiscreteFloatRange

- (CAMOverlayDiscreteFloatRange)initWithValues:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMOverlayDiscreteFloatRange;
  v5 = [(CAMOverlayDiscreteFloatRange *)&v15 init];
  if (v5)
  {
    v6 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v4];
    uint64_t v7 = [v6 sortedArrayUsingComparator:&__block_literal_global];
    explicitStorage = v5->__explicitStorage;
    v5->__explicitStorage = (NSArray *)v7;

    v9 = [(NSArray *)v5->__explicitStorage firstObject];
    [v9 doubleValue];
    v5->_minimum = v10;

    v11 = [(NSArray *)v5->__explicitStorage lastObject];
    [v11 doubleValue];
    v5->_maximum = v12;

    v5->_count = [(NSArray *)v5->__explicitStorage count];
    v13 = v5;
  }

  return v5;
}

uint64_t __47__CAMOverlayDiscreteFloatRange_initWithValues___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (CAMOverlayDiscreteFloatRange)initWithMinimum:(double)a3 maximum:(double)a4 step:(double)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CAMOverlayDiscreteFloatRange;
  v8 = [(CAMOverlayDiscreteFloatRange *)&v15 init];
  v9 = v8;
  if (v8)
  {
    double v10 = fmin(a3, a4);
    double v11 = fmax(a3, a4);
    double v12 = 1.79769313e308;
    if (a5 > 0.0) {
      double v12 = a5;
    }
    v8->__implicitStep = v12;
    v8->_minimum = v10;
    v8->_maximum = v11;
    v8->_count = vcvtmd_u64_f64((v11 - v10) / v12) + 1;
    v13 = v8;
  }

  return v9;
}

- (NSString)description
{
  if (self->__explicitStorage)
  {
    v3 = [MEMORY[0x263F089D8] string];
    explicitStorage = self->__explicitStorage;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__CAMOverlayDiscreteFloatRange_description__block_invoke;
    v13[3] = &unk_265261D40;
    v13[4] = self;
    id v14 = v3;
    id v5 = v3;
    [(NSArray *)explicitStorage enumerateObjectsUsingBlock:v13];
    v6 = NSString;
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v6 stringWithFormat:@"<%@ %p; %lu values: %@>", v8, self, self->_count, v5];
  }
  else
  {
    double v10 = NSString;
    double v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", @"<%@ %p; %lu values; min: %.3f; max: %.3f; step: %.3f>",
      v5,
      self,
      self->_count,
      *(void *)&self->_minimum,
      *(void *)&self->_maximum,
    v9 = *(void *)&self->__implicitStep);
  }

  return (NSString *)v9;
}

void __43__CAMOverlayDiscreteFloatRange_description__block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  if (a3 < 2 || (unint64_t)[*(id *)(*(void *)(a1 + 32) + 32) count] < 4)
  {
    double v10 = *(void **)(a1 + 40);
    [v12 doubleValue];
    objc_msgSend(v10, "appendFormat:", @"%.3f", v11);
    if ([*(id *)(*(void *)(a1 + 32) + 32) count] - 1 > a3) {
      [*(id *)(a1 + 40) appendString:@", "];
    }
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 40);
    v8 = [*(id *)(*(void *)(a1 + 32) + 32) lastObject];
    [v8 doubleValue];
    objc_msgSend(v7, "appendFormat:", @" ... %.3f", v9);

    *a4 = 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMOverlayDiscreteFloatRange)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = NSString;
  uint64_t v9 = (objc_class *)objc_opt_class();
  double v10 = NSStringFromClass(v9);
  uint64_t v11 = [v8 stringWithFormat:@"%@.%@", v10, @"_explicitStorage"];
  id v12 = [v5 decodeObjectOfClasses:v7 forKey:v11];
  explicitStorage = self->__explicitStorage;
  self->__explicitStorage = v12;

  id v14 = NSString;
  objc_super v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = [v14 stringWithFormat:@"%@.%@", v16, @"_implicitStep"];
  [v5 decodeDoubleForKey:v17];
  self->__double implicitStep = v18;

  v19 = NSString;
  v20 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v20);
  v22 = [v19 stringWithFormat:@"%@.%@", v21, @"minimum"];
  [v5 decodeDoubleForKey:v22];
  self->_double minimum = v23;

  v24 = NSString;
  v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  v27 = [v24 stringWithFormat:@"%@.%@", v26, @"maximum"];
  [v5 decodeDoubleForKey:v27];
  double v29 = v28;

  self->_double maximum = v29;
  if (self->__explicitStorage)
  {
    if (self->__implicitStep == 0.0 && self->_minimum == 0.0 && self->_maximum == 0.0)
    {
      return -[CAMOverlayDiscreteFloatRange initWithValues:](self, "initWithValues:");
    }
    else
    {

      return 0;
    }
  }
  else
  {
    double minimum = self->_minimum;
    double maximum = self->_maximum;
    double implicitStep = self->__implicitStep;
    return [(CAMOverlayDiscreteFloatRange *)self initWithMinimum:minimum maximum:maximum step:implicitStep];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];

  if (v5)
  {
    id v26 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];
    uint64_t v6 = NSString;
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    uint64_t v9 = [v6 stringWithFormat:@"%@.%@", v8, @"_explicitStorage"];
    [v4 encodeObject:v26 forKey:v9];

    id v4 = (id)v9;
  }
  else
  {
    [(CAMOverlayDiscreteFloatRange *)self _implicitStep];
    double v11 = v10;
    id v12 = NSString;
    v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    objc_super v15 = [v12 stringWithFormat:@"%@.%@", v14, @"_implicitStep"];
    [v4 encodeDouble:v15 forKey:v11];

    [(CAMOverlayDiscreteFloatRange *)self minimum];
    double v17 = v16;
    double v18 = NSString;
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v21 = [v18 stringWithFormat:@"%@.%@", v20, @"minimum"];
    [v4 encodeDouble:v21 forKey:v17];

    [(CAMOverlayDiscreteFloatRange *)self maximum];
    double v23 = v22;
    v24 = NSString;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    v8 = [v24 stringWithFormat:@"%@.%@", v26, @"maximum"];
    [v4 encodeDouble:v8 forKey:v23];
  }
}

- (unint64_t)rangeType
{
  return 0;
}

- (unint64_t)valueType
{
  return 0;
}

- (BOOL)isFloatingPoint
{
  return 1;
}

- (BOOL)isDiscrete
{
  return 1;
}

- (BOOL)isEqualToRange:(id)a3
{
  id v4 = (CAMOverlayDiscreteFloatRange *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self)
    {
      char v19 = 1;
    }
    else
    {
      id v5 = v4;
      [(CAMOverlayDiscreteFloatRange *)v5 minimum];
      double v7 = v6;
      [(CAMOverlayDiscreteFloatRange *)self minimum];
      if (v7 == v8
        && ([(CAMOverlayDiscreteFloatRange *)v5 maximum],
            double v10 = v9,
            [(CAMOverlayDiscreteFloatRange *)self maximum],
            v10 == v11)
        && ([(CAMOverlayDiscreteFloatRange *)v5 _implicitStep],
            double v13 = v12,
            [(CAMOverlayDiscreteFloatRange *)self _implicitStep],
            v13 == v14))
      {
        objc_super v15 = [(CAMOverlayDiscreteFloatRange *)v5 _explicitStorage];
        double v16 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];
        if (v15 == v16)
        {
          char v19 = 1;
        }
        else
        {
          double v17 = [(CAMOverlayDiscreteFloatRange *)v5 _explicitStorage];
          double v18 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];
          char v19 = [v17 isEqualToArray:v18];
        }
      }
      else
      {
        char v19 = 0;
      }
    }
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

- (BOOL)containsValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 doubleValue];
    double v6 = v5;
    double v7 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];
    if ([v7 containsObject:v4])
    {
      BOOL v8 = 1;
    }
    else
    {
      [(CAMOverlayDiscreteFloatRange *)self _implicitStep];
      if (v9 == 0.0
        || ([(CAMOverlayDiscreteFloatRange *)self minimum], v6 < v10)
        || ([(CAMOverlayDiscreteFloatRange *)self maximum], v6 > v11))
      {
        BOOL v8 = 0;
      }
      else
      {
        [(CAMOverlayDiscreteFloatRange *)self minimum];
        long double v14 = v6 - v13;
        [(CAMOverlayDiscreteFloatRange *)self _implicitStep];
        BOOL v8 = fabs(fmod(v14, v15)) < 0.0001;
      }
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isValueExpectedType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)indexOfValue:(id)a3
{
  id v4 = a3;
  double v5 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];

  if (v5)
  {
    double v6 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];
    unint64_t v7 = [v6 indexOfObject:v4];
  }
  else if ([(CAMOverlayDiscreteFloatRange *)self containsValue:v4])
  {
    [v4 doubleValue];
    double v9 = v8;
    [(CAMOverlayDiscreteFloatRange *)self minimum];
    double v11 = v9 - v10;
    [(CAMOverlayDiscreteFloatRange *)self _implicitStep];
    unint64_t v7 = vcvtad_u64_f64(v11 / v12);
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)valueAtIndex:(unint64_t)a3
{
  double v5 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];

  if (v5)
  {
    double v6 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];
    unint64_t v7 = [v6 objectAtIndexedSubscript:a3];
  }
  else
  {
    [(CAMOverlayDiscreteFloatRange *)self minimum];
    double v9 = v8;
    [(CAMOverlayDiscreteFloatRange *)self _implicitStep];
    double v11 = v9 + (double)a3 * v10;
    double v12 = round(v11);
    if (vabdd_f64(v12, v11) < 0.0001) {
      double v11 = v12;
    }
    if (v11 == 0.0) {
      double v11 = 0.0;
    }
    unint64_t v7 = [NSNumber numberWithDouble:v11];
  }
  return v7;
}

- (unint64_t)indexOfValueClosestToValue:(double)a3
{
  uint64_t v18 = 0;
  char v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  double v5 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];

  if (v5)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0x7FEFFFFFFFFFFFFFLL;
    double v6 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__CAMOverlayDiscreteFloatRange_indexOfValueClosestToValue___block_invoke;
    v16[3] = &unk_265261D68;
    *(double *)&v16[6] = a3;
    v16[4] = v17;
    v16[5] = &v18;
    [v6 enumerateObjectsUsingBlock:v16];

    _Block_object_dispose(v17, 8);
    unint64_t v7 = v19[3];
  }
  else
  {
    [(CAMOverlayDiscreteFloatRange *)self minimum];
    double v9 = v8;
    [(CAMOverlayDiscreteFloatRange *)self maximum];
    double v11 = v10;
    [(CAMOverlayDiscreteFloatRange *)self minimum];
    double v13 = v12;
    [(CAMOverlayDiscreteFloatRange *)self _implicitStep];
    unint64_t v7 = vcvtad_u64_f64((fmax(v9, fmin(v11, a3)) - v13) / v14);
    v19[3] = v7;
  }
  _Block_object_dispose(&v18, 8);
  return v7;
}

uint64_t __59__CAMOverlayDiscreteFloatRange_indexOfValueClosestToValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 doubleValue];
  double v9 = vabdd_f64(v8, *(double *)(a1 + 48));
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v9 >= *(double *)(v10 + 24))
  {
    *a4 = 1;
  }
  else
  {
    *(double *)(v10 + 24) = v9;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

- (unint64_t)indexOfValueGreaterThanValue:(double)a3
{
  double v5 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];

  if (v5)
  {
    double v6 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __61__CAMOverlayDiscreteFloatRange_indexOfValueGreaterThanValue___block_invoke;
    v14[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l;
    *(double *)&v14[4] = a3;
    unint64_t v7 = [v6 indexOfObjectPassingTest:v14];
  }
  else
  {
    [(CAMOverlayDiscreteFloatRange *)self maximum];
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    if (v8 > a3)
    {
      [(CAMOverlayDiscreteFloatRange *)self minimum];
      double v10 = a3 - v9;
      [(CAMOverlayDiscreteFloatRange *)self _implicitStep];
      double v12 = floor(v10 / v11) + 1.0;
      if (v12 < (double)[(CAMOverlayDiscreteFloatRange *)self count]) {
        return (unint64_t)v12;
      }
    }
  }
  return v7;
}

BOOL __61__CAMOverlayDiscreteFloatRange_indexOfValueGreaterThanValue___block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  return v3 > *(double *)(a1 + 32);
}

- (unint64_t)indexOfValueLessThanValue:(double)a3
{
  double v5 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];

  if (v5)
  {
    double v6 = [(CAMOverlayDiscreteFloatRange *)self _explicitStorage];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __58__CAMOverlayDiscreteFloatRange_indexOfValueLessThanValue___block_invoke;
    v13[3] = &__block_descriptor_40_e25_B32__0__NSNumber_8Q16_B24l;
    *(double *)&v13[4] = a3;
    unint64_t v7 = [v6 indexOfObjectWithOptions:2 passingTest:v13];
  }
  else
  {
    [(CAMOverlayDiscreteFloatRange *)self minimum];
    if (v8 >= a3)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      [(CAMOverlayDiscreteFloatRange *)self minimum];
      double v10 = a3 - v9;
      [(CAMOverlayDiscreteFloatRange *)self _implicitStep];
      return (unint64_t)(ceil(v10 / v11) + -1.0);
    }
  }
  return v7;
}

BOOL __58__CAMOverlayDiscreteFloatRange_indexOfValueLessThanValue___block_invoke(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  return v3 < *(double *)(a1 + 32);
}

- (double)valueClosestToValue:(double)a3
{
  unint64_t v4 = [(CAMOverlayDiscreteFloatRange *)self indexOfValueClosestToValue:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(CAMOverlayDiscreteFloatRange *)self valueAtIndex:v4];
  }
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (id)indexesOfValuesInRange:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CAMOverlayDiscreteFloatRange *)self count];
  unint64_t v6 = [v4 count];
  double v7 = [MEMORY[0x263EFF980] array];
  if (v5 && v6)
  {
    unint64_t v8 = 0;
    unint64_t v9 = 1;
    do
    {
      double v10 = [v4 valueAtIndex:v8];
      [v10 doubleValue];

      double v11 = [(CAMOverlayDiscreteFloatRange *)self valueAtIndex:v9 - 1];
      [v11 doubleValue];

      if (BSFloatEqualToFloat())
      {
        double v12 = [NSNumber numberWithUnsignedInteger:v9 - 1];
        [v7 addObject:v12];

        ++v8;
      }
      if (v9 >= v5) {
        break;
      }
      ++v9;
    }
    while (v8 < v6);
  }

  return v7;
}

- (double)minimum
{
  return self->_minimum;
}

- (double)maximum
{
  return self->_maximum;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSArray)_explicitStorage
{
  return self->__explicitStorage;
}

- (double)_implicitStep
{
  return self->__implicitStep;
}

- (void).cxx_destruct
{
}

@end