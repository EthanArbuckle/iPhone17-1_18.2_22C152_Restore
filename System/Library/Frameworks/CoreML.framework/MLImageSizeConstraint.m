@interface MLImageSizeConstraint
+ (BOOL)supportsSecureCoding;
+ (id)closestImageSizeInArray:(id)a3 toImageSize:(id)a4 preferDownScaling:(BOOL)a5;
+ (id)closestImageSizeInPixelsWideRange:(_NSRange)a3 pixelsHighRange:(_NSRange)a4 toImageSize:(id)a5 preferInputAspectRatio:(BOOL)a6;
+ (unint64_t)locationClosestTo:(unint64_t)a3 inRange:(_NSRange)a4;
- (BOOL)isAllowedImageSize:(id)a3 error:(id *)a4;
- (MLImageSizeConstraint)initWithCoder:(id)a3;
- (MLImageSizeConstraint)initWithEnumeratedImageSizes:(id)a3;
- (MLImageSizeConstraint)initWithPixelsWideRange:(_NSRange)a3 pixelsHighRange:(_NSRange)a4;
- (MLImageSizeConstraintType)type;
- (NSArray)enumeratedImageSizes;
- (NSOrderedSet)imageSizeSet;
- (NSRange)pixelsHighRange;
- (NSRange)pixelsWideRange;
- (id)allowedImageSizeClosestToPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 preferDownScaling:(BOOL)a5 preferInputAspectRatio:(BOOL)a6;
- (id)initUnspecified;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLImageSizeConstraint

- (void).cxx_destruct
{
}

- (NSOrderedSet)imageSizeSet
{
  return self->_imageSizeSet;
}

- (NSRange)pixelsHighRange
{
  NSUInteger length = self->_pixelsHighRange.length;
  NSUInteger location = self->_pixelsHighRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSRange)pixelsWideRange
{
  NSUInteger length = self->_pixelsWideRange.length;
  NSUInteger location = self->_pixelsWideRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (MLImageSizeConstraintType)type
{
  return self->_type;
}

- (MLImageSizeConstraint)initWithCoder:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pixelsWideRange_loc"];
  uint64_t v7 = [v6 unsignedIntegerValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pixelsWideRange_len"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pixelsHighRange_loc"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pixelsHighRange_len"];
  uint64_t v13 = [v12 unsignedIntegerValue];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v16 = [v14 setWithArray:v15];

  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"imageSizeSet"];
  v18 = v17;
  if (v5 == 2)
  {
    v20 = [v17 array];
    v21 = [(MLImageSizeConstraint *)self initWithEnumeratedImageSizes:v20];
  }
  else
  {
    if (v5 == 3) {
      v19 = -[MLImageSizeConstraint initWithPixelsWideRange:pixelsHighRange:](self, "initWithPixelsWideRange:pixelsHighRange:", v7, v9, v11, v13);
    }
    else {
      v19 = [(MLImageSizeConstraint *)self initUnspecified];
    }
    v21 = v19;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  objc_msgSend(v13, "encodeInteger:forKey:", -[MLImageSizeConstraint type](self, "type"), @"type");
  id v4 = [(MLImageSizeConstraint *)self imageSizeSet];
  [v13 encodeObject:v4 forKey:@"imageSizeSet"];

  uint64_t v5 = NSNumber;
  [(MLImageSizeConstraint *)self pixelsWideRange];
  uint64_t v7 = [v5 numberWithUnsignedInteger:v6];
  [v13 encodeObject:v7 forKey:@"pixelsWideRange_len"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLImageSizeConstraint pixelsWideRange](self, "pixelsWideRange"));
  [v13 encodeObject:v8 forKey:@"pixelsWideRange_loc"];

  uint64_t v9 = NSNumber;
  [(MLImageSizeConstraint *)self pixelsHighRange];
  uint64_t v11 = [v9 numberWithUnsignedInteger:v10];
  [v13 encodeObject:v11 forKey:@"pixelsHighRange_len"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MLImageSizeConstraint pixelsHighRange](self, "pixelsHighRange"));
  [v13 encodeObject:v12 forKey:@"pixelsHighRange_loc"];
}

