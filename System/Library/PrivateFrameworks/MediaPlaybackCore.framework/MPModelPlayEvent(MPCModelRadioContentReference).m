@interface MPModelPlayEvent(MPCModelRadioContentReference)
- (id)mpc_radioContentReference;
@end

@implementation MPModelPlayEvent(MPCModelRadioContentReference)

- (id)mpc_radioContentReference
{
  v1 = [a1 genericObjectRepresentation];
  v2 = objc_msgSend(v1, "mpc_radioContentReference");

  return v2;
}

@end