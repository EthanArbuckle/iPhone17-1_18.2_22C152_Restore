@interface VCPProtoImageCompositionResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoLine)dominantLine;
- (VCPProtoPoint)vanishingPoint;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setDominantLine:(id)a3;
- (void)setVanishingPoint:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageCompositionResult

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageCompositionResult;
  v4 = [(VCPProtoImageCompositionResult *)&v8 description];
  v5 = [(VCPProtoImageCompositionResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_confidence;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"confidence"];

  vanishingPoint = self->_vanishingPoint;
  if (vanishingPoint)
  {
    v7 = [(VCPProtoPoint *)vanishingPoint dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"vanishingPoint"];
  }
  dominantLine = self->_dominantLine;
  if (dominantLine)
  {
    v9 = [(VCPProtoLine *)dominantLine dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"dominantLine"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageCompositionResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_confidence);
  vanishingPoint = self->_vanishingPoint;
  id v5 = a3;
  [v5 setVanishingPoint:vanishingPoint];
  [v5 setDominantLine:self->_dominantLine];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v5 + 8) = self->_confidence;
  id v6 = [(VCPProtoPoint *)self->_vanishingPoint copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(VCPProtoLine *)self->_dominantLine copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_confidence == *((float *)v4 + 2)
    && ((vanishingPoint = self->_vanishingPoint, !((unint64_t)vanishingPoint | v4[3]))
     || -[VCPProtoPoint isEqual:](vanishingPoint, "isEqual:")))
  {
    dominantLine = self->_dominantLine;
    if ((unint64_t)dominantLine | v4[2]) {
      char v7 = -[VCPProtoLine isEqual:](dominantLine, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
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
  unint64_t v12 = [(VCPProtoPoint *)self->_vanishingPoint hash];
  return v12 ^ v11 ^ [(VCPProtoLine *)self->_dominantLine hash];
}

- (void)mergeFrom:(id)a3
{
  float v4 = (float *)a3;
  self->_float confidence = v4[2];
  vanishingPoint = self->_vanishingPoint;
  uint64_t v6 = *((void *)v4 + 3);
  unint64_t v9 = v4;
  if (vanishingPoint)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoPoint mergeFrom:](vanishingPoint, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[VCPProtoImageCompositionResult setVanishingPoint:](self, "setVanishingPoint:");
  }
  float v4 = v9;
LABEL_7:
  dominantLine = self->_dominantLine;
  uint64_t v8 = *((void *)v4 + 2);
  if (dominantLine)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoLine mergeFrom:](dominantLine, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[VCPProtoImageCompositionResult setDominantLine:](self, "setDominantLine:");
  }
  float v4 = v9;
LABEL_13:
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_float confidence = a3;
}

- (VCPProtoPoint)vanishingPoint
{
  return self->_vanishingPoint;
}

- (void)setVanishingPoint:(id)a3
{
}

- (VCPProtoLine)dominantLine
{
  return self->_dominantLine;
}

- (void)setDominantLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vanishingPoint, 0);
  objc_storeStrong((id *)&self->_dominantLine, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"attributes"];
  float v4 = [v3 objectForKeyedSubscript:@"vanishingPointConfidence"];
  float v5 = [v3 objectForKeyedSubscript:@"vanishingPoint"];
  uint64_t v6 = [v3 objectForKeyedSubscript:@"dominantLine"];
  float v7 = v6;
  if (v4) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || [v6 count] != 2)
  {
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = objc_alloc_init(VCPProtoImageCompositionResult);
    [v4 floatValue];
    -[VCPProtoImageCompositionResult setConfidence:](v9, "setConfidence:");
    NSPoint v10 = NSPointFromString(v5);
    unint64_t v11 = +[VCPProtoPoint pointWithPoint:](VCPProtoPoint, "pointWithPoint:", v10.x, v10.y);
    [(VCPProtoImageCompositionResult *)v9 setVanishingPoint:v11];

    unint64_t v12 = [v7 objectAtIndexedSubscript:0];
    NSPoint v13 = NSPointFromString(v12);
    v14 = [v7 objectAtIndexedSubscript:1];
    NSPoint v15 = NSPointFromString(v14);
    v16 = +[VCPProtoLine lineFromPoint:toPoint:](VCPProtoLine, "lineFromPoint:toPoint:", v13.x, v13.y, v15.x, v15.y);
    [(VCPProtoImageCompositionResult *)v9 setDominantLine:v16];
  }
  return v9;
}

- (id)exportToLegacyDictionary
{
  v19[1] = *MEMORY[0x1E4F143B8];
  v18 = @"attributes";
  v16[0] = @"vanishingPointConfidence";
  id v3 = NSNumber;
  [(VCPProtoImageCompositionResult *)self confidence];
  float v4 = objc_msgSend(v3, "numberWithFloat:");
  v17[0] = v4;
  v16[1] = @"vanishingPoint";
  float v5 = [(VCPProtoImageCompositionResult *)self vanishingPoint];
  [v5 pointValue];
  uint64_t v6 = NSStringFromPoint(v21);
  v17[1] = v6;
  v16[2] = @"dominantLine";
  float v7 = [(VCPProtoImageCompositionResult *)self dominantLine];
  [v7 startPointValue];
  BOOL v8 = NSStringFromPoint(v22);
  v15[0] = v8;
  unint64_t v9 = [(VCPProtoImageCompositionResult *)self dominantLine];
  [v9 endPointValue];
  NSPoint v10 = NSStringFromPoint(v23);
  v15[1] = v10;
  unint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  v17[2] = v11;
  unint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  v19[0] = v12;
  NSPoint v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

  return v13;
}

@end