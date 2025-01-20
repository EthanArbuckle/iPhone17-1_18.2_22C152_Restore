@interface _GEOCoordinatePath
+ (BOOL)supportsSecureCoding;
- (_GEOCoordinatePath)initWithCoder:(id)a3;
- (double)coordinateAt:(void *)a1;
- (id).cxx_construct;
- (uint64_t)calibratePointLengths:(unint64_t)a3 startIndex:(unint64_t)a4 endIndex:(double)a5 rangeLength:;
- (void)encodeWithCoder:(id)a3;
- (void)setBasicCoordinates:(void *)a1;
@end

@implementation _GEOCoordinatePath

- (uint64_t)calibratePointLengths:(unint64_t)a3 startIndex:(unint64_t)a4 endIndex:(double)a5 rangeLength:
{
  if (result)
  {
    double v5 = *(double *)(a2 + 8 * a4) - *(double *)(a2 + 8 * a3);
    double v6 = 0.0;
    BOOL v7 = v5 <= 0.0 || a5 <= 0.0;
    double v8 = a5 / v5;
    if (v7) {
      double v8 = 1.0;
    }
    if (a3 <= a4)
    {
      v9 = (double *)(a2 + 8 * a3);
      unint64_t v10 = a3;
      do
      {
        double v11 = v6;
        if (v10 < a4) {
          double v6 = v9[1] - *v9;
        }
        if (v10 > a3)
        {
          double v12 = v8 * v11 + *(v9 - 1);
          double *v9 = v12;
          if (a4 == v10)
          {
            double v13 = *(double *)(a2 + 8 * a3) + a5;
            if (vabdd_f64(v12, v13) < 0.000001) {
              double *v9 = v13;
            }
          }
        }
        ++v10;
        ++v9;
      }
      while (v10 <= a4);
    }
  }
  return result;
}

- (void)setBasicCoordinates:(void *)a1
{
  if (a1)
  {
    if (a1[4] == a1[5])
    {
      v4 = (char *)(a1 + 1);
      if (a1 + 1 != (void *)a2) {
        std::vector<GEOLocationCoordinate3D>::__assign_with_size[abi:ne180100]<GEOLocationCoordinate3D*,GEOLocationCoordinate3D*>(v4, *(char **)a2, *(void *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3));
      }
      a1[7] = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v5 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: _zilchPoints.empty()", v5, 2u);
    }
  }
}

