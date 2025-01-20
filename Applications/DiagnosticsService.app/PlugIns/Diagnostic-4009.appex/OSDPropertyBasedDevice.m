@interface OSDPropertyBasedDevice
- (BOOL)setProperty:(__CFString *)a3 BOOLean:(BOOL)a4 error:(id *)a5;
- (BOOL)setProperty:(__CFString *)a3 value:(void *)a4 error:(id *)a5;
- (id)copyProperty:(__CFString *)a3 error:(id *)a4;
- (int)backingCopyProperty:(__CFString *)a3 dest:(const void *)a4;
- (int)backingSetProperty:(__CFString *)a3 value:(void *)a4;
- (void)backingRef;
@end

@implementation OSDPropertyBasedDevice

- (BOOL)setProperty:(__CFString *)a3 value:(void *)a4 error:(id *)a5
{
  if (![(OSDPropertyBasedDevice *)self backingRef])
  {
    +[OSDError setError:a5, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@ >> No backing reference!", self, v11, v12, v13 withDomain withCode format];
    return 0;
  }
  uint64_t v9 = [(OSDPropertyBasedDevice *)self backingSetProperty:a3 value:a4];
  if (v9)
  {
    +[OSDError setError:a5, @"com.apple.osdiags.OSDCaptureDevice", v9, @"%@ >> Error %d (0x%08x) setting property '%@'!", self, v9, v9, a3 withDomain withCode format];
    return 0;
  }
  return 1;
}

- (BOOL)setProperty:(__CFString *)a3 BOOLean:(BOOL)a4 error:(id *)a5
{
  v5 = &kCFBooleanTrue;
  if (!a4) {
    v5 = &kCFBooleanFalse;
  }
  return [(OSDPropertyBasedDevice *)self setProperty:a3 value:*v5 error:a5];
}

- (id)copyProperty:(__CFString *)a3 error:(id *)a4
{
  uint64_t v9 = 0;
  if ([(OSDPropertyBasedDevice *)self backingRef])
  {
    uint64_t v7 = [(OSDPropertyBasedDevice *)self backingCopyProperty:a3 dest:&v9];
    if (v7)
    {
      +[OSDError setError:a4, @"com.apple.osdiags.OSDCaptureDevice", self, v7, v7, a3 withDomain withCode format];
      id result = 0;
      uint64_t v9 = 0;
    }
    else
    {
      return v9;
    }
  }
  else
  {
    +[OSDError setError:a4, @"com.apple.osdiags.OSDCaptureDevice", 1, @"%@ >> No backing ref!", self withDomain withCode format];
    return 0;
  }
  return result;
}

- (void)backingRef
{
  v2 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"Subclasses must override %@", v2 format];

  return 0;
}

- (int)backingSetProperty:(__CFString *)a3 value:(void *)a4
{
  v4 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"Subclasses must override %@", v4 format];

  return 1;
}

- (int)backingCopyProperty:(__CFString *)a3 dest:(const void *)a4
{
  v4 = NSStringFromSelector(a2);
  +[NSException raise:NSInternalInconsistencyException, @"Subclasses must override %@", v4 format];

  return 1;
}

@end