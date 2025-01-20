@interface _ADPBProxyWakeUpRequest
+ (unsigned)_ADPBProxyRequestType;
- (BOOL)hasStreamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)streamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_ad_performWithPeerStreamConnection:(id)a3 context:(id)a4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStreamId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBProxyWakeUpRequest

- (void)_ad_performWithPeerStreamConnection:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)AFSiriLogContextIDS;
  if (os_log_type_enabled(AFSiriLogContextIDS, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = [(_ADPBProxyWakeUpRequest *)self streamId];
    int v11 = 136315394;
    v12 = "-[_ADPBProxyWakeUpRequest(ADPeerStreamConnection) _ad_performWithPeerStreamConnection:context:]";
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  [v6 _handleWakeUpMessage:self context:v7];
}

- (void).cxx_destruct
{
}

- (void)setStreamId:(id)a3
{
}

- (NSString)streamId
{
  return self->_streamId;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_ADPBProxyWakeUpRequest setStreamId:](self, "setStreamId:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_streamId hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    streamId = self->_streamId;
    if ((unint64_t)streamId | v4[1]) {
      unsigned __int8 v6 = -[NSString isEqual:](streamId, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_streamId copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  streamId = self->_streamId;
  if (streamId) {
    _[a3 setStreamId:streamId];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_streamId) {
    PBDataWriterWriteStringField();
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
      break;
    }
    if ((v7 >> 3) == 1)
    {
      PBReaderReadString();
      __int16 v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      streamId = self->_streamId;
      self->_streamId = v13;
    }
    else
    {
      int v15 = PBReaderSkipValueWithTag();
      if (!v15) {
        return v15;
      }
    }
  }
  LOBYTE(v15) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  streamId = self->_streamId;
  if (streamId) {
    [v3 setObject:streamId forKey:@"stream_id"];
  }
  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_ADPBProxyWakeUpRequest;
  v3 = [(_ADPBProxyWakeUpRequest *)&v7 description];
  v4 = [(_ADPBProxyWakeUpRequest *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasStreamId
{
  return self->_streamId != 0;
}

+ (unsigned)_ADPBProxyRequestType
{
  return 0;
}

@end