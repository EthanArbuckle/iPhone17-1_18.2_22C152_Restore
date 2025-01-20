@interface DiskImageParamsLocked_XPC
- (DiskImageParamsLocked_XPC)initWithBackendXPC:(id)a3;
- (id)newWithPassphrase:(const char *)a3 error:(id *)a4;
- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4;
@end

@implementation DiskImageParamsLocked_XPC

- (DiskImageParamsLocked_XPC)initWithBackendXPC:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DiskImageParamsLocked_XPC;
  return [(DiskImageParamsXPC *)&v4 initWithBackendXPC:a3];
}

- (id)newWithPassphrase:(const char *)a3 error:(id *)a4
{
  v7 = [(DiskImageParamsXPC *)self backendXPC];
  v8 = (void *)[v7 newUnlockedBackendXPCWithPassphrase:a3 certificate:0 isNewImage:0 error:a4];

  if (!v8) {
    return 0;
  }
  id v9 = +[DiskImageParamsXPC newWithUnlockedBackendXPC:v8 error:a4];
  if (v9) {
    objc_msgSend(v9, "setBlockSize:", -[DiskImageParamsXPC blockSize](self, "blockSize"));
  }

  return v9;
}

- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4
{
}

@end