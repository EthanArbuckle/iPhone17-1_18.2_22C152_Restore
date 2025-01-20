@interface PKStrokePath
+ (id)strokeDataFromDataArchive:(const void *)a3;
+ (void)_calculateOffsets:(unint64_t *)a3 sizes:(unint64_t *)a4;
+ (void)calculateOffsets;
- (BOOL)canApplyDelta:(id)a3;
- (BOOL)deltaContainsNewInfo:(id)a3;
- (BOOL)hasAzimuthAngles;
- (BOOL)hasValidPointTimestampData;
- (BOOL)inflight;
- (BOOL)saveToDataArchive:(void *)a3;
- (CGFloat)parametricValue:(CGFloat)parametricValue offsetByDistance:(CGFloat)distanceStep;
- (CGFloat)parametricValue:(CGFloat)parametricValue offsetByTime:(NSTimeInterval)timeStep;
- (CGPath)_newPathRepresentation;
- (CGPoint)interpolatedLocationAt:(CGFloat)parametricValue;
- (CGPoint)locationAtIndex:(unint64_t)a3;
- (CGPoint)locationOnSegment:(unint64_t)a3 t:(double)a4;
- (NSDate)creationDate;
- (NSUInteger)count;
- (NSUUID)_strokeDataUUID;
- (PKCompressedStrokePoint)_compressedPointAt:(SEL)a3;
- (PKStrokePath)init;
- (PKStrokePath)initWithControlPoints:(NSArray *)controlPoints creationDate:(NSDate *)creationDate;
- (PKStrokePath)initWithData:(id)a3 range:(_NSRange)a4 UUID:(id)a5;
- (PKStrokePath)initWithDataPoints:(PKStrokePathPointsPrivate *)a3 immutableCount:(unint64_t)a4 inputType:(int64_t)a5 UUID:(id)a6 didValidateTimestamps:(BOOL)a7 hasValidTimestampData:(BOOL)a8 cachedMaxWidth:(double)a9 unknownFields:(shared_ptr<PKProtobufUnknownFields>)a10;
- (PKStrokePath)initWithPoints:(PKCompressedStrokePoint *)a3 count:(unint64_t)a4 immutableCount:(unint64_t)a5 inputType:(int64_t)a6 timestamp:(double)a7 UUID:(id)a8;
- (PKStrokePath)initWithRawValue:(id)a3;
- (PKStrokePoint)interpolatedPointAt:(CGFloat)parametricValue;
- (PKStrokePoint)objectAtIndexedSubscript:(NSUInteger)i;
- (PKStrokePoint)pointAtIndex:(NSUInteger)i;
- (_PKStrokePoint)decompressedPointAt:(SEL)a3;
- (double)_maxWidth;
- (double)_timestamp;
- (double)interpolatedTimeoffsetAt:(double)a3;
- (double)radiusAtIndex:(unint64_t)a3;
- (double)timestampAtIndex:(unint64_t)a3;
- (id).cxx_construct;
- (id)copyTransformed:(id)a3 inCoordinateSpace:(CGAffineTransform *)a4;
- (id)copyWithScaledRadius:(double)a3 isVector:(BOOL)a4;
- (id)copyWithStrokeDataUUID:(id)a3;
- (id)dataApplying:(id)a3;
- (id)deltaTo:(id)a3;
- (id)description;
- (id)rawValue;
- (int64_t)_inputType;
- (unint64_t)_immutablePointsCount;
- (unint64_t)_pointsCount;
- (unint64_t)_startIndex;
- (unsigned)_legacyRandomSeed;
- (void)_enumerateInterpolatedPointsInRange:(id)a3 incrementBlock:(id)a4 usingBlock:(id)a5;
- (void)_scaleRadius:(double)a3 isVector:(BOOL)a4;
- (void)_transform:(id)a3 existingTransform:(CGAffineTransform *)a4;
- (void)enumerateInterpolatedPointsInRange:(PKFloatRange *)range strideByDistance:(CGFloat)distanceStep usingBlock:(void *)block;
- (void)enumerateInterpolatedPointsInRange:(PKFloatRange *)range strideByParametricStep:(CGFloat)parametricStep usingBlock:(void *)block;
- (void)enumerateInterpolatedPointsInRange:(PKFloatRange *)range strideByTime:(NSTimeInterval)timeStep usingBlock:(void *)block;
- (void)readStrokeDataFromArchive:(const void *)a3;
- (void)setLocation:(CGPoint)a3 atIndex:(unint64_t)a4;
- (void)setPoints:(PKCompressedStrokePoint *)a3 pointsCount:(unint64_t)a4 timestamp:(double)a5;
- (void)setPointsFrom:(id)a3 range:(_NSRange)a4;
@end

@implementation PKStrokePath

- (PKStrokePath)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [(PKStrokePath *)self initWithPoints:0 count:0 immutableCount:0 inputType:1 timestamp:v3 UUID:0.0];

  return v4;
}

- (PKStrokePath)initWithPoints:(PKCompressedStrokePoint *)a3 count:(unint64_t)a4 immutableCount:(unint64_t)a5 inputType:(int64_t)a6 timestamp:(double)a7 UUID:(id)a8
{
  id v15 = a8;
  v18.receiver = self;
  v18.super_class = (Class)PKStrokePath;
  v16 = [(PKStrokePath *)&v18 init];
  if (v16)
  {
    [(id)objc_opt_class() calculateOffsets];
    v16->_immutablePointsCount = a5;
    v16->_inputType = a6;
    objc_storeStrong((id *)&v16->_strokeDataUUID, a8);
    v16->_cachedMaxWidth = 1.79769313e308;
    [(PKStrokePath *)v16 setPoints:a3 pointsCount:a4 timestamp:a7];
  }

  return v16;
}

- (PKStrokePath)initWithDataPoints:(PKStrokePathPointsPrivate *)a3 immutableCount:(unint64_t)a4 inputType:(int64_t)a5 UUID:(id)a6 didValidateTimestamps:(BOOL)a7 hasValidTimestampData:(BOOL)a8 cachedMaxWidth:(double)a9 unknownFields:(shared_ptr<PKProtobufUnknownFields>)a10
{
  id v18 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKStrokePath;
  v19 = [(PKStrokePath *)&v27 init];
  if (v19)
  {
    [(id)objc_opt_class() calculateOffsets];
    v19->_immutablePointsCount = a4;
    v19->_startIndex = a5;
    v19->_inputType = a5;
    objc_storeStrong((id *)&v19->_strokeDataUUID, a6);
    v19->_cachedMaxWidth = a9;
    ptr = a3->constants.__ptr_;
    cntrl = a3->constants.__cntrl_;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    v22 = (std::__shared_weak_count *)v19->_strokeDataPointsPrivate.constants.__cntrl_;
    v19->_strokeDataPointsPrivate.constants.__ptr_ = ptr;
    v19->_strokeDataPointsPrivate.constants.__cntrl_ = cntrl;
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
    if (&v19->_strokeDataPointsPrivate != a3) {
      std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v19->_strokeDataPointsPrivate.pointsData.__begin_, a3->pointsData.__begin_, a3->pointsData.__end_, a3->pointsData.__end_ - a3->pointsData.__begin_);
    }
    v24 = *(PKProtobufUnknownFields **)a10.__ptr_;
    uint64_t v23 = *((void *)a10.__ptr_ + 1);
    if (v23) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v23 + 8), 1uLL, memory_order_relaxed);
    }
    v25 = (std::__shared_weak_count *)v19->_unknownFields.__cntrl_;
    v19->_unknownFields.__ptr_ = v24;
    v19->_unknownFields.__cntrl_ = (__shared_weak_count *)v23;
    if (v25) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    v19->_didValidateTimestamps = a7;
    v19->_hasValidTimestampData = a8;
  }

  return v19;
}

