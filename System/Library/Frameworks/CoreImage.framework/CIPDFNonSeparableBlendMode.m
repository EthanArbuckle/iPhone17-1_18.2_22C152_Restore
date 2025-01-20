@interface CIPDFNonSeparableBlendMode
- (CIPDFNonSeparableBlendMode)init;
- (id)_kernel;
- (id)_kernel_v0;
- (id)_kernel_v1;
- (int)_defaultVersion;
- (int)_maxVersion;
- (void)setDefaults;
@end

@implementation CIPDFNonSeparableBlendMode

- (CIPDFNonSeparableBlendMode)init
{
  v5.receiver = self;
  v5.super_class = (Class)CIPDFNonSeparableBlendMode;
  v2 = [(CIPDFNonSeparableBlendMode *)&v5 init];
  v3 = v2;
  if (v2) {
    -[CIPDFNonSeparableBlendMode setValue:forKey:](v2, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CIPDFNonSeparableBlendMode _defaultVersion](v2, "_defaultVersion")), @"__inputVersion");
  }
  return v3;
}

- (void)setDefaults
{
  v3.receiver = self;
  v3.super_class = (Class)CIPDFNonSeparableBlendMode;
  [(CIFilter *)&v3 setDefaults];
  -[CIPDFNonSeparableBlendMode setValue:forKey:](self, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInt:", -[CIPDFNonSeparableBlendMode _defaultVersion](self, "_defaultVersion")), @"__inputVersion");
}

- (int)_maxVersion
{
  return 1;
}

- (int)_defaultVersion
{
  return dyld_program_sdk_at_least();
}

- (id)_kernel_v0
{
  return 0;
}

- (id)_kernel_v1
{
  return 0;
}

- (id)_kernel
{
  int v3 = objc_msgSend((id)-[CIPDFNonSeparableBlendMode valueForKey:](self, "valueForKey:", @"__inputVersion"), "intValue");
  if (v3 == 1)
  {
    return [(CIPDFNonSeparableBlendMode *)self _kernel_v1];
  }
  else if (v3)
  {
    return 0;
  }
  else
  {
    return [(CIPDFNonSeparableBlendMode *)self _kernel_v0];
  }
}

@end