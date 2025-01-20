@interface MapsSuggestionsTransportModePredictionInput
- (MapsSuggestionsTransportModePredictionInput)initWithTemperature:(double)a3 ChanceOfPrecipitation:(double)a4 TimeOfDay:(double)a5 DayOfWeek:(double)a6 TouristBit:(double)a7 DistanceFromOriginToDestination:(double)a8 DistanceFromHereToOrigin:(double)a9 distanceFromOriginToDestination:(double)a10 DistanceFromHereToHome:(double)a11 DistanceFromHereToWork:(double)a12 DistanceFromHereToParkedCar:(double)a13 UserPreferenceForTransportType_1:(double)a14 UserPreferenceForTransportType_3:(double)a15 UserPreferenceForTransportType_2:(double)a16 MapType_3:(double)a17 MapType_0:(double)a18 MapType_2:(double)a19 MapType_1:(double)a20 MapType_4:(double)a21;
- (NSSet)featureNames;
- (double)ChanceOfPrecipitation;
- (double)DayOfWeek;
- (double)DistanceFromHereToHome;
- (double)DistanceFromHereToOrigin;
- (double)DistanceFromHereToParkedCar;
- (double)DistanceFromHereToWork;
- (double)DistanceFromOriginToDestination;
- (double)MapType_0;
- (double)MapType_1;
- (double)MapType_2;
- (double)MapType_3;
- (double)MapType_4;
- (double)Temperature;
- (double)TimeOfDay;
- (double)TouristBit;
- (double)UserPreferenceForTransportType_1;
- (double)UserPreferenceForTransportType_2;
- (double)UserPreferenceForTransportType_3;
- (double)distanceFromOriginToDestination;
- (id)featureValueForName:(id)a3;
- (void)setChanceOfPrecipitation:(double)a3;
- (void)setDayOfWeek:(double)a3;
- (void)setDistanceFromHereToHome:(double)a3;
- (void)setDistanceFromHereToOrigin:(double)a3;
- (void)setDistanceFromHereToParkedCar:(double)a3;
- (void)setDistanceFromHereToWork:(double)a3;
- (void)setDistanceFromOriginToDestination:(double)a3;
- (void)setMapType_0:(double)a3;
- (void)setMapType_1:(double)a3;
- (void)setMapType_2:(double)a3;
- (void)setMapType_3:(double)a3;
- (void)setMapType_4:(double)a3;
- (void)setTemperature:(double)a3;
- (void)setTimeOfDay:(double)a3;
- (void)setTouristBit:(double)a3;
- (void)setUserPreferenceForTransportType_1:(double)a3;
- (void)setUserPreferenceForTransportType_2:(double)a3;
- (void)setUserPreferenceForTransportType_3:(double)a3;
@end

@implementation MapsSuggestionsTransportModePredictionInput

- (MapsSuggestionsTransportModePredictionInput)initWithTemperature:(double)a3 ChanceOfPrecipitation:(double)a4 TimeOfDay:(double)a5 DayOfWeek:(double)a6 TouristBit:(double)a7 DistanceFromOriginToDestination:(double)a8 DistanceFromHereToOrigin:(double)a9 distanceFromOriginToDestination:(double)a10 DistanceFromHereToHome:(double)a11 DistanceFromHereToWork:(double)a12 DistanceFromHereToParkedCar:(double)a13 UserPreferenceForTransportType_1:(double)a14 UserPreferenceForTransportType_3:(double)a15 UserPreferenceForTransportType_2:(double)a16 MapType_3:(double)a17 MapType_0:(double)a18 MapType_2:(double)a19 MapType_1:(double)a20 MapType_4:(double)a21
{
  v30.receiver = self;
  v30.super_class = (Class)MapsSuggestionsTransportModePredictionInput;
  result = [(MapsSuggestionsTransportModePredictionInput *)&v30 init];
  if (result)
  {
    result->_Temperature = a3;
    result->_ChanceOfPrecipitation = a4;
    result->_TimeOfDay = a5;
    result->_DayOfWeek = a6;
    result->_TouristBit = a7;
    result->_DistanceFromOriginToDestination = a8;
    result->_DistanceFromHereToOrigin = a9;
    result->_distanceFromOriginToDestination = a10;
    result->_DistanceFromHereToHome = a11;
    result->_DistanceFromHereToWork = a12;
    result->_DistanceFromHereToParkedCar = a13;
    result->_UserPreferenceForTransportType_1 = a14;
    result->_UserPreferenceForTransportType_3 = a15;
    result->_UserPreferenceForTransportType_2 = a16;
    result->_MapType_3 = a17;
    result->_MapType_0 = a18;
    result->_MapType_2 = a19;
    result->_MapType_1 = a20;
    result->_MapType_4 = a21;
  }
  return result;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_100075028];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Temperature"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self Temperature];
