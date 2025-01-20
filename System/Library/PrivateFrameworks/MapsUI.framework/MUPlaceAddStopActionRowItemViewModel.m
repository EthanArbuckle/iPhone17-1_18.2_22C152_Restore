@interface MUPlaceAddStopActionRowItemViewModel
- (BOOL)canShowDetourTime;
- (BOOL)isEnabled;
- (BOOL)isHidden;
- (BOOL)isSearchAlongRoute;
- (GEOMapItemDetourInfo)detourInfo;
- (MKETAProvider)etaProvider;
- (MUPlaceAddStopActionRowItemViewModel)initWithSearchAlongRoute:(BOOL)a3 ETAProvider:(id)a4 detourInfo:(id)a5 canShowDetourTime:(BOOL)a6;
- (id)accessibilityIdentifier;
- (id)preferredBackgroundColor;
- (id)preferredTintColor;
- (id)symbolName;
- (id)titleText;
- (void)ETAProviderUpdated:(id)a3;
@end

@implementation MUPlaceAddStopActionRowItemViewModel

- (MUPlaceAddStopActionRowItemViewModel)initWithSearchAlongRoute:(BOOL)a3 ETAProvider:(id)a4 detourInfo:(id)a5 canShowDetourTime:(BOOL)a6
{
  BOOL v9 = a3;
  id v11 = a4;
  id v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MUPlaceAddStopActionRowItemViewModel;
  v13 = [(MUActionRowItemViewModel *)&v19 init];
  v14 = v13;
  if (v13)
  {
    v13->_isSearchAlongRoute = v9;
    objc_storeStrong((id *)&v13->_etaProvider, a4);
    objc_storeStrong((id *)&v14->_detourInfo, a5);
    v14->_canShowDetourTime = a6;
    if (v11)
    {
      if (!v12 && v9)
      {
        char v15 = [v11 isLikelyToReturnETA];
        v14->_hiddenWhileWaitingForETA = v15 ^ 1;
        if ((v15 & 1) == 0)
        {
          v16 = MUGetPlaceCardLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl(&dword_1931EA000, v16, OS_LOG_TYPE_INFO, "Hiding directions button while waiting for valid ETA", v18, 2u);
          }
        }
        [(MKETAProvider *)v14->_etaProvider addObserver:v14];
      }
    }
  }

  return v14;
}

- (BOOL)isEnabled
{
  return !self->_isSearchAlongRoute || self->_detourInfo || self->_etaTravelTime > 0.0;
}

- (BOOL)isHidden
{
  if (self->_isSearchAlongRoute && self->_hiddenWhileWaitingForETA) {
    return ![(MUPlaceAddStopActionRowItemViewModel *)self isEnabled];
  }
  else {
    return 0;
  }
}

- (id)symbolName
{
  return @"plus.circle.fill";
}

- (id)titleText
{
  [(GEOMapItemDetourInfo *)self->_detourInfo detourTime];
  if (v3 > 0.0 && self->_canShowDetourTime)
  {
    v4 = NSString;
    [(GEOMapItemDetourInfo *)self->_detourInfo detourTime];
    v6 = objc_msgSend(v4, "_navigation_stringWithSeconds:andAbbreviationType:", (unint64_t)v5, 1);
    v7 = NSString;
    v8 = _MULocalizedStringFromThisBundle(@"Add Stop With Detour Time [Placecard]");
    BOOL v9 = objc_msgSend(v7, "stringWithFormat:", v8, v6);
  }
  else
  {
    BOOL v9 = _MULocalizedStringFromThisBundle(@"Add Stop [Placecard]");
  }
  return v9;
}

- (id)preferredTintColor
{
  return +[MUInfoCardStyle directionsButtonTintColor];
}

- (id)preferredBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBlueColor];
}

- (id)accessibilityIdentifier
{
  return (id)[@"ActionRowItemType" stringByAppendingString:@"AddStop"];
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4 = a3;
  if (self->_etaTravelTime == 0.0)
  {
    id v7 = v4;
    [v4 etaTravelTime];
    id v4 = v7;
    if (v5 > 0.0)
    {
      [v7 etaTravelTime];
      self->_etaTravelTime = v6;
      [(MUActionRowItemViewModel *)self _notifyObservers];
      id v4 = v7;
    }
  }
}

- (BOOL)isSearchAlongRoute
{
  return self->_isSearchAlongRoute;
}

- (MKETAProvider)etaProvider
{
  return self->_etaProvider;
}

- (GEOMapItemDetourInfo)detourInfo
{
  return self->_detourInfo;
}

- (BOOL)canShowDetourTime
{
  return self->_canShowDetourTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detourInfo, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
}

@end