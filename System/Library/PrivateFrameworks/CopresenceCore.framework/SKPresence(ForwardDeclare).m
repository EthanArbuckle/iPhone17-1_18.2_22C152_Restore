@interface SKPresence(ForwardDeclare)
- (void)assertPresenceWithPresencePayloadDictionary:()ForwardDeclare completion:;
@end

@implementation SKPresence(ForwardDeclare)

- (void)assertPresenceWithPresencePayloadDictionary:()ForwardDeclare completion:
{
  id v8 = a3;
  id v6 = a4;
  if (v8 && [v8 count])
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FA7FF0]) initWithDictionary:v8];
    [a1 assertPresenceWithPresencePayload:v7 completion:v6];
  }
  else
  {
    [a1 assertPresenceWithCompletion:v6];
  }
}

@end