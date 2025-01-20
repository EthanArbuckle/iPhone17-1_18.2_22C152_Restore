@interface FPFlattenedPackageSandboxingURLWrapper
+ (BOOL)supportsSecureCoding;
- (FPFlattenedPackageSandboxingURLWrapper)initWithCoder:(id)a3;
- (FPFlattenedPackageSandboxingURLWrapper)initWithURL:(id)a3 packageURL:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPFlattenedPackageSandboxingURLWrapper

- (FPFlattenedPackageSandboxingURLWrapper)initWithURL:(id)a3 packageURL:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = *MEMORY[0x1E4F14008];
  v15.receiver = self;
  v15.super_class = (Class)FPFlattenedPackageSandboxingURLWrapper;
  v10 = [(FPSandboxingURLWrapper *)&v15 initWithURL:a3 extensionClass:v9 report:1 error:a5];
  if (v10
    && (v11 = [[FPSandboxingURLWrapper alloc] initWithURL:v8 extensionClass:v9 report:0 error:a5], packageWrapper = v10->_packageWrapper, v10->_packageWrapper = v11, packageWrapper, !v10->_packageWrapper))
  {
    v13 = 0;
  }
  else
  {
    v13 = v10;
  }

  return v13;
}

- (FPFlattenedPackageSandboxingURLWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPFlattenedPackageSandboxingURLWrapper;
  v5 = [(FPSandboxingURLWrapper *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pkg"];
    packageWrapper = v5->_packageWrapper;
    v5->_packageWrapper = (FPSandboxingURLWrapper *)v6;

    id v8 = [(FPSandboxingURLWrapper *)v5 url];
    uint64_t v9 = [(FPSandboxingURLWrapper *)v5->_packageWrapper url];
    [v8 setTemporaryResourceValue:v9 forKey:@"FPUnflattenedPackageURL"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FPFlattenedPackageSandboxingURLWrapper;
  id v4 = a3;
  [(FPSandboxingURLWrapper *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_packageWrapper, @"pkg", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end