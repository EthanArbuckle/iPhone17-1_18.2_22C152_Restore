@interface HMPBServiceReference
+ (HMPBServiceReference)serviceReferenceWithData:(id)a3;
+ (HMPBServiceReference)serviceReferenceWithService:(id)a3;
- (BOOL)hasAccessoryReference;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMPBAccessoryReference)accessoryReference;
- (NSData)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryReference:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBServiceReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_accessoryReference, 0);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSData)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setAccessoryReference:(id)a3
{
}

- (HMPBAccessoryReference)accessoryReference
{
  return self->_accessoryReference;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  accessoryReference = self->_accessoryReference;
  uint64_t v6 = v4[1];
  v7 = v4;
  if (accessoryReference)
  {
    if (!v6) {
      goto LABEL_7;
    }
    accessoryReference = (HMPBAccessoryReference *)-[HMPBAccessoryReference mergeFrom:](accessoryReference, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    accessoryReference = (HMPBAccessoryReference *)-[HMPBServiceReference setAccessoryReference:](self, "setAccessoryReference:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    accessoryReference = (HMPBAccessoryReference *)-[HMPBServiceReference setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v7;
  }

  MEMORY[0x1F41817F8](accessoryReference, v4);
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMPBAccessoryReference *)self->_accessoryReference hash];
  return [(NSData *)self->_uniqueIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((accessoryReference = self->_accessoryReference, !((unint64_t)accessoryReference | v4[1]))
     || -[HMPBAccessoryReference isEqual:](accessoryReference, "isEqual:")))
  {
    uniqueIdentifier = self->_uniqueIdentifier;
    if ((unint64_t)uniqueIdentifier | v4[2]) {
      char v7 = -[NSData isEqual:](uniqueIdentifier, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HMPBAccessoryReference *)self->_accessoryReference copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_uniqueIdentifier copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accessoryReference)
  {
    objc_msgSend(v4, "setAccessoryReference:");
    id v4 = v5;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v5, "setUniqueIdentifier:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accessoryReference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_uniqueIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMPBServiceReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  accessoryReference = self->_accessoryReference;
  if (accessoryReference)
  {
    id v5 = [(HMPBAccessoryReference *)accessoryReference dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"accessoryReference"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBServiceReference;
  id v4 = [(HMPBServiceReference *)&v8 description];
  id v5 = [(HMPBServiceReference *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasAccessoryReference
{
  return self->_accessoryReference != 0;
}

+ (HMPBServiceReference)serviceReferenceWithService:(id)a3
{
  id v3 = a3;
  id v4 = [v3 accessory];
  id v5 = +[HMPBAccessoryReference accessoryReferenceWithAccessory:v4];
  id v6 = objc_alloc_init(HMPBServiceReference);
  char v7 = [v3 uniqueIdentifier];

  objc_super v8 = objc_msgSend(v7, "hm_convertToData");
  [(HMPBServiceReference *)v6 setUniqueIdentifier:v8];

  [(HMPBServiceReference *)v6 setAccessoryReference:v5];

  return v6;
}

+ (HMPBServiceReference)serviceReferenceWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HMPBServiceReference alloc] initWithData:v3];

  return v4;
}

@end