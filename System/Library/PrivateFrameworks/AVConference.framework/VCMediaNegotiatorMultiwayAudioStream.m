@interface VCMediaNegotiatorMultiwayAudioStream
- (BOOL)isEqual:(id)a3;
- (NSSet)supportedAudioPayloads;
- (VCMediaNegotiatorMultiwayAudioStream)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addPayload:(int)a3;
- (void)dealloc;
- (void)setSupportedAudioPayloads:(id)a3;
@end

@implementation VCMediaNegotiatorMultiwayAudioStream

- (VCMediaNegotiatorMultiwayAudioStream)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorMultiwayAudioStream;
  v2 = [(VCMediaNegotiatorMultiwayAudioStream *)&v4 init];
  if (v2) {
    v2->_supportedAudioPayloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorMultiwayAudioStream;
  [(VCMediaNegotiatorMultiwayAudioStream *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCMediaNegotiatorMultiwayAudioStream;
  id v5 = -[VCMediaNegotiatorMultiwayMediaStream copyWithZone:](&v8, sel_copyWithZone_);
  if (v5)
  {
    v6 = (void *)[(NSMutableSet *)self->_supportedAudioPayloads copyWithZone:a3];
    [v5 setSupportedAudioPayloads:v6];
  }
  return v5;
}

- (void)addPayload:(int)a3
{
  supportedAudioPayloads = self->_supportedAudioPayloads;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(NSMutableSet *)supportedAudioPayloads addObject:v4];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  v13.receiver = self;
  v13.super_class = (Class)VCMediaNegotiatorMultiwayAudioStream;
  unsigned int v5 = [(VCMediaNegotiatorMultiwayMediaStream *)&v13 isEqual:a3];
  if (!v5) {
    return v5;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "supportedAudioPayloads"), "count");
  if (v6 != [(NSMutableSet *)self->_supportedAudioPayloads count])
  {
LABEL_13:
    LOBYTE(v5) = 0;
    return v5;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = (void *)[a3 supportedAudioPayloads];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
LABEL_6:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v7);
      }
      unsigned int v5 = [(NSMutableSet *)self->_supportedAudioPayloads containsObject:*(void *)(*((void *)&v15 + 1) + 8 * v11)];
      if (!v5) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
        LOBYTE(v5) = 1;
        if (v9) {
          goto LABEL_6;
        }
        return v5;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (NSSet)supportedAudioPayloads
{
  return &self->_supportedAudioPayloads->super;
}

- (void)setSupportedAudioPayloads:(id)a3
{
}

@end