- (PKStrokePath)initWithControlPoints:(NSArray *)controlPoints creationDate:(NSDate *)creationDate
{
  v6 = controlPoints;
  v7 = creationDate;
  v25.receiver = self;
  v25.super_class = (Class)PKStrokePath;
  v8 = [(PKStrokePath *)&v25 init];
  if (v8)
  {
    [(id)objc_opt_class() calculateOffsets];
    v8->_unint64_t immutablePointsCount = [(NSArray *)v6 count];
    v8->_inputType = 1;
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    strokeDataUUID = v8->_strokeDataUUID;
    v8->_strokeDataUUID = (NSUUID *)v9;

    v8->_cachedMaxWidth = 1.79769313e308;
    __p = 0;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    std::vector<PKCompressedStrokePoint>::resize((uint64_t)&__p, v8->_immutablePointsCount);
    if (v8->_immutablePointsCount)
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      do
      {
        v13 = -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v12, v20, v21);
        v14 = v13;
        if (v13)
        {
          [v13 _compressedPoint];
        }
        else
        {
          long long v20 = 0u;
          long long v21 = 0u;
        }
        id v15 = (long long *)((char *)__p + v11);
        *id v15 = v20;
        v15[1] = v21;

        ++v12;
        unint64_t immutablePointsCount = v8->_immutablePointsCount;
        v11 += 32;
      }
      while (v12 < immutablePointsCount);
    }
    else
    {
      unint64_t immutablePointsCount = 0;
    }
    id v18 = __p;
    v17 = v23;
    if (v23 != __p)
    {
      [(NSDate *)v7 timeIntervalSinceReferenceDate];
      -[PKStrokePath setPoints:pointsCount:timestamp:](v8, "setPoints:pointsCount:timestamp:", v18, immutablePointsCount);
      v17 = __p;
    }
    if (v17)
    {
      uint64_t v23 = v17;
      operator delete(v17);
    }
  }

  return v8;
}

- (PKStrokePath)initWithData:(id)a3 range:(_NSRange)a4 UUID:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKStrokePath;
  id v11 = [(PKStrokePath *)&v16 init];
  if (v11)
  {
    [(id)objc_opt_class() calculateOffsets];
    *((void *)v11 + 11) = location;
    *((void *)v11 + 10) = [v9 _immutablePointsCount];
    *((void *)v11 + 12) = [v9 _inputType];
    objc_storeStrong((id *)v11 + 13, a5);
    *((void *)v11 + 9) = 0x7FEFFFFFFFFFFFFFLL;
    objc_msgSend(v11, "setPointsFrom:range:", v9, location, length);
    uint64_t v13 = v9[6];
    uint64_t v12 = v9[7];
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    v14 = (std::__shared_weak_count *)*((void *)v11 + 7);
    *((void *)v11 + 6) = v13;
    *((void *)v11 + 7) = v12;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }

  return (PKStrokePath *)v11;
}

- (id)copyTransformed:(id)a3 inCoordinateSpace:(CGAffineTransform *)a4
{
  id v6 = a3;
  v7 = [PKStrokePath alloc];
  cntrl = self->_strokeDataPointsPrivate.constants.__cntrl_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  uint64_t v23 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  __p = 0;
  objc_super v25 = 0;
  uint64_t v26 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, self->_strokeDataPointsPrivate.pointsData.__begin_, (uint64_t)self->_strokeDataPointsPrivate.pointsData.__end_, self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_);
  unint64_t immutablePointsCount = self->_immutablePointsCount;
  int64_t inputType = self->_inputType;
  id v11 = [MEMORY[0x1E4F29128] UUID];
  BOOL didValidateTimestamps = self->_didValidateTimestamps;
  BOOL hasValidTimestampData = self->_hasValidTimestampData;
  double cachedMaxWidth = self->_cachedMaxWidth;
  id v15 = self->_unknownFields.__cntrl_;
  long long v20 = self->_unknownFields.__ptr_;
  long long v21 = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v15 + 1, 1uLL, memory_order_relaxed);
  }
  objc_super v16 = [(PKStrokePath *)v7 initWithDataPoints:&ptr immutableCount:immutablePointsCount inputType:inputType UUID:v11 didValidateTimestamps:didValidateTimestamps hasValidTimestampData:hasValidTimestampData cachedMaxWidth:cachedMaxWidth unknownFields:&v20];
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v21);
  }

  if (__p)
  {
    objc_super v25 = __p;
    operator delete(__p);
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v23);
  }
  long long v17 = *(_OWORD *)&a4->c;
  v19[0] = *(_OWORD *)&a4->a;
  v19[1] = v17;
  v19[2] = *(_OWORD *)&a4->tx;
  [(PKStrokePath *)v16 _transform:v6 existingTransform:v19];

  return v16;
}

- (id)copyWithScaledRadius:(double)a3 isVector:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [PKStrokePath alloc];
  cntrl = self->_strokeDataPointsPrivate.constants.__cntrl_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  long long v21 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  __p = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, self->_strokeDataPointsPrivate.pointsData.__begin_, (uint64_t)self->_strokeDataPointsPrivate.pointsData.__end_, self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_);
  unint64_t immutablePointsCount = self->_immutablePointsCount;
  int64_t inputType = self->_inputType;
  id v11 = [MEMORY[0x1E4F29128] UUID];
  BOOL didValidateTimestamps = self->_didValidateTimestamps;
  BOOL hasValidTimestampData = self->_hasValidTimestampData;
  double cachedMaxWidth = self->_cachedMaxWidth;
  id v15 = self->_unknownFields.__cntrl_;
  id v18 = self->_unknownFields.__ptr_;
  v19 = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v15 + 1, 1uLL, memory_order_relaxed);
  }
  objc_super v16 = [(PKStrokePath *)v7 initWithDataPoints:&ptr immutableCount:immutablePointsCount inputType:inputType UUID:v11 didValidateTimestamps:didValidateTimestamps hasValidTimestampData:hasValidTimestampData cachedMaxWidth:cachedMaxWidth unknownFields:&v18];
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v19);
  }

  if (__p)
  {
    uint64_t v23 = __p;
    operator delete(__p);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v21);
  }
  [(PKStrokePath *)v16 _scaleRadius:v4 isVector:a3];
  return v16;
}

