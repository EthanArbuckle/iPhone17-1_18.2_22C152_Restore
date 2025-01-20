@interface VCPProtoImageSaliencyResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoBounds)bounds;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setConfidence:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageSaliencyResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"saliencyConfidence"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"saliencyBounds"];
  v6 = (NSString *)v5;
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
    v8 = objc_alloc_init(VCPProtoImageSaliencyResult);
    [v4 floatValue];
    -[VCPProtoImageSaliencyResult setConfidence:](v8, "setConfidence:");
    NSRect v12 = NSRectFromString(v6);
    v9 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
    [(VCPProtoImageSaliencyResult *)v8 setBounds:v9];
  }
  return v8;
}

- (id)exportToLegacyDictionary
{
  v13[1] = *MEMORY[0x1E4F143B8];
  NSRect v12 = @"attributes";
  v10[0] = @"saliencyConfidence";
  v3 = NSNumber;
  [(VCPProtoImageSaliencyResult *)self confidence];
  v4 = objc_msgSend(v3, "numberWithFloat:");
  v11[0] = v4;
  v10[1] = @"saliencyBounds";
  uint64_t v5 = [(VCPProtoImageSaliencyResult *)self bounds];
  [v5 rectValue];
  v6 = NSStringFromRect(v15);
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
  v8.super_class = (Class)VCPProtoImageSaliencyResult;
  v4 = [(VCPProtoImageSaliencyResult *)&v8 description];
  uint64_t v5 = [(VCPProtoImageSaliencyResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_confidence;
  uint64_t v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"confidence"];

  bounds = self->_bounds;
  if (bounds)
  {
    BOOL v7 = [(VCPProtoBounds *)bounds dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"bounds"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageSaliencyResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = LODWORD(self->_confidence);
  [a3 setBounds:self->_bounds];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 16) = self->_confidence;
  id v6 = [(VCPProtoBounds *)self->_bounds copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_confidence == *((float *)v4 + 4))
  {
    bounds = self->_bounds;
    if ((unint64_t)bounds | v4[1]) {
      char v6 = -[VCPProtoBounds isEqual:](bounds, "isEqual:");
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
  float confidence = self->_confidence;
  float v4 = -confidence;
  if (confidence >= 0.0) {
    float v4 = self->_confidence;
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
  return [(VCPProtoBounds *)self->_bounds hash] ^ v11;
}

- (void)mergeFrom:(id)a3
{
  float v4 = (float *)a3;
  self->_float confidence = v4[4];
  bounds = self->_bounds;
  uint64_t v6 = *((void *)v4 + 1);
  if (bounds)
  {
    if (!v6) {
      goto LABEL_7;
    }
    float v7 = v4;
    -[VCPProtoBounds mergeFrom:](bounds, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    float v7 = v4;
    -[VCPProtoImageSaliencyResult setBounds:](self, "setBounds:");
  }
  float v4 = v7;
LABEL_7:
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_float confidence = a3;
}

- (VCPProtoBounds)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (void).cxx_destruct
{
}

@end