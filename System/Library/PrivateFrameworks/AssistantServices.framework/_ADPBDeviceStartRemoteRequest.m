@interface _ADPBDeviceStartRemoteRequest
+ (unsigned)_ADPBDeviceRequestType;
- (AFRequestInfo)_ad_requestInfo;
- (BOOL)hasHandoffData;
- (BOOL)hasHandoffNotification;
- (BOOL)hasHandoffOriginDeviceName;
- (BOOL)hasHandoffUrlString;
- (BOOL)hasRequiresUserInteraction;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresUserInteraction;
- (NSData)handoffData;
- (NSString)handoffNotification;
- (NSString)handoffOriginDeviceName;
- (NSString)handoffUrlString;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4;
- (void)_ad_setRequestInfo:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHandoffData:(id)a3;
- (void)setHandoffNotification:(id)a3;
- (void)setHandoffOriginDeviceName:(id)a3;
- (void)setHandoffUrlString:(id)a3;
- (void)setHasRequiresUserInteraction:(BOOL)a3;
- (void)setRequiresUserInteraction:(BOOL)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceStartRemoteRequest

+ (unsigned)_ADPBDeviceRequestType
{
  return 3;
}

- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[_ADPBDeviceStartRemoteRequest(ADSharedDataService) _ad_performWithSharedDataRemote:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  [v6 _startRemoteRequest:self completion:v7];
}

- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    v14 = "-[_ADPBDeviceStartRemoteRequest(ADPeerCloudService) _ad_performWithCloudService:fromPeer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }
  v12 = [(_ADPBDeviceStartRemoteRequest *)self _ad_requestInfo];
  [v8 _notifyObserversOfRequestInfo:v12 fromPeer:v9 completion:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_handoffUrlString, 0);
  objc_storeStrong((id *)&self->_handoffOriginDeviceName, 0);
  objc_storeStrong((id *)&self->_handoffNotification, 0);
  objc_storeStrong((id *)&self->_handoffData, 0);
}

- (void)setHandoffOriginDeviceName:(id)a3
{
}

- (NSString)handoffOriginDeviceName
{
  return self->_handoffOriginDeviceName;
}

- (void)setHandoffNotification:(id)a3
{
}

- (NSString)handoffNotification
{
  return self->_handoffNotification;
}

- (BOOL)requiresUserInteraction
{
  return self->_requiresUserInteraction;
}

- (void)setHandoffUrlString:(id)a3
{
}

- (NSString)handoffUrlString
{
  return self->_handoffUrlString;
}

- (void)setHandoffData:(id)a3
{
}

- (NSData)handoffData
{
  return self->_handoffData;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((void *)v4 + 5))
  {
    -[_ADPBDeviceStartRemoteRequest setText:](self, "setText:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[_ADPBDeviceStartRemoteRequest setHandoffData:](self, "setHandoffData:");
    v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[_ADPBDeviceStartRemoteRequest setHandoffUrlString:](self, "setHandoffUrlString:");
    v4 = v5;
  }
  if (v4[52])
  {
    self->_requiresUserInteraction = v4[48];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[_ADPBDeviceStartRemoteRequest setHandoffNotification:](self, "setHandoffNotification:");
    v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[_ADPBDeviceStartRemoteRequest setHandoffOriginDeviceName:](self, "setHandoffOriginDeviceName:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_text hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_handoffData hash];
  NSUInteger v5 = [(NSString *)self->_handoffUrlString hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_requiresUserInteraction;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v8 = [(NSString *)self->_handoffNotification hash];
  return v7 ^ v8 ^ [(NSString *)self->_handoffOriginDeviceName hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  text = self->_text;
  if ((unint64_t)text | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](text, "isEqual:")) {
      goto LABEL_20;
    }
  }
  handoffData = self->_handoffData;
  if ((unint64_t)handoffData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](handoffData, "isEqual:")) {
      goto LABEL_20;
    }
  }
  handoffUrlString = self->_handoffUrlString;
  if ((unint64_t)handoffUrlString | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](handoffUrlString, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 52))
    {
      if (self->_requiresUserInteraction)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_20;
        }
        goto LABEL_16;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_16;
      }
    }
LABEL_20:
    unsigned __int8 v10 = 0;
    goto LABEL_21;
  }
  if (*((unsigned char *)v4 + 52)) {
    goto LABEL_20;
  }
