@interface GEOMapFeaturePath
- ($1AB5FA073B851C12C2339EC22442E995)coordinateAt:(unint64_t)a3;
- (NSArray)segments;
- (double)length;
- (id).cxx_construct;
- (id)description;
- (unint64_t)coordinateCount;
@end

@implementation GEOMapFeaturePath

- (unint64_t)coordinateCount
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - self->_coordinates.__begin_) >> 3);
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateAt:(unint64_t)a3
{
  begin = self->_coordinates.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - begin) >> 3) <= a3)
  {
    double v7 = 1.79769313e308;
    double v5 = -180.0;
    double v6 = -180.0;
  }
  else
  {
    v4 = (double *)((char *)begin + 24 * a3);
    double v5 = *v4;
    double v6 = v4[1];
    double v7 = v4[2];
  }
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - self->_coordinates.__begin_) >> 3)];
  v4 = [NSString stringWithFormat:@"GEOMapFeaturePath - %0.1f meters, %d coordinates, %d segments:", *(void *)&self->_length, 0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - self->_coordinates.__begin_) >> 3), -[NSArray count](self->_segments, "count")];
  [v3 addObject:v4];

  begin = self->_coordinates.__begin_;
  for (i = self->_coordinates.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24))
  {
    double v7 = [NSString stringWithFormat:@"%f, %f", *(void *)begin, *((void *)begin + 1)];
    [v3 addObject:v7];
  }
  v8 = [v3 componentsJoinedByString:@"\n"];

  return v8;
}

- (double)length
{
  return self->_length;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  begin = self->_coordinates.__begin_;
  if (begin)
  {
    self->_coordinates.__end_ = begin;
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