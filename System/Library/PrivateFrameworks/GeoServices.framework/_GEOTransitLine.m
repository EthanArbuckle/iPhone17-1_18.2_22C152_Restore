@interface _GEOTransitLine
+ (BOOL)supportsSecureCoding;
- (BOOL)departuresAreVehicleSpecific;
- (BOOL)hasLineColorString;
- (BOOL)isBus;
- (BOOL)showVehicleNumber;
- (GEOMapItemIdentifier)identifier;
- (GEOStyleAttributes)styleAttributes;
- (GEOTransitArtworkDataSource)alternateArtwork;
- (GEOTransitArtworkDataSource)artwork;
- (GEOTransitArtworkDataSource)headerArtwork;
- (GEOTransitArtworkDataSource)modeArtwork;
- (GEOTransitSystem)system;
- (NSArray)operatingHours;
- (NSString)lineColorString;
- (NSString)name;
- (_GEOTransitLine)initWithCoder:(id)a3;
- (_GEOTransitLine)initWithLine:(id)a3 system:(id)a4 locationHint:(id)a5;
- (unint64_t)departureTimeDisplayStyle;
- (unint64_t)muid;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _GEOTransitLine

- (_GEOTransitLine)initWithLine:(id)a3 system:(id)a4 locationHint:(id)a5
{
  double var1 = a5.var1;
  double var0 = a5.var0;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_GEOTransitLine;
  v12 = [(_GEOTransitLine *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_line, a3);
    objc_storeStrong((id *)&v13->_system, a4);
    v13->_locationHint.latitude = var0;
    v13->_locationHint.longitude = var1;
  }

  return v13;
}

- (unint64_t)muid
{
  return [(GEOPBTransitLine *)self->_line muid];
}

- (GEOMapItemIdentifier)identifier
{
  return (GEOMapItemIdentifier *)-[GEOPBTransitLine identifierWithLocationHint:](self->_line, "identifierWithLocationHint:", self->_locationHint.latitude, self->_locationHint.longitude);
}

- (NSString)name
{
  return [(GEOPBTransitLine *)self->_line nameDisplayString];
}

- (GEOTransitSystem)system
{
  return self->_system;
}

- (unint64_t)departureTimeDisplayStyle
{
  if ([(GEOPBTransitLine *)self->_line hasPreferredDepartureTimeStyle]
    && (uint64_t v3 = [(GEOPBTransitLine *)self->_line preferredDepartureTimeStyle]
           - 1,
        v3 <= 3))
  {
    return v3 + 1;
  }
  else
  {
    return 0;
  }
}

- (BOOL)departuresAreVehicleSpecific
{
  return [(_GEOTransitLine *)self departureTimeDisplayStyle] == 2;
}

- (BOOL)isBus
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [(GEOPBTransitLine *)self->_line styleAttributes];
  uint64_t v3 = [v2 attributes];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "key", (void)v10) == 37)
        {
          LOBYTE(v5) = [v8 value] == 700;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)[(GEOPBTransitLine *)self->_line artwork];
}

- (GEOTransitArtworkDataSource)modeArtwork
{
  return (GEOTransitArtworkDataSource *)[(GEOPBTransitLine *)self->_line modeArtwork];
}

- (GEOTransitArtworkDataSource)alternateArtwork
{
  return (GEOTransitArtworkDataSource *)[(GEOPBTransitLine *)self->_line alternateArtwork];
}

- (GEOTransitArtworkDataSource)headerArtwork
{
  return (GEOTransitArtworkDataSource *)[(GEOPBTransitLine *)self->_line headerArtwork];
}

- (BOOL)hasLineColorString
{
  return [(GEOPBTransitLine *)self->_line hasLineColor];
}

- (NSString)lineColorString
{
  return [(GEOPBTransitLine *)self->_line lineColor];
}

- (BOOL)showVehicleNumber
{
  v2 = [(GEOPBTransitLine *)self->_line displayHints];
  char v3 = [v2 showVehicleNumber];

  return v3;
}

- (GEOStyleAttributes)styleAttributes
{
  return [(GEOPBTransitLine *)self->_line styleAttributes];
}

- (NSArray)operatingHours
{
  unint64_t v4 = [(GEOPBTransitLine *)self->_line operatingHoursCount];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v8 = [(GEOPBTransitLine *)self->_line operatingHoursAtIndex:i];
      if ((~v9 & 3) == 0)
      {
        unint64_t v2 = v2 & 0xFFFFFFFF00000000 | v9;
        long long v10 = -[_GEOTimeRange initWithPBTimeRange:]([_GEOTimeRange alloc], "initWithPBTimeRange:", v8, v2);
        [v6 addObject:v10];
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSArray *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GEOTransitLine)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GEOTransitLine;
  unint64_t v5 = [(_GEOTransitLine *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_line"];
    line = v5->_line;
    v5->_line = (GEOPBTransitLine *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_system"];
    system = v5->_system;
    v5->_system = (GEOTransitSystem *)v8;

    [v4 decodeDoubleForKey:@"_locationHint.latitude"];
    v5->_locationHint.latitude = v10;
    [v4 decodeDoubleForKey:@"_locationHint.longitude"];
    v5->_locationHint.longitude = v11;
    long long v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  line = self->_line;
  id v5 = a3;
  [v5 encodeObject:line forKey:@"_line"];
  [v5 encodeObject:self->_system forKey:@"_system"];
  [v5 encodeDouble:@"_locationHint.latitude" forKey:self->_locationHint.latitude];
  [v5 encodeDouble:@"_locationHint.longitude" forKey:self->_locationHint.longitude];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_system, 0);

  objc_storeStrong((id *)&self->_line, 0);
}

@end