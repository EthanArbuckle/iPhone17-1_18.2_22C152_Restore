@interface MSPCollectionStorage
- (BOOL)hasCollectionDescription;
- (BOOL)hasImage;
- (BOOL)hasImageURL;
- (BOOL)hasItemData;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)image;
- (NSData)itemData;
- (NSString)collectionDescription;
- (NSString)imageURL;
- (NSString)title;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionDescription:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setItemData:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPCollectionStorage

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (BOOL)hasImageURL
{
  return self->_imageURL != 0;
}

- (BOOL)hasCollectionDescription
{
  return self->_collectionDescription != 0;
}

- (BOOL)hasItemData
{
  return self->_itemData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPCollectionStorage;
  v4 = [(MSPCollectionStorage *)&v8 description];
  v5 = [(MSPCollectionStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  image = self->_image;
  if (image) {
    [v4 setObject:image forKey:@"image"];
  }
  imageURL = self->_imageURL;
  if (imageURL) {
    [v4 setObject:imageURL forKey:@"imageURL"];
  }
  collectionDescription = self->_collectionDescription;
  if (collectionDescription) {
    [v4 setObject:collectionDescription forKey:@"collectionDescription"];
  }
  itemData = self->_itemData;
  if (itemData) {
    [v4 setObject:itemData forKey:@"itemData"];
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
  return MSPCollectionStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_image)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_imageURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_collectionDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_itemData)
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
  if (self->_title)
  {
    objc_msgSend(v4, "setTitle:");
    id v4 = v5;
  }
  if (self->_image)
  {
    objc_msgSend(v5, "setImage:");
    id v4 = v5;
  }
  if (self->_imageURL)
  {
    objc_msgSend(v5, "setImageURL:");
    id v4 = v5;
  }
  if (self->_collectionDescription)
  {
    objc_msgSend(v5, "setCollectionDescription:");
    id v4 = v5;
  }
  if (self->_itemData)
  {
    objc_msgSend(v5, "setItemData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSData *)self->_image copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_imageURL copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_collectionDescription copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  uint64_t v14 = [(NSData *)self->_itemData copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((title = self->_title, !((unint64_t)title | v4[6]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((image = self->_image, !((unint64_t)image | v4[3])) || -[NSData isEqual:](image, "isEqual:"))&& ((imageURL = self->_imageURL, !((unint64_t)imageURL | v4[4]))|| -[NSString isEqual:](imageURL, "isEqual:"))&& ((collectionDescription = self->_collectionDescription, !((unint64_t)collectionDescription | v4[2]))|| -[NSString isEqual:](collectionDescription, "isEqual:")))
  {
    itemData = self->_itemData;
    if ((unint64_t)itemData | v4[5]) {
      char v10 = -[NSData isEqual:](itemData, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_title hash];
  uint64_t v4 = [(NSData *)self->_image hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_imageURL hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_collectionDescription hash];
  return v6 ^ [(NSData *)self->_itemData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[6]) {
    -[MSPCollectionStorage setTitle:](self, "setTitle:");
  }
  if (v4[3]) {
    -[MSPCollectionStorage setImage:](self, "setImage:");
  }
  if (v4[4]) {
    -[MSPCollectionStorage setImageURL:](self, "setImageURL:");
  }
  if (v4[2]) {
    -[MSPCollectionStorage setCollectionDescription:](self, "setCollectionDescription:");
  }
  if (v4[5]) {
    -[MSPCollectionStorage setItemData:](self, "setItemData:");
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (NSString)collectionDescription
{
  return self->_collectionDescription;
}

- (void)setCollectionDescription:(id)a3
{
}

- (NSData)itemData
{
  return self->_itemData;
}

- (void)setItemData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_itemData, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_collectionDescription, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end