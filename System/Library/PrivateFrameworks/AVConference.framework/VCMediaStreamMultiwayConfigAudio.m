@interface VCMediaStreamMultiwayConfigAudio
- (NSDictionary)v2CodecConfigurations;
- (VCAudioRuleCollection)audioRules;
- (VCMediaStreamMultiwayConfigAudio)init;
- (unsigned)preferredMediaBitrate;
- (void)addV2CodecConfiguration:(id)a3;
- (void)dealloc;
- (void)setAudioRules:(id)a3;
- (void)setPreferredMediaBitrate:(unsigned int)a3;
@end

@implementation VCMediaStreamMultiwayConfigAudio

- (VCMediaStreamMultiwayConfigAudio)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaStreamMultiwayConfigAudio;
  v2 = [(VCMediaStreamMultiwayConfig *)&v4 init];
  if (v2) {
    v2->_v2CodecConfigurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)addV2CodecConfiguration:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_v2CodecConfigurations, "setObject:forKeyedSubscript:", a3, objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "codecType")));
    uint64_t v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", [a3 codecType]);
    -[VCMediaStreamMultiwayConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", v5, [a3 networkPayload]);
    uint64_t v6 = [a3 networkPayload];
    [(VCMediaStreamMultiwayConfig *)self addTxPayloadType:v5 networkPayload:v6];
  }
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamMultiwayConfigAudio;
  [(VCMediaStreamMultiwayConfig *)&v3 dealloc];
}

- (VCAudioRuleCollection)audioRules
{
  return self->_audioRules;
}

- (void)setAudioRules:(id)a3
{
}

- (NSDictionary)v2CodecConfigurations
{
  return &self->_v2CodecConfigurations->super;
}

- (unsigned)preferredMediaBitrate
{
  return self->_preferredMediaBitrate;
}

- (void)setPreferredMediaBitrate:(unsigned int)a3
{
  self->_preferredMediaBitrate = a3;
}

@end