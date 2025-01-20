@interface PKStrokePoint
+ (shared_ptr<PKStrokePathPointsShared>)_sharedConstantData;
- (BOOL)isEqual:(id)a3;
- (CGFloat)altitude;
- (CGFloat)azimuth;
- (CGFloat)force;
- (CGFloat)opacity;
- (CGFloat)secondaryScale;
- (CGPoint)location;
- (CGSize)size;
- (NSTimeInterval)timeOffset;
- (PKCompressedStrokePoint)_compressedPoint;
- (PKStrokePoint)initWithLocation:(CGPoint)a3 timeOffset:(double)a4 size:(CGSize)a5 opacity:(double)a6 force:(double)a7 azimuth:(double)a8 altitude:(double)a9 edgeWidth:(double)a10 radius2:(double)a11;
- (PKStrokePoint)initWithLocation:(CGPoint)location timeOffset:(NSTimeInterval)timeOffset size:(CGSize)size opacity:(CGFloat)opacity force:(CGFloat)force azimuth:(CGFloat)azimuth altitude:(CGFloat)altitude;
- (PKStrokePoint)initWithLocation:(CGPoint)location timeOffset:(NSTimeInterval)timeOffset size:(CGSize)size opacity:(CGFloat)opacity force:(CGFloat)force azimuth:(CGFloat)azimuth altitude:(CGFloat)altitude secondaryScale:(CGFloat)secondaryScale;
- (PKStrokePoint)initWithSlice:(void *)a3 index:(int64_t)a4;
- (double)_edgeWidth;
- (double)_radius2;
- (id).cxx_construct;
- (id)description;
- (unint64_t)hash;
- (void)_strokeDataPointsPrivate;
@end

@implementation PKStrokePoint

- (PKStrokePoint)initWithLocation:(CGPoint)location timeOffset:(NSTimeInterval)timeOffset size:(CGSize)size opacity:(CGFloat)opacity force:(CGFloat)force azimuth:(CGFloat)azimuth altitude:(CGFloat)altitude
{
  return -[PKStrokePoint initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:secondaryScale:](self, "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:secondaryScale:", location.x, location.y, timeOffset, size.width, size.height, opacity, force, azimuth, *(void *)&altitude, 0x3FF0000000000000);
}

