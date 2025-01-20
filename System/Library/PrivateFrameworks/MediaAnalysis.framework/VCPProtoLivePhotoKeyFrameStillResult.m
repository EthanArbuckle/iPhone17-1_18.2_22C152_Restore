@interface VCPProtoLivePhotoKeyFrameStillResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasFlash;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)sharpness;
- (float)stillTime;
- (float)textureness;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasFlash:(BOOL)a3;
- (void)setSharpness:(float)a3;
- (void)setStillTime:(float)a3;
- (void)setTextureness:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLivePhotoKeyFrameStillResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoKeyFrameStillResult;
  v4 = [(VCPProtoLivePhotoKeyFrameStillResult *)&v8 description];
  v5 = [(VCPProtoLivePhotoKeyFrameStillResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_sharpness;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"sharpness"];

  *(float *)&double v6 = self->_textureness;
  v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:@"textureness"];

  objc_super v8 = [NSNumber numberWithBool:self->_hasFlash];
  [v3 setObject:v8 forKey:@"hasFlash"];

  *(float *)&double v9 = self->_stillTime;
  v10 = [NSNumber numberWithFloat:v9];
  [v3 setObject:v10 forKey:@"stillTime"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoKeyFrameStillResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteBOOLField();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_sharpness);
  *((_DWORD *)a3 + 4) = LODWORD(self->_textureness);
  *((unsigned char *)a3 + 20) = self->_hasFlash;
  *((_DWORD *)a3 + 3) = LODWORD(self->_stillTime);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_sharpness);
  *((_DWORD *)result + 4) = LODWORD(self->_textureness);
  *((unsigned char *)result + 20) = self->_hasFlash;
  *((_DWORD *)result + 3) = LODWORD(self->_stillTime);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_sharpness != *((float *)v4 + 2)
    || self->_textureness != *((float *)v4 + 4))
  {
    goto LABEL_8;
  }
  if (!self->_hasFlash)
  {
    if (!*((unsigned char *)v4 + 20)) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL v5 = 0;
    goto LABEL_9;
  }
  if (!*((unsigned char *)v4 + 20)) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL v5 = self->_stillTime == *((float *)v4 + 3);
LABEL_9:

  return v5;
}

- (unint64_t)hash
{
  float sharpness = self->_sharpness;
  float v4 = -sharpness;
  if (sharpness >= 0.0) {
    float v4 = self->_sharpness;
  }
  float v5 = floorf(v4 + 0.5);
  float v6 = (float)(v4 - v5) * 1.8447e19;
  float v7 = fmodf(v5, 1.8447e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  float textureness = self->_textureness;
  float v13 = -textureness;
  if (textureness >= 0.0) {
    float v13 = self->_textureness;
  }
  float v14 = floorf(v13 + 0.5);
  float v15 = (float)(v13 - v14) * 1.8447e19;
  float v16 = fmodf(v14, 1.8447e19);
  unint64_t v17 = 2654435761u * (unint64_t)v16;
  unint64_t v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0) {
    unint64_t v18 = 2654435761u * (unint64_t)v16;
  }
  unint64_t v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  BOOL hasFlash = self->_hasFlash;
  float stillTime = self->_stillTime;
  float v23 = -stillTime;
  if (stillTime >= 0.0) {
    float v23 = self->_stillTime;
  }
  float v24 = floorf(v23 + 0.5);
  float v25 = (float)(v23 - v24) * 1.8447e19;
  float v26 = fmodf(v24, 1.8447e19);
  unint64_t v27 = 2654435761u * (unint64_t)v26;
  unint64_t v28 = v27 + (unint64_t)v25;
  if (v25 <= 0.0) {
    unint64_t v28 = 2654435761u * (unint64_t)v26;
  }
  unint64_t v29 = v27 - (unint64_t)fabsf(v25);
  if (v25 >= 0.0) {
    unint64_t v29 = v28;
  }
  return v20 ^ v11 ^ (2654435761 * hasFlash) ^ v29;
}

- (void)mergeFrom:(id)a3
{
  self->_float sharpness = *((float *)a3 + 2);
  self->_float textureness = *((float *)a3 + 4);
  self->_BOOL hasFlash = *((unsigned char *)a3 + 20);
  self->_float stillTime = *((float *)a3 + 3);
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_float sharpness = a3;
}

- (float)textureness
{
  return self->_textureness;
}

- (void)setTextureness:(float)a3
{
  self->_float textureness = a3;
}

- (BOOL)hasFlash
{
  return self->_hasFlash;
}

- (void)setHasFlash:(BOOL)a3
{
  self->_BOOL hasFlash = a3;
}

- (float)stillTime
{
  return self->_stillTime;
}

- (void)setStillTime:(float)a3
{
  self->_float stillTime = a3;
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  float v4 = v3;
  if (v3)
  {
    float v5 = [v3 objectForKeyedSubscript:@"attributes"];
    if (v5)
    {
      float v6 = objc_alloc_init(VCPProtoLivePhotoKeyFrameStillResult);
      float v7 = [v5 objectForKeyedSubscript:@"sharpness"];
      unint64_t v8 = v7;
      if (v7)
      {
        [(VCPProtoLivePhotoKeyFrameStillResult *)v7 floatValue];
        -[VCPProtoLivePhotoKeyFrameStillResult setSharpness:](v6, "setSharpness:");
        unint64_t v9 = [v5 objectForKeyedSubscript:@"texture"];

        if (!v9) {
          goto LABEL_10;
        }
        [v9 floatValue];
        -[VCPProtoLivePhotoKeyFrameStillResult setTextureness:](v6, "setTextureness:");
        unint64_t v10 = [v5 objectForKeyedSubscript:@"flashFired"];

        if (!v10) {
          goto LABEL_10;
        }
        -[VCPProtoLivePhotoKeyFrameStillResult setHasFlash:](v6, "setHasFlash:", [v10 BOOLValue]);
        unint64_t v11 = [v5 objectForKeyedSubscript:@"stillTime"];

        if (v11)
        {
          [v11 floatValue];
          -[VCPProtoLivePhotoKeyFrameStillResult setStillTime:](v6, "setStillTime:");
          unint64_t v8 = v6;
        }
        else
        {
LABEL_10:
          unint64_t v8 = 0;
        }
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  v16[1] = *MEMORY[0x1E4F143B8];
  float v15 = @"attributes";
  v13[0] = @"sharpness";
  id v3 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameStillResult *)self sharpness];
  float v4 = objc_msgSend(v3, "numberWithFloat:");
  v14[0] = v4;
  v13[1] = @"texture";
  float v5 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameStillResult *)self textureness];
  float v6 = objc_msgSend(v5, "numberWithFloat:");
  v14[1] = v6;
  v13[2] = @"flashFired";
  float v7 = objc_msgSend(NSNumber, "numberWithBool:", -[VCPProtoLivePhotoKeyFrameStillResult hasFlash](self, "hasFlash"));
  v14[2] = v7;
  v13[3] = @"stillTime";
  unint64_t v8 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameStillResult *)self stillTime];
  unint64_t v9 = objc_msgSend(v8, "numberWithFloat:");
  v14[3] = v9;
  unint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  v16[0] = v10;
  unint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

  return v11;
}

@end