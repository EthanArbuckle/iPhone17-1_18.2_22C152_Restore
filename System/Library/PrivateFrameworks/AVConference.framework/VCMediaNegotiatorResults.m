@interface VCMediaNegotiatorResults
- (BOOL)supportsDynamicMaxBitrate;
- (NSSet)bandwidthConfigurations;
- (NSString)remoteBasebandCodec;
- (NSString)remoteUserAgent;
- (VCMediaNegotiatorResults)init;
- (int)accessNetworkType;
- (int)controlChannelVersion;
- (tagNTP)remoteBlobCreationTime;
- (unsigned)maxBandwidthWithArbiterMode:(unsigned __int8)a3 connectionType:(int)a4;
- (unsigned)mediaControlInfoVersion;
- (unsigned)remoteBasebandCodecSampleRate;
- (unsigned)remoteBlobVersion;
- (void)addBandwidthConfigurations:(id)a3;
- (void)dealloc;
- (void)setAccessNetworkType:(int)a3;
- (void)setControlChannelVersion:(int)a3;
- (void)setMediaControlInfoVersion:(unsigned __int8)a3;
- (void)setRemoteBasebandCodec:(id)a3;
- (void)setRemoteBasebandCodecSampleRate:(unsigned int)a3;
- (void)setRemoteBlobCreationTime:(tagNTP)a3;
- (void)setRemoteBlobVersion:(unsigned int)a3;
- (void)setRemoteUserAgent:(id)a3;
- (void)setSupportsDynamicMaxBitrate:(BOOL)a3;
@end

@implementation VCMediaNegotiatorResults

- (VCMediaNegotiatorResults)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorResults;
  v2 = [(VCMediaNegotiatorResults *)&v4 init];
  if (v2)
  {
    v2->_remoteUserAgent = (NSString *)@"Viceroy 1.7.0/GK";
    v2->_bandwidthConfigurations = (NSMutableSet *)objc_opt_new();
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorResults;
  [(VCMediaNegotiatorResults *)&v3 dealloc];
}

- (void)addBandwidthConfigurations:(id)a3
{
  bandwidthConfigurations = self->_bandwidthConfigurations;
  uint64_t v4 = [a3 allObjects];

  [(NSMutableSet *)bandwidthConfigurations addObjectsFromArray:v4];
}

- (unsigned)maxBandwidthWithArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  int v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  bandwidthConfigurations = self->_bandwidthConfigurations;
  uint64_t v7 = [(NSMutableSet *)bandwidthConfigurations countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  unsigned int v9 = 0;
  uint64_t v10 = *(void *)v16;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(bandwidthConfigurations);
      }
      v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      if ([v12 connectionType] == a4)
      {
        if ([v12 mode] == v5) {
          return [v12 maxBandwidth];
        }
        if ([v12 isDefaultMode]) {
          unsigned int v9 = [v12 maxBandwidth];
        }
      }
    }
    uint64_t v8 = [(NSMutableSet *)bandwidthConfigurations countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v8) {
      continue;
    }
    break;
  }
  return v9;
}

- (BOOL)supportsDynamicMaxBitrate
{
  return self->_supportsDynamicMaxBitrate;
}

- (void)setSupportsDynamicMaxBitrate:(BOOL)a3
{
  self->_supportsDynamicMaxBitrate = a3;
}

- (NSString)remoteUserAgent
{
  return self->_remoteUserAgent;
}

- (void)setRemoteUserAgent:(id)a3
{
}

- (NSString)remoteBasebandCodec
{
  return self->_remoteBasebandCodec;
}

- (void)setRemoteBasebandCodec:(id)a3
{
}

- (unsigned)remoteBasebandCodecSampleRate
{
  return self->_remoteBasebandCodecSampleRate;
}

- (void)setRemoteBasebandCodecSampleRate:(unsigned int)a3
{
  self->_remoteBasebandCodecSampleRate = a3;
}

- (NSSet)bandwidthConfigurations
{
  return &self->_bandwidthConfigurations->super;
}

- (unsigned)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (unsigned)remoteBlobVersion
{
  return self->_remoteBlobVersion;
}

- (void)setRemoteBlobVersion:(unsigned int)a3
{
  self->_remoteBlobVersion = a3;
}

- (tagNTP)remoteBlobCreationTime
{
  return (tagNTP)self->_remoteBlobCreationTime.wide;
}

- (void)setRemoteBlobCreationTime:(tagNTP)a3
{
  self->_remoteBlobCreationTime = a3;
}

- (int)controlChannelVersion
{
  return self->_controlChannelVersion;
}

- (void)setControlChannelVersion:(int)a3
{
  self->_controlChannelVersion = a3;
}

- (int)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int)a3
{
  self->_accessNetworkType = a3;
}

@end