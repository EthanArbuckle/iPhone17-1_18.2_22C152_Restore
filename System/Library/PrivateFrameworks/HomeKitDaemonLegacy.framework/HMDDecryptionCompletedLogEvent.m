@interface HMDDecryptionCompletedLogEvent
+ (id)decryptionCompletedWithFailure:(BOOL)a3;
- (BOOL)didDecryptionFail;
- (HMDDecryptionCompletedLogEvent)initWithFailure:(BOOL)a3;
@end

@implementation HMDDecryptionCompletedLogEvent

- (BOOL)didDecryptionFail
{
  return self->_didDecryptionFail;
}

- (HMDDecryptionCompletedLogEvent)initWithFailure:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMDDecryptionCompletedLogEvent;
  result = [(HMMLogEvent *)&v5 init];
  if (result) {
    result->_didDecryptionFail = a3;
  }
  return result;
}

+ (id)decryptionCompletedWithFailure:(BOOL)a3
{
  v3 = [[HMDDecryptionCompletedLogEvent alloc] initWithFailure:a3];
  return v3;
}

@end