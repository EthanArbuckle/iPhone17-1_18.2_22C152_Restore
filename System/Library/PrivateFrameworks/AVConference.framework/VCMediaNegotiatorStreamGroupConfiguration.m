@interface VCMediaNegotiatorStreamGroupConfiguration
+ (id)streamGroupConfigWithGroupID:(unsigned int)a3 mediaType:(unsigned int)a4 subtype:(unsigned int)a5 syncGroupID:(unsigned int)a6 cipherSuite:(unsigned int)a7;
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)codecConfigs;
- (NSOrderedSet)streamConfigs;
- (VCMediaNegotiatorStreamGroupConfiguration)init;
- (VCMediaNegotiatorStreamGroupConfiguration)initWithGroupID:(unsigned int)a3 mediaType:(unsigned int)a4 subtype:(unsigned int)a5 syncGroupID:(unsigned int)a6;
- (VCMediaNegotiatorStreamGroupConfiguration)initWithGroupID:(unsigned int)a3 mediaType:(unsigned int)a4 subtype:(unsigned int)a5 syncGroupID:(unsigned int)a6 cipherSuite:(unsigned int)a7;
- (VCMediaNegotiatorStreamGroupU1Configuration)u1Config;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)indexOfCodecConfig:(id)a3;
- (unsigned)groupID;
- (unsigned)mediaSubtype;
- (unsigned)mediaType;
- (unsigned)syncGroupID;
- (void)addCodecConfig:(id)a3;
- (void)addStreamConfig:(id)a3;
- (void)dealloc;
- (void)removeStreamConfigs:(_NSRange)a3;
- (void)setGroupID:(unsigned int)a3;
- (void)setMediaSubtype:(unsigned int)a3;
- (void)setMediaType:(unsigned int)a3;
- (void)setSyncGroupID:(unsigned int)a3;
- (void)setU1Config:(id)a3;
@end

@implementation VCMediaNegotiatorStreamGroupConfiguration

- (VCMediaNegotiatorStreamGroupConfiguration)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaNegotiatorStreamGroupConfiguration;
  v2 = [(VCMediaNegotiatorStreamGroupConfiguration *)&v4 init];
  if (v2)
  {
    v2->_streamConfigs = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    v2->_codecConfigs = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  }
  return v2;
}

- (VCMediaNegotiatorStreamGroupConfiguration)initWithGroupID:(unsigned int)a3 mediaType:(unsigned int)a4 subtype:(unsigned int)a5 syncGroupID:(unsigned int)a6
{
  result = [(VCMediaNegotiatorStreamGroupConfiguration *)self init];
  if (result)
  {
    result->_groupID = a3;
    result->_mediaType = a4;
    result->_mediaSubtype = a5;
    result->_syncGroupID = a6;
  }
  return result;
}

- (VCMediaNegotiatorStreamGroupConfiguration)initWithGroupID:(unsigned int)a3 mediaType:(unsigned int)a4 subtype:(unsigned int)a5 syncGroupID:(unsigned int)a6 cipherSuite:(unsigned int)a7
{
  result = [(VCMediaNegotiatorStreamGroupConfiguration *)self initWithGroupID:*(void *)&a3 mediaType:*(void *)&a4 subtype:*(void *)&a5 syncGroupID:*(void *)&a6];
  if (result) {
    result->_cipherSuite = a7;
  }
  return result;
}

+ (id)streamGroupConfigWithGroupID:(unsigned int)a3 mediaType:(unsigned int)a4 subtype:(unsigned int)a5 syncGroupID:(unsigned int)a6 cipherSuite:(unsigned int)a7
{
  v7 = [[VCMediaNegotiatorStreamGroupConfiguration alloc] initWithGroupID:*(void *)&a3 mediaType:*(void *)&a4 subtype:*(void *)&a5 syncGroupID:*(void *)&a6 cipherSuite:*(void *)&a7];

  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorStreamGroupConfiguration;
  [(VCMediaNegotiatorStreamGroupConfiguration *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = FourccToCStr(self->_groupID);
  uint64_t v5 = FourccToCStr(self->_mediaType);
  return (id)[v3 stringWithFormat:@"_groupID=%s, _mediaType=%s, _syncGroupID=%s, _cipherSuite=%d streamConfigs=%@", v4, v5, FourccToCStr(self->_syncGroupID), self->_cipherSuite, self->_streamConfigs];
}

- (void)addStreamConfig:(id)a3
{
  if (a3 && (-[NSMutableOrderedSet containsObject:](self->_streamConfigs, "containsObject:") & 1) == 0)
  {
    streamConfigs = self->_streamConfigs;
    [(NSMutableOrderedSet *)streamConfigs addObject:a3];
  }
}

- (void)addCodecConfig:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = (void *)[(NSMutableOrderedSet *)self->_codecConfigs array];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([a3 isEqual:*(void *)(*((void *)&v11 + 1) + 8 * v9)]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      [(NSMutableOrderedSet *)self->_codecConfigs addObject:a3];
    }
  }
}