- (PKStrokePoint)initWithLocation:(CGPoint)location timeOffset:(NSTimeInterval)timeOffset size:(CGSize)size opacity:(CGFloat)opacity force:(CGFloat)force azimuth:(CGFloat)azimuth altitude:(CGFloat)altitude secondaryScale:(CGFloat)secondaryScale
{
  double height = size.height;
  double width = size.width;
  CGFloat y = location.y;
  CGFloat x = location.x;
  v41.receiver = self;
  v41.super_class = (Class)PKStrokePoint;
  v18 = [(PKStrokePoint *)&v41 init];
  +[PKStrokePoint _sharedConstantData];
  v19 = (std::__shared_weak_count *)*((void *)v18 + 2);
  *(_OWORD *)(v18 + 8) = v40;
  v20 = v18 + 8;
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  uint64_t v21 = *((void *)v18 + 3);
  unint64_t v22 = *((void *)v18 + 4) - v21;
  if (v22 > 0x1F)
  {
    if (v22 != 32) {
      *((void *)v18 + 4) = v21 + 32;
    }
  }
  else
  {
    std::vector<unsigned char>::__append((unint64_t *)v18 + 3, 32 - v22);
  }
  v42.CGFloat x = x;
  v42.CGFloat y = y;
  PKStrokePathPointsPrivate::setLocation((PKStrokePathPointsPrivate *)(v18 + 8), v42, 0);
  uint64_t v23 = *((void *)v18 + 3);
  uint64_t v24 = *((void *)v18 + 4);
  unint64_t v25 = v24 - v23;
  if (v24 != v23)
  {
    v26 = *(unsigned char **)v20;
    if (*(void *)(*(void *)v20 + 48) <= v25)
    {
      if ((v26[32] & 2) != 0)
      {
        float v27 = timeOffset;
        *(float *)(v23 + v26[89]) = v27;
      }
      if ((v26[32] & 4) != 0)
      {
        float v28 = width;
        *(float *)(v23 + v26[90]) = v28;
      }
    }
  }
  double v29 = height / width;
  if (width <= 0.0) {
    double v29 = 1.0;
  }
  PKStrokePathPointsPrivate::setAspectRatio((PKStrokePathPointsPrivate *)(v18 + 8), v29, 0);
  uint64_t v30 = *((void *)v18 + 3);
  uint64_t v31 = *((void *)v18 + 4);
  unint64_t v32 = v31 - v30;
  if (v31 != v30)
  {
    uint64_t v33 = *(void *)v20;
    if (*(void *)(*(void *)v20 + 48) <= v32 && (*(unsigned char *)(v33 + 32) & 0x10) != 0) {
      *(_WORD *)(v30 + *(unsigned __int8 *)(v33 + 92)) = 0;
    }
  }
  PKStrokePathPointsPrivate::setForce((PKStrokePathPointsPrivate *)(v18 + 8), force, 0);
  PKStrokePathPointsPrivate::setAzimuth((PKStrokePathPointsPrivate *)(v18 + 8), azimuth + -3.14159265, 0);
  PKStrokePathPointsPrivate::setAltitude((PKStrokePathPointsPrivate *)(v18 + 8), 1.57079633 - altitude, 0);
  PKStrokePathPointsPrivate::setOpacity((PKStrokePathPointsPrivate *)(v18 + 8), opacity, 0);
  uint64_t v34 = *((void *)v18 + 3);
  uint64_t v35 = *((void *)v18 + 4);
  unint64_t v36 = v35 - v34;
  if (v35 != v34)
  {
    uint64_t v37 = *(void *)v20;
    if (*(void *)(*(void *)v20 + 48) <= v36 && (*(unsigned char *)(v37 + 33) & 2) != 0)
    {
      float v38 = width * secondaryScale;
      *(float *)(v34 + *(unsigned __int8 *)(v37 + 97)) = v38;
    }
  }
  return (PKStrokePoint *)v18;
}

- (PKStrokePoint)initWithLocation:(CGPoint)a3 timeOffset:(double)a4 size:(CGSize)a5 opacity:(double)a6 force:(double)a7 azimuth:(double)a8 altitude:(double)a9 edgeWidth:(double)a10 radius2:(double)a11
{
  v11 = -[PKStrokePoint initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:](self, "initWithLocation:timeOffset:size:opacity:force:azimuth:altitude:", a3.x, a3.y, a4, a5.width, a5.height, a6, a7, a8, *(void *)&a9);
  p_strokeDataPointsPrivate = &v11->_strokeDataPointsPrivate;
  begin = v11->_strokeDataPointsPrivate.pointsData.__begin_;
  end = v11->_strokeDataPointsPrivate.pointsData.__end_;
  unint64_t v15 = end - begin;
  if (end != begin)
  {
    ptr = p_strokeDataPointsPrivate->constants.__ptr_;
    if (*((void *)p_strokeDataPointsPrivate->constants.__ptr_ + 6) <= v15 && (*((unsigned char *)ptr + 33) & 2) != 0)
    {
      float v17 = a11;
      *(float *)&begin[*((unsigned __int8 *)ptr + 97)] = v17;
    }
  }
  PKStrokePathPointsPrivate::setEdgeWidth(p_strokeDataPointsPrivate, a10, 0);
  return v11;
}

