@interface IOGPUMetalDeviceAssertion
- (IOGPUMetalDeviceAssertion)initWithDevice:(id)a3 assertionType:(unint64_t)a4 options:(unint64_t)a5;
- (void)dealloc;
@end

@implementation IOGPUMetalDeviceAssertion

- (IOGPUMetalDeviceAssertion)initWithDevice:(id)a3 assertionType:(unint64_t)a4 options:(unint64_t)a5
{
  id v9 = a3;
  if (objc_opt_respondsToSelector()) {
    id v9 = (id)[a3 originalObject];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (IOGPUDeviceCreateDeviceAssertion((_DWORD *)[v9 deviceRef], a4, a5, &self->fSendRight.mrs_name))
    {

      return 0;
    }
    else
    {
      self->fAssertionType = a4;
      self->fAssertionOptions = a5;
    }
  }
  return self;
}

- (void)dealloc
{
  if (self->fSendRight.mrs_name - 1 <= 0xFFFFFFFD) {
    mach_right_send_release();
  }
  v3.receiver = self;
  v3.super_class = (Class)IOGPUMetalDeviceAssertion;
  [(IOGPUMetalDeviceAssertion *)&v3 dealloc];
}

@end