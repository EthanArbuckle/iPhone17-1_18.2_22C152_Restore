@interface IDSProtoKeyTransparencyTrustedService
+ (Class)urisType;
- (BOOL)hasDeviceSignature;
- (BOOL)hasKeyIndex;
- (BOOL)hasKtLoggableData;
- (BOOL)hasServiceIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSProtoKeyTransparencyLoggableData)ktLoggableData;
- (NSData)deviceSignature;
- (NSMutableArray)uris;
- (NSString)serviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyIndexAsString:(int)a3;
- (id)urisAtIndex:(unint64_t)a3;
- (int)StringAsKeyIndex:(id)a3;
- (int)keyIndex;
- (unint64_t)hash;
- (unint64_t)urisCount;
- (void)addUris:(id)a3;
- (void)clearUris;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceSignature:(id)a3;
- (void)setHasKeyIndex:(BOOL)a3;
- (void)setKeyIndex:(int)a3;
- (void)setKtLoggableData:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setUris:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoKeyTransparencyTrustedService

- (BOOL)hasServiceIdentifier
{
  return self->_serviceIdentifier != 0;
}

- (void)clearUris
{
}

- (void)addUris:(id)a3
{
  id v4 = a3;
  uris = self->_uris;
  id v8 = v4;
  if (!uris)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_uris;
    self->_uris = v6;

    id v4 = v8;
    uris = self->_uris;
  }
  [(NSMutableArray *)uris addObject:v4];
}

- (unint64_t)urisCount
{
  return (unint64_t)[(NSMutableArray *)self->_uris count];
}

- (id)urisAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_uris objectAtIndex:a3];
}

+ (Class)urisType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasKtLoggableData
{
  return self->_ktLoggableData != 0;
}

- (BOOL)hasDeviceSignature
{
  return self->_deviceSignature != 0;
}

- (int)keyIndex
{
  if (*(unsigned char *)&self->_has) {
    return self->_keyIndex;
  }
  else {
    return 0;
  }
}

- (void)setKeyIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_keyIndex = a3;
}

- (void)setHasKeyIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeyIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)keyIndexAsString:(int)a3
{
  if (a3 >= 4)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1009889E0 + a3);
  }

  return v3;
}

- (int)StringAsKeyIndex:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"iMessage"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FaceTime"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Multiplex"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IDSProtoKeyTransparencyTrustedService;
  id v3 = [(IDSProtoKeyTransparencyTrustedService *)&v7 description];
  int v4 = [(IDSProtoKeyTransparencyTrustedService *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier) {
    [v3 setObject:serviceIdentifier forKey:@"service_identifier"];
  }
  uris = self->_uris;
  if (uris) {
    [v4 setObject:uris forKey:@"uris"];
  }
  ktLoggableData = self->_ktLoggableData;
  if (ktLoggableData)
  {
    id v8 = [(IDSProtoKeyTransparencyLoggableData *)ktLoggableData dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"kt_loggable_data"];
  }
  deviceSignature = self->_deviceSignature;
  if (deviceSignature) {
    [v4 setObject:deviceSignature forKey:@"device_signature"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t keyIndex = self->_keyIndex;
    if (keyIndex >= 4)
    {
      v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_keyIndex];
    }
    else
    {
      v11 = *(&off_1009889E0 + keyIndex);
    }
    [v4 setObject:v11 forKey:@"key_index"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoKeyTransparencyTrustedServiceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_serviceIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_uris;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_ktLoggableData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deviceSignature) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_serviceIdentifier) {
    objc_msgSend(v9, "setServiceIdentifier:");
  }
  if ([(IDSProtoKeyTransparencyTrustedService *)self urisCount])
  {
    [v9 clearUris];
    unint64_t v4 = [(IDSProtoKeyTransparencyTrustedService *)self urisCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(IDSProtoKeyTransparencyTrustedService *)self urisAtIndex:i];
        [v9 addUris:v7];
      }
    }
  }
  if (self->_ktLoggableData) {
    objc_msgSend(v9, "setKtLoggableData:");
  }
  uint64_t v8 = v9;
  if (self->_deviceSignature)
  {
    objc_msgSend(v9, "setDeviceSignature:");
    uint64_t v8 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[4] = self->_keyIndex;
    *((unsigned char *)v8 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_serviceIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_uris;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v12), "copyWithZone:", a3, (void)v19);
        [v5 addUris:v13];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v14 = [(IDSProtoKeyTransparencyLoggableData *)self->_ktLoggableData copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  id v16 = [(NSData *)self->_deviceSignature copyWithZone:a3];
  v17 = (void *)v5[1];
  v5[1] = v16;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_keyIndex;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  serviceIdentifier = self->_serviceIdentifier;
  if ((unint64_t)serviceIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](serviceIdentifier, "isEqual:")) {
      goto LABEL_14;
    }
  }
  uris = self->_uris;
  if ((unint64_t)uris | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](uris, "isEqual:")) {
      goto LABEL_14;
    }
  }
  ktLoggableData = self->_ktLoggableData;
  if ((unint64_t)ktLoggableData | *((void *)v4 + 3))
  {
    if (!-[IDSProtoKeyTransparencyLoggableData isEqual:](ktLoggableData, "isEqual:")) {
      goto LABEL_14;
    }
  }
  deviceSignature = self->_deviceSignature;
  if ((unint64_t)deviceSignature | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](deviceSignature, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_keyIndex == *((_DWORD *)v4 + 4))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_serviceIdentifier hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_uris hash];
  unint64_t v5 = [(IDSProtoKeyTransparencyLoggableData *)self->_ktLoggableData hash];
  unint64_t v6 = (unint64_t)[(NSData *)self->_deviceSignature hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_keyIndex;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[IDSProtoKeyTransparencyTrustedService setServiceIdentifier:](self, "setServiceIdentifier:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 5);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[IDSProtoKeyTransparencyTrustedService addUris:](self, "addUris:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  ktLoggableData = self->_ktLoggableData;
  uint64_t v11 = *((void *)v4 + 3);
  if (ktLoggableData)
  {
    if (v11) {
      -[IDSProtoKeyTransparencyLoggableData mergeFrom:](ktLoggableData, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[IDSProtoKeyTransparencyTrustedService setKtLoggableData:](self, "setKtLoggableData:");
  }
  if (*((void *)v4 + 1)) {
    -[IDSProtoKeyTransparencyTrustedService setDeviceSignature:](self, "setDeviceSignature:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_uint64_t keyIndex = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSMutableArray)uris
{
  return self->_uris;
}

- (void)setUris:(id)a3
{
}

- (IDSProtoKeyTransparencyLoggableData)ktLoggableData
{
  return self->_ktLoggableData;
}

- (void)setKtLoggableData:(id)a3
{
}

- (NSData)deviceSignature
{
  return self->_deviceSignature;
}

- (void)setDeviceSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uris, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_ktLoggableData, 0);

  objc_storeStrong((id *)&self->_deviceSignature, 0);
}

@end