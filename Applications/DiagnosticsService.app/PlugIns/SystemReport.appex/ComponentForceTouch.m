@interface ComponentForceTouch
- (BOOL)isPresent;
- (void)populateAttributes:(id)a3;
@end

@implementation ComponentForceTouch

- (BOOL)isPresent
{
  uint64_t Default = MTDeviceCreateDefault();
  if (Default)
  {
    v3 = (const void *)Default;
    char v4 = MTDeviceSupportsForce();
    CFRelease(v3);
    LOBYTE(Default) = v4;
  }
  return Default;
}

- (void)populateAttributes:(id)a3
{
  id v6 = a3;
  v3 = objc_alloc_init(OSDGrape);
  char v4 = [(OSDGrape *)v3 orbErrorDetected];
  if ([v4 count])
  {
    v5 = [v4 allObjects];
    [v6 setObject:v5 forKeyedSubscript:@"Errors"];
  }
}

@end