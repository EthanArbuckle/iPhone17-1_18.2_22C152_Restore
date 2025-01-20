@interface GEOComposedTrafficCamera
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCameraPriority;
- (BOOL)hasCountryCode;
- (BOOL)hasSpeedLimitText;
- (BOOL)hasSpeedThreshold;
- (GEOComposedTrafficCamera)initWithCoder:(id)a3;
- (GEOComposedTrafficCamera)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 trafficCamera:(id)a6 onRoute:(id)a7;
- (NSString)speedLimitText;
- (double)speedThreshold;
- (id)description;
- (id)position;
- (int)type;
- (unsigned)cameraPriority;
- (unsigned)countryCode;
- (unsigned)highlightDistance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedTrafficCamera

- (GEOComposedTrafficCamera)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 trafficCamera:(id)a6 onRoute:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  v16 = [v13 position];
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedTrafficCamera;
  v17 = [(GEOComposedEnrouteNotice *)&v19 initWithEnrouteNotice:v15 enrouteNoticeIndex:a4 legIndex:a5 onRoute:v14 withPosition:v16];

  if (v17) {
    objc_storeStrong((id *)&v17->_trafficCamera, a6);
  }

  return v17;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(GEOEnrouteNotice *)self->super._enrouteNotice hasType])
  {
    v4 = NSString;
    uint64_t v5 = [(GEOEnrouteNotice *)self->super._enrouteNotice type];
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E53DB7C8[(int)v5];
    }
    v7 = [v4 stringWithFormat:@"[%@]", v6];
    [v3 addObject:v7];
  }
  if ([(GEOTrafficCamera *)self->_trafficCamera hasType])
  {
    v8 = NSString;
    uint64_t v9 = [(GEOTrafficCamera *)self->_trafficCamera type];
    if (v9 >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E53DB7E8[(int)v9];
    }
    v11 = [v8 stringWithFormat:@"[%@]", v10];
    [v3 addObject:v11];
  }
  if ([(GEOTrafficCamera *)self->_trafficCamera hasIdentifier])
  {
    v12 = NSString;
    id v13 = [(GEOTrafficCamera *)self->_trafficCamera identifier];
    id v14 = [v12 stringWithFormat:@"(%@)", v13];
    [v3 addObject:v14];
  }
  if ([(GEOTrafficCamera *)self->_trafficCamera hasPosition])
  {
    id v15 = NSString;
    v16 = [(GEOTrafficCamera *)self->_trafficCamera position];
    [v16 lat];
    uint64_t v18 = v17;
    objc_super v19 = [(GEOTrafficCamera *)self->_trafficCamera position];
    [v19 lng];
    v21 = [v15 stringWithFormat:@"%f, %f", v18, v20];
    [v3 addObject:v21];
  }
  v22 = [v3 componentsJoinedByString:@" "];

  return v22;
}

- (id)position
{
  return [(GEOTrafficCamera *)self->_trafficCamera position];
}

- (int)type
{
  return [(GEOTrafficCamera *)self->_trafficCamera type];
}

- (unsigned)highlightDistance
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTrafficCamera;
  if (![(GEOComposedEnrouteNotice *)&v5 hasHighlightDistance]) {
    return [(GEOTrafficCamera *)self->_trafficCamera highlightDistance];
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOComposedTrafficCamera;
  return [(GEOComposedEnrouteNotice *)&v4 highlightDistance];
}

- (BOOL)hasSpeedLimitText
{
  return [(GEOTrafficCamera *)self->_trafficCamera hasSpeedLimitText];
}

- (NSString)speedLimitText
{
  return [(GEOTrafficCamera *)self->_trafficCamera speedLimitText];
}

- (BOOL)hasSpeedThreshold
{
  return [(GEOTrafficCamera *)self->_trafficCamera hasSpeedThreshold];
}

- (double)speedThreshold
{
  [(GEOTrafficCamera *)self->_trafficCamera speedThreshold];
  return result;
}

- (BOOL)hasCameraPriority
{
  if ([(GEOComposedEnrouteNotice *)self hasPriority])
  {
    return [(GEOComposedEnrouteNotice *)self hasPriority];
  }
  else
  {
    trafficCamera = self->_trafficCamera;
    return [(GEOTrafficCamera *)trafficCamera hasCameraPriority];
  }
}

- (unsigned)cameraPriority
{
  if ([(GEOComposedEnrouteNotice *)self hasPriority])
  {
    return [(GEOComposedEnrouteNotice *)self priority];
  }
  else
  {
    trafficCamera = self->_trafficCamera;
    return [(GEOTrafficCamera *)trafficCamera cameraPriority];
  }
}

- (BOOL)hasCountryCode
{
  return [(GEOTrafficCamera *)self->_trafficCamera hasCountryCodeStyleId];
}

- (unsigned)countryCode
{
  return [(GEOTrafficCamera *)self->_trafficCamera countryCodeStyleId];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTrafficCamera)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedTrafficCamera;
  objc_super v5 = [(GEOComposedEnrouteNotice *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_trafficCamera"];
    trafficCamera = v5->_trafficCamera;
    v5->_trafficCamera = (GEOTrafficCamera *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTrafficCamera;
  id v4 = a3;
  [(GEOComposedEnrouteNotice *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_trafficCamera, @"_trafficCamera", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end