@interface GEOLogMsgEventPredExTrainingData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasActualTransportMode;
- (BOOL)hasChanceOfPrecipitation;
- (BOOL)hasChanceOfRain;
- (BOOL)hasChanceOfSnow;
- (BOOL)hasDayOfWeek;
- (BOOL)hasDistanceFromHere;
- (BOOL)hasDistanceFromHereToHome;
- (BOOL)hasDistanceFromHereToOrigin;
- (BOOL)hasDistanceFromHereToParkedCar;
- (BOOL)hasDistanceFromHereToWork;
- (BOOL)hasDistanceFromOriginToDestination;
- (BOOL)hasDurationUntilEventEnd;
- (BOOL)hasDurationUntilEventStart;
- (BOOL)hasEndTime;
- (BOOL)hasEntryType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsCarplayConnected;
- (BOOL)hasIsInBasemode;
- (BOOL)hasIsTourist;
- (BOOL)hasIsTransitPossible;
- (BOOL)hasIsVehicleBluetoothConnected;
- (BOOL)hasMapType;
- (BOOL)hasPredictedTransportMode;
- (BOOL)hasPreferredTransportMode;
- (BOOL)hasRoutePlanningScreenPresented;
- (BOOL)hasStartTime;
- (BOOL)hasTemperature;
- (BOOL)hasTimeOfDay;
- (BOOL)hasTimeSinceBackgrounded;
- (BOOL)hasUserLocation;
- (BOOL)hasUserLocationGeohash4;
- (BOOL)hasWeatherAqi;
- (BOOL)hasWeatherType;
- (BOOL)isCarplayConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInBasemode;
- (BOOL)isTransitPossible;
- (BOOL)isVehicleBluetoothConnected;
- (BOOL)readFrom:(id)a3;
- (BOOL)routePlanningScreenPresented;
- (GEOLatLng)userLocation;
- (GEOLogMsgEventPredExTrainingData)init;
- (GEOLogMsgEventPredExTrainingData)initWithData:(id)a3;
- (GEOLogMsgEventPredExTrainingData)initWithDictionary:(id)a3;
- (GEOLogMsgEventPredExTrainingData)initWithJSON:(id)a3;
- (NSString)userLocationGeohash4;
- (double)chanceOfPrecipitation;
- (double)chanceOfRain;
- (double)chanceOfSnow;
- (double)dayOfWeek;
- (double)durationUntilEventEnd;
- (double)durationUntilEventStart;
- (double)endTime;
- (double)isTourist;
- (double)startTime;
- (double)temperature;
- (double)timeOfDay;
- (double)timeSinceBackgrounded;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)actualTransportModeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)distanceFromHereAsString:(int)a3;
- (id)distanceFromHereToHomeAsString:(int)a3;
- (id)distanceFromHereToOriginAsString:(int)a3;
- (id)distanceFromHereToParkedCarAsString:(int)a3;
- (id)distanceFromHereToWorkAsString:(int)a3;
- (id)distanceFromOriginToDestinationAsString:(int)a3;
- (id)entryTypeAsString:(int)a3;
- (id)jsonRepresentation;
- (id)mapTypeAsString:(int)a3;
- (id)predictedTransportModeAsString:(int)a3;
- (id)preferredTransportModeAsString:(int)a3;
- (id)weatherTypeAsString:(int)a3;
- (int)StringAsActualTransportMode:(id)a3;
- (int)StringAsDistanceFromHere:(id)a3;
- (int)StringAsDistanceFromHereToHome:(id)a3;
- (int)StringAsDistanceFromHereToOrigin:(id)a3;
- (int)StringAsDistanceFromHereToParkedCar:(id)a3;
- (int)StringAsDistanceFromHereToWork:(id)a3;
- (int)StringAsDistanceFromOriginToDestination:(id)a3;
- (int)StringAsEntryType:(id)a3;
- (int)StringAsMapType:(id)a3;
- (int)StringAsPredictedTransportMode:(id)a3;
- (int)StringAsPreferredTransportMode:(id)a3;
- (int)StringAsWeatherType:(id)a3;
- (int)actualTransportMode;
- (int)distanceFromHere;
- (int)distanceFromHereToHome;
- (int)distanceFromHereToOrigin;
- (int)distanceFromHereToParkedCar;
- (int)distanceFromHereToWork;
- (int)distanceFromOriginToDestination;
- (int)entryType;
- (int)mapType;
- (int)predictedTransportMode;
- (int)preferredTransportMode;
- (int)weatherType;
- (unint64_t)hash;
- (unsigned)weatherAqi;
- (void)_readUserLocation;
- (void)_readUserLocationGeohash4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setActualTransportMode:(int)a3;
- (void)setChanceOfPrecipitation:(double)a3;
- (void)setChanceOfRain:(double)a3;
- (void)setChanceOfSnow:(double)a3;
- (void)setDayOfWeek:(double)a3;
- (void)setDistanceFromHere:(int)a3;
- (void)setDistanceFromHereToHome:(int)a3;
- (void)setDistanceFromHereToOrigin:(int)a3;
- (void)setDistanceFromHereToParkedCar:(int)a3;
- (void)setDistanceFromHereToWork:(int)a3;
- (void)setDistanceFromOriginToDestination:(int)a3;
- (void)setDurationUntilEventEnd:(double)a3;
- (void)setDurationUntilEventStart:(double)a3;
- (void)setEndTime:(double)a3;
- (void)setEntryType:(int)a3;
- (void)setHasActualTransportMode:(BOOL)a3;
- (void)setHasChanceOfPrecipitation:(BOOL)a3;
- (void)setHasChanceOfRain:(BOOL)a3;
- (void)setHasChanceOfSnow:(BOOL)a3;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasDistanceFromHere:(BOOL)a3;
- (void)setHasDistanceFromHereToHome:(BOOL)a3;
- (void)setHasDistanceFromHereToOrigin:(BOOL)a3;
- (void)setHasDistanceFromHereToParkedCar:(BOOL)a3;
- (void)setHasDistanceFromHereToWork:(BOOL)a3;
- (void)setHasDistanceFromOriginToDestination:(BOOL)a3;
- (void)setHasDurationUntilEventEnd:(BOOL)a3;
- (void)setHasDurationUntilEventStart:(BOOL)a3;
- (void)setHasEndTime:(BOOL)a3;
- (void)setHasEntryType:(BOOL)a3;
- (void)setHasIsCarplayConnected:(BOOL)a3;
- (void)setHasIsInBasemode:(BOOL)a3;
- (void)setHasIsTourist:(BOOL)a3;
- (void)setHasIsTransitPossible:(BOOL)a3;
- (void)setHasIsVehicleBluetoothConnected:(BOOL)a3;
- (void)setHasMapType:(BOOL)a3;
- (void)setHasPredictedTransportMode:(BOOL)a3;
- (void)setHasPreferredTransportMode:(BOOL)a3;
- (void)setHasRoutePlanningScreenPresented:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setHasTemperature:(BOOL)a3;
- (void)setHasTimeOfDay:(BOOL)a3;
- (void)setHasTimeSinceBackgrounded:(BOOL)a3;
- (void)setHasWeatherAqi:(BOOL)a3;
- (void)setHasWeatherType:(BOOL)a3;
- (void)setIsCarplayConnected:(BOOL)a3;
- (void)setIsInBasemode:(BOOL)a3;
- (void)setIsTourist:(double)a3;
- (void)setIsTransitPossible:(BOOL)a3;
- (void)setIsVehicleBluetoothConnected:(BOOL)a3;
- (void)setMapType:(int)a3;
- (void)setPredictedTransportMode:(int)a3;
- (void)setPreferredTransportMode:(int)a3;
- (void)setRoutePlanningScreenPresented:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setTemperature:(double)a3;
- (void)setTimeOfDay:(double)a3;
- (void)setTimeSinceBackgrounded:(double)a3;
- (void)setUserLocation:(id)a3;
- (void)setUserLocationGeohash4:(id)a3;
- (void)setWeatherAqi:(unsigned int)a3;
- (void)setWeatherType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventPredExTrainingData

- (GEOLogMsgEventPredExTrainingData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventPredExTrainingData;
  v2 = [(GEOLogMsgEventPredExTrainingData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventPredExTrainingData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventPredExTrainingData;
  v3 = [(GEOLogMsgEventPredExTrainingData *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)entryType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x80000) != 0) {
    return self->_entryType;
  }
  else {
    return 0;
  }
}

- (void)setEntryType:(int)a3
{
  *(void *)&self->_flags |= 0x100080000uLL;
  self->_entryType = a3;
}

- (void)setHasEntryType:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100080000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasEntryType
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (id)entryTypeAsString:(int)a3
{
  if (a3 >= 0x13)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F79B0[a3];
  }

  return v3;
}

- (int)StringAsEntryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"HOME"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WORK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CALENDAR_EVENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FREQUENT_LOCATION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"RECENT_HISTORY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FAVORITE_PLACE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"PARKED_CAR"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RESTAURANT_RESERVATION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RIDESHARING"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CARPLAY_LOW_ENERGY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"RESUME_ROUTE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"APP_CONNECTION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"HOTEL"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CAR_RENTAL"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"TRAVEL_FLIGHT"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TICKETED_EVENT"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"PORTRAIT"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"USER_PLACE"])
  {
    int v4 = 18;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)durationUntilEventStart
{
  return self->_durationUntilEventStart;
}

- (void)setDurationUntilEventStart:(double)a3
{
  *(void *)&self->_flags |= 0x100000020uLL;
  self->_durationUntilEventStart = a3;
}

- (void)setHasDurationUntilEventStart:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000020;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasDurationUntilEventStart
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (double)durationUntilEventEnd
{
  return self->_durationUntilEventEnd;
}

- (void)setDurationUntilEventEnd:(double)a3
{
  *(void *)&self->_flags |= 0x100000010uLL;
  self->_durationUntilEventEnd = a3;
}

- (void)setHasDurationUntilEventEnd:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000010;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasDurationUntilEventEnd
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  *(void *)&self->_flags |= 0x100000100uLL;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000100;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasStartTime
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  *(void *)&self->_flags |= 0x100000040uLL;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000040;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasEndTime
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(double)a3
{
  *(void *)&self->_flags |= 0x100000200uLL;
  self->_temperature = a3;
}

- (void)setHasTemperature:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000200;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasTemperature
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (double)chanceOfPrecipitation
{
  return self->_chanceOfPrecipitation;
}

- (void)setChanceOfPrecipitation:(double)a3
{
  *(void *)&self->_flags |= 0x100000001uLL;
  self->_chanceOfPrecipitation = a3;
}

- (void)setHasChanceOfPrecipitation:(BOOL)a3
{
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFEFFFFFFFELL | a3 | 0x100000000);
}

- (BOOL)hasChanceOfPrecipitation
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)chanceOfRain
{
  return self->_chanceOfRain;
}

- (void)setChanceOfRain:(double)a3
{
  *(void *)&self->_flags |= 0x100000002uLL;
  self->_chanceOfRain = a3;
}

- (void)setHasChanceOfRain:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000002;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasChanceOfRain
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)chanceOfSnow
{
  return self->_chanceOfSnow;
}

- (void)setChanceOfSnow:(double)a3
{
  *(void *)&self->_flags |= 0x100000004uLL;
  self->_chanceOfSnow = a3;
}

- (void)setHasChanceOfSnow:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000004;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasChanceOfSnow
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)timeOfDay
{
  return self->_timeOfDay;
}

- (void)setTimeOfDay:(double)a3
{
  *(void *)&self->_flags |= 0x100000400uLL;
  self->_timeOfDay = a3;
}

