@interface GEOMapsNearbyWidget
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasServerMetadata;
- (BOOL)hasTappedItemIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOMapsNearbyWidget)initWithDictionary:(id)a3;
- (GEOMapsNearbyWidget)initWithJSON:(id)a3;
- (GEOMapsServerMetadata)serverMetadata;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)tappedItemIndex;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTappedItemIndex:(BOOL)a3;
- (void)setServerMetadata:(id)a3;
- (void)setTappedItemIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMapsNearbyWidget

- (BOOL)hasServerMetadata
{
  return self->_serverMetadata != 0;
}

- (GEOMapsServerMetadata)serverMetadata
{
  return self->_serverMetadata;
}

- (void)setServerMetadata:(id)a3
{
}

- (int)tappedItemIndex
{
  if (*(unsigned char *)&self->_flags) {
    return self->_tappedItemIndex;
  }
  else {
    return -1;
  }
}

- (void)setTappedItemIndex:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_tappedItemIndex = a3;
}

- (void)setHasTappedItemIndex:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTappedItemIndex
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapsNearbyWidget;
  v4 = [(GEOMapsNearbyWidget *)&v8 description];
  v5 = [(GEOMapsNearbyWidget *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapsNearbyWidget _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 serverMetadata];
    v6 = v5;
    if (v5)
    {
      if (a2)
      {
        v7 = [v5 jsonRepresentation];
        objc_super v8 = @"serverMetadata";
      }
      else
      {
        v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"server_metadata";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if (*(unsigned char *)(a1 + 20))
    {
      v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v10 = @"tappedItemIndex";
      }
      else {
        v10 = @"tapped_item_index";
      }
      [v4 setObject:v9 forKey:v10];
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
  return -[GEOMapsNearbyWidget _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOMapsNearbyWidget)initWithDictionary:(id)a3
{
  return (GEOMapsNearbyWidget *)-[GEOMapsNearbyWidget _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"serverMetadata";
      }
      else {
        v6 = @"server_metadata";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOMapsServerMetadata alloc];
        if (a3) {
          uint64_t v9 = [(GEOMapsServerMetadata *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOMapsServerMetadata *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setServerMetadata:v9];
      }
      if (a3) {
        v11 = @"tappedItemIndex";
      }
      else {
        v11 = @"tapped_item_index";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTappedItemIndex:", objc_msgSend(v12, "intValue"));
      }
    }
  }

  return a1;
}

- (GEOMapsNearbyWidget)initWithJSON:(id)a3
{
  return (GEOMapsNearbyWidget *)-[GEOMapsNearbyWidget _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapsNearbyWidgetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMapsNearbyWidgetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serverMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOMapsServerMetadata *)self->_serverMetadata hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOMapsNearbyWidget *)self readAll:0];
  if (self->_serverMetadata) {
    objc_msgSend(v4, "setServerMetadata:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 4) = self->_tappedItemIndex;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOMapsServerMetadata *)self->_serverMetadata copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 16) = self->_tappedItemIndex;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  [(GEOMapsNearbyWidget *)self readAll:1];
  [v4 readAll:1];
  serverMetadata = self->_serverMetadata;
  if ((unint64_t)serverMetadata | *((void *)v4 + 1))
  {
    if (!-[GEOMapsServerMetadata isEqual:](serverMetadata, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_tappedItemIndex == *((_DWORD *)v4 + 4))
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
  [(GEOMapsNearbyWidget *)self readAll:1];
  unint64_t v3 = [(GEOMapsServerMetadata *)self->_serverMetadata hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_tappedItemIndex;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL v6 = (int *)a3;
  [v6 readAll:0];
  serverMetadata = self->_serverMetadata;
  uint64_t v5 = *((void *)v6 + 1);
  if (serverMetadata)
  {
    if (v5) {
      -[GEOMapsServerMetadata mergeFrom:](serverMetadata, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOMapsNearbyWidget setServerMetadata:](self, "setServerMetadata:");
  }
  if (v6[5])
  {
    self->_tappedItemIndex = v6[4];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
}

@end