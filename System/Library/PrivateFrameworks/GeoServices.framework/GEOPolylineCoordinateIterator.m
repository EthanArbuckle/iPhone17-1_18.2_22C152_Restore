@interface GEOPolylineCoordinateIterator
+ (id)iteratorWithRange:(GEOPolylineCoordinateRange)a3;
- ($212C09783140BCCD23384160D545CE0D)current;
- ($212C09783140BCCD23384160D545CE0D)previous;
- (BOOL)isCurrentValid;
- (GEOPolylineCoordinateIterator)initWithRange:(GEOPolylineCoordinateRange)a3;
- (GEOPolylineCoordinateRange)currentSegmentRange;
- (void)advance;
@end

@implementation GEOPolylineCoordinateIterator

- (GEOPolylineCoordinateIterator)initWithRange:(GEOPolylineCoordinateRange)a3
{
  PolylineCoordinate end = a3.end;
  PolylineCoordinate start = a3.start;
  v9.receiver = self;
  v9.super_class = (Class)GEOPolylineCoordinateIterator;
  result = [(GEOPolylineCoordinateIterator *)&v9 init];
  if (!result) {
    return result;
  }
  unint64_t v6 = 0xBF80000000000000;
  result->_previous = ($604ECB7A8067A7300F159AE8ED6889F8)0xBF80000000000000;
  if (start.offset >= 0.0 && end.offset >= 0.0)
  {
    if (start.index == end.index)
    {
      if (start.offset > end.offset) {
        goto LABEL_10;
      }
LABEL_8:
      if (start.offset >= 0.0) {
        unint64_t v6 = (vcvtms_u32_f32(start.offset) + start.index) | ((unint64_t)COERCE_UNSIGNED_INT(start.offset - floorf(start.offset)) << 32);
      }
      goto LABEL_10;
    }
    if (start.index < end.index) {
      goto LABEL_8;
    }
  }
LABEL_10:
  $604ECB7A8067A7300F159AE8ED6889F8 v7 = ($604ECB7A8067A7300F159AE8ED6889F8)0xBF80000000000000;
  unint64_t v8 = (vcvtms_u32_f32(end.offset) + end.index) | ((unint64_t)COERCE_UNSIGNED_INT(end.offset - floorf(end.offset)) << 32);
  if (end.offset >= 0.0) {
    $604ECB7A8067A7300F159AE8ED6889F8 v7 = ($604ECB7A8067A7300F159AE8ED6889F8)v8;
  }
  result->_current = ($604ECB7A8067A7300F159AE8ED6889F8)v6;
  result->_PolylineCoordinate end = v7;
  return result;
}

+ (id)iteratorWithRange:(GEOPolylineCoordinateRange)a3
{
  v3 = -[GEOPolylineCoordinateIterator initWithRange:]([GEOPolylineCoordinateIterator alloc], "initWithRange:", *(void *)&a3.start, *(void *)&a3.end);

  return v3;
}

- (BOOL)isCurrentValid
{
  return self->_current.offset >= 0.0;
}

- (GEOPolylineCoordinateRange)currentSegmentRange
{
  $604ECB7A8067A7300F159AE8ED6889F8 previous = self->_previous;
  $604ECB7A8067A7300F159AE8ED6889F8 current = self->_current;
  if (previous.offset >= 0.0) {
    unint64_t v4 = (vcvtms_u32_f32(previous.offset) + previous.index) | ((unint64_t)COERCE_UNSIGNED_INT(previous.offset- floorf(previous.offset)) << 32);
  }
  else {
    unint64_t v4 = 0xBF80000000000000;
  }
  if (current.offset >= 0.0) {
    unint64_t v5 = (vcvtms_u32_f32(current.offset) + current.index) | ((unint64_t)COERCE_UNSIGNED_INT(current.offset - floorf(current.offset)) << 32);
  }
  else {
    unint64_t v5 = 0xBF80000000000000;
  }
  result.PolylineCoordinate end = (PolylineCoordinate)v5;
  result.PolylineCoordinate start = (PolylineCoordinate)v4;
  return result;
}

- (void)advance
{
  $604ECB7A8067A7300F159AE8ED6889F8 current = self->_current;
  if (current.offset >= 0.0)
  {
    self->_$604ECB7A8067A7300F159AE8ED6889F8 previous = current;
    unint64_t end = (unint64_t)self->_end;
    if (end == current.index)
    {
      if (*((float *)&end + 1) > current.offset) {
        goto LABEL_15;
      }
    }
    else if (end >= current.index)
    {
      if (current.offset <= 0.0)
      {
        self->_current.uint64_t index = current.index + 1;
        return;
      }
      unsigned int v8 = 0;
      float v5 = modff(current.offset, (float *)&v8);
      if (v5 <= 0.0) {
        uint64_t index = current.index;
      }
      else {
        uint64_t index = current.index + 1;
      }
      if (v5 <= 0.0) {
        uint64_t offset_low = LODWORD(current.offset);
      }
      else {
        uint64_t offset_low = v8;
      }
      unint64_t end = index | (offset_low << 32);
      goto LABEL_15;
    }
    unint64_t end = 0xBF80000000000000;
LABEL_15:
    self->_$604ECB7A8067A7300F159AE8ED6889F8 current = ($604ECB7A8067A7300F159AE8ED6889F8)end;
  }
}

- ($212C09783140BCCD23384160D545CE0D)previous
{
  return ($212C09783140BCCD23384160D545CE0D)self->_previous;
}

- ($212C09783140BCCD23384160D545CE0D)current
{
  return ($212C09783140BCCD23384160D545CE0D)self->_current;
}

@end