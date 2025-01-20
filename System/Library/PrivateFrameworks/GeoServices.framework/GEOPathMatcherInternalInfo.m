@interface GEOPathMatcherInternalInfo
- (GEOPolylineCoordinateRange)range;
- (NSArray)matchedSegments;
- (NSString)base64Path;
- (id).cxx_construct;
@end

@implementation GEOPathMatcherInternalInfo

- (GEOPolylineCoordinateRange)range
{
  PolylineCoordinate end = self->_range.end;
  PolylineCoordinate start = self->_range.start;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- (NSString)base64Path
{
  return self->_base64Path;
}

- (NSArray)matchedSegments
{
  return self->_matchedSegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedSegments, 0);

  objc_storeStrong((id *)&self->_base64Path, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0xBF80000000000000;
  *((void *)self + 4) = 0xBF80000000000000;
  return self;
}

@end