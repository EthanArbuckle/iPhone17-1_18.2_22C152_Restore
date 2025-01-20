@interface MIOImageSizeConstraint
- (BOOL)allowsImageSize:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MIOImageSizeConstraint)init;
- (MIOImageSizeConstraint)initWithEnumeratedImageSizes:(id)a3;
- (MIOImageSizeConstraint)initWithPixelsWideRange:(_MIORange)a3 pixelsHighRange:(_MIORange)a4;
- (MIOImageSizeConstraint)initWithSpecification:(const void *)a3;
- (NSArray)enumeratedImageSizes;
- (_MIORange)pixelsHighRange;
- (_MIORange)pixelsWideRange;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation MIOImageSizeConstraint

- (MIOImageSizeConstraint)init
{
  v8.receiver = self;
  v8.super_class = (Class)MIOImageSizeConstraint;
  v2 = [(MIOImageSizeConstraint *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_type = 0;
    v2->_pixelsWideRange.lowerBound = MIOMakeRange(0x7FFFFFFFFFFFFFFFLL, -1);
    v3->_pixelsWideRange.upperBound = v4;
    v3->_pixelsHighRange.lowerBound = MIOMakeRange(0x7FFFFFFFFFFFFFFFLL, -1);
    v3->_pixelsHighRange.upperBound = v5;
    enumeratedImageSizes = v3->_enumeratedImageSizes;
    v3->_enumeratedImageSizes = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (MIOImageSizeConstraint)initWithPixelsWideRange:(_MIORange)a3 pixelsHighRange:(_MIORange)a4
{
  int64_t upperBound = a4.upperBound;
  int64_t lowerBound = a4.lowerBound;
  int64_t v6 = a3.upperBound;
  int64_t v7 = a3.lowerBound;
  result = [(MIOImageSizeConstraint *)self init];
  if (result)
  {
    result->_type = 3;
    result->_pixelsWideRange.int64_t lowerBound = v7;
    result->_pixelsWideRange.int64_t upperBound = v6;
    result->_pixelsHighRange.int64_t lowerBound = lowerBound;
    result->_pixelsHighRange.int64_t upperBound = upperBound;
  }
  return result;
}

- (MIOImageSizeConstraint)initWithEnumeratedImageSizes:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  v24 = [(MIOImageSizeConstraint *)self init];
  if ([v23 count])
  {
    if ([v23 count] == 1)
    {
      int64_t v4 = [v23 objectAtIndexedSubscript:0];
      if ([v4 pixelsWide])
      {
      }
      else
      {
        int64_t v5 = [v23 objectAtIndexedSubscript:0];
        uint64_t v6 = [v5 pixelsHigh];

        if (!v6) {
          goto LABEL_25;
        }
      }
    }
    if (v24)
    {
      v24->_type = 2;
      uint64_t v7 = [v23 sortedArrayUsingSelector:sel_compare_];
      enumeratedImageSizes = v24->_enumeratedImageSizes;
      v24->_enumeratedImageSizes = (NSArray *)v7;

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = v23;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        int64_t v13 = 0x8000000000000000;
        int64_t v14 = 0x8000000000000000;
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v18 = [v17 pixelsHigh];
            uint64_t v19 = [v17 pixelsWide];
            if (v19 < v15) {
              uint64_t v15 = v19;
            }
            if (v14 <= v19) {
              int64_t v14 = v19;
            }
            if (v18 < v12) {
              uint64_t v12 = v18;
            }
            if (v13 <= v18) {
              int64_t v13 = v18;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }
      else
      {

        int64_t v14 = 0x8000000000000000;
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        int64_t v13 = 0x8000000000000000;
      }
      v24->_pixelsWideRange.int64_t lowerBound = MIOMakeRange(v15, v14);
      v24->_pixelsWideRange.int64_t upperBound = v20;
      v24->_pixelsHighRange.int64_t lowerBound = MIOMakeRange(v12, v13);
      v24->_pixelsHighRange.int64_t upperBound = v21;
    }
  }
LABEL_25:

  return v24;
}

- (MIOImageSizeConstraint)initWithSpecification:(const void *)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  CoreML::Specification::ImageFeatureType_ImageSize::ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v34);
  long long v35 = *((_OWORD *)a3 + 1);
  int64_t v5 = [[MIOImageSize alloc] initWithSpecification:v34];
  if ([(MIOImageSize *)v5 pixelsWide]) {
    BOOL v6 = [(MIOImageSize *)v5 pixelsHigh] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = *((_DWORD *)a3 + 13);
  switch(v7)
  {
    case 0:
      if (!v6)
      {
        int64_t v21 = [(MIOImageSizeConstraint *)self init];
LABEL_41:
        self = v21;
        break;
      }
      v36[0] = v5;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      uint64_t v18 = [(MIOImageSizeConstraint *)self initWithEnumeratedImageSizes:v17];
      goto LABEL_33;
    case 21:
      uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
      v17 = v19;
      if (*((_DWORD *)a3 + 13) == 21) {
        int64_t v20 = (uint64_t *)*((void *)a3 + 5);
      }
      else {
        int64_t v20 = CoreML::Specification::ImageFeatureType_EnumeratedImageSizes::default_instance(v19);
      }
      uint64_t v22 = v20[4];
      if (v22) {
        id v23 = (void *)(v22 + 8);
      }
      else {
        id v23 = 0;
      }
      uint64_t v24 = *((int *)v20 + 6);
      if (v24)
      {
        uint64_t v25 = 8 * v24;
        do
        {
          long long v26 = [[MIOImageSize alloc] initWithSpecification:*v23];
          [v17 addObject:v26];

          ++v23;
          v25 -= 8;
        }
        while (v25);
      }
      if (![v17 count])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[MIOImageSizeConstraint initWithSpecification:]();
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[MIOImageSizeConstraint initWithSpecification:]();
        }
        [v17 addObject:v5];
      }
      uint64_t v18 = [(MIOImageSizeConstraint *)self initWithEnumeratedImageSizes:v17];
LABEL_33:
      self = v18;

      break;
    case 31:
      objc_super v8 = *(uint64_t **)(*((void *)a3 + 5) + 16);
      if (!v8) {
        objc_super v8 = &CoreML::Specification::_SizeRange_default_instance_;
      }
      uint64_t v9 = v8[2];
      uint64_t v10 = v8[3];
      if (v10 <= 0) {
        uint64_t v11 = -1;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = (CoreML::Specification::ImageFeatureType_ImageSizeRange *)MIOMakeRange(v9, v11);
      int64_t v13 = v12;
      uint64_t v15 = v14;
      if (*((_DWORD *)a3 + 13) == 31) {
        v16 = (uint64_t *)*((void *)a3 + 5);
      }
      else {
        v16 = CoreML::Specification::ImageFeatureType_ImageSizeRange::default_instance(v12);
      }
      long long v27 = (uint64_t *)v16[3];
      if (!v27) {
        long long v27 = &CoreML::Specification::_SizeRange_default_instance_;
      }
      uint64_t v28 = v27[2];
      uint64_t v29 = v27[3];
      if (v29 <= 0) {
        uint64_t v30 = -1;
      }
      else {
        uint64_t v30 = v29;
      }
      uint64_t v31 = MIOMakeRange(v28, v30);
      int64_t v21 = -[MIOImageSizeConstraint initWithPixelsWideRange:pixelsHighRange:](self, "initWithPixelsWideRange:pixelsHighRange:", v13, v15, v31, v32);
      goto LABEL_41;
  }

  CoreML::Specification::ImageFeatureType_ImageSize::~ImageFeatureType_ImageSize((CoreML::Specification::ImageFeatureType_ImageSize *)v34);
  return self;
}

- (BOOL)allowsImageSize:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  int64_t type = self->_type;
  if (type)
  {
    if (type == 2)
    {
      BOOL v7 = [(NSArray *)self->_enumeratedImageSizes containsObject:v4];
      goto LABEL_9;
    }
    if (type == 3
      && MIOLocationInRange([v4 pixelsWide], self->_pixelsWideRange.lowerBound, self->_pixelsWideRange.upperBound))
    {
      BOOL v7 = MIOLocationInRange([v5 pixelsHigh], self->_pixelsHighRange.lowerBound, self->_pixelsHighRange.upperBound);
LABEL_9:
      BOOL v8 = v7;
      goto LABEL_10;
    }
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
  }
LABEL_10:

  return v8;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  int64_t v4 = [(MIOImageSizeConstraint *)self type];
  int64_t v5 = @"unspecified";
  if (v4 == 3) {
    int64_t v5 = @"ranges";
  }
  if (v4 == 2) {
    int64_t v5 = @"enumerated";
  }
  BOOL v6 = (void *)[v3 initWithFormat:@"MIOImageSizeConstraint (%@) ", v5];
  if ([(MIOImageSizeConstraint *)self type] == 2)
  {
    BOOL v7 = [(MIOImageSizeConstraint *)self enumeratedImageSizes];
    BOOL v8 = [v7 componentsJoinedByString:@", "];
    [v6 appendFormat:@"[%@]", v8];
  }
  else
  {
    if ([(MIOImageSizeConstraint *)self type] != 3) {
      goto LABEL_10;
    }
    uint64_t v9 = [(MIOImageSizeConstraint *)self pixelsWideRange];
    BOOL v7 = NSStringFromMIORange(v9, v10);
    uint64_t v11 = [(MIOImageSizeConstraint *)self pixelsHighRange];
    BOOL v8 = NSStringFromMIORange(v11, v12);
    [v6 appendFormat:@"Wide: %@ High: %@", v7, v8];
  }

LABEL_10:
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (MIOImageSizeConstraint *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      int64_t v6 = [(MIOImageSizeConstraint *)self type];
      if (v6 == [(MIOImageSizeConstraint *)v5 type])
      {
        if ([(MIOImageSizeConstraint *)self type] == 2)
        {
          BOOL v7 = [(MIOImageSizeConstraint *)self enumeratedImageSizes];
          BOOL v8 = [(MIOImageSizeConstraint *)v5 enumeratedImageSizes];
          char v9 = [v7 isEqual:v8];

LABEL_12:
          goto LABEL_13;
        }
        if ([(MIOImageSizeConstraint *)self type] != 3)
        {
          char v9 = 1;
          goto LABEL_12;
        }
        uint64_t v10 = [(MIOImageSizeConstraint *)self pixelsWideRange];
        uint64_t v12 = v11;
        uint64_t v13 = [(MIOImageSizeConstraint *)v5 pixelsWideRange];
        if (MIOEqualRanges(v10, v12, v13, v14))
        {
          uint64_t v15 = [(MIOImageSizeConstraint *)self pixelsHighRange];
          uint64_t v17 = v16;
          uint64_t v18 = [(MIOImageSizeConstraint *)v5 pixelsHighRange];
          char v9 = MIOEqualRanges(v15, v17, v18, v19);
          goto LABEL_12;
        }
      }
      char v9 = 0;
      goto LABEL_12;
    }
    char v9 = 0;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(MIOImageSizeConstraint *)self type];
  int64_t v4 = [(MIOImageSizeConstraint *)self enumeratedImageSizes];
  uint64_t v5 = [v4 hash];
  uint64_t v6 = [(MIOImageSizeConstraint *)self pixelsWideRange];
  BOOL v8 = NSStringFromMIORange(v6, v7);
  uint64_t v9 = [v8 hash];
  uint64_t v10 = [(MIOImageSizeConstraint *)self pixelsHighRange];
  uint64_t v12 = NSStringFromMIORange(v10, v11);
  unint64_t v13 = v5 ^ v3 ^ v9 ^ [v12 hash];

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (_MIORange)pixelsWideRange
{
  int64_t upperBound = self->_pixelsWideRange.upperBound;
  int64_t lowerBound = self->_pixelsWideRange.lowerBound;
  result.int64_t upperBound = upperBound;
  result.int64_t lowerBound = lowerBound;
  return result;
}

- (_MIORange)pixelsHighRange
{
  int64_t upperBound = self->_pixelsHighRange.upperBound;
  int64_t lowerBound = self->_pixelsHighRange.lowerBound;
  result.int64_t upperBound = upperBound;
  result.int64_t lowerBound = lowerBound;
  return result;
}

- (NSArray)enumeratedImageSizes
{
  return self->_enumeratedImageSizes;
}

- (void).cxx_destruct
{
}

- (void)initWithSpecification:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Using the default size", v0, 2u);
}

- (void)initWithSpecification:.cold.2()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DC036000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Image descripition included empty set of enumerated sizes", v0, 2u);
}

@end