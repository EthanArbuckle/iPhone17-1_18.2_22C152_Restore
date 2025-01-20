@interface GKReporter
+ (id)reporter;
- (BOOL)isTimeSpanValid:(double)a3 maxDuration:(double)a4;
- (double)appLaunchTimestamp;
- (double)authenticateResponseTimestamp;
- (double)connectingDevicesTimestamp;
- (double)currentRealtimeMatchPersistenceTimestamp;
- (double)inviteeUILaunchTimestamp;
- (double)messageInviteProcessingTimestamp;
- (double)programaticInviteTimestamp;
- (double)totalInviteReceivedTimestamp;
- (void)recordAppLaunchAndTotalTimestamp;
- (void)recordAuthenticateResponseTimestamp;
- (void)recordConnectingDevicesTimestamp;
- (void)recordCurrentRealtimeMatchPersistenceTimestamp;
- (void)recordInviteeUILaunchTimestamp;
- (void)recordMessageInviteProcessingTimestamp;
- (void)recordProgramaticInviteTimestamp;
- (void)reportAppLaunchDuration;
- (void)reportAuthenticateResponseDuration;
- (void)reportConnectingDevicesDuration;
- (void)reportCurrentRealtimeMatchPersistenceDuration;
- (void)reportDurationForEvent:(id)a3 eventType:(id)a4 withStartTimestamp:(double)a5;
- (void)reportEvent:(id)a3 eventType:(id)a4 duration:(double)a5 refApp:(id)a6;
- (void)reportEvent:(id)a3 payload:(id)a4;
- (void)reportEvent:(id)a3 reportable:(id)a4;
- (void)reportEvent:(id)a3 target:(id)a4 keyPath:(id)a5;
- (void)reportEvent:(id)a3 type:(id)a4;
- (void)reportEvent:(id)a3 type:(id)a4 adamID:(id)a5;
- (void)reportEvent:(id)a3 type:(id)a4 bundleID:(id)a5;
- (void)reportEvent:(id)a3 type:(id)a4 count:(int64_t)a5;
- (void)reportEvent:(id)a3 type:(id)a4 friendsPlayedThisGame:(id)a5;
- (void)reportEvent:(id)a3 type:(id)a4 inboxFriendRequestCount:(int64_t)a5;
- (void)reportEvent:(id)a3 type:(id)a4 payload:(id)a5;
- (void)reportEvent:(id)a3 type:(id)a4 scoreRank:(id)a5;
- (void)reportEvent:(id)a3 type:(id)a4 startTime:(id)a5;
- (void)reportEvent:(id)a3 type:(id)a4 startTime:(id)a5 refApp:(id)a6;
- (void)reportInviteeUILaunchDuration;
- (void)reportMessageInviteProcessingDuration;
- (void)reportOnboardingEventForType:(id)a3 withStartTimestamp:(double)a4 refApp:(id)a5;
- (void)reportPlayerAuthenticationFailure:(id)a3;
- (void)reportProgramaticInviteDuration;
- (void)reportScreenTimeEventForType:(id)a3 withStartTimestamp:(double)a4;
- (void)reportTotalInviteReceivedDuration;
- (void)setAppLaunchTimestamp:(double)a3;
- (void)setAuthenticateResponseTimestamp:(double)a3;
- (void)setConnectingDevicesTimestamp:(double)a3;
- (void)setCurrentRealtimeMatchPersistenceTimestamp:(double)a3;
- (void)setInviteeUILaunchTimestamp:(double)a3;
- (void)setMessageInviteProcessingTimestamp:(double)a3;
- (void)setProgramaticInviteTimestamp:(double)a3;
- (void)setTotalInviteReceivedTimestamp:(double)a3;
@end

@implementation GKReporter

+ (id)reporter
{
  if (reporter_sDispatchOnceToken_0 != -1) {
    dispatch_once(&reporter_sDispatchOnceToken_0, &__block_literal_global_51);
  }
  v2 = (void *)reporter_sReporter_0;

  return v2;
}

uint64_t __22__GKReporter_reporter__block_invoke()
{
  v0 = objc_alloc_init(GKReporter);
  uint64_t v1 = reporter_sReporter_0;
  reporter_sReporter_0 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)reportEvent:(id)a3 payload:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!os_log_GKGeneral) {
    id v7 = GKOSLoggers();
  }
  v8 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_INFO, "GKReporter: report domain: %@, payload: %@", (uint8_t *)&v9, 0x16u);
  }
  AnalyticsSendEvent();
}

