@interface GEOPolylineCoordinateArray
+ (BOOL)supportsSecureCoding;
- (GEOPolylineCoordinateArray)initWithCoder:(id)a3;
- (PolylineCoordinate)coordinateAtIndex:(unint64_t)a3;
- (id).cxx_construct;
- (id)description;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)addCoordinate:(PolylineCoordinate)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOPolylineCoordinateArray

- (unint64_t)count
{
  return self->_polylineCoordinates.__end_ - self->_polylineCoordinates.__begin_;
}

- (void)addCoordinate:(PolylineCoordinate)a3
{
  value = self->_polylineCoordinates.__end_cap_.__value_;
  unint64_t mutationsCount = self->_mutationsCount;
  p_end_cap = &self->_polylineCoordinates.__end_cap_;
  p_end_cap[1].__value_ = (PolylineCoordinate *)(mutationsCount + 1);
  v8 = p_end_cap[-1].__value_;
  if (v8 >= value)
  {
    p_value = &p_end_cap[-2].__value_;
    v11 = p_end_cap[-2].__value_;
    uint64_t v12 = v8 - v11;
    if ((unint64_t)(v12 + 1) >> 61) {
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = (char *)value - (char *)v11;
    uint64_t v14 = v13 >> 2;
    if (v13 >> 2 <= (unint64_t)(v12 + 1)) {
      uint64_t v14 = v12 + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    if (v15) {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)p_end_cap, v15);
    }
    else {
      v16 = 0;
    }
    v17 = (PolylineCoordinate *)&v16[8 * v12];
    v18 = (PolylineCoordinate *)&v16[8 * v15];
    PolylineCoordinate *v17 = a3;
    v9 = v17 + 1;
    begin = self->_polylineCoordinates.__begin_;
    end = self->_polylineCoordinates.__end_;
    if (end != begin)
    {
      do
      {
        PolylineCoordinate v21 = end[-1];
        --end;
        v17[-1] = v21;
        --v17;
      }
      while (end != begin);
      end = *p_value;
    }
    self->_polylineCoordinates.__begin_ = v17;
    self->_polylineCoordinates.__end_ = v9;
    self->_polylineCoordinates.__end_cap_.__value_ = v18;
    if (end) {
      operator delete(end);
    }
  }
  else
  {
    PolylineCoordinate *v8 = a3;
    v9 = v8 + 1;
  }
  self->_polylineCoordinates.__end_ = v9;
}

- (PolylineCoordinate)coordinateAtIndex:(unint64_t)a3
{
  begin = self->_polylineCoordinates.__begin_;
  if (a3 >= self->_polylineCoordinates.__end_ - begin)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: index < _polylineCoordinates.size()", v6, 2u);
    }
    v4 = (PolylineCoordinate *)&GEOPolylineCoordinateInvalid;
  }
  else
  {
    v4 = &begin[a3];
  }
  return *v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  unint64_t v6 = self->_polylineCoordinates.__end_ - self->_polylineCoordinates.__begin_ - a3->var0;
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
      *v8++ = &self->_polylineCoordinates.__begin_[v7++];
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

- (GEOPolylineCoordinateArray)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GEOPolylineCoordinateArray;
  v5 = [(GEOPolylineCoordinateArray *)&v23 init];
  if (v5)
  {
    uint64_t v22 = 0;
    unint64_t v6 = (char *)[v4 decodeBytesForKey:@"_polylineCoordinates" returnedLength:&v22];
    begin = v5->_polylineCoordinates.__begin_;
    unint64_t v8 = v22;
    unint64_t v9 = v22 >> 3;
    uint64_t value = (uint64_t)v5->_polylineCoordinates.__end_cap_.__value_;
    if (v22 >> 3 <= (unint64_t)((value - (uint64_t)begin) >> 3))
    {
      p_end = (void **)&v5->_polylineCoordinates.__end_;
      end = v5->_polylineCoordinates.__end_;
      unint64_t v16 = end - begin;
      if (v16 < v9)
      {
        unint64_t v17 = (unint64_t)v22 >> 3;
        if (end != begin)
        {
          memmove(v5->_polylineCoordinates.__begin_, v6, (char *)end - (char *)begin);
          begin = (PolylineCoordinate *)*p_end;
        }
        size_t v18 = 8 * v17 - 8 * v16;
        if (v16 == v17) {
          goto LABEL_21;
        }
        v19 = begin;
        v20 = &v6[8 * v16];
        goto LABEL_20;
      }
    }
    else
    {
      if (begin)
      {
        v5->_polylineCoordinates.__end_ = begin;
        operator delete(begin);
        uint64_t value = 0;
        v5->_polylineCoordinates.__begin_ = 0;
        v5->_polylineCoordinates.__end_ = 0;
        v5->_polylineCoordinates.__end_cap_.__value_ = 0;
      }
      if ((v8 & 0x8000000000000000) != 0) {
        goto LABEL_23;
      }
      uint64_t v11 = value >> 2;
      if (value >> 2 <= v9) {
        uint64_t v11 = v9;
      }
      unint64_t v12 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v11;
      if (v12 >> 61) {
LABEL_23:
      }
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      begin = (PolylineCoordinate *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&v5->_polylineCoordinates.__end_cap_, v12);
      v5->_polylineCoordinates.__end_ = begin;
      p_end = (void **)&v5->_polylineCoordinates.__end_;
      v5->_polylineCoordinates.__begin_ = begin;
      v5->_polylineCoordinates.__end_cap_.__value_ = &begin[v14];
    }
    size_t v18 = v8 & 0xFFFFFFFFFFFFFFF8;
    if (v8 < 8)
    {
LABEL_21:
      *p_end = (char *)begin + v18;
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
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOPolylineCoordinateArray count](self, "count"));
  for (unint64_t i = 0; i < [(GEOPolylineCoordinateArray *)self count]; ++i)
  {
    PolylineCoordinate v5 = [(GEOPolylineCoordinateArray *)self coordinateAtIndex:i];
    unint64_t v6 = NSString;
    unint64_t v8 = GEOPolylineCoordinateAsString(*(void *)&v5, 1, 0, v7);
    unint64_t v9 = [v6 stringWithFormat:@"[%d]: %@", i, v8];
    [v3 addObject:v9];
  }
  v10 = [v3 componentsJoinedByString:@"\n"];

  return v10;
}

- (void).cxx_destruct
{
  begin = self->_polylineCoordinates.__begin_;
  if (begin)
  {
    self->_polylineCoordinates.__end_ = begin;
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