@interface VCMediaStreamMultiwayConfigVideo
- (BOOL)isSubStream;
- (BOOL)isTemporalStream;
- (NSArray)subStreamConfigs;
- (NSSet)payloads;
- (VCMediaStreamMultiwayConfigVideo)init;
- (id)streamIds;
- (int64_t)resolution;
- (unint64_t)keyFrameInterval;
- (unsigned)framerate;
- (unsigned)parentStreamID;
- (void)addPayload:(int)a3;
- (void)addSubStreamConfig:(id)a3;
- (void)dealloc;
- (void)setFramerate:(unsigned int)a3;
- (void)setIsSubStream:(BOOL)a3;
- (void)setIsTemporalStream:(BOOL)a3;
- (void)setKeyFrameInterval:(unint64_t)a3;
- (void)setParentStreamID:(unsigned __int16)a3;
- (void)setResolution:(int64_t)a3;
@end

@implementation VCMediaStreamMultiwayConfigVideo

- (VCMediaStreamMultiwayConfigVideo)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaStreamMultiwayConfigVideo;
  v2 = [(VCMediaStreamMultiwayConfig *)&v4 init];
  if (v2)
  {
    v2->_payloads = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v2->_subStreamConfigs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamMultiwayConfigVideo;
  [(VCMediaStreamMultiwayConfig *)&v3 dealloc];
}

- (void)addPayload:(int)a3
{
  payloads = self->_payloads;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  [(NSMutableSet *)payloads addObject:v4];
}

- (void)addSubStreamConfig:(id)a3
{
}

- (id)streamIds
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[VCMediaStreamMultiwayConfig idsStreamID](self, "idsStreamID")));
  if ([(VCMediaStreamMultiwayConfig *)self hasRepairedStreamID]) {
    objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[VCMediaStreamMultiwayConfig repairedStreamID](self, "repairedStreamID")));
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  subStreamConfigs = self->_subStreamConfigs;
  uint64_t v5 = [(NSMutableArray *)subStreamConfigs countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(subStreamConfigs);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) streamIds];
        if (v9) {
          [v3 addObjectsFromArray:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)subStreamConfigs countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v6);
  }
  return v3;
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (unsigned)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unsigned int)a3
{
  self->_framerate = a3;
}

- (NSSet)payloads
{
  return &self->_payloads->super;
}

- (unint64_t)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unint64_t)a3
{
  self->_keyFrameInterval = a3;
}

- (NSArray)subStreamConfigs
{
  return &self->_subStreamConfigs->super;
}

- (BOOL)isTemporalStream
{
  return self->_isTemporalStream;
}

- (void)setIsTemporalStream:(BOOL)a3
{
  self->_isTemporalStream = a3;
}

- (BOOL)isSubStream
{
  return self->_isSubStream;
}

- (void)setIsSubStream:(BOOL)a3
{
  self->_isSubStream = a3;
}

- (unsigned)parentStreamID
{
  return self->_parentStreamID;
}

- (void)setParentStreamID:(unsigned __int16)a3
{
  self->_parentStreamID = a3;
}

@end