@interface AFArbitrationParticipationContext
- (AFMyriadRecord)ownAdvertisement;
- (BOOL)decisionIsWon;
- (CDASchemaCDAScoreBoosters)scoreBoosters;
- (NSArray)advertisements;
- (NSDate)requestStartDate;
- (NSDate)voiceTriggerDate;
- (NSNumber)triggerType;
- (double)lastActivationTime;
- (unsigned)deviceClass;
- (void)setAdvertisements:(id)a3;
- (void)setDecisionIsWon:(BOOL)a3;
- (void)setDeviceClass:(unsigned __int8)a3;
- (void)setLastActivationTime:(double)a3;
- (void)setOwnAdvertisement:(id)a3;
- (void)setRequestStartDate:(id)a3;
- (void)setScoreBoosters:(id)a3;
- (void)setTriggerType:(id)a3;
- (void)setVoiceTriggerDate:(id)a3;
@end

@implementation AFArbitrationParticipationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_scoreBoosters, 0);
  objc_storeStrong((id *)&self->_voiceTriggerDate, 0);
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_advertisements, 0);
  objc_storeStrong((id *)&self->_ownAdvertisement, 0);
}

- (void)setLastActivationTime:(double)a3
{
  self->_lastActivationTime = a3;
}

- (double)lastActivationTime
{
  return self->_lastActivationTime;
}

- (void)setTriggerType:(id)a3
{
}

- (NSNumber)triggerType
{
  return self->_triggerType;
}

- (void)setDeviceClass:(unsigned __int8)a3
{
  self->_deviceClass = a3;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (void)setScoreBoosters:(id)a3
{
}

- (CDASchemaCDAScoreBoosters)scoreBoosters
{
  return self->_scoreBoosters;
}

- (void)setVoiceTriggerDate:(id)a3
{
}

- (NSDate)voiceTriggerDate
{
  return self->_voiceTriggerDate;
}

- (void)setRequestStartDate:(id)a3
{
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (void)setDecisionIsWon:(BOOL)a3
{
  self->_decisionIsWon = a3;
}

- (BOOL)decisionIsWon
{
  return self->_decisionIsWon;
}

- (void)setAdvertisements:(id)a3
{
}

- (NSArray)advertisements
{
  return self->_advertisements;
}

- (void)setOwnAdvertisement:(id)a3
{
}

- (AFMyriadRecord)ownAdvertisement
{
  return self->_ownAdvertisement;
}

@end