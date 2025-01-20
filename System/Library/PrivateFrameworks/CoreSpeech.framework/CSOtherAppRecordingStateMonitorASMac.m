@interface CSOtherAppRecordingStateMonitorASMac
+ (id)sharedInstance;
- (BOOL)isOtherNonEligibleAppRecording;
@end

@implementation CSOtherAppRecordingStateMonitorASMac

- (BOOL)isOtherNonEligibleAppRecording
{
  return 0;
}

+ (id)sharedInstance
{
  if (qword_1002A36A8 != -1) {
    dispatch_once(&qword_1002A36A8, &stru_10024F0A0);
  }
  v2 = (void *)qword_1002A36A0;
  return v2;
}

@end