- (void)reportEvent:(id)a3 type:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v10 = @"eventType";
  v11[0] = a4;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  id v8 = a3;
  int v9 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(GKReporter *)self reportEvent:v8 payload:v9];
}

- (void)reportEvent:(id)a3 type:(id)a4 startTime:(id)a5
{
}

- (void)reportEvent:(id)a3 type:(id)a4 startTime:(id)a5 refApp:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1E4F1C9C8];
  id v13 = a5;
  v14 = [v12 now];
  [v14 timeIntervalSinceDate:v13];
  double v16 = v15;

  if ([(GKReporter *)self isTimeSpanValid:v16 maxDuration:3600.0]) {
    [(GKReporter *)self reportEvent:v17 eventType:v10 duration:v11 refApp:v16];
  }
}

- (void)reportEvent:(id)a3 type:(id)a4 bundleID:(id)a5
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"eventType";
  v12[1] = @"bundleID";
  v13[0] = a4;
  v13[1] = a5;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 dictionaryWithObjects:v13 forKeys:v12 count:2];

  AnalyticsSendEvent();
}

- (void)reportEvent:(id)a3 type:(id)a4 adamID:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    v16[0] = @"eventType";
    v16[1] = @"adamID";
    v17[0] = a4;
    id v8 = a4;
    id v9 = a3;
    id v10 = [a5 stringValue];
    v17[1] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

    [(GKReporter *)self reportEvent:v9 payload:v11];
  }
  else
  {
    v14 = @"eventType";
    id v15 = a4;
    id v12 = (void *)MEMORY[0x1E4F1C9E8];
    id v13 = a4;
    id v11 = a3;
    id v10 = [v12 dictionaryWithObjects:&v15 forKeys:&v14 count:1];

    [(GKReporter *)self reportEvent:v11 payload:v10];
  }
}

- (void)reportEvent:(id)a3 type:(id)a4 payload:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4)
  {
    id v15 = @"eventType";
    v16[0] = a4;
    id v11 = (void *)MEMORY[0x1E4F1C9E8];
    id v12 = a4;
    id v13 = [v11 dictionaryWithObjects:v16 forKeys:&v15 count:1];

    id v14 = (id)[v13 mutableCopy];
    [v14 addEntriesFromDictionary:v10];
  }
  else
  {
    id v14 = v9;
  }
  [(GKReporter *)self reportEvent:v8 payload:v14];
}

- (void)reportEvent:(id)a3 type:(id)a4 friendsPlayedThisGame:(id)a5
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"eventType";
  v13[1] = @"friendsPlayedThisGame";
  v14[0] = a4;
  v14[1] = a5;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 dictionaryWithObjects:v14 forKeys:v13 count:2];

  [(GKReporter *)self reportEvent:v11 payload:v12];
}

- (void)reportEvent:(id)a3 type:(id)a4 count:(int64_t)a5
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"eventType";
  v13[1] = @"count";
  v14[0] = a4;
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 numberWithInteger:a5];
  v14[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  [(GKReporter *)self reportEvent:v10 payload:v12];
}

- (void)reportEvent:(id)a3 type:(id)a4 inboxFriendRequestCount:(int64_t)a5
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"eventType";
  v13[1] = @"inboxFriendRequestCount";
  v14[0] = a4;
  id v8 = NSNumber;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 numberWithInteger:a5];
  v14[1] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  [(GKReporter *)self reportEvent:v10 payload:v12];
}

- (void)reportEvent:(id)a3 type:(id)a4 scoreRank:(id)a5
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"eventType";
  v13[1] = @"scoreRank";
  v14[0] = a4;
  v14[1] = a5;
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 dictionaryWithObjects:v14 forKeys:v13 count:2];

  [(GKReporter *)self reportEvent:v11 payload:v12];
}

- (void)reportEvent:(id)a3 target:(id)a4 keyPath:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 valueForKeyPath:v8];
  id v13 = v8;
  id v11 = [v10 description];
  v14[0] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  [(GKReporter *)self reportEvent:v9 payload:v12];
}

- (void)reportEvent:(id)a3 reportable:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() reportableKeyPaths];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        id v13 = +[GKReporter reporter];
        [v13 reportEvent:v5 target:v6 keyPath:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (BOOL)isTimeSpanValid:(double)a3 maxDuration:(double)a4
{
  return a3 < a4 && a3 > 0.0;
}

- (void)recordAuthenticateResponseTimestamp
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(GKReporter *)self setAuthenticateResponseTimestamp:Current];
}

