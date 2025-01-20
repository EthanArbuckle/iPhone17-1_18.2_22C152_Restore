@interface HMPBCharacteristicReference
+ (id)characteristicReferenceWithCharacteristic:(id)a3;
+ (id)characteristicReferenceWithData:(id)a3;
- (BOOL)hasServiceReference;
- (BOOL)hasUniqueIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMPBServiceReference)serviceReference;
- (NSData)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setServiceReference:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBCharacteristicReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_serviceReference, 0);
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSData)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setServiceReference:(id)a3
{
}

- (HMPBServiceReference)serviceReference
{
  return self->_serviceReference;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  serviceReference = self->_serviceReference;
  uint64_t v6 = v4[1];
  v7 = v4;
  if (serviceReference)
  {
    if (!v6) {
      goto LABEL_7;
    }
    serviceReference = (HMPBServiceReference *)-[HMPBServiceReference mergeFrom:](serviceReference, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    serviceReference = (HMPBServiceReference *)-[HMPBCharacteristicReference setServiceReference:](self, "setServiceReference:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    serviceReference = (HMPBServiceReference *)-[HMPBCharacteristicReference setUniqueIdentifier:](self, "setUniqueIdentifier:");
    v4 = v7;
  }

  MEMORY[0x1F41817F8](serviceReference, v4);
}

- (unint64_t)hash
{
  unint64_t v3 = [(HMPBServiceReference *)self->_serviceReference hash];
  return [(NSData *)self->_uniqueIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((serviceReference = self->_serviceReference, !((unint64_t)serviceReference | v4[1]))
     || -[HMPBServiceReference isEqual:](serviceReference, "isEqual:")))
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
  id v6 = [(HMPBServiceReference *)self->_serviceReference copyWithZone:a3];
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
  if (self->_serviceReference)
  {
    objc_msgSend(v4, "setServiceReference:");
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
  if (self->_serviceReference)
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
  return HMPBCharacteristicReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  serviceReference = self->_serviceReference;
  if (serviceReference)
  {
    id v5 = [(HMPBServiceReference *)serviceReference dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"serviceReference"];
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
  v8.super_class = (Class)HMPBCharacteristicReference;
  id v4 = [(HMPBCharacteristicReference *)&v8 description];
  id v5 = [(HMPBCharacteristicReference *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasServiceReference
{
  return self->_serviceReference != 0;
}

+ (id)characteristicReferenceWithCharacteristic:(id)a3
{
  id v3 = a3;
  id v4 = [v3 service];
  id v5 = +[HMPBServiceReference serviceReferenceWithService:v4];
  id v6 = objc_alloc_init(HMPBCharacteristicReference);
  char v7 = [v3 uniqueIdentifier];

  objc_super v8 = objc_msgSend(v7, "hm_convertToData");
  [(HMPBCharacteristicReference *)v6 setUniqueIdentifier:v8];

  [(HMPBCharacteristicReference *)v6 setServiceReference:v5];

  return v6;
}

+ (id)characteristicReferenceWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[HMPBCharacteristicReference alloc] initWithData:v3];

  return v4;
}

@end