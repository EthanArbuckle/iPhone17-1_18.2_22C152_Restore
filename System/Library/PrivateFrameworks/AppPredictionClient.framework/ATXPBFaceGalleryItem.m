@interface ATXPBFaceGalleryItem
- (BOOL)hasDescriptorIdentifier;
- (BOOL)hasExtensionBundleIdentifier;
- (BOOL)hasIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)descriptorIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDescriptorIdentifier:(id)a3;
- (void)setExtensionBundleIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBFaceGalleryItem

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasDescriptorIdentifier
{
  return self->_descriptorIdentifier != 0;
}

- (BOOL)hasExtensionBundleIdentifier
{
  return self->_extensionBundleIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBFaceGalleryItem;
  v4 = [(ATXPBFaceGalleryItem *)&v8 description];
  v5 = [(ATXPBFaceGalleryItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  descriptorIdentifier = self->_descriptorIdentifier;
  if (descriptorIdentifier) {
    [v4 setObject:descriptorIdentifier forKey:@"descriptorIdentifier"];
  }
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  if (extensionBundleIdentifier) {
    [v4 setObject:extensionBundleIdentifier forKey:@"extensionBundleIdentifier"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBFaceGalleryItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_descriptorIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_extensionBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_descriptorIdentifier)
  {
    objc_msgSend(v5, "setDescriptorIdentifier:");
    id v4 = v5;
  }
  if (self->_extensionBundleIdentifier)
  {
    objc_msgSend(v5, "setExtensionBundleIdentifier:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_descriptorIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_extensionBundleIdentifier copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[3]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((descriptorIdentifier = self->_descriptorIdentifier, !((unint64_t)descriptorIdentifier | v4[1]))
     || -[NSString isEqual:](descriptorIdentifier, "isEqual:")))
  {
    extensionBundleIdentifier = self->_extensionBundleIdentifier;
    if ((unint64_t)extensionBundleIdentifier | v4[2]) {
      char v8 = -[NSString isEqual:](extensionBundleIdentifier, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_descriptorIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_extensionBundleIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[ATXPBFaceGalleryItem setIdentifier:](self, "setIdentifier:");
  }
  if (v4[1]) {
    -[ATXPBFaceGalleryItem setDescriptorIdentifier:](self, "setDescriptorIdentifier:");
  }
  if (v4[2]) {
    -[ATXPBFaceGalleryItem setExtensionBundleIdentifier:](self, "setExtensionBundleIdentifier:");
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (void)setDescriptorIdentifier:(id)a3
{
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
}

@end