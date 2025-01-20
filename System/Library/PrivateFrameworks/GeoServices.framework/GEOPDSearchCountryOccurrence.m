@interface GEOPDSearchCountryOccurrence
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchCountryOccurrence

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchCountryOccurrence;
  v4 = [(GEOPDSearchCountryOccurrence *)&v8 description];
  v5 = [(GEOPDSearchCountryOccurrence *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchCountryOccurrence _dictionaryRepresentation:]((uint64_t)self);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    v2 = [MEMORY[0x1E4F1CA60] dictionary];
    v3 = v2;
    if (*(void *)(a1 + 8)) {
      objc_msgSend(v2, "setObject:forKey:");
    }
    if (*(unsigned char *)(a1 + 24))
    {
      v4 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 16)];
      [v3 setObject:v4 forKey:@"occurrence"];
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchCountryOccurrence _dictionaryRepresentation:]((uint64_t)self);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchCountryOccurrenceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_alpha3CountryCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_alpha3CountryCode copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 16) = self->_occurrence;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  alpha3CountryCode = self->_alpha3CountryCode;
  if ((unint64_t)alpha3CountryCode | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](alpha3CountryCode, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_occurrence == *((void *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_alpha3CountryCode hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v4 = 2654435761u * self->_occurrence;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void).cxx_destruct
{
}

@end