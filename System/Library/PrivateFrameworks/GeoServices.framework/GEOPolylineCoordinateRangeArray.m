@interface GEOPolylineCoordinateRangeArray
+ (BOOL)supportsSecureCoding;
- (GEOPolylineCoordinateRange)coordinateRangeAtIndex:(unint64_t)a3;
- (GEOPolylineCoordinateRangeArray)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)description;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addCoordinateRange:(GEOPolylineCoordinateRange)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOPolylineCoordinateRangeArray

- (unint64_t)count
{
  return self->_polylineCoordinateRanges.__end_ - self->_polylineCoordinateRanges.__begin_;
}

- (void)addCoordinateRange:(GEOPolylineCoordinateRange)a3
{
  PolylineCoordinate end = a3.end;
  PolylineCoordinate start = a3.start;
  value = self->_polylineCoordinateRanges.__end_cap_.__value_;
  p_end_cap = &self->_polylineCoordinateRanges.__end_cap_;
  v7 = value;
  v9 = p_end_cap[-1].__value_;
  if (v9 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v12 = p_end_cap[-2].__value_;
    uint64_t v13 = v9 - v12;
    unint64_t v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60) {
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (char *)v7 - (char *)v12;
    if (v15 >> 3 > v14) {
      unint64_t v14 = v15 >> 3;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16) {
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)p_end_cap, v16);
    }
    else {
      v17 = 0;
    }
    v18 = (GEOPolylineCoordinateRange *)&v17[16 * v13];
    v19 = (GEOPolylineCoordinateRange *)&v17[16 * v16];
    v18->PolylineCoordinate start = start;
    v18->PolylineCoordinate end = end;
    v10 = v18 + 1;
    begin = self->_polylineCoordinateRanges.__begin_;
    v20 = self->_polylineCoordinateRanges.__end_;
    if (v20 != begin)
    {
      do
      {
        v18[-1] = v20[-1];
        --v18;
        --v20;
      }
      while (v20 != begin);
      v20 = *p_value;
    }
    self->_polylineCoordinateRanges.__begin_ = v18;
    self->_polylineCoordinateRanges.__end_ = v10;
    self->_polylineCoordinateRanges.__end_cap_.__value_ = v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    GEOPolylineCoordinateRange *v9 = a3;
    v10 = v9 + 1;
  }
  self->_polylineCoordinateRanges.__end_ = v10;
  ++self->_mutationsCount;
}