- (id)copyWithStrokeDataUUID:(id)a3
{
  id v4 = a3;
  v5 = [PKStrokePath alloc];
  cntrl = self->_strokeDataPointsPrivate.constants.__cntrl_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  id v18 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  __p = 0;
  long long v20 = 0;
  uint64_t v21 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, self->_strokeDataPointsPrivate.pointsData.__begin_, (uint64_t)self->_strokeDataPointsPrivate.pointsData.__end_, self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_);
  unint64_t immutablePointsCount = self->_immutablePointsCount;
  int64_t inputType = self->_inputType;
  BOOL didValidateTimestamps = self->_didValidateTimestamps;
  BOOL hasValidTimestampData = self->_hasValidTimestampData;
  double cachedMaxWidth = self->_cachedMaxWidth;
  uint64_t v12 = self->_unknownFields.__cntrl_;
  id v15 = self->_unknownFields.__ptr_;
  objc_super v16 = v12;
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v12 + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v13 = [(PKStrokePath *)v5 initWithDataPoints:&ptr immutableCount:immutablePointsCount inputType:inputType UUID:v4 didValidateTimestamps:didValidateTimestamps hasValidTimestampData:hasValidTimestampData cachedMaxWidth:cachedMaxWidth unknownFields:&v15];
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v16);
  }
  if (__p)
  {
    long long v20 = __p;
    operator delete(__p);
  }
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v18);
  }

  return v13;
}

- (void)_transform:(id)a3 existingTransform:(CGAffineTransform *)a4
{
  id v6 = (double (**)(void, double, double))a3;
  unint64_t v7 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (v7)
  {
    ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
    p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
    unint64_t v10 = *((void *)ptr + 6);
    if (v10 <= v7)
    {
      unint64_t v11 = 0;
      unint64_t v12 = v7 / v10;
      do
      {
        double v13 = PKStrokePathPointsPrivate::locationAtIndex(p_strokeDataPointsPrivate, v11);
        double v15 = v6[2](v6, a4->tx + v14 * a4->c + a4->a * v13, a4->ty + v14 * a4->d + a4->b * v13);
        double v20 = v16;
        double v21 = v15;
        long long v17 = *(_OWORD *)&a4->c;
        *(_OWORD *)&v22.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&v22.c = v17;
        *(_OWORD *)&v22.tx = *(_OWORD *)&a4->tx;
        CGAffineTransformInvert(&v23, &v22);
        CGPoint v18 = (CGPoint)vaddq_f64(*(float64x2_t *)&v23.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v23.c, v20), *(float64x2_t *)&v23.a, v21));
        CGFloat y = v18.y;
        PKStrokePathPointsPrivate::setLocation(p_strokeDataPointsPrivate, v18, v11++);
      }
      while (v12 != v11);
    }
  }
}

- (void)_scaleRadius:(double)a3 isVector:(BOOL)a4
{
  BOOL v4 = a4;
  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  if ((*((unsigned char *)ptr + 32) & 4) == 0) {
    operator new();
  }
  unint64_t v9 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (v9)
  {
    unint64_t v10 = *((void *)ptr + 6);
    if (v10 <= v9)
    {
      unint64_t v11 = 0;
      unint64_t v12 = v9 / v10;
      do
      {
        double v13 = PKStrokePathPointsPrivate::radiusAtIndex(p_strokeDataPointsPrivate, v11);
        double v14 = (v13 + -2.0) * a3 + 2.0;
        double v15 = v13 * a3;
        if (v4) {
          double v15 = v14;
        }
        PKStrokePathPointsPrivate::setRadius(p_strokeDataPointsPrivate, v15, v11++);
      }
      while (v12 != v11);
    }
  }
  if (!v4)
  {
    if ((*((unsigned char *)p_strokeDataPointsPrivate->constants.__ptr_ + 33) & 2) == 0) {
      operator new();
    }
    unint64_t v16 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
    if (v16)
    {
      unint64_t v17 = *((void *)p_strokeDataPointsPrivate->constants.__ptr_ + 6);
      if (v17 <= v16)
      {
        unint64_t v18 = 0;
        unint64_t v19 = v16 / v17;
        do
        {
          double v20 = PKStrokePathPointsPrivate::radius2AtIndex(p_strokeDataPointsPrivate, v18);
          PKStrokePathPointsPrivate::setRadius2(p_strokeDataPointsPrivate, v20 * a3, v18++);
        }
        while (v19 != v18);
      }
    }
  }
}

- (unint64_t)_pointsCount
{
  unint64_t v2 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (v2) {
    return v2 / *((void *)self->_strokeDataPointsPrivate.constants.__ptr_ + 6);
  }
  else {
    return 0;
  }
}

- (NSUInteger)count
{
  unint64_t v2 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (v2) {
    return v2 / *((void *)self->_strokeDataPointsPrivate.constants.__ptr_ + 6);
  }
  else {
    return 0;
  }
}

- (double)_timestamp
{
  return *(double *)self->_strokeDataPointsPrivate.constants.__ptr_;
}

- (NSDate)creationDate
{
  unint64_t v2 = (void *)MEMORY[0x1E4F1C9C8];
  [(PKStrokePath *)self _timestamp];

  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (BOOL)hasValidPointTimestampData
{
  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  if ((*((unsigned char *)ptr + 40) & 2) != 0) {
    return 0;
  }
  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  unint64_t v6 = self->_strokeDataPointsPrivate.pointsData.__end_ - begin;
  if (v6)
  {
    unint64_t v7 = *((void *)ptr + 6) <= v6 && (*((unsigned char *)ptr + 32) & 2) != 0
       ? (float *)&begin[*((unsigned __int8 *)ptr + 89)]
       : (float *)((char *)ptr + 64);
    unint64_t v8 = v6 / *((void *)ptr + 6) - 1;
  }
  else
  {
    unint64_t v7 = (float *)((char *)ptr + 64);
    unint64_t v8 = -1;
  }
  double v9 = *v7;
  if (PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, v8) <= v9) {
    return 0;
  }
  if (self->_didValidateTimestamps)
  {
    BOOL hasValidTimestampData = self->_hasValidTimestampData;
  }
  else
  {
    unint64_t v11 = self->_strokeDataPointsPrivate.pointsData.__end_ - self->_strokeDataPointsPrivate.pointsData.__begin_;
    if (v11) {
      uint64_t v12 = v11 / *((void *)p_strokeDataPointsPrivate->constants.__ptr_ + 6) - 1;
    }
    else {
      uint64_t v12 = -1;
    }
    unint64_t v13 = 0;
    uint64_t v14 = v12 & ~(v12 >> 63);
    while (v14 != v13)
    {
      unint64_t v15 = v13 + 1;
      double v16 = PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v13 + 1);
      double v17 = v16 - PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v13);
      BOOL v18 = v17 > 0.0 && v17 < 10.0;
      ++v13;
      if (!v18)
      {
        uint64_t v14 = v15 - 1;
        break;
      }
    }
    BOOL hasValidTimestampData = v14 >= v12;
    self->_BOOL didValidateTimestamps = 1;
    self->_BOOL hasValidTimestampData = v14 >= v12;
  }
  return hasValidTimestampData;
}

