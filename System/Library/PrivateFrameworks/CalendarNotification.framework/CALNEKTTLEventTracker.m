@interface CALNEKTTLEventTracker
+ (CALNEKTTLEventTracker)sharedInstance;
- (void)trackDirectionsEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6;
- (void)trackEmailEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6;
- (void)trackEventFiredTTLAlertWithAlertType:(unint64_t)a3 transportType:(unint64_t)a4 etaType:(unint64_t)a5 travelState:(unint64_t)a6 hasSuggestedLocation:(BOOL)a7 isOnSharedCalendar:(BOOL)a8;
@end

@implementation CALNEKTTLEventTracker

+ (CALNEKTTLEventTracker)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__CALNEKTTLEventTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return (CALNEKTTLEventTracker *)v2;
}

uint64_t __39__CALNEKTTLEventTracker_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)trackDirectionsEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
}

- (void)trackEventFiredTTLAlertWithAlertType:(unint64_t)a3 transportType:(unint64_t)a4 etaType:(unint64_t)a5 travelState:(unint64_t)a6 hasSuggestedLocation:(BOOL)a7 isOnSharedCalendar:(BOOL)a8
{
}

- (void)trackEmailEngagedForTTLAlertWithTransportType:(unint64_t)a3 etaType:(unint64_t)a4 hasSuggestedLocation:(BOOL)a5 isOnSharedCalendar:(BOOL)a6
{
}

@end