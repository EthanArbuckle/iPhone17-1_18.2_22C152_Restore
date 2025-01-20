@interface MTRPluginPBMReadParams
- (BOOL)assumeUnknownAttributesReportable;
- (BOOL)filterByFabric;
- (BOOL)hasAssumeUnknownAttributesReportable;
- (BOOL)hasFilterByFabric;
- (BOOL)hasMinEventNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)readFrom:(id)a3;
- (MTRPluginPBMReadParams)initWithReadParams:(id)a3;
- (MTRPluginPBMVariableValue)minEventNumber;
- (MTRReadParams)readParams;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssumeUnknownAttributesReportable:(BOOL)a3;
- (void)setFilterByFabric:(BOOL)a3;
- (void)setHasAssumeUnknownAttributesReportable:(BOOL)a3;
- (void)setHasFilterByFabric:(BOOL)a3;
- (void)setMinEventNumber:(id)a3;
- (void)setReadParams:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MTRPluginPBMReadParams

- (MTRPluginPBMReadParams)initWithReadParams:(id)a3
{
  id v4 = a3;
  if (v4 && (self = [(MTRPluginPBMReadParams *)self init]) != 0)
  {
    -[MTRPluginPBMReadParams setFilterByFabric:](self, "setFilterByFabric:", [v4 shouldFilterByFabric]);
    -[MTRPluginPBMReadParams setAssumeUnknownAttributesReportable:](self, "setAssumeUnknownAttributesReportable:", [v4 shouldAssumeUnknownAttributesReportable]);
    v5 = [v4 minEventNumber];

    if (v5)
    {
      v6 = [MTRPluginPBMVariableValue alloc];
      v7 = [v4 minEventNumber];
      v8 = [(MTRPluginPBMVariableValue *)v6 initWithObjectValue:v7];
      [(MTRPluginPBMReadParams *)self setMinEventNumber:v8];
    }
    self = self;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setReadParams:(id)a3
{
  id v8 = a3;
  -[MTRPluginPBMReadParams setFilterByFabric:](self, "setFilterByFabric:", [v8 shouldFilterByFabric]);
  -[MTRPluginPBMReadParams setAssumeUnknownAttributesReportable:](self, "setAssumeUnknownAttributesReportable:", [v8 shouldAssumeUnknownAttributesReportable]);
  id v4 = [v8 minEventNumber];

  if (v4)
  {
    v5 = [MTRPluginPBMVariableValue alloc];
    v6 = [v8 minEventNumber];
    v7 = [(MTRPluginPBMVariableValue *)v5 initWithObjectValue:v6];
    [(MTRPluginPBMReadParams *)self setMinEventNumber:v7];
  }
}

- (MTRReadParams)readParams
{
  id v3 = objc_alloc_init(MEMORY[0x263F10FA0]);
  objc_msgSend(v3, "setFilterByFabric:", -[MTRPluginPBMReadParams filterByFabric](self, "filterByFabric"));
  objc_msgSend(v3, "setAssumeUnknownAttributesReportable:", -[MTRPluginPBMReadParams assumeUnknownAttributesReportable](self, "assumeUnknownAttributesReportable"));
  id v4 = [(MTRPluginPBMReadParams *)self minEventNumber];

  if (v4)
  {
    v5 = [(MTRPluginPBMReadParams *)self minEventNumber];
    v6 = [v5 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(MTRPluginPBMReadParams *)self minEventNumber];
      id v8 = [v7 object];
      [v3 setMinEventNumber:v8];
    }
    else
    {
      [v3 setMinEventNumber:0];
    }
  }
  return (MTRReadParams *)v3;
}

- (BOOL)isValid
{
  BOOL v3 = [(MTRPluginPBMReadParams *)self hasFilterByFabric];
  if (v3)
  {
    LOBYTE(v3) = [(MTRPluginPBMReadParams *)self hasAssumeUnknownAttributesReportable];
  }
  return v3;
}

- (void)setFilterByFabric:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_filterByFabric = a3;
}