- (BOOL)isAllowedImageSize:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  int64_t type = self->_type;
  if (type == 2)
  {
    if (![(NSOrderedSet *)self->_imageSizeSet containsObject:v6])
    {
      v21 = [NSString stringWithFormat:@"Image size %@ not in allowed set of image sizes", v7];
      goto LABEL_15;
    }
    goto LABEL_11;
  }
  if (type != 3) {
    goto LABEL_11;
  }
  unint64_t v9 = [v6 pixelsWide];
  NSUInteger location = self->_pixelsWideRange.location;
  BOOL v11 = v9 >= location;
  NSUInteger v12 = v9 - location;
  if (!v11 || v12 >= self->_pixelsWideRange.length)
  {
    v23 = NSString;
    v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "pixelsWide"));
    v18 = [NSNumber numberWithUnsignedInteger:self->_pixelsWideRange.location];
    v19 = [NSNumber numberWithUnsignedInteger:self->_pixelsWideRange.location + self->_pixelsWideRange.length - 1];
    uint64_t v20 = [v23 stringWithFormat:@"Image width (%@) is not in allowed range (%@..%@)", v17, v18, v19];
    goto LABEL_13;
  }
  unint64_t v13 = [v7 pixelsHigh];
  NSUInteger v14 = self->_pixelsHighRange.location;
  BOOL v11 = v13 >= v14;
  NSUInteger v15 = v13 - v14;
  if (v11 && v15 < self->_pixelsHighRange.length)
  {
LABEL_11:
    v21 = 0;
    BOOL v22 = 1;
    goto LABEL_18;
  }
  v16 = NSString;
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "pixelsWide"));
  v18 = [NSNumber numberWithUnsignedInteger:self->_pixelsHighRange.location];
  v19 = [NSNumber numberWithUnsignedInteger:self->_pixelsHighRange.location + self->_pixelsHighRange.length - 1];
  uint64_t v20 = [v16 stringWithFormat:@"Image height (%@) is not in allowed range (%@..%@)", v17, v18, v19];
LABEL_13:
  v21 = (void *)v20;

LABEL_15:
  BOOL v22 = v21 == 0;
  if (a4 && v21)
  {
    +[MLModelErrorUtils genericErrorWithFormat:@"%@", v21];
    BOOL v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

  return v22;
}

- (NSArray)enumeratedImageSizes
{
  return [(NSOrderedSet *)self->_imageSizeSet array];
}

- (MLImageSizeConstraint)initWithEnumeratedImageSizes:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_19;
  }
  if ([v4 count] == 1)
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    if ([v5 pixelsWide])
    {

      goto LABEL_6;
    }
    id v6 = [v4 objectAtIndexedSubscript:0];
    uint64_t v7 = [v6 pixelsHigh];

    if (v7) {
      goto LABEL_6;
    }
LABEL_19:
    unint64_t v9 = [(MLImageSizeConstraint *)self initUnspecified];
    goto LABEL_21;
  }
