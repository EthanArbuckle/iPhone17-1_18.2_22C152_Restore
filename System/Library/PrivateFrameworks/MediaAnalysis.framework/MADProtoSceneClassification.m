@interface MADProtoSceneClassification
+ (id)protoFromPhotosSceneClassification:(id)a3;
- (BOOL)hasBoundingBox;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (VCPProtoBounds)boundingBox;
- (double)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)photosSceneClassification;
- (unint64_t)extendedSceneIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoundingBox:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setExtendedSceneIdentifier:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MADProtoSceneClassification

+ (id)protoFromPhotosSceneClassification:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(MADProtoSceneClassification);
  -[MADProtoSceneClassification setExtendedSceneIdentifier:](v4, "setExtendedSceneIdentifier:", [v3 extendedSceneIdentifier]);
  [v3 confidence];
  -[MADProtoSceneClassification setConfidence:](v4, "setConfidence:");
  [v3 boundingBox];
  if (!CGRectIsEmpty(v8))
  {
    [v3 boundingBox];
    v5 = +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:");
    [(MADProtoSceneClassification *)v4 setBoundingBox:v5];
  }
  return v4;
}

- (id)photosSceneClassification
{
  BOOL v3 = [(MADProtoSceneClassification *)self hasBoundingBox];
  id v4 = objc_alloc(MEMORY[0x1E4F39288]);
  unint64_t v5 = [(MADProtoSceneClassification *)self extendedSceneIdentifier];
  [(MADProtoSceneClassification *)self confidence];
  double v7 = v6;
  if (v3)
  {
    CGRect v8 = [(MADProtoSceneClassification *)self boundingBox];
    [v8 rectValue];
    v13 = objc_msgSend(v4, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v5, 0, v7, v9, v10, v11, v12, 0.0, 0.0);
  }
  else
  {
    v13 = objc_msgSend(v4, "initWithExtendedSceneIdentifier:confidence:boundingBox:startTime:duration:classificationType:", v5, 0, v6, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), 0.0, 0.0);
  }
  return v13;
}

- (BOOL)hasBoundingBox
{
  return self->_boundingBox != 0;
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MADProtoSceneClassification;
  id v4 = [(MADProtoSceneClassification *)&v8 description];
  unint64_t v5 = [(MADProtoSceneClassification *)self dictionaryRepresentation];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithUnsignedLongLong:self->_extendedSceneIdentifier];
  [v3 setObject:v4 forKey:@"extendedSceneIdentifier"];

  unint64_t v5 = [NSNumber numberWithDouble:self->_confidence];
  [v3 setObject:v5 forKey:@"confidence"];

  boundingBox = self->_boundingBox;
  if (boundingBox)
  {
    double v7 = [(VCPProtoBounds *)boundingBox dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"boundingBox"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoSceneClassificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteDoubleField();
  if (self->_boundingBox) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 2) = self->_extendedSceneIdentifier;
  *((void *)a3 + 1) = *(void *)&self->_confidence;
  boundingBox = self->_boundingBox;
  if (boundingBox) {
    [a3 setBoundingBox:boundingBox];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 16) = self->_extendedSceneIdentifier;
  *(double *)(v5 + 8) = self->_confidence;
  id v6 = [(VCPProtoBounds *)self->_boundingBox copyWithZone:a3];
  double v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_extendedSceneIdentifier == v4[2]
    && self->_confidence == *((double *)v4 + 1))
  {
    boundingBox = self->_boundingBox;
    if ((unint64_t)boundingBox | v4[3]) {
      char v6 = -[VCPProtoBounds isEqual:](boundingBox, "isEqual:");
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
  unint64_t extendedSceneIdentifier = self->_extendedSceneIdentifier;
  double confidence = self->_confidence;
  double v5 = -confidence;
  if (confidence >= 0.0) {
    double v5 = self->_confidence;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  return v12 ^ (2654435761u * extendedSceneIdentifier) ^ [(VCPProtoBounds *)self->_boundingBox hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unint64_t extendedSceneIdentifier = *((void *)v4 + 2);
  self->_double confidence = *((double *)v4 + 1);
  boundingBox = self->_boundingBox;
  uint64_t v6 = *((void *)v4 + 3);
  if (boundingBox)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[VCPProtoBounds mergeFrom:](boundingBox, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[MADProtoSceneClassification setBoundingBox:](self, "setBoundingBox:");
  }
  id v4 = v7;
LABEL_7:
}

- (unint64_t)extendedSceneIdentifier
{
  return self->_extendedSceneIdentifier;
}

- (void)setExtendedSceneIdentifier:(unint64_t)a3
{
  self->_unint64_t extendedSceneIdentifier = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_double confidence = a3;
}

- (VCPProtoBounds)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
}

- (void).cxx_destruct
{
}

@end