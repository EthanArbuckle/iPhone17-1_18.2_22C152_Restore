@interface HFAnalyticsAnnounceRecordingEvent
- (BOOL)isAReply;
- (BOOL)recordingInterruptedByRouteChange;
- (BOOL)recordingInterruptedBySystem;
- (BOOL)recordingInterruptedByUser;
- (HFAnalyticsAnnounceRecordingEvent)initWithData:(id)a3;
- (NSNumber)announceRecordingIsForHome;
- (NSNumber)recordingDuration;
- (NSNumber)recordingFailed;
- (NSNumber)routeChangeInterruptionReason;
- (NSString)announceRecordingIsForRoom;
- (NSString)processName;
- (NSString)recipientAnnouncementID;
- (id)payload;
- (void)setAnnounceRecordingIsForHome:(id)a3;
- (void)setAnnounceRecordingIsForRoom:(id)a3;
- (void)setIsAReply:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setRecipientAnnouncementID:(id)a3;
- (void)setRecordingDuration:(id)a3;
- (void)setRecordingFailed:(id)a3;
- (void)setRecordingInterruptedByRouteChange:(BOOL)a3;
- (void)setRecordingInterruptedBySystem:(BOOL)a3;
- (void)setRecordingInterruptedByUser:(BOOL)a3;
- (void)setRouteChangeInterruptionReason:(id)a3;
@end

@implementation HFAnalyticsAnnounceRecordingEvent

- (HFAnalyticsAnnounceRecordingEvent)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"announceRecordingDuration"];
  if (!v5) {
    NSLog(&cfstr_Hfanalyticsann_9.isa);
  }
  v6 = [v4 objectForKeyedSubscript:@"recordingFailed"];
  if (!v6) {
    NSLog(&cfstr_Hfanalyticsann_10.isa);
  }
  v25.receiver = self;
  v25.super_class = (Class)HFAnalyticsAnnounceRecordingEvent;
  v7 = [(HFAnalyticsEvent *)&v25 initWithEventType:18];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_recordingDuration, v5);
    objc_storeStrong((id *)&v8->_recordingFailed, v6);
    uint64_t v9 = [v4 objectForKeyedSubscript:@"announceRecordingIsForHome"];
    announceRecordingIsForHome = v8->_announceRecordingIsForHome;
    v8->_announceRecordingIsForHome = (NSNumber *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"announceRecordingIsForRoom"];
    announceRecordingIsForRoom = v8->_announceRecordingIsForRoom;
    v8->_announceRecordingIsForRoom = (NSString *)v11;

    v13 = [v4 objectForKeyedSubscript:@"recordingWasInterruptedByUser"];
    v8->_recordingInterruptedByUser = [v13 BOOLValue];

    v14 = [v4 objectForKeyedSubscript:@"recordingWasInterruptedBySystem"];
    v8->_recordingInterruptedBySystem = [v14 BOOLValue];

    v15 = [v4 objectForKeyedSubscript:@"recordingWasInterruptedByRouteChange"];
    v8->_recordingInterruptedByRouteChange = [v15 BOOLValue];

    v16 = [v4 objectForKeyedSubscript:@"isAReply"];
    v8->_isAReply = [v16 BOOLValue];

    uint64_t v17 = [v4 objectForKeyedSubscript:@"routeChangeInterruptionReason"];
    routeChangeInterruptionReason = v8->_routeChangeInterruptionReason;
    v8->_routeChangeInterruptionReason = (NSNumber *)v17;

    uint64_t v19 = [v4 objectForKeyedSubscript:@"recipientAnnouncementID"];
    recipientAnnouncementID = v8->_recipientAnnouncementID;
    v8->_recipientAnnouncementID = (NSString *)v19;

    v21 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v22 = [v21 processName];
    processName = v8->_processName;
    v8->_processName = (NSString *)v22;
  }
  return v8;
}