- (double)coordinateAt:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  if (v2 == v3)
  {
    uint64_t v12 = a1[1];
    if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v12) >> 3) > a2) {
      return *(double *)(v12 + 24 * a2);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __int16 v17 = 0;
      v14 = MEMORY[0x1E4F14500];
      v15 = "Assertion failed: index < _basicCoordinates.size()";
      v16 = (uint8_t *)&v17;
      goto LABEL_15;
    }
    return -180.0;
  }
  if (a2 >= (v3 - v2) >> 5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      __int16 v20 = 0;
      v14 = MEMORY[0x1E4F14500];
      v15 = "Assertion failed: index < _zilchPoints.size()";
      v16 = (uint8_t *)&v20;
LABEL_15:
      _os_log_fault_impl(&dword_188D96000, v14, OS_LOG_TYPE_FAULT, v15, v16, 2u);
      return -180.0;
    }
    return -180.0;
  }
  v4 = (zilch::ControlPoint *)(v2 + 32 * a2);
  double v5 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v4);
  if (zilch::GeoCoordinates::has_elevation(v5))
  {
    double v6 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v4);
    zilch::GeoCoordinates::z(v6);
  }
  BOOL v7 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v4);
  int v19 = zilch::GeoCoordinates::y(v7);
  double v9 = zilch::Latitude::toDegrees((zilch::Latitude *)&v19, v8);
  unint64_t v10 = (zilch::GeoCoordinates *)zilch::ControlPoint::position(v4);
  int v18 = zilch::GeoCoordinates::x(v10);
  zilch::Longitude::toDegrees((zilch::Longitude *)&v18, v11);
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOCoordinatePath)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_GEOCoordinatePath;
  id v5 = [(_GEOCoordinatePath *)&v20 init];
  if (v5)
  {
    uint64_t v19 = 0;
    id v6 = v4;
    BOOL v7 = (char *)[v6 decodeBytesForKey:@"_basicCoordinates" returnedLength:&v19];
    std::vector<GEOLocationCoordinate3D>::__assign_with_size[abi:ne180100]<GEOLocationCoordinate3D*,GEOLocationCoordinate3D*>((char *)v5 + 8, v7, (uint64_t)&v7[24 * (v19 / 0x18uLL)], v19 / 0x18uLL);
    uint64_t v8 = *((void *)v5 + 1);
    uint64_t v9 = *((void *)v5 + 2);
    if (v8 == v9)
    {
      uint64_t v19 = 0;
      double v11 = (char *)[v6 decodeBytesForKey:@"_zilchPoints" returnedLength:&v19];
      std::vector<zilch::ControlPoint>::__assign_with_size[abi:ne180100]<zilch::ControlPoint*,zilch::ControlPoint*>((char *)v5 + 32, v11, (uint64_t)&v11[v19 & 0xFFFFFFFFFFFFFFE0], v19 >> 5);
      uint64_t v10 = (uint64_t)(*((void *)v5 + 5) - *((void *)v5 + 4)) >> 5;
    }
    else
    {
      uint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v8) >> 3);
    }
    *((void *)v5 + 7) = v10;
    uint64_t v12 = [v6 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_supportPoints"];
    double v13 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v12;

    uint64_t v19 = 0;
    id v14 = v6;
    v15 = (char *)[v14 decodeBytesForKey:@"_pointLengths" returnedLength:&v19];
    std::vector<maps::path_codec::CostFunction::AngleCost>::__assign_with_size[abi:ne180100]<maps::path_codec::CostFunction::AngleCost const*,maps::path_codec::CostFunction::AngleCost const*>((char *)v5 + 72, v15, (uint64_t)&v15[v19 & 0xFFFFFFFFFFFFFFF8], v19 >> 3);
    *((void *)v5 + 12) = [v14 decodeIntegerForKey:@"_pathStartIndex"];
    [v14 decodeDoubleForKey:@"_pathStartOffset"];
    *((void *)v5 + 13) = v16;
    id v17 = v5;
  }

  return (_GEOCoordinatePath *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBytes:self->_basicCoordinates.__begin_ length:self->_basicCoordinates.__end_ - self->_basicCoordinates.__begin_ forKey:@"_basicCoordinates"];
  [v4 encodeBytes:self->_zilchPoints.__begin_ length:(char *)self->_zilchPoints.__end_ - (char *)self->_zilchPoints.__begin_ forKey:@"_zilchPoints"];
  [v4 encodeObject:self->_supportPoints forKey:@"_supportPoints"];
  [v4 encodeBytes:self->_pointLengths.__begin_ length:(char *)self->_pointLengths.__end_ - (char *)self->_pointLengths.__begin_ forKey:@"_pointLengths"];
  [v4 encodeInteger:self->_pathStartIndex forKey:@"_pathStartIndex"];
  [v4 encodeDouble:@"_pathStartOffset" forKey:self->_pathStartOffset];
}

- (void).cxx_destruct
{
  begin = self->_pointLengths.__begin_;
  if (begin)
  {
    self->_pointLengths.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_supportPoints, 0);
  id v4 = self->_zilchPoints.__begin_;
  if (v4)
  {
    self->_zilchPoints.__end_ = v4;
    operator delete(v4);
  }
  id v5 = self->_basicCoordinates.__begin_;
  if (v5)
  {
    self->_basicCoordinates.__end_ = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

@end