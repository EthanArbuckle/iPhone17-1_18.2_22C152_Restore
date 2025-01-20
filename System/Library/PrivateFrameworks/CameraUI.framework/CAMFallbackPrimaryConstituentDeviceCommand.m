@interface CAMFallbackPrimaryConstituentDeviceCommand
- (CAMFallbackPrimaryConstituentDeviceCommand)initWithCoder:(id)a3;
- (CAMFallbackPrimaryConstituentDeviceCommand)initWithFallbackPrimaryConstituentDeviceSelection:(int64_t)a3;
- (CAMFallbackPrimaryConstituentDeviceCommand)initWithSubcommands:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_deviceSelection;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMFallbackPrimaryConstituentDeviceCommand

- (CAMFallbackPrimaryConstituentDeviceCommand)initWithFallbackPrimaryConstituentDeviceSelection:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMFallbackPrimaryConstituentDeviceCommand;
  result = [(CAMCaptureCommand *)&v5 initWithSubcommands:0];
  if (result) {
    result->__deviceSelection = a3;
  }
  return result;
}

- (CAMFallbackPrimaryConstituentDeviceCommand)initWithSubcommands:(id)a3
{
  return [(CAMFallbackPrimaryConstituentDeviceCommand *)self initWithFallbackPrimaryConstituentDeviceSelection:1];
}

- (CAMFallbackPrimaryConstituentDeviceCommand)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CAMFallbackPrimaryConstituentDeviceCommand;
  [(CAMCaptureCommand *)&v3 encodeWithCoder:a3];
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"NSCoding not implemented"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAMFallbackPrimaryConstituentDeviceCommand;
  v4 = [(CAMCaptureCommand *)&v6 copyWithZone:a3];
  v4[3] = [(CAMFallbackPrimaryConstituentDeviceCommand *)self _deviceSelection];
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMFallbackPrimaryConstituentDeviceCommand *)self _deviceSelection];
  id v10 = [v4 currentVideoDevice];

  if (v5 == 2)
  {
    v8 = [v10 supportedFallbackPrimaryConstituentDevices];
    objc_super v6 = (void *)[v8 mutableCopy];

    uint64_t v9 = [v6 indexOfObjectPassingTest:&__block_literal_global_56];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      [v6 removeObjectAtIndex:v9];
    }
  }
  else if (v5 == 1)
  {
    v7 = [v10 supportedFallbackPrimaryConstituentDevices];
    objc_super v6 = (void *)[v7 mutableCopy];
  }
  else
  {
    if (v5) {
      goto LABEL_10;
    }
    objc_super v6 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  }
  if (v6)
  {
    [v10 setFallbackPrimaryConstituentDevices:v6];
  }
LABEL_10:
}

BOOL __65__CAMFallbackPrimaryConstituentDeviceCommand_executeWithContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 deviceType];
  BOOL v3 = v2 == (void *)*MEMORY[0x263EF9660];

  return v3;
}

- (int64_t)_deviceSelection
{
  return self->__deviceSelection;
}

@end