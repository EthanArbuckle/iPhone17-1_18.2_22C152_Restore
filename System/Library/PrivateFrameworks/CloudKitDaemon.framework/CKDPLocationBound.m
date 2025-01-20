@interface CKDPLocationBound
- (BOOL)hasRadius;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setRadius:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPLocationBound

- (void)setRadius:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRadius
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPLocationBound;
  v4 = [(CKDPLocationBound *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = objc_msgSend_numberWithDouble_(MEMORY[0x1E4F28ED0], v4, v5, self->_radius);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"radius");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EE6B6C((uint64_t)self, (uint64_t)a3);
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
    *((void *)a3 + 1) = *(void *)&self->_radius;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = *(void *)&self->_radius;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_6;
  }
  BOOL v7 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) != 0 && self->_radius == *((double *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v7 = 0;
  }
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return 0;
  }
  double radius = self->_radius;
  double v4 = -radius;
  if (radius >= 0.0) {
    double v4 = self->_radius;
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
    self->_double radius = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (double)radius
{
  return self->_radius;
}

@end