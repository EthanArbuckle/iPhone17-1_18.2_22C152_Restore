@interface BLTPBSetSectionSubtypeParametersIconRequest
- (BLTPBSectionIcon)icon;
- (BOOL)defaultSubtype;
- (BOOL)hasDefaultSubtype;
- (BOOL)hasIcon;
- (BOOL)hasSectionID;
- (BOOL)hasSubtypeID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)subtypeID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDefaultSubtype:(BOOL)a3;
- (void)setHasDefaultSubtype:(BOOL)a3;
- (void)setHasSubtypeID:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setSectionID:(id)a3;
- (void)setSubtypeID:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSetSectionSubtypeParametersIconRequest

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (void)setSubtypeID:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_subtypeID = a3;
}

- (void)setHasSubtypeID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubtypeID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDefaultSubtype:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_defaultSubtype = a3;
}

- (void)setHasDefaultSubtype:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDefaultSubtype
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSetSectionSubtypeParametersIconRequest;
  v4 = [(BLTPBSetSectionSubtypeParametersIconRequest *)&v8 description];
  v5 = [(BLTPBSetSectionSubtypeParametersIconRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  sectionID = self->_sectionID;
  if (sectionID) {
    [v3 setObject:sectionID forKey:@"sectionID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_subtypeID];
    [v4 setObject:v7 forKey:@"subtypeID"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_defaultSubtype];
    [v4 setObject:v8 forKey:@"defaultSubtype"];
  }
  icon = self->_icon;
  if (icon)
  {
    v10 = [(BLTPBSectionIcon *)icon dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"icon"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetSectionSubtypeParametersIconRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sectionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_icon)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sectionID)
  {
    objc_msgSend(v4, "setSectionID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_subtypeID;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 32) = self->_defaultSubtype;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  if (self->_icon)
  {
    objc_msgSend(v6, "setIcon:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sectionID copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_subtypeID;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_defaultSubtype;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
  id v9 = [(BLTPBSectionIcon *)self->_icon copyWithZone:a3];
  v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_subtypeID != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_13;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0) {
      goto LABEL_19;
    }
LABEL_13:
    char v6 = 0;
    goto LABEL_14;
  }
  if ((*((unsigned char *)v4 + 36) & 2) == 0) {
    goto LABEL_13;
  }
  if (!self->_defaultSubtype)
  {
    if (!*((unsigned char *)v4 + 32)) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  if (!*((unsigned char *)v4 + 32)) {
    goto LABEL_13;
  }
LABEL_19:
  icon = self->_icon;
  if ((unint64_t)icon | *((void *)v4 + 2)) {
    char v6 = -[BLTPBSectionIcon isEqual:](icon, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sectionID hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = 2654435761u * self->_subtypeID;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5 ^ [(BLTPBSectionIcon *)self->_icon hash];
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_defaultSubtype;
  return v4 ^ v3 ^ v5 ^ [(BLTPBSectionIcon *)self->_icon hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 3))
  {
    -[BLTPBSetSectionSubtypeParametersIconRequest setSectionID:](self, "setSectionID:");
    id v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_subtypeID = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_defaultSubtype = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
  }
  icon = self->_icon;
  uint64_t v7 = *((void *)v4 + 2);
  if (icon)
  {
    if (v7) {
      -[BLTPBSectionIcon mergeFrom:](icon, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[BLTPBSetSectionSubtypeParametersIconRequest setIcon:](self, "setIcon:");
  }
  MEMORY[0x270F9A758]();
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (unint64_t)subtypeID
{
  return self->_subtypeID;
}

- (BOOL)defaultSubtype
{
  return self->_defaultSubtype;
}

- (BLTPBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end