- (PKStrokePoint)initWithSlice:(void *)a3 index:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKStrokePoint;
  v6 = [(PKStrokePoint *)&v8 init];
  v9.location = a4;
  v9.length = 1;
  PKStrokePathPointsPrivate::slice((PKStrokePathPointsPrivate *)a3, v9, &v6->_strokeDataPointsPrivate);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKStrokePoint *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_11;
    }
    uint64_t v6 = objc_opt_class();
    if (v6 != objc_opt_class()) {
      goto LABEL_11;
    }
    ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
    objc_super v8 = v5->_strokeDataPointsPrivate.constants.__ptr_;
    if (*(double *)ptr != *(double *)v8) {
      goto LABEL_11;
    }
    if (*((void *)ptr + 4) == *((void *)v8 + 4)
      && *((void *)ptr + 5) == *((void *)v8 + 5)
      && (begin = self->_strokeDataPointsPrivate.pointsData.__begin_,
          v10 = v5->_strokeDataPointsPrivate.pointsData.__begin_,
          v11 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin),
          v11 == (char *)(v5->_strokeDataPointsPrivate.pointsData.__end_ - v10))
      && !memcmp(begin, v10, (size_t)v11)
      && (v12 = (const void *)*((void *)ptr + 1),
          v13 = (const void *)*((void *)v8 + 1),
          size_t v14 = *((void *)ptr + 2) - (void)v12,
          v14 == *((void *)v8 + 2) - (void)v13))
    {
      BOOL v15 = memcmp(v12, v13, v14) == 0;
    }
    else
    {
LABEL_11:
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  uint64_t v5 = PKHashBytes((uint64_t)ptr, 8) ^ v3;
  uint64_t v6 = v5 ^ PKHashBytes((uint64_t)ptr + 32, 8);
  unint64_t v7 = v6 ^ PKHashBytes((uint64_t)ptr + 40, 8);
  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  end = self->_strokeDataPointsPrivate.pointsData.__end_;
  if (end != begin) {
    v7 ^= PKHashBytes((uint64_t)begin, (int)end - (int)begin);
  }
  uint64_t v10 = *((void *)ptr + 1);
  uint64_t v11 = *((void *)ptr + 2);
  if (v11 != v10) {
    v7 ^= PKHashBytes(v10, (int)v11 - (int)v10);
  }
  return v7;
}

+ (shared_ptr<PKStrokePathPointsShared>)_sharedConstantData
{
  uint64_t v3 = v2;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB3C5ED8, memory_order_acquire) & 1) == 0)
  {
    a1 = (id)__cxa_guard_acquire(&qword_1EB3C5ED8);
    if (a1)
    {
      __cxa_atexit((void (*)(void *))std::shared_ptr<PKStrokePathPointsShared>::~shared_ptr[abi:ne180100], &xmmword_1EB3C5EE0, &dword_1C44F8000);
      __cxa_guard_release(&qword_1EB3C5ED8);
    }
  }
  if (_MergedGlobals_124 != -1) {
    dispatch_once(&_MergedGlobals_124, &__block_literal_global_24);
  }
  long long v4 = xmmword_1EB3C5EE0;
  *uint64_t v3 = xmmword_1EB3C5EE0;
  if (*((void *)&v4 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v4 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKStrokePathPointsShared *)a1;
  return result;
}

void __36__PKStrokePoint__sharedConstantData__block_invoke()
{
}

- (PKCompressedStrokePoint)_compressedPoint
{
  return (PKCompressedStrokePoint *)PKStrokePathPointsPrivate::operator[](&self->_strokeDataPointsPrivate.constants.__ptr_, 0, retstr);
}

- (void)_strokeDataPointsPrivate
{
  return &self->_strokeDataPointsPrivate;
}

