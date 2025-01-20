@interface VCMediaNegotiatorResultsVideo
- (BOOL)blackFrameOnClearScreenEnabled;
- (BOOL)fecEnabled;
- (BOOL)foveationIsSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRTCPFBEnabled;
- (BOOL)isSupported;
- (BOOL)ltrpEnabled;
- (BOOL)rtxEnabled;
- (NSDictionary)featureStrings;
- (NSDictionary)parameterSets;
- (NSSet)hdrModesNegotiated;
- (NSSet)pixelFormats;
- (VCMediaNegotiatorResultsVideo)init;
- (VCVideoRuleCollections)videoRuleCollections;
- (int64_t)cipherSuite;
- (unsigned)customVideoHeight;
- (unsigned)customVideoWidth;
- (unsigned)remoteSSRC;
- (unsigned)tilesPerFrame;
- (void)addFeatureString:(id)a3 payload:(int)a4;
- (void)addNegotiatedHDRMode:(id)a3;
- (void)addParameterSet:(id)a3 payload:(int)a4;
- (void)addPixelFormatSet:(id)a3;
- (void)addVideoRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6;
- (void)dealloc;
- (void)setBlackFrameOnClearScreenEnabled:(BOOL)a3;
- (void)setCipherSuite:(int64_t)a3;
- (void)setCustomVideoHeight:(unsigned int)a3;
- (void)setCustomVideoWidth:(unsigned int)a3;
- (void)setFeatureStrings:(id)a3;
- (void)setFecEnabled:(BOOL)a3;
- (void)setFoveationIsSupported:(BOOL)a3;
- (void)setIsRTCPFBEnabled:(BOOL)a3;
- (void)setIsSupported:(BOOL)a3;
- (void)setLtrpEnabled:(BOOL)a3;
- (void)setParameterSets:(id)a3;
- (void)setRemoteSSRC:(unsigned int)a3;
- (void)setRtxEnabled:(BOOL)a3;
- (void)setTilesPerFrame:(unsigned int)a3;
@end

@implementation VCMediaNegotiatorResultsVideo

- (VCMediaNegotiatorResultsVideo)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorResultsVideo;
  v2 = [(VCMediaNegotiatorResultsVideo *)&v4 init];
  if (v2)
  {
    v2->_videoRuleCollections = objc_alloc_init(VCVideoRuleCollections);
    v2->_featureStrings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_parameterSets = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_pixelFormats = (NSMutableSet *)objc_opt_new();
    v2->_hdrModesNegotiated = (NSMutableSet *)objc_opt_new();
    v2->_cipherSuite = 3;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorResultsVideo;
  [(VCMediaNegotiatorResultsVideo *)&v3 dealloc];
}

- (void)addVideoRules:(id)a3 transportType:(unsigned __int8)a4 payload:(int)a5 encodingType:(unsigned __int8)a6
{
}

- (void)addFeatureString:(id)a3 payload:(int)a4
{
  featureStrings = self->_featureStrings;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(void *)&a4];

  [(NSMutableDictionary *)featureStrings setObject:a3 forKeyedSubscript:v6];
}

- (void)addParameterSet:(id)a3 payload:(int)a4
{
  parameterSets = self->_parameterSets;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(void *)&a4];

  [(NSMutableDictionary *)parameterSets setObject:a3 forKeyedSubscript:v6];
}

- (void)addPixelFormatSet:(id)a3
{
}

