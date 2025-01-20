@interface GEOPDPlaceSummaryLayoutUnitServerOverride
+ (BOOL)isValid:(id)a3;
- (BOOL)hasServerOverrideIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitServerOverride)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitServerOverride)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)serverOverrideIdentifier;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasServerOverrideIdentifier:(BOOL)a3;
- (void)setServerOverrideIdentifier:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnitServerOverride

- (unsigned)serverOverrideIdentifier
{
  return self->_serverOverrideIdentifier;
}

- (void)setServerOverrideIdentifier:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_serverOverrideIdentifier = a3;
}

- (void)setHasServerOverrideIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasServerOverrideIdentifier
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitServerOverride;
  v4 = [(GEOPDPlaceSummaryLayoutUnitServerOverride *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutUnitServerOverride *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitServerOverride _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 12))
    {
      v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 8)];
      if (a2) {
        v6 = @"serverOverrideIdentifier";
      }
      else {
        v6 = @"server_override_identifier";
      }
      [v4 setObject:v5 forKey:v6];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitServerOverride _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitServerOverride)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitServerOverride *)-[GEOPDPlaceSummaryLayoutUnitServerOverride _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"serverOverrideIdentifier";
      }
      else {
        v6 = @"server_override_identifier";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setServerOverrideIdentifier:", objc_msgSend(v7, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOPDPlaceSummaryLayoutUnitServerOverride)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitServerOverride *)-[GEOPDPlaceSummaryLayoutUnitServerOverride _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitServerOverrideIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitServerOverrideReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  [(GEOPDPlaceSummaryLayoutUnitServerOverride *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[2] = self->_serverOverrideIdentifier;
    *((unsigned char *)v4 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)result + 2) = self->_serverOverrideIdentifier;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOPDPlaceSummaryLayoutUnitServerOverride *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (*((unsigned char *)v4 + 12) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 12) & 1) != 0 && self->_serverOverrideIdentifier == *((_DWORD *)v4 + 2))
    {
      BOOL v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    BOOL v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_serverOverrideIdentifier;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  id v4 = (unsigned int *)a3;
  [v4 readAll:0];
  if (v4[3])
  {
    self->_serverOverrideIdentifier = v4[2];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end