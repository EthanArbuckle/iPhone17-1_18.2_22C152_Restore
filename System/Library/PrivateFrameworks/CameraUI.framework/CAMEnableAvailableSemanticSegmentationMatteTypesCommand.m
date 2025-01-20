@interface CAMEnableAvailableSemanticSegmentationMatteTypesCommand
- (CAMEnableAvailableSemanticSegmentationMatteTypesCommand)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)executeWithContext:(id)a3;
@end

@implementation CAMEnableAvailableSemanticSegmentationMatteTypesCommand

- (CAMEnableAvailableSemanticSegmentationMatteTypesCommand)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMEnableAvailableSemanticSegmentationMatteTypesCommand;
  v2 = [(CAMCaptureCommand *)&v6 initWithSubcommands:0];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMEnableAvailableSemanticSegmentationMatteTypesCommand;
  return [(CAMCaptureCommand *)&v4 copyWithZone:a3];
}

- (void)executeWithContext:(id)a3
{
  id v4 = [a3 currentStillImageOutput];
  v3 = [v4 availableSemanticSegmentationMatteTypes];
  if (v3) {
    [v4 setEnabledSemanticSegmentationMatteTypes:v3];
  }
}

@end