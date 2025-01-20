@interface MSPCollectionItemStorage
- (BOOL)hasContents;
- (BOOL)hasContentsTimestamp;
- (BOOL)hasPosition;
- (BOOL)hasPositionTimestamp;
- (BOOL)hasStorageIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)contents;
- (NSData)contentsTimestamp;
- (NSData)position;
- (NSData)positionTimestamp;
- (NSData)storageIdentifier;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContents:(id)a3;
- (void)setContentsTimestamp:(id)a3;
- (void)setPosition:(id)a3;
- (void)setPositionTimestamp:(id)a3;
- (void)setStorageIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPCollectionItemStorage

- (BOOL)hasStorageIdentifier
{
  return self->_storageIdentifier != 0;
}

- (BOOL)hasContents
{
  return self->_contents != 0;
}

- (BOOL)hasContentsTimestamp
{
  return self->_contentsTimestamp != 0;
}

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (BOOL)hasPositionTimestamp
{
  return self->_positionTimestamp != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPCollectionItemStorage;
  v4 = [(MSPCollectionItemStorage *)&v8 description];
  v5 = [(MSPCollectionItemStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  storageIdentifier = self->_storageIdentifier;
  if (storageIdentifier) {
    [v3 setObject:storageIdentifier forKey:@"storageIdentifier"];
  }
  contents = self->_contents;
  if (contents) {
    [v4 setObject:contents forKey:@"contents"];
  }
  contentsTimestamp = self->_contentsTimestamp;
  if (contentsTimestamp) {
    [v4 setObject:contentsTimestamp forKey:@"contentsTimestamp"];
  }
  position = self->_position;
  if (position) {
    [v4 setObject:position forKey:@"position"];
  }
  positionTimestamp = self->_positionTimestamp;
  if (positionTimestamp) {
    [v4 setObject:positionTimestamp forKey:@"positionTimestamp"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v11 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPCollectionItemStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_storageIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_contents)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_contentsTimestamp)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_position)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_positionTimestamp)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_storageIdentifier)
  {
    objc_msgSend(v4, "setStorageIdentifier:");
    id v4 = v5;
  }
  if (self->_contents)
  {
    objc_msgSend(v5, "setContents:");
    id v4 = v5;
  }
  if (self->_contentsTimestamp)
  {
    objc_msgSend(v5, "setContentsTimestamp:");
    id v4 = v5;
  }
  if (self->_position)
  {
    objc_msgSend(v5, "setPosition:");
    id v4 = v5;
  }
  if (self->_positionTimestamp)
  {
    objc_msgSend(v5, "setPositionTimestamp:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_storageIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSData *)self->_contents copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSData *)self->_contentsTimestamp copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  uint64_t v12 = [(NSData *)self->_position copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  uint64_t v14 = [(NSData *)self->_positionTimestamp copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((storageIdentifier = self->_storageIdentifier, !((unint64_t)storageIdentifier | v4[6]))
     || -[NSData isEqual:](storageIdentifier, "isEqual:"))
    && ((contents = self->_contents, !((unint64_t)contents | v4[2]))
     || -[NSData isEqual:](contents, "isEqual:"))
    && ((contentsTimestamp = self->_contentsTimestamp, !((unint64_t)contentsTimestamp | v4[3]))
     || -[NSData isEqual:](contentsTimestamp, "isEqual:"))
    && ((position = self->_position, !((unint64_t)position | v4[4]))
     || -[NSData isEqual:](position, "isEqual:")))
  {
    positionTimestamp = self->_positionTimestamp;
    if ((unint64_t)positionTimestamp | v4[5]) {
      char v10 = -[NSData isEqual:](positionTimestamp, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_storageIdentifier hash];
  uint64_t v4 = [(NSData *)self->_contents hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_contentsTimestamp hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_position hash];
  return v6 ^ [(NSData *)self->_positionTimestamp hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[6]) {
    -[MSPCollectionItemStorage setStorageIdentifier:](self, "setStorageIdentifier:");
  }
  if (v4[2]) {
    -[MSPCollectionItemStorage setContents:](self, "setContents:");
  }
  if (v4[3]) {
    -[MSPCollectionItemStorage setContentsTimestamp:](self, "setContentsTimestamp:");
  }
  if (v4[4]) {
    -[MSPCollectionItemStorage setPosition:](self, "setPosition:");
  }
  if (v4[5]) {
    -[MSPCollectionItemStorage setPositionTimestamp:](self, "setPositionTimestamp:");
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSData)storageIdentifier
{
  return self->_storageIdentifier;
}

- (void)setStorageIdentifier:(id)a3
{
}

- (NSData)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (NSData)contentsTimestamp
{
  return self->_contentsTimestamp;
}

- (void)setContentsTimestamp:(id)a3
{
}

- (NSData)position
{
  return self->_position;
}

- (void)setPosition:(id)a3
{
}

- (NSData)positionTimestamp
{
  return self->_positionTimestamp;
}

- (void)setPositionTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageIdentifier, 0);
  objc_storeStrong((id *)&self->_positionTimestamp, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_contentsTimestamp, 0);
  objc_storeStrong((id *)&self->_contents, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end