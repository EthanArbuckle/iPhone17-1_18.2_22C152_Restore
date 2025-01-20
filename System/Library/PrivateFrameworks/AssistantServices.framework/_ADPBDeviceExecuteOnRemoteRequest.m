@interface _ADPBDeviceExecuteOnRemoteRequest
+ (unsigned)_ADPBDeviceRequestType;
- (BOOL)hasAssistantId;
- (BOOL)hasContent;
- (BOOL)hasSourceAirplayId;
- (BOOL)hasSourceIDSFirstRoutableDestination;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)content;
- (NSString)assistantId;
- (NSString)sourceAirplayId;
- (NSString)sourceIDSFirstRoutableDestination;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssistantId:(id)a3;
- (void)setContent:(id)a3;
- (void)setSourceAirplayId:(id)a3;
- (void)setSourceIDSFirstRoutableDestination:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceExecuteOnRemoteRequest

+ (unsigned)_ADPBDeviceRequestType
{
  return 4;
}

- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[_ADPBDeviceExecuteOnRemoteRequest(ADSharedDataService) _ad_performWithSharedDataRemote:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  [v6 _handleExecuteRequestOnRemoteWatch:self completion:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIDSFirstRoutableDestination, 0);
  objc_storeStrong((id *)&self->_sourceAirplayId, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
}

- (void)setSourceAirplayId:(id)a3
{
}

- (NSString)sourceAirplayId
{
  return self->_sourceAirplayId;
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (void)setSourceIDSFirstRoutableDestination:(id)a3
{
}

- (NSString)sourceIDSFirstRoutableDestination
{
  return self->_sourceIDSFirstRoutableDestination;
}

- (void)setContent:(id)a3
{
}

- (NSData)content
{
  return self->_content;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[_ADPBDeviceExecuteOnRemoteRequest setContent:](self, "setContent:");
  }
  if (v4[4]) {
    [(_ADPBDeviceExecuteOnRemoteRequest *)self setSourceIDSFirstRoutableDestination:"setSourceIDSFirstRoutableDestination:"];
  }
  if (v4[1]) {
    -[_ADPBDeviceExecuteOnRemoteRequest setAssistantId:](self, "setAssistantId:");
  }
  if (v4[3]) {
    -[_ADPBDeviceExecuteOnRemoteRequest setSourceAirplayId:](self, "setSourceAirplayId:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_content hash];
  unint64_t v4 = [(NSString *)self->_sourceIDSFirstRoutableDestination hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_assistantId hash];
  return v4 ^ v5 ^ [(NSString *)self->_sourceAirplayId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((content = self->_content, !((unint64_t)content | v4[2]))
     || -[NSData isEqual:](content, "isEqual:"))
    && ((sourceIDSFirstRoutableDestination = self->_sourceIDSFirstRoutableDestination,
         !((unint64_t)sourceIDSFirstRoutableDestination | v4[4]))
     || -[NSString isEqual:](sourceIDSFirstRoutableDestination, "isEqual:"))
    && ((assistantId = self->_assistantId, !((unint64_t)assistantId | v4[1]))
     || -[NSString isEqual:](assistantId, "isEqual:")))
  {
    sourceAirplayId = self->_sourceAirplayId;
    if ((unint64_t)sourceAirplayId | v4[3]) {
      unsigned __int8 v9 = -[NSString isEqual:](sourceAirplayId, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_content copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_sourceIDSFirstRoutableDestination copyWithZone:a3];
  unsigned __int8 v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_assistantId copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  id v12 = [(NSString *)self->_sourceAirplayId copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_content)
  {
    objc_msgSend(v4, "setContent:");
    id v4 = v5;
  }
  if (self->_sourceIDSFirstRoutableDestination)
  {
    objc_msgSend(v5, "setSourceIDSFirstRoutableDestination:");
    id v4 = v5;
  }
  if (self->_assistantId)
  {
    objc_msgSend(v5, "setAssistantId:");
    id v4 = v5;
  }
  if (self->_sourceAirplayId)
  {
    objc_msgSend(v5, "setSourceAirplayId:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_content)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_sourceIDSFirstRoutableDestination)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_assistantId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sourceAirplayId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
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
          uint64_t v13 = PBReaderReadData();
          uint64_t v14 = 16;
          goto LABEL_24;
        case 2u:
          uint64_t v13 = PBReaderReadString();
          uint64_t v14 = 32;
          goto LABEL_24;
        case 3u:
          uint64_t v13 = PBReaderReadString();
          uint64_t v14 = 8;
          goto LABEL_24;
        case 4u:
          uint64_t v13 = PBReaderReadString();
          uint64_t v14 = 24;
LABEL_24:
          v15 = *(void **)&self->PBRequest_opaque[v14];
          *(void *)&self->PBRequest_opaque[v14] = v13;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_25:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
          break;
      }
    }
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  content = self->_content;
  if (content) {
    [v3 setObject:content forKey:@"content"];
  }
  sourceIDSFirstRoutableDestination = self->_sourceIDSFirstRoutableDestination;
  if (sourceIDSFirstRoutableDestination) {
    [v4 setObject:sourceIDSFirstRoutableDestination forKey:@"sourceIDSFirstRoutableDestination"];
  }
  assistantId = self->_assistantId;
  if (assistantId) {
    [v4 setObject:assistantId forKey:@"assistant_id"];
  }
  sourceAirplayId = self->_sourceAirplayId;
  if (sourceAirplayId) {
    [v4 setObject:sourceAirplayId forKey:@"source_airplay_id"];
  }
  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_ADPBDeviceExecuteOnRemoteRequest;
  unint64_t v3 = [(_ADPBDeviceExecuteOnRemoteRequest *)&v7 description];
  id v4 = [(_ADPBDeviceExecuteOnRemoteRequest *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasSourceAirplayId
{
  return self->_sourceAirplayId != 0;
}

- (BOOL)hasAssistantId
{
  return self->_assistantId != 0;
}

- (BOOL)hasSourceIDSFirstRoutableDestination
{
  return self->_sourceIDSFirstRoutableDestination != 0;
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[_ADPBDeviceExecuteOnRemoteRequest(ADPeerCloudService) _ad_performWithCloudService:fromPeer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  [v8 _handleRemoteExecution:self peer:v9 completion:v10];
}

@end