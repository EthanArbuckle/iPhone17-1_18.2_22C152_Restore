@interface VCMediaNegotiatorResultsAudio
- (BOOL)allowRecording;
- (BOOL)allowSwitching;
- (BOOL)isEqual:(id)a3;
- (BOOL)useSBR;
- (NSArray)secondaryPayloads;
- (VCMediaNegotiatorResultsAudio)init;
- (int)dtxPayload;
- (int)primaryPayload;
- (int)redPayload;
- (int64_t)cipherSuite;
- (unsigned)audioUnitModel;
- (unsigned)remoteSSRC;
- (void)addSecondaryPayload:(int)a3;
- (void)dealloc;
- (void)setAllowRecording:(BOOL)a3;
- (void)setAllowSwitching:(BOOL)a3;
- (void)setAudioUnitModel:(unsigned int)a3;
- (void)setCipherSuite:(int64_t)a3;
- (void)setDtxPayload:(int)a3;
- (void)setPrimaryPayload:(int)a3;
- (void)setRedPayload:(int)a3;
- (void)setRemoteSSRC:(unsigned int)a3;
- (void)setUseSBR:(BOOL)a3;
@end

@implementation VCMediaNegotiatorResultsAudio

- (VCMediaNegotiatorResultsAudio)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorResultsAudio;
  v2 = [(VCMediaNegotiatorResultsAudio *)&v4 init];
  if (v2)
  {
    *((void *)v2 + 4) = objc_opt_new();
    *(void *)(v2 + 20) = 0x8000000080;
    *((_DWORD *)v2 + 7) = 128;
    *((void *)v2 + 6) = 3;
  }
  return (VCMediaNegotiatorResultsAudio *)v2;
}

- (NSArray)secondaryPayloads
{
  return (NSArray *)[(NSMutableSet *)self->_secondaryPayloads allObjects];
}

- (void)addSecondaryPayload:(int)a3
{
  secondaryPayloads = self->_secondaryPayloads;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(NSMutableSet *)secondaryPayloads addObject:v4];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorResultsAudio;
  [(VCMediaNegotiatorResultsAudio *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || [a3 remoteSSRC] != self->_remoteSSRC
    || [a3 audioUnitModel] != self->_audioUnitModel
    || self->_allowRecording != [a3 allowRecording]
    || self->_allowSwitching != [a3 allowSwitching]
    || [a3 primaryPayload] != self->_primaryPayload
    || [a3 dtxPayload] != self->_dtxPayload
    || [a3 redPayload] != self->_redPayload
    || self->_useSBR != [a3 useSBR]
    || [a3 cipherSuite] != self->_cipherSuite)
  {
    return 0;
  }
  secondaryPayloads = self->_secondaryPayloads;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "secondaryPayloads"));

  return [(NSMutableSet *)secondaryPayloads isEqualToSet:v6];
}

- (int)primaryPayload
{
  return self->_primaryPayload;
}

- (void)setPrimaryPayload:(int)a3
{
  self->_primaryPayload = a3;
}

- (int)dtxPayload
{
  return self->_dtxPayload;
}

- (void)setDtxPayload:(int)a3
{
  self->_dtxPayload = a3;
}

- (int)redPayload
{
  return self->_redPayload;
}

- (void)setRedPayload:(int)a3
{
  self->_redPayload = a3;
}

- (BOOL)allowRecording
{
  return self->_allowRecording;
}

- (void)setAllowRecording:(BOOL)a3
{
  self->_allowRecording = a3;
}

- (unsigned)audioUnitModel
{
  return self->_audioUnitModel;
}

- (void)setAudioUnitModel:(unsigned int)a3
{
  self->_audioUnitModel = a3;
}

- (BOOL)allowSwitching
{
  return self->_allowSwitching;
}

- (void)setAllowSwitching:(BOOL)a3
{
  self->_allowSwitching = a3;
}

- (unsigned)remoteSSRC
{
  return self->_remoteSSRC;
}

- (void)setRemoteSSRC:(unsigned int)a3
{
  self->_remoteSSRC = a3;
}

- (BOOL)useSBR
{
  return self->_useSBR;
}

- (void)setUseSBR:(BOOL)a3
{
  self->_useSBR = a3;
}

- (int64_t)cipherSuite
{
  return self->_cipherSuite;
}

- (void)setCipherSuite:(int64_t)a3
{
  self->_cipherSuite = a3;
}

@end