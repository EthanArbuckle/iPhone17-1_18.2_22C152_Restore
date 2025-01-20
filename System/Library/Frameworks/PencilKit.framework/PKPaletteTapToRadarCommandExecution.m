@interface PKPaletteTapToRadarCommandExecution
+ (PKPaletteTapToRadarCommandExecution)commandExecutionWithConfiguration:(id)a3;
- (PKPaletteTapToRadarCommandExecution)initWithConfiguration:(id)a3;
- (PKPaletteTapToRadarConfiguration)configuration;
@end

@implementation PKPaletteTapToRadarCommandExecution

+ (PKPaletteTapToRadarCommandExecution)commandExecutionWithConfiguration:(id)a3
{
  id v3 = a3;
  if (_UIApplicationIsExtension())
  {
    v4 = off_1E64C3F48;
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v5 bundleIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.ScreenshotServicesService"];

    v4 = off_1E64C3F68;
    if (v7) {
      v4 = off_1E64C3F70;
    }
  }
  v8 = (void *)[objc_alloc(*v4) initWithConfiguration:v3];

  return (PKPaletteTapToRadarCommandExecution *)v8;
}

- (PKPaletteTapToRadarCommandExecution)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteTapToRadarCommandExecution;
  v6 = [(PKPaletteTapToRadarCommandExecution *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (PKPaletteTapToRadarConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end