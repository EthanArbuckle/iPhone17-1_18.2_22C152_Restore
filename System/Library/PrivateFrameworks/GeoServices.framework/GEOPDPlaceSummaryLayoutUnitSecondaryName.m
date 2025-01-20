@interface GEOPDPlaceSummaryLayoutUnitSecondaryName
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSymbolName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitSecondaryName)initWithDictionary:(id)a3;
- (GEOPDPlaceSummaryLayoutUnitSecondaryName)initWithJSON:(id)a3;
- (NSString)symbolName;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSymbolName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDPlaceSummaryLayoutUnitSecondaryName

- (BOOL)hasSymbolName
{
  return self->_symbolName != 0;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnitSecondaryName;
  v4 = [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)&v8 description];
  v5 = [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnitSecondaryName _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 symbolName];
    if (v5)
    {
      if (a2) {
        v6 = @"symbolName";
      }
      else {
        v6 = @"symbol_name";
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
  return -[GEOPDPlaceSummaryLayoutUnitSecondaryName _dictionaryRepresentation:](self, 1);
}

- (GEOPDPlaceSummaryLayoutUnitSecondaryName)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitSecondaryName *)-[GEOSFSymbol _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOPDPlaceSummaryLayoutUnitSecondaryName)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnitSecondaryName *)-[GEOSFSymbol _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitSecondaryNameIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitSecondaryNameReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_symbolName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)self readAll:0];
  if (self->_symbolName) {
    objc_msgSend(v4, "setSymbolName:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_symbolName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = 1;
    [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)self readAll:1];
    [v4 readAll:1];
    symbolName = self->_symbolName;
    if ((unint64_t)symbolName | v4[1]) {
      char v5 = -[NSString isEqual:](symbolName, "isEqual:");
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)self readAll:1];
  symbolName = self->_symbolName;

  return [(NSString *)symbolName hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[1];

  if (v5)
  {
    [(GEOPDPlaceSummaryLayoutUnitSecondaryName *)self setSymbolName:v5];
  }
}

- (void).cxx_destruct
{
}

@end