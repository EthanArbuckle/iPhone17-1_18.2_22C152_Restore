@interface CKDPDate
- (BOOL)hasTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)time;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTime:(BOOL)a3;
- (void)setTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPDate

- (void)setTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_time = a3;
}

- (void)setHasTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPDate;
  v4 = [(CKDPDate *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (*(unsigned char *)&self->_has)
  {
    v9 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, self->_time);
    objc_msgSend_setObject_forKey_(v8, v10, (uint64_t)v9, @"time");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPDateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = *(void *)&self->_time;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  id result = (id)objc_msgSend_init(v8, v9, v10, v11);
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = *(void *)&self->_time;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_6;
  }
  BOOL v8 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_time == *((double *)v4 + 1))
    {
      BOOL v8 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return 0;
  }
  double time = self->_time;
  double v4 = -time;
  if (time >= 0.0) {
    double v4 = self->_time;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  unint64_t result = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0) {
      result += (unint64_t)v6;
    }
  }
  else
  {
    result -= (unint64_t)fabs(v6);
  }
  return result;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_double time = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (double)time
{
  return self->_time;
}

@end