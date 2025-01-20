@interface AXEventTapManagerFilterEvents
- (BOOL)wantsATVRemoteEvents;
- (BOOL)wantsAccessibilityEvents;
- (BOOL)wantsDigitizerEvents;
- (BOOL)wantsKeyboardEvents;
- (BOOL)wantsLisaEvents;
- (BOOL)wantsMouseEvents;
- (BOOL)wantsStylusEvents;
- (BOOL)wantsVolumeButtonEvents;
- (void)setWantsATVRemoteEvents:(BOOL)a3;
- (void)setWantsAccessibilityEvents:(BOOL)a3;
- (void)setWantsDigitizerEvents:(BOOL)a3;
- (void)setWantsKeyboardEvents:(BOOL)a3;
- (void)setWantsLisaEvents:(BOOL)a3;
- (void)setWantsMouseEvents:(BOOL)a3;
- (void)setWantsStylusEvents:(BOOL)a3;
- (void)setWantsVolumeButtonEvents:(BOOL)a3;
@end

@implementation AXEventTapManagerFilterEvents

- (BOOL)wantsDigitizerEvents
{
  return self->_wantsDigitizerEvents;
}

- (void)setWantsDigitizerEvents:(BOOL)a3
{
  self->_wantsDigitizerEvents = a3;
}

- (BOOL)wantsKeyboardEvents
{
  return self->_wantsKeyboardEvents;
}

- (void)setWantsKeyboardEvents:(BOOL)a3
{
  self->_wantsKeyboardEvents = a3;
}

- (BOOL)wantsATVRemoteEvents
{
  return self->_wantsATVRemoteEvents;
}

- (void)setWantsATVRemoteEvents:(BOOL)a3
{
  self->_wantsATVRemoteEvents = a3;
}

- (BOOL)wantsLisaEvents
{
  return self->_wantsLisaEvents;
}

- (void)setWantsLisaEvents:(BOOL)a3
{
  self->_wantsLisaEvents = a3;
}

- (BOOL)wantsMouseEvents
{
  return self->_wantsMouseEvents;
}

- (void)setWantsMouseEvents:(BOOL)a3
{
  self->_wantsMouseEvents = a3;
}

- (BOOL)wantsAccessibilityEvents
{
  return self->_wantsAccessibilityEvents;
}

- (void)setWantsAccessibilityEvents:(BOOL)a3
{
  self->_wantsAccessibilityEvents = a3;
}

- (BOOL)wantsVolumeButtonEvents
{
  return self->_wantsVolumeButtonEvents;
}

- (void)setWantsVolumeButtonEvents:(BOOL)a3
{
  self->_wantsVolumeButtonEvents = a3;
}

- (BOOL)wantsStylusEvents
{
  return self->_wantsStylusEvents;
}

- (void)setWantsStylusEvents:(BOOL)a3
{
  self->_wantsStylusEvents = a3;
}

@end