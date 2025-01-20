@interface MapsSuggestionsSignalPackEvaluator
+ (id)evaluatorFromSignalPack:(id)a3;
- (BOOL)hasCarPlayInfo;
- (BOOL)hasDistanceFromHereToDestinationInfo;
- (BOOL)hasDistanceFromHereToOriginInfo;
- (BOOL)hasDistanceFromOriginToDestinationInfo;
- (BOOL)hasMapTypeInfo;
- (BOOL)hasRidesharingInfo;
- (BOOL)hasSignalForExpressPaymentCard;
- (BOOL)hasSignalForHasATransitCard;
- (BOOL)hasSignalForIsCurrentlyInATrip;
- (BOOL)hasSignalForPaymentCard;
- (BOOL)hasSignalForUpcomingTrip;
- (BOOL)hasTouristInfo;
- (BOOL)hasTransitInfo;
- (BOOL)hasUserTransportTypePreferenceInfo;
- (BOOL)hasWeatherInfo;
- (BOOL)hasWeatherPrecipitationInfo;
- (BOOL)hasWeatherTemperatureInfo;
- (BOOL)isBadWeather;
- (BOOL)isCarPlayConnected;
- (BOOL)isColdWeather;
- (BOOL)isEasilyWalkable;
- (BOOL)isHighChanceOfRaining;
- (BOOL)isHighChanceOfSnowing;
- (BOOL)isHotWeather;
- (BOOL)isLowChanceOfRaining;
- (BOOL)isLowChanceOfSnowing;
- (BOOL)isMapTypeTransit;
- (BOOL)isMildWeather;
- (BOOL)isRideSharingAppsInstalled;
- (BOOL)isTouristHere;
- (BOOL)isTransitCurrentlyPossible;
- (BOOL)isUserPreferenceDriving;
- (BOOL)isUserPreferenceRidesharing;
- (BOOL)isUserPreferenceTransit;
- (BOOL)isUserPreferenceWalking;
- (BOOL)isWalkable;
- (BOOL)userHasAPaymentCard;
- (BOOL)userHasATransitCard;
- (BOOL)userHasAnExpressPaymentCard;
- (BOOL)userHasAnUpcomingTrip;
- (BOOL)userIsCurrentlyInATrip;
- (MapsSuggestionsSignalPackEvaluator)initWithSignalPack:(id)a3;
- (double)isTransitUserConfidence;
- (double)isTransitUserHereConfidence;
@end

@implementation MapsSuggestionsSignalPackEvaluator

- (void).cxx_destruct
{
}

- (MapsSuggestionsSignalPackEvaluator)initWithSignalPack:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)MapsSuggestionsSignalPackEvaluator;
    v6 = [(MapsSuggestionsSignalPackEvaluator *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_signalPack, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      __int16 v14 = 1024;
      int v15 = 144;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsSignalPackEvaluator initWithSignalPack:]";
      __int16 v18 = 2082;
      v19 = "nil == (signalPack)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires signal pack", buf, 0x26u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)hasTouristInfo
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:12];
}

- (double)isTransitUserHereConfidence
{
  if (!GEOConfigGetBOOL()) {
    goto LABEL_6;
  }
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "IsTransitUser: MapsSuggestionsIsTransitAvailableHereEnabled is YES", buf, 2u);
  }

  if ([(MapsSuggestionsSignalPack *)self->_signalPack hasType:33])
  {
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:33];
    if (v4 != 0.0)
    {
LABEL_6:
      [(MapsSuggestionsSignalPackEvaluator *)self isTransitUserConfidence];
      return result;
    }
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_DEBUG, "IsTransitUser: MapsSuggestionsSignalTypeIsTransitAvailableHere is NO", v8, 2u);
    }

    return MapsSuggestionsConfidenceDefinitelyFalse();
  }
  else
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_DEBUG, "IsTransitUser: we don't have MapsSuggestionsSignalTypeIsTransitAvailableHere", v9, 2u);
    }

    return MapsSuggestionsConfidenceDontKnow();
  }
}

