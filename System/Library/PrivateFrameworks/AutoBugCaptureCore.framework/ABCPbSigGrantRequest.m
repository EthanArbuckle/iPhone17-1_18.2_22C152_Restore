@interface ABCPbSigGrantRequest
+ (Class)sigRequestType;
- (BOOL)hasBuildPlatform;
- (BOOL)hasDeviceModel;
- (BOOL)hasVer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sigRequests;
- (NSString)buildPlatform;
- (NSString)description;
- (NSString)deviceModel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)sigRequestAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sigRequestsCount;
- (unsigned)ver;
- (void)addSigRequest:(id)a3;
- (void)clearSigRequests;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildPlatform:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setHasVer:(BOOL)a3;
- (void)setSigRequests:(id)a3;
- (void)setVer:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSigGrantRequest

- (void)setVer:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ver = a3;
}

- (void)setHasVer:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVer
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasBuildPlatform
{
  return self->_buildPlatform != 0;
}

- (void)clearSigRequests
{
}

- (void)addSigRequest:(id)a3
{
  id v4 = a3;
  sigRequests = self->_sigRequests;
  id v8 = v4;
  if (!sigRequests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_sigRequests;
    self->_sigRequests = v6;

    id v4 = v8;
    sigRequests = self->_sigRequests;
  }
  [(NSMutableArray *)sigRequests addObject:v4];
}

- (unint64_t)sigRequestsCount
{
  return [(NSMutableArray *)self->_sigRequests count];
}

- (id)sigRequestAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sigRequests objectAtIndex:a3];
}

+ (Class)sigRequestType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ABCPbSigGrantRequest;
  id v4 = [(ABCPbSigGrantRequest *)&v8 description];
  v5 = [(ABCPbSigGrantRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_ver];
    [v3 setObject:v4 forKey:@"ver"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"device_model"];
  }
  buildPlatform = self->_buildPlatform;
  if (buildPlatform) {
    [v3 setObject:buildPlatform forKey:@"build_platform"];
  }
  if ([(NSMutableArray *)self->_sigRequests count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_sigRequests, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_sigRequests;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"sig_request"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigGrantRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_deviceModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_buildPlatform) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_sigRequests;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_ver;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  id v9 = v4;
  if (self->_deviceModel) {
    objc_msgSend(v4, "setDeviceModel:");
  }
  if (self->_buildPlatform) {
    objc_msgSend(v9, "setBuildPlatform:");
  }
  if ([(ABCPbSigGrantRequest *)self sigRequestsCount])
  {
    [v9 clearSigRequests];
    unint64_t v5 = [(ABCPbSigGrantRequest *)self sigRequestsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ABCPbSigGrantRequest *)self sigRequestAtIndex:i];
        [v9 addSigRequest:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_ver;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_deviceModel copyWithZone:a3];
  uint64_t v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_buildPlatform copyWithZone:a3];
  long long v10 = (void *)v6[1];
  v6[1] = v9;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = self->_sigRequests;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (void)v18);
        [v6 addSigRequest:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_ver != *((_DWORD *)v4 + 8)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 2)
    && !-[NSString isEqual:](deviceModel, "isEqual:"))
  {
    goto LABEL_13;
  }
  buildPlatform = self->_buildPlatform;
  if ((unint64_t)buildPlatform | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](buildPlatform, "isEqual:")) {
      goto LABEL_13;
    }
  }
  sigRequests = self->_sigRequests;
  if ((unint64_t)sigRequests | *((void *)v4 + 3)) {
    char v8 = -[NSMutableArray isEqual:](sigRequests, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_ver;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_deviceModel hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_buildPlatform hash];
  return v4 ^ v5 ^ [(NSMutableArray *)self->_sigRequests hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[9])
  {
    self->_ver = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[ABCPbSigGrantRequest setDeviceModel:](self, "setDeviceModel:");
  }
  if (*((void *)v5 + 1)) {
    -[ABCPbSigGrantRequest setBuildPlatform:](self, "setBuildPlatform:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ABCPbSigGrantRequest addSigRequest:](self, "addSigRequest:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unsigned)ver
{
  return self->_ver;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)buildPlatform
{
  return self->_buildPlatform;
}

- (void)setBuildPlatform:(id)a3
{
}

- (NSMutableArray)sigRequests
{
  return self->_sigRequests;
}

- (void)setSigRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sigRequests, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);

  objc_storeStrong((id *)&self->_buildPlatform, 0);
}

@end