- (void)reportAuthenticateResponseDuration
{
  [(GKReporter *)self authenticateResponseTimestamp];
  if (v3 > 0.0)
  {
    [(GKReporter *)self authenticateResponseTimestamp];
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", @"com.apple.GameKit.Invite.ReceivedTime", @"GKAuthenticateResponseTime");
    [(GKReporter *)self setAuthenticateResponseTimestamp:-1.0];
  }
}

- (void)recordInviteeUILaunchTimestamp
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(GKReporter *)self setInviteeUILaunchTimestamp:Current];
}

- (void)reportInviteeUILaunchDuration
{
  [(GKReporter *)self inviteeUILaunchTimestamp];
  if (v3 > 0.0)
  {
    [(GKReporter *)self inviteeUILaunchTimestamp];
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", @"com.apple.GameKit.Invite.ReceivedTime", @"GKInviteeUILaunchTime");
    [(GKReporter *)self setInviteeUILaunchTimestamp:-1.0];
  }
}

- (void)recordMessageInviteProcessingTimestamp
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(GKReporter *)self setMessageInviteProcessingTimestamp:Current];
}

- (void)reportMessageInviteProcessingDuration
{
  [(GKReporter *)self messageInviteProcessingTimestamp];
  if (v3 > 0.0)
  {
    [(GKReporter *)self messageInviteProcessingTimestamp];
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", @"com.apple.GameKit.Invite.ReceivedTime", @"GKMessageInviteProcessingTime");
    [(GKReporter *)self setMessageInviteProcessingTimestamp:-1.0];
  }
}

- (void)recordConnectingDevicesTimestamp
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(GKReporter *)self setConnectingDevicesTimestamp:Current];
}

- (void)reportConnectingDevicesDuration
{
  [(GKReporter *)self connectingDevicesTimestamp];
  if (v3 > 0.0)
  {
    [(GKReporter *)self connectingDevicesTimestamp];
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", @"com.apple.GameKit.Invite.ReceivedTime", @"GKConnectingDevicesTime");
    [(GKReporter *)self setConnectingDevicesTimestamp:-1.0];
  }
}

- (void)recordProgramaticInviteTimestamp
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(GKReporter *)self setProgramaticInviteTimestamp:Current];
}

- (void)reportProgramaticInviteDuration
{
  [(GKReporter *)self programaticInviteTimestamp];
  if (v3 > 0.0)
  {
    [(GKReporter *)self programaticInviteTimestamp];
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", @"com.apple.GameKit.Invite.ReceivedTime", @"GKProgramaticInviteTime");
    [(GKReporter *)self setProgramaticInviteTimestamp:-1.0];
  }
}

- (void)recordAppLaunchAndTotalTimestamp
{
  [(GKReporter *)self setAppLaunchTimestamp:CFAbsoluteTimeGetCurrent()];
  double Current = CFAbsoluteTimeGetCurrent();

  [(GKReporter *)self setTotalInviteReceivedTimestamp:Current];
}

- (void)reportAppLaunchDuration
{
  [(GKReporter *)self appLaunchTimestamp];
  if (v3 > 0.0)
  {
    [(GKReporter *)self appLaunchTimestamp];
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", @"com.apple.GameKit.Invite.ReceivedTime", @"GKAppLaunchTime");
    [(GKReporter *)self setAppLaunchTimestamp:-1.0];
  }
}

- (void)reportTotalInviteReceivedDuration
{
  [(GKReporter *)self totalInviteReceivedTimestamp];
  if (v3 > 0.0)
  {
    [(GKReporter *)self totalInviteReceivedTimestamp];
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", @"com.apple.GameKit.Invite.ReceivedTime", @"GKTotalInviteReceivedTime");
    [(GKReporter *)self setTotalInviteReceivedTimestamp:-1.0];
  }
}

- (void)recordCurrentRealtimeMatchPersistenceTimestamp
{
  double Current = CFAbsoluteTimeGetCurrent();

  [(GKReporter *)self setCurrentRealtimeMatchPersistenceTimestamp:Current];
}

- (void)reportCurrentRealtimeMatchPersistenceDuration
{
  [(GKReporter *)self currentRealtimeMatchPersistenceTimestamp];
  if (v3 > 0.0)
  {
    [(GKReporter *)self currentRealtimeMatchPersistenceTimestamp];
    -[GKReporter reportDurationForEvent:eventType:withStartTimestamp:](self, "reportDurationForEvent:eventType:withStartTimestamp:", @"com.apple.GameKit.multiplayer.realtime.connectionResult", @"GKRealtimeMatchPersistenceTime");
    [(GKReporter *)self setCurrentRealtimeMatchPersistenceTimestamp:-1.0];
  }
}

