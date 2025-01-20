@interface GCMFiControllerCapabilites
@end

@implementation GCMFiControllerCapabilites

BOOL __72___GCMFiControllerCapabilites_initWithGamepadElements_keyboardElements___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"Max"];
  v4 = [v2 objectForKeyedSubscript:@"Min"];

  BOOL v5 = 0;
  if (v3 && v4)
  {
    int v6 = [v3 intValue];
    BOOL v5 = v6 - [v4 intValue] == 1;
  }

  return v5;
}

@end