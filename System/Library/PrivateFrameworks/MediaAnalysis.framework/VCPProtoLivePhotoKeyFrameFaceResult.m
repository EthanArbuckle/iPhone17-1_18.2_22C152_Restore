@interface VCPProtoLivePhotoKeyFrameFaceResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoBounds)faceBounds;
- (float)faceQuality;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFaceBounds:(id)a3;
- (void)setFaceQuality:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLivePhotoKeyFrameFaceResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"faceBounds"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"faceQuality"];
  v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_alloc_init(VCPProtoLivePhotoKeyFrameFaceResult);
    NSRect v12 = NSRectFromString(v4);
    v9 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
    [(VCPProtoLivePhotoKeyFrameFaceResult *)v8 setFaceBounds:v9];

    [v6 floatValue];
    -[VCPProtoLivePhotoKeyFrameFaceResult setFaceQuality:](v8, "setFaceQuality:");
  }

  return v8;
}

- (id)exportToLegacyDictionary
{
  v13[1] = *MEMORY[0x1E4F143B8];
  NSRect v12 = @"attributes";
  v10[0] = @"faceBounds";
  v3 = [(VCPProtoLivePhotoKeyFrameFaceResult *)self faceBounds];
  [v3 rectValue];
  v4 = NSStringFromRect(v15);
  v11[0] = v4;
  v10[1] = @"faceQuality";
  uint64_t v5 = NSNumber;
  [(VCPProtoLivePhotoKeyFrameFaceResult *)self faceQuality];
  v6 = objc_msgSend(v5, "numberWithFloat:");
  v11[1] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return v8;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoKeyFrameFaceResult;
  v4 = [(VCPProtoLivePhotoKeyFrameFaceResult *)&v8 description];
  uint64_t v5 = [(VCPProtoLivePhotoKeyFrameFaceResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  faceBounds = self->_faceBounds;
  if (faceBounds)
  {
    v6 = [(VCPProtoBounds *)faceBounds dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"faceBounds"];
  }
  *(float *)&double v4 = self->_faceQuality;
  BOOL v7 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v7 forKey:@"faceQuality"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoKeyFrameFaceResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
}

- (void)copyTo:(id)a3
{
  faceBounds = self->_faceBounds;
  uint64_t v5 = (float *)a3;
  [v5 setFaceBounds:faceBounds];
  v5[4] = self->_faceQuality;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(VCPProtoBounds *)self->_faceBounds copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(float *)(v5 + 16) = self->_faceQuality;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((faceBounds = self->_faceBounds, !((unint64_t)faceBounds | *((void *)v4 + 1)))
     || -[VCPProtoBounds isEqual:](faceBounds, "isEqual:"))
    && self->_faceQuality == *((float *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VCPProtoBounds *)self->_faceBounds hash];
  float faceQuality = self->_faceQuality;
  float v5 = -faceQuality;
  if (faceQuality >= 0.0) {
    float v5 = self->_faceQuality;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  unint64_t v9 = v8 + (unint64_t)v7;
  float v10 = fabsf(v7);
  if (v7 <= 0.0) {
    unint64_t v9 = v8;
  }
  unint64_t v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0) {
    unint64_t v11 = v9;
  }
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  faceBounds = self->_faceBounds;
  uint64_t v6 = *((void *)v4 + 1);
  if (faceBounds)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoBounds mergeFrom:](faceBounds, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoLivePhotoKeyFrameFaceResult setFaceBounds:](self, "setFaceBounds:");
  }
  id v4 = v7;
LABEL_7:
  self->_float faceQuality = *((float *)v4 + 4);
}

- (VCPProtoBounds)faceBounds
{
  return self->_faceBounds;
}

- (void)setFaceBounds:(id)a3
{
}

- (float)faceQuality
{
  return self->_faceQuality;
}

- (void)setFaceQuality:(float)a3
{
  self->_float faceQuality = a3;
}

- (void).cxx_destruct
{
}

@end