- (void)setHasTimeOfDay:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000400;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasTimeOfDay
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (double)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setDayOfWeek:(double)a3
{
  *(void *)&self->_flags |= 0x100000008uLL;
  self->_dayOfWeek = a3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000008;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDayOfWeek
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (double)isTourist
{
  return self->_isTourist;
}

- (void)setIsTourist:(double)a3
{
  *(void *)&self->_flags |= 0x100000080uLL;
  self->_isTourist = a3;
}

- (void)setHasIsTourist:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000080;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasIsTourist
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (int)preferredTransportMode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x400000) != 0) {
    return self->_preferredTransportMode;
  }
  else {
    return 0;
  }
}

- (void)setPreferredTransportMode:(int)a3
{
  *(void *)&self->_flags |= 0x100400000uLL;
  self->_preferredTransportMode = a3;
}

- (void)setHasPreferredTransportMode:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100400000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasPreferredTransportMode
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (id)preferredTransportModeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F85F8[a3];
  }

  return v3;
}

- (int)StringAsPreferredTransportMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DRIVING_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_MODE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RIDESHARE_MODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CYCLING_MODE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)mapType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x100000) != 0) {
    return self->_mapType;
  }
  else {
    return 0;
  }
}

- (void)setMapType:(int)a3
{
  *(void *)&self->_flags |= 0x100100000uLL;
  self->_mapType = a3;
}

- (void)setHasMapType:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100100000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMapType
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (id)mapTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F8050[a3];
  }

  return v3;
}

- (int)StringAsMapType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MAP_TYPE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_STANDARD"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_SATELLITE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_HYBRID"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MAP_TYPE_TRANSIT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isTransitPossible
{
  return self->_isTransitPossible;
}

- (void)setIsTransitPossible:(BOOL)a3
{
  *(void *)&self->_flags |= 0x108000000uLL;
  self->_isTransitPossible = a3;
}

- (void)setHasIsTransitPossible:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x108000000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasIsTransitPossible
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (BOOL)isInBasemode
{
  return self->_isInBasemode;
}

- (void)setIsInBasemode:(BOOL)a3
{
  *(void *)&self->_flags |= 0x104000000uLL;
  self->_isInBasemode = a3;
}

- (void)setHasIsInBasemode:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x104000000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasIsInBasemode
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (double)timeSinceBackgrounded
{
  return self->_timeSinceBackgrounded;
}

- (void)setTimeSinceBackgrounded:(double)a3
{
  *(void *)&self->_flags |= 0x100000800uLL;
  self->_timeSinceBackgrounded = a3;
}

- (void)setHasTimeSinceBackgrounded:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100000800;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasTimeSinceBackgrounded
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (BOOL)routePlanningScreenPresented
{
  return self->_routePlanningScreenPresented;
}

- (void)setRoutePlanningScreenPresented:(BOOL)a3
{
  *(void *)&self->_flags |= 0x120000000uLL;
  self->_routePlanningScreenPresented = a3;
}

- (void)setHasRoutePlanningScreenPresented:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x120000000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasRoutePlanningScreenPresented
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (int)predictedTransportMode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x200000) != 0) {
    return self->_predictedTransportMode;
  }
  else {
    return 0;
  }
}

- (void)setPredictedTransportMode:(int)a3
{
  *(void *)&self->_flags |= 0x100200000uLL;
  self->_predictedTransportMode = a3;
}

- (void)setHasPredictedTransportMode:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100200000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasPredictedTransportMode
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (id)predictedTransportModeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F85F8[a3];
  }

  return v3;
}

- (int)StringAsPredictedTransportMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DRIVING_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_MODE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RIDESHARE_MODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CYCLING_MODE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)actualTransportMode
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x1000) != 0) {
    return self->_actualTransportMode;
  }
  else {
    return 0;
  }
}

- (void)setActualTransportMode:(int)a3
{
  *(void *)&self->_flags |= 0x100001000uLL;
  self->_actualTransportMode = a3;
}

- (void)setHasActualTransportMode:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100001000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasActualTransportMode
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)actualTransportModeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F85F8[a3];
  }

  return v3;
}

- (int)StringAsActualTransportMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DRIVING_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_MODE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RIDESHARE_MODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CYCLING_MODE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)distanceFromHere
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x20000) != 0) {
    return self->_distanceFromHere;
  }
  else {
    return 0;
  }
}

- (void)setDistanceFromHere:(int)a3
{
  *(void *)&self->_flags |= 0x100020000uLL;
  self->_distanceFromHere = a3;
}

- (void)setHasDistanceFromHere:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100020000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasDistanceFromHere
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (id)distanceFromHereAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F7A48[a3];
  }

  return v3;
}

- (int)StringAsDistanceFromHere:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VERY_NEAR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_DISTANCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FAR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)distanceFromHereToOrigin
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x4000) != 0) {
    return self->_distanceFromHereToOrigin;
  }
  else {
    return 0;
  }
}

- (void)setDistanceFromHereToOrigin:(int)a3
{
  *(void *)&self->_flags |= 0x100004000uLL;
  self->_distanceFromHereToOrigin = a3;
}

- (void)setHasDistanceFromHereToOrigin:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100004000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDistanceFromHereToOrigin
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (id)distanceFromHereToOriginAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F7A48[a3];
  }

  return v3;
}

- (int)StringAsDistanceFromHereToOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VERY_NEAR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_DISTANCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FAR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)distanceFromOriginToDestination
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x40000) != 0) {
    return self->_distanceFromOriginToDestination;
  }
  else {
    return 0;
  }
}

- (void)setDistanceFromOriginToDestination:(int)a3
{
  *(void *)&self->_flags |= 0x100040000uLL;
  self->_distanceFromOriginToDestination = a3;
}

- (void)setHasDistanceFromOriginToDestination:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100040000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasDistanceFromOriginToDestination
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (id)distanceFromOriginToDestinationAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F7A48[a3];
  }

  return v3;
}

- (int)StringAsDistanceFromOriginToDestination:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VERY_NEAR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_DISTANCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FAR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)distanceFromHereToHome
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x2000) != 0) {
    return self->_distanceFromHereToHome;
  }
  else {
    return 0;
  }
}

- (void)setDistanceFromHereToHome:(int)a3
{
  *(void *)&self->_flags |= 0x100002000uLL;
  self->_distanceFromHereToHome = a3;
}

- (void)setHasDistanceFromHereToHome:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100002000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasDistanceFromHereToHome
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (id)distanceFromHereToHomeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F7A48[a3];
  }

  return v3;
}

- (int)StringAsDistanceFromHereToHome:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VERY_NEAR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_DISTANCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FAR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)distanceFromHereToWork
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x10000) != 0) {
    return self->_distanceFromHereToWork;
  }
  else {
    return 0;
  }
}

- (void)setDistanceFromHereToWork:(int)a3
{
  *(void *)&self->_flags |= 0x100010000uLL;
  self->_distanceFromHereToWork = a3;
}

- (void)setHasDistanceFromHereToWork:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100010000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasDistanceFromHereToWork
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (id)distanceFromHereToWorkAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F7A48[a3];
  }

  return v3;
}

- (int)StringAsDistanceFromHereToWork:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VERY_NEAR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_DISTANCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FAR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)distanceFromHereToParkedCar
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x8000) != 0) {
    return self->_distanceFromHereToParkedCar;
  }
  else {
    return 0;
  }
}

- (void)setDistanceFromHereToParkedCar:(int)a3
{
  *(void *)&self->_flags |= 0x100008000uLL;
  self->_distanceFromHereToParkedCar = a3;
}

- (void)setHasDistanceFromHereToParkedCar:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100008000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasDistanceFromHereToParkedCar
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (id)distanceFromHereToParkedCarAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E53F7A48[a3];
  }

  return v3;
}

- (int)StringAsDistanceFromHereToParkedCar:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VERY_NEAR"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_DISTANCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FAR"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readUserLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 203) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPredExTrainingDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserLocation_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasUserLocation
{
  return self->_userLocation != 0;
}

- (GEOLatLng)userLocation
{
  -[GEOLogMsgEventPredExTrainingData _readUserLocation]((uint64_t)self);
  userLocation = self->_userLocation;

  return userLocation;
}

- (void)setUserLocation:(id)a3
{
  *(void *)&self->_flags |= 0x180000000uLL;
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (void)_readUserLocationGeohash4
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(unsigned char *)(a1 + 203) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPredExTrainingDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUserLocationGeohash4_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasUserLocationGeohash4
{
  return self->_userLocationGeohash4 != 0;
}

- (NSString)userLocationGeohash4
{
  -[GEOLogMsgEventPredExTrainingData _readUserLocationGeohash4]((uint64_t)self);
  userLocationGeohash4 = self->_userLocationGeohash4;

  return userLocationGeohash4;
}

- (void)setUserLocationGeohash4:(id)a3
{
  *(void *)&self->_flags |= 0x140000000uLL;
  objc_storeStrong((id *)&self->_userLocationGeohash4, a3);
}

- (BOOL)isCarplayConnected
{
  return self->_isCarplayConnected;
}

- (void)setIsCarplayConnected:(BOOL)a3
{
  *(void *)&self->_flags |= 0x102000000uLL;
  self->_isCarplayConnected = a3;
}

- (void)setHasIsCarplayConnected:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x102000000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasIsCarplayConnected
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (int)weatherType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_DWORD *)&flags & 0x1000000) != 0) {
    return self->_weatherType;
  }
  else {
    return 0;
  }
}

- (void)setWeatherType:(int)a3
{
  *(void *)&self->_flags |= 0x101000000uLL;
  self->_weatherType = a3;
}

- (void)setHasWeatherType:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x101000000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasWeatherType
{
  return *((unsigned char *)&self->_flags + 3) & 1;
}

- (id)weatherTypeAsString:(int)a3
{
  if a3 < 0x2E && ((0x3FFAAFFFFFFFuLL >> a3))
  {
    uint64_t v3 = off_1E53F7A68[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int)StringAsWeatherType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_NOT_AVAILABLE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_TORNADO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_TROPICAL_STORM"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HURRICANE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SEVERE_THUNDERSTORMS"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_THUNDERSTORMS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_SNOW"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_SLEET"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MIXED_SNOW_AND_SLEET"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_FREEZING_DRIZZLE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_DRIZZLE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_FREEZING_RAIN"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SHOWERS"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_RAIN"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SNOW_FLURRIES"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_LIGHT_SNOW_SHOWERS"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_BLOWING_SNOW"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SNOW"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HAIL"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SLEET"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_DUST"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_FOGGY"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HAZE"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SMOKY"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_BLUSTERY"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_WINDY"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_COLD"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_CLOUDY"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MOSTLY_CLOUDY"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_PARTLY_CLOUDY"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_CLEAR"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MOSTLY_CLEAR"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_HAIL"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HOT"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_ISOLATED_THUNDERSTORMS"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SCATTERED_THUNDERSTORMS"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SCATTERED_SHOWERS"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HEAVY_RAIN"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SCATTERED_SNOW_SHOWERS"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HEAVY_SNOW"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_BLIZZARD"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_ISOLATED_THUNDERSHOWERS"])
  {
    int v4 = 45;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)weatherAqi
{
  return self->_weatherAqi;
}

- (void)setWeatherAqi:(unsigned int)a3
{
  *(void *)&self->_flags |= 0x100800000uLL;
  self->_weatherAqi = a3;
}

- (void)setHasWeatherAqi:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x100800000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasWeatherAqi
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (BOOL)isVehicleBluetoothConnected
{
  return self->_isVehicleBluetoothConnected;
}

- (void)setIsVehicleBluetoothConnected:(BOOL)a3
{
  *(void *)&self->_flags |= 0x110000000uLL;
  self->_isVehicleBluetoothConnected = a3;
}