- (BOOL)hasAzimuthAngles
{
  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  if ((*((unsigned char *)self->_strokeDataPointsPrivate.constants.__ptr_ + 40) & 0x40) != 0)
  {
    NSUInteger v3 = [(PKStrokePath *)self count];
    if (v3)
    {
      double v5 = PKStrokePathPointsPrivate::azimuthAtIndex(p_strokeDataPointsPrivate, 0, v4);
      LOBYTE(v3) = fabs(v5) >= 0.00999999978 && fabs(v5 + -3.14159265) >= 0.00999999978;
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)inflight
{
  unint64_t v3 = [(PKStrokePath *)self _immutablePointsCount];
  return v3 < [(PKStrokePath *)self _pointsCount];
}

- (unsigned)_legacyRandomSeed
{
  unint64_t v2 = [(PKStrokePath *)self _strokeDataUUID];
  unsigned int v3 = [v2 hash];

  return v3;
}

+ (void)calculateOffsets
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PKStrokePath_calculateOffsets__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PKStrokePath calculateOffsets]::onceToken != -1) {
    dispatch_once(&+[PKStrokePath calculateOffsets]::onceToken, block);
  }
}

uint64_t __32__PKStrokePath_calculateOffsets__block_invoke()
{
  v0 = objc_opt_class();
}

+ (void)_calculateOffsets:(unint64_t *)a3 sizes:(unint64_t *)a4
{
  *(_OWORD *)a3 = xmmword_1C48294C0;
  *((_OWORD *)a3 + 1) = xmmword_1C48294D0;
  *((_OWORD *)a3 + 2) = xmmword_1C48294E0;
  *((_OWORD *)a3 + 3) = xmmword_1C48294F0;
  *((_OWORD *)a3 + 4) = xmmword_1C4829500;
  int64x2_t v4 = vdupq_n_s64(2uLL);
  *(_OWORD *)a4 = xmmword_1C4829510;
  *((_OWORD *)a4 + 1) = xmmword_1C4829520;
  *((int64x2_t *)a4 + 2) = v4;
  *((int64x2_t *)a4 + 3) = v4;
  *((_OWORD *)a4 + 4) = xmmword_1C4827090;
}

- (void)setPoints:(PKCompressedStrokePoint *)a3 pointsCount:(unint64_t)a4 timestamp:(double)a5
{
}

- (void)setPointsFrom:(id)a3 range:(_NSRange)a4
{
  v5.NSUInteger location = a4.location;
  a4.NSUInteger location = (NSUInteger)&self->_strokeDataPointsPrivate;
  int64x2_t v4 = (PKStrokePathPointsPrivate *)((char *)a3 + 8);
  v5.NSUInteger length = a4.length;
  PKStrokePathPointsPrivate::slice(v4, v5, (PKStrokePathPointsPrivate *)a4.location);
}

- (CGPoint)locationAtIndex:(unint64_t)a3
{
  double v3 = PKStrokePathPointsPrivate::locationAtIndex(&self->_strokeDataPointsPrivate, a3);
  result.CGFloat y = v4;
  result.x = v3;
  return result;
}

- (void)setLocation:(CGPoint)a3 atIndex:(unint64_t)a4
{
}

- (double)timestampAtIndex:(unint64_t)a3
{
  return PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, a3);
}

- (double)radiusAtIndex:(unint64_t)a3
{
  return PKStrokePathPointsPrivate::radiusAtIndex(&self->_strokeDataPointsPrivate, a3);
}

- (CGPath)_newPathRepresentation
{
  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  uint64_t v3 = [(PKStrokePath *)self _pointsCount];

  return PKCreateCGPathFromBSpline(p_strokeDataPointsPrivate, v3);
}

- (PKCompressedStrokePoint)_compressedPointAt:(SEL)a3
{
  return (PKCompressedStrokePoint *)PKStrokePathPointsPrivate::operator[](&self->_strokeDataPointsPrivate.constants.__ptr_, a4, retstr);
}

- (PKStrokePoint)pointAtIndex:(NSUInteger)i
{
  uint64_t v3 = [[PKStrokePoint alloc] initWithSlice:&self->_strokeDataPointsPrivate index:i];

  return v3;
}

- (PKStrokePoint)objectAtIndexedSubscript:(NSUInteger)i
{
  uint64_t v3 = [[PKStrokePoint alloc] initWithSlice:&self->_strokeDataPointsPrivate index:i];

  return v3;
}

- (CGPoint)interpolatedLocationAt:(CGFloat)parametricValue
{
  [(PKStrokePath *)self locationOnSegment:vcvtmd_u64_f64(parametricValue) t:parametricValue - floor(parametricValue)];
  result.CGFloat y = v4;
  result.x = v3;
  return result;
}

- (double)interpolatedTimeoffsetAt:(double)a3
{
  NSUInteger v5 = [(PKStrokePath *)self count];
  if (a3 >= 0.0)
  {
    unint64_t v11 = v5 - 1;
    if ((double)(uint64_t)(v5 - 1) <= a3)
    {
      return PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, v11);
    }
    else
    {
      unint64_t v12 = vcvtmd_u64_f64(a3);
      double v13 = a3 - (double)(unint64_t)floor(a3);
      if (v12 + 1 < v11) {
        unint64_t v14 = v12 + 1;
      }
      else {
        unint64_t v14 = v5 - 1;
      }
      p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
      double v16 = PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v12);
      return v13 * PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v14) + v16 * (1.0 - v13);
    }
  }
  else
  {
    begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
    ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
    unint64_t v8 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
    if (v8 && *((void *)ptr + 6) <= (unint64_t)v8 && (*((unsigned char *)ptr + 32) & 2) != 0) {
      double v9 = (float *)&begin[*((unsigned __int8 *)ptr + 89)];
    }
    else {
      double v9 = (float *)((char *)ptr + 64);
    }
    return *v9;
  }
}