- (double)isTransitUserConfidence
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsSignalPack *)self->_signalPack hasType:19]
    && [(MapsSuggestionsSignalPackEvaluator *)self isUserPreferenceTransit])
  {
    v3 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v44) = 0;
      _os_log_impl(&dword_1A70DF000, v3, OS_LOG_TYPE_DEBUG, "IsTransitUser: Prefered Transport type is Transit", (uint8_t *)&v44, 2u);
    }

    return MapsSuggestionsConfidenceDefinitelyTrue();
  }
  float v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v44 = 134217984;
    double v45 = 0.0;
    _os_log_impl(&dword_1A70DF000, v4, OS_LOG_TYPE_DEBUG, "IsTransitUser: startScore = %.2f", (uint8_t *)&v44, 0xCu);
  }

  double v5 = 0.0;
  if ([(MapsSuggestionsSignalPack *)self->_signalPack hasType:28])
  {
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:28];
    if (v6 != 0.0)
    {
      GEOConfigGetDouble();
      double v5 = v7 + 0.0;
      v8 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v44 = 134217984;
        double v45 = v5;
        _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeHasTransitPass = %.2f", (uint8_t *)&v44, 0xCu);
      }
    }
    unsigned int v9 = 1;
  }
  else
  {
    unsigned int v9 = 0;
  }
  if ([(MapsSuggestionsSignalPack *)self->_signalPack hasType:29])
  {
    ++v9;
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:29];
    if (v10 != 0.0)
    {
      GEOConfigGetDouble();
      double v5 = v5 + v11;
      v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v44 = 134217984;
        double v45 = v5;
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeHasFavoriteTransitPOI = %.2f", (uint8_t *)&v44, 0xCu);
      }
    }
  }
  if ([(MapsSuggestionsSignalPack *)self->_signalPack hasType:30])
  {
    ++v9;
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:30];
    if (v13 != 0.0)
    {
      GEOConfigGetDouble();
      double v5 = v5 + v14;
      int v15 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v44 = 134217984;
        double v45 = v5;
        _os_log_impl(&dword_1A70DF000, v15, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeHasFavoriteTransitLine = %.2f", (uint8_t *)&v44, 0xCu);
      }
    }
  }
  if ([(MapsSuggestionsSignalPack *)self->_signalPack hasType:31])
  {
    ++v9;
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:31];
    if (v16 != 0.0)
    {
      GEOConfigGetDouble();
      double v5 = v5 + v17;
      __int16 v18 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v44 = 134217984;
        double v45 = v5;
        _os_log_impl(&dword_1A70DF000, v18, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeHasRecentTransitRoute = %.2f", (uint8_t *)&v44, 0xCu);
      }
    }
  }
  if ([(MapsSuggestionsSignalPack *)self->_signalPack hasType:32])
  {
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:32];
    double v20 = v19;
    GEOConfigGetDouble();
    if (v21 >= v20)
    {
      GEOConfigGetDouble();
    }
    else
    {
      GEOConfigGetDouble();
      double v23 = v22;
      GEOConfigGetDouble();
      if (v23 + v24 <= v20 || (GEOConfigGetDouble(), v25 == 0.0))
      {
        GEOConfigGetDouble();
        double v27 = v26;
        GEOConfigGetDouble();
        double v29 = v27 * v28;
      }
      else
      {
        GEOConfigGetDouble();
        double v38 = v20 - v37;
        GEOConfigGetDouble();
        double v40 = 1.0 - v38 / v39;
        GEOConfigGetDouble();
        double v42 = v41;
        GEOConfigGetDouble();
        double v29 = v40 * (v42 * (1.0 - v43));
      }
    }
    ++v9;
    double v5 = v5 + v29;
    v31 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      int v44 = 134217984;
      double v45 = v5;
      _os_log_impl(&dword_1A70DF000, v31, OS_LOG_TYPE_DEBUG, "IsTransitUser: score after MapsSuggestionsSignalTypeTimeSinceLastTransitRoute = %.2f", (uint8_t *)&v44, 0xCu);
    }
  }
  else if (!v9)
  {
    return MapsSuggestionsConfidenceDontKnow();
  }
  double v32 = v5 / (double)(int)v9;
  v33 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    int v44 = 134218240;
    double v45 = v32;
    __int16 v46 = 1024;
    unsigned int v47 = v9;
    _os_log_impl(&dword_1A70DF000, v33, OS_LOG_TYPE_DEBUG, "IsTransitUser: finalScore = %.2f, number of signals: %d", (uint8_t *)&v44, 0x12u);
  }

  GEOConfigGetDouble();
  double v35 = v34;
  uint64_t Integer = GEOConfigGetInteger();
  if (v32 >= v35)
  {
    if (Integer > v9) {
      return MapsSuggestionsConfidenceLikelyTrue();
    }
    return MapsSuggestionsConfidenceDefinitelyTrue();
  }
  if (Integer <= v9) {
    return MapsSuggestionsConfidenceDefinitelyFalse();
  }
  else {
    return MapsSuggestionsConfidenceLikelyFalse();
  }
}

