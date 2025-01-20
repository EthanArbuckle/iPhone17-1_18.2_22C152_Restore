@interface BMPBUserProofingEvent
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasAge;
- (BOOL)hasDeviceLanguage;
- (BOOL)hasEthnicity;
- (BOOL)hasGender;
- (BOOL)hasGestureAssessment;
- (BOOL)hasIssuer;
- (BOOL)hasLivenessAssessment;
- (BOOL)hasProofingDecision;
- (BOOL)hasSkinTone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)age;
- (NSString)deviceLanguage;
- (NSString)ethnicity;
- (NSString)gender;
- (NSString)gestureAssessment;
- (NSString)issuer;
- (NSString)livenessAssessment;
- (NSString)proofingDecision;
- (NSString)skinTone;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setAge:(id)a3;
- (void)setDeviceLanguage:(id)a3;
- (void)setEthnicity:(id)a3;
- (void)setGender:(id)a3;
- (void)setGestureAssessment:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setIssuer:(id)a3;
- (void)setLivenessAssessment:(id)a3;
- (void)setProofingDecision:(id)a3;
- (void)setSkinTone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBUserProofingEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAge
{
  return self->_age != 0;
}

- (BOOL)hasGender
{
  return self->_gender != 0;
}

- (BOOL)hasSkinTone
{
  return self->_skinTone != 0;
}

- (BOOL)hasEthnicity
{
  return self->_ethnicity != 0;
}

- (BOOL)hasDeviceLanguage
{
  return self->_deviceLanguage != 0;
}

- (BOOL)hasProofingDecision
{
  return self->_proofingDecision != 0;
}

- (BOOL)hasIssuer
{
  return self->_issuer != 0;
}

- (BOOL)hasLivenessAssessment
{
  return self->_livenessAssessment != 0;
}

- (BOOL)hasGestureAssessment
{
  return self->_gestureAssessment != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBUserProofingEvent;
  v4 = [(BMPBUserProofingEvent *)&v8 description];
  v5 = [(BMPBUserProofingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v3 setObject:v4 forKey:@"absoluteTimestamp"];
  }
  age = self->_age;
  if (age) {
    [v3 setObject:age forKey:@"age"];
  }
  gender = self->_gender;
  if (gender) {
    [v3 setObject:gender forKey:@"gender"];
  }
  skinTone = self->_skinTone;
  if (skinTone) {
    [v3 setObject:skinTone forKey:@"skinTone"];
  }
  ethnicity = self->_ethnicity;
  if (ethnicity) {
    [v3 setObject:ethnicity forKey:@"ethnicity"];
  }
  deviceLanguage = self->_deviceLanguage;
  if (deviceLanguage) {
    [v3 setObject:deviceLanguage forKey:@"deviceLanguage"];
  }
  proofingDecision = self->_proofingDecision;
  if (proofingDecision) {
    [v3 setObject:proofingDecision forKey:@"proofingDecision"];
  }
  issuer = self->_issuer;
  if (issuer) {
    [v3 setObject:issuer forKey:@"issuer"];
  }
  livenessAssessment = self->_livenessAssessment;
  if (livenessAssessment) {
    [v3 setObject:livenessAssessment forKey:@"livenessAssessment"];
  }
  gestureAssessment = self->_gestureAssessment;
  if (gestureAssessment) {
    [v3 setObject:gestureAssessment forKey:@"gestureAssessment"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserProofingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_age)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_gender)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_skinTone)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_ethnicity)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_deviceLanguage)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_proofingDecision)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_issuer)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_livenessAssessment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_gestureAssessment)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 88) |= 1u;
  }
  id v5 = v4;
  if (self->_age)
  {
    objc_msgSend(v4, "setAge:");
    id v4 = v5;
  }
  if (self->_gender)
  {
    objc_msgSend(v5, "setGender:");
    id v4 = v5;
  }
  if (self->_skinTone)
  {
    objc_msgSend(v5, "setSkinTone:");
    id v4 = v5;
  }
  if (self->_ethnicity)
  {
    objc_msgSend(v5, "setEthnicity:");
    id v4 = v5;
  }
  if (self->_deviceLanguage)
  {
    objc_msgSend(v5, "setDeviceLanguage:");
    id v4 = v5;
  }
  if (self->_proofingDecision)
  {
    objc_msgSend(v5, "setProofingDecision:");
    id v4 = v5;
  }
  if (self->_issuer)
  {
    objc_msgSend(v5, "setIssuer:");
    id v4 = v5;
  }
  if (self->_livenessAssessment)
  {
    objc_msgSend(v5, "setLivenessAssessment:");
    id v4 = v5;
  }
  if (self->_gestureAssessment)
  {
    objc_msgSend(v5, "setGestureAssessment:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_age copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_gender copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  uint64_t v11 = [(NSString *)self->_skinTone copyWithZone:a3];
  v12 = (void *)v6[10];
  v6[10] = v11;

  uint64_t v13 = [(NSString *)self->_ethnicity copyWithZone:a3];
  v14 = (void *)v6[4];
  v6[4] = v13;

  uint64_t v15 = [(NSString *)self->_deviceLanguage copyWithZone:a3];
  v16 = (void *)v6[3];
  v6[3] = v15;

  uint64_t v17 = [(NSString *)self->_proofingDecision copyWithZone:a3];
  v18 = (void *)v6[9];
  v6[9] = v17;

  uint64_t v19 = [(NSString *)self->_issuer copyWithZone:a3];
  v20 = (void *)v6[7];
  v6[7] = v19;

  uint64_t v21 = [(NSString *)self->_livenessAssessment copyWithZone:a3];
  v22 = (void *)v6[8];
  v6[8] = v21;

  uint64_t v23 = [(NSString *)self->_gestureAssessment copyWithZone:a3];
  v24 = (void *)v6[6];
  v6[6] = v23;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_25:
    char v14 = 0;
    goto LABEL_26;
  }
  age = self->_age;
  if ((unint64_t)age | *((void *)v4 + 2) && !-[NSString isEqual:](age, "isEqual:")) {
    goto LABEL_25;
  }
  gender = self->_gender;
  if ((unint64_t)gender | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](gender, "isEqual:")) {
      goto LABEL_25;
    }
  }
  skinTone = self->_skinTone;
  if ((unint64_t)skinTone | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](skinTone, "isEqual:")) {
      goto LABEL_25;
    }
  }
  ethnicity = self->_ethnicity;
  if ((unint64_t)ethnicity | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](ethnicity, "isEqual:")) {
      goto LABEL_25;
    }
  }
  deviceLanguage = self->_deviceLanguage;
  if ((unint64_t)deviceLanguage | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceLanguage, "isEqual:")) {
      goto LABEL_25;
    }
  }
  proofingDecision = self->_proofingDecision;
  if ((unint64_t)proofingDecision | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](proofingDecision, "isEqual:")) {
      goto LABEL_25;
    }
  }
  issuer = self->_issuer;
  if ((unint64_t)issuer | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](issuer, "isEqual:")) {
      goto LABEL_25;
    }
  }
  livenessAssessment = self->_livenessAssessment;
  if ((unint64_t)livenessAssessment | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](livenessAssessment, "isEqual:")) {
      goto LABEL_25;
    }
  }
  gestureAssessment = self->_gestureAssessment;
  if ((unint64_t)gestureAssessment | *((void *)v4 + 6)) {
    char v14 = -[NSString isEqual:](gestureAssessment, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v5 = self->_absoluteTimestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_age hash] ^ v3;
  NSUInteger v9 = [(NSString *)self->_gender hash];
  NSUInteger v10 = v8 ^ v9 ^ [(NSString *)self->_skinTone hash];
  NSUInteger v11 = [(NSString *)self->_ethnicity hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_deviceLanguage hash];
  NSUInteger v13 = v10 ^ v12 ^ [(NSString *)self->_proofingDecision hash];
  NSUInteger v14 = [(NSString *)self->_issuer hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_livenessAssessment hash];
  return v13 ^ v15 ^ [(NSString *)self->_gestureAssessment hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if ((_BYTE)v4[11])
  {
    self->_double absoluteTimestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  double v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[BMPBUserProofingEvent setAge:](self, "setAge:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[BMPBUserProofingEvent setGender:](self, "setGender:");
    id v4 = v5;
  }
  if (*((void *)v4 + 10))
  {
    -[BMPBUserProofingEvent setSkinTone:](self, "setSkinTone:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBUserProofingEvent setEthnicity:](self, "setEthnicity:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBUserProofingEvent setDeviceLanguage:](self, "setDeviceLanguage:");
    id v4 = v5;
  }
  if (*((void *)v4 + 9))
  {
    -[BMPBUserProofingEvent setProofingDecision:](self, "setProofingDecision:");
    id v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[BMPBUserProofingEvent setIssuer:](self, "setIssuer:");
    id v4 = v5;
  }
  if (*((void *)v4 + 8))
  {
    -[BMPBUserProofingEvent setLivenessAssessment:](self, "setLivenessAssessment:");
    id v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[BMPBUserProofingEvent setGestureAssessment:](self, "setGestureAssessment:");
    id v4 = v5;
  }
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
}

- (NSString)gender
{
  return self->_gender;
}

- (void)setGender:(id)a3
{
}

- (NSString)skinTone
{
  return self->_skinTone;
}

- (void)setSkinTone:(id)a3
{
}

- (NSString)ethnicity
{
  return self->_ethnicity;
}

- (void)setEthnicity:(id)a3
{
}

- (NSString)deviceLanguage
{
  return self->_deviceLanguage;
}

- (void)setDeviceLanguage:(id)a3
{
}

- (NSString)proofingDecision
{
  return self->_proofingDecision;
}

- (void)setProofingDecision:(id)a3
{
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
}

- (NSString)livenessAssessment
{
  return self->_livenessAssessment;
}

- (void)setLivenessAssessment:(id)a3
{
}

- (NSString)gestureAssessment
{
  return self->_gestureAssessment;
}

- (void)setGestureAssessment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skinTone, 0);
  objc_storeStrong((id *)&self->_proofingDecision, 0);
  objc_storeStrong((id *)&self->_livenessAssessment, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_gestureAssessment, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_ethnicity, 0);
  objc_storeStrong((id *)&self->_deviceLanguage, 0);

  objc_storeStrong((id *)&self->_age, 0);
}

@end