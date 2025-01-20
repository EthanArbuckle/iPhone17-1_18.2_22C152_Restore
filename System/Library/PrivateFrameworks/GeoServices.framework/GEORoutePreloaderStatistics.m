@interface GEORoutePreloaderStatistics
+ (BOOL)supportsSecureCoding;
- (GEORoutePreloaderStatistics)initWithCoder:(id)a3;
- (GEORoutePreloaderStatistics)initWithDateInterval:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7;
- (NSDateInterval)dateInterval;
- (int64_t)transportType;
- (unint64_t)tilesMissed;
- (unint64_t)tilesPreloaded;
- (unint64_t)tilesUsed;
- (void)encodeWithCoder:(id)a3;
- (void)setTilesMissed:(unint64_t)a3;
- (void)setTilesPreloaded:(unint64_t)a3;
- (void)setTilesUsed:(unint64_t)a3;
- (void)setTransportType:(int64_t)a3;
@end

@implementation GEORoutePreloaderStatistics

- (GEORoutePreloaderStatistics)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORoutePreloaderStatistics;
  v5 = [(GEORoutePreloaderStatistics *)&v10 init];
  if (v5
    && ([v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateInterval"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        dateInterval = v5->_dateInterval,
        v5->_dateInterval = (NSDateInterval *)v6,
        dateInterval,
        v5->_dateInterval))
  {
    v5->_transportType = [v4 decodeIntegerForKey:@"transportType"];
    v5->_tilesPreloaded = [v4 decodeIntegerForKey:@"tilesPreloaded"];
    v5->_tilesUsed = [v4 decodeIntegerForKey:@"tilesUsed"];
    v5->_tilesMissed = [v4 decodeIntegerForKey:@"tilesMissed"];
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"dateInterval"];
  [v5 encodeInteger:self->_transportType forKey:@"transportType"];
  [v5 encodeInteger:self->_tilesPreloaded forKey:@"tilesPreloaded"];
  [v5 encodeInteger:self->_tilesUsed forKey:@"tilesUsed"];
  [v5 encodeInteger:self->_tilesMissed forKey:@"tilesMissed"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORoutePreloaderStatistics)initWithDateInterval:(id)a3 transportType:(int64_t)a4 tilesPreloaded:(unint64_t)a5 tilesUsed:(unint64_t)a6 tilesMissed:(unint64_t)a7
{
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEORoutePreloaderStatistics;
  v13 = [(GEORoutePreloaderStatistics *)&v18 init];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    dateInterval = v13->_dateInterval;
    v13->_dateInterval = (NSDateInterval *)v14;

    v13->_transportType = a4;
    v13->_tilesPreloaded = a5;
    v13->_tilesUsed = a6;
    v13->_tilesMissed = a7;
    v16 = v13;
  }

  return v13;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (unint64_t)tilesPreloaded
{
  return self->_tilesPreloaded;
}

- (void)setTilesPreloaded:(unint64_t)a3
{
  self->_tilesPreloaded = a3;
}

- (unint64_t)tilesUsed
{
  return self->_tilesUsed;
}

- (void)setTilesUsed:(unint64_t)a3
{
  self->_tilesUsed = a3;
}

- (unint64_t)tilesMissed
{
  return self->_tilesMissed;
}

- (void)setTilesMissed:(unint64_t)a3
{
  self->_tilesMissed = a3;
}

- (void).cxx_destruct
{
}

@end