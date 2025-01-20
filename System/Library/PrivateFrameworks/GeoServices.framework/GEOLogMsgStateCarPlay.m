@interface GEOLogMsgStateCarPlay
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCarInfo;
- (BOOL)hasIsConnected;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCarInfo)carInfo;
- (GEOLogMsgStateCarPlay)initWithDictionary:(id)a3;
- (GEOLogMsgStateCarPlay)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(unsigned __int8 *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCarInfo:(id)a3;
- (void)setHasIsConnected:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateCarPlay

- (void).cxx_destruct
{
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setCarInfo:(id)a3
{
}

- (void)setIsConnected:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_isConnected = a3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_carInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)setHasIsConnected:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsConnected
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)hasCarInfo
{
  return self->_carInfo != 0;
}

- (GEOCarInfo)carInfo
{
  return self->_carInfo;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateCarPlay;
  id v4 = [(GEOLogMsgStateCarPlay *)&v8 description];
  id v5 = [(GEOLogMsgStateCarPlay *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateCarPlay _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (a1[20])
    {
      id v5 = [NSNumber numberWithBool:a1[16]];
      if (a2) {
        v6 = @"isConnected";
      }
      else {
        v6 = @"is_connected";
      }
      [v4 setObject:v5 forKey:v6];
    }
    v7 = [a1 carInfo];
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"carInfo";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"car_info";
      }
      [v4 setObject:v9 forKey:v10];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateCarPlay _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateCarPlay)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateCarPlay *)-[GEOLogMsgStateCarPlay _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"isConnected";
      }
      else {
        v6 = @"is_connected";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsConnected:", objc_msgSend(v7, "BOOLValue"));
      }

      if (a3) {
        objc_super v8 = @"carInfo";
      }
      else {
        objc_super v8 = @"car_info";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = [GEOCarInfo alloc];
        if (a3) {
          uint64_t v11 = [(GEOCarInfo *)v10 initWithJSON:v9];
        }
        else {
          uint64_t v11 = [(GEOCarInfo *)v10 initWithDictionary:v9];
        }
        v12 = (void *)v11;
        [a1 setCarInfo:v11];
      }
    }
  }

  return a1;
}

- (GEOLogMsgStateCarPlay)initWithJSON:(id)a3
{
  return (GEOLogMsgStateCarPlay *)-[GEOLogMsgStateCarPlay _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateCarPlayIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateCarPlayReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOLogMsgStateCarPlay *)self readAll:0];
  id v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    v5[16] = self->_isConnected;
    v5[20] |= 1u;
  }
  if (self->_carInfo)
  {
    objc_msgSend(v5, "setCarInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 16) = self->_isConnected;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(GEOCarInfo *)self->_carInfo copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  [(GEOLogMsgStateCarPlay *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_isConnected)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    char v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  carInfo = self->_carInfo;
  if ((unint64_t)carInfo | *((void *)v4 + 1)) {
    char v5 = -[GEOCarInfo isEqual:](carInfo, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateCarPlay *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_isConnected;
  }
  else {
    uint64_t v3 = 0;
  }
  return [(GEOCarInfo *)self->_carInfo hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v7 = (BOOL *)a3;
  [v7 readAll:0];
  id v4 = v7;
  if (v7[20])
  {
    self->_isConnected = v7[16];
    *(unsigned char *)&self->_flags |= 1u;
  }
  carInfo = self->_carInfo;
  uint64_t v6 = *((void *)v7 + 1);
  if (carInfo)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOCarInfo mergeFrom:](carInfo, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[GEOLogMsgStateCarPlay setCarInfo:](self, "setCarInfo:");
  }
  id v4 = v7;
LABEL_9:
}

@end