- (void)reportScreenTimeEventForType:(id)a3 withStartTimestamp:(double)a4
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = CFAbsoluteTimeGetCurrent() - a4;
  if ([(GKReporter *)self isTimeSpanValid:v7 maxDuration:600.0])
  {
    v10[0] = @"eventType";
    v10[1] = @"timeSpan";
    v11[0] = v6;
    uint64_t v8 = [NSNumber numberWithDouble:v7];
    v11[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    [(GKReporter *)self reportEvent:@"com.apple.GameKit.GameLayerDashboard" payload:v9];
  }
}

- (void)reportOnboardingEventForType:(id)a3 withStartTimestamp:(double)a4 refApp:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  double v9 = CFAbsoluteTimeGetCurrent() - a4;
  if ([(GKReporter *)self isTimeSpanValid:v9 maxDuration:900.0]) {
    [(GKReporter *)self reportEvent:@"com.apple.GameKit.Onboarding" eventType:v10 duration:v8 refApp:v9];
  }
}

- (void)reportEvent:(id)a3 eventType:(id)a4 duration:(double)a5 refApp:(id)a6
{
  id v10 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v16 = objc_alloc_init(v10);
  [v16 setObject:v12 forKeyedSubscript:@"eventType"];

  long long v14 = [NSNumber numberWithDouble:a5];
  [v16 setObject:v14 forKeyedSubscript:@"timeSpan"];

  [v16 setObject:v11 forKeyedSubscript:@"refApp"];
  long long v15 = (void *)[v16 copy];
  [(GKReporter *)self reportEvent:v13 payload:v15];
}

- (void)reportDurationForEvent:(id)a3 eventType:(id)a4 withStartTimestamp:(double)a5
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = CFAbsoluteTimeGetCurrent() - a5;
  if ([(GKReporter *)self isTimeSpanValid:v10 maxDuration:3600.0])
  {
    v13[0] = @"eventType";
    v13[1] = @"timeSpan";
    v14[0] = v9;
    id v11 = [NSNumber numberWithDouble:v10];
    v14[1] = v11;
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    [(GKReporter *)self reportEvent:v8 payload:v12];
  }
}

- (void)reportPlayerAuthenticationFailure:(id)a3
{
  unint64_t v4 = [a3 code] - 5000;
  if (v4 > 0xAA) {
    id v5 = @"GKReporterPlayerAuthenticationFailureUnknownReason";
  }
  else {
    id v5 = off_1E6471F60[v4];
  }

  [(GKReporter *)self reportEvent:@"com.apple.GameKit.PlayerAuthentication" type:v5];
}

- (double)authenticateResponseTimestamp
{
  return self->_authenticateResponseTimestamp;
}

- (void)setAuthenticateResponseTimestamp:(double)a3
{
  self->_authenticateResponseTimestamp = a3;
}

- (double)inviteeUILaunchTimestamp
{
  return self->_inviteeUILaunchTimestamp;
}

- (void)setInviteeUILaunchTimestamp:(double)a3
{
  self->_inviteeUILaunchTimestamp = a3;
}

- (double)connectingDevicesTimestamp
{
  return self->_connectingDevicesTimestamp;
}

- (void)setConnectingDevicesTimestamp:(double)a3
{
  self->_connectingDevicesTimestamp = a3;
}

- (double)programaticInviteTimestamp
{
  return self->_programaticInviteTimestamp;
}

- (void)setProgramaticInviteTimestamp:(double)a3
{
  self->_programaticInviteTimestamp = a3;
}

- (double)appLaunchTimestamp
{
  return self->_appLaunchTimestamp;
}

- (void)setAppLaunchTimestamp:(double)a3
{
  self->_appLaunchTimestamp = a3;
}

- (double)totalInviteReceivedTimestamp
{
  return self->_totalInviteReceivedTimestamp;
}

- (void)setTotalInviteReceivedTimestamp:(double)a3
{
  self->_totalInviteReceivedTimestamp = a3;
}

- (double)messageInviteProcessingTimestamp
{
  return self->_messageInviteProcessingTimestamp;
}

- (void)setMessageInviteProcessingTimestamp:(double)a3
{
  self->_messageInviteProcessingTimestamp = a3;
}

- (double)currentRealtimeMatchPersistenceTimestamp
{
  return self->_currentRealtimeMatchPersistenceTimestamp;
}

- (void)setCurrentRealtimeMatchPersistenceTimestamp:(double)a3
{
  self->_currentRealtimeMatchPersistenceTimestamp = a3;
}

@end