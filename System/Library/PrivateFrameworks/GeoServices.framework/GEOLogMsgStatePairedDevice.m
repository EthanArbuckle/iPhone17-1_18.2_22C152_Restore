@interface GEOLogMsgStatePairedDevice
+ (BOOL)isValid:(id)a3;
- (BOOL)hasIsConnected;
- (BOOL)hasIsConnectedAndNearby;
- (BOOL)hasPairedDeviceIdentifier;
- (BOOL)hasType;
- (BOOL)isConnected;
- (BOOL)isConnectedAndNearby;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateDeviceIdentifier)pairedDeviceIdentifier;
- (GEOLogMsgStatePairedDevice)initWithDictionary:(id)a3;
- (GEOLogMsgStatePairedDevice)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsConnected:(BOOL)a3;
- (void)setHasIsConnectedAndNearby:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsConnectedAndNearby:(BOOL)a3;
- (void)setPairedDeviceIdentifier:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStatePairedDevice

- (int)type
{
  if (*(unsigned char *)&self->_flags) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53F8268[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PAIRED_DEVICE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PAIRED_DEVICE_WATCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAIRED_DEVICE_PHONE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_isConnected = a3;
}

- (void)setHasIsConnected:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsConnected
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)hasPairedDeviceIdentifier
{
  return self->_pairedDeviceIdentifier != 0;
}

- (GEOLogMsgStateDeviceIdentifier)pairedDeviceIdentifier
{
  return self->_pairedDeviceIdentifier;
}

- (void)setPairedDeviceIdentifier:(id)a3
{
}

- (BOOL)isConnectedAndNearby
{
  return self->_isConnectedAndNearby;
}

- (void)setIsConnectedAndNearby:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_isConnectedAndNearby = a3;
}

