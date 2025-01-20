@interface CDPMobileGestaltWrapper
- (BOOL)supportsMesa;
- (BOOL)supportsPearl;
@end

@implementation CDPMobileGestaltWrapper

- (BOOL)supportsPearl
{
  return MEMORY[0x270F95FB8](@"8olRm6C1xqr7AJGpLRnpSw", a2);
}

- (BOOL)supportsMesa
{
  return MEMORY[0x270F95FB8](@"HV7WDiidgMf7lwAu++Lk5w", a2);
}

@end