- (void)setHasIsVehicleBluetoothConnected:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (a3) {
    uint64_t v3 = 0x110000000;
  }
  self->_$A2888D52E07BB247939D0F55CC592477 flags = ($A2888D52E07BB247939D0F55CC592477)(*(void *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIsVehicleBluetoothConnected
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventPredExTrainingData;
  int v4 = [(GEOLogMsgEventPredExTrainingData *)&v8 description];
  v5 = [(GEOLogMsgEventPredExTrainingData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPredExTrainingData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x80000) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 168);
      if (v6 >= 0x13)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 168));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53F79B0[v6];
      }
      if (a2) {
        objc_super v8 = @"entryType";
      }
      else {
        objc_super v8 = @"entry_type";
      }
      [v4 setObject:v7 forKey:v8];

      uint64_t v5 = *(void *)(a1 + 200);
    }
    if ((v5 & 0x20) != 0)
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 56)];
      if (a2) {
        v10 = @"durationUntilEventStart";
      }
      else {
        v10 = @"duration_until_event_start";
      }
      [v4 setObject:v9 forKey:v10];

      uint64_t v5 = *(void *)(a1 + 200);
      if ((v5 & 0x10) == 0)
      {
LABEL_12:
        if ((v5 & 0x100) == 0) {
          goto LABEL_13;
        }
        goto LABEL_44;
      }
    }
    else if ((v5 & 0x10) == 0)
    {
      goto LABEL_12;
    }
    v11 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    if (a2) {
      v12 = @"durationUntilEventEnd";
    }
    else {
      v12 = @"duration_until_event_end";
    }
    [v4 setObject:v11 forKey:v12];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x100) == 0)
    {
LABEL_13:
      if ((v5 & 0x40) == 0) {
        goto LABEL_14;
      }
      goto LABEL_48;
    }
LABEL_44:
    v13 = [NSNumber numberWithDouble:*(double *)(a1 + 80)];
    if (a2) {
      v14 = @"startTime";
    }
    else {
      v14 = @"start_time";
    }
    [v4 setObject:v13 forKey:v14];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x40) == 0)
    {
LABEL_14:
      if ((v5 & 0x200) == 0) {
        goto LABEL_15;
      }
      goto LABEL_52;
    }
LABEL_48:
    v15 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    if (a2) {
      v16 = @"endTime";
    }
    else {
      v16 = @"end_time";
    }
    [v4 setObject:v15 forKey:v16];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x200) == 0)
    {
LABEL_15:
      if ((v5 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_53;
    }
LABEL_52:
    v17 = [NSNumber numberWithDouble:*(double *)(a1 + 88)];
    [v4 setObject:v17 forKey:@"temperature"];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 1) == 0)
    {
LABEL_16:
      if ((v5 & 2) == 0) {
        goto LABEL_17;
      }
      goto LABEL_57;
    }
LABEL_53:
    v18 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
    if (a2) {
      v19 = @"chanceOfPrecipitation";
    }
    else {
      v19 = @"chance_of_precipitation";
    }
    [v4 setObject:v18 forKey:v19];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 2) == 0)
    {
LABEL_17:
      if ((v5 & 4) == 0) {
        goto LABEL_18;
      }
      goto LABEL_61;
    }
LABEL_57:
    v20 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
    if (a2) {
      v21 = @"chanceOfRain";
    }
    else {
      v21 = @"chance_of_rain";
    }
    [v4 setObject:v20 forKey:v21];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 4) == 0)
    {
LABEL_18:
      if ((v5 & 0x400) == 0) {
        goto LABEL_19;
      }
      goto LABEL_65;
    }
LABEL_61:
    v22 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v23 = @"chanceOfSnow";
    }
    else {
      v23 = @"chance_of_snow";
    }
    [v4 setObject:v22 forKey:v23];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x400) == 0)
    {
LABEL_19:
      if ((v5 & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_69;
    }
LABEL_65:
    v24 = [NSNumber numberWithDouble:*(double *)(a1 + 96)];
    if (a2) {
      v25 = @"timeOfDay";
    }
    else {
      v25 = @"time_of_day";
    }
    [v4 setObject:v24 forKey:v25];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 8) == 0)
    {
LABEL_20:
      if ((v5 & 0x80) == 0) {
        goto LABEL_21;
      }
      goto LABEL_73;
    }
LABEL_69:
    v26 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    if (a2) {
      v27 = @"dayOfWeek";
    }
    else {
      v27 = @"day_of_week";
    }
    [v4 setObject:v26 forKey:v27];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x80) == 0)
    {
LABEL_21:
      if ((v5 & 0x400000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_77;
    }
LABEL_73:
    v28 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    if (a2) {
      v29 = @"isTourist";
    }
    else {
      v29 = @"is_tourist";
    }
    [v4 setObject:v28 forKey:v29];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x400000) == 0)
    {
LABEL_22:
      if ((v5 & 0x100000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_84;
    }
LABEL_77:
    uint64_t v30 = *(int *)(a1 + 180);
    if (v30 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 180));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E53F85F8[v30];
    }
    if (a2) {
      v32 = @"preferredTransportMode";
    }
    else {
      v32 = @"preferred_transport_mode";
    }
    [v4 setObject:v31 forKey:v32];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x100000) == 0)
    {
LABEL_23:
      if ((v5 & 0x8000000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_91;
    }
LABEL_84:
    uint64_t v33 = *(int *)(a1 + 172);
    if (v33 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 172));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E53F8050[v33];
    }
    if (a2) {
      v35 = @"mapType";
    }
    else {
      v35 = @"map_type";
    }
    [v4 setObject:v34 forKey:v35];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x8000000) == 0)
    {
LABEL_24:
      if ((v5 & 0x4000000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_95;
    }
LABEL_91:
    v36 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 194)];
    if (a2) {
      v37 = @"isTransitPossible";
    }
    else {
      v37 = @"is_transit_possible";
    }
    [v4 setObject:v36 forKey:v37];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x4000000) == 0)
    {
LABEL_25:
      if ((v5 & 0x800) == 0) {
        goto LABEL_26;
      }
      goto LABEL_99;
    }
LABEL_95:
    v38 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 193)];
    if (a2) {
      v39 = @"isInBasemode";
    }
    else {
      v39 = @"is_in_basemode";
    }
    [v4 setObject:v38 forKey:v39];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x800) == 0)
    {
LABEL_26:
      if ((v5 & 0x20000000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_103;
    }
LABEL_99:
    v40 = [NSNumber numberWithDouble:*(double *)(a1 + 104)];
    if (a2) {
      v41 = @"timeSinceBackgrounded";
    }
    else {
      v41 = @"time_since_backgrounded";
    }
    [v4 setObject:v40 forKey:v41];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x20000000) == 0)
    {
LABEL_27:
      if ((v5 & 0x200000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_107;
    }
LABEL_103:
    v42 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 196)];
    if (a2) {
      v43 = @"routePlanningScreenPresented";
    }
    else {
      v43 = @"route_planning_screen_presented";
    }
    [v4 setObject:v42 forKey:v43];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x200000) == 0)
    {
LABEL_28:
      if ((v5 & 0x1000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_114;
    }
LABEL_107:
    uint64_t v44 = *(int *)(a1 + 176);
    if (v44 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 176));
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = off_1E53F85F8[v44];
    }
    if (a2) {
      v46 = @"predictedTransportMode";
    }
    else {
      v46 = @"predicted_transport_mode";
    }
    [v4 setObject:v45 forKey:v46];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x1000) == 0)
    {
LABEL_29:
      if ((v5 & 0x20000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_121;
    }
LABEL_114:
    uint64_t v47 = *(int *)(a1 + 140);
    if (v47 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 140));
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = off_1E53F85F8[v47];
    }
    if (a2) {
      v49 = @"actualTransportMode";
    }
    else {
      v49 = @"actual_transport_mode";
    }
    [v4 setObject:v48 forKey:v49];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x20000) == 0)
    {
LABEL_30:
      if ((v5 & 0x4000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_128;
    }
LABEL_121:
    uint64_t v50 = *(int *)(a1 + 160);
    if (v50 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 160));
      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v51 = off_1E53F7A48[v50];
    }
    if (a2) {
      v52 = @"distanceFromHere";
    }
    else {
      v52 = @"distance_from_here";
    }
    [v4 setObject:v51 forKey:v52];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x4000) == 0)
    {
LABEL_31:
      if ((v5 & 0x40000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_135;
    }
LABEL_128:
    uint64_t v53 = *(int *)(a1 + 148);
    if (v53 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 148));
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v54 = off_1E53F7A48[v53];
    }
    if (a2) {
      v55 = @"distanceFromHereToOrigin";
    }
    else {
      v55 = @"distance_from_here_to_origin";
    }
    [v4 setObject:v54 forKey:v55];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x40000) == 0)
    {
LABEL_32:
      if ((v5 & 0x2000) == 0) {
        goto LABEL_33;
      }
      goto LABEL_142;
    }
LABEL_135:
    uint64_t v56 = *(int *)(a1 + 164);
    if (v56 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 164));
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = off_1E53F7A48[v56];
    }
    if (a2) {
      v58 = @"distanceFromOriginToDestination";
    }
    else {
      v58 = @"distance_from_origin_to_destination";
    }
    [v4 setObject:v57 forKey:v58];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x2000) == 0)
    {
LABEL_33:
      if ((v5 & 0x10000) == 0) {
        goto LABEL_34;
      }
      goto LABEL_149;
    }
LABEL_142:
    uint64_t v59 = *(int *)(a1 + 144);
    if (v59 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 144));
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = off_1E53F7A48[v59];
    }
    if (a2) {
      v61 = @"distanceFromHereToHome";
    }
    else {
      v61 = @"distance_from_here_to_home";
    }
    [v4 setObject:v60 forKey:v61];

    uint64_t v5 = *(void *)(a1 + 200);
    if ((v5 & 0x10000) == 0)
    {
LABEL_34:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_163;
      }
      goto LABEL_156;
    }
LABEL_149:
    uint64_t v62 = *(int *)(a1 + 156);
    if (v62 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 156));
      v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v63 = off_1E53F7A48[v62];
    }
    if (a2) {
      v64 = @"distanceFromHereToWork";
    }
    else {
      v64 = @"distance_from_here_to_work";
    }
    [v4 setObject:v63 forKey:v64];

    if ((*(void *)(a1 + 200) & 0x8000) == 0)
    {
LABEL_163:
      v68 = [(id)a1 userLocation];
      v69 = v68;
      if (v68)
      {
        if (a2)
        {
          v70 = [v68 jsonRepresentation];
          v71 = @"userLocation";
        }
        else
        {
          v70 = [v68 dictionaryRepresentation];
          v71 = @"user_location";
        }
        id v72 = v70;

        [v4 setObject:v72 forKey:v71];
      }

      v73 = [(id)a1 userLocationGeohash4];
      if (v73)
      {
        if (a2) {
          v74 = @"userLocationGeohash4";
        }
        else {
          v74 = @"user_location_geohash4";
        }
        [v4 setObject:v73 forKey:v74];
      }

      uint64_t v75 = *(void *)(a1 + 200);
      if ((v75 & 0x2000000) != 0)
      {
        v80 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 192)];
        if (a2) {
          v81 = @"isCarplayConnected";
        }
        else {
          v81 = @"is_carplay_connected";
        }
        [v4 setObject:v80 forKey:v81];

        uint64_t v75 = *(void *)(a1 + 200);
        if ((v75 & 0x1000000) == 0)
        {
LABEL_175:
          if ((v75 & 0x800000) == 0) {
            goto LABEL_176;
          }
          goto LABEL_197;
        }
      }
      else if ((v75 & 0x1000000) == 0)
      {
        goto LABEL_175;
      }
      unsigned int v82 = *(_DWORD *)(a1 + 188);
      if (v82 < 0x2E && ((0x3FFAAFFFFFFFuLL >> v82) & 1) != 0)
      {
        v83 = off_1E53F7A68[v82];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 188));
        v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2) {
        v84 = @"weatherType";
      }
      else {
        v84 = @"weather_type";
      }
      [v4 setObject:v83 forKey:v84];

      uint64_t v75 = *(void *)(a1 + 200);
      if ((v75 & 0x800000) == 0)
      {
LABEL_176:
        if ((v75 & 0x10000000) == 0)
        {
LABEL_181:
          id v78 = v4;

          goto LABEL_182;
        }
LABEL_177:
        v76 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 195)];
        if (a2) {
          v77 = @"isVehicleBluetoothConnected";
        }
        else {
          v77 = @"is_vehicle_bluetooth_connected";
        }
        [v4 setObject:v76 forKey:v77];

        goto LABEL_181;
      }
