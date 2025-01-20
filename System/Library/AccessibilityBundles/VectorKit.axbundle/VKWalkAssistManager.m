@interface VKWalkAssistManager
- (AVAudioPlayer)audioPlayer;
- (BOOL)hasArrived;
- (BOOL)isInWalkingNavigatingState;
- (BOOL)isRunning;
- (NSString)lastAssistStatusAnnouncement;
- (NSString)startRouteRoadName;
- (VKWalkAssistFeedbackProcessor)feedbackProcessor;
- (VKWalkAssistHapticEngine)hapticEngine;
- (VKWalkAssistHeadingManager)headingManager;
- (VKWalkAssistManager)init;
- (VKWalkAssistStatus)assistStatus;
- (double)_bearingFromCurrentLocation:(id)a3 toEndLocation:(id)a4;
- (double)bearing;
- (id)_startRouteLocation;
- (void)_queueAssistStatusAnnouncement:(id)a3;
- (void)_startObservingNavigationUpdates;
- (void)_stopObservingNavigationUpdates;
- (void)didArrive:(BOOL)a3;
- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)navigationService:(id)a3 didReroute:(id)a4;
- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6;
- (void)navigationService:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)setArrived:(BOOL)a3;
- (void)setAssistStatus:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setBearing:(double)a3;
- (void)setFeedbackProcessor:(id)a3;
- (void)setHapticEngine:(id)a3;
- (void)setHeadingManager:(id)a3;
- (void)setLastAssistStatusAnnouncement:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setStartRouteRoadName:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation VKWalkAssistManager

- (VKWalkAssistManager)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)VKWalkAssistManager;
  v2 = [(VKWalkAssistManager *)&v21 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [v3 URLForResource:@"point_reached" withExtension:@"aiff"];
    id v20 = 0;
    uint64_t v5 = [objc_alloc(MEMORY[0x263EF93B8]) initWithContentsOfURL:v4 error:&v20];
    id v6 = v20;
    audioPlayer = v2->_audioPlayer;
    v2->_audioPlayer = (AVAudioPlayer *)v5;

    if (v6)
    {
      v8 = AXLogTemp();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_impl(&dword_2426A3000, v8, OS_LOG_TYPE_INFO, "Cannot read audio file: %@", buf, 0xCu);
      }
    }
    v9 = objc_alloc_init(VKWalkAssistHapticEngine);
    hapticEngine = v2->_hapticEngine;
    v2->_hapticEngine = v9;

    v11 = [[VKWalkAssistHeadingManager alloc] initWithHapticEngineDelegate:v2->_hapticEngine];
    headingManager = v2->_headingManager;
    v2->_headingManager = v11;

    v13 = [[VKToneGenerator alloc] initWithHapticEngineDelegate:v2->_hapticEngine];
    v14 = [[VKWalkAssistFeedbackProcessor alloc] initWithToneGenerator:v13];
    feedbackProcessor = v2->_feedbackProcessor;
    v2->_feedbackProcessor = v14;

    v16 = [[VKWalkAssistStatus alloc] initWithArrivalRadius:v2 delegate:8.0];
    assistStatus = v2->_assistStatus;
    v2->_assistStatus = v16;

    v18 = v2;
  }

  return v2;
}

- (void)start
{
  [(VKWalkAssistManager *)self setRunning:1];
  v3 = [(VKWalkAssistManager *)self hapticEngine];
  [v3 start];

  v4 = [(VKWalkAssistManager *)self feedbackProcessor];
  [v4 setShouldPlayAudio:1];

  [(VKWalkAssistManager *)self _startObservingNavigationUpdates];
}

- (void)stop
{
  [(VKWalkAssistManager *)self setRunning:0];
  v3 = [(VKWalkAssistManager *)self hapticEngine];
  [v3 stop];

  v4 = [(VKWalkAssistManager *)self feedbackProcessor];
  [v4 stopProcessing];

  [(VKWalkAssistManager *)self _stopObservingNavigationUpdates];
}

- (BOOL)isInWalkingNavigatingState
{
  v2 = [MEMORY[0x263F580E0] sharedService];
  if ([v2 isInNavigatingState])
  {
    v3 = [MEMORY[0x263F580E0] sharedService];
    BOOL v4 = [v3 navigationTransportType] == 2;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_startObservingNavigationUpdates
{
  id v3 = [MEMORY[0x263F580E0] sharedService];
  [v3 registerObserver:self];
}

- (void)_stopObservingNavigationUpdates
{
  id v3 = [MEMORY[0x263F580E0] sharedService];
  [v3 unregisterObserver:self];
}

- (id)_startRouteLocation
{
  id v3 = [MEMORY[0x263F580E0] sharedService];
  BOOL v4 = [v3 route];

  objc_opt_class();
  uint64_t v5 = [v4 steps];
  id v6 = [v5 firstObject];
  v7 = __UIAccessibilityCastAsClass();

  objc_msgSend(v4, "pointAtRouteCoordinate:", objc_msgSend(v7, "startRouteCoordinate"));
  double v9 = v8;
  double v11 = v10;
  v12 = [v7 maneuverRoadName];
  [(VKWalkAssistManager *)self setStartRouteRoadName:v12];

  v13 = (void *)[objc_alloc(MEMORY[0x263F580D8]) initWithLatitude:v9 longitude:v11];

  return v13;
}

- (void)_queueAssistStatusAnnouncement:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    BOOL v4 = [(VKWalkAssistManager *)self lastAssistStatusAnnouncement];
    char v5 = [v4 isEqualToString:v8];

    if ((v5 & 1) == 0)
    {
      id v6 = +[VKMapViewOutputManager sharedOutputManager];
      [v6 clearOutputQueue];

      v7 = +[VKMapViewOutputManager sharedOutputManager];
      [v7 queueOutput:v8];
    }
  }
  [(VKWalkAssistManager *)self setLastAssistStatusAnnouncement:v8];
}