- (id)payload
{
  v21.receiver = self;
  v21.super_class = (Class)HFAnalyticsAnnounceRecordingEvent;
  v3 = [(HFAnalyticsEvent *)&v21 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsAnnounceRecordingEvent *)self recordingDuration];
  [v4 setObject:v5 forKeyedSubscript:@"recordingDuration"];

  v6 = [(HFAnalyticsAnnounceRecordingEvent *)self recordingFailed];
  [v4 setObject:v6 forKeyedSubscript:@"recordingFailed"];

  v7 = [(HFAnalyticsAnnounceRecordingEvent *)self announceRecordingIsForHome];

  if (v7)
  {
    v8 = [(HFAnalyticsAnnounceRecordingEvent *)self announceRecordingIsForHome];
    [v4 setObject:v8 forKeyedSubscript:@"announceRecordingIsForHome"];
  }
  uint64_t v9 = [(HFAnalyticsAnnounceRecordingEvent *)self announceRecordingIsForRoom];

  if (v9)
  {
    v10 = [(HFAnalyticsAnnounceRecordingEvent *)self announceRecordingIsForRoom];
    [v4 setObject:v10 forKeyedSubscript:@"announceRecordingIsForRoom"];
  }
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAnnounceRecordingEvent recordingInterruptedByUser](self, "recordingInterruptedByUser"));
  [v4 setObject:v11 forKeyedSubscript:@"recordingWasInterruptedByUser"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAnnounceRecordingEvent recordingInterruptedBySystem](self, "recordingInterruptedBySystem"));
  [v4 setObject:v12 forKeyedSubscript:@"recordingWasInterruptedBySystem"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAnnounceRecordingEvent recordingInterruptedByRouteChange](self, "recordingInterruptedByRouteChange"));
  [v4 setObject:v13 forKeyedSubscript:@"recordingWasInterruptedByRouteChange"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAnnounceRecordingEvent isAReply](self, "isAReply"));
  [v4 setObject:v14 forKeyedSubscript:@"recordingIsAReply"];

  v15 = [(HFAnalyticsAnnounceRecordingEvent *)self routeChangeInterruptionReason];

  if (v15)
  {
    v16 = [(HFAnalyticsAnnounceRecordingEvent *)self routeChangeInterruptionReason];
    [v4 setObject:v16 forKeyedSubscript:@"routeChangeInterruptionReason"];
  }
  uint64_t v17 = [(HFAnalyticsAnnounceRecordingEvent *)self recipientAnnouncementID];

  if (v17)
  {
    v18 = [(HFAnalyticsAnnounceRecordingEvent *)self recipientAnnouncementID];
    [v4 setObject:v18 forKeyedSubscript:@"recipientAnnouncementID"];
  }
  uint64_t v19 = [(HFAnalyticsAnnounceRecordingEvent *)self processName];
  [v4 setObject:v19 forKeyedSubscript:@"processName"];

  return v4;
}

- (NSNumber)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(id)a3
{
}

- (NSNumber)recordingFailed
{
  return self->_recordingFailed;
}

- (void)setRecordingFailed:(id)a3
{
}

- (NSNumber)announceRecordingIsForHome
{
  return self->_announceRecordingIsForHome;
}

- (void)setAnnounceRecordingIsForHome:(id)a3
{
}

- (NSString)announceRecordingIsForRoom
{
  return self->_announceRecordingIsForRoom;
}

- (void)setAnnounceRecordingIsForRoom:(id)a3
{
}

- (BOOL)recordingInterruptedByUser
{
  return self->_recordingInterruptedByUser;
}

- (void)setRecordingInterruptedByUser:(BOOL)a3
{
  self->_recordingInterruptedByUser = a3;
}

- (BOOL)recordingInterruptedBySystem
{
  return self->_recordingInterruptedBySystem;
}

- (void)setRecordingInterruptedBySystem:(BOOL)a3
{
  self->_recordingInterruptedBySystem = a3;
}

- (BOOL)recordingInterruptedByRouteChange
{
  return self->_recordingInterruptedByRouteChange;
}

- (void)setRecordingInterruptedByRouteChange:(BOOL)a3
{
  self->_recordingInterruptedByRouteChange = a3;
}

- (BOOL)isAReply
{
  return self->_isAReply;
}

- (void)setIsAReply:(BOOL)a3
{
  self->_isAReply = a3;
}

- (NSNumber)routeChangeInterruptionReason
{
  return self->_routeChangeInterruptionReason;
}

- (void)setRouteChangeInterruptionReason:(id)a3
{
}

- (NSString)recipientAnnouncementID
{
  return self->_recipientAnnouncementID;
}

- (void)setRecipientAnnouncementID:(id)a3
{
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
  objc_storeStrong((id *)&self->_recipientAnnouncementID, 0);
  objc_storeStrong((id *)&self->_routeChangeInterruptionReason, 0);
  objc_storeStrong((id *)&self->_announceRecordingIsForRoom, 0);
  objc_storeStrong((id *)&self->_announceRecordingIsForHome, 0);
  objc_storeStrong((id *)&self->_recordingFailed, 0);
  objc_storeStrong((id *)&self->_recordingDuration, 0);
}

@end