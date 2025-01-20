@interface VCSessionParticipantVideoStreamConfig
- (void)setupRxPayloads:(id)a3 featureStrings:(id)a4;
- (void)setupTxPayloads:(id)a3 featureStrings:(id)a4;
@end

@implementation VCSessionParticipantVideoStreamConfig

- (void)setupRxPayloads:(id)a3 featureStrings:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [v11 unsignedIntValue];
        [(VCMediaStreamConfig *)self addRxPayloadType:v12 networkPayload:v12];
        if (a4) {
          -[VCVideoStreamConfig addRxCodecFeatureListString:codecType:](self, "addRxCodecFeatureListString:codecType:", [a4 objectForKeyedSubscript:v11], +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v12));
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }
}

- (void)setupTxPayloads:(id)a3 featureStrings:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(a3);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [v11 unsignedIntValue];
        [(VCMediaStreamConfig *)self addTxPayloadType:v12 networkPayload:v12];
        if (a4) {
          -[VCVideoStreamConfig addTxCodecFeatureListString:codecType:](self, "addTxCodecFeatureListString:codecType:", [a4 objectForKeyedSubscript:v11], +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v12));
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }
}

@end