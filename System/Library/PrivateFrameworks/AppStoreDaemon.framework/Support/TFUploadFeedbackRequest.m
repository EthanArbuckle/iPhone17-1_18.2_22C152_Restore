@interface TFUploadFeedbackRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFUploadFeedbackRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TFUploadFeedbackRequest;
  v3 = [(TFUploadFeedbackRequest *)&v7 description];
  v4 = [(TFUploadFeedbackRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4 = +[NSNumber numberWithUnsignedLongLong:self->_dsid];
    [v3 setObject:v4 forKey:@"dsid"];
  }
  feedback = self->_feedback;
  if (feedback)
  {
    v6 = [(TFFeedback *)feedback dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"feedback"];
  }
  application = self->_application;
  if (application)
  {
    v8 = [(TFApplication *)application dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"application"];
  }
  device = self->_device;
  if (device)
  {
    v10 = [(TFDevice *)device dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"device"];
  }
  appleWatch = self->_appleWatch;
  if (appleWatch)
  {
    v12 = [(TFAppleWatch *)appleWatch dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"appleWatch"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = +[NSNumber numberWithUnsignedLongLong:self->_posixTimestampMillis];
    [v3 setObject:v14 forKey:@"posixTimestampMillis"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v15 = +[NSNumber numberWithUnsignedLongLong:self->_desiredTTLMillis];
    [v3 setObject:v15 forKey:@"desiredTTLMillis"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
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
          char v13 = 0;
          unsigned int v14 = 0;
          uint64_t v15 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (1)
          {
            unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v16 == -1 || v16 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
              break;
            }
            char v17 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
            v15 |= (unint64_t)(v17 & 0x7F) << v13;
            if ((v17 & 0x80) == 0) {
              goto LABEL_54;
            }
            v13 += 7;
            BOOL v10 = v14++ >= 9;
            if (v10)
            {
              uint64_t v15 = 0;
              goto LABEL_56;
            }
          }
          *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_54:
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v15 = 0;
          }
LABEL_56:
          uint64_t v28 = 16;
          goto LABEL_65;
        case 2u:
          v19 = objc_alloc_init(TFFeedback);
          objc_storeStrong((id *)&self->_feedback, v19);
          if (!PBReaderPlaceMark() || !sub_10026229C((uint64_t)v19, (uint64_t)a3)) {
            goto LABEL_68;
          }
          goto LABEL_38;
        case 3u:
          v19 = objc_alloc_init(TFApplication);
          objc_storeStrong((id *)&self->_application, v19);
          if (!PBReaderPlaceMark() || (sub_10042745C((uint64_t)v19, (uint64_t)a3) & 1) == 0) {
            goto LABEL_68;
          }
          goto LABEL_38;
        case 4u:
          v19 = objc_alloc_init(TFDevice);
          objc_storeStrong((id *)&self->_device, v19);
          if (!PBReaderPlaceMark() || (sub_1003AD568((uint64_t)v19, (uint64_t)a3) & 1) == 0) {
            goto LABEL_68;
          }
          goto LABEL_38;
        case 5u:
          v19 = objc_alloc_init(TFAppleWatch);
          objc_storeStrong((id *)&self->_appleWatch, v19);
          if (!PBReaderPlaceMark() || !sub_1003768C8((uint64_t)v19, (uint64_t)a3))
          {
LABEL_68:

            LOBYTE(v18) = 0;
            return v18;
          }
LABEL_38:
          PBReaderRecallMark();

LABEL_66:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_67;
          break;
        case 6u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v15 = 0;
          *(unsigned char *)&self->_has |= 4u;
          while (2)
          {
            unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v22 == -1 || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
              v15 |= (unint64_t)(v23 & 0x7F) << v20;
              if (v23 < 0)
              {
                v20 += 7;
                BOOL v10 = v21++ >= 9;
                if (v10)
                {
                  uint64_t v15 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v15 = 0;
          }
LABEL_60:
          uint64_t v28 = 24;
          goto LABEL_65;
        case 7u:
          char v24 = 0;
          unsigned int v25 = 0;
          uint64_t v15 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            unint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v26 == -1 || v26 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
              v15 |= (unint64_t)(v27 & 0x7F) << v24;
              if (v27 < 0)
              {
                v24 += 7;
                BOOL v10 = v25++ >= 9;
                if (v10)
                {
                  uint64_t v15 = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v15 = 0;
          }
LABEL_64:
          uint64_t v28 = 8;
LABEL_65:
          *(void *)&self->PBRequest_opaque[v28] = v15;
          goto LABEL_66;
        default:
          int v18 = PBReaderSkipValueWithTag();
          if (!v18) {
            return v18;
          }
          goto LABEL_66;
      }
    }
  }
LABEL_67:
  LOBYTE(v18) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_feedback) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_application) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_device) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appleWatch) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unsigned int v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[2] = self->_dsid;
    *((unsigned char *)v5 + 64) |= 2u;
  }
  id v7 = [(TFFeedback *)self->_feedback copyWithZone:a3];
  unint64_t v8 = (void *)v6[7];
  v6[7] = v7;

  id v9 = [(TFApplication *)self->_application copyWithZone:a3];
  BOOL v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(TFDevice *)self->_device copyWithZone:a3];
  v12 = (void *)v6[6];
  v6[6] = v11;

  id v13 = [(TFAppleWatch *)self->_appleWatch copyWithZone:a3];
  unsigned int v14 = (void *)v6[4];
  v6[4] = v13;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v6[3] = self->_posixTimestampMillis;
    *((unsigned char *)v6 + 64) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v6[1] = self->_desiredTTLMillis;
    *((unsigned char *)v6 + 64) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_dsid != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
LABEL_24:
    BOOL v9 = 0;
    goto LABEL_25;
  }
  feedback = self->_feedback;
  if ((unint64_t)feedback | *((void *)v4 + 7) && !-[TFFeedback isEqual:](feedback, "isEqual:")) {
    goto LABEL_24;
  }
  application = self->_application;
  if ((unint64_t)application | *((void *)v4 + 5))
  {
    if (!-[TFApplication isEqual:](application, "isEqual:")) {
      goto LABEL_24;
    }
  }
  device = self->_device;
  if ((unint64_t)device | *((void *)v4 + 6))
  {
    if (!-[TFDevice isEqual:](device, "isEqual:")) {
      goto LABEL_24;
    }
  }
  appleWatch = self->_appleWatch;
  if ((unint64_t)appleWatch | *((void *)v4 + 4))
  {
    if (!-[TFAppleWatch isEqual:](appleWatch, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0 || self->_posixTimestampMillis != *((void *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_24;
  }
  BOOL v9 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_desiredTTLMillis != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
    BOOL v9 = 1;
  }
LABEL_25:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_dsid;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(TFFeedback *)self->_feedback hash];
  unint64_t v5 = [(TFApplication *)self->_application hash];
  unint64_t v6 = [(TFDevice *)self->_device hash];
  unint64_t v7 = [(TFAppleWatch *)self->_appleWatch hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v8 = 2654435761u * self->_posixTimestampMillis;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  unint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v9 = 2654435761u * self->_desiredTTLMillis;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_appleWatch, 0);
}

@end