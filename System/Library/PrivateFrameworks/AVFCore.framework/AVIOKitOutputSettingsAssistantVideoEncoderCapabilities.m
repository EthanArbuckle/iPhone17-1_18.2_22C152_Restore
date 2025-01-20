@interface AVIOKitOutputSettingsAssistantVideoEncoderCapabilities
- (BOOL)averageNonDroppableFrameIntervalIsSupportedByDefaultEncoderForVideoCodec:(id)a3;
@end

@implementation AVIOKitOutputSettingsAssistantVideoEncoderCapabilities

- (BOOL)averageNonDroppableFrameIntervalIsSupportedByDefaultEncoderForVideoCodec:(id)a3
{
  return [a3 isEqualToString:@"avc1"];
}

@end