- (PKStrokePoint)interpolatedPointAt:(CGFloat)parametricValue
{
  NSUInteger v5 = [(PKStrokePath *)self count];
  unint64_t v6 = vcvtmd_u64_f64(parametricValue);
  unint64_t v7 = [[PKStrokePoint alloc] initWithSlice:&self->_strokeDataPointsPrivate index:v6];
  unint64_t v8 = [(PKStrokePoint *)v7 _strokeDataPointsPrivate];
  double v9 = (double)(unint64_t)floor(parametricValue);
  double v10 = parametricValue - v9;
  uint64_t v11 = *((void *)self->_strokeDataPointsPrivate.constants.__ptr_ + 4);
  if (v11)
  {
    [(PKStrokePath *)self locationOnSegment:v6 t:v10];
    *(float *)&double v9 = PKStrokePathPointsPrivate::setLocation(v8, v44, 0);
  }
  if (v6 + 1 < v5 - 1) {
    unint64_t v12 = v6 + 1;
  }
  else {
    unint64_t v12 = v5 - 1;
  }
  if ((v11 & 2) != 0)
  {
    double v13 = PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, v6);
    double v9 = PKStrokePathPointsPrivate::timestampAtIndex(&self->_strokeDataPointsPrivate, v12);
    begin = v8->pointsData.__begin_;
    end = v8->pointsData.__end_;
    unint64_t v16 = end - begin;
    if (end != begin)
    {
      ptr = v8->constants.__ptr_;
      if (*((void *)v8->constants.__ptr_ + 6) <= v16 && (*((unsigned char *)ptr + 32) & 2) != 0)
      {
        double v9 = v10 * v9 + v13 * (1.0 - v10);
        *(float *)&double v9 = v9;
        *(_DWORD *)&begin[*((unsigned __int8 *)ptr + 89)] = LODWORD(v9);
      }
    }
  }
  if ((v11 & 4) != 0)
  {
    double v18 = PKStrokePathPointsPrivate::radiusAtIndex(&self->_strokeDataPointsPrivate, v6);
    double v9 = PKStrokePathPointsPrivate::radiusAtIndex(&self->_strokeDataPointsPrivate, v12);
    unint64_t v19 = v8->pointsData.__begin_;
    double v20 = v8->pointsData.__end_;
    unint64_t v21 = v20 - v19;
    if (v20 != v19)
    {
      CGAffineTransform v22 = v8->constants.__ptr_;
      if (*((void *)v8->constants.__ptr_ + 6) <= v21 && (*((unsigned char *)v22 + 32) & 4) != 0)
      {
        double v9 = v10 * v9 + v18 * (1.0 - v10);
        *(float *)&double v9 = v9;
        *(_DWORD *)&v19[*((unsigned __int8 *)v22 + 90)] = LODWORD(v9);
      }
    }
  }
  if ((v11 & 8) != 0)
  {
    double v23 = PKStrokePathPointsPrivate::aspectRatioAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
    double v24 = PKStrokePathPointsPrivate::aspectRatioAtIndex(&self->_strokeDataPointsPrivate, v12, v23);
    PKStrokePathPointsPrivate::setAspectRatio(v8, v10 * v24 + v23 * (1.0 - v10), 0);
    if ((v11 & 0x10) == 0)
    {
LABEL_18:
      if ((v11 & 0x20) == 0) {
        goto LABEL_19;
      }
LABEL_23:
      double v27 = PKStrokePathPointsPrivate::forceAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
      double v28 = PKStrokePathPointsPrivate::forceAtIndex(&self->_strokeDataPointsPrivate, v12, v27);
      PKStrokePathPointsPrivate::setForce(v8, v10 * v28 + v27 * (1.0 - v10), 0);
      if ((v11 & 0x40) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((v11 & 0x10) == 0)
  {
    goto LABEL_18;
  }
  double v25 = PKStrokePathPointsPrivate::edgeWidthAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
  double v26 = PKStrokePathPointsPrivate::edgeWidthAtIndex(&self->_strokeDataPointsPrivate, v12, v25);
  PKStrokePathPointsPrivate::setEdgeWidth(v8, v10 * v26 + v25 * (1.0 - v10), 0);
  if ((v11 & 0x20) != 0) {
    goto LABEL_23;
  }
LABEL_19:
  if ((v11 & 0x40) != 0)
  {
LABEL_24:
    double v29 = PKStrokePathPointsPrivate::azimuthAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
    double v30 = PKStrokePathPointsPrivate::azimuthAtIndex(&self->_strokeDataPointsPrivate, v12, v29);
    PKStrokePathPointsPrivate::setAzimuth(v8, v10 * v30 + v29 * (1.0 - v10), 0);
  }
LABEL_25:
  if ((v11 & 0x80) != 0)
  {
    double v31 = PKStrokePathPointsPrivate::altitudeAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
    double v32 = PKStrokePathPointsPrivate::altitudeAtIndex(&self->_strokeDataPointsPrivate, v12, v31);
    PKStrokePathPointsPrivate::setAltitude(v8, v10 * v32 + v31 * (1.0 - v10), 0);
    if ((v11 & 0x100) == 0)
    {
LABEL_27:
      if ((v11 & 0x200) == 0) {
        goto LABEL_35;
      }
      goto LABEL_31;
    }
  }
  else if ((v11 & 0x100) == 0)
  {
    goto LABEL_27;
  }
  double v33 = PKStrokePathPointsPrivate::opacityAtIndex(&self->_strokeDataPointsPrivate, v6, v9);
  double v34 = PKStrokePathPointsPrivate::opacityAtIndex(&self->_strokeDataPointsPrivate, v12, v33);
  PKStrokePathPointsPrivate::setOpacity(v8, v10 * v34 + v33 * (1.0 - v10), 0);
  if ((v11 & 0x200) == 0) {
    goto LABEL_35;
  }
LABEL_31:
  double v35 = PKStrokePathPointsPrivate::radius2AtIndex(&self->_strokeDataPointsPrivate, v6);
  double v36 = PKStrokePathPointsPrivate::radius2AtIndex(&self->_strokeDataPointsPrivate, v12);
  v37 = v8->pointsData.__begin_;
  v38 = v8->pointsData.__end_;
  unint64_t v39 = v38 - v37;
  if (v38 != v37)
  {
    v40 = v8->constants.__ptr_;
    if (*((void *)v8->constants.__ptr_ + 6) <= v39 && (*((unsigned char *)v40 + 33) & 2) != 0)
    {
      float v41 = v10 * v36 + v35 * (1.0 - v10);
      *(float *)&v37[*((unsigned __int8 *)v40 + 97)] = v41;
    }
  }
LABEL_35:

  return v7;
}

- (_PKStrokePoint)decompressedPointAt:(SEL)a3
{
  PKStrokePathPointsPrivate::pointAtIndex(&self->_strokeDataPointsPrivate, a4, (uint64_t)retstr);
  return result;
}

- (CGPoint)locationOnSegment:(unint64_t)a3 t:(double)a4
{
  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  unint64_t v7 = [(PKStrokePath *)self _pointsCount];

  double v8 = splinePoint(p_strokeDataPointsPrivate, 0, v7, a3, a4, b);
  result.CGFloat y = v9;
  result.x = v8;
  return result;
}

- (CGFloat)parametricValue:(CGFloat)parametricValue offsetByDistance:(CGFloat)distanceStep
{
  uint64_t v7 = [(PKStrokePath *)self _pointsCount];
  uint64_t v8 = v7;
  unint64_t v9 = (uint64_t)parametricValue;
  if (distanceStep <= 0.0)
  {
    if (distanceStep < 0.0)
    {
      double v16 = (double)v9;
      double v17 = (double)v9 - parametricValue + 1.0;
      p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
      double v19 = splineSegmentLength(p_strokeDataPointsPrivate, 0, v7, v9);
      BOOL v20 = v17 > 0.0;
      double v21 = -(distanceStep - v17 * v19);
      if (v17 <= 0.0) {
        double v21 = -distanceStep;
      }
      if (v21 >= v19)
      {
        do
        {
          if (v20) {
            double v17 = 0.0;
          }
          double v22 = v21 - v19;
          double v19 = splineSegmentLength(p_strokeDataPointsPrivate, 0, v8, --v9);
          BOOL v20 = v17 > 0.0;
          double v21 = v22 + v17 * v19;
          if (v17 <= 0.0) {
            double v21 = v22;
          }
        }
        while (v21 >= v19);
        double v16 = (double)v9;
      }
      double v23 = v16 + 1.0 - v21 / v19;
      if (v23 >= 0.0) {
        return v23;
      }
      else {
        return 0.0;
      }
    }
  }
  else
  {
    double v10 = (double)v9;
    unint64_t v11 = v7 - 1;
    double v12 = 0.0;
    if (v7 - 1 > v9)
    {
      double v13 = &self->_strokeDataPointsPrivate;
      double v14 = parametricValue - v10;
      while (1)
      {
        double v12 = splineSegmentLength(v13, 0, v8, v9);
        if (v14 > 0.0) {
          distanceStep = distanceStep + v14 * v12;
        }
        if (distanceStep < v12) {
          break;
        }
        if (v14 > 0.0) {
          double v14 = 0.0;
        }
        distanceStep = distanceStep - v12;
        if (v11 == ++v9)
        {
          unint64_t v9 = v8 - 1;
          break;
        }
      }
      double v10 = (double)v9;
    }
    double v15 = v10 + distanceStep / v12;
    if (v15 >= (double)v11) {
      return (double)v11;
    }
    else {
      return v15;
    }
  }
  return parametricValue;
}

- (CGFloat)parametricValue:(CGFloat)parametricValue offsetByTime:(NSTimeInterval)timeStep
{
  unint64_t v7 = [(PKStrokePath *)self _pointsCount];
  unint64_t v8 = (uint64_t)parametricValue;
  if (timeStep <= 0.0)
  {
    if (timeStep < 0.0)
    {
      double v17 = (double)v8;
      double v18 = (double)v8 - parametricValue + 1.0;
      p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
      double v20 = PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v8 + 1);
      double v21 = v20 - PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v8);
      BOOL v22 = v18 > 0.0;
      double v23 = -(timeStep - v18 * v21);
      if (v18 <= 0.0) {
        double v23 = -timeStep;
      }
      if (v23 >= v21)
      {
        do
        {
          if (v22) {
            double v18 = 0.0;
          }
          double v24 = v23 - v21;
          unint64_t v25 = v8 - 1;
          double v26 = PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v8);
          double v21 = v26 - PKStrokePathPointsPrivate::timestampAtIndex(p_strokeDataPointsPrivate, v8 - 1);
          BOOL v22 = v18 > 0.0;
          double v23 = v24 + v18 * v21;
          if (v18 <= 0.0) {
            double v23 = v24;
          }
          --v8;
        }
        while (v23 >= v21);
        double v17 = (double)v25;
      }
      double v27 = v17 + 1.0 - v23 / v21;
      if (v27 >= 0.0) {
        return v27;
      }
      else {
        return 0.0;
      }
    }
  }
  else
  {
    double v9 = (double)v8;
    unint64_t v10 = v7 - 1;
    double v11 = 0.0;
    if (v7 - 1 > v8)
    {
      double v12 = &self->_strokeDataPointsPrivate;
      double v13 = parametricValue - v9;
      while (1)
      {
        unint64_t v14 = v8 + 1;
        double v15 = PKStrokePathPointsPrivate::timestampAtIndex(v12, v8 + 1);
        double v11 = v15 - PKStrokePathPointsPrivate::timestampAtIndex(v12, v8);
        if (v13 > 0.0) {
          timeStep = timeStep + v13 * v11;
        }
        if (timeStep < v11) {
          break;
        }
        if (v13 > 0.0) {
          double v13 = 0.0;
        }
        timeStep = timeStep - v11;
        ++v8;
        if (v10 == v14)
        {
          unint64_t v8 = v10;
          break;
        }
      }
      double v9 = (double)v8;
    }
    double v16 = v9 + timeStep / v11;
    if (v16 >= (double)v10) {
      return (double)v10;
    }
    else {
      return v16;
    }
  }
  return parametricValue;
}