LABEL_36:
    v5 = +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:");
    goto LABEL_37;
  }
  if ([v4 isEqualToString:@"ChanceOfPrecipitation"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self ChanceOfPrecipitation];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"TimeOfDay"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self TimeOfDay];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"DayOfWeek"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self DayOfWeek];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"TouristBit"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self TouristBit];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"DistanceFromOriginToDestination"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self DistanceFromOriginToDestination];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"DistanceFromHereToOrigin"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self DistanceFromHereToOrigin];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"distanceFromOriginToDestination"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self distanceFromOriginToDestination];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"DistanceFromHereToHome"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self DistanceFromHereToHome];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"DistanceFromHereToWork"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self DistanceFromHereToWork];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"DistanceFromHereToParkedCar"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self DistanceFromHereToParkedCar];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"UserPreferenceForTransportType:1"]
    || [v4 isEqualToString:@"UserPreferenceForTransportType:3"]
    || [v4 isEqualToString:@"UserPreferenceForTransportType:2"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self UserPreferenceForTransportType];
    goto LABEL_36;
  }
  if ([v4 isEqualToString:@"MapType:3"]
    || [v4 isEqualToString:@"MapType:0"]
    || [v4 isEqualToString:@"MapType:2"]
    || [v4 isEqualToString:@"MapType:1"]
    || [v4 isEqualToString:@"MapType:4"])
  {
    [(MapsSuggestionsTransportModePredictionInput *)self MapType];
    goto LABEL_36;
  }
  v5 = 0;
LABEL_37:

  return v5;
}

- (double)Temperature
{
  return self->_Temperature;
}

- (void)setTemperature:(double)a3
{
  self->_Temperature = a3;
}

- (double)ChanceOfPrecipitation
{
  return self->_ChanceOfPrecipitation;
}

- (void)setChanceOfPrecipitation:(double)a3
{
  self->_ChanceOfPrecipitation = a3;
}

- (double)TimeOfDay
{
  return self->_TimeOfDay;
}

- (void)setTimeOfDay:(double)a3
{
  self->_TimeOfDay = a3;
}

- (double)DayOfWeek
{
  return self->_DayOfWeek;
}

- (void)setDayOfWeek:(double)a3
{
  self->_DayOfWeek = a3;
}

- (double)TouristBit
{
  return self->_TouristBit;
}

- (void)setTouristBit:(double)a3
{
  self->_TouristBit = a3;
}

- (double)DistanceFromOriginToDestination
{
  return self->_DistanceFromOriginToDestination;
}

- (void)setDistanceFromOriginToDestination:(double)a3
{
  self->_DistanceFromOriginToDestination = a3;
}

- (double)DistanceFromHereToOrigin
{
  return self->_DistanceFromHereToOrigin;
}

- (void)setDistanceFromHereToOrigin:(double)a3
{
  self->_DistanceFromHereToOrigin = a3;
}

- (double)distanceFromOriginToDestination
{
  return self->_distanceFromOriginToDestination;
}

- (double)DistanceFromHereToHome
{
  return self->_DistanceFromHereToHome;
}

- (void)setDistanceFromHereToHome:(double)a3
{
  self->_DistanceFromHereToHome = a3;
}

- (double)DistanceFromHereToWork
{
  return self->_DistanceFromHereToWork;
}

- (void)setDistanceFromHereToWork:(double)a3
{
  self->_DistanceFromHereToWork = a3;
}

- (double)DistanceFromHereToParkedCar
{
  return self->_DistanceFromHereToParkedCar;
}

- (void)setDistanceFromHereToParkedCar:(double)a3
{
  self->_DistanceFromHereToParkedCar = a3;
}

- (double)UserPreferenceForTransportType_1
{
  return self->_UserPreferenceForTransportType_1;
}

- (void)setUserPreferenceForTransportType_1:(double)a3
{
  self->_UserPreferenceForTransportType_1 = a3;
}

- (double)UserPreferenceForTransportType_3
{
  return self->_UserPreferenceForTransportType_3;
}

- (void)setUserPreferenceForTransportType_3:(double)a3
{
  self->_UserPreferenceForTransportType_3 = a3;
}

- (double)UserPreferenceForTransportType_2
{
  return self->_UserPreferenceForTransportType_2;
}

- (void)setUserPreferenceForTransportType_2:(double)a3
{
  self->_UserPreferenceForTransportType_2 = a3;
}

- (double)MapType_3
{
  return self->_MapType_3;
}

- (void)setMapType_3:(double)a3
{
  self->_MapType_3 = a3;
}

- (double)MapType_0
{
  return self->_MapType_0;
}

- (void)setMapType_0:(double)a3
{
  self->_MapType_0 = a3;
}

- (double)MapType_2
{
  return self->_MapType_2;
}

- (void)setMapType_2:(double)a3
{
  self->_MapType_2 = a3;
}

- (double)MapType_1
{
  return self->_MapType_1;
}

- (void)setMapType_1:(double)a3
{
  self->_MapType_1 = a3;
}

- (double)MapType_4
{
  return self->_MapType_4;
}

- (void)setMapType_4:(double)a3
{
  self->_MapType_4 = a3;
}

@end