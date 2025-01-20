@interface GEOComposedRouteLaneInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDirections;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHOVLane;
- (BOOL)isLaneForManeuver;
- (BOOL)isPreferredLaneForManeuver;
- (GEOComposedRouteLaneInfo)initWithCoder:(id)a3;
- (GEOComposedRouteLaneInfo)initWithLaneInfo:(id)a3;
- (NSArray)directions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDirections:(id)a3;
@end

@implementation GEOComposedRouteLaneInfo

- (GEOComposedRouteLaneInfo)initWithLaneInfo:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedRouteLaneInfo;
  v5 = [(GEOComposedRouteLaneInfo *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (unint64_t i = 0; i < [v4 arrowsCount]; ++i)
    {
      v8 = [v4 arrowAtIndex:i];
      v9 = [[GEOComposedRouteLaneDirectionInfo alloc] initWithLaneArrowHead:v8];
      if (v9) {
        [v6 addObject:v9];
      }
    }
    objc_storeStrong((id *)&v5->_directions, v6);
    v5->_good = [v4 supportsManeuver];
    v5->_hov = [v4 hov];
    v5->_preferred = [v4 preferredForMultipleManeuvers];
    v10 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteLaneInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOComposedRouteLaneInfo;
  v5 = [(GEOComposedRouteLaneInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_directions"];
    directions = v5->_directions;
    v5->_directions = (NSArray *)v6;

    v5->_good = [v4 decodeBoolForKey:@"_good"];
    v5->_hov = [v4 decodeBoolForKey:@"_hov"];
    v5->_preferred = [v4 decodeBoolForKey:@"_preferred"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_directions forKey:@"_directions"];
  [v4 encodeBool:self->_good forKey:@"_good"];
  [v4 encodeBool:self->_hov forKey:@"_hov"];
  [v4 encodeBool:self->_preferred forKey:@"_preferred"];
}

- (BOOL)hasDirections
{
  return [(NSArray *)self->_directions count] != 0;
}

- (BOOL)isLaneForManeuver
{
  return self->_good;
}

- (BOOL)isPreferredLaneForManeuver
{
  return self->_preferred;
}

- (BOOL)isHOVLane
{
  return self->_hov;
}

- (unint64_t)hash
{
  v3 = [(GEOComposedRouteLaneInfo *)self directions];
  unint64_t v4 = [v3 hash];

  unint64_t v5 = ((v4 << 6)
      + (v4 >> 2)
      + [(GEOComposedRouteLaneInfo *)self isLaneForManeuver]
      - 0x61C8864680B583EBLL) ^ v4;
  if ([(GEOComposedRouteLaneInfo *)self isHOVLane]) {
    unint64_t v6 = 0x9E3779B97F4A7C16;
  }
  else {
    unint64_t v6 = 0x9E3779B97F4A7C15;
  }
  unint64_t v7 = (v6 + (v5 << 6) + (v5 >> 2)) ^ v5;
  if ([(GEOComposedRouteLaneInfo *)self isPreferredLaneForManeuver]) {
    unint64_t v8 = 0x9E3779B97F4A7C16;
  }
  else {
    unint64_t v8 = 0x9E3779B97F4A7C15;
  }
  return (v8 + (v7 << 6) + (v7 >> 2)) ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (GEOComposedRouteLaneInfo *)a3;
  if (self == v4)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      BOOL v6 = [(GEOComposedRouteLaneInfo *)self hasDirections];
      if (v6 != [(GEOComposedRouteLaneInfo *)v5 hasDirections]) {
        goto LABEL_8;
      }
      if ([(GEOComposedRouteLaneInfo *)self hasDirections])
      {
        unint64_t v7 = [(GEOComposedRouteLaneInfo *)self directions];
        unint64_t v8 = [(GEOComposedRouteLaneInfo *)v5 directions];
        char v9 = [v7 isEqual:v8];

        if ((v9 & 1) == 0) {
          goto LABEL_8;
        }
      }
      BOOL v10 = [(GEOComposedRouteLaneInfo *)self isLaneForManeuver];
      if (v10 == [(GEOComposedRouteLaneInfo *)v5 isLaneForManeuver]
        && (BOOL v11 = [(GEOComposedRouteLaneInfo *)self isHOVLane],
            v11 == [(GEOComposedRouteLaneInfo *)v5 isHOVLane]))
      {
        BOOL v14 = [(GEOComposedRouteLaneInfo *)self isPreferredLaneForManeuver];
        BOOL v12 = v14 ^ [(GEOComposedRouteLaneInfo *)v5 isPreferredLaneForManeuver] ^ 1;
      }
      else
      {
LABEL_8:
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (NSArray)directions
{
  return self->_directions;
}

- (void)setDirections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end