- (void)_enumerateInterpolatedPointsInRange:(id)a3 incrementBlock:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  double v9 = (double (**)(void, double))a4;
  unint64_t v10 = (void (**)(id, void *, unsigned char *))a5;
  [v8 lowerBound];
  if (v11 >= 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = 0.0;
  }
  [v8 upperBound];
  double v14 = v13;
  NSUInteger v15 = [(PKStrokePath *)self count];
  if (v14 >= (double)(v15 - 1)) {
    double v14 = (double)(v15 - 1);
  }
  if (v14 >= v12)
  {
    char v19 = 0;
    while (1)
    {
      double v16 = v12 >= v14 ? v14 : v12;
      double v17 = [(PKStrokePath *)self interpolatedPointAt:v16];
      v10[2](v10, v17, &v19);
      if (v12 >= v14) {
        break;
      }
      double v18 = v9[2](v9, v12);
      if (v18 + 0.001 >= v14) {
        double v12 = v14;
      }
      else {
        double v12 = v18;
      }

      if (v19) {
        goto LABEL_18;
      }
    }
  }
LABEL_18:
}

- (void)enumerateInterpolatedPointsInRange:(PKFloatRange *)range strideByDistance:(CGFloat)distanceStep usingBlock:(void *)block
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__PKStrokePath_enumerateInterpolatedPointsInRange_strideByDistance_usingBlock___block_invoke;
  v5[3] = &unk_1E64C6DC0;
  v5[4] = self;
  *(CGFloat *)&v5[5] = distanceStep;
  [(PKStrokePath *)self _enumerateInterpolatedPointsInRange:range incrementBlock:v5 usingBlock:block];
}

uint64_t __79__PKStrokePath_enumerateInterpolatedPointsInRange_strideByDistance_usingBlock___block_invoke(uint64_t a1, double a2)
{
  return [*(id *)(a1 + 32) parametricValue:a2 offsetByDistance:*(double *)(a1 + 40)];
}

- (void)enumerateInterpolatedPointsInRange:(PKFloatRange *)range strideByTime:(NSTimeInterval)timeStep usingBlock:(void *)block
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PKStrokePath_enumerateInterpolatedPointsInRange_strideByTime_usingBlock___block_invoke;
  v5[3] = &unk_1E64C6DC0;
  v5[4] = self;
  *(NSTimeInterval *)&v5[5] = timeStep;
  [(PKStrokePath *)self _enumerateInterpolatedPointsInRange:range incrementBlock:v5 usingBlock:block];
}

uint64_t __75__PKStrokePath_enumerateInterpolatedPointsInRange_strideByTime_usingBlock___block_invoke(uint64_t a1, double a2)
{
  return [*(id *)(a1 + 32) parametricValue:a2 offsetByTime:*(double *)(a1 + 40)];
}

- (void)enumerateInterpolatedPointsInRange:(PKFloatRange *)range strideByParametricStep:(CGFloat)parametricStep usingBlock:(void *)block
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__PKStrokePath_enumerateInterpolatedPointsInRange_strideByParametricStep_usingBlock___block_invoke;
  v5[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(CGFloat *)&v5[4] = parametricStep;
  [(PKStrokePath *)self _enumerateInterpolatedPointsInRange:range incrementBlock:v5 usingBlock:block];
}

double __85__PKStrokePath_enumerateInterpolatedPointsInRange_strideByParametricStep_usingBlock___block_invoke(uint64_t a1, double a2)
{
  return *(double *)(a1 + 32) + a2;
}

