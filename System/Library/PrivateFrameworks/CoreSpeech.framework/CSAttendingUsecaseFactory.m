@interface CSAttendingUsecaseFactory
+ (id)attendingUseCaseByAttendingType:(int64_t)a3;
@end

@implementation CSAttendingUsecaseFactory

+ (id)attendingUseCaseByAttendingType:(int64_t)a3
{
  v3 = objc_alloc_init(CSAttendingSpeechDetectionController);
  return v3;
}

@end