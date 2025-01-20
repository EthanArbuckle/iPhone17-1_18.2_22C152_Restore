@interface CCUISensorActivityDataProvider
- (CCUISensorActivityData)inactiveSensorActivityDataEligibleForMicModeSelection;
- (CCUISensorActivityData)mostRecentSensorActivityData;
- (NSSet)activeSensorActivityData;
- (void)setActiveSensorActivityData:(id)a3;
- (void)setInactiveSensorActivityDataEligibleForMicModeSelection:(id)a3;
- (void)setMostRecentSensorActivityData:(id)a3;
@end

@implementation CCUISensorActivityDataProvider

- (void)setMostRecentSensorActivityData:(id)a3
{
}

- (void)setInactiveSensorActivityDataEligibleForMicModeSelection:(id)a3
{
}

- (void)setActiveSensorActivityData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentSensorActivityData, 0);
  objc_storeStrong((id *)&self->_inactiveSensorActivityDataEligibleForMicModeSelection, 0);

  objc_storeStrong((id *)&self->_activeSensorActivityData, 0);
}

- (NSSet)activeSensorActivityData
{
  return self->_activeSensorActivityData;
}

- (CCUISensorActivityData)inactiveSensorActivityDataEligibleForMicModeSelection
{
  return self->_inactiveSensorActivityDataEligibleForMicModeSelection;
}

- (CCUISensorActivityData)mostRecentSensorActivityData
{
  return self->_mostRecentSensorActivityData;
}

@end