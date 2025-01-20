@interface PDDPRegisterDashboardAppResponse
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDDPStatus)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setStatus:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPRegisterDashboardAppResponse

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPRegisterDashboardAppResponse;
  v3 = [(PDDPRegisterDashboardAppResponse *)&v7 description];
  v4 = [(PDDPRegisterDashboardAppResponse *)self dictionaryRepresentation];
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

  return v3;
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
      v13 = objc_alloc_init(PDDPStatus);
      objc_storeStrong((id *)&self->_status, v13);
      if (!PBReaderPlaceMark() || (sub_1000D3710((uint64_t)v13, (uint64_t)a3) & 1) == 0)
      {

        LOBYTE(v14) = 0;
        return v14;
      }
      PBReaderRecallMark();
    }
    else
    {
      int v14 = PBReaderSkipValueWithTag();
      if (!v14) {
        return v14;
      }
    }
  }
  LOBYTE(v14) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
}

- (void)writeTo:(id)a3
{
  if (self->_status) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  status = self->_status;
  if (status) {
    [a3 setStatus:status];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PDDPStatus *)self->_status copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    status = self->_status;
    if ((unint64_t)status | v4[1]) {
      unsigned __int8 v6 = -[PDDPStatus isEqual:](status, "isEqual:");
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

- (unint64_t)hash
{
  return [(PDDPStatus *)self->_status hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  status = self->_status;
  uint64_t v6 = v4[1];
  if (status)
  {
    if (!v6) {
      goto LABEL_7;
    }
    unint64_t v7 = v4;
    status = (PDDPStatus *)-[PDDPStatus mergeFrom:](status, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    unint64_t v7 = v4;
    status = (PDDPStatus *)-[PDDPRegisterDashboardAppResponse setStatus:](self, "setStatus:");
  }
  v4 = v7;
LABEL_7:

  _objc_release_x1(status, v4);
}

- (PDDPStatus)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end