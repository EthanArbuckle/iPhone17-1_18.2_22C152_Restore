@interface GEOLogMsgEventNetworkSelectionHarvest
+ (BOOL)isValid:(id)a3;
- (BOOL)hasHarvestData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgEventNetworkSelectionHarvest)initWithDictionary:(id)a3;
- (GEOLogMsgEventNetworkSelectionHarvest)initWithJSON:(id)a3;
- (NSData)harvestData;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHarvestData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventNetworkSelectionHarvest

- (BOOL)hasHarvestData
{
  return self->_harvestData != 0;
}

- (NSData)harvestData
{
  return self->_harvestData;
}

- (void)setHarvestData:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventNetworkSelectionHarvest;
  v4 = [(GEOLogMsgEventNetworkSelectionHarvest *)&v8 description];
  v5 = [(GEOLogMsgEventNetworkSelectionHarvest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventNetworkSelectionHarvest _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 harvestData];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 base64EncodedStringWithOptions:0];
        [v4 setObject:v7 forKey:@"harvestData"];
      }
      else
      {
        [v4 setObject:v5 forKey:@"harvest_data"];
      }
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
  return -[GEOLogMsgEventNetworkSelectionHarvest _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventNetworkSelectionHarvest)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventNetworkSelectionHarvest *)-[GEOLogMsgEventNetworkSelectionHarvest _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"harvestData";
      }
      else {
        v6 = @"harvest_data";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:0];
        [a1 setHarvestData:v8];
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventNetworkSelectionHarvest)initWithJSON:(id)a3
{
  return (GEOLogMsgEventNetworkSelectionHarvest *)-[GEOLogMsgEventNetworkSelectionHarvest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventNetworkSelectionHarvestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventNetworkSelectionHarvestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_harvestData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgEventNetworkSelectionHarvest *)self readAll:0];
  if (self->_harvestData) {
    objc_msgSend(v4, "setHarvestData:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_harvestData copyWithZone:a3];
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
    [(GEOLogMsgEventNetworkSelectionHarvest *)self readAll:1];
    [v4 readAll:1];
    harvestData = self->_harvestData;
    if ((unint64_t)harvestData | v4[1]) {
      char v5 = -[NSData isEqual:](harvestData, "isEqual:");
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
  [(GEOLogMsgEventNetworkSelectionHarvest *)self readAll:1];
  harvestData = self->_harvestData;

  return [(NSData *)harvestData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  uint64_t v5 = v4[1];

  if (v5)
  {
    [(GEOLogMsgEventNetworkSelectionHarvest *)self setHarvestData:v5];
  }
}

- (void).cxx_destruct
{
}

@end