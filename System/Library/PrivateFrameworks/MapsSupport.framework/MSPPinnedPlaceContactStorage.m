@interface MSPPinnedPlaceContactStorage
- (BOOL)hasContactIdentifier;
- (BOOL)hasHandleValue;
- (BOOL)hasLabeledValueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contactIdentifier;
- (NSString)handleValue;
- (NSString)labeledValueIdentifier;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setHandleValue:(id)a3;
- (void)setLabeledValueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPPinnedPlaceContactStorage

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (BOOL)hasLabeledValueIdentifier
{
  return self->_labeledValueIdentifier != 0;
}

- (BOOL)hasHandleValue
{
  return self->_handleValue != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPPinnedPlaceContactStorage;
  v4 = [(MSPPinnedPlaceContactStorage *)&v8 description];
  v5 = [(MSPPinnedPlaceContactStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier) {
    [v3 setObject:contactIdentifier forKey:@"contactIdentifier"];
  }
  labeledValueIdentifier = self->_labeledValueIdentifier;
  if (labeledValueIdentifier) {
    [v4 setObject:labeledValueIdentifier forKey:@"labeledValueIdentifier"];
  }
  handleValue = self->_handleValue;
  if (handleValue) {
    [v4 setObject:handleValue forKey:@"handleValue"];
  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v9 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"Unknown Fields"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPinnedPlaceContactStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contactIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_labeledValueIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handleValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_contactIdentifier)
  {
    objc_msgSend(v4, "setContactIdentifier:");
    id v4 = v5;
  }
  if (self->_labeledValueIdentifier)
  {
    objc_msgSend(v5, "setLabeledValueIdentifier:");
    id v4 = v5;
  }
  if (self->_handleValue)
  {
    objc_msgSend(v5, "setHandleValue:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_contactIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_labeledValueIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_handleValue copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((contactIdentifier = self->_contactIdentifier, !((unint64_t)contactIdentifier | v4[2]))
     || -[NSString isEqual:](contactIdentifier, "isEqual:"))
    && ((labeledValueIdentifier = self->_labeledValueIdentifier, !((unint64_t)labeledValueIdentifier | v4[4]))
     || -[NSString isEqual:](labeledValueIdentifier, "isEqual:")))
  {
    handleValue = self->_handleValue;
    if ((unint64_t)handleValue | v4[3]) {
      char v8 = -[NSString isEqual:](handleValue, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_contactIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_labeledValueIdentifier hash] ^ v3;
  return v4 ^ [(NSString *)self->_handleValue hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[2]) {
    -[MSPPinnedPlaceContactStorage setContactIdentifier:](self, "setContactIdentifier:");
  }
  if (v4[4]) {
    -[MSPPinnedPlaceContactStorage setLabeledValueIdentifier:](self, "setLabeledValueIdentifier:");
  }
  if (v4[3]) {
    -[MSPPinnedPlaceContactStorage setHandleValue:](self, "setHandleValue:");
  }
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)labeledValueIdentifier
{
  return self->_labeledValueIdentifier;
}

- (void)setLabeledValueIdentifier:(id)a3
{
}

- (NSString)handleValue
{
  return self->_handleValue;
}

- (void)setHandleValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValueIdentifier, 0);
  objc_storeStrong((id *)&self->_handleValue, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end