- (GEOPolylineCoordinateRange)coordinateRangeAtIndex:(unint64_t)a3
{
  begin = self->_polylineCoordinateRanges.__begin_;
  if (a3 >= self->_polylineCoordinateRanges.__end_ - begin)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: index < _polylineCoordinateRanges.size()", v7, 2u);
    }
    v4 = &GEOPolylineCoordinateRangeInvalid;
  }
  else
  {
    v4 = (long long *)&begin[a3];
  }
  PolylineCoordinate v5 = *(PolylineCoordinate *)v4;
  PolylineCoordinate v6 = (PolylineCoordinate)*((void *)v4 + 1);
  result.PolylineCoordinate end = v6;
  result.PolylineCoordinate start = v5;
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  unint64_t v6 = self->_polylineCoordinateRanges.__end_ - self->_polylineCoordinateRanges.__begin_ - a3->var0;
  if (v6 >= a5) {
    unint64_t v6 = a5;
  }
  if (v6)
  {
    unint64_t v7 = var0;
    v8 = a4;
    unint64_t v9 = v6;
    do
    {
      *v8++ = &self->_polylineCoordinateRanges.__begin_[v7++];
      --v9;
    }
    while (v9);
  }
  a3->unint64_t var0 = v6 + var0;
  a3->var1 = a4;
  a3->var2 = &self->_mutationsCount;
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOPolylineCoordinateRangeArray)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEOPolylineCoordinateRangeArray;
  PolylineCoordinate v5 = [(GEOPolylineCoordinateRangeArray *)&v23 init];
  if (v5)
  {
    uint64_t v22 = 0;
    unint64_t v6 = (char *)[v4 decodeBytesForKey:@"_polylineCoordinateRanges" returnedLength:&v22];
    begin = v5->_polylineCoordinateRanges.__begin_;
    unint64_t v8 = v22;
    unint64_t v9 = v22 >> 4;
    uint64_t value = (uint64_t)v5->_polylineCoordinateRanges.__end_cap_.__value_;
    if (v22 >> 4 <= (unint64_t)((value - (uint64_t)begin) >> 4))
    {
      p_PolylineCoordinate end = (void **)&v5->_polylineCoordinateRanges.__end_;
      PolylineCoordinate end = v5->_polylineCoordinateRanges.__end_;
      unint64_t v16 = end - begin;
      if (v16 < v9)
      {
        unint64_t v17 = (unint64_t)v22 >> 4;
        if (end != begin)
        {
          memmove(v5->_polylineCoordinateRanges.__begin_, v6, (char *)end - (char *)begin);
          begin = (GEOPolylineCoordinateRange *)*p_end;
        }
        size_t v18 = 16 * v17 - 16 * v16;
        if (v16 == v17) {
          goto LABEL_21;
        }
        v19 = begin;
        v20 = &v6[16 * v16];
        goto LABEL_20;
      }
    }
    else
    {
      if (begin)
      {
        v5->_polylineCoordinateRanges.__end_ = begin;
        operator delete(begin);
        uint64_t value = 0;
        v5->_polylineCoordinateRanges.__begin_ = 0;
        v5->_polylineCoordinateRanges.__end_ = 0;
        v5->_polylineCoordinateRanges.__end_cap_.__value_ = 0;
      }
      if ((v8 & 0x8000000000000000) != 0) {
        goto LABEL_23;
      }
      uint64_t v11 = value >> 3;
      if (value >> 3 <= v9) {
        uint64_t v11 = v9;
      }
      unint64_t v12 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v11;
      if (v12 >> 60) {
LABEL_23:
      }
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      begin = (GEOPolylineCoordinateRange *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<zilch::TrafficDynamicTile::Incident>>>((uint64_t)&v5->_polylineCoordinateRanges.__end_cap_, v12);
      v5->_polylineCoordinateRanges.__end_ = begin;
      p_PolylineCoordinate end = (void **)&v5->_polylineCoordinateRanges.__end_;
      v5->_polylineCoordinateRanges.__begin_ = begin;
      v5->_polylineCoordinateRanges.__end_cap_.__value_ = &begin[v14];
    }
    size_t v18 = v8 & 0xFFFFFFFFFFFFFFF0;
    if (v8 < 0x10)
    {
LABEL_21:
      *p_PolylineCoordinate end = (char *)begin + v18;
      goto LABEL_22;
    }
    v19 = begin;
    v20 = v6;
LABEL_20:
    memmove(v19, v20, v18);
    goto LABEL_21;
  }
LABEL_22:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOPolylineCoordinateRangeArray count](self, "count"));
  for (unint64_t i = 0; i < [(GEOPolylineCoordinateRangeArray *)self count]; ++i)
  {
    uint64_t v5 = [(GEOPolylineCoordinateRangeArray *)self coordinateRangeAtIndex:i];
    unint64_t v6 = NSString;
    unint64_t v9 = GEOPolylineCoordinateRangeAsString(v5, v7, v8);
    v10 = [v6 stringWithFormat:@"[%d]: %@", i, v9];
    [v3 addObject:v10];
  }
  uint64_t v11 = [v3 componentsJoinedByString:@"\n"];

  return v11;
}

- (void).cxx_destruct
{
  begin = self->_polylineCoordinateRanges.__begin_;
  if (begin)
  {
    self->_polylineCoordinateRanges.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end