- (void)navigationService:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  if (UIAccessibilityIsVoiceOverRunning() || self->_arrived)
  {
    id v9 = [(VKWalkAssistManager *)self headingManager];
    [(VKWalkAssistManager *)self bearing];
    [v9 updateHeading:a4 bearing:v7];
  }
  else
  {
    [(VKWalkAssistManager *)self stop];
    id v8 = AXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2426A3000, v8, OS_LOG_TYPE_DEFAULT, "Unable to continue walk assist without VoiceOver", buf, 2u);
    }
  }
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5 = a4;
  if (UIAccessibilityIsVoiceOverRunning() || self->_arrived)
  {
    if (CFAbsoluteTimeGetCurrent() - *(double *)&navigationService_didUpdateMatchedLocation__LastProcessTime >= 0.5)
    {
      navigationService_didUpdateMatchedLocation__LastProcessTime = CFAbsoluteTimeGetCurrent();
      id v6 = [(VKWalkAssistManager *)self _startRouteLocation];
      [(VKWalkAssistManager *)self _bearingFromCurrentLocation:v5 toEndLocation:v6];
      -[VKWalkAssistManager setBearing:](self, "setBearing:");
      double v7 = [(VKWalkAssistManager *)self assistStatus];
      id v8 = [(VKWalkAssistManager *)self headingManager];
      id v9 = [(VKWalkAssistManager *)self feedbackProcessor];
      [v5 speed];
      BOOL v11 = v10 <= 0.35;
      [v5 coordinate];
      [v5 coordinate];
      [v6 coordinate];
      [v6 coordinate];
      GEOCalculateDistance();
      double v13 = v12;
      uint64_t v14 = [v8 isFacingStartLocation];
      uint64_t v15 = [v8 isFacingStartLocation];
      [v9 processPulseFeedbackForDistance:(int)v13 shouldProcessHapticPulse:v14];
      [v7 updateAssistStatusWithCurrentDistance:self->_startRouteRoadName startRouteRoadName:v15 isFacingStartLocation:v11 isStationary:v13];
    }
  }
  else
  {
    [(VKWalkAssistManager *)self stop];
    v16 = AXLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2426A3000, v16, OS_LOG_TYPE_DEFAULT, "Unable to continue walk assist without VoiceOver", v17, 2u);
    }
  }
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  if (a4 != 2) {
    [(VKWalkAssistManager *)self stop];
  }
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7 = a3;
  if (a5 >= 4)
  {
    if (a5 - 4 >= 3) {
      goto LABEL_6;
    }
    id v8 = v7;
    [(VKWalkAssistManager *)self start];
  }
  else
  {
    id v8 = v7;
    [(VKWalkAssistManager *)self stop];
  }
  id v7 = v8;
LABEL_6:
}

- (void)navigationService:(id)a3 didReroute:(id)a4
{
  if (self->_arrived) {
    -[VKWalkAssistManager setArrived:](self, "setArrived:", 0, a4);
  }
}

- (double)_bearingFromCurrentLocation:(id)a3 toEndLocation:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 coordinate];
  [v6 coordinate];

  [v5 coordinate];
  [v5 coordinate];

  GEOBearingFromCoordinateToCoordinate();
  return result;
}

- (void)didArrive:(BOOL)a3
{
  if (a3)
  {
    [(AVAudioPlayer *)self->_audioPlayer play];
    [(VKWalkAssistManager *)self setArrived:1];
    [(VKWalkAssistManager *)self stop];
  }
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)hasArrived
{
  return self->_arrived;
}

- (void)setArrived:(BOOL)a3
{
  self->_arrived = a3;
}

- (double)bearing
{
  return self->_bearing;
}

- (void)setBearing:(double)a3
{
  self->_bearing = a3;
}

- (VKWalkAssistHeadingManager)headingManager
{
  return self->_headingManager;
}

- (void)setHeadingManager:(id)a3
{
}

- (VKWalkAssistStatus)assistStatus
{
  return self->_assistStatus;
}

- (void)setAssistStatus:(id)a3
{
}

- (VKWalkAssistFeedbackProcessor)feedbackProcessor
{
  return self->_feedbackProcessor;
}

- (void)setFeedbackProcessor:(id)a3
{
}

- (VKWalkAssistHapticEngine)hapticEngine
{
  return self->_hapticEngine;
}

- (void)setHapticEngine:(id)a3
{
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (NSString)lastAssistStatusAnnouncement
{
  return self->_lastAssistStatusAnnouncement;
}

- (void)setLastAssistStatusAnnouncement:(id)a3
{
}

- (NSString)startRouteRoadName
{
  return self->_startRouteRoadName;
}

- (void)setStartRouteRoadName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startRouteRoadName, 0);
  objc_storeStrong((id *)&self->_lastAssistStatusAnnouncement, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_hapticEngine, 0);
  objc_storeStrong((id *)&self->_feedbackProcessor, 0);
  objc_storeStrong((id *)&self->_assistStatus, 0);

  objc_storeStrong((id *)&self->_headingManager, 0);
}

@end