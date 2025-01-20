@interface VCPProtoImageExposureResult
+ (id)resultFromLegacyDictionary:(id)a3;
- (BOOL)hasUnderExpose;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)exposure;
- (float)underExpose;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exportToLegacyDictionary;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExposure:(float)a3;
- (void)setHasUnderExpose:(BOOL)a3;
- (void)setUnderExpose:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCPProtoImageExposureResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"quality"];
  if (v4)
  {
    v5 = objc_alloc_init(VCPProtoImageExposureResult);
    [v4 floatValue];
    -[VCPProtoImageExposureResult setExposure:](v5, "setExposure:");
    v6 = [v3 objectForKeyedSubscript:@"attributes"];

    if (v6)
    {
      v7 = [v3 objectForKeyedSubscript:@"attributes"];
      v8 = [v7 objectForKeyedSubscript:@"underExpose"];

      if (v8)
      {
        [v8 floatValue];
        -[VCPProtoImageExposureResult setUnderExpose:](v5, "setUnderExpose:");
      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)exportToLegacyDictionary
{
  v16[2] = *MEMORY[0x1E4F143B8];
  if ([(VCPProtoImageExposureResult *)self hasUnderExpose])
  {
    v15[0] = @"quality";
    id v3 = NSNumber;
    [(VCPProtoImageExposureResult *)self exposure];
    v4 = objc_msgSend(v3, "numberWithFloat:");
    v16[0] = v4;
    v15[1] = @"attributes";
    v13 = @"underExpose";
    v5 = NSNumber;
    [(VCPProtoImageExposureResult *)self underExpose];
    v6 = objc_msgSend(v5, "numberWithFloat:");
    v14 = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v16[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    v11 = @"quality";
    v9 = NSNumber;
    [(VCPProtoImageExposureResult *)self exposure];
    v4 = objc_msgSend(v9, "numberWithFloat:");
    v12 = v4;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }

  return v8;
}

- (void)setUnderExpose:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_underExpose = a3;
}

- (void)setHasUnderExpose:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUnderExpose
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VCPProtoImageExposureResult;
  v4 = [(VCPProtoImageExposureResult *)&v8 description];
  v5 = [(VCPProtoImageExposureResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  *(float *)&double v4 = self->_exposure;
  v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:@"exposure"];

  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v6 = self->_underExpose;
    v7 = [NSNumber numberWithFloat:v6];
    [v3 setObject:v7 forKey:@"underExpose"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoImageExposureResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteFloatField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteFloatField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = LODWORD(self->_exposure);
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 3) = LODWORD(self->_underExpose);
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = LODWORD(self->_exposure);
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 3) = LODWORD(self->_underExpose);
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_exposure != *((float *)v4 + 2)) {
    goto LABEL_7;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_underExpose == *((float *)v4 + 3))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    BOOL v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  float exposure = self->_exposure;
  float v4 = -exposure;
  if (exposure >= 0.0) {
    float v4 = self->_exposure;
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
  if (*(unsigned char *)&self->_has)
  {
    float underExpose = self->_underExpose;
    float v14 = -underExpose;
    if (underExpose >= 0.0) {
      float v14 = self->_underExpose;
    }
    float v15 = floorf(v14 + 0.5);
    float v16 = (float)(v14 - v15) * 1.8447e19;
    float v17 = fmodf(v15, 1.8447e19);
    unint64_t v18 = 2654435761u * (unint64_t)v17;
    unint64_t v19 = v18 + (unint64_t)v16;
    if (v16 <= 0.0) {
      unint64_t v19 = 2654435761u * (unint64_t)v17;
    }
    unint64_t v12 = v18 - (unint64_t)fabsf(v16);
    if (v16 >= 0.0) {
      unint64_t v12 = v19;
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_float exposure = *((float *)a3 + 2);
  if (*((unsigned char *)a3 + 16))
  {
    self->_float underExpose = *((float *)a3 + 3);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (float)exposure
{
  return self->_exposure;
}

- (void)setExposure:(float)a3
{
  self->_float exposure = a3;
}

- (float)underExpose
{
  return self->_underExpose;
}

@end