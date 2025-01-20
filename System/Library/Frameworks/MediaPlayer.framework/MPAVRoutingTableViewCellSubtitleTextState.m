@interface MPAVRoutingTableViewCellSubtitleTextState
- (BOOL)hasVisibleTextTypeToShow;
- (BOOL)hasVisibleTextTypeToTransitionTo;
- (BOOL)isAnimating;
- (NSString)batteryText;
- (NSString)localizedSubtitle;
- (NSString)pairedDeviceText;
- (NSString)routeUID;
- (NSString)stringForCurrentVisibleTextType;
- (id)_stringForVisibleTextType:(unint64_t)a3;
- (unint64_t)_nextAvailableVisibleTextType;
- (unint64_t)currentVisibleTextType;
- (void)resetForNewRoute;
- (void)setAnimating:(BOOL)a3;
- (void)setBatteryText:(id)a3;
- (void)setCurrentVisibleTextType:(unint64_t)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setPairedDeviceText:(id)a3;
- (void)setRouteUID:(id)a3;
- (void)transitionToNextAvailableVisibleTextType;
@end

@implementation MPAVRoutingTableViewCellSubtitleTextState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_pairedDeviceText, 0);
  objc_storeStrong((id *)&self->_batteryText, 0);

  objc_storeStrong((id *)&self->_routeUID, 0);
}

- (void)setCurrentVisibleTextType:(unint64_t)a3
{
  self->_currentVisibleTextType = a3;
}

- (unint64_t)currentVisibleTextType
{
  return self->_currentVisibleTextType;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setPairedDeviceText:(id)a3
{
}

- (NSString)pairedDeviceText
{
  return self->_pairedDeviceText;
}

- (void)setBatteryText:(id)a3
{
}

- (NSString)batteryText
{
  return self->_batteryText;
}

- (void)setRouteUID:(id)a3
{
}

- (NSString)routeUID
{
  return self->_routeUID;
}

- (void)resetForNewRoute
{
  self->_currentVisibleTextType = 0;
  [(MPAVRoutingTableViewCellSubtitleTextState *)self transitionToNextAvailableVisibleTextType];
}

- (unint64_t)_nextAvailableVisibleTextType
{
  unint64_t currentVisibleTextType = self->_currentVisibleTextType;
  LOBYTE(v4) = currentVisibleTextType;
  while (1)
  {
    char v5 = v4 + 1;
    unint64_t v4 = ((_BYTE)v4 + 1) & 3;
    if (v4 == currentVisibleTextType) {
      break;
    }
    v6 = [(MPAVRoutingTableViewCellSubtitleTextState *)self _stringForVisibleTextType:v5 & 3];

    if (v6) {
      return v4;
    }
  }
  return currentVisibleTextType;
}

- (id)_stringForVisibleTextType:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    id v3 = 0;
  }
  else {
    id v3 = *((id *)&self->_routeUID + a3);
  }
  if ([v3 length]) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (NSString)stringForCurrentVisibleTextType
{
  v2 = [(MPAVRoutingTableViewCellSubtitleTextState *)self _stringForVisibleTextType:self->_currentVisibleTextType];
  id v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void)transitionToNextAvailableVisibleTextType
{
  self->_unint64_t currentVisibleTextType = [(MPAVRoutingTableViewCellSubtitleTextState *)self _nextAvailableVisibleTextType];
}

- (BOOL)hasVisibleTextTypeToTransitionTo
{
  return [(MPAVRoutingTableViewCellSubtitleTextState *)self _nextAvailableVisibleTextType] != self->_currentVisibleTextType;
}

- (BOOL)hasVisibleTextTypeToShow
{
  unint64_t v3 = -1;
  while (v3 != 3)
  {
    unint64_t v4 = [(MPAVRoutingTableViewCellSubtitleTextState *)self _stringForVisibleTextType:++v3];

    if (v4) {
      return v3 < 4;
    }
  }
  unint64_t v3 = 4;
  return v3 < 4;
}

@end