LABEL_6:
  v25.receiver = self;
  v25.super_class = (Class)MLImageSizeConstraint;
  v8 = [(MLImageSizeConstraint *)&v25 init];
  unint64_t v9 = v8;
  if (v8)
  {
    v8->_int64_t type = 2;
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v4];
    imageSizeSet = v9->_imageSizeSet;
    v9->_imageSizeSet = (NSOrderedSet *)v10;

    v9->_pixelsHighRange = 0u;
    v9->_pixelsWideRange = 0u;
    if ([(NSOrderedSet *)v9->_imageSizeSet count])
    {
      NSUInteger v12 = [v4 objectAtIndexedSubscript:0];
      uint64_t v13 = [v12 pixelsWide];

      NSUInteger v14 = [v4 objectAtIndexedSubscript:0];
      uint64_t v15 = [v14 pixelsHigh];

      unint64_t v16 = 1;
      uint64_t v17 = v15;
      uint64_t v18 = v13;
      while (v16 < [(NSOrderedSet *)v9->_imageSizeSet count])
      {
        v19 = [(NSOrderedSet *)v9->_imageSizeSet objectAtIndexedSubscript:v16];
        uint64_t v20 = [v19 pixelsHigh];

        v21 = [(NSOrderedSet *)v9->_imageSizeSet objectAtIndexedSubscript:v16];
        uint64_t v22 = [v21 pixelsWide];

        if (v22 < v18) {
          uint64_t v18 = v22;
        }
        if (v13 <= v22) {
          uint64_t v13 = v22;
        }
        if (v20 < v17) {
          uint64_t v17 = v20;
        }
        if (v15 <= v20) {
          uint64_t v15 = v20;
        }
        ++v16;
      }
      v9->_pixelsWideRange.NSUInteger location = v18;
      v9->_pixelsWideRange.NSUInteger length = v13 - v18 + 1;
      v9->_pixelsHighRange.NSUInteger location = v17;
      v9->_pixelsHighRange.NSUInteger length = v15 - v17 + 1;
    }
  }
LABEL_21:
  v23 = v9;

  return v23;
}

- (MLImageSizeConstraint)initWithPixelsWideRange:(_NSRange)a3 pixelsHighRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v6 = a3.length;
  NSUInteger v7 = a3.location;
  v13.receiver = self;
  v13.super_class = (Class)MLImageSizeConstraint;
  v8 = [(MLImageSizeConstraint *)&v13 init];
  unint64_t v9 = v8;
  if (v8)
  {
    v8->_int64_t type = 3;
    v8->_pixelsWideRange.NSUInteger location = v7;
    v8->_pixelsWideRange.NSUInteger length = v6;
    v8->_pixelsHighRange.NSUInteger location = location;
    v8->_pixelsHighRange.NSUInteger length = length;
    uint64_t v10 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    imageSizeSet = v9->_imageSizeSet;
    v9->_imageSizeSet = v10;
  }
  return v9;
}

