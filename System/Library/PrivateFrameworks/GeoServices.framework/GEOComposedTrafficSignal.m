@interface GEOComposedTrafficSignal
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCountryCode;
- (GEOComposedTrafficSignal)initWithCoder:(id)a3;
- (GEOComposedTrafficSignal)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 trafficSignal:(id)a6 onRoute:(id)a7;
- (id)description;
- (id)position;
- (int)type;
- (unsigned)countryCode;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedTrafficSignal

- (GEOComposedTrafficSignal)initWithEnrouteNotice:(id)a3 enrouteNoticeIndex:(unint64_t)a4 legIndex:(unint64_t)a5 trafficSignal:(id)a6 onRoute:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  v16 = [v13 position];
  v19.receiver = self;
  v19.super_class = (Class)GEOComposedTrafficSignal;
  v17 = [(GEOComposedEnrouteNotice *)&v19 initWithEnrouteNotice:v15 enrouteNoticeIndex:a4 legIndex:a5 onRoute:v14 withPosition:v16];

  if (v17) {
    objc_storeStrong((id *)&v17->_trafficSignal, a6);
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
      v6 = off_1E53E4A08[(int)v5];
    }
    v7 = [v4 stringWithFormat:@"[%@]", v6];
    [v3 addObject:v7];
  }
  if ([(GEOTrafficSignal *)self->_trafficSignal hasType])
  {
    v8 = NSString;
    uint64_t v9 = [(GEOTrafficSignal *)self->_trafficSignal type];
    if (v9 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E53E4A28[(int)v9];
    }
    v11 = [v8 stringWithFormat:@"[%@]", v10];
    [v3 addObject:v11];
  }
  if ([(GEOTrafficSignal *)self->_trafficSignal hasIdentifier])
  {
    v12 = NSString;
    id v13 = [(GEOTrafficSignal *)self->_trafficSignal identifier];
    id v14 = [v12 stringWithFormat:@"(%@)", v13];
    [v3 addObject:v14];
  }
  if ([(GEOTrafficSignal *)self->_trafficSignal hasPosition])
  {
    id v15 = NSString;
    v16 = [(GEOTrafficSignal *)self->_trafficSignal position];
    [v16 lat];
    uint64_t v18 = v17;
    objc_super v19 = [(GEOTrafficSignal *)self->_trafficSignal position];
    [v19 lng];
    v21 = [v15 stringWithFormat:@"%f, %f", v18, v20];
    [v3 addObject:v21];
  }
  v22 = [v3 componentsJoinedByString:@" "];

  return v22;
}

- (id)position
{
  return [(GEOTrafficSignal *)self->_trafficSignal position];
}

- (int)type
{
  return [(GEOTrafficSignal *)self->_trafficSignal type];
}

- (BOOL)hasCountryCode
{
  return [(GEOTrafficSignal *)self->_trafficSignal hasCountryCodeStyleId];
}

- (unsigned)countryCode
{
  return [(GEOTrafficSignal *)self->_trafficSignal countryCodeStyleId];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedTrafficSignal)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedTrafficSignal;
  uint64_t v5 = [(GEOComposedEnrouteNotice *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_trafficSignal"];
    trafficSignal = v5->_trafficSignal;
    v5->_trafficSignal = (GEOTrafficSignal *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GEOComposedTrafficSignal;
  id v4 = a3;
  [(GEOComposedEnrouteNotice *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_trafficSignal, @"_trafficSignal", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end