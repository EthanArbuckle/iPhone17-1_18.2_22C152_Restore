@interface PDDPEESetupResponse
+ (Class)endpointsType;
- (BOOL)hasServiceConfig;
- (BOOL)hasStatus;
- (BOOL)hasUserInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)endpoints;
- (PDDPEEServiceConfig)serviceConfig;
- (PDDPEEUserInfo)userInfo;
- (PDDPStatus)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)endpointsAtIndex:(unint64_t)a3;
- (unint64_t)endpointsCount;
- (unint64_t)hash;
- (void)addEndpoints:(id)a3;
- (void)clearEndpoints;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndpoints:(id)a3;
- (void)setServiceConfig:(id)a3;
- (void)setStatus:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEESetupResponse

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (BOOL)hasServiceConfig
{
  return self->_serviceConfig != 0;
}

- (void)clearEndpoints
{
}

- (void)addEndpoints:(id)a3
{
  id v4 = a3;
  endpoints = self->_endpoints;
  id v8 = v4;
  if (!endpoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_endpoints;
    self->_endpoints = v6;

    id v4 = v8;
    endpoints = self->_endpoints;
  }
  [(NSMutableArray *)endpoints addObject:v4];
}

- (unint64_t)endpointsCount
{
  return (unint64_t)[(NSMutableArray *)self->_endpoints count];
}

- (id)endpointsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_endpoints objectAtIndex:a3];
}

+ (Class)endpointsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEESetupResponse;
  v3 = [(PDDPEESetupResponse *)&v7 description];
  id v4 = [(PDDPEESetupResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  status = self->_status;
  if (status)
  {
    v5 = [(PDDPStatus *)status dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"status"];
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    objc_super v7 = [(PDDPEEUserInfo *)userInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"user_info"];
  }
  serviceConfig = self->_serviceConfig;
  if (serviceConfig)
  {
    v9 = [(PDDPEEServiceConfig *)serviceConfig dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"service_config"];
  }
  if ([(NSMutableArray *)self->_endpoints count])
  {
    id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_endpoints, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v11 = self->_endpoints;
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v10 addObject:v16];
        }
        id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"endpoints"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
    return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  while (2)
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      if (v6++ >= 9)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    switch((v7 >> 3))
    {
      case 1u:
        id v13 = objc_alloc_init(PDDPStatus);
        objc_storeStrong((id *)&self->_status, v13);
        if PBReaderPlaceMark() && (sub_1000D3710((uint64_t)v13, (uint64_t)a3)) {
          goto LABEL_31;
        }
        goto LABEL_34;
      case 2u:
        id v13 = objc_alloc_init(PDDPEEUserInfo);
        objc_storeStrong((id *)&self->_userInfo, v13);
        if (!PBReaderPlaceMark() || (sub_1001069C4((uint64_t)v13, (uint64_t)a3) & 1) == 0) {
          goto LABEL_34;
        }
        goto LABEL_31;
      case 3u:
        id v13 = objc_alloc_init(PDDPEEServiceConfig);
        objc_storeStrong((id *)&self->_serviceConfig, v13);
        if (!PBReaderPlaceMark() || (sub_100094650(v13, (uint64_t)a3) & 1) == 0) {
          goto LABEL_34;
        }
        goto LABEL_31;
      case 4u:
        id v13 = objc_alloc_init(PDDPEndpointConfig);
        [(PDDPEESetupResponse *)self addEndpoints:v13];
        if PBReaderPlaceMark() && (sub_1000699C4((uint64_t)v13, (uint64_t)a3))
        {
LABEL_31:
          PBReaderRecallMark();

LABEL_32:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          continue;
        }
LABEL_34:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_32;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_status) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_userInfo) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_serviceConfig) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v5 = self->_endpoints;
  unsigned int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      char v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      unint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_status) {
    objc_msgSend(v8, "setStatus:");
  }
  if (self->_userInfo) {
    objc_msgSend(v8, "setUserInfo:");
  }
  if (self->_serviceConfig) {
    objc_msgSend(v8, "setServiceConfig:");
  }
  if ([(PDDPEESetupResponse *)self endpointsCount])
  {
    [v8 clearEndpoints];
    unint64_t v4 = [(PDDPEESetupResponse *)self endpointsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(PDDPEESetupResponse *)self endpointsAtIndex:i];
        [v8 addEndpoints:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPStatus *)self->_status copyWithZone:a3];
  unint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(PDDPEEUserInfo *)self->_userInfo copyWithZone:a3];
  char v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(PDDPEEServiceConfig *)self->_serviceConfig copyWithZone:a3];
  long long v11 = (void *)v5[2];
  v5[2] = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_endpoints;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v16), "copyWithZone:", a3, (void)v19);
        [v5 addEndpoints:v17];

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((status = self->_status, !((unint64_t)status | v4[3])) || -[PDDPStatus isEqual:](status, "isEqual:"))
    && ((userInfo = self->_userInfo, !((unint64_t)userInfo | v4[4]))
     || -[PDDPEEUserInfo isEqual:](userInfo, "isEqual:"))
    && ((serviceConfig = self->_serviceConfig, !((unint64_t)serviceConfig | v4[2]))
     || -[PDDPEEServiceConfig isEqual:](serviceConfig, "isEqual:")))
  {
    endpoints = self->_endpoints;
    if ((unint64_t)endpoints | v4[1]) {
      unsigned __int8 v9 = -[NSMutableArray isEqual:](endpoints, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDDPStatus *)self->_status hash];
  unint64_t v4 = [(PDDPEEUserInfo *)self->_userInfo hash] ^ v3;
  unint64_t v5 = [(PDDPEEServiceConfig *)self->_serviceConfig hash];
  return v4 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_endpoints hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  status = self->_status;
  uint64_t v6 = *((void *)v4 + 3);
  if (status)
  {
    if (v6) {
      -[PDDPStatus mergeFrom:](status, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PDDPEESetupResponse setStatus:](self, "setStatus:");
  }
  userInfo = self->_userInfo;
  uint64_t v8 = *((void *)v4 + 4);
  if (userInfo)
  {
    if (v8) {
      -[PDDPEEUserInfo mergeFrom:](userInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[PDDPEESetupResponse setUserInfo:](self, "setUserInfo:");
  }
  serviceConfig = self->_serviceConfig;
  uint64_t v10 = *((void *)v4 + 2);
  if (serviceConfig)
  {
    if (v10) {
      -[PDDPEEServiceConfig mergeFrom:](serviceConfig, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[PDDPEESetupResponse setServiceConfig:](self, "setServiceConfig:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 1);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[PDDPEESetupResponse addEndpoints:](self, "addEndpoints:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (PDDPEEUserInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (PDDPEEServiceConfig)serviceConfig
{
  return self->_serviceConfig;
}

- (void)setServiceConfig:(id)a3
{
}

- (NSMutableArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_serviceConfig, 0);

  objc_storeStrong((id *)&self->_endpoints, 0);
}

@end