- (double)_maxWidth
{
  unint64_t v2 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&maxStrokeWidth_lock);
  double cachedMaxWidth = v2->_cachedMaxWidth;

  os_unfair_lock_unlock((os_unfair_lock_t)&maxStrokeWidth_lock);
  if (cachedMaxWidth == 1.79769313e308)
  {
    uint64_t v4 = [(PKStrokePath *)v2 _pointsCount];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = 0;
      double cachedMaxWidth = 1.0;
      do
      {
        -[PKStrokePath _compressedPointAt:](v2, "_compressedPointAt:", v6, 0, 0);
        LOWORD(v7) = 0;
        double v8 = (double)v7 / 10.0;
        LOWORD(v9) = 0;
        double v10 = (double)v9 / 1000.0;
        if (v10 == 1.0) {
          double v11 = 1.0;
        }
        else {
          double v11 = v10 * 1.5;
        }
        if ((v8 + v14) * v11 > cachedMaxWidth) {
          double cachedMaxWidth = (v8 + v14) * v11;
        }
        ++v6;
      }
      while (v5 != v6);
    }
    else
    {
      double cachedMaxWidth = 1.0;
    }
    double v12 = v2;
    os_unfair_lock_lock((os_unfair_lock_t)&maxStrokeWidth_lock);
    v2->_double cachedMaxWidth = cachedMaxWidth;

    os_unfair_lock_unlock((os_unfair_lock_t)&maxStrokeWidth_lock);
  }
  return cachedMaxWidth;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<PKStrokePath: %p points: %lu>", self, -[PKStrokePath count](self, "count"));
}

- (unint64_t)_immutablePointsCount
{
  return self->_immutablePointsCount;
}

- (unint64_t)_startIndex
{
  return self->_startIndex;
}

- (int64_t)_inputType
{
  return self->_inputType;
}