- (BOOL)isUserPreferenceTransit
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:19];
  return v2 == 2.0;
}

+ (id)evaluatorFromSignalPack:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    double v5 = (void *)[objc_alloc((Class)a1) initWithSignalPack:v4];
  }
  else
  {
    float v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      unsigned int v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      __int16 v10 = 1024;
      int v11 = 155;
      __int16 v12 = 2082;
      float v13 = "+[MapsSuggestionsSignalPackEvaluator evaluatorFromSignalPack:]";
      __int16 v14 = 2082;
      int v15 = "nil == (signalPack)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires signal pack", (uint8_t *)&v8, 0x26u);
    }

    double v5 = 0;
  }

  return v5;
}

- (BOOL)hasWeatherInfo
{
  if ([(MapsSuggestionsSignalPackEvaluator *)self hasWeatherTemperatureInfo]) {
    return 1;
  }
  return [(MapsSuggestionsSignalPackEvaluator *)self hasWeatherPrecipitationInfo];
}

- (BOOL)hasWeatherTemperatureInfo
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:6];
}

- (BOOL)isColdWeather
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:6];
  double v3 = v2;
  GEOConfigGetDouble();
  return v4 > v3;
}

- (BOOL)isHotWeather
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:6];
  double v3 = v2;
  GEOConfigGetDouble();
  return v4 < v3;
}

- (BOOL)isMildWeather
{
  if ([(MapsSuggestionsSignalPackEvaluator *)self isHotWeather]) {
    return 0;
  }
  else {
    return ![(MapsSuggestionsSignalPackEvaluator *)self isHotWeather];
  }
}

- (BOOL)hasWeatherPrecipitationInfo
{
  if ([(MapsSuggestionsSignalPack *)self->_signalPack hasType:8]) {
    return 1;
  }
  signalPack = self->_signalPack;
  return [(MapsSuggestionsSignalPack *)signalPack hasType:9];
}

- (BOOL)isLowChanceOfRaining
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsSignalPackEvaluator *)self hasWeatherPrecipitationInfo])
  {
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:8];
    double v4 = v3;
    GEOConfigGetDouble();
    return v5 > v4;
  }
  else
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      unsigned int v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      __int16 v10 = 1024;
      int v11 = 195;
      __int16 v12 = 2082;
      float v13 = "-[MapsSuggestionsSignalPackEvaluator isLowChanceOfRaining]";
      __int16 v14 = 2082;
      int v15 = "! [self hasWeatherPrecipitationInfo]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherPrecipitationInfo first!", (uint8_t *)&v8, 0x26u);
    }

    return 0;
  }
}

- (BOOL)isHighChanceOfRaining
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsSignalPackEvaluator *)self hasWeatherPrecipitationInfo])
  {
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:8];
    double v4 = v3;
    GEOConfigGetDouble();
    return v5 < v4;
  }
  else
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      unsigned int v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      __int16 v10 = 1024;
      int v11 = 201;
      __int16 v12 = 2082;
      float v13 = "-[MapsSuggestionsSignalPackEvaluator isHighChanceOfRaining]";
      __int16 v14 = 2082;
      int v15 = "! [self hasWeatherPrecipitationInfo]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherPrecipitationInfo first!", (uint8_t *)&v8, 0x26u);
    }

    return 0;
  }
}

- (BOOL)isLowChanceOfSnowing
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsSignalPackEvaluator *)self hasWeatherPrecipitationInfo])
  {
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:9];
    double v4 = v3;
    GEOConfigGetDouble();
    return v5 > v4;
  }
  else
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      unsigned int v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      __int16 v10 = 1024;
      int v11 = 207;
      __int16 v12 = 2082;
      float v13 = "-[MapsSuggestionsSignalPackEvaluator isLowChanceOfSnowing]";
      __int16 v14 = 2082;
      int v15 = "! [self hasWeatherPrecipitationInfo]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherPrecipitationInfo first!", (uint8_t *)&v8, 0x26u);
    }

    return 0;
  }
}