LABEL_197:
      v85 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 184)];
      if (a2) {
        v86 = @"weatherAqi";
      }
      else {
        v86 = @"weather_aqi";
      }
      [v4 setObject:v85 forKey:v86];

      if ((*(void *)(a1 + 200) & 0x10000000) == 0) {
        goto LABEL_181;
      }
      goto LABEL_177;
    }
LABEL_156:
    uint64_t v65 = *(int *)(a1 + 152);
    if (v65 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 152));
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v66 = off_1E53F7A48[v65];
    }
    if (a2) {
      v67 = @"distanceFromHereToParkedCar";
    }
    else {
      v67 = @"distance_from_here_to_parked_car";
    }
    [v4 setObject:v66 forKey:v67];

    goto LABEL_163;
  }
  id v78 = 0;
LABEL_182:

  return v78;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventPredExTrainingData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventPredExTrainingData)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPredExTrainingData *)-[GEOLogMsgEventPredExTrainingData _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_428;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_428;
  }
  if (a3) {
    uint64_t v6 = @"entryType";
  }
  else {
    uint64_t v6 = @"entry_type";
  }
  objc_super v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"HOME"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"WORK"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"CALENDAR_EVENT"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"FREQUENT_LOCATION"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"RECENT_HISTORY"])
    {
      uint64_t v9 = 5;
    }
    else if ([v8 isEqualToString:@"FAVORITE_PLACE"])
    {
      uint64_t v9 = 6;
    }
    else if ([v8 isEqualToString:@"PARKED_CAR"])
    {
      uint64_t v9 = 7;
    }
    else if ([v8 isEqualToString:@"RESTAURANT_RESERVATION"])
    {
      uint64_t v9 = 8;
    }
    else if ([v8 isEqualToString:@"RIDESHARING"])
    {
      uint64_t v9 = 9;
    }
    else if ([v8 isEqualToString:@"CARPLAY_LOW_ENERGY"])
    {
      uint64_t v9 = 10;
    }
    else if ([v8 isEqualToString:@"RESUME_ROUTE"])
    {
      uint64_t v9 = 11;
    }
    else if ([v8 isEqualToString:@"APP_CONNECTION"])
    {
      uint64_t v9 = 12;
    }
    else if ([v8 isEqualToString:@"HOTEL"])
    {
      uint64_t v9 = 13;
    }
    else if ([v8 isEqualToString:@"CAR_RENTAL"])
    {
      uint64_t v9 = 14;
    }
    else if ([v8 isEqualToString:@"TRAVEL_FLIGHT"])
    {
      uint64_t v9 = 15;
    }
    else if ([v8 isEqualToString:@"TICKETED_EVENT"])
    {
      uint64_t v9 = 16;
    }
    else if ([v8 isEqualToString:@"PORTRAIT"])
    {
      uint64_t v9 = 17;
    }
    else if ([v8 isEqualToString:@"USER_PLACE"])
    {
      uint64_t v9 = 18;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_50;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setEntryType:v9];
