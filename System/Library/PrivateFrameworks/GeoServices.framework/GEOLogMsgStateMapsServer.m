@interface GEOLogMsgStateMapsServer
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasServerMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLogMsgStateMapsServer)initWithDictionary:(id)a3;
- (GEOLogMsgStateMapsServer)initWithJSON:(id)a3;
- (GEOMapsServerMetadata)serverMetadata;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setServerMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMapsServer

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

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMapsServer;
  v4 = [(GEOLogMsgStateMapsServer *)&v8 description];
  v5 = [(GEOLogMsgStateMapsServer *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapsServer _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 serverMetadata];
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
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapsServer _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateMapsServer)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapsServer *)-[GEOLogMsgStateMapsServer _initWithDictionary:isJSON:](self, a3, 0);
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
    }
  }

  return a1;
}

- (GEOLogMsgStateMapsServer)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapsServer *)-[GEOLogMsgStateMapsServer _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapsServerIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapsServerReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_serverMetadata) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return [(GEOMapsServerMetadata *)self->_serverMetadata hasGreenTeaWithValue:a3];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [(GEOLogMsgStateMapsServer *)self readAll:0];
  if (self->_serverMetadata) {
    objc_msgSend(v4, "setServerMetadata:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOMapsServerMetadata *)self->_serverMetadata copyWithZone:a3];
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
    [(GEOLogMsgStateMapsServer *)self readAll:1];
    [v4 readAll:1];
    serverMetadata = self->_serverMetadata;
    if ((unint64_t)serverMetadata | v4[1]) {
      char v5 = -[GEOMapsServerMetadata isEqual:](serverMetadata, "isEqual:");
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
  [(GEOLogMsgStateMapsServer *)self readAll:1];
  serverMetadata = self->_serverMetadata;

  return [(GEOMapsServerMetadata *)serverMetadata hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  [v4 readAll:0];
  serverMetadata = self->_serverMetadata;
  uint64_t v6 = v4[1];

  if (serverMetadata)
  {
    if (v6)
    {
      [(GEOMapsServerMetadata *)serverMetadata mergeFrom:v6];
    }
  }
  else if (v6)
  {
    [(GEOLogMsgStateMapsServer *)self setServerMetadata:v6];
  }
}

- (void).cxx_destruct
{
}

@end