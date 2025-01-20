@interface VCMediaNegotiationBlobVideoPayloadSettings
+ (Class)videoRuleCollectionsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)videoRuleCollections;
- (NSString)featureString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)videoRuleCollectionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)videoRuleCollectionsCount;
- (unsigned)parameterSet;
- (unsigned)payload;
- (void)addVideoRuleCollections:(id)a3;
- (void)clearVideoRuleCollections;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFeatureString:(id)a3;
- (void)setParameterSet:(unsigned int)a3;
- (void)setPayload:(unsigned int)a3;
- (void)setVideoRuleCollections:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobVideoPayloadSettings

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobVideoPayloadSettings *)self setVideoRuleCollections:0];
  [(VCMediaNegotiationBlobVideoPayloadSettings *)self setFeatureString:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoPayloadSettings;
  [(VCMediaNegotiationBlobVideoPayloadSettings *)&v3 dealloc];
}

- (void)clearVideoRuleCollections
{
}

- (void)addVideoRuleCollections:(id)a3
{
  videoRuleCollections = self->_videoRuleCollections;
  if (!videoRuleCollections)
  {
    videoRuleCollections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_videoRuleCollections = videoRuleCollections;
  }

  [(NSMutableArray *)videoRuleCollections addObject:a3];
}

- (unint64_t)videoRuleCollectionsCount
{
  return [(NSMutableArray *)self->_videoRuleCollections count];
}

- (id)videoRuleCollectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_videoRuleCollections objectAtIndex:a3];
}

+ (Class)videoRuleCollectionsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoPayloadSettings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobVideoPayloadSettings description](&v3, sel_description), -[VCMediaNegotiationBlobVideoPayloadSettings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_payload), @"payload");
  if ([(NSMutableArray *)self->_videoRuleCollections count])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_videoRuleCollections, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    videoRuleCollections = self->_videoRuleCollections;
    uint64_t v6 = [(NSMutableArray *)videoRuleCollections countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(videoRuleCollections);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)videoRuleCollections countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"videoRuleCollections"];
  }
  featureString = self->_featureString;
  if (featureString) {
    [v3 setObject:featureString forKey:@"featureString"];
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_parameterSet), @"parameterSet");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobVideoPayloadSettingsReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  PBDataWriterWriteUint32Field();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  videoRuleCollections = self->_videoRuleCollections;
  uint64_t v5 = [(NSMutableArray *)videoRuleCollections countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(videoRuleCollections);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)videoRuleCollections countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 5) = self->_payload;
  if ([(VCMediaNegotiationBlobVideoPayloadSettings *)self videoRuleCollectionsCount])
  {
    [a3 clearVideoRuleCollections];
    unint64_t v5 = [(VCMediaNegotiationBlobVideoPayloadSettings *)self videoRuleCollectionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addVideoRuleCollections:", -[VCMediaNegotiationBlobVideoPayloadSettings videoRuleCollectionsAtIndex:](self, "videoRuleCollectionsAtIndex:", i));
    }
  }
  [a3 setFeatureString:self->_featureString];
  *((_DWORD *)a3 + 4) = self->_parameterSet;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 20) = self->_payload;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  videoRuleCollections = self->_videoRuleCollections;
  uint64_t v7 = [(NSMutableArray *)videoRuleCollections countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(videoRuleCollections);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addVideoRuleCollections:v11];
      }
      uint64_t v8 = [(NSMutableArray *)videoRuleCollections countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }

  *(void *)(v5 + 8) = [(NSString *)self->_featureString copyWithZone:a3];
  *(_DWORD *)(v5 + 16) = self->_parameterSet;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_payload == *((_DWORD *)a3 + 5))
    {
      videoRuleCollections = self->_videoRuleCollections;
      if (!((unint64_t)videoRuleCollections | *((void *)a3 + 3))
        || (int v5 = -[NSMutableArray isEqual:](videoRuleCollections, "isEqual:")) != 0)
      {
        featureString = self->_featureString;
        if (!((unint64_t)featureString | *((void *)a3 + 1))
          || (int v5 = -[NSString isEqual:](featureString, "isEqual:")) != 0)
        {
          LOBYTE(v5) = self->_parameterSet == *((_DWORD *)a3 + 4);
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_payload;
  uint64_t v4 = [(NSMutableArray *)self->_videoRuleCollections hash];
  return v4 ^ [(NSString *)self->_featureString hash] ^ v3 ^ (2654435761 * self->_parameterSet);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_payload = *((_DWORD *)a3 + 5);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v5 = (void *)*((void *)a3 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(VCMediaNegotiationBlobVideoPayloadSettings *)self addVideoRuleCollections:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v7);
  }
  if (*((void *)a3 + 1)) {
    -[VCMediaNegotiationBlobVideoPayloadSettings setFeatureString:](self, "setFeatureString:");
  }
  self->_parameterSet = *((_DWORD *)a3 + 4);
}

- (unsigned)payload
{
  return self->_payload;
}

- (void)setPayload:(unsigned int)a3
{
  self->_payload = a3;
}

- (NSMutableArray)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (void)setVideoRuleCollections:(id)a3
{
}

- (NSString)featureString
{
  return self->_featureString;
}

- (void)setFeatureString:(id)a3
{
}

- (unsigned)parameterSet
{
  return self->_parameterSet;
}

- (void)setParameterSet:(unsigned int)a3
{
  self->_parameterSet = a3;
}

@end