LABEL_50:

  if (a3) {
    v10 = @"durationUntilEventStart";
  }
  else {
    v10 = @"duration_until_event_start";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 doubleValue];
    objc_msgSend(a1, "setDurationUntilEventStart:");
  }

  if (a3) {
    v12 = @"durationUntilEventEnd";
  }
  else {
    v12 = @"duration_until_event_end";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v13 doubleValue];
    objc_msgSend(a1, "setDurationUntilEventEnd:");
  }

  if (a3) {
    v14 = @"startTime";
  }
  else {
    v14 = @"start_time";
  }
  v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v15 doubleValue];
    objc_msgSend(a1, "setStartTime:");
  }

  if (a3) {
    v16 = @"endTime";
  }
  else {
    v16 = @"end_time";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v17 doubleValue];
    objc_msgSend(a1, "setEndTime:");
  }

  v18 = [v5 objectForKeyedSubscript:@"temperature"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v18 doubleValue];
    objc_msgSend(a1, "setTemperature:");
  }

  if (a3) {
    v19 = @"chanceOfPrecipitation";
  }
  else {
    v19 = @"chance_of_precipitation";
  }
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v20 doubleValue];
    objc_msgSend(a1, "setChanceOfPrecipitation:");
  }

  if (a3) {
    v21 = @"chanceOfRain";
  }
  else {
    v21 = @"chance_of_rain";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v22 doubleValue];
    objc_msgSend(a1, "setChanceOfRain:");
  }

  if (a3) {
    v23 = @"chanceOfSnow";
  }
  else {
    v23 = @"chance_of_snow";
  }
  v24 = [v5 objectForKeyedSubscript:v23];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v24 doubleValue];
    objc_msgSend(a1, "setChanceOfSnow:");
  }

  if (a3) {
    v25 = @"timeOfDay";
  }
  else {
    v25 = @"time_of_day";
  }
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v26 doubleValue];
    objc_msgSend(a1, "setTimeOfDay:");
  }

  if (a3) {
    v27 = @"dayOfWeek";
  }
  else {
    v27 = @"day_of_week";
  }
  v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v28 doubleValue];
    objc_msgSend(a1, "setDayOfWeek:");
  }

  if (a3) {
    v29 = @"isTourist";
  }
  else {
    v29 = @"is_tourist";
  }
  uint64_t v30 = [v5 objectForKeyedSubscript:v29];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v30 doubleValue];
    objc_msgSend(a1, "setIsTourist:");
  }

  if (a3) {
    v31 = @"preferredTransportMode";
  }
  else {
    v31 = @"preferred_transport_mode";
  }
  v32 = [v5 objectForKeyedSubscript:v31];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v32;
    if ([v33 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
    {
      uint64_t v34 = 0;
    }
    else if ([v33 isEqualToString:@"DRIVING_MODE"])
    {
      uint64_t v34 = 1;
    }
    else if ([v33 isEqualToString:@"WALKING_MODE"])
    {
      uint64_t v34 = 2;
    }
    else if ([v33 isEqualToString:@"TRANSIT_MODE"])
    {
      uint64_t v34 = 3;
    }
    else if ([v33 isEqualToString:@"RIDESHARE_MODE"])
    {
      uint64_t v34 = 4;
    }
    else if ([v33 isEqualToString:@"CYCLING_MODE"])
    {
      uint64_t v34 = 5;
    }
    else
    {
      uint64_t v34 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_123;
    }
    uint64_t v34 = [v32 intValue];
  }
  [a1 setPreferredTransportMode:v34];
LABEL_123:

  if (a3) {
    v35 = @"mapType";
  }
  else {
    v35 = @"map_type";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v37 = v36;
    if ([v37 isEqualToString:@"MAP_TYPE_NONE"])
    {
      uint64_t v38 = 0;
    }
    else if ([v37 isEqualToString:@"MAP_TYPE_STANDARD"])
    {
      uint64_t v38 = 1;
    }
    else if ([v37 isEqualToString:@"MAP_TYPE_SATELLITE"])
    {
      uint64_t v38 = 2;
    }
    else if ([v37 isEqualToString:@"MAP_TYPE_HYBRID"])
    {
      uint64_t v38 = 3;
    }
    else if ([v37 isEqualToString:@"MAP_TYPE_TRANSIT"])
    {
      uint64_t v38 = 4;
    }
    else
    {
      uint64_t v38 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_142;
    }
    uint64_t v38 = [v36 intValue];
  }
  [a1 setMapType:v38];
LABEL_142:

  if (a3) {
    v39 = @"isTransitPossible";
  }
  else {
    v39 = @"is_transit_possible";
  }
  v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsTransitPossible:", objc_msgSend(v40, "BOOLValue"));
  }

  if (a3) {
    v41 = @"isInBasemode";
  }
  else {
    v41 = @"is_in_basemode";
  }
  v42 = [v5 objectForKeyedSubscript:v41];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsInBasemode:", objc_msgSend(v42, "BOOLValue"));
  }

  if (a3) {
    v43 = @"timeSinceBackgrounded";
  }
  else {
    v43 = @"time_since_backgrounded";
  }
  uint64_t v44 = [v5 objectForKeyedSubscript:v43];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v44 doubleValue];
    objc_msgSend(a1, "setTimeSinceBackgrounded:");
  }

  if (a3) {
    v45 = @"routePlanningScreenPresented";
  }
  else {
    v45 = @"route_planning_screen_presented";
  }
  v46 = [v5 objectForKeyedSubscript:v45];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setRoutePlanningScreenPresented:", objc_msgSend(v46, "BOOLValue"));
  }

  if (a3) {
    uint64_t v47 = @"predictedTransportMode";
  }
  else {
    uint64_t v47 = @"predicted_transport_mode";
  }
  v48 = [v5 objectForKeyedSubscript:v47];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v49 = v48;
    if ([v49 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
    {
      uint64_t v50 = 0;
    }
    else if ([v49 isEqualToString:@"DRIVING_MODE"])
    {
      uint64_t v50 = 1;
    }
    else if ([v49 isEqualToString:@"WALKING_MODE"])
    {
      uint64_t v50 = 2;
    }
    else if ([v49 isEqualToString:@"TRANSIT_MODE"])
    {
      uint64_t v50 = 3;
    }
    else if ([v49 isEqualToString:@"RIDESHARE_MODE"])
    {
      uint64_t v50 = 4;
    }
    else if ([v49 isEqualToString:@"CYCLING_MODE"])
    {
      uint64_t v50 = 5;
    }
    else
    {
      uint64_t v50 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_183;
    }
    uint64_t v50 = [v48 intValue];
  }
  [a1 setPredictedTransportMode:v50];
LABEL_183:

  if (a3) {
    v51 = @"actualTransportMode";
  }
  else {
    v51 = @"actual_transport_mode";
  }
  v52 = [v5 objectForKeyedSubscript:v51];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = v52;
    if ([v53 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
    {
      uint64_t v54 = 0;
    }
    else if ([v53 isEqualToString:@"DRIVING_MODE"])
    {
      uint64_t v54 = 1;
    }
    else if ([v53 isEqualToString:@"WALKING_MODE"])
    {
      uint64_t v54 = 2;
    }
    else if ([v53 isEqualToString:@"TRANSIT_MODE"])
    {
      uint64_t v54 = 3;
    }
    else if ([v53 isEqualToString:@"RIDESHARE_MODE"])
    {
      uint64_t v54 = 4;
    }
    else if ([v53 isEqualToString:@"CYCLING_MODE"])
    {
      uint64_t v54 = 5;
    }
    else
    {
      uint64_t v54 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_204;
    }
    uint64_t v54 = [v52 intValue];
  }
  [a1 setActualTransportMode:v54];
LABEL_204:

  if (a3) {
    v55 = @"distanceFromHere";
  }
  else {
    v55 = @"distance_from_here";
  }
  uint64_t v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v57 = v56;
    if ([v57 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v58 = 0;
    }
    else if ([v57 isEqualToString:@"VERY_NEAR"])
    {
      uint64_t v58 = 1;
    }
    else if ([v57 isEqualToString:@"WALKING_DISTANCE"])
    {
      uint64_t v58 = 2;
    }
    else if ([v57 isEqualToString:@"FAR"])
    {
      uint64_t v58 = 3;
    }
    else
    {
      uint64_t v58 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_221;
    }
    uint64_t v58 = [v56 intValue];
  }
  [a1 setDistanceFromHere:v58];
LABEL_221:

  if (a3) {
    uint64_t v59 = @"distanceFromHereToOrigin";
  }
  else {
    uint64_t v59 = @"distance_from_here_to_origin";
  }
  v60 = [v5 objectForKeyedSubscript:v59];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v61 = v60;
    if ([v61 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v62 = 0;
    }
    else if ([v61 isEqualToString:@"VERY_NEAR"])
    {
      uint64_t v62 = 1;
    }
    else if ([v61 isEqualToString:@"WALKING_DISTANCE"])
    {
      uint64_t v62 = 2;
    }
    else if ([v61 isEqualToString:@"FAR"])
    {
      uint64_t v62 = 3;
    }
    else
    {
      uint64_t v62 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_238;
    }
    uint64_t v62 = [v60 intValue];
  }
  [a1 setDistanceFromHereToOrigin:v62];
LABEL_238:

  if (a3) {
    v63 = @"distanceFromOriginToDestination";
  }
  else {
    v63 = @"distance_from_origin_to_destination";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v65 = v64;
    if ([v65 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v66 = 0;
    }
    else if ([v65 isEqualToString:@"VERY_NEAR"])
    {
      uint64_t v66 = 1;
    }
    else if ([v65 isEqualToString:@"WALKING_DISTANCE"])
    {
      uint64_t v66 = 2;
    }
    else if ([v65 isEqualToString:@"FAR"])
    {
      uint64_t v66 = 3;
    }
    else
    {
      uint64_t v66 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_255;
    }
    uint64_t v66 = [v64 intValue];
  }
  [a1 setDistanceFromOriginToDestination:v66];
LABEL_255:

  if (a3) {
    v67 = @"distanceFromHereToHome";
  }
  else {
    v67 = @"distance_from_here_to_home";
  }
  v68 = [v5 objectForKeyedSubscript:v67];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v69 = v68;
    if ([v69 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v70 = 0;
    }
    else if ([v69 isEqualToString:@"VERY_NEAR"])
    {
      uint64_t v70 = 1;
    }
    else if ([v69 isEqualToString:@"WALKING_DISTANCE"])
    {
      uint64_t v70 = 2;
    }
    else if ([v69 isEqualToString:@"FAR"])
    {
      uint64_t v70 = 3;
    }
    else
    {
      uint64_t v70 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_272;
    }
    uint64_t v70 = [v68 intValue];
  }
  [a1 setDistanceFromHereToHome:v70];
LABEL_272:

  if (a3) {
    v71 = @"distanceFromHereToWork";
  }
  else {
    v71 = @"distance_from_here_to_work";
  }
  id v72 = [v5 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v73 = v72;
    if ([v73 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v74 = 0;
    }
    else if ([v73 isEqualToString:@"VERY_NEAR"])
    {
      uint64_t v74 = 1;
    }
    else if ([v73 isEqualToString:@"WALKING_DISTANCE"])
    {
      uint64_t v74 = 2;
    }
    else if ([v73 isEqualToString:@"FAR"])
    {
      uint64_t v74 = 3;
    }
    else
    {
      uint64_t v74 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_289;
    }
    uint64_t v74 = [v72 intValue];
  }
  [a1 setDistanceFromHereToWork:v74];
LABEL_289:

  if (a3) {
    uint64_t v75 = @"distanceFromHereToParkedCar";
  }
  else {
    uint64_t v75 = @"distance_from_here_to_parked_car";
  }
  v76 = [v5 objectForKeyedSubscript:v75];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v77 = v76;
    if ([v77 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v78 = 0;
    }
    else if ([v77 isEqualToString:@"VERY_NEAR"])
    {
      uint64_t v78 = 1;
    }
    else if ([v77 isEqualToString:@"WALKING_DISTANCE"])
    {
      uint64_t v78 = 2;
    }
    else if ([v77 isEqualToString:@"FAR"])
    {
      uint64_t v78 = 3;
    }
    else
    {
      uint64_t v78 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_306;
    }
    uint64_t v78 = [v76 intValue];
  }
  [a1 setDistanceFromHereToParkedCar:v78];
LABEL_306:

  if (a3) {
    v79 = @"userLocation";
  }
  else {
    v79 = @"user_location";
  }
  v80 = [v5 objectForKeyedSubscript:v79];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v81 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v82 = [(GEOLatLng *)v81 initWithJSON:v80];
    }
    else {
      uint64_t v82 = [(GEOLatLng *)v81 initWithDictionary:v80];
    }
    v83 = (void *)v82;
    [a1 setUserLocation:v82];
  }
  if (a3) {
    v84 = @"userLocationGeohash4";
  }
  else {
    v84 = @"user_location_geohash4";
  }
  v85 = [v5 objectForKeyedSubscript:v84];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v86 = (void *)[v85 copy];
    [a1 setUserLocationGeohash4:v86];
  }
  if (a3) {
    v87 = @"isCarplayConnected";
  }
  else {
    v87 = @"is_carplay_connected";
  }
  v88 = [v5 objectForKeyedSubscript:v87];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsCarplayConnected:", objc_msgSend(v88, "BOOLValue"));
  }

  if (a3) {
    v89 = @"weatherType";
  }
  else {
    v89 = @"weather_type";
  }
  v90 = [v5 objectForKeyedSubscript:v89];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v91 = v90;
    if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_NOT_AVAILABLE"])
    {
      uint64_t v92 = 0;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_TORNADO"])
    {
      uint64_t v92 = 1;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_TROPICAL_STORM"])
    {
      uint64_t v92 = 2;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HURRICANE"])
    {
      uint64_t v92 = 3;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SEVERE_THUNDERSTORMS"])
    {
      uint64_t v92 = 4;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_THUNDERSTORMS"])
    {
      uint64_t v92 = 5;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_SNOW"])
    {
      uint64_t v92 = 6;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_SLEET"])
    {
      uint64_t v92 = 7;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MIXED_SNOW_AND_SLEET"])
    {
      uint64_t v92 = 8;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_FREEZING_DRIZZLE"])
    {
      uint64_t v92 = 9;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_DRIZZLE"])
    {
      uint64_t v92 = 10;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_FREEZING_RAIN"])
    {
      uint64_t v92 = 11;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SHOWERS"])
    {
      uint64_t v92 = 12;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_RAIN"])
    {
      uint64_t v92 = 13;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SNOW_FLURRIES"])
    {
      uint64_t v92 = 14;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_LIGHT_SNOW_SHOWERS"])
    {
      uint64_t v92 = 15;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_BLOWING_SNOW"])
    {
      uint64_t v92 = 16;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SNOW"])
    {
      uint64_t v92 = 17;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HAIL"])
    {
      uint64_t v92 = 18;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SLEET"])
    {
      uint64_t v92 = 19;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_DUST"])
    {
      uint64_t v92 = 20;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_FOGGY"])
    {
      uint64_t v92 = 21;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HAZE"])
    {
      uint64_t v92 = 22;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SMOKY"])
    {
      uint64_t v92 = 23;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_BLUSTERY"])
    {
      uint64_t v92 = 24;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_WINDY"])
    {
      uint64_t v92 = 25;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_COLD"])
    {
      uint64_t v92 = 26;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_CLOUDY"])
    {
      uint64_t v92 = 27;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MOSTLY_CLOUDY"])
    {
      uint64_t v92 = 29;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_PARTLY_CLOUDY"])
    {
      uint64_t v92 = 31;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_CLEAR"])
    {
      uint64_t v92 = 33;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MOSTLY_CLEAR"])
    {
      uint64_t v92 = 35;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_MIXED_RAIN_AND_HAIL"])
    {
      uint64_t v92 = 36;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HOT"])
    {
      uint64_t v92 = 37;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_ISOLATED_THUNDERSTORMS"])
    {
      uint64_t v92 = 38;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SCATTERED_THUNDERSTORMS"])
    {
      uint64_t v92 = 39;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SCATTERED_SHOWERS"])
    {
      uint64_t v92 = 40;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HEAVY_RAIN"])
    {
      uint64_t v92 = 41;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_SCATTERED_SNOW_SHOWERS"])
    {
      uint64_t v92 = 42;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_HEAVY_SNOW"])
    {
      uint64_t v92 = 43;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_BLIZZARD"])
    {
      uint64_t v92 = 44;
    }
    else if ([v91 isEqualToString:@"MSG_WEATHER_TYPE_CONDITION_ISOLATED_THUNDERSHOWERS"])
    {
      uint64_t v92 = 45;
    }
    else
    {
      uint64_t v92 = 0;
    }

    goto LABEL_416;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v92 = [v90 intValue];
LABEL_416:
    [a1 setWeatherType:v92];
  }

  if (a3) {
    v93 = @"weatherAqi";
  }
  else {
    v93 = @"weather_aqi";
  }
  v94 = [v5 objectForKeyedSubscript:v93];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWeatherAqi:", objc_msgSend(v94, "unsignedIntValue"));
  }

  if (a3) {
    v95 = @"isVehicleBluetoothConnected";
  }
  else {
    v95 = @"is_vehicle_bluetooth_connected";
  }
  v96 = [v5 objectForKeyedSubscript:v95];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsVehicleBluetoothConnected:", objc_msgSend(v96, "BOOLValue"));
  }

  a1 = a1;
LABEL_428:

  return a1;
}

- (GEOLogMsgEventPredExTrainingData)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPredExTrainingData *)-[GEOLogMsgEventPredExTrainingData _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_4489;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_4490;
    }
    GEOLogMsgEventPredExTrainingDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLatLng *)self->_userLocation readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPredExTrainingDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPredExTrainingDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(void *)&self->_flags & 0x1C0000000) == 0)
    {
      objc_super v7 = self->_reader;
      objc_sync_enter(v7);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      id v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v9 writeData:v8];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v7);
      goto LABEL_70;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOLogMsgEventPredExTrainingData *)self readAll:0];
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_5:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x400000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&flags & 0x100000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&flags & 0x8000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x8000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x4000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteBOOLField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteBOOLField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&flags & 0x20000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteDoubleField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&flags & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&flags & 0x1000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&flags & 0x20000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&flags & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&flags & 0x40000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt32Field();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt32Field();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&flags & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt32Field();
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&flags & 0x8000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_flags & 0x8000) != 0) {
LABEL_29:
  }
    PBDataWriterWriteInt32Field();
LABEL_30:
  if (self->_userLocation) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_userLocationGeohash4) {
    PBDataWriterWriteStringField();
  }
  $A2888D52E07BB247939D0F55CC592477 v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $A2888D52E07BB247939D0F55CC592477 v6 = self->_flags;
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v6 & 0x800000) == 0) {
        goto LABEL_37;
      }
LABEL_67:
      PBDataWriterWriteUint32Field();
      if ((*(void *)&self->_flags & 0x10000000) == 0) {
        goto LABEL_70;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt32Field();
  $A2888D52E07BB247939D0F55CC592477 v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x800000) != 0) {
    goto LABEL_67;
  }
LABEL_37:
  if ((*(_DWORD *)&v6 & 0x10000000) != 0) {
LABEL_68:
  }
    PBDataWriterWriteBOOLField();
LABEL_70:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOLogMsgEventPredExTrainingData _readUserLocation]((uint64_t)self);
  userLocation = self->_userLocation;

  return [(GEOLatLng *)userLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v7 = (id *)a3;
  [(GEOLogMsgEventPredExTrainingData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 32) = self->_readerMarkPos;
  *((_DWORD *)v7 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  int v4 = v7;
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    *((_DWORD *)v7 + 42) = self->_entryType;
    v7[25] = (id)((unint64_t)v7[25] | 0x80000);
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x20) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&flags & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v7[7] = *(id *)&self->_durationUntilEventStart;
  v7[25] = (id)((unint64_t)v7[25] | 0x20);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&flags & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_43;
  }
LABEL_42:
  v7[6] = *(id *)&self->_durationUntilEventEnd;
  v7[25] = (id)((unint64_t)v7[25] | 0x10);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&flags & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_44;
  }
LABEL_43:
  v7[10] = *(id *)&self->_startTime;
  v7[25] = (id)((unint64_t)v7[25] | 0x100);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x40) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_45;
  }
LABEL_44:
  v7[8] = *(id *)&self->_endTime;
  v7[25] = (id)((unint64_t)v7[25] | 0x40);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&flags & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_46;
  }
LABEL_45:
  v7[11] = *(id *)&self->_temperature;
  v7[25] = (id)((unint64_t)v7[25] | 0x200);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 1) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_47;
  }
LABEL_46:
  v7[2] = *(id *)&self->_chanceOfPrecipitation;
  v7[25] = (id)((unint64_t)v7[25] | 1);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 2) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_48;
  }
LABEL_47:
  v7[3] = *(id *)&self->_chanceOfRain;
  v7[25] = (id)((unint64_t)v7[25] | 2);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_49;
  }
LABEL_48:
  v7[4] = *(id *)&self->_chanceOfSnow;
  v7[25] = (id)((unint64_t)v7[25] | 4);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_50;
  }
LABEL_49:
  v7[12] = *(id *)&self->_timeOfDay;
  v7[25] = (id)((unint64_t)v7[25] | 0x400);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_51;
  }
LABEL_50:
  v7[5] = *(id *)&self->_dayOfWeek;
  v7[25] = (id)((unint64_t)v7[25] | 8);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&flags & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_52;
  }
LABEL_51:
  v7[9] = *(id *)&self->_isTourist;
  v7[25] = (id)((unint64_t)v7[25] | 0x80);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&flags & 0x100000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v7 + 45) = self->_preferredTransportMode;
  v7[25] = (id)((unint64_t)v7[25] | 0x400000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x8000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v7 + 43) = self->_mapType;
  v7[25] = (id)((unint64_t)v7[25] | 0x100000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x8000000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&flags & 0x4000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((unsigned char *)v7 + 194) = self->_isTransitPossible;
  v7[25] = (id)((unint64_t)v7[25] | 0x8000000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x4000000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&flags & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((unsigned char *)v7 + 193) = self->_isInBasemode;
  v7[25] = (id)((unint64_t)v7[25] | 0x4000000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&flags & 0x20000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_57;
  }
LABEL_56:
  v7[13] = *(id *)&self->_timeSinceBackgrounded;
  v7[25] = (id)((unint64_t)v7[25] | 0x800);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&flags & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((unsigned char *)v7 + 196) = self->_routePlanningScreenPresented;
  v7[25] = (id)((unint64_t)v7[25] | 0x20000000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&flags & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v7 + 44) = self->_predictedTransportMode;
  v7[25] = (id)((unint64_t)v7[25] | 0x200000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x1000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&flags & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v7 + 35) = self->_actualTransportMode;
  v7[25] = (id)((unint64_t)v7[25] | 0x1000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&flags & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v7 + 40) = self->_distanceFromHere;
  v7[25] = (id)((unint64_t)v7[25] | 0x20000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&flags & 0x40000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)v7 + 37) = self->_distanceFromHereToOrigin;
  v7[25] = (id)((unint64_t)v7[25] | 0x4000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&flags & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)v7 + 41) = self->_distanceFromOriginToDestination;
  v7[25] = (id)((unint64_t)v7[25] | 0x40000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x2000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&flags & 0x10000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)v7 + 36) = self->_distanceFromHereToHome;
  v7[25] = (id)((unint64_t)v7[25] | 0x2000);
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x10000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&flags & 0x8000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_64:
  *((_DWORD *)v7 + 39) = self->_distanceFromHereToWork;
  v7[25] = (id)((unint64_t)v7[25] | 0x10000);
  if ((*(void *)&self->_flags & 0x8000) != 0)
  {
LABEL_27:
    *((_DWORD *)v7 + 38) = self->_distanceFromHereToParkedCar;
    v7[25] = (id)((unint64_t)v7[25] | 0x8000);
  }
LABEL_28:
  if (self->_userLocation)
  {
    objc_msgSend(v7, "setUserLocation:");
    int v4 = v7;
  }
  if (self->_userLocationGeohash4)
  {
    objc_msgSend(v7, "setUserLocationGeohash4:");
    int v4 = v7;
  }
  $A2888D52E07BB247939D0F55CC592477 v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    *((unsigned char *)v4 + 192) = self->_isCarplayConnected;
    v4[25] = (id)((unint64_t)v4[25] | 0x2000000);
    $A2888D52E07BB247939D0F55CC592477 v6 = self->_flags;
    if ((*(_DWORD *)&v6 & 0x1000000) == 0)
    {
LABEL_34:
      if ((*(_DWORD *)&v6 & 0x800000) == 0) {
        goto LABEL_35;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
    goto LABEL_34;
  }
  *((_DWORD *)v4 + 47) = self->_weatherType;
  v4[25] = (id)((unint64_t)v4[25] | 0x1000000);
  $A2888D52E07BB247939D0F55CC592477 v6 = self->_flags;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_68:
  *((_DWORD *)v4 + 46) = self->_weatherAqi;
  v4[25] = (id)((unint64_t)v4[25] | 0x800000);
  if ((*(void *)&self->_flags & 0x10000000) != 0)
  {
LABEL_36:
    *((unsigned char *)v4 + 195) = self->_isVehicleBluetoothConnected;
    v4[25] = (id)((unint64_t)v4[25] | 0x10000000);
  }
LABEL_37:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventPredExTrainingData *)self readAll:0];
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x80000) != 0)
    {
      *(_DWORD *)(v5 + 168) = self->_entryType;
      *(void *)(v5 + 200) |= 0x80000uLL;
      $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
      if ((*(unsigned char *)&flags & 0x20) == 0)
      {
LABEL_7:
        if ((*(unsigned char *)&flags & 0x10) == 0) {
          goto LABEL_8;
        }
        goto LABEL_40;
      }
    }
    else if ((*(unsigned char *)&flags & 0x20) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 56) = self->_durationUntilEventStart;
    *(void *)(v5 + 200) |= 0x20uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x10) == 0)
    {
LABEL_8:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_9;
      }
      goto LABEL_41;
    }
LABEL_40:
    *(double *)(v5 + 48) = self->_durationUntilEventEnd;
    *(void *)(v5 + 200) |= 0x10uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&flags & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_42;
    }
LABEL_41:
    *(double *)(v5 + 80) = self->_startTime;
    *(void *)(v5 + 200) |= 0x100uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x40) == 0)
    {
LABEL_10:
      if ((*(_WORD *)&flags & 0x200) == 0) {
        goto LABEL_11;
      }
      goto LABEL_43;
    }
