@interface ABCPbSummarySubmitRequest
+ (Class)sigRequestType;
- (BOOL)hasBuildPlatform;
- (BOOL)hasDeviceCategory;
- (BOOL)hasDeviceModel;
- (BOOL)hasVer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)sigRequests;
- (NSString)buildPlatform;
- (NSString)description;
- (NSString)deviceCategory;
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
- (void)setDeviceCategory:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setHasVer:(BOOL)a3;
- (void)setSigRequests:(id)a3;
- (void)setVer:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABCPbSummarySubmitRequest

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

- (BOOL)hasDeviceCategory
{
  return self->_deviceCategory != 0;
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
  v8.super_class = (Class)ABCPbSummarySubmitRequest;
  id v4 = [(ABCPbSummarySubmitRequest *)&v8 description];
  v5 = [(ABCPbSummarySubmitRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
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
  deviceCategory = self->_deviceCategory;
  if (deviceCategory) {
    [v3 setObject:deviceCategory forKey:@"device_Category"];
  }
  if ([(NSMutableArray *)self->_sigRequests count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_sigRequests, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_sigRequests;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"sig_request"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSummarySubmitRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_deviceCategory) {
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
    v4[10] = self->_ver;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  id v9 = v4;
  if (self->_deviceModel) {
    objc_msgSend(v4, "setDeviceModel:");
  }
  if (self->_buildPlatform) {
    objc_msgSend(v9, "setBuildPlatform:");
  }
  if (self->_deviceCategory) {
    objc_msgSend(v9, "setDeviceCategory:");
  }
  if ([(ABCPbSummarySubmitRequest *)self sigRequestsCount])
  {
    [v9 clearSigRequests];
    unint64_t v5 = [(ABCPbSummarySubmitRequest *)self sigRequestsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ABCPbSummarySubmitRequest *)self sigRequestAtIndex:i];
        [v9 addSigRequest:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 40) = self->_ver;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_deviceModel copyWithZone:a3];
  uint64_t v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_buildPlatform copyWithZone:a3];
  long long v10 = (void *)v6[1];
  v6[1] = v9;

  uint64_t v11 = [(NSString *)self->_deviceCategory copyWithZone:a3];
  long long v12 = (void *)v6[2];
  v6[2] = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_sigRequests;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v17), "copyWithZone:", a3, (void)v20);
        [v6 addSigRequest:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_ver != *((_DWORD *)v4 + 10)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 3)
    && !-[NSString isEqual:](deviceModel, "isEqual:"))
  {
    goto LABEL_15;
  }
  buildPlatform = self->_buildPlatform;
  if ((unint64_t)buildPlatform | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](buildPlatform, "isEqual:")) {
      goto LABEL_15;
    }
  }
  deviceCategory = self->_deviceCategory;
  if ((unint64_t)deviceCategory | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](deviceCategory, "isEqual:")) {
      goto LABEL_15;
    }
  }
  sigRequests = self->_sigRequests;
  if ((unint64_t)sigRequests | *((void *)v4 + 4)) {
    char v9 = -[NSMutableArray isEqual:](sigRequests, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
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
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_deviceCategory hash];
  return v6 ^ [(NSMutableArray *)self->_sigRequests hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[11])
  {
    self->_ver = v4[10];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[ABCPbSummarySubmitRequest setDeviceModel:](self, "setDeviceModel:");
  }
  if (*((void *)v5 + 1)) {
    -[ABCPbSummarySubmitRequest setBuildPlatform:](self, "setBuildPlatform:");
  }
  if (*((void *)v5 + 2)) {
    -[ABCPbSummarySubmitRequest setDeviceCategory:](self, "setDeviceCategory:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 4);
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
        -[ABCPbSummarySubmitRequest addSigRequest:](self, "addSigRequest:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
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

- (NSString)deviceCategory
{
  return self->_deviceCategory;
}

- (void)setDeviceCategory:(id)a3
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
  objc_storeStrong((id *)&self->_deviceCategory, 0);

  objc_storeStrong((id *)&self->_buildPlatform, 0);
}

@end