LABEL_16:
  handoffNotification = self->_handoffNotification;
  if ((unint64_t)handoffNotification | *((void *)v4 + 2)
    && !-[NSString isEqual:](handoffNotification, "isEqual:"))
  {
    goto LABEL_20;
  }
  handoffOriginDeviceName = self->_handoffOriginDeviceName;
  if ((unint64_t)handoffOriginDeviceName | *((void *)v4 + 3)) {
    unsigned __int8 v10 = -[NSString isEqual:](handoffOriginDeviceName, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_21:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_text copyWithZone:a3];
  unint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  id v8 = [(NSData *)self->_handoffData copyWithZone:a3];
  id v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSString *)self->_handoffUrlString copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 48) = self->_requiresUserInteraction;
    *((unsigned char *)v5 + 52) |= 1u;
  }
  id v12 = [(NSString *)self->_handoffNotification copyWithZone:a3];
  int v13 = (void *)v5[2];
  v5[2] = v12;

  id v14 = [(NSString *)self->_handoffOriginDeviceName copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = v4;
  if (self->_text)
  {
    objc_msgSend(v4, "setText:");
    id v4 = v5;
  }
  if (self->_handoffData)
  {
    objc_msgSend(v5, "setHandoffData:");
    id v4 = v5;
  }
  if (self->_handoffUrlString)
  {
    objc_msgSend(v5, "setHandoffUrlString:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[48] = self->_requiresUserInteraction;
    v4[52] |= 1u;
  }
  if (self->_handoffNotification)
  {
    objc_msgSend(v5, "setHandoffNotification:");
    id v4 = v5;
  }
  if (self->_handoffOriginDeviceName)
  {
    objc_msgSend(v5, "setHandoffOriginDeviceName:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handoffData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_handoffUrlString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_handoffNotification)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_handoffOriginDeviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
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
      BOOL v10 = v6++ >= 9;
      if (v10)
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
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 40;
        goto LABEL_32;
      case 2u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 8;
        goto LABEL_32;
      case 3u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 32;
        goto LABEL_32;
      case 4u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(unsigned char *)&self->_has |= 1u;
        break;
      case 5u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 16;
        goto LABEL_32;
      case 6u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 24;
LABEL_32:
        v21 = *(void **)&self->PBRequest_opaque[v14];
        *(void *)&self->PBRequest_opaque[v14] = v13;

        continue;
      default:
        int v15 = PBReaderSkipValueWithTag();
        if (!v15) {
          return v15;
        }
        continue;
    }
    while (1)
    {
      unint64_t v19 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v19 == -1 || v19 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v20 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
      v18 |= (unint64_t)(v20 & 0x7F) << v16;
      if ((v20 & 0x80) == 0) {
        goto LABEL_36;
      }
      v16 += 7;
      BOOL v10 = v17++ >= 9;
      if (v10)
      {
        uint64_t v18 = 0;
        goto LABEL_38;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v18 = 0;
    }
LABEL_38:
    self->_requiresUserInteraction = v18 != 0;
  }
  LOBYTE(v15) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  handoffData = self->_handoffData;
  if (handoffData) {
    [v4 setObject:handoffData forKey:@"handoff_data"];
  }
  handoffUrlString = self->_handoffUrlString;
  if (handoffUrlString) {
    [v4 setObject:handoffUrlString forKey:@"handoff_url_string"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v8 = +[NSNumber numberWithBool:self->_requiresUserInteraction];
    [v4 setObject:v8 forKey:@"requiresUserInteraction"];
  }
  handoffNotification = self->_handoffNotification;
  if (handoffNotification) {
    [v4 setObject:handoffNotification forKey:@"handoff_notification"];
  }
  handoffOriginDeviceName = self->_handoffOriginDeviceName;
  if (handoffOriginDeviceName) {
    [v4 setObject:handoffOriginDeviceName forKey:@"handoff_origin_device_name"];
  }
  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_ADPBDeviceStartRemoteRequest;
  NSUInteger v3 = [(_ADPBDeviceStartRemoteRequest *)&v7 description];
  id v4 = [(_ADPBDeviceStartRemoteRequest *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasHandoffOriginDeviceName
{
  return self->_handoffOriginDeviceName != 0;
}

- (BOOL)hasHandoffNotification
{
  return self->_handoffNotification != 0;
}

- (BOOL)hasRequiresUserInteraction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRequiresUserInteraction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRequiresUserInteraction:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_requiresUserInteraction = a3;
}

- (BOOL)hasHandoffUrlString
{
  return self->_handoffUrlString != 0;
}

- (BOOL)hasHandoffData
{
  return self->_handoffData != 0;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (void)_ad_setRequestInfo:(id)a3
{
  id v4 = a3;
  char v5 = [v4 text];
  [(_ADPBDeviceStartRemoteRequest *)self setText:v5];

  unsigned int v6 = [v4 handoffRequestData];
  [(_ADPBDeviceStartRemoteRequest *)self setHandoffData:v6];

  objc_super v7 = [v4 handoffURLString];
  [(_ADPBDeviceStartRemoteRequest *)self setHandoffUrlString:v7];

  -[_ADPBDeviceStartRemoteRequest setRequiresUserInteraction:](self, "setRequiresUserInteraction:", [v4 handoffRequiresUserInteraction]);
  unint64_t v8 = [v4 handoffNotification];
  [(_ADPBDeviceStartRemoteRequest *)self setHandoffNotification:v8];

  id v9 = [v4 handoffOriginDeviceName];

  [(_ADPBDeviceStartRemoteRequest *)self setHandoffOriginDeviceName:v9];
}

- (AFRequestInfo)_ad_requestInfo
{
  id v3 = objc_alloc_init((Class)AFRequestInfo);
  id v4 = [(_ADPBDeviceStartRemoteRequest *)self text];
  [v3 setText:v4];

  char v5 = [(_ADPBDeviceStartRemoteRequest *)self handoffData];
  [v3 setHandoffRequestData:v5];

  unsigned int v6 = [(_ADPBDeviceStartRemoteRequest *)self handoffUrlString];
  [v3 setHandoffURLString:v6];

  objc_msgSend(v3, "setHandoffRequiresUserInteraction:", -[_ADPBDeviceStartRemoteRequest requiresUserInteraction](self, "requiresUserInteraction"));
  objc_super v7 = [(_ADPBDeviceStartRemoteRequest *)self handoffNotification];
  [v3 setHandoffNotification:v7];

  unint64_t v8 = [(_ADPBDeviceStartRemoteRequest *)self handoffOriginDeviceName];
  [v3 setHandoffOriginDeviceName:v8];

  [v3 setActivationEvent:1];
  return (AFRequestInfo *)v3;
}

@end