- (CGPoint)location
{
  double v2 = PKStrokePathPointsPrivate::locationAtIndex(&self->_strokeDataPointsPrivate, 0);
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (NSTimeInterval)timeOffset
{
  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  long long v4 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
  if (v4 && *((void *)ptr + 6) <= (unint64_t)v4 && (*((unsigned char *)ptr + 32) & 2) != 0) {
    uint64_t v5 = (float *)&begin[*((unsigned __int8 *)ptr + 89)];
  }
  else {
    uint64_t v5 = (float *)((char *)ptr + 64);
  }
  return *v5;
}

- (CGSize)size
{
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  p_strokeDataPointsPrivate = &self->_strokeDataPointsPrivate;
  long long v4 = ptr;
  begin = p_strokeDataPointsPrivate->pointsData.__begin_;
  unint64_t v7 = (char *)(p_strokeDataPointsPrivate->pointsData.__end_ - begin);
  if (v7 && *((void *)v4 + 6) <= (unint64_t)v7 && (*((unsigned char *)v4 + 32) & 4) != 0) {
    objc_super v8 = &begin[*((unsigned __int8 *)v4 + 90)];
  }
  else {
    objc_super v8 = (char *)v4 + 68;
  }
  LODWORD(v2) = *(_DWORD *)v8;
  double v9 = *(float *)v8;
  double v10 = PKStrokePathPointsPrivate::aspectRatioAtIndex(p_strokeDataPointsPrivate, 0, v2) * v9;
  double v11 = v9;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (CGFloat)force
{
  return PKStrokePathPointsPrivate::forceAtIndex(&self->_strokeDataPointsPrivate, 0, v2);
}

- (CGFloat)azimuth
{
  return PKStrokePathPointsPrivate::azimuthAtIndex(&self->_strokeDataPointsPrivate, 0, v2) + -3.14159265;
}

- (CGFloat)altitude
{
  return 1.57079633 - PKStrokePathPointsPrivate::altitudeAtIndex(&self->_strokeDataPointsPrivate, 0, v2);
}

- (CGFloat)opacity
{
  return PKStrokePathPointsPrivate::opacityAtIndex(&self->_strokeDataPointsPrivate, 0, v2);
}

- (double)_edgeWidth
{
  return PKStrokePathPointsPrivate::edgeWidthAtIndex(&self->_strokeDataPointsPrivate, 0, v2);
}

- (double)_radius2
{
  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  long long v4 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
  if (v4 && *((void *)ptr + 6) <= (unint64_t)v4 && (*((unsigned char *)ptr + 33) & 2) != 0) {
    uint64_t v5 = (float *)&begin[*((unsigned __int8 *)ptr + 97)];
  }
  else {
    uint64_t v5 = (float *)((char *)ptr + 84);
  }
  return *v5;
}

- (CGFloat)secondaryScale
{
  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  ptr = self->_strokeDataPointsPrivate.constants.__ptr_;
  long long v4 = (char *)(self->_strokeDataPointsPrivate.pointsData.__end_ - begin);
  if (v4 && *((void *)ptr + 6) <= (unint64_t)v4)
  {
    if ((*((unsigned char *)ptr + 33) & 2) != 0) {
      objc_super v8 = (float *)&begin[*((unsigned __int8 *)ptr + 97)];
    }
    else {
      objc_super v8 = (float *)((char *)ptr + 84);
    }
    double v5 = *v8;
    if ((*((unsigned char *)ptr + 32) & 4) != 0)
    {
      uint64_t v6 = (float *)&begin[*((unsigned __int8 *)ptr + 90)];
      return v5 / *v6;
    }
  }
  else
  {
    double v5 = *((float *)ptr + 21);
  }
  uint64_t v6 = (float *)((char *)ptr + 68);
  return v5 / *v6;
}

- (id)description
{
  double v3 = NSString;
  long long v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(PKStrokePoint *)self location];
  uint64_t v6 = NSStringFromCGPoint(v20);
  [(PKStrokePoint *)self timeOffset];
  uint64_t v8 = v7;
  [(PKStrokePoint *)self size];
  double v9 = NSStringFromCGSize(v21);
  [(PKStrokePoint *)self opacity];
  uint64_t v11 = v10;
  [(PKStrokePoint *)self azimuth];
  uint64_t v13 = v12;
  [(PKStrokePoint *)self force];
  uint64_t v15 = v14;
  [(PKStrokePoint *)self altitude];
  float v17 = [v3 stringWithFormat:@"<%@: %p location=%@ timeOffset=%f size=%@ opacity=%f azimuth=%f force=%f altitude=%f>", v5, self, v6, v8, v9, v11, v13, v15, v16];

  return v17;
}

- (void).cxx_destruct
{
  begin = self->_strokeDataPointsPrivate.pointsData.__begin_;
  if (begin)
  {
    self->_strokeDataPointsPrivate.pointsData.__end_ = begin;
    operator delete(begin);
  }
  cntrl = self->_strokeDataPointsPrivate.constants.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end