LABEL_42:
    *(double *)(v5 + 64) = self->_endTime;
    *(void *)(v5 + 200) |= 0x40uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x200) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&flags & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_44;
    }
LABEL_43:
    *(double *)(v5 + 88) = self->_temperature;
    *(void *)(v5 + 200) |= 0x200uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(unsigned char *)&flags & 1) == 0)
    {
LABEL_12:
      if ((*(unsigned char *)&flags & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_45;
    }
LABEL_44:
    *(double *)(v5 + 16) = self->_chanceOfPrecipitation;
    *(void *)(v5 + 200) |= 1uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(unsigned char *)&flags & 2) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&flags & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_46;
    }
LABEL_45:
    *(double *)(v5 + 24) = self->_chanceOfRain;
    *(void *)(v5 + 200) |= 2uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&flags & 0x400) == 0) {
        goto LABEL_15;
      }
      goto LABEL_47;
    }
LABEL_46:
    *(double *)(v5 + 32) = self->_chanceOfSnow;
    *(void *)(v5 + 200) |= 4uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x400) == 0)
    {
LABEL_15:
      if ((*(unsigned char *)&flags & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_48;
    }
LABEL_47:
    *(double *)(v5 + 96) = self->_timeOfDay;
    *(void *)(v5 + 200) |= 0x400uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(unsigned char *)&flags & 8) == 0)
    {
LABEL_16:
      if ((*(unsigned char *)&flags & 0x80) == 0) {
        goto LABEL_17;
      }
      goto LABEL_49;
    }
LABEL_48:
    *(double *)(v5 + 40) = self->_dayOfWeek;
    *(void *)(v5 + 200) |= 8uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(unsigned char *)&flags & 0x80) == 0)
    {
LABEL_17:
      if ((*(_DWORD *)&flags & 0x400000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_50;
    }
LABEL_49:
    *(double *)(v5 + 72) = self->_isTourist;
    *(void *)(v5 + 200) |= 0x80uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x400000) == 0)
    {
LABEL_18:
      if ((*(_DWORD *)&flags & 0x100000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_51;
    }
LABEL_50:
    *(_DWORD *)(v5 + 180) = self->_preferredTransportMode;
    *(void *)(v5 + 200) |= 0x400000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x100000) == 0)
    {
LABEL_19:
      if ((*(_DWORD *)&flags & 0x8000000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_52;
    }
LABEL_51:
    *(_DWORD *)(v5 + 172) = self->_mapType;
    *(void *)(v5 + 200) |= 0x100000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x8000000) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&flags & 0x4000000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_53;
    }
LABEL_52:
    *(unsigned char *)(v5 + 194) = self->_isTransitPossible;
    *(void *)(v5 + 200) |= 0x8000000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x4000000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&flags & 0x800) == 0) {
        goto LABEL_22;
      }
      goto LABEL_54;
    }
LABEL_53:
    *(unsigned char *)(v5 + 193) = self->_isInBasemode;
    *(void *)(v5 + 200) |= 0x4000000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_22:
      if ((*(_DWORD *)&flags & 0x20000000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_55;
    }
LABEL_54:
    *(double *)(v5 + 104) = self->_timeSinceBackgrounded;
    *(void *)(v5 + 200) |= 0x800uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x20000000) == 0)
    {
LABEL_23:
      if ((*(_DWORD *)&flags & 0x200000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_56;
    }
LABEL_55:
    *(unsigned char *)(v5 + 196) = self->_routePlanningScreenPresented;
    *(void *)(v5 + 200) |= 0x20000000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x200000) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&flags & 0x1000) == 0) {
        goto LABEL_25;
      }
      goto LABEL_57;
    }
LABEL_56:
    *(_DWORD *)(v5 + 176) = self->_predictedTransportMode;
    *(void *)(v5 + 200) |= 0x200000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x1000) == 0)
    {
LABEL_25:
      if ((*(_DWORD *)&flags & 0x20000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_58;
    }
LABEL_57:
    *(_DWORD *)(v5 + 140) = self->_actualTransportMode;
    *(void *)(v5 + 200) |= 0x1000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x20000) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&flags & 0x4000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_59;
    }
LABEL_58:
    *(_DWORD *)(v5 + 160) = self->_distanceFromHere;
    *(void *)(v5 + 200) |= 0x20000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x4000) == 0)
    {
LABEL_27:
      if ((*(_DWORD *)&flags & 0x40000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_60;
    }
LABEL_59:
    *(_DWORD *)(v5 + 148) = self->_distanceFromHereToOrigin;
    *(void *)(v5 + 200) |= 0x4000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x40000) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&flags & 0x2000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_61;
    }
LABEL_60:
    *(_DWORD *)(v5 + 164) = self->_distanceFromOriginToDestination;
    *(void *)(v5 + 200) |= 0x40000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x2000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&flags & 0x10000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_62;
    }
