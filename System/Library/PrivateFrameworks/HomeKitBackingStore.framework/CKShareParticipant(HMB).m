@interface CKShareParticipant(HMB)
- (BOOL)hmbIsEqualToParticipant:()HMB;
@end

@implementation CKShareParticipant(HMB)

- (BOOL)hmbIsEqualToParticipant:()HMB
{
  id v4 = a3;
  if ([a1 isEqual:v4]
    && (uint64_t v5 = [a1 acceptanceStatus], v5 == objc_msgSend(v4, "acceptanceStatus")))
  {
    uint64_t v6 = [a1 permission];
    BOOL v7 = v6 == [v4 permission];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end