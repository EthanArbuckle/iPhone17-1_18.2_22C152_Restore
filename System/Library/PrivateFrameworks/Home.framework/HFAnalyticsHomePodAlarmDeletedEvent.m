@interface HFAnalyticsHomePodAlarmDeletedEvent
- (BOOL)alarmDeletedSuccessfully;
- (BOOL)hasCustomVolume;
- (BOOL)isMusicAlarm;
- (HFAnalyticsHomePodAlarmDeletedEvent)initWithData:(id)a3;
- (NSString)homePodAlarmID;
- (NSString)processName;
- (float)customVolumeLevel;
- (id)payload;
- (void)setAlarmDeletedSuccessfully:(BOOL)a3;
- (void)setCustomVolumeLevel:(float)a3;
- (void)setHasCustomVolume:(BOOL)a3;
- (void)setHomePodAlarmID:(id)a3;
- (void)setIsMusicAlarm:(BOOL)a3;
- (void)setProcessName:(id)a3;
@end

@implementation HFAnalyticsHomePodAlarmDeletedEvent

- (HFAnalyticsHomePodAlarmDeletedEvent)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"homePodAlarmID"];
  if (!v5) {
    NSLog(&cfstr_Hfanalyticshom.isa);
  }
  v6 = [v4 objectForKeyedSubscript:@"alarmDeletedSuccessfully"];
  if (!v6) {
    NSLog(&cfstr_Hfanalyticshom_0.isa);
  }
  v7 = [v4 objectForKeyedSubscript:@"isMusicAlarm"];
  if (!v7) {
    NSLog(&cfstr_Hfanalyticshom_1.isa);
  }
  v8 = [v4 objectForKeyedSubscript:@"hasCustomVolume"];
  if (!v8) {
    NSLog(&cfstr_Hfanalyticshom_2.isa);
  }
  v9 = [v4 objectForKeyedSubscript:@"customVolumeLevel"];
  if (!v9) {
    NSLog(&cfstr_Hfanalyticshom_3.isa);
  }
  v17.receiver = self;
  v17.super_class = (Class)HFAnalyticsHomePodAlarmDeletedEvent;
  v10 = [(HFAnalyticsEvent *)&v17 initWithEventType:17];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_homePodAlarmID, v5);
    v11->_alarmDeletedSuccessfully = [v6 BOOLValue];
    v11->_isMusicAlarm = [v7 BOOLValue];
    v11->_hasCustomVolume = [v8 BOOLValue];
    [v9 floatValue];
    v11->_customVolumeLevel = v12;
    v13 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v14 = [v13 processName];
    processName = v11->_processName;
    v11->_processName = (NSString *)v14;
  }
  return v11;
}

- (id)payload
{
  v13.receiver = self;
  v13.super_class = (Class)HFAnalyticsHomePodAlarmDeletedEvent;
  v3 = [(HFAnalyticsEvent *)&v13 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsHomePodAlarmDeletedEvent *)self homePodAlarmID];
  [v4 setObject:v5 forKeyedSubscript:@"homePodAlarmID"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsHomePodAlarmDeletedEvent alarmDeletedSuccessfully](self, "alarmDeletedSuccessfully"));
  [v4 setObject:v6 forKeyedSubscript:@"homePodAlarmDeletedSuccessfully"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsHomePodAlarmDeletedEvent isMusicAlarm](self, "isMusicAlarm"));
  [v4 setObject:v7 forKeyedSubscript:@"isHomePodMusicAlarm"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsHomePodAlarmDeletedEvent hasCustomVolume](self, "hasCustomVolume"));
  [v4 setObject:v8 forKeyedSubscript:@"homePodMusicAlarmHasCustomVolume"];

  v9 = NSNumber;
  [(HFAnalyticsHomePodAlarmDeletedEvent *)self customVolumeLevel];
  v10 = objc_msgSend(v9, "numberWithFloat:");
  [v4 setObject:v10 forKeyedSubscript:@"homePodMusicAlarmCustomVolumeLevel"];

  v11 = [(HFAnalyticsHomePodAlarmDeletedEvent *)self processName];
  [v4 setObject:v11 forKeyedSubscript:@"processName"];

  return v4;
}

- (NSString)homePodAlarmID
{
  return self->_homePodAlarmID;
}

- (void)setHomePodAlarmID:(id)a3
{
}

- (BOOL)alarmDeletedSuccessfully
{
  return self->_alarmDeletedSuccessfully;
}

- (void)setAlarmDeletedSuccessfully:(BOOL)a3
{
  self->_alarmDeletedSuccessfully = a3;
}

- (BOOL)isMusicAlarm
{
  return self->_isMusicAlarm;
}

- (void)setIsMusicAlarm:(BOOL)a3
{
  self->_isMusicAlarm = a3;
}

- (BOOL)hasCustomVolume
{
  return self->_hasCustomVolume;
}

- (void)setHasCustomVolume:(BOOL)a3
{
  self->_hasCustomVolume = a3;
}

- (float)customVolumeLevel
{
  return self->_customVolumeLevel;
}

- (void)setCustomVolumeLevel:(float)a3
{
  self->_customVolumeLevel = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_homePodAlarmID, 0);
}

@end