- (void)addNegotiatedHDRMode:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_isSupported != [a3 isSupported]
    || [a3 remoteSSRC] != self->_remoteSSRC
    || self->_isRTCPFBEnabled != [a3 isRTCPFBEnabled]
    || [a3 customVideoWidth] != self->_customVideoWidth
    || [a3 customVideoHeight] != self->_customVideoHeight
    || [a3 tilesPerFrame] != self->_tilesPerFrame
    || self->_ltrpEnabled != [a3 ltrpEnabled]
    || self->_fecEnabled != [a3 fecEnabled]
    || self->_rtxEnabled != [a3 rtxEnabled]
    || self->_blackFrameOnClearScreenEnabled != [a3 blackFrameOnClearScreenEnabled]
    || [a3 cipherSuite] != self->_cipherSuite
    || !-[NSMutableDictionary isEqualToDictionary:](self->_featureStrings, "isEqualToDictionary:", [a3 featureStrings])|| !-[NSMutableDictionary isEqualToDictionary:](self->_parameterSets, "isEqualToDictionary:", objc_msgSend(a3, "parameterSets"))|| !-[NSMutableSet isEqualToSet:](self->_pixelFormats, "isEqualToSet:", objc_msgSend(a3, "pixelFormats"))|| !-[NSMutableSet isEqualToSet:](self->_hdrModesNegotiated, "isEqualToSet:", objc_msgSend(a3, "hdrModesNegotiated")))
  {
    return 0;
  }
  videoRuleCollections = self->_videoRuleCollections;
  uint64_t v6 = [a3 videoRuleCollections];

  return [(VCVideoRuleCollections *)videoRuleCollections isEqual:v6];
}

- (unsigned)remoteSSRC
{
  return self->_remoteSSRC;
}

- (void)setRemoteSSRC:(unsigned int)a3
{
  self->_remoteSSRC = a3;
}

- (BOOL)isRTCPFBEnabled
{
  return self->_isRTCPFBEnabled;
}

- (void)setIsRTCPFBEnabled:(BOOL)a3
{
  self->_isRTCPFBEnabled = a3;
}

- (VCVideoRuleCollections)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (NSDictionary)featureStrings
{
  return &self->_featureStrings->super;
}

- (void)setFeatureStrings:(id)a3
{
}

- (BOOL)isSupported
{
  return self->_isSupported;
}

- (void)setIsSupported:(BOOL)a3
{
  self->_isSupported = a3;
}

- (NSDictionary)parameterSets
{
  return &self->_parameterSets->super;
}

- (void)setParameterSets:(id)a3
{
}

- (unsigned)customVideoHeight
{
  return self->_customVideoHeight;
}

- (void)setCustomVideoHeight:(unsigned int)a3
{
  self->_customVideoHeight = a3;
}

- (unsigned)customVideoWidth
{
  return self->_customVideoWidth;
}

- (void)setCustomVideoWidth:(unsigned int)a3
{
  self->_customVideoWidth = a3;
}

- (NSSet)pixelFormats
{
  return &self->_pixelFormats->super;
}

- (NSSet)hdrModesNegotiated
{
  return &self->_hdrModesNegotiated->super;
}

- (BOOL)fecEnabled
{
  return self->_fecEnabled;
}

- (void)setFecEnabled:(BOOL)a3
{
  self->_fecEnabled = a3;
}

- (BOOL)rtxEnabled
{
  return self->_rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->_rtxEnabled = a3;
}

- (int64_t)cipherSuite
{
  return self->_cipherSuite;
}

- (void)setCipherSuite:(int64_t)a3
{
  self->_cipherSuite = a3;
}

- (BOOL)blackFrameOnClearScreenEnabled
{
  return self->_blackFrameOnClearScreenEnabled;
}

- (void)setBlackFrameOnClearScreenEnabled:(BOOL)a3
{
  self->_blackFrameOnClearScreenEnabled = a3;
}

- (unsigned)tilesPerFrame
{
  return self->_tilesPerFrame;
}

- (void)setTilesPerFrame:(unsigned int)a3
{
  self->_tilesPerFrame = a3;
}

- (BOOL)ltrpEnabled
{
  return self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  self->_ltrpEnabled = a3;
}

- (BOOL)foveationIsSupported
{
  return self->_foveationIsSupported;
}

- (void)setFoveationIsSupported:(BOOL)a3
{
  self->_foveationIsSupported = a3;
}

@end