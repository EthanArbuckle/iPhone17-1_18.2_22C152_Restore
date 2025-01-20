@interface BiometricPresenceDetectOperation
- (int)type;
- (unsigned)cancelledMessage;
@end

@implementation BiometricPresenceDetectOperation

- (int)type
{
  return 3;
}

- (unsigned)cancelledMessage
{
  return 99;
}

@end