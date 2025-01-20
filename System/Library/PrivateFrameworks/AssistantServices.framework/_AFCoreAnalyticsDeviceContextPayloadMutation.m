@interface _AFCoreAnalyticsDeviceContextPayloadMutation
- (BOOL)isDirty;
- (_AFCoreAnalyticsDeviceContextPayloadMutation)initWithBase:(id)a3;
- (id)getAlarmFiring;
- (id)getContextIdentifier;
- (id)getHomeAnnouncementRecency;
- (id)getHomeAnnouncementState;
- (id)getNearbyDevicesRequestIdentifier;
- (id)getNearbyProductType;
- (id)getPlaybackRecency;
- (id)getPlaybackState;
- (id)getProximity;
- (id)getTargetedResult;
- (id)getTimerFiring;
- (void)setAlarmFiring:(id)a3;
- (void)setContextIdentifier:(id)a3;
- (void)setHomeAnnouncementRecency:(id)a3;
- (void)setHomeAnnouncementState:(id)a3;
- (void)setNearbyDevicesRequestIdentifier:(id)a3;
- (void)setNearbyProductType:(id)a3;
- (void)setPlaybackRecency:(id)a3;
- (void)setPlaybackState:(id)a3;
- (void)setProximity:(id)a3;
- (void)setTargetedResult:(id)a3;
- (void)setTimerFiring:(id)a3;
@end

@implementation _AFCoreAnalyticsDeviceContextPayloadMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_targetedResult, 0);
  objc_storeStrong((id *)&self->_nearbyDevicesRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_homeAnnouncementRecency, 0);
  objc_storeStrong((id *)&self->_homeAnnouncementState, 0);
  objc_storeStrong((id *)&self->_playbackRecency, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_timerFiring, 0);
  objc_storeStrong((id *)&self->_alarmFiring, 0);
  objc_storeStrong((id *)&self->_proximity, 0);
  objc_storeStrong((id *)&self->_nearbyProductType, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setContextIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getContextIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_contextIdentifier;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base contextIdentifier];
  }
  return v2;
}

- (void)setTargetedResult:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getTargetedResult
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_targetedResult;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base targetedResult];
  }
  return v2;
}

- (void)setNearbyDevicesRequestIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getNearbyDevicesRequestIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_nearbyDevicesRequestIdentifier;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base nearbyDevicesRequestIdentifier];
  }
  return v2;
}

- (void)setHomeAnnouncementRecency:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getHomeAnnouncementRecency
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_homeAnnouncementRecency;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base homeAnnouncementRecency];
  }
  return v2;
}

- (void)setHomeAnnouncementState:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getHomeAnnouncementState
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_homeAnnouncementState;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base homeAnnouncementState];
  }
  return v2;
}

- (void)setPlaybackRecency:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getPlaybackRecency
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_playbackRecency;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base playbackRecency];
  }
  return v2;
}

- (void)setPlaybackState:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getPlaybackState
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_playbackState;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base playbackState];
  }
  return v2;
}

- (void)setTimerFiring:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getTimerFiring
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_timerFiring;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base timerFiring];
  }
  return v2;
}

- (void)setAlarmFiring:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getAlarmFiring
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_alarmFiring;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base alarmFiring];
  }
  return v2;
}

- (void)setProximity:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getProximity
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_proximity;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base proximity];
  }
  return v2;
}

- (void)setNearbyProductType:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getNearbyProductType
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_nearbyProductType;
  }
  else
  {
    v2 = [(AFCoreAnalyticsDeviceContextPayload *)self->_base nearbyProductType];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFCoreAnalyticsDeviceContextPayloadMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFCoreAnalyticsDeviceContextPayloadMutation;
  v6 = [(_AFCoreAnalyticsDeviceContextPayloadMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end