LABEL_61:
    *(_DWORD *)(v5 + 144) = self->_distanceFromHereToHome;
    *(void *)(v5 + 200) |= 0x2000uLL;
    $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
    if ((*(_DWORD *)&flags & 0x10000) == 0)
    {
LABEL_30:
      if ((*(_WORD *)&flags & 0x8000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
LABEL_62:
    *(_DWORD *)(v5 + 156) = self->_distanceFromHereToWork;
    *(void *)(v5 + 200) |= 0x10000uLL;
    if ((*(void *)&self->_flags & 0x8000) == 0)
    {
LABEL_32:
      id v10 = [(GEOLatLng *)self->_userLocation copyWithZone:a3];
      v11 = *(void **)(v5 + 120);
      *(void *)(v5 + 120) = v10;

      uint64_t v12 = [(NSString *)self->_userLocationGeohash4 copyWithZone:a3];
      v13 = *(void **)(v5 + 112);
      *(void *)(v5 + 112) = v12;

      $A2888D52E07BB247939D0F55CC592477 v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x2000000) != 0)
      {
        *(unsigned char *)(v5 + 192) = self->_isCarplayConnected;
        *(void *)(v5 + 200) |= 0x2000000uLL;
        $A2888D52E07BB247939D0F55CC592477 v14 = self->_flags;
        if ((*(_DWORD *)&v14 & 0x1000000) == 0)
        {
LABEL_34:
          if ((*(_DWORD *)&v14 & 0x800000) == 0) {
            goto LABEL_35;
          }
          goto LABEL_66;
        }
      }
      else if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      {
        goto LABEL_34;
      }
      *(_DWORD *)(v5 + 188) = self->_weatherType;
      *(void *)(v5 + 200) |= 0x1000000uLL;
      $A2888D52E07BB247939D0F55CC592477 v14 = self->_flags;
      if ((*(_DWORD *)&v14 & 0x800000) == 0)
      {
LABEL_35:
        if ((*(_DWORD *)&v14 & 0x10000000) == 0) {
          return (id)v5;
        }
LABEL_36:
        *(unsigned char *)(v5 + 195) = self->_isVehicleBluetoothConnected;
        *(void *)(v5 + 200) |= 0x10000000uLL;
        return (id)v5;
      }
LABEL_66:
      *(_DWORD *)(v5 + 184) = self->_weatherAqi;
      *(void *)(v5 + 200) |= 0x800000uLL;
      if ((*(void *)&self->_flags & 0x10000000) == 0) {
        return (id)v5;
      }
      goto LABEL_36;
    }
LABEL_31:
    *(_DWORD *)(v5 + 152) = self->_distanceFromHereToParkedCar;
    *(void *)(v5 + 200) |= 0x8000uLL;
    goto LABEL_32;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if (*((unsigned char *)&self->_flags + 4))
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventPredExTrainingDataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_166;
  }
  [(GEOLogMsgEventPredExTrainingData *)self readAll:1];
  [v4 readAll:1];
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  uint64_t v6 = *((void *)v4 + 25);
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_entryType != *((_DWORD *)v4 + 42)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_durationUntilEventStart != *((double *)v4 + 7)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_166;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_durationUntilEventEnd != *((double *)v4 + 6)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_startTime != *((double *)v4 + 10)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_166;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_endTime != *((double *)v4 + 8)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_temperature != *((double *)v4 + 11)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_166;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_chanceOfPrecipitation != *((double *)v4 + 2)) {
      goto LABEL_166;
    }
  }
  else if (v6)
  {
    goto LABEL_166;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_chanceOfRain != *((double *)v4 + 3)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_166;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_chanceOfSnow != *((double *)v4 + 4)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_timeOfDay != *((double *)v4 + 12)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_166;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_dayOfWeek != *((double *)v4 + 5)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_166;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_isTourist != *((double *)v4 + 9)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_preferredTransportMode != *((_DWORD *)v4 + 45)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_mapType != *((_DWORD *)v4 + 43)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_166;
    }
    if (self->_isTransitPossible)
    {
      if (!*((unsigned char *)v4 + 194)) {
        goto LABEL_166;
      }
    }
    else if (*((unsigned char *)v4 + 194))
    {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_166;
    }
    if (self->_isInBasemode)
    {
      if (!*((unsigned char *)v4 + 193)) {
        goto LABEL_166;
      }
    }
    else if (*((unsigned char *)v4 + 193))
    {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_timeSinceBackgrounded != *((double *)v4 + 13)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0) {
      goto LABEL_166;
    }
    if (self->_routePlanningScreenPresented)
    {
      if (!*((unsigned char *)v4 + 196)) {
        goto LABEL_166;
      }
    }
    else if (*((unsigned char *)v4 + 196))
    {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_predictedTransportMode != *((_DWORD *)v4 + 44)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_actualTransportMode != *((_DWORD *)v4 + 35)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_distanceFromHere != *((_DWORD *)v4 + 40)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_distanceFromHereToOrigin != *((_DWORD *)v4 + 37)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_distanceFromOriginToDestination != *((_DWORD *)v4 + 41)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_distanceFromHereToHome != *((_DWORD *)v4 + 36)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_distanceFromHereToWork != *((_DWORD *)v4 + 39)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_distanceFromHereToParkedCar != *((_DWORD *)v4 + 38)) {
      goto LABEL_166;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_166;
  }
  userLocation = self->_userLocation;
  if ((unint64_t)userLocation | *((void *)v4 + 15) && !-[GEOLatLng isEqual:](userLocation, "isEqual:")) {
    goto LABEL_166;
  }
  userLocationGeohash4 = self->_userLocationGeohash4;
  if ((unint64_t)userLocationGeohash4 | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](userLocationGeohash4, "isEqual:")) {
      goto LABEL_166;
    }
  }
  $A2888D52E07BB247939D0F55CC592477 v9 = self->_flags;
  uint64_t v10 = *((void *)v4 + 25);
  if ((*(_DWORD *)&v9 & 0x2000000) != 0)
  {
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_166;
    }
    if (self->_isCarplayConnected)
    {
      if (!*((unsigned char *)v4 + 192)) {
        goto LABEL_166;
      }
    }
    else if (*((unsigned char *)v4 + 192))
    {
      goto LABEL_166;
    }
  }
  else if ((v10 & 0x2000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
    if ((v10 & 0x1000000) == 0 || self->_weatherType != *((_DWORD *)v4 + 47)) {
      goto LABEL_166;
    }
  }
  else if ((v10 & 0x1000000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&v9 & 0x800000) != 0)
  {
    if ((v10 & 0x800000) == 0 || self->_weatherAqi != *((_DWORD *)v4 + 46)) {
      goto LABEL_166;
    }
  }
  else if ((v10 & 0x800000) != 0)
  {
    goto LABEL_166;
  }
  if ((*(_DWORD *)&v9 & 0x10000000) != 0)
  {
    if ((v10 & 0x10000000) != 0)
    {
      if (self->_isVehicleBluetoothConnected)
      {
        if (!*((unsigned char *)v4 + 195)) {
          goto LABEL_166;
        }
      }
      else if (*((unsigned char *)v4 + 195))
      {
        goto LABEL_166;
      }
      BOOL v11 = 1;
      goto LABEL_167;
    }
LABEL_166:
    BOOL v11 = 0;
    goto LABEL_167;
  }
  BOOL v11 = (*((void *)v4 + 25) & 0x10000000) == 0;
LABEL_167:

  return v11;
}

