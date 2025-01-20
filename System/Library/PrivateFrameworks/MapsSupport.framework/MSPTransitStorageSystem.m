@interface MSPTransitStorageSystem
- (BOOL)hasArtwork;
- (BOOL)hasMuid;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitArtworkDataSource)artwork;
- (MSPTransitStorageSystem)initWithSystem:(id)a3;
- (NSString)description;
- (NSString)name;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setHasMuid:(BOOL)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitStorageSystem

- (MSPTransitStorageSystem)initWithSystem:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSPTransitStorageSystem;
  v5 = [(MSPTransitStorageSystem *)&v13 init];
  if (v5)
  {
    -[MSPTransitStorageSystem setMuid:](v5, "setMuid:", [v4 muid]);
    v6 = [v4 name];
    [(MSPTransitStorageSystem *)v5 setName:v6];

    v7 = [v4 artwork];

    if (v7)
    {
      v8 = [MSPTransitStorageArtwork alloc];
      v9 = [v4 artwork];
      v10 = [(MSPTransitStorageArtwork *)v8 initWithArtwork:v9];
      [(MSPTransitStorageSystem *)v5 setArtwork:v10];
    }
    v11 = v5;
  }

  return v5;
}

- (void)setMuid:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMuid
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageSystem;
  id v4 = [(MSPTransitStorageSystem *)&v8 description];
  v5 = [(MSPTransitStorageSystem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_muid];
    [v3 setObject:v4 forKey:@"muid"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  artwork = self->_artwork;
  if (artwork)
  {
    v7 = [(MSPTransitStorageArtwork *)artwork dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"artwork"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v9 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageSystemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_artwork)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_muid;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v5;
  }
  if (self->_artwork)
  {
    objc_msgSend(v5, "setArtwork:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 16) = self->_muid;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_name copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  id v9 = [(MSPTransitStorageArtwork *)self->_artwork copyWithZone:a3];
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_muid != *((void *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4) && !-[NSString isEqual:](name, "isEqual:")) {
    goto LABEL_11;
  }
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((void *)v4 + 3)) {
    char v7 = -[MSPTransitStorageArtwork isEqual:](artwork, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_muid;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  return v4 ^ [(MSPTransitStorageArtwork *)self->_artwork hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4;
  if (v4[5])
  {
    self->_muid = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  objc_super v8 = v4;
  if (v4[4])
  {
    -[MSPTransitStorageSystem setName:](self, "setName:");
    uint64_t v5 = v8;
  }
  artwork = self->_artwork;
  uint64_t v7 = v5[3];
  if (artwork)
  {
    if (v7) {
      -[MSPTransitStorageArtwork mergeFrom:](artwork, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[MSPTransitStorageSystem setArtwork:](self, "setArtwork:");
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end