- (id)initUnspecified
{
  v7.receiver = self;
  v7.super_class = (Class)MLImageSizeConstraint;
  v2 = [(MLImageSizeConstraint *)&v7 init];
  v3 = v2;
  if (v2)
  {
    *((void *)v2 + 1) = 0;
    *(_OWORD *)(v2 + 24) = xmmword_19EC7B890;
    *(_OWORD *)(v2 + 40) = xmmword_19EC7B890;
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    uint64_t v5 = (void *)v3[2];
    v3[2] = v4;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)allowedImageSizeClosestToPixelsWide:(int64_t)a3 pixelsHigh:(int64_t)a4 preferDownScaling:(BOOL)a5 preferInputAspectRatio:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  unint64_t v9 = [[MLImageSize alloc] initWithPixelsWide:a3 pixelsHigh:a4];
  MLImageSizeConstraintType v10 = [(MLImageSizeConstraint *)self type];
  if (v10 == MLImageSizeConstraintTypeEnumerated)
  {
    uint64_t v18 = objc_opt_class();
    v19 = [(MLImageSizeConstraint *)self enumeratedImageSizes];
    uint64_t v20 = [v18 closestImageSizeInArray:v19 toImageSize:v9 preferDownScaling:v7];
  }
  else
  {
    if (v10 == MLImageSizeConstraintTypeRange)
    {
      BOOL v11 = objc_opt_class();
      uint64_t v12 = [(MLImageSizeConstraint *)self pixelsWideRange];
      uint64_t v14 = v13;
      uint64_t v15 = [(MLImageSizeConstraint *)self pixelsHighRange];
      objc_msgSend(v11, "closestImageSizeInPixelsWideRange:pixelsHighRange:toImageSize:preferInputAspectRatio:", v12, v14, v15, v16, v9, v6);
      uint64_t v17 = (MLImageSize *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v17 = v9;
    }
    uint64_t v20 = v17;
  }

  return v20;
}

+ (id)closestImageSizeInArray:(id)a3 toImageSize:(id)a4 preferDownScaling:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    if ([v7 count] == 1)
    {
      unint64_t v9 = [v7 objectAtIndexedSubscript:0];
    }
    else
    {
      MLImageSizeConstraintType v10 = operator new(0x18uLL);
      BOOL v33 = v5;
      v10[1] = -1;
      v10[2] = -1;
      void *v10 = -1;
      BOOL v11 = (double *)operator new(0x18uLL);
      unint64_t v12 = 0;
      *BOOL v11 = 0.0;
      v11[1] = 0.0;
      double v13 = 0.0;
      uint64_t v14 = -1;
      __p = v11;
      v11[2] = 0.0;
      while (v12 < [v7 count])
      {
        uint64_t v15 = [v8 pixelsWide];
        uint64_t v16 = [v7 objectAtIndexedSubscript:v12];
        uint64_t v17 = v15 < [v16 pixelsWide];
        uint64_t v18 = [v8 pixelsHigh];
        v19 = [v7 objectAtIndexedSubscript:v12];
        if (v18 < [v19 pixelsHigh]) {
          ++v17;
        }

        uint64_t v20 = [v8 pixelsWide];
        v21 = [v7 objectAtIndexedSubscript:v12];
        uint64_t v22 = [v21 pixelsWide];

        uint64_t v23 = [v8 pixelsHigh];
        v24 = [v7 objectAtIndexedSubscript:v12];
        double v26 = (double)v23 - (double)[v24 pixelsHigh];

        double v25 = (double)v20 - (double)v22;
        double v27 = v26 * v26 + v25 * v25;
        if (v27 < v13 || v14 < 0)
        {
          uint64_t v14 = v12;
          double v13 = v26 * v26 + v25 * v25;
        }
        if ((v10[v17] & 0x8000000000000000) != 0 || v27 < __p[v17])
        {
          v10[v17] = v12;
          __p[v17] = v27;
        }
        ++v12;
      }
      if (v33)
      {
        uint64_t v30 = 0;
        while ((v10[v30] & 0x8000000000000000) != 0)
        {
          if (++v30 == 3) {
            goto LABEL_25;
          }
        }
        uint64_t v31 = objc_msgSend(v7, "objectAtIndexedSubscript:");
      }
      else
      {
LABEL_25:
        uint64_t v31 = [v7 objectAtIndexedSubscript:v14];
      }
      unint64_t v9 = (void *)v31;
      operator delete(__p);
      operator delete(v10);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)closestImageSizeInPixelsWideRange:(_NSRange)a3 pixelsHighRange:(_NSRange)a4 toImageSize:(id)a5 preferInputAspectRatio:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v9 = a3.length;
  NSUInteger v10 = a3.location;
  id v12 = a5;
  uint64_t v13 = objc_msgSend(a1, "locationClosestTo:inRange:", objc_msgSend(v12, "pixelsWide"), v10, v9);
  uint64_t v14 = objc_msgSend(a1, "locationClosestTo:inRange:", objc_msgSend(v12, "pixelsHigh"), location, length);
  if (v6)
  {
    uint64_t v15 = [v12 pixelsHigh];
    double v16 = (double)v15 / (double)[v12 pixelsWide];
    double v17 = (double)v14 / v16;
    if ((unint64_t)v17 < v10 || (unint64_t)v17 - v10 >= v9)
    {
      double v19 = v16 * (double)v13;
      if ((unint64_t)v19 - location < length && (unint64_t)v19 >= location) {
        uint64_t v14 = (uint64_t)v19;
      }
    }
    else
    {
      uint64_t v13 = (uint64_t)v17;
    }
  }
  v21 = [[MLImageSize alloc] initWithPixelsWide:v13 pixelsHigh:v14];

  return v21;
}

+ (unint64_t)locationClosestTo:(unint64_t)a3 inRange:(_NSRange)a4
{
  NSUInteger v4 = a4.length + a4.location - 1;
  if (v4 >= a3) {
    NSUInteger v4 = a3;
  }
  if (v4 <= a4.location) {
    return a4.location;
  }
  else {
    return v4;
  }
}

@end