- (void)setHasFilterByFabric:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFilterByFabric
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAssumeUnknownAttributesReportable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_assumeUnknownAttributesReportable = a3;
}

- (void)setHasAssumeUnknownAttributesReportable:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssumeUnknownAttributesReportable
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMinEventNumber
{
  return self->_minEventNumber != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTRPluginPBMReadParams;
  id v4 = [(MTRPluginPBMReadParams *)&v8 description];
  v5 = [(MTRPluginPBMReadParams *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_filterByFabric];
    [v3 setObject:v5 forKey:@"filterByFabric"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithBool:self->_assumeUnknownAttributesReportable];
    [v3 setObject:v6 forKey:@"assumeUnknownAttributesReportable"];
  }
  minEventNumber = self->_minEventNumber;
  if (minEventNumber)
  {
    objc_super v8 = [(MTRPluginPBMVariableValue *)minEventNumber dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"minEventNumber"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTRPluginPBMReadParamsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_minEventNumber)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[17] = self->_filterByFabric;
    v4[20] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[16] = self->_assumeUnknownAttributesReportable;
    v4[20] |= 1u;
  }
  if (self->_minEventNumber)
  {
    id v6 = v4;
    objc_msgSend(v4, "setMinEventNumber:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[17] = self->_filterByFabric;
    v5[20] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[16] = self->_assumeUnknownAttributesReportable;
    v5[20] |= 1u;
  }
  id v8 = [(MTRPluginPBMVariableValue *)self->_minEventNumber copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0) {
      goto LABEL_14;
    }
    if (self->_filterByFabric)
    {
      if (!*((unsigned char *)v4 + 17)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 17))
    {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0) {
      goto LABEL_20;
    }
LABEL_14:
    char v5 = 0;
    goto LABEL_15;
  }
  if ((*((unsigned char *)v4 + 20) & 1) == 0) {
    goto LABEL_14;
  }
  if (!self->_assumeUnknownAttributesReportable)
  {
    if (!*((unsigned char *)v4 + 16)) {
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if (!*((unsigned char *)v4 + 16)) {
    goto LABEL_14;
  }
LABEL_20:
  minEventNumber = self->_minEventNumber;
  if ((unint64_t)minEventNumber | *((void *)v4 + 1)) {
    char v5 = -[MTRPluginPBMVariableValue isEqual:](minEventNumber, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_filterByFabric;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(MTRPluginPBMVariableValue *)self->_minEventNumber hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_assumeUnknownAttributesReportable;
  return v3 ^ v2 ^ [(MTRPluginPBMVariableValue *)self->_minEventNumber hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (BOOL *)a3;
  char v5 = v4;
  BOOL v6 = v4[20];
  if ((v6 & 2) != 0)
  {
    self->_filterByFabric = v4[17];
    *(unsigned char *)&self->_has |= 2u;
    BOOL v6 = v4[20];
  }
  if (v6)
  {
    self->_assumeUnknownAttributesReportable = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  minEventNumber = self->_minEventNumber;
  uint64_t v8 = *((void *)v5 + 1);
  if (minEventNumber)
  {
    if (v8) {
      -[MTRPluginPBMVariableValue mergeFrom:](minEventNumber, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[MTRPluginPBMReadParams setMinEventNumber:](self, "setMinEventNumber:");
  }
  MEMORY[0x270F9A758]();
}

- (BOOL)filterByFabric
{
  return self->_filterByFabric;
}

- (BOOL)assumeUnknownAttributesReportable
{
  return self->_assumeUnknownAttributesReportable;
}

- (MTRPluginPBMVariableValue)minEventNumber
{
  return self->_minEventNumber;
}

- (void)setMinEventNumber:(id)a3
{
}

- (void).cxx_destruct
{
}

@end