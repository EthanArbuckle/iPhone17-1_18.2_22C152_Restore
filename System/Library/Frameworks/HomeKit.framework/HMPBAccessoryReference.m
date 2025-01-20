@interface HMPBAccessoryReference
+ (id)accessoryReferenceWithAccessory:(id)a3;
+ (id)accessoryReferenceWithData:(id)a3;
- (BOOL)hasHomeReference;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMPBHomeReference)homeReference;
- (NSData)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHomeReference:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBAccessoryReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_homeReference, 0);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSData)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setHomeReference:(id)a3
{
}

- (HMPBHomeReference)homeReference
{
  return self->_homeReference;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  homeReference = self->_homeReference;
  uint64_t v6 = v4[1];
  v7 = v4;
  if (homeReference)
  {
    if (!v6) {
      goto LABEL_7;
    }
    homeReference = (HMPBHomeReference *)-[HMPBHomeReference mergeFrom:](homeReference, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    homeReference = (HMPBHomeReference *)-[HMPBAccessoryReference setHomeReference:](self, "setHomeReference:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    homeReference = (HMPBHomeReference *)-[HMPBAccessoryReference setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v7;
  }

  MEMORY[0x1F41817F8](homeReference, v4);
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMPBHomeReference *)self->_homeReference hash];
  return [(NSData *)self->_uniqueIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((homeReference = self->_homeReference, !((unint64_t)homeReference | v4[1]))
     || -[HMPBHomeReference isEqual:](homeReference, "isEqual:")))
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
  id v6 = [(HMPBHomeReference *)self->_homeReference copyWithZone:a3];
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
  if (self->_homeReference)
  {
    objc_msgSend(v4, "setHomeReference:");
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
  if (self->_homeReference)
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
  return HMPBAccessoryReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  homeReference = self->_homeReference;
  if (homeReference)
  {
    id v5 = [(HMPBHomeReference *)homeReference dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"homeReference"];
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
  v8.super_class = (Class)HMPBAccessoryReference;
  id v4 = [(HMPBAccessoryReference *)&v8 description];
  id v5 = [(HMPBAccessoryReference *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasHomeReference
{
  return self->_homeReference != 0;
}

+ (id)accessoryReferenceWithAccessory:(id)a3
{
  id v3 = a3;
  id v4 = [v3 home];
  id v5 = +[HMPBHomeReference homeReferenceWithHome:v4];
  id v6 = objc_alloc_init(HMPBAccessoryReference);
  char v7 = [v3 uniqueIdentifier];

  objc_super v8 = objc_msgSend(v7, "hm_convertToData");
  [(HMPBAccessoryReference *)v6 setUniqueIdentifier:v8];

  [(HMPBAccessoryReference *)v6 setHomeReference:v5];

  return v6;
}

+ (id)accessoryReferenceWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HMPBAccessoryReference alloc] initWithData:v3];

  return v4;
}

@end