- (unint64_t)hash
{
  [(GEOLogMsgEventPredExTrainingData *)self readAll:1];
  $A2888D52E07BB247939D0F55CC592477 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    uint64_t v92 = 2654435761 * self->_entryType;
    if ((*(unsigned char *)&flags & 0x20) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v92 = 0;
  if ((*(unsigned char *)&flags & 0x20) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double durationUntilEventStart = self->_durationUntilEventStart;
  double v5 = -durationUntilEventStart;
  if (durationUntilEventStart >= 0.0) {
    double v5 = self->_durationUntilEventStart;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    double durationUntilEventEnd = self->_durationUntilEventEnd;
    double v11 = -durationUntilEventEnd;
    if (durationUntilEventEnd >= 0.0) {
      double v11 = self->_durationUntilEventEnd;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    double startTime = self->_startTime;
    double v16 = -startTime;
    if (startTime >= 0.0) {
      double v16 = self->_startTime;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    double endTime = self->_endTime;
    double v21 = -endTime;
    if (endTime >= 0.0) {
      double v21 = self->_endTime;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    double temperature = self->_temperature;
    double v26 = -temperature;
    if (temperature >= 0.0) {
      double v26 = self->_temperature;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if (*(unsigned char *)&flags)
  {
    double chanceOfPrecipitation = self->_chanceOfPrecipitation;
    double v31 = -chanceOfPrecipitation;
    if (chanceOfPrecipitation >= 0.0) {
      double v31 = self->_chanceOfPrecipitation;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  unint64_t v85 = v9;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    double chanceOfRain = self->_chanceOfRain;
    double v36 = -chanceOfRain;
    if (chanceOfRain >= 0.0) {
      double v36 = self->_chanceOfRain;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((*(unsigned char *)&flags & 4) == 0)
  {
    unint64_t v95 = 0;
    goto LABEL_68;
  }
  double chanceOfSnow = self->_chanceOfSnow;
  double v40 = -chanceOfSnow;
  if (chanceOfSnow >= 0.0) {
    double v40 = self->_chanceOfSnow;
  }
  long double v41 = floor(v40 + 0.5);
  double v42 = (v40 - v41) * 1.84467441e19;
  unint64_t v43 = 2654435761u * (unint64_t)fmod(v41, 1.84467441e19);
  if (v42 >= 0.0)
  {
    unint64_t v95 = v43;
    if (v42 <= 0.0) {
      goto LABEL_68;
    }
    unint64_t v44 = v43 + (unint64_t)v42;
  }
  else
  {
    unint64_t v44 = v43 - (unint64_t)fabs(v42);
  }
  unint64_t v95 = v44;
LABEL_68:
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
    unint64_t v94 = 0;
    goto LABEL_77;
  }
  double timeOfDay = self->_timeOfDay;
  double v46 = -timeOfDay;
  if (timeOfDay >= 0.0) {
    double v46 = self->_timeOfDay;
  }
  long double v47 = floor(v46 + 0.5);
  double v48 = (v46 - v47) * 1.84467441e19;
  unint64_t v49 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
  if (v48 >= 0.0)
  {
    unint64_t v94 = v49;
    if (v48 <= 0.0) {
      goto LABEL_77;
    }
    unint64_t v50 = v49 + (unint64_t)v48;
  }
  else
  {
    unint64_t v50 = v49 - (unint64_t)fabs(v48);
  }
  unint64_t v94 = v50;
LABEL_77:
  if ((*(unsigned char *)&flags & 8) == 0)
  {
    unint64_t v93 = 0;
    goto LABEL_86;
  }
  double dayOfWeek = self->_dayOfWeek;
  double v52 = -dayOfWeek;
  if (dayOfWeek >= 0.0) {
    double v52 = self->_dayOfWeek;
  }
  long double v53 = floor(v52 + 0.5);
  double v54 = (v52 - v53) * 1.84467441e19;
  unint64_t v55 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
  if (v54 >= 0.0)
  {
    unint64_t v93 = v55;
    if (v54 <= 0.0) {
      goto LABEL_86;
    }
    unint64_t v56 = v55 + (unint64_t)v54;
  }
  else
  {
    unint64_t v56 = v55 - (unint64_t)fabs(v54);
  }
  unint64_t v93 = v56;
LABEL_86:
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    double isTourist = self->_isTourist;
    double v59 = -isTourist;
    if (isTourist >= 0.0) {
      double v59 = self->_isTourist;
    }
    long double v60 = floor(v59 + 0.5);
    double v61 = (v59 - v60) * 1.84467441e19;
    unint64_t v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0) {
        v57 += (unint64_t)v61;
      }
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    unint64_t v57 = 0;
  }
  unint64_t v91 = v57;
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    uint64_t v90 = 2654435761 * self->_preferredTransportMode;
    if ((*(_DWORD *)&flags & 0x100000) != 0)
    {
LABEL_96:
      uint64_t v89 = 2654435761 * self->_mapType;
      if ((*(_DWORD *)&flags & 0x8000000) != 0) {
        goto LABEL_97;
      }
      goto LABEL_105;
    }
  }
  else
  {
    uint64_t v90 = 0;
    if ((*(_DWORD *)&flags & 0x100000) != 0) {
      goto LABEL_96;
    }
  }
  uint64_t v89 = 0;
  if ((*(_DWORD *)&flags & 0x8000000) != 0)
  {
LABEL_97:
    uint64_t v88 = 2654435761 * self->_isTransitPossible;
    if ((*(_DWORD *)&flags & 0x4000000) != 0) {
      goto LABEL_98;
    }
LABEL_106:
    uint64_t v87 = 0;
    if ((*(_WORD *)&flags & 0x800) != 0) {
      goto LABEL_99;
    }
LABEL_107:
    unint64_t v66 = 0;
    goto LABEL_110;
  }
LABEL_105:
  uint64_t v88 = 0;
  if ((*(_DWORD *)&flags & 0x4000000) == 0) {
    goto LABEL_106;
  }
LABEL_98:
  uint64_t v87 = 2654435761 * self->_isInBasemode;
  if ((*(_WORD *)&flags & 0x800) == 0) {
    goto LABEL_107;
  }
LABEL_99:
  double timeSinceBackgrounded = self->_timeSinceBackgrounded;
  double v63 = -timeSinceBackgrounded;
  if (timeSinceBackgrounded >= 0.0) {
    double v63 = self->_timeSinceBackgrounded;
  }
  long double v64 = floor(v63 + 0.5);
  double v65 = (v63 - v64) * 1.84467441e19;
  unint64_t v66 = 2654435761u * (unint64_t)fmod(v64, 1.84467441e19);
  if (v65 >= 0.0)
  {
    if (v65 > 0.0) {
      v66 += (unint64_t)v65;
    }
  }
  else
  {
    v66 -= (unint64_t)fabs(v65);
  }
LABEL_110:
  if ((*(_DWORD *)&flags & 0x20000000) != 0)
  {
    uint64_t v84 = 2654435761 * self->_routePlanningScreenPresented;
    if ((*(_DWORD *)&flags & 0x200000) != 0)
    {
LABEL_112:
      uint64_t v83 = 2654435761 * self->_predictedTransportMode;
      if ((*(_WORD *)&flags & 0x1000) != 0) {
        goto LABEL_113;
      }
      goto LABEL_119;
    }
  }
  else
  {
    uint64_t v84 = 0;
    if ((*(_DWORD *)&flags & 0x200000) != 0) {
      goto LABEL_112;
    }
  }
  uint64_t v83 = 0;
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
LABEL_113:
    uint64_t v82 = 2654435761 * self->_actualTransportMode;
    if ((*(_DWORD *)&flags & 0x20000) != 0) {
      goto LABEL_114;
    }
    goto LABEL_120;
  }
LABEL_119:
  uint64_t v82 = 0;
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
LABEL_114:
    uint64_t v81 = 2654435761 * self->_distanceFromHere;
    if ((*(_WORD *)&flags & 0x4000) != 0) {
      goto LABEL_115;
    }
LABEL_121:
    uint64_t v80 = 0;
    if ((*(_DWORD *)&flags & 0x40000) != 0) {
      goto LABEL_116;
    }
    goto LABEL_122;
  }
LABEL_120:
  uint64_t v81 = 0;
  if ((*(_WORD *)&flags & 0x4000) == 0) {
    goto LABEL_121;
  }
LABEL_115:
  uint64_t v80 = 2654435761 * self->_distanceFromHereToOrigin;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
LABEL_116:
    uint64_t v79 = 2654435761 * self->_distanceFromOriginToDestination;
    goto LABEL_123;
  }
LABEL_122:
  uint64_t v79 = 0;
LABEL_123:
  if ((*(_WORD *)&flags & 0x2000) != 0) {
    uint64_t v78 = 2654435761 * self->_distanceFromHereToHome;
  }
  else {
    uint64_t v78 = 0;
  }
  unint64_t v86 = v29;
  if ((*(_DWORD *)&flags & 0x10000) != 0) {
    uint64_t v76 = 2654435761 * self->_distanceFromHereToWork;
  }
  else {
    uint64_t v76 = 0;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0) {
    uint64_t v67 = 2654435761 * self->_distanceFromHereToParkedCar;
  }
  else {
    uint64_t v67 = 0;
  }
  unint64_t v68 = [(GEOLatLng *)self->_userLocation hash];
  NSUInteger v69 = [(NSString *)self->_userLocationGeohash4 hash];
  $A2888D52E07BB247939D0F55CC592477 v70 = self->_flags;
  if ((*(_DWORD *)&v70 & 0x2000000) != 0) {
    uint64_t v71 = 2654435761 * self->_isCarplayConnected;
  }
  else {
    uint64_t v71 = 0;
  }
  if ((*(_DWORD *)&v70 & 0x1000000) == 0)
  {
    uint64_t v72 = 0;
    if ((*(_DWORD *)&v70 & 0x800000) != 0) {
      goto LABEL_137;
    }
LABEL_140:
    uint64_t v73 = 0;
    if ((*(_DWORD *)&v70 & 0x10000000) != 0) {
      goto LABEL_138;
    }
LABEL_141:
    uint64_t v74 = 0;
    return v8 ^ v92 ^ v85 ^ v14 ^ v19 ^ v24 ^ v86 ^ v34 ^ v95 ^ v94 ^ v93 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v66 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v67 ^ v68 ^ v69 ^ v71 ^ v72 ^ v73 ^ v74;
  }
  uint64_t v72 = 2654435761 * self->_weatherType;
  if ((*(_DWORD *)&v70 & 0x800000) == 0) {
    goto LABEL_140;
  }
LABEL_137:
  uint64_t v73 = 2654435761 * self->_weatherAqi;
  if ((*(_DWORD *)&v70 & 0x10000000) == 0) {
    goto LABEL_141;
  }
LABEL_138:
  uint64_t v74 = 2654435761 * self->_isVehicleBluetoothConnected;
  return v8 ^ v92 ^ v85 ^ v14 ^ v19 ^ v24 ^ v86 ^ v34 ^ v95 ^ v94 ^ v93 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v66 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v67 ^ v68 ^ v69 ^ v71 ^ v72 ^ v73 ^ v74;
}

- (void)mergeFrom:(id)a3
{
  id v9 = a3;
  [v9 readAll:0];
  id v4 = v9;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x80000) != 0)
  {
    self->_entryType = *((_DWORD *)v9 + 42);
    *(void *)&self->_flags |= 0x80000uLL;
    uint64_t v5 = *((void *)v9 + 25);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_double durationUntilEventStart = *((double *)v9 + 7);
  *(void *)&self->_flags |= 0x20uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x100) == 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_double durationUntilEventEnd = *((double *)v9 + 6);
  *(void *)&self->_flags |= 0x10uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x100) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_double startTime = *((double *)v9 + 10);
  *(void *)&self->_flags |= 0x100uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_double endTime = *((double *)v9 + 8);
  *(void *)&self->_flags |= 0x40uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_double temperature = *((double *)v9 + 11);
  *(void *)&self->_flags |= 0x200uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_double chanceOfPrecipitation = *((double *)v9 + 2);
  *(void *)&self->_flags |= 1uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_double chanceOfRain = *((double *)v9 + 3);
  *(void *)&self->_flags |= 2uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_double chanceOfSnow = *((double *)v9 + 4);
  *(void *)&self->_flags |= 4uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x400) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_double timeOfDay = *((double *)v9 + 12);
  *(void *)&self->_flags |= 0x400uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_double dayOfWeek = *((double *)v9 + 5);
  *(void *)&self->_flags |= 8uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_double isTourist = *((double *)v9 + 9);
  *(void *)&self->_flags |= 0x80uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x400000) == 0)
  {
LABEL_14:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_preferredTransportMode = *((_DWORD *)v9 + 45);
  *(void *)&self->_flags |= 0x400000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x100000) == 0)
  {
LABEL_15:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_mapType = *((_DWORD *)v9 + 43);
  *(void *)&self->_flags |= 0x100000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_isTransitPossible = *((unsigned char *)v9 + 194);
  *(void *)&self->_flags |= 0x8000000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_17:
    if ((v5 & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_isInBasemode = *((unsigned char *)v9 + 193);
  *(void *)&self->_flags |= 0x4000000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x800) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_double timeSinceBackgrounded = *((double *)v9 + 13);
  *(void *)&self->_flags |= 0x800uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_routePlanningScreenPresented = *((unsigned char *)v9 + 196);
  *(void *)&self->_flags |= 0x20000000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x200000) == 0)
  {
LABEL_20:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_predictedTransportMode = *((_DWORD *)v9 + 44);
  *(void *)&self->_flags |= 0x200000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x1000) == 0)
  {
LABEL_21:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_actualTransportMode = *((_DWORD *)v9 + 35);
  *(void *)&self->_flags |= 0x1000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x20000) == 0)
  {
LABEL_22:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_distanceFromHere = *((_DWORD *)v9 + 40);
  *(void *)&self->_flags |= 0x20000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x4000) == 0)
  {
LABEL_23:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_distanceFromHereToOrigin = *((_DWORD *)v9 + 37);
  *(void *)&self->_flags |= 0x4000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x40000) == 0)
  {
LABEL_24:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_distanceFromOriginToDestination = *((_DWORD *)v9 + 41);
  *(void *)&self->_flags |= 0x40000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x2000) == 0)
  {
LABEL_25:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_distanceFromHereToHome = *((_DWORD *)v9 + 36);
  *(void *)&self->_flags |= 0x2000uLL;
  uint64_t v5 = *((void *)v9 + 25);
  if ((v5 & 0x10000) == 0)
  {
LABEL_26:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_55:
  self->_distanceFromHereToWork = *((_DWORD *)v9 + 39);
  *(void *)&self->_flags |= 0x10000uLL;
  if ((*((void *)v9 + 25) & 0x8000) != 0)
  {
LABEL_27:
    self->_distanceFromHereToParkedCar = *((_DWORD *)v9 + 38);
    *(void *)&self->_flags |= 0x8000uLL;
  }
LABEL_28:
  userLocation = self->_userLocation;
  uint64_t v7 = *((void *)v9 + 15);
  if (userLocation)
  {
    if (!v7) {
      goto LABEL_60;
    }
    -[GEOLatLng mergeFrom:](userLocation, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_60;
    }
    -[GEOLogMsgEventPredExTrainingData setUserLocation:](self, "setUserLocation:");
  }
  id v4 = v9;
LABEL_60:
  if (*((void *)v4 + 14))
  {
    -[GEOLogMsgEventPredExTrainingData setUserLocationGeohash4:](self, "setUserLocationGeohash4:");
    id v4 = v9;
  }
  uint64_t v8 = *((void *)v4 + 25);
  if ((v8 & 0x2000000) != 0)
  {
    self->_isCarplayConnected = *((unsigned char *)v4 + 192);
    *(void *)&self->_flags |= 0x2000000uLL;
    uint64_t v8 = *((void *)v4 + 25);
    if ((v8 & 0x1000000) == 0)
    {
LABEL_64:
      if ((v8 & 0x800000) == 0) {
        goto LABEL_65;
      }
      goto LABEL_72;
    }
  }
  else if ((v8 & 0x1000000) == 0)
  {
    goto LABEL_64;
  }
  self->_weatherType = *((_DWORD *)v4 + 47);
  *(void *)&self->_flags |= 0x1000000uLL;
  uint64_t v8 = *((void *)v4 + 25);
  if ((v8 & 0x800000) == 0)
  {
LABEL_65:
    if ((v8 & 0x10000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_72:
  self->_weatherAqi = *((_DWORD *)v4 + 46);
  *(void *)&self->_flags |= 0x800000uLL;
  if ((*((void *)v4 + 25) & 0x10000000) != 0)
  {
LABEL_66:
    self->_isVehicleBluetoothConnected = *((unsigned char *)v4 + 195);
    *(void *)&self->_flags |= 0x10000000uLL;
  }
LABEL_67:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_userLocationGeohash4, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end