- (void)setHasIsConnectedAndNearby:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsConnectedAndNearby
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStatePairedDevice;
  int v4 = [(GEOLogMsgStatePairedDevice *)&v8 description];
  v5 = [(GEOLogMsgStatePairedDevice *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStatePairedDevice _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if (v5)
    {
      uint64_t v6 = *(int *)(a1 + 16);
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F8268[v6];
      }
      [v4 setObject:v7 forKey:@"type"];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 4) != 0)
    {
      objc_super v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 21)];
      if (a2) {
        v9 = @"isConnected";
      }
      else {
        v9 = @"is_connected";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 pairedDeviceIdentifier];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"pairedDeviceIdentifier";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"paired_device_identifier";
      }
      [v4 setObject:v12 forKey:v13];
    }
    if ((*(unsigned char *)(a1 + 24) & 2) != 0)
    {
      v14 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
      if (a2) {
        v15 = @"isConnectedAndNearby";
      }
      else {
        v15 = @"is_connected_and_nearby";
      }
      [v4 setObject:v14 forKey:v15];
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
  return -[GEOLogMsgStatePairedDevice _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStatePairedDevice)initWithDictionary:(id)a3
{
  return (GEOLogMsgStatePairedDevice *)-[GEOLogMsgStatePairedDevice _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_34;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_34;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"PAIRED_DEVICE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"PAIRED_DEVICE_WATCH"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"PAIRED_DEVICE_PHONE"])
    {
      uint64_t v8 = 2;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_14:
    [a1 setType:v8];
  }

  if (a3) {
    v9 = @"isConnected";
  }
  else {
    v9 = @"is_connected";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsConnected:", objc_msgSend(v10, "BOOLValue"));
  }

  if (a3) {
    v11 = @"pairedDeviceIdentifier";
  }
  else {
    v11 = @"paired_device_identifier";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = [GEOLogMsgStateDeviceIdentifier alloc];
    if (a3) {
      uint64_t v14 = [(GEOLogMsgStateDeviceIdentifier *)v13 initWithJSON:v12];
    }
    else {
      uint64_t v14 = [(GEOLogMsgStateDeviceIdentifier *)v13 initWithDictionary:v12];
    }
    v15 = (void *)v14;
    [a1 setPairedDeviceIdentifier:v14];
  }
  if (a3) {
    v16 = @"isConnectedAndNearby";
  }
  else {
    v16 = @"is_connected_and_nearby";
  }
  v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsConnectedAndNearby:", objc_msgSend(v17, "BOOLValue"));
  }

LABEL_34:
  return a1;
}

- (GEOLogMsgStatePairedDevice)initWithJSON:(id)a3
{
  return (GEOLogMsgStatePairedDevice *)-[GEOLogMsgStatePairedDevice _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStatePairedDeviceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStatePairedDeviceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_pairedDeviceIdentifier) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v6 = a3;
  [(GEOLogMsgStatePairedDevice *)self readAll:0];
  int v4 = v6;
  char flags = (char)self->_flags;
  if (flags)
  {
    *((_DWORD *)v6 + 4) = self->_type;
    v6[24] |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    v6[21] = self->_isConnected;
    v6[24] |= 4u;
  }
  if (self->_pairedDeviceIdentifier)
  {
    objc_msgSend(v6, "setPairedDeviceIdentifier:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    v4[20] = self->_isConnectedAndNearby;
    v4[24] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if (flags)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 24) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 21) = self->_isConnected;
    *(unsigned char *)(v5 + 24) |= 4u;
  }
  id v8 = [(GEOLogMsgStateDeviceIdentifier *)self->_pairedDeviceIdentifier copyWithZone:a3];
  v9 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v8;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v6 + 20) = self->_isConnectedAndNearby;
    *(unsigned char *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  [(GEOLogMsgStatePairedDevice *)self readAll:1];
  [v4 readAll:1];
  char flags = (char)self->_flags;
  char v6 = *((unsigned char *)v4 + 24);
  if (flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_20;
    }
    if (self->_isConnected)
    {
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_20;
      }
    }
    else if (*((unsigned char *)v4 + 21))
    {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_20;
  }
  pairedDeviceIdentifier = self->_pairedDeviceIdentifier;
  if ((unint64_t)pairedDeviceIdentifier | *((void *)v4 + 1))
  {
    if (!-[GEOLogMsgStateDeviceIdentifier isEqual:](pairedDeviceIdentifier, "isEqual:")) {
      goto LABEL_20;
    }
    char flags = (char)self->_flags;
    char v6 = *((unsigned char *)v4 + 24);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) != 0)
    {
      if (self->_isConnectedAndNearby)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_20;
        }
      }
      else if (*((unsigned char *)v4 + 20))
      {
        goto LABEL_20;
      }
      BOOL v8 = 1;
      goto LABEL_21;
    }
LABEL_20:
    BOOL v8 = 0;
  }
LABEL_21:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgStatePairedDevice *)self readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isConnected;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(GEOLogMsgStateDeviceIdentifier *)self->_pairedDeviceIdentifier hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_isConnectedAndNearby;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  uint64_t v4 = (BOOL *)v8;
  char v5 = *((unsigned char *)v8 + 24);
  if (v5)
  {
    self->_type = *((_DWORD *)v8 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v5 = *((unsigned char *)v8 + 24);
  }
  if ((v5 & 4) != 0)
  {
    self->_isConnected = *((unsigned char *)v8 + 21);
    *(unsigned char *)&self->_flags |= 4u;
  }
  pairedDeviceIdentifier = self->_pairedDeviceIdentifier;
  uint64_t v7 = *((void *)v8 + 1);
  if (pairedDeviceIdentifier)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOLogMsgStateDeviceIdentifier mergeFrom:](pairedDeviceIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[GEOLogMsgStatePairedDevice setPairedDeviceIdentifier:](self, "setPairedDeviceIdentifier:");
  }
  uint64_t v4 = (BOOL *)v8;
LABEL_11:
  if ((v4[24] & 2) != 0)
  {
    self->_isConnectedAndNearby = v4[20];
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
}

@end