- (BOOL)isHighChanceOfSnowing
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(MapsSuggestionsSignalPackEvaluator *)self hasWeatherPrecipitationInfo])
  {
    [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:9];
    double v4 = v3;
    GEOConfigGetDouble();
    return v5 < v4;
  }
  else
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446978;
      unsigned int v9 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      __int16 v10 = 1024;
      int v11 = 213;
      __int16 v12 = 2082;
      float v13 = "-[MapsSuggestionsSignalPackEvaluator isHighChanceOfSnowing]";
      __int16 v14 = 2082;
      int v15 = "! [self hasWeatherPrecipitationInfo]";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherPrecipitationInfo first!", (uint8_t *)&v8, 0x26u);
    }

    return 0;
  }
}

- (BOOL)isBadWeather
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MapsSuggestionsSignalPackEvaluator *)self hasWeatherTemperatureInfo];
  BOOL v4 = [(MapsSuggestionsSignalPack *)self->_signalPack hasType:8];
  BOOL v5 = [(MapsSuggestionsSignalPack *)self->_signalPack hasType:9];
  BOOL v6 = v5;
  if (v3 || v4 || v5)
  {
    if (v3 && [(MapsSuggestionsSignalPackEvaluator *)self isColdWeather]
      || v4 && [(MapsSuggestionsSignalPackEvaluator *)self isHighChanceOfRaining]
      || v6 && [(MapsSuggestionsSignalPackEvaluator *)self isHighChanceOfSnowing])
    {
      return 1;
    }
  }
  else
  {
    double v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPackEvaluator.mm";
      __int16 v11 = 1024;
      int v12 = 223;
      __int16 v13 = 2082;
      __int16 v14 = "-[MapsSuggestionsSignalPackEvaluator isBadWeather]";
      __int16 v15 = 2082;
      uint64_t v16 = "! (hasTemperatureInfo || hasRainInfo || hasSnowInfo)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. You need to check -hasWeatherTemperatureInfo or -hasWeatherPrecipitationInfo first!", (uint8_t *)&v9, 0x26u);
    }
  }
  return 0;
}

- (BOOL)hasUserTransportTypePreferenceInfo
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:19];
}

- (BOOL)isUserPreferenceDriving
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:19];
  return v2 == 0.0;
}

- (BOOL)isUserPreferenceWalking
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:19];
  return v2 == 1.0;
}

- (BOOL)isUserPreferenceRidesharing
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:19];
  return v2 == 3.0;
}

- (BOOL)hasDistanceFromHereToDestinationInfo
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:13];
}

- (BOOL)hasDistanceFromHereToOriginInfo
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:14];
}

- (BOOL)hasDistanceFromOriginToDestinationInfo
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:15];
}

- (BOOL)isEasilyWalkable
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:13];
  double v3 = v2;
  GEOConfigGetDouble();
  return v4 >= v3;
}

- (BOOL)isWalkable
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:13];
  double v3 = v2;
  GEOConfigGetDouble();
  return v4 >= v3;
}

- (BOOL)hasCarPlayInfo
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:20];
}

- (BOOL)isCarPlayConnected
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:20];
  return v2 != 0.0;
}

- (BOOL)hasMapTypeInfo
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:21];
}

- (BOOL)isMapTypeTransit
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:21];
  return v2 == 4.0;
}

- (BOOL)userHasAnUpcomingTrip
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:36];
  return v2 != 0.0;
}

- (BOOL)hasSignalForUpcomingTrip
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:36];
}

- (BOOL)userIsCurrentlyInATrip
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:37];
  return v2 != 0.0;
}

- (BOOL)hasSignalForIsCurrentlyInATrip
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:37];
}

- (BOOL)userHasAnExpressPaymentCard
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:34];
  return v2 != 0.0;
}

- (BOOL)userHasAPaymentCard
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:35];
  return v2 != 0.0;
}

- (BOOL)userHasATransitCard
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:28];
  return v2 != 0.0;
}

- (BOOL)hasSignalForExpressPaymentCard
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:34];
}

- (BOOL)hasSignalForPaymentCard
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:35];
}

- (BOOL)hasSignalForHasATransitCard
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:28];
}

- (BOOL)hasTransitInfo
{
  return 1;
}

- (BOOL)isTransitCurrentlyPossible
{
  return 1;
}

- (BOOL)hasRidesharingInfo
{
  return [(MapsSuggestionsSignalPack *)self->_signalPack hasType:24];
}

- (BOOL)isRideSharingAppsInstalled
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:24];
  return v2 != 0.0;
}

- (BOOL)isTouristHere
{
  [(MapsSuggestionsSignalPack *)self->_signalPack valueForSignalType:12];
  return v2 > 0.0;
}

@end