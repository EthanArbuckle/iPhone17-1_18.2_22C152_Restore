@interface CKEphemeralEventSequence
- (CKEphemeralEventSequence)init;
@end

@implementation CKEphemeralEventSequence

- (CKEphemeralEventSequence)init
{
  return (CKEphemeralEventSequence *)CKEphemeralEventSequence.init()();
}

- (void).cxx_destruct
{
}

@end