@interface HKCodableColorRepresentation
- (BOOL)hasDisplayCategoryIdentifier;
- (BOOL)hasObjectTypeIdentifier;
- (BOOL)hasRgbConfiguration;
- (BOOL)hasSemanticColorName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HKCodableRGBConfiguration)rgbConfiguration;
- (NSString)objectTypeIdentifier;
- (NSString)semanticColorName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)displayCategoryIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDisplayCategoryIdentifier:(int64_t)a3;
- (void)setHasDisplayCategoryIdentifier:(BOOL)a3;
- (void)setObjectTypeIdentifier:(id)a3;
- (void)setRgbConfiguration:(id)a3;
- (void)setSemanticColorName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableColorRepresentation

- (BOOL)hasObjectTypeIdentifier
{
  return self->_objectTypeIdentifier != 0;
}

- (void)setDisplayCategoryIdentifier:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_displayCategoryIdentifier = a3;
}

- (void)setHasDisplayCategoryIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisplayCategoryIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSemanticColorName
{
  return self->_semanticColorName != 0;
}

- (BOOL)hasRgbConfiguration
{
  return self->_rgbConfiguration != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableColorRepresentation;
  v4 = [(HKCodableColorRepresentation *)&v8 description];
  v5 = [(HKCodableColorRepresentation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if (objectTypeIdentifier) {
    [v3 setObject:objectTypeIdentifier forKey:@"objectTypeIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_displayCategoryIdentifier];
    [v4 setObject:v6 forKey:@"displayCategoryIdentifier"];
  }
  semanticColorName = self->_semanticColorName;
  if (semanticColorName) {
    [v4 setObject:semanticColorName forKey:@"semanticColorName"];
  }
  rgbConfiguration = self->_rgbConfiguration;
  if (rgbConfiguration)
  {
    v9 = [(HKCodableRGBConfiguration *)rgbConfiguration dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"rgbConfiguration"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableColorRepresentationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_semanticColorName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_rgbConfiguration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_objectTypeIdentifier)
  {
    objc_msgSend(v4, "setObjectTypeIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_displayCategoryIdentifier;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_semanticColorName)
  {
    objc_msgSend(v5, "setSemanticColorName:");
    id v4 = v5;
  }
  if (self->_rgbConfiguration)
  {
    objc_msgSend(v5, "setRgbConfiguration:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_objectTypeIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_displayCategoryIdentifier;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_semanticColorName copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(HKCodableRGBConfiguration *)self->_rgbConfiguration copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  objectTypeIdentifier = self->_objectTypeIdentifier;
  if ((unint64_t)objectTypeIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](objectTypeIdentifier, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_displayCategoryIdentifier != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  semanticColorName = self->_semanticColorName;
  if ((unint64_t)semanticColorName | *((void *)v4 + 4)
    && !-[NSString isEqual:](semanticColorName, "isEqual:"))
  {
    goto LABEL_13;
  }
  rgbConfiguration = self->_rgbConfiguration;
  if ((unint64_t)rgbConfiguration | *((void *)v4 + 3)) {
    char v8 = -[HKCodableRGBConfiguration isEqual:](rgbConfiguration, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_objectTypeIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_displayCategoryIdentifier;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_semanticColorName hash];
  return v5 ^ v6 ^ [(HKCodableRGBConfiguration *)self->_rgbConfiguration hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HKCodableColorRepresentation setObjectTypeIdentifier:](self, "setObjectTypeIdentifier:");
    uint64_t v4 = v7;
  }
  if (v4[5])
  {
    self->_displayCategoryIdentifier = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (v4[4])
  {
    -[HKCodableColorRepresentation setSemanticColorName:](self, "setSemanticColorName:");
    uint64_t v4 = v7;
  }
  rgbConfiguration = self->_rgbConfiguration;
  uint64_t v6 = v4[3];
  if (rgbConfiguration)
  {
    if (!v6) {
      goto LABEL_13;
    }
    rgbConfiguration = (HKCodableRGBConfiguration *)-[HKCodableRGBConfiguration mergeFrom:](rgbConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    rgbConfiguration = (HKCodableRGBConfiguration *)-[HKCodableColorRepresentation setRgbConfiguration:](self, "setRgbConfiguration:");
  }
  uint64_t v4 = v7;
LABEL_13:
  MEMORY[0x1F41817F8](rgbConfiguration, v4);
}

- (NSString)objectTypeIdentifier
{
  return self->_objectTypeIdentifier;
}

- (void)setObjectTypeIdentifier:(id)a3
{
}

- (int64_t)displayCategoryIdentifier
{
  return self->_displayCategoryIdentifier;
}

- (NSString)semanticColorName
{
  return self->_semanticColorName;
}

- (void)setSemanticColorName:(id)a3
{
}

- (HKCodableRGBConfiguration)rgbConfiguration
{
  return self->_rgbConfiguration;
}

- (void)setRgbConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticColorName, 0);
  objc_storeStrong((id *)&self->_rgbConfiguration, 0);
  objc_storeStrong((id *)&self->_objectTypeIdentifier, 0);
}

@end