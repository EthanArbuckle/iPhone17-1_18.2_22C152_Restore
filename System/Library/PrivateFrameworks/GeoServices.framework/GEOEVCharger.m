@interface GEOEVCharger
+ (id)chargerFromPlaceData:(id)a3;
- (GEOEVCharger)initWithPlugs:(id)a3 aggregatedAvailabilityInfo:(id)a4;
- (GEOEVChargerAvailability)aggregatedAvailabilityInfo;
- (NSArray)plugs;
@end

@implementation GEOEVCharger

- (GEOEVCharger)initWithPlugs:(id)a3 aggregatedAvailabilityInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 count])
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOEVCharger;
    v9 = [(GEOEVCharger *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_plugs, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)chargerFromPlaceData:(id)a3
{
  id v3 = a3;
  v4 = +[GEOPDEVCharger evChargerFromPlaceData:v3];
  v5 = -[GEOPDEVCharger plugs](v4);
  v6 = +[GEOEVChargerPlug plugsFromPDPlugs:v5];

  id v7 = [[GEOEVChargerAvailability alloc] initWithPlaceData:v3];
  id v8 = [[GEOEVCharger alloc] initWithPlugs:v6 aggregatedAvailabilityInfo:v7];

  return v8;
}

- (NSArray)plugs
{
  return self->_plugs;
}

- (GEOEVChargerAvailability)aggregatedAvailabilityInfo
{
  return self->_aggregatedAvailabilityInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregatedAvailabilityInfo, 0);

  objc_storeStrong((id *)&self->_plugs, 0);
}

@end