- (unint64_t)indexOfCodecConfig:(id)a3
{
  if (![(NSMutableOrderedSet *)self->_codecConfigs count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = 0;
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (objc_msgSend(a3, "isEqual:", -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_codecConfigs, "objectAtIndexedSubscript:", v5)))unint64_t v6 = v5; {
    ++v5;
    }
  }
  while (v5 < [(NSMutableOrderedSet *)self->_codecConfigs count]);
  return v6;
}

- (void)removeStreamConfigs:(_NSRange)a3
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)VCMediaNegotiatorStreamGroupConfiguration;
  if (![(VCMediaNegotiatorStreamGroupConfiguration *)&v11 isEqual:a3]) {
    return 0;
  }
  if ([a3 mediaType] != self->_mediaType) {
    return 0;
  }
  if ([a3 mediaSubtype] != self->_mediaSubtype) {
    return 0;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count");
  if (v5 != [(NSMutableOrderedSet *)self->_streamConfigs count]) {
    return 0;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "count");
  if (v6 != [(NSMutableOrderedSet *)self->_codecConfigs count]) {
    return 0;
  }
  if (![a3 u1Config])
  {
    if (!self->_u1Config) {
      goto LABEL_13;
    }
    return 0;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "u1Config"), "isEqual:", self->_u1Config) & 1) == 0) {
    return 0;
  }
LABEL_13:
  if ([(NSMutableOrderedSet *)self->_streamConfigs count])
  {
    uint64_t v9 = 0;
    while ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "objectAtIndex:", v9), "isEqual:", -[NSMutableOrderedSet objectAtIndex:](self->_streamConfigs, "objectAtIndex:", v9)) & 1) != 0)
    {
      if (++v9 >= (unint64_t)[(NSMutableOrderedSet *)self->_streamConfigs count]) {
        goto LABEL_17;
      }
    }
    return 0;
  }
LABEL_17:
  if (![(NSMutableOrderedSet *)self->_codecConfigs count]) {
    return 1;
  }
  unint64_t v10 = 0;
  do
  {
    char v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "objectAtIndex:", v10), "isEqual:", -[NSMutableOrderedSet objectAtIndex:](self->_codecConfigs, "objectAtIndex:", v10));
    if ((v7 & 1) == 0) {
      break;
    }
    ++v10;
  }
  while (v10 < [(NSMutableOrderedSet *)self->_codecConfigs count]);
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithGroupID:mediaType:subtype:syncGroupID:", self->_groupID, self->_mediaType, self->_mediaSubtype, self->_syncGroupID);
  if (v5)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    streamConfigs = self->_streamConfigs;
    uint64_t v7 = [(NSMutableOrderedSet *)streamConfigs countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(streamConfigs);
          }
          uint64_t v11 = [*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
          if (v11)
          {
            uint64_t v12 = (void *)v11;
            [v5 addStreamConfig:v11];
          }
        }
        uint64_t v8 = [(NSMutableOrderedSet *)streamConfigs countByEnumeratingWithState:&v27 objects:v26 count:16];
      }
      while (v8);
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    codecConfigs = self->_codecConfigs;
    uint64_t v14 = [(NSMutableOrderedSet *)codecConfigs countByEnumeratingWithState:&v22 objects:v21 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(codecConfigs);
          }
          uint64_t v18 = [*(id *)(*((void *)&v22 + 1) + 8 * j) copyWithZone:a3];
          if (v18)
          {
            v19 = (void *)v18;
            [v5 addCodecConfig:v18];
          }
        }
        uint64_t v15 = [(NSMutableOrderedSet *)codecConfigs countByEnumeratingWithState:&v22 objects:v21 count:16];
      }
      while (v15);
    }
  }
  return v5;
}

- (unsigned)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(unsigned int)a3
{
  self->_groupID = a3;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (unsigned)mediaSubtype
{
  return self->_mediaSubtype;
}

- (void)setMediaSubtype:(unsigned int)a3
{
  self->_mediaSubtype = a3;
}

- (NSOrderedSet)streamConfigs
{
  return &self->_streamConfigs->super;
}

- (NSOrderedSet)codecConfigs
{
  return &self->_codecConfigs->super;
}

- (unsigned)syncGroupID
{
  return self->_syncGroupID;
}

- (void)setSyncGroupID:(unsigned int)a3
{
  self->_syncGroupID = a3;
}

- (VCMediaNegotiatorStreamGroupU1Configuration)u1Config
{
  return self->_u1Config;
}

- (void)setU1Config:(id)a3
{
}

@end