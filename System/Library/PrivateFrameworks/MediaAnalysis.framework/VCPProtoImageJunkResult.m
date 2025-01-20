@interface VCPProtoImageJunkResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageJunkResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"attributes"];
  v4 = [v3 objectForKeyedSubscript:@"junk"];
  if (v4)
  {
    v5 = objc_alloc_init(VCPProtoImageJunkResult);
    [v4 floatValue];
    -[VCPProtoImageJunkResult setConfidence:](v5, "setConfidence:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)exportToLegacyDictionary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9 = @"attributes";
  v7 = @"junk";
  v2 = NSNumber;
  [(VCPProtoImageJunkResult *)self confidence];
  v3 = objc_msgSend(v2, "numberWithFloat:");
  v8 = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v5;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageJunkResult;
  v4 = [(VCPProtoImageJunkResult *)&v8 description];
  v5 = [(VCPProtoImageJunkResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_confidence;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"confidence"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageJunkResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_confidence);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_confidence);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (float *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_confidence == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  float confidence = self->_confidence;
  float v3 = -confidence;
  if (confidence >= 0.0) {
    float v3 = self->_confidence;
  }
  float v4 = floorf(v3 + 0.5);
  float v5 = (float)(v3 - v4) * 1.8447e19;
  float v6 = fmodf(v4, 1.8447e19);
  unint64_t v7 = 2654435761u * (unint64_t)v6;
  unint64_t v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0) {
    unint64_t v8 = 2654435761u * (unint64_t)v6;
  }
  unint64_t v9 = v7 - (unint64_t)fabsf(v5);
  if (v5 < 0.0) {
    return v9;
  }
  else {
    return v8;
  }
}

- (void)mergeFrom:(id)a3
{
  self->_float confidence = *((float *)a3 + 2);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_float confidence = a3;
}

@end