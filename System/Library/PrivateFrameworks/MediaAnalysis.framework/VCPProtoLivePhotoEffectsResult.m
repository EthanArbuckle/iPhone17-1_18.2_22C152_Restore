@interface VCPProtoLivePhotoEffectsResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasRecipeBlob;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)recipeBlob;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (unint64_t)longExposureSuggestionState;
- (unint64_t)loopSuggestionState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLongExposureSuggestionState:(unint64_t)a3;
- (void)setLoopSuggestionState:(unint64_t)a3;
- (void)setRecipeBlob:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLivePhotoEffectsResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"loopSuggestionState"];
    uint64_t v6 = [v5 integerValue];

    v7 = [v4 objectForKeyedSubscript:@"longExposureSuggestionState"];
    uint64_t v8 = [v7 integerValue];

    v9 = [v4 objectForKeyedSubscript:@"livePhotoEffectsRecipe"];
    v10 = objc_alloc_init(VCPProtoLivePhotoEffectsResult);
    [(VCPProtoLivePhotoEffectsResult *)v10 setLoopSuggestionState:v6];
    [(VCPProtoLivePhotoEffectsResult *)v10 setLongExposureSuggestionState:v8];
    if (v9) {
      [(VCPProtoLivePhotoEffectsResult *)v10 setRecipeBlob:v9];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)exportToLegacyDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCPProtoLivePhotoEffectsResult loopSuggestionState](self, "loopSuggestionState"));
  [v4 setObject:v5 forKeyedSubscript:@"loopSuggestionState"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCPProtoLivePhotoEffectsResult longExposureSuggestionState](self, "longExposureSuggestionState"));
  [v4 setObject:v6 forKeyedSubscript:@"longExposureSuggestionState"];

  v7 = [(VCPProtoLivePhotoEffectsResult *)self recipeBlob];

  if (v7)
  {
    uint64_t v8 = [(VCPProtoLivePhotoEffectsResult *)self recipeBlob];
    [v4 setObject:v8 forKeyedSubscript:@"livePhotoEffectsRecipe"];
  }
  [v3 setObject:v4 forKeyedSubscript:@"attributes"];

  return v3;
}

- (BOOL)hasRecipeBlob
{
  return self->_recipeBlob != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoEffectsResult;
  v4 = [(VCPProtoLivePhotoEffectsResult *)&v8 description];
  v5 = [(VCPProtoLivePhotoEffectsResult *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedLongLong:self->_loopSuggestionState];
  [v3 setObject:v4 forKey:@"loopSuggestionState"];

  v5 = [NSNumber numberWithUnsignedLongLong:self->_longExposureSuggestionState];
  [v3 setObject:v5 forKey:@"longExposureSuggestionState"];

  recipeBlob = self->_recipeBlob;
  if (recipeBlob) {
    [v3 setObject:recipeBlob forKey:@"recipeBlob"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoEffectsResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  if (self->_recipeBlob) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 2) = self->_loopSuggestionState;
  *((void *)a3 + 1) = self->_longExposureSuggestionState;
  recipeBlob = self->_recipeBlob;
  if (recipeBlob) {
    [a3 setRecipeBlob:recipeBlob];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_loopSuggestionState;
  v5[1] = self->_longExposureSuggestionState;
  uint64_t v6 = [(NSData *)self->_recipeBlob copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_loopSuggestionState == v4[2]
    && self->_longExposureSuggestionState == v4[1])
  {
    recipeBlob = self->_recipeBlob;
    if ((unint64_t)recipeBlob | v4[3]) {
      char v6 = -[NSData isEqual:](recipeBlob, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = (2654435761u * self->_longExposureSuggestionState) ^ (2654435761u * self->_loopSuggestionState);
  return v2 ^ [(NSData *)self->_recipeBlob hash];
}

- (void)mergeFrom:(id)a3
{
  self->_loopSuggestionState = *((void *)a3 + 2);
  self->_longExposureSuggestionState = *((void *)a3 + 1);
  if (*((void *)a3 + 3)) {
    -[VCPProtoLivePhotoEffectsResult setRecipeBlob:](self, "setRecipeBlob:");
  }
}

- (unint64_t)loopSuggestionState
{
  return self->_loopSuggestionState;
}

- (void)setLoopSuggestionState:(unint64_t)a3
{
  self->_loopSuggestionState = a3;
}

- (unint64_t)longExposureSuggestionState
{
  return self->_longExposureSuggestionState;
}

- (void)setLongExposureSuggestionState:(unint64_t)a3
{
  self->_longExposureSuggestionState = a3;
}

- (NSData)recipeBlob
{
  return self->_recipeBlob;
}

- (void)setRecipeBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end