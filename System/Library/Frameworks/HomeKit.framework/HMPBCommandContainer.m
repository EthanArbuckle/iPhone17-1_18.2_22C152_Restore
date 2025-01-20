@interface HMPBCommandContainer
- (BOOL)hasAccessoryReference;
- (BOOL)hasClusterID;
- (BOOL)hasCommandFields;
- (BOOL)hasCommandID;
- (BOOL)hasEndpointID;
- (BOOL)hasExpectedValues;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMPBAccessoryReference)accessoryReference;
- (NSData)clusterID;
- (NSData)commandFields;
- (NSData)commandID;
- (NSData)endpointID;
- (NSData)expectedValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessoryReference:(id)a3;
- (void)setClusterID:(id)a3;
- (void)setCommandFields:(id)a3;
- (void)setCommandID:(id)a3;
- (void)setEndpointID:(id)a3;
- (void)setExpectedValues:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMPBCommandContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedValues, 0);
  objc_storeStrong((id *)&self->_endpointID, 0);
  objc_storeStrong((id *)&self->_commandID, 0);
  objc_storeStrong((id *)&self->_commandFields, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);

  objc_storeStrong((id *)&self->_accessoryReference, 0);
}

- (void)setAccessoryReference:(id)a3
{
}

- (HMPBAccessoryReference)accessoryReference
{
  return self->_accessoryReference;
}

- (void)setExpectedValues:(id)a3
{
}

- (NSData)expectedValues
{
  return self->_expectedValues;
}

- (void)setCommandFields:(id)a3
{
}

- (NSData)commandFields
{
  return self->_commandFields;
}

- (void)setClusterID:(id)a3
{
}

- (NSData)clusterID
{
  return self->_clusterID;
}

- (void)setEndpointID:(id)a3
{
}

- (NSData)endpointID
{
  return self->_endpointID;
}

- (void)setCommandID:(id)a3
{
}

- (NSData)commandID
{
  return self->_commandID;
}

- (void)mergeFrom:(id)a3
{
  v6 = a3;
  if (v6[4]) {
    -[HMPBCommandContainer setCommandID:](self, "setCommandID:");
  }
  if (v6[5]) {
    -[HMPBCommandContainer setEndpointID:](self, "setEndpointID:");
  }
  if (v6[2]) {
    -[HMPBCommandContainer setClusterID:](self, "setClusterID:");
  }
  if (v6[3]) {
    -[HMPBCommandContainer setCommandFields:](self, "setCommandFields:");
  }
  if (v6[6]) {
    -[HMPBCommandContainer setExpectedValues:](self, "setExpectedValues:");
  }
  accessoryReference = self->_accessoryReference;
  uint64_t v5 = v6[1];
  if (accessoryReference)
  {
    if (v5) {
      -[HMPBAccessoryReference mergeFrom:](accessoryReference, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[HMPBCommandContainer setAccessoryReference:](self, "setAccessoryReference:");
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_commandID hash];
  uint64_t v4 = [(NSData *)self->_endpointID hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_clusterID hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_commandFields hash];
  uint64_t v7 = [(NSData *)self->_expectedValues hash];
  return v6 ^ v7 ^ [(HMPBAccessoryReference *)self->_accessoryReference hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((commandID = self->_commandID, !((unint64_t)commandID | v4[4]))
     || -[NSData isEqual:](commandID, "isEqual:"))
    && ((endpointID = self->_endpointID, !((unint64_t)endpointID | v4[5]))
     || -[NSData isEqual:](endpointID, "isEqual:"))
    && ((clusterID = self->_clusterID, !((unint64_t)clusterID | v4[2]))
     || -[NSData isEqual:](clusterID, "isEqual:"))
    && ((commandFields = self->_commandFields, !((unint64_t)commandFields | v4[3]))
     || -[NSData isEqual:](commandFields, "isEqual:"))
    && ((expectedValues = self->_expectedValues, !((unint64_t)expectedValues | v4[6]))
     || -[NSData isEqual:](expectedValues, "isEqual:")))
  {
    accessoryReference = self->_accessoryReference;
    if ((unint64_t)accessoryReference | v4[1]) {
      char v11 = -[HMPBAccessoryReference isEqual:](accessoryReference, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_commandID copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSData *)self->_endpointID copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  uint64_t v10 = [(NSData *)self->_clusterID copyWithZone:a3];
  char v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSData *)self->_commandFields copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSData *)self->_expectedValues copyWithZone:a3];
  v15 = (void *)v5[6];
  v5[6] = v14;

  id v16 = [(HMPBAccessoryReference *)self->_accessoryReference copyWithZone:a3];
  v17 = (void *)v5[1];
  v5[1] = v16;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_commandID)
  {
    objc_msgSend(v4, "setCommandID:");
    id v4 = v5;
  }
  if (self->_endpointID)
  {
    objc_msgSend(v5, "setEndpointID:");
    id v4 = v5;
  }
  if (self->_clusterID)
  {
    objc_msgSend(v5, "setClusterID:");
    id v4 = v5;
  }
  if (self->_commandFields)
  {
    objc_msgSend(v5, "setCommandFields:");
    id v4 = v5;
  }
  if (self->_expectedValues)
  {
    objc_msgSend(v5, "setExpectedValues:");
    id v4 = v5;
  }
  if (self->_accessoryReference)
  {
    objc_msgSend(v5, "setAccessoryReference:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_commandID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_endpointID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_clusterID)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_commandFields)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_expectedValues)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_accessoryReference)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMPBCommandContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  commandID = self->_commandID;
  if (commandID) {
    [v3 setObject:commandID forKey:@"commandID"];
  }
  endpointID = self->_endpointID;
  if (endpointID) {
    [v4 setObject:endpointID forKey:@"endpointID"];
  }
  clusterID = self->_clusterID;
  if (clusterID) {
    [v4 setObject:clusterID forKey:@"clusterID"];
  }
  commandFields = self->_commandFields;
  if (commandFields) {
    [v4 setObject:commandFields forKey:@"commandFields"];
  }
  expectedValues = self->_expectedValues;
  if (expectedValues) {
    [v4 setObject:expectedValues forKey:@"expectedValues"];
  }
  accessoryReference = self->_accessoryReference;
  if (accessoryReference)
  {
    char v11 = [(HMPBAccessoryReference *)accessoryReference dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"accessoryReference"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMPBCommandContainer;
  id v4 = [(HMPBCommandContainer *)&v8 description];
  id v5 = [(HMPBCommandContainer *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAccessoryReference
{
  return self->_accessoryReference != 0;
}

- (BOOL)hasExpectedValues
{
  return self->_expectedValues != 0;
}

- (BOOL)hasCommandFields
{
  return self->_commandFields != 0;
}

- (BOOL)hasClusterID
{
  return self->_clusterID != 0;
}

- (BOOL)hasEndpointID
{
  return self->_endpointID != 0;
}

- (BOOL)hasCommandID
{
  return self->_commandID != 0;
}

@end