- (NSUUID)_strokeDataUUID
{
  return self->_strokeDataUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeDataUUID, 0);
  cntrl = self->_unknownFields.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (begin)
  {
    self->_strokeDataPointsPrivate.pointsData.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v5 = self->_strokeDataPointsPrivate.constants.__cntrl_;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (id)deltaTo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKStrokePath *)self _immutablePointsCount];
  if (v5 <= [v4 _immutablePointsCount])
  {
    unint64_t v7 = [PKStrokePath alloc];
    unint64_t v8 = [(PKStrokePath *)self _immutablePointsCount];
    uint64_t v9 = [v4 _pointsCount];
    unint64_t v10 = [(PKStrokePath *)self _immutablePointsCount];
    double v11 = [v4 _strokeDataUUID];
    uint64_t v6 = -[PKStrokePath initWithData:range:UUID:](v7, "initWithData:range:UUID:", v4, v8, v9 - v10, v11);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)deltaContainsNewInfo:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 _immutablePointsCount];
  BOOL v6 = 1;
  if (v5 <= [(PKStrokePath *)self _immutablePointsCount])
  {
    uint64_t v7 = [v4 _immutablePointsCount];
    if (v7 != [(PKStrokePath *)self _immutablePointsCount]
      || (unint64_t v8 = [v4 count], v8 <= -[PKStrokePath count](self, "count")))
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (BOOL)canApplyDelta:(id)a3
{
  id v4 = a3;
  if ([(PKStrokePath *)self deltaContainsNewInfo:v4]
    && ([v4 _startIndex] || -[PKStrokePath _immutablePointsCount](self, "_immutablePointsCount")))
  {
    if ([(PKStrokePath *)self _startIndex])
    {
      BOOL v5 = 0;
    }
    else
    {
      unint64_t v6 = [(PKStrokePath *)self _immutablePointsCount];
      BOOL v5 = v6 >= [v4 _startIndex];
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)dataApplying:(id)a3
{
  id v4 = a3;
  if (![(PKStrokePath *)self canApplyDelta:v4]
    || ![(PKStrokePath *)self deltaContainsNewInfo:v4])
  {
    double v11 = self;
LABEL_7:
    uint64_t v9 = (uint64_t)v11;
    goto LABEL_8;
  }
  if (![v4 _startIndex])
  {
    double v11 = v4;
    goto LABEL_7;
  }
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  if (*((void *)ptr + 4) == *(void *)(v4[1] + 32))
  {
    unint64_t v6 = [PKStrokePath alloc];
    uint64_t v7 = [v4 _startIndex];
    unint64_t v8 = [v4 _strokeDataUUID];
    uint64_t v9 = -[PKStrokePath initWithData:range:UUID:](v6, "initWithData:range:UUID:", self, 0, v7, v8);
  }
  else
  {
    double v13 = [PKStrokePath alloc];
    float v14 = [v4 _strokeDataUUID];
    NSUInteger v15 = -[PKStrokePath initWithData:range:UUID:](v13, "initWithData:range:UUID:", v4, 0, 0, v14);

    uint64_t v66 = *((void *)ptr + 6);
    uint64_t v67 = *((void *)v15->_strokeDataPointsPrivate.constants.__ptr_ + 6);
    uint64_t v16 = [v4 _startIndex];
    begin = v15->_strokeDataPointsPrivate.pointsData.__begin_;
    unint64_t v17 = v15->_strokeDataPointsPrivate.pointsData.__end_ - begin;
    if (v16 * v67 <= v17)
    {
      if (v16 * v67 < v17) {
        v15->_strokeDataPointsPrivate.pointsData.__end_ = &begin[v16 * v67];
      }
    }
    else
    {
      std::vector<unsigned char>::__append((unint64_t *)&v15->_strokeDataPointsPrivate.pointsData, v16 * v67 - v17);
      begin = v15->_strokeDataPointsPrivate.pointsData.__begin_;
    }
    unint64_t v18 = 0;
    unint64_t v19 = 0;
    v64 = v15;
    uint64_t v20 = *((void *)v15->_strokeDataPointsPrivate.constants.__ptr_ + 4);
    uint64_t v21 = *((void *)ptr + 4);
    uint64_t v69 = *((void *)ptr + 1);
    v70 = self->_strokeDataPointsPrivate.pointsData.__begin_;
    do
    {
      if ((v20 & (1 << v18)) != 0) {
        unint64_t v19 = v18;
      }
      ++v18;
    }
    while (v18 != 10);
    uint64_t v22 = [v4 _startIndex];
    if (v22 >= 1)
    {
      v63 = v4;
      uint64_t v23 = 0;
      uint64_t v65 = v22;
      do
      {
        unint64_t v24 = 0;
        uint64_t v25 = 0;
        uint64_t v26 = v23 * v66;
        uint64_t v68 = v23;
        uint64_t v27 = v23 * v67;
        do
        {
          uint64_t v28 = 1 << v24;
          uint64_t v29 = v21 & v28;
          if ((v20 & v28) != 0)
          {
            double v30 = &begin[v27];
            if (v29)
            {
              memcpy(v30, &v70[v26], v31);
              v26 += v32;
            }
            else
            {
              memcpy(v30, (const void *)(v69 + v25), v31);
            }
            v27 += v32;
          }
          if (!v29) {
          ++v24;
          }
        }
        while (v24 <= v19);
        uint64_t v23 = v68 + 1;
      }
      while (v68 + 1 != v65);
      id v4 = v63;
    }
    uint64_t v9 = (uint64_t)v64;
  }
  double v34 = (char *)v4[3];
  double v33 = (unsigned char *)v4[4];
  uint64_t v35 = v33 - v34;
  if (v33 - v34 >= 1)
  {
    uint64_t v36 = *(void *)(v9 + 24);
    v37 = *(char **)(v9 + 32);
    v38 = (void **)(v9 + 24);
    uint64_t v39 = *(void *)(v9 + 40);
    if (v39 - (uint64_t)v37 >= v35)
    {
      if (v35 <= 0)
      {
        v46 = *(unsigned char **)(v9 + 32);
        v47 = &v37[v35];
        v48 = &v46[-v35];
        v49 = v46;
        if (&v46[-v35] < v37)
        {
          uint64_t v50 = v33 - v34 - (v35 & ~(v35 >> 63));
          v49 = *(unsigned char **)(v9 + 32);
          do
          {
            char v51 = *v48++;
            *v49++ = v51;
            --v50;
          }
          while (v50);
        }
        *(void *)(v9 + 32) = v49;
        if (v46 != v47) {
          memmove(&v37[v35], v37, v46 - v47);
        }
        size_t v10 = v33 - v34;
        if (v33 != v34) {
          memmove(v37, v34, v10);
        }
      }
      else
      {
        if (v33 != v34) {
          memmove(*(void **)(v9 + 32), v34, v33 - v34);
        }
        *(void *)(v9 + 32) = &v37[v33 - v34];
      }
    }
    else
    {
      v40 = &v37[-v36];
      uint64_t v41 = (uint64_t)&v37[v35 - v36];
      if (v41 < 0) {
        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v42 = v39 - v36;
      uint64_t v43 = 2 * v42;
      if (2 * v42 <= v41) {
        uint64_t v43 = v41;
      }
      if (v42 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v44 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v44 = v43;
      }
      if (v44) {
        v45 = operator new(v44);
      }
      else {
        v45 = 0;
      }
      v52 = &v40[(void)v45];
      v53 = &v52[v35];
      v54 = v52;
      do
      {
        char v55 = *v34++;
        *v54++ = v55;
        --v35;
      }
      while (v35);
      v56 = (char *)*v38;
      if (*v38 == v37)
      {
        v59 = v37;
      }
      else
      {
        v57 = v37;
        do
        {
          char v58 = *--v57;
          *--v52 = v58;
        }
        while (v57 != v56);
        v59 = *(char **)(v9 + 32);
      }
      v60 = (char *)v45 + v44;
      uint64_t v61 = v59 - v37;
      if (v59 != v37) {
        memmove(v53, v37, v59 - v37);
      }
      v62 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = v52;
      *(void *)(v9 + 32) = &v53[v61];
      *(void *)(v9 + 40) = v60;
      if (v62) {
        operator delete(v62);
      }
    }
  }
  *(void *)(v9 + 80) = objc_msgSend(v4, "_immutablePointsCount", v10);
LABEL_8:

  return (id)v9;
}

- (BOOL)saveToDataArchive:(void *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  unint64_t v6 = [(PKStrokePath *)self _pointsCount];
  uint64_t v7 = *((void *)ptr + 4);
  char v8 = *((unsigned char *)a3 + 84);
  *((void *)a3 + 4) = v6;
  *((unsigned char *)a3 + 84) = v8 | 0xC;
  *((void *)a3 + 6) = v7;
  uint64_t v9 = *(void *)ptr;
  *((unsigned char *)a3 + 84) = v8 | 0x2C;
  *((void *)a3 + 9) = v9;
  if (v6)
  {
    unint64_t v10 = v6;
    uint64_t v11 = *((void *)ptr + 5);
    if (v11)
    {
      double v12 = (PB::Data *)*((void *)a3 + 3);
      *((unsigned char *)a3 + 84) = v8 | 0x2E;
      *((void *)a3 + 2) = v11;
      if (!v12) {
        operator new();
      }
      PB::Data::assign(v12, *((const unsigned __int8 **)ptr + 1), *((const unsigned __int8 **)ptr + 2));
    }
    if (v7)
    {
      double v13 = (PB::Data *)*((void *)a3 + 5);
      if (!v13) {
        operator new();
      }
      PB::Data::assign(v13, (const unsigned __int8 *)self->_strokeDataPointsPrivate.pointsData.__begin_, (const unsigned __int8 *)self->_strokeDataPointsPrivate.pointsData.__end_);
    }
    *(void *)unint64_t v24 = 0;
    uint64_t v25 = 0;
    float v14 = [(PKStrokePath *)self _strokeDataUUID];
    [v14 getUUIDBytes:v24];

    NSUInteger v15 = (PB::Data *)*((void *)a3 + 8);
    if (!v15) {
      operator new();
    }
    PB::Data::assign(v15, v24, (const unsigned __int8 *)&v26);
    if (![(PKStrokePath *)self _inputType])
    {
      *((unsigned char *)a3 + 84) |= 0x40u;
      *((unsigned char *)a3 + 80) = 1;
    }
    unint64_t v16 = [(PKStrokePath *)self _immutablePointsCount];
    if (v16 != [(PKStrokePath *)self _startIndex] + v10)
    {
      unint64_t v17 = [(PKStrokePath *)self _immutablePointsCount];
      *((unsigned char *)a3 + 84) |= 1u;
      *((void *)a3 + 1) = v17;
    }
    if ([(PKStrokePath *)self _startIndex])
    {
      unint64_t v18 = [(PKStrokePath *)self _startIndex];
      *((unsigned char *)a3 + 84) |= 0x10u;
      *((void *)a3 + 7) = v18;
    }
    uint64_t v20 = self->_unknownFields.__ptr_;
    cntrl = self->_unknownFields.__cntrl_;
    if (cntrl) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
    }
    uint64_t v21 = (std::__shared_weak_count *)*((void *)a3 + 12);
    *((void *)a3 + 11) = v20;
    *((void *)a3 + 12) = cntrl;
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
  }
  return 1;
}

- (PKStrokePath)initWithRawValue:(id)a3
{
  v10[0] = &unk_1F1FB0708;
  v10[3] = 0;
  v10[5] = 0;
  v10[8] = 0;
  memset((char *)&v10[10] + 4, 0, 20);
  id v4 = a3;
  BOOL v5 = (const unsigned __int8 *)[v4 bytes];
  [v4 length];
  PB::Reader::Reader((PB::Reader *)v9, v5);
  if (drawing::StrokeData::readFrom((drawing::StrokeData *)v10, (PB::Reader *)v9))
  {
    unint64_t v6 = [(PKStrokePath *)self init];
    [(PKStrokePath *)v6 readStrokeDataFromArchive:v10];
    self = v6;
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }
  drawing::StrokeData::~StrokeData((drawing::StrokeData *)v10);

  return v7;
}

- (id)rawValue
{
  v6[0] = &unk_1F1FB0708;
  v6[3] = 0;
  v6[5] = 0;
  v6[8] = 0;
  memset((char *)&v6[10] + 4, 0, 20);
  [(PKStrokePath *)self saveToDataArchive:v6];
  PB::Writer::Writer((PB::Writer *)&v4);
  drawing::StrokeData::writeTo((drawing::StrokeData *)v6, (PB::Writer *)&v4);
  unint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v5 length:v4 - v5];
  PB::Writer::~Writer((PB::Writer *)&v4);
  drawing::StrokeData::~StrokeData((drawing::StrokeData *)v6);

  return v2;
}

+ (id)strokeDataFromDataArchive:(const void *)a3
{
  uint64_t v4 = objc_alloc_init(PKStrokePath);
  [(PKStrokePath *)v4 readStrokeDataFromArchive:a3];

  return v4;
}

- (void)readStrokeDataFromArchive:(const void *)a3
{
}

@end