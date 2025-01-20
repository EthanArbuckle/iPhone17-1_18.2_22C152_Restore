@interface MUPlaceRibbonSectionControllerConfiguration
- (GEOPlaceRibbonConfiguration)ribbonConfiguration;
- (MKETAProvider)etaProvider;
- (MUPlaceDataAvailability)availability;
- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)evChargerAvailabilityProvider;
- (void)setAvailability:(id)a3;
- (void)setEtaProvider:(id)a3;
- (void)setEvChargerAvailabilityProvider:(id)a3;
- (void)setRibbonConfiguration:(id)a3;
@end

@implementation MUPlaceRibbonSectionControllerConfiguration

- (GEOPlaceRibbonConfiguration)ribbonConfiguration
{
  return self->_ribbonConfiguration;
}

- (void)setRibbonConfiguration:(id)a3
{
}

- (MUPlaceDataAvailability)availability
{
  return self->_availability;
}

- (void)setAvailability:(id)a3
{
}

- (MKETAProvider)etaProvider
{
  return self->_etaProvider;
}

- (void)setEtaProvider:(id)a3
{
}

- (_TtC6MapsUI31MUEVChargerAvailabilityProvider)evChargerAvailabilityProvider
{
  return self->_evChargerAvailabilityProvider;
}

- (void)setEvChargerAvailabilityProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargerAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_ribbonConfiguration, 0);
}

@end