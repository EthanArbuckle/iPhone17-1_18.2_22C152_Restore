@interface GEOLogMsgStateTransit
+ (BOOL)isValid:(id)a3;
- (BOOL)hasTransitNotAvailableAdvisoryShowing;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)transitNotAvailableAdvisoryShowing;
- (GEOLogMsgStateTransit)initWithDictionary:(id)a3;
- (GEOLogMsgStateTransit)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTransitNotAvailableAdvisoryShowing:(BOOL)a3;
- (void)setTransitNotAvailableAdvisoryShowing:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateTransit

- (BOOL)transitNotAvailableAdvisoryShowing
{
  return self->_transitNotAvailableAdvisoryShowing;
}

- (void)setTransitNotAvailableAdvisoryShowing:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_transitNotAvailableAdvisoryShowing = a3;
}

- (void)setHasTransitNotAvailableAdvisoryShowing:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTransitNotAvailableAdvisoryShowing
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateTransit;
  v4 = [(GEOLogMsgStateTransit *)&v8 description];
  v5 = [(GEOLogMsgStateTransit *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateTransit _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[12])
    {
      v5 = [NSNumber numberWithBool:a1[8]];
      if (a2) {
        v6 = @"transitNotAvailableAdvisoryShowing";
      }
      else {
        v6 = @"transit_not_available_advisory_showing";
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
  return -[GEOLogMsgStateTransit _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateTransit)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateTransit *)-[GEOLogMsgStateTransit _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"transitNotAvailableAdvisoryShowing";
      }
      else {
        v6 = @"transit_not_available_advisory_showing";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTransitNotAvailableAdvisoryShowing:", objc_msgSend(v7, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateTransit)initWithJSON:(id)a3
{
  return (GEOLogMsgStateTransit *)-[GEOLogMsgStateTransit _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateTransitIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateTransitReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  [(GEOLogMsgStateTransit *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    v4[8] = self->_transitNotAvailableAdvisoryShowing;
    v4[12] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)result + 8) = self->_transitNotAvailableAdvisoryShowing;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_4;
  }
  [(GEOLogMsgStateTransit *)self readAll:1];
  [v4 readAll:1];
  BOOL v5 = (v4[12] & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((v4[12] & 1) == 0)
    {
LABEL_4:
      BOOL v5 = 0;
      goto LABEL_5;
    }
    if (self->_transitNotAvailableAdvisoryShowing)
    {
      if (!v4[8]) {
        goto LABEL_4;
      }
    }
    else if (v4[8])
    {
      goto LABEL_4;
    }
    BOOL v5 = 1;
  }
LABEL_5:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_flags) {
    return 2654435761 * self->_transitNotAvailableAdvisoryShowing;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  [v4 readAll:0];
  if (v4[12])
  {
    self->_transitNotAvailableAdvisoryShowing = v4[8];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

@end