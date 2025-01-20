@interface HFAnalyticsAnnouncePlaybackEvent
- (BOOL)playbackInterruptedByRouteChange;
- (BOOL)playbackInterruptedBySystem;
- (BOOL)playbackInterruptedByUser;
- (HFAnalyticsAnnouncePlaybackEvent)initWithData:(id)a3;
- (NSNumber)audioTranscriptionsAreEnabled;
- (NSNumber)playbackDuration;
- (NSNumber)playbackFailed;
- (NSNumber)routeChangeInterruptionReason;
- (NSString)playbackAnnouncementID;
- (NSString)processName;
- (id)payload;
- (void)setAudioTranscriptionsAreEnabled:(id)a3;
- (void)setPlaybackAnnouncementID:(id)a3;
- (void)setPlaybackDuration:(id)a3;
- (void)setPlaybackFailed:(id)a3;
- (void)setPlaybackInterruptedByRouteChange:(BOOL)a3;
- (void)setPlaybackInterruptedBySystem:(BOOL)a3;
- (void)setPlaybackInterruptedByUser:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setRouteChangeInterruptionReason:(id)a3;
@end

@implementation HFAnalyticsAnnouncePlaybackEvent

- (HFAnalyticsAnnouncePlaybackEvent)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"playbackDuration"];
  if (!v5) {
    NSLog(&cfstr_Hfanalyticsann_12.isa);
  }
  v6 = [v4 objectForKeyedSubscript:@"playbackFailed"];
  if (!v6) {
    NSLog(&cfstr_Hfanalyticsann_13.isa);
  }
  v7 = [v4 objectForKeyedSubscript:@"audioTranscriptionsAreEnabled"];
  if (!v7) {
    NSLog(&cfstr_Hfanalyticsaud.isa);
  }
  v21.receiver = self;
  v21.super_class = (Class)HFAnalyticsAnnouncePlaybackEvent;
  v8 = [(HFAnalyticsEvent *)&v21 initWithEventType:19];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_playbackDuration, v5);
    objc_storeStrong((id *)&v9->_playbackFailed, v6);
    v10 = [v4 objectForKeyedSubscript:@"playbackWasInterruptedByUser"];
    v9->_playbackInterruptedByUser = [v10 BOOLValue];

    v11 = [v4 objectForKeyedSubscript:@"recordingWasInterruptedBySystem"];
    v9->_playbackInterruptedBySystem = [v11 BOOLValue];

    v12 = [v4 objectForKeyedSubscript:@"playbackWasInterruptedByRouteChange"];
    v9->_playbackInterruptedByRouteChange = [v12 BOOLValue];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"routeChangeInterruptionReason"];
    routeChangeInterruptionReason = v9->_routeChangeInterruptionReason;
    v9->_routeChangeInterruptionReason = (NSNumber *)v13;

    uint64_t v15 = [v4 objectForKeyedSubscript:@"playbackAnnouncementID"];
    playbackAnnouncementID = v9->_playbackAnnouncementID;
    v9->_playbackAnnouncementID = (NSString *)v15;

    objc_storeStrong((id *)&v9->_audioTranscriptionsAreEnabled, v7);
    v17 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v18 = [v17 processName];
    processName = v9->_processName;
    v9->_processName = (NSString *)v18;
  }
  return v9;
}

- (id)payload
{
  v17.receiver = self;
  v17.super_class = (Class)HFAnalyticsAnnouncePlaybackEvent;
  v3 = [(HFAnalyticsEvent *)&v17 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsAnnouncePlaybackEvent *)self playbackDuration];
  [v4 setObject:v5 forKeyedSubscript:@"playbackDuration"];

  v6 = [(HFAnalyticsAnnouncePlaybackEvent *)self playbackFailed];
  [v4 setObject:v6 forKeyedSubscript:@"playbackFailed"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAnnouncePlaybackEvent playbackInterruptedByUser](self, "playbackInterruptedByUser"));
  [v4 setObject:v7 forKeyedSubscript:@"playbackWasInterruptedByUser"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAnnouncePlaybackEvent playbackInterruptedBySystem](self, "playbackInterruptedBySystem"));
  [v4 setObject:v8 forKeyedSubscript:@"playbackWasInterruptedBySystem"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsAnnouncePlaybackEvent playbackInterruptedByRouteChange](self, "playbackInterruptedByRouteChange"));
  [v4 setObject:v9 forKeyedSubscript:@"playbackWasInterruptedByRouteChange"];

  v10 = [(HFAnalyticsAnnouncePlaybackEvent *)self routeChangeInterruptionReason];

  if (v10)
  {
    v11 = [(HFAnalyticsAnnouncePlaybackEvent *)self routeChangeInterruptionReason];
    [v4 setObject:v11 forKeyedSubscript:@"routeChangeInterruptionReason"];
  }
  v12 = [(HFAnalyticsAnnouncePlaybackEvent *)self playbackAnnouncementID];

  if (v12)
  {
    uint64_t v13 = [(HFAnalyticsAnnouncePlaybackEvent *)self playbackAnnouncementID];
    [v4 setObject:v13 forKeyedSubscript:@"playbackAnnouncementID"];
  }
  v14 = [(HFAnalyticsAnnouncePlaybackEvent *)self audioTranscriptionsAreEnabled];
  [v4 setObject:v14 forKeyedSubscript:@"audioTranscriptionsAreEnabled"];

  uint64_t v15 = [(HFAnalyticsAnnouncePlaybackEvent *)self processName];
  [v4 setObject:v15 forKeyedSubscript:@"processName"];

  return v4;
}

- (NSNumber)playbackDuration
{
  return self->_playbackDuration;
}

- (void)setPlaybackDuration:(id)a3
{
}

- (NSNumber)playbackFailed
{
  return self->_playbackFailed;
}

- (void)setPlaybackFailed:(id)a3
{
}

- (BOOL)playbackInterruptedByUser
{
  return self->_playbackInterruptedByUser;
}

- (void)setPlaybackInterruptedByUser:(BOOL)a3
{
  self->_playbackInterruptedByUser = a3;
}

- (BOOL)playbackInterruptedBySystem
{
  return self->_playbackInterruptedBySystem;
}

- (void)setPlaybackInterruptedBySystem:(BOOL)a3
{
  self->_playbackInterruptedBySystem = a3;
}

- (BOOL)playbackInterruptedByRouteChange
{
  return self->_playbackInterruptedByRouteChange;
}

- (void)setPlaybackInterruptedByRouteChange:(BOOL)a3
{
  self->_playbackInterruptedByRouteChange = a3;
}

- (NSNumber)routeChangeInterruptionReason
{
  return self->_routeChangeInterruptionReason;
}

- (void)setRouteChangeInterruptionReason:(id)a3
{
}

- (NSString)playbackAnnouncementID
{
  return self->_playbackAnnouncementID;
}

- (void)setPlaybackAnnouncementID:(id)a3
{
}

- (NSNumber)audioTranscriptionsAreEnabled
{
  return self->_audioTranscriptionsAreEnabled;
}

- (void)setAudioTranscriptionsAreEnabled:(id)a3
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
  objc_storeStrong((id *)&self->_audioTranscriptionsAreEnabled, 0);
  objc_storeStrong((id *)&self->_playbackAnnouncementID, 0);
  objc_storeStrong((id *)&self->_routeChangeInterruptionReason, 0);
  objc_storeStrong((id *)&self->_playbackFailed, 0);
  objc_storeStrong((id *)&self->_playbackDuration, 0);
}

@end