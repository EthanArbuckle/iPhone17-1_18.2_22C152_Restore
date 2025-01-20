@interface BSDescriptionBuilder(ITIdleTimerDescriptor)
- (void)itidletimerdescriptor_appendTimeInterval:()ITIdleTimerDescriptor withName:;
@end

@implementation BSDescriptionBuilder(ITIdleTimerDescriptor)

- (void)itidletimerdescriptor_appendTimeInterval:()ITIdleTimerDescriptor withName:
{
  id v7 = a4;
  if ((BSFloatEqualToFloat() & 1) == 0) {
    id v6 = (id)[a1 appendTimeInterval:v7 withName:0 decomposeUnits:a2];
  }
}

@end