@interface VCVideoRuleCollectionsMediaRecorderMac
+ (id)sharedInstance;
- (VCVideoRuleCollectionsMediaRecorderMac)initWithHardwareSettings:(id)a3;
- (id)mediaRecorderImageTypes;
- (id)mediaRecorderVideoCodecs;
- (unsigned)mediaRecorderCapabilities;
@end

@implementation VCVideoRuleCollectionsMediaRecorderMac

- (VCVideoRuleCollectionsMediaRecorderMac)initWithHardwareSettings:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCVideoRuleCollectionsMediaRecorderMac;
  result = [(VCVideoRuleCollectionsMediaRecorder *)&v5 init];
  if (result) {
    result->_hardwareSettings = (VCHardwareSettingsMacProtocol *)a3;
  }
  return result;
}

+ (id)sharedInstance
{
  return 0;
}

- (unsigned)mediaRecorderCapabilities
{
  return 2;
}

- (id)mediaRecorderVideoCodecs
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", &unk_1F3DC4CF8, 0);
  if ([(VCHardwareSettingsMacProtocol *)self->_hardwareSettings supportHEVC]
    && self->super._isHEIFAndHEVCFormatEnabled)
  {
    [v3 addObject:&unk_1F3DC4D10];
  }
  return v3;
}

- (id)mediaRecorderImageTypes
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", &unk_1F3DC4D28, 0);
  v4 = v3;
  if (self->super._isHEIFAndHEVCFormatEnabled) {
    [v3 addObject:&unk_1F3DC4D40];
  }
  return v4;
}

@end