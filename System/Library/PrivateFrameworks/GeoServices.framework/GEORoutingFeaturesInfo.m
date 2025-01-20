@interface GEORoutingFeaturesInfo
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChargingNetworkInfo;
- (BOOL)hasDestinationVariant;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOChargingNetworkInfo)chargingNetworkInfo;
- (GEORoutingFeaturesInfo)initWithDictionary:(id)a3;
- (GEORoutingFeaturesInfo)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationVariantAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsDestinationVariant:(id)a3;
- (int)destinationVariant;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChargingNetworkInfo:(id)a3;
- (void)setDestinationVariant:(int)a3;
- (void)setHasDestinationVariant:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORoutingFeaturesInfo

- (int)destinationVariant
{
  if (*(unsigned char *)&self->_flags) {
    return self->_destinationVariant;
  }
  else {
    return 1;
  }
}

- (void)setDestinationVariant:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_destinationVariant = a3;
}

- (void)setHasDestinationVariant:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDestinationVariant
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)destinationVariantAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"PROD";
  }
  else if (a3 == 2)
  {
    v4 = @"PREFLIGHT";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsDestinationVariant:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"PROD"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"PREFLIGHT"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (BOOL)hasChargingNetworkInfo
{
  return self->_chargingNetworkInfo != 0;
}

- (GEOChargingNetworkInfo)chargingNetworkInfo
{
  return self->_chargingNetworkInfo;
}

- (void)setChargingNetworkInfo:(id)a3
{
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORoutingFeaturesInfo;
  int v4 = [(GEORoutingFeaturesInfo *)&v8 description];
  v5 = [(GEORoutingFeaturesInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoutingFeaturesInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 20))
    {
      int v5 = *(_DWORD *)(a1 + 16);
      if (v5 == 1)
      {
        v6 = @"PROD";
      }
      else if (v5 == 2)
      {
        v6 = @"PREFLIGHT";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2) {
        v7 = @"destinationVariant";
      }
      else {
        v7 = @"destination_variant";
      }
      [v4 setObject:v6 forKey:v7];
    }
    objc_super v8 = [(id)a1 chargingNetworkInfo];
    v9 = v8;
    if (v8)
    {
      if (a2)
      {
        v10 = [v8 jsonRepresentation];
        v11 = @"chargingNetworkInfo";
      }
      else
      {
        v10 = [v8 dictionaryRepresentation];
        v11 = @"charging_network_info";
      }
      [v4 setObject:v10 forKey:v11];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoutingFeaturesInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORoutingFeaturesInfo)initWithDictionary:(id)a3
{
  return (GEORoutingFeaturesInfo *)-[GEORoutingFeaturesInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_24;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_24;
  }
  if (a3) {
    v6 = @"destinationVariant";
  }
  else {
    v6 = @"destination_variant";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v9 = 1;
    if (([v8 isEqualToString:@"PROD"] & 1) == 0)
    {
      if ([v8 isEqualToString:@"PREFLIGHT"]) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 1;
      }
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_14:
    [a1 setDestinationVariant:v9];
  }

  if (a3) {
    v10 = @"chargingNetworkInfo";
  }
  else {
    v10 = @"charging_network_info";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOChargingNetworkInfo alloc];
    if (a3) {
      uint64_t v13 = [(GEOChargingNetworkInfo *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEOChargingNetworkInfo *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setChargingNetworkInfo:v13];
  }
LABEL_24:

  return a1;
}

- (GEORoutingFeaturesInfo)initWithJSON:(id)a3
{
  return (GEORoutingFeaturesInfo *)-[GEORoutingFeaturesInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoutingFeaturesInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoutingFeaturesInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_chargingNetworkInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEORoutingFeaturesInfo *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 4) = self->_destinationVariant;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  if (self->_chargingNetworkInfo)
  {
    objc_msgSend(v5, "setChargingNetworkInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_destinationVariant;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(GEOChargingNetworkInfo *)self->_chargingNetworkInfo copyWithZone:a3];
  id v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  [(GEORoutingFeaturesInfo *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_destinationVariant != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  chargingNetworkInfo = self->_chargingNetworkInfo;
  if ((unint64_t)chargingNetworkInfo | *((void *)v4 + 1)) {
    char v6 = -[GEOChargingNetworkInfo isEqual:](chargingNetworkInfo, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  [(GEORoutingFeaturesInfo *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_destinationVariant;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(GEOChargingNetworkInfo *)self->_chargingNetworkInfo hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (int *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[5])
  {
    self->_destinationVariant = v7[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
  chargingNetworkInfo = self->_chargingNetworkInfo;
  uint64_t v6 = *((void *)v7 + 1);
  if (chargingNetworkInfo)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOChargingNetworkInfo mergeFrom:](chargingNetworkInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEORoutingFeaturesInfo setChargingNetworkInfo:](self, "setChargingNetworkInfo:");
  }
  id v4 = v7;
LABEL_9:
}

- (void).cxx_destruct
{
}

@end