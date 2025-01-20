@interface CLPContext
- (BOOL)hasBundleCategory;
- (BOOL)hasIsDriving;
- (BOOL)hasType;
- (BOOL)hasWorkoutType;
- (BOOL)isDriving;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleCategory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (int)workoutType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleCategory:(id)a3;
- (void)setHasIsDriving:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasWorkoutType:(BOOL)a3;
- (void)setIsDriving:(BOOL)a3;
- (void)setType:(int)a3;
- (void)setWorkoutType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLPContext

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsDriving:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isDriving = a3;
}

- (void)setHasIsDriving:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsDriving
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWorkoutType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleCategory
{
  return self->_bundleCategory != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CLPContext;
  v4 = [(CLPContext *)&v8 description];
  v5 = [(CLPContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v8 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v9 = [NSNumber numberWithBool:self->_isDriving];
  [v3 setObject:v9 forKey:@"isDriving"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithInt:self->_workoutType];
    [v3 setObject:v5 forKey:@"workoutType"];
  }
LABEL_5:
  bundleCategory = self->_bundleCategory;
  if (bundleCategory) {
    [v3 setObject:bundleCategory forKey:@"bundleCategory"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_bundleCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_type;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 24) = self->_isDriving;
  *((unsigned char *)v4 + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[5] = self->_workoutType;
    *((unsigned char *)v4 + 28) |= 2u;
  }
LABEL_5:
  if (self->_bundleCategory)
  {
    id v6 = v4;
    objc_msgSend(v4, "setBundleCategory:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 24) = self->_isDriving;
    *(unsigned char *)(v5 + 28) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_type;
  *(unsigned char *)(v5 + 28) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 20) = self->_workoutType;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_bundleCategory copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) != 0)
    {
      if (self->_isDriving)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_22;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_15;
      }
    }
LABEL_22:
    char v6 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 28) & 4) != 0) {
    goto LABEL_22;
  }
LABEL_15:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_workoutType != *((_DWORD *)v4 + 5)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_22;
  }
  bundleCategory = self->_bundleCategory;
  if ((unint64_t)bundleCategory | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](bundleCategory, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_bundleCategory hash];
  }
  uint64_t v2 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isDriving;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_workoutType;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_bundleCategory hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_isDriving = *((unsigned char *)v4 + 24);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_4:
    self->_workoutType = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[CLPContext setBundleCategory:](self, "setBundleCategory:");
    id v4 = v6;
  }
}

- (int)type
{
  return self->_type;
}

- (BOOL)isDriving
{
  return self->_isDriving;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (NSString)bundleCategory
{
  return self->_bundleCategory;
}

- (void)setBundleCategory:(id)a3
{
}

- (void).cxx_destruct
{
}

@end