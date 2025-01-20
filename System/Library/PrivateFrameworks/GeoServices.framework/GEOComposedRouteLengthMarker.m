@interface GEOComposedRouteLengthMarker
- (double)length;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)pathIndex;
- (unint64_t)pointIndex;
- (void)setLength:(double)a3;
- (void)setPathIndex:(unint64_t)a3;
- (void)setPointIndex:(unint64_t)a3;
@end

@implementation GEOComposedRouteLengthMarker

- (int64_t)compare:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [NSNumber numberWithUnsignedInteger:self->_pathIndex];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "pathIndex"));
  int64_t v7 = [v5 compare:v6];

  if (!v7)
  {
    v8 = [NSNumber numberWithUnsignedInteger:self->_pointIndex];
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "pointIndex"));
    int64_t v7 = [v8 compare:v9];

    if (!v7)
    {
      v10 = GEOGetGEOComposedRouteLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412546;
        v16 = self;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "Multiple length markers for same position on route:\n%@\n%@", (uint8_t *)&v15, 0x16u);
      }

      v11 = [NSNumber numberWithDouble:self->_length];
      v12 = NSNumber;
      [v4 length];
      v13 = objc_msgSend(v12, "numberWithDouble:");
      int64_t v7 = [v11 compare:v13];
    }
  }

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d:%d - %0.1f meters", self->_pathIndex, self->_pointIndex, *(void *)&self->_length);
}

- (unint64_t)pathIndex
{
  return self->_pathIndex;
}

- (void)setPathIndex:(unint64_t)a3
{
  self->_pathIndex = a3;
}

- (unint64_t)pointIndex
{
  return self->_pointIndex;
}

- (void)setPointIndex:(unint64_t)a3
{
  self->_pointIndex = a3;
}

- (double)length
{
  return self->_length;
}

- (void)setLength:(double)a3
{
  self->_length = a3;
}

@end