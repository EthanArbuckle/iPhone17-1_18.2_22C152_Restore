@interface IDSProtoKeyTransparencyTrustedDevice
+ (Class)trustedServicesType;
- (BOOL)hasBuildVersion;
- (BOOL)hasProductName;
- (BOOL)hasPushToken;
- (BOOL)hasTransparencyVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)pushToken;
- (NSMutableArray)trustedServices;
- (NSString)buildVersion;
- (NSString)productName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)trustedServicesAtIndex:(unint64_t)a3;
- (int64_t)transparencyVersion;
- (unint64_t)hash;
- (unint64_t)trustedServicesCount;
- (void)addTrustedServices:(id)a3;
- (void)clearTrustedServices;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setHasTransparencyVersion:(BOOL)a3;
- (void)setProductName:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setTransparencyVersion:(int64_t)a3;
- (void)setTrustedServices:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSProtoKeyTransparencyTrustedDevice

- (BOOL)hasPushToken
{
  return self->_pushToken != 0;
}

- (void)clearTrustedServices
{
}

- (void)addTrustedServices:(id)a3
{
  id v4 = a3;
  trustedServices = self->_trustedServices;
  id v8 = v4;
  if (!trustedServices)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_trustedServices;
    self->_trustedServices = v6;

    id v4 = v8;
    trustedServices = self->_trustedServices;
  }
  [(NSMutableArray *)trustedServices addObject:v4];
}

- (unint64_t)trustedServicesCount
{
  return (unint64_t)[(NSMutableArray *)self->_trustedServices count];
}

- (id)trustedServicesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_trustedServices objectAtIndex:a3];
}

+ (Class)trustedServicesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (BOOL)hasProductName
{
  return self->_productName != 0;
}

- (void)setTransparencyVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_transparencyVersion = a3;
}

- (void)setHasTransparencyVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTransparencyVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IDSProtoKeyTransparencyTrustedDevice;
  v3 = [(IDSProtoKeyTransparencyTrustedDevice *)&v7 description];
  id v4 = [(IDSProtoKeyTransparencyTrustedDevice *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  pushToken = self->_pushToken;
  if (pushToken) {
    [v3 setObject:pushToken forKey:@"push_token"];
  }
  if ([(NSMutableArray *)self->_trustedServices count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_trustedServices, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v7 = self->_trustedServices;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (void)v17);
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"trusted_services"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v4 setObject:buildVersion forKey:@"buildVersion"];
  }
  productName = self->_productName;
  if (productName) {
    [v4 setObject:productName forKey:@"productName"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v15 = +[NSNumber numberWithLongLong:self->_transparencyVersion];
    [v4 setObject:v15 forKey:@"transparencyVersion"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IDSProtoKeyTransparencyTrustedDeviceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_pushToken) {
    PBDataWriterWriteDataField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_trustedServices;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_buildVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_productName) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_pushToken) {
    objc_msgSend(v9, "setPushToken:");
  }
  if ([(IDSProtoKeyTransparencyTrustedDevice *)self trustedServicesCount])
  {
    [v9 clearTrustedServices];
    unint64_t v4 = [(IDSProtoKeyTransparencyTrustedDevice *)self trustedServicesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(IDSProtoKeyTransparencyTrustedDevice *)self trustedServicesAtIndex:i];
        [v9 addTrustedServices:v7];
      }
    }
  }
  if (self->_buildVersion) {
    objc_msgSend(v9, "setBuildVersion:");
  }
  uint64_t v8 = v9;
  if (self->_productName)
  {
    objc_msgSend(v9, "setProductName:");
    uint64_t v8 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[1] = self->_transparencyVersion;
    *((unsigned char *)v8 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_pushToken copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_trustedServices;
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
        [v5 addTrustedServices:v13];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v14 = [(NSString *)self->_buildVersion copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = [(NSString *)self->_productName copyWithZone:a3];
  long long v17 = (void *)v5[3];
  v5[3] = v16;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_transparencyVersion;
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
  pushToken = self->_pushToken;
  if ((unint64_t)pushToken | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](pushToken, "isEqual:")) {
      goto LABEL_14;
    }
  }
  trustedServices = self->_trustedServices;
  if ((unint64_t)trustedServices | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](trustedServices, "isEqual:")) {
      goto LABEL_14;
    }
  }
  buildVersion = self->_buildVersion;
  if ((unint64_t)buildVersion | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](buildVersion, "isEqual:")) {
      goto LABEL_14;
    }
  }
  productName = self->_productName;
  if ((unint64_t)productName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](productName, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_transparencyVersion == *((void *)v4 + 1))
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
  unint64_t v3 = (unint64_t)[(NSData *)self->_pushToken hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_trustedServices hash];
  NSUInteger v5 = [(NSString *)self->_buildVersion hash];
  NSUInteger v6 = [(NSString *)self->_productName hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_transparencyVersion;
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
    -[IDSProtoKeyTransparencyTrustedDevice setPushToken:](self, "setPushToken:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 5);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[IDSProtoKeyTransparencyTrustedDevice addTrustedServices:](self, "addTrustedServices:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[IDSProtoKeyTransparencyTrustedDevice setBuildVersion:](self, "setBuildVersion:");
  }
  if (*((void *)v4 + 3)) {
    -[IDSProtoKeyTransparencyTrustedDevice setProductName:](self, "setProductName:");
  }
  if (*((unsigned char *)v4 + 48))
  {
    self->_transparencyVersion = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSMutableArray)trustedServices
{
  return self->_trustedServices;
}

- (void)setTrustedServices:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (int64_t)transparencyVersion
{
  return self->_transparencyVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedServices, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_productName, 0);

  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end