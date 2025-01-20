@interface HMDAnalyticsTriggerEventData
- (BOOL)endEvent;
- (HMDAnalyticsCalendarEventData)calendarEvent;
- (HMDAnalyticsCharacteristicEventData)charEvent;
- (HMDAnalyticsCharacteristicThresholdEventData)charThresholdEvent;
- (HMDAnalyticsCharacteristicThresholdEventData)thresholdEvent;
- (HMDAnalyticsDurationEventData)durationEvent;
- (HMDAnalyticsLocationEventData)locationEvent;
- (HMDAnalyticsPresenceEventData)presenceEvent;
- (HMDAnalyticsSignificantTimeEventData)significantTimeEvent;
- (void)setCalendarEvent:(id)a3;
- (void)setCharEvent:(id)a3;
- (void)setCharThresholdEvent:(id)a3;
- (void)setDurationEvent:(id)a3;
- (void)setEndEvent:(BOOL)a3;
- (void)setLocationEvent:(id)a3;
- (void)setPresenceEvent:(id)a3;
- (void)setSignificantTimeEvent:(id)a3;
- (void)setThresholdEvent:(id)a3;
@end

@implementation HMDAnalyticsTriggerEventData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdEvent, 0);
  objc_storeStrong((id *)&self->_significantTimeEvent, 0);
  objc_storeStrong((id *)&self->_presenceEvent, 0);
  objc_storeStrong((id *)&self->_locationEvent, 0);
  objc_storeStrong((id *)&self->_durationEvent, 0);
  objc_storeStrong((id *)&self->_charThresholdEvent, 0);
  objc_storeStrong((id *)&self->_charEvent, 0);
  objc_storeStrong((id *)&self->_calendarEvent, 0);
}

- (void)setEndEvent:(BOOL)a3
{
  self->_endEvent = a3;
}

- (BOOL)endEvent
{
  return self->_endEvent;
}

- (void)setThresholdEvent:(id)a3
{
}

- (HMDAnalyticsCharacteristicThresholdEventData)thresholdEvent
{
  return self->_thresholdEvent;
}

- (void)setSignificantTimeEvent:(id)a3
{
}

- (HMDAnalyticsSignificantTimeEventData)significantTimeEvent
{
  return self->_significantTimeEvent;
}

- (void)setPresenceEvent:(id)a3
{
}

- (HMDAnalyticsPresenceEventData)presenceEvent
{
  return self->_presenceEvent;
}

- (void)setLocationEvent:(id)a3
{
}

- (HMDAnalyticsLocationEventData)locationEvent
{
  return self->_locationEvent;
}

- (void)setDurationEvent:(id)a3
{
}

- (HMDAnalyticsDurationEventData)durationEvent
{
  return self->_durationEvent;
}

- (void)setCharThresholdEvent:(id)a3
{
}

- (HMDAnalyticsCharacteristicThresholdEventData)charThresholdEvent
{
  return self->_charThresholdEvent;
}

- (void)setCharEvent:(id)a3
{
}

- (HMDAnalyticsCharacteristicEventData)charEvent
{
  return self->_charEvent;
}

- (void)setCalendarEvent:(id)a3
{
}

- (HMDAnalyticsCalendarEventData)calendarEvent
{
  return self->_calendarEvent;
}

@end