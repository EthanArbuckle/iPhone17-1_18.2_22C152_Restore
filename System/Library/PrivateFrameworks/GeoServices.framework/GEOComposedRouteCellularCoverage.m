@interface GEOComposedRouteCellularCoverage
+ (BOOL)supportsSecureCoding;
- (GEOComposedRouteCellularCoverage)init;
- (GEOComposedRouteCellularCoverage)initWithCoder:(id)a3;
- (GEOComposedRouteCellularCoverage)initWithOffsets:(id)a3 coverage:(id)a4 routeLength:(double)a5;
- (int)cellularCoverageAtOffset:(double)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateCoverageRangesWithBlock:(id)a3;
@end

@implementation GEOComposedRouteCellularCoverage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteCellularCoverage)init
{
  result = (GEOComposedRouteCellularCoverage *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOComposedRouteCellularCoverage)initWithOffsets:(id)a3 coverage:(id)a4 routeLength:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  unint64_t v11 = [v9 length];
  unint64_t v12 = [v10 length];
  if ((v11 & 0xFFFFFFFFFFFFFFFCLL) != [v9 length])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v17 = MEMORY[0x1E4F14500];
      v18 = "Assertion failed: offsetsCount * sizeof(uint32_t) == offsetsData.length";
      goto LABEL_14;
    }
LABEL_12:

    v15 = 0;
    goto LABEL_6;
  }
  if ((v12 & 0xFFFFFFFFFFFFFFFCLL) != [v10 length])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v17 = MEMORY[0x1E4F14500];
      v18 = "Assertion failed: coverageCount * sizeof(GEOCellularCoverage) == coverageData.length";
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  unint64_t v13 = v11 >> 2;
  if (v13 != v12 >> 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E4F14500];
    v18 = "Assertion failed: offsetsCount == coverageCount";
LABEL_14:
    _os_log_fault_impl(&dword_188D96000, v17, OS_LOG_TYPE_FAULT, v18, buf, 2u);
    goto LABEL_12;
  }
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedRouteCellularCoverage;
  v14 = [(GEOComposedRouteCellularCoverage *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_offsetsData, a3);
    objc_storeStrong((id *)&v15->_coverageData, a4);
    v15->_offsets = (unsigned int *)[(NSData *)v15->_offsetsData bytes];
    v15->_coverage = (int *)[(NSData *)v15->_coverageData bytes];
    v15->_coverageCount = v13;
    v15->_routeLength = a5;
  }
LABEL_6:

  return v15;
}

- (GEOComposedRouteCellularCoverage)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedRouteCellularCoverage;
  v5 = [(GEOComposedRouteCellularCoverage *)&v14 init];
  if (v5)
  {
    v6 = v5;
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offsets"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coverage"];
    id v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      unint64_t v12 = 0;
    }
    else
    {
      [v4 decodeDoubleForKey:@"routeLength"];
      v6 = [(GEOComposedRouteCellularCoverage *)v6 initWithOffsets:v7 coverage:v9 routeLength:(double)(unint64_t)v11];
      unint64_t v12 = v6;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  offsetsData = self->_offsetsData;
  id v5 = a3;
  [v5 encodeObject:offsetsData forKey:@"offsets"];
  [v5 encodeObject:self->_coverageData forKey:@"coverage"];
  [v5 encodeDouble:@"routeLength" forKey:self->_routeLength];
}

- (int)cellularCoverageAtOffset:(double)a3
{
  double routeLength = self->_routeLength;
  if (routeLength < a3)
  {
    unint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C4A8];
    v15 = [NSString stringWithFormat:@"*** offset %.2f beyond bounds [0 .. %.2f]", *(void *)&a3, *(void *)&routeLength];
    id v16 = [v13 exceptionWithName:v14 reason:v15 userInfo:0];

    objc_exception_throw(v16);
  }
  unint64_t coverageCount = self->_coverageCount;
  if (!coverageCount) {
    return 0;
  }
  int v6 = 0;
  offsets = self->_offsets;
  coverage = self->_coverage;
  while (1)
  {
    unsigned int v10 = *offsets++;
    unsigned int v9 = v10;
    int v12 = *coverage++;
    int result = v12;
    if ((double)v9 == a3) {
      int v3 = result;
    }
    if ((double)v9 > a3) {
      int v3 = v6;
    }
    if ((double)v9 >= a3) {
      break;
    }
    int v6 = result;
    if (!--coverageCount) {
      return result;
    }
  }
  return v3;
}

- (void)enumerateCoverageRangesWithBlock:(id)a3
{
  double v11 = (void (**)(id, void, double, double))a3;
  unint64_t coverageCount = self->_coverageCount;
  if (coverageCount)
  {
    unsigned int v6 = *self->_offsets;
    if (!v6 || (v11[2](v11, 0, 0.0, (double)v6), (unint64_t coverageCount = self->_coverageCount) != 0))
    {
      unint64_t v7 = 0;
      do
      {
        offsets = self->_offsets;
        if (v7 >= coverageCount - 1)
        {
          double routeLength = self->_routeLength;
          unint64_t v9 = v7 + 1;
        }
        else
        {
          unint64_t v9 = v7 + 1;
          LODWORD(v4) = offsets[v7 + 1];
          double routeLength = (double)v4;
        }
        LODWORD(v4) = offsets[v7];
        v11[2](v11, self->_coverage[v7], (double)v4, routeLength - (double)v4);
        unint64_t coverageCount = self->_coverageCount;
        unint64_t v7 = v9;
      }
      while (v9 < coverageCount);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverageData, 0);

  objc_storeStrong((id *)&self->_offsetsData, 0);
}

@end