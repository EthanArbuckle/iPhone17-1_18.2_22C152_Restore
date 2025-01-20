@interface PersonLinkingPersonPair
- (BOOL)grade;
- (BOOL)hasConfidence;
- (BOOL)hasGrade;
- (BOOL)hasReason;
- (BOOL)hasSourcePerson;
- (BOOL)hasTargetPerson;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)reason;
- (PersonLinkingPerson)sourcePerson;
- (PersonLinkingPerson)targetPerson;
- (float)confidence;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(float)a3;
- (void)setGrade:(BOOL)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasGrade:(BOOL)a3;
- (void)setReason:(id)a3;
- (void)setSourcePerson:(id)a3;
- (void)setTargetPerson:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PersonLinkingPersonPair

- (BOOL)hasSourcePerson
{
  return self->_sourcePerson != 0;
}

- (BOOL)hasTargetPerson
{
  return self->_targetPerson != 0;
}

- (void)setGrade:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_grade = a3;
}

- (void)setHasGrade:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGrade
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConfidence:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PersonLinkingPersonPair;
  v4 = [(PersonLinkingPersonPair *)&v8 description];
  v5 = [(PersonLinkingPersonPair *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sourcePerson = self->_sourcePerson;
  if (sourcePerson)
  {
    v6 = [(PersonLinkingPerson *)sourcePerson dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"sourcePerson"];
  }
  targetPerson = self->_targetPerson;
  if (targetPerson)
  {
    objc_super v8 = [(PersonLinkingPerson *)targetPerson dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"targetPerson"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_grade];
    [v3 setObject:v10 forKey:@"grade"];

    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)&double v4 = self->_confidence;
    v11 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v11 forKey:@"confidence"];
  }
  reason = self->_reason;
  if (reason) {
    [v3 setObject:reason forKey:@"reason"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PersonLinkingPersonPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sourcePerson)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_targetPerson)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
  if (self->_reason)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sourcePerson)
  {
    objc_msgSend(v4, "setSourcePerson:");
    id v4 = v6;
  }
  if (self->_targetPerson)
  {
    objc_msgSend(v6, "setTargetPerson:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_grade;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_confidence);
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if (self->_reason)
  {
    objc_msgSend(v6, "setReason:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PersonLinkingPerson *)self->_sourcePerson copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(PersonLinkingPerson *)self->_targetPerson copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 40) = self->_grade;
    *(unsigned char *)(v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)(v5 + 8) = self->_confidence;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v11 = [(NSString *)self->_reason copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  sourcePerson = self->_sourcePerson;
  if ((unint64_t)sourcePerson | *((void *)v4 + 3))
  {
    if (!-[PersonLinkingPerson isEqual:](sourcePerson, "isEqual:")) {
      goto LABEL_21;
    }
  }
  targetPerson = self->_targetPerson;
  if ((unint64_t)targetPerson | *((void *)v4 + 4))
  {
    if (!-[PersonLinkingPerson isEqual:](targetPerson, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_grade)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_21;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_14;
      }
    }
LABEL_21:
    char v8 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_21;
  }
LABEL_14:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_confidence != *((float *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_21;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((void *)v4 + 2)) {
    char v8 = -[NSString isEqual:](reason, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PersonLinkingPerson *)self->_sourcePerson hash];
  unint64_t v4 = [(PersonLinkingPerson *)self->_targetPerson hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_grade;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10 ^ [(NSString *)self->_reason hash];
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float confidence = self->_confidence;
  float v7 = -confidence;
  if (confidence >= 0.0) {
    float v7 = self->_confidence;
  }
  float v8 = floorf(v7 + 0.5);
  float v9 = (float)(v7 - v8) * 1.8447e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabsf(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ [(NSString *)self->_reason hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sourcePerson = self->_sourcePerson;
  uint64_t v6 = *((void *)v4 + 3);
  id v10 = v4;
  if (sourcePerson)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PersonLinkingPerson mergeFrom:](sourcePerson, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PersonLinkingPersonPair setSourcePerson:](self, "setSourcePerson:");
  }
  id v4 = v10;
LABEL_7:
  targetPerson = self->_targetPerson;
  uint64_t v8 = *((void *)v4 + 4);
  if (targetPerson)
  {
    if (!v8) {
      goto LABEL_13;
    }
    targetPerson = (PersonLinkingPerson *)-[PersonLinkingPerson mergeFrom:](targetPerson, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    targetPerson = (PersonLinkingPerson *)-[PersonLinkingPersonPair setTargetPerson:](self, "setTargetPerson:");
  }
  id v4 = v10;
LABEL_13:
  char v9 = *((unsigned char *)v4 + 44);
  if ((v9 & 2) != 0)
  {
    self->_grade = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)v4 + 44);
  }
  if (v9)
  {
    self->_float confidence = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    targetPerson = (PersonLinkingPerson *)-[PersonLinkingPersonPair setReason:](self, "setReason:");
    id v4 = v10;
  }
  MEMORY[0x1F41817F8](targetPerson, v4);
}

- (PersonLinkingPerson)sourcePerson
{
  return self->_sourcePerson;
}

- (void)setSourcePerson:(id)a3
{
}

- (PersonLinkingPerson)targetPerson
{
  return self->_targetPerson;
}

- (void)setTargetPerson:(id)a3
{
}

- (BOOL)grade
{
  return self->_grade;
}

- (float)confidence
{
  return self->_confidence;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetPerson, 0);
  objc_storeStrong((id *)&self->_sourcePerson, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end