@interface HMPBCharacteristicWriteAction
- (BOOL)hasActionUUID;
- (BOOL)hasCharacteristicReference;
- (BOOL)hasTargetValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMPBCharacteristicReference)characteristicReference;
- (NSData)actionUUID;
- (NSData)targetValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionUUID:(id)a3;
- (void)setCharacteristicReference:(id)a3;
- (void)setTargetValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBCharacteristicWriteAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_characteristicReference, 0);

  objc_storeStrong((id *)&self->_actionUUID, 0);
}

- (void)setCharacteristicReference:(id)a3
{
}

- (HMPBCharacteristicReference)characteristicReference
{
  return self->_characteristicReference;
}

- (void)setTargetValue:(id)a3
{
}

- (NSData)targetValue
{
  return self->_targetValue;
}

- (void)setActionUUID:(id)a3
{
}

- (NSData)actionUUID
{
  return self->_actionUUID;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[HMPBCharacteristicWriteAction setActionUUID:](self, "setActionUUID:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[HMPBCharacteristicWriteAction setTargetValue:](self, "setTargetValue:");
    v4 = v7;
  }
  characteristicReference = self->_characteristicReference;
  uint64_t v6 = v4[2];
  if (characteristicReference)
  {
    if (!v6) {
      goto LABEL_11;
    }
    characteristicReference = (HMPBCharacteristicReference *)-[HMPBCharacteristicReference mergeFrom:](characteristicReference, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    characteristicReference = (HMPBCharacteristicReference *)-[HMPBCharacteristicWriteAction setCharacteristicReference:](self, "setCharacteristicReference:");
  }
  v4 = v7;
LABEL_11:

  MEMORY[0x1F41817F8](characteristicReference, v4);
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_actionUUID hash];
  uint64_t v4 = [(NSData *)self->_targetValue hash] ^ v3;
  return v4 ^ [(HMPBCharacteristicReference *)self->_characteristicReference hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((actionUUID = self->_actionUUID, !((unint64_t)actionUUID | v4[1]))
     || -[NSData isEqual:](actionUUID, "isEqual:"))
    && ((targetValue = self->_targetValue, !((unint64_t)targetValue | v4[3]))
     || -[NSData isEqual:](targetValue, "isEqual:")))
  {
    characteristicReference = self->_characteristicReference;
    if ((unint64_t)characteristicReference | v4[2]) {
      char v8 = -[HMPBCharacteristicReference isEqual:](characteristicReference, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_actionUUID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_targetValue copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(HMPBCharacteristicReference *)self->_characteristicReference copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_actionUUID)
  {
    objc_msgSend(v4, "setActionUUID:");
    id v4 = v5;
  }
  if (self->_targetValue)
  {
    objc_msgSend(v5, "setTargetValue:");
    id v4 = v5;
  }
  if (self->_characteristicReference)
  {
    objc_msgSend(v5, "setCharacteristicReference:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_actionUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_targetValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_characteristicReference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMPBCharacteristicWriteActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  actionUUID = self->_actionUUID;
  if (actionUUID) {
    [v3 setObject:actionUUID forKey:@"actionUUID"];
  }
  targetValue = self->_targetValue;
  if (targetValue) {
    [v4 setObject:targetValue forKey:@"targetValue"];
  }
  characteristicReference = self->_characteristicReference;
  if (characteristicReference)
  {
    uint64_t v8 = [(HMPBCharacteristicReference *)characteristicReference dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"characteristicReference"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBCharacteristicWriteAction;
  id v4 = [(HMPBCharacteristicWriteAction *)&v8 description];
  id v5 = [(HMPBCharacteristicWriteAction *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCharacteristicReference
{
  return self->_characteristicReference != 0;
}

- (BOOL)hasTargetValue
{
  return self->_targetValue != 0;
}

- (BOOL)hasActionUUID
{
  return self->_actionUUID != 0;
}

@end