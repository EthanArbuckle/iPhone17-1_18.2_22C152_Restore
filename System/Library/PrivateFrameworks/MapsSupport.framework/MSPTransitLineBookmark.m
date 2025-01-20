@interface MSPTransitLineBookmark
- (BOOL)hasTransitLineStorage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MSPTransitStorageLine)transitLineStorage;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTransitLineStorage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitLineBookmark

- (BOOL)hasTransitLineStorage
{
  return self->_transitLineStorage != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitLineBookmark;
  v4 = [(MSPTransitLineBookmark *)&v8 description];
  v5 = [(MSPTransitLineBookmark *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  transitLineStorage = self->_transitLineStorage;
  if (transitLineStorage)
  {
    v5 = [(MSPTransitStorageLine *)transitLineStorage dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"transitLineStorage"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v7 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitLineBookmarkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_transitLineStorage)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  transitLineStorage = self->_transitLineStorage;
  if (transitLineStorage) {
    [a3 setTransitLineStorage:transitLineStorage];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MSPTransitStorageLine *)self->_transitLineStorage copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    transitLineStorage = self->_transitLineStorage;
    if ((unint64_t)transitLineStorage | v4[2]) {
      char v6 = -[MSPTransitStorageLine isEqual:](transitLineStorage, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(MSPTransitStorageLine *)self->_transitLineStorage hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  transitLineStorage = self->_transitLineStorage;
  uint64_t v6 = v4[2];
  if (transitLineStorage)
  {
    if (v6) {
      -[MSPTransitStorageLine mergeFrom:](transitLineStorage, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[MSPTransitLineBookmark setTransitLineStorage:](self, "setTransitLineStorage:");
  }

  MEMORY[0x1F41817F8]();
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (MSPTransitStorageLine)transitLineStorage
{
  return self->_transitLineStorage;
}

- (void)setTransitLineStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitLineStorage, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end