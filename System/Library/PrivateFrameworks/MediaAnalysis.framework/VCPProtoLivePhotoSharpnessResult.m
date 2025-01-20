@interface VCPProtoLivePhotoSharpnessResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)sharpness;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSharpness:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoLivePhotoSharpnessResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"quality"];
  if (v3)
  {
    v4 = objc_alloc_init(VCPProtoLivePhotoSharpnessResult);
    [v3 floatValue];
    -[VCPProtoLivePhotoSharpnessResult setSharpness:](v4, "setSharpness:");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)exportToLegacyDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"quality";
  v2 = NSNumber;
  [(VCPProtoLivePhotoSharpnessResult *)self sharpness];
  v3 = objc_msgSend(v2, "numberWithFloat:");
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoLivePhotoSharpnessResult;
  v4 = [(VCPProtoLivePhotoSharpnessResult *)&v8 description];
  v5 = [(VCPProtoLivePhotoSharpnessResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_sharpness;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"sharpness"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoSharpnessResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_sharpness);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_sharpness);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (float *)a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = self->_sharpness == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  float sharpness = self->_sharpness;
  float v3 = -sharpness;
  if (sharpness >= 0.0) {
    float v3 = self->_sharpness;
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
  self->_float sharpness = *((float *)a3 + 2);
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_float sharpness = a3;
}

@end