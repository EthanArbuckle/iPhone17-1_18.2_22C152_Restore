@interface SGM2HarvestCostBreakdown
- (BOOL)hasComponentName;
- (BOOL)hasDocumentSource;
- (BOOL)hasSignificantWork;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)significantWork;
- (NSString)componentName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)documentSourceAsString:(int)a3;
- (int)StringAsDocumentSource:(id)a3;
- (int)documentSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setDocumentSource:(int)a3;
- (void)setHasDocumentSource:(BOOL)a3;
- (void)setHasSignificantWork:(BOOL)a3;
- (void)setSignificantWork:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2HarvestCostBreakdown

- (void).cxx_destruct
{
}

- (BOOL)significantWork
{
  return self->_significantWork;
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentName
{
  return self->_componentName;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 24))
  {
    self->_documentSource = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v5 = v4;
    -[SGM2HarvestCostBreakdown setComponentName:](self, "setComponentName:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    self->_significantWork = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_documentSource;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_componentName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_significantWork;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 24);
  if (has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_documentSource != *((_DWORD *)v4 + 4)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_12;
  }
  componentName = self->_componentName;
  if ((unint64_t)componentName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](componentName, "isEqual:")) {
      goto LABEL_12;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 24);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_significantWork)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_12;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_12;
      }
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_documentSource;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_componentName copyWithZone:a3];
  BOOL v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 20) = self->_significantWork;
    *(unsigned char *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_documentSource;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_componentName)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, "setComponentName:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 20) = self->_significantWork;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_componentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2HarvestCostBreakdownReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t documentSource = self->_documentSource;
    if (documentSource >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_documentSource);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E65C0528[documentSource];
    }
    [v3 setObject:v5 forKey:@"documentSource"];
  }
  componentName = self->_componentName;
  if (componentName) {
    [v3 setObject:componentName forKey:@"componentName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = [NSNumber numberWithBool:self->_significantWork];
    [v3 setObject:v7 forKey:@"significantWork"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2HarvestCostBreakdown;
  id v4 = [(SGM2HarvestCostBreakdown *)&v8 description];
  id v5 = [(SGM2HarvestCostBreakdown *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSignificantWork
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSignificantWork:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSignificantWork:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_significantWork = a3;
}

- (BOOL)hasComponentName
{
  return self->_componentName != 0;
}

- (int)StringAsDocumentSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"otherFirstParty"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"otherThirdParty"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Safari"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"News"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Mail"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Messages"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Notes"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Reminders"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)documentSourceAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65C0528[a3];
  }
  return v3;
}

- (BOOL)hasDocumentSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDocumentSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDocumentSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t documentSource = a3;
}

- (int)documentSource
{
  if (*(unsigned char *)&self->_has) {
    return self->_documentSource;
  }
  else {
    return 0;
  }
}

@end