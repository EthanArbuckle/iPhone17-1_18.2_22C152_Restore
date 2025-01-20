@interface IDSQRProtoSessionParameters
- (BOOL)hasParticipantCapabilities;
- (BOOL)hasQrAccessToken;
- (BOOL)hasServiceId;
- (BOOL)hasSoftwareVersion;
- (BOOL)hasWebParticipantCapabilities;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)qrAccessToken;
- (NSString)softwareVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)participantCapabilities;
- (unint64_t)webParticipantCapabilities;
- (unsigned)serviceId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasParticipantCapabilities:(BOOL)a3;
- (void)setHasServiceId:(BOOL)a3;
- (void)setHasWebParticipantCapabilities:(BOOL)a3;
- (void)setParticipantCapabilities:(unint64_t)a3;
- (void)setQrAccessToken:(id)a3;
- (void)setServiceId:(unsigned int)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setWebParticipantCapabilities:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoSessionParameters

- (BOOL)hasQrAccessToken
{
  return self->_qrAccessToken != 0;
}

- (BOOL)hasSoftwareVersion
{
  return self->_softwareVersion != 0;
}

- (void)setParticipantCapabilities:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_participantCapabilities = a3;
}

- (void)setHasParticipantCapabilities:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantCapabilities
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWebParticipantCapabilities:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_webParticipantCapabilities = a3;
}

- (void)setHasWebParticipantCapabilities:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWebParticipantCapabilities
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setServiceId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_serviceId = a3;
}

- (void)setHasServiceId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasServiceId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoSessionParameters;
  v4 = [(IDSQRProtoSessionParameters *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = v5;
  qrAccessToken = self->_qrAccessToken;
  if (qrAccessToken) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)qrAccessToken, v7, @"qr_access_token");
  }
  softwareVersion = self->_softwareVersion;
  if (softwareVersion) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)softwareVersion, v7, @"software_version");
  }
  char has = (char)self->_has;
  if (has)
  {
    v16 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, self->_participantCapabilities, v7);
    objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, v18, @"participant_capabilities");

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v19 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, self->_webParticipantCapabilities, v7);
  objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v19, v21, @"web_participant_capabilities");

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    v12 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_serviceId, v7);
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, v14, @"service_id");
  }
LABEL_9:
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoSessionParametersReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_qrAccessToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_softwareVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_9:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  qrAccessToken = self->_qrAccessToken;
  id v10 = v4;
  if (qrAccessToken)
  {
    objc_msgSend_setQrAccessToken_(v4, v5, (uint64_t)qrAccessToken, v6);
    id v4 = v10;
  }
  softwareVersion = self->_softwareVersion;
  if (softwareVersion)
  {
    objc_msgSend_setSoftwareVersion_(v10, v5, (uint64_t)softwareVersion, v6);
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_participantCapabilities;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = self->_webParticipantCapabilities;
  *((unsigned char *)v4 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 8) = self->_serviceId;
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_qrAccessToken, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_softwareVersion, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v19;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v12 + 16) = self->_webParticipantCapabilities;
    *(unsigned char *)(v12 + 48) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v12;
    }
    goto LABEL_4;
  }
  *(void *)(v12 + 8) = self->_participantCapabilities;
  *(unsigned char *)(v12 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v12 + 32) = self->_serviceId;
    *(unsigned char *)(v12 + 48) |= 4u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_20;
  }
  qrAccessToken = self->_qrAccessToken;
  uint64_t v11 = v4[3];
  if ((unint64_t)qrAccessToken | v11)
  {
    if (!objc_msgSend_isEqual_(qrAccessToken, v8, v11, v9)) {
      goto LABEL_20;
    }
  }
  softwareVersion = self->_softwareVersion;
  uint64_t v13 = v4[5];
  if ((unint64_t)softwareVersion | v13)
  {
    if (!objc_msgSend_isEqual_(softwareVersion, v8, v13, v9)) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[6] & 1) == 0 || self->_participantCapabilities != v4[1]) {
      goto LABEL_20;
    }
  }
  else if (v4[6])
  {
LABEL_20:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[6] & 2) == 0 || self->_webParticipantCapabilities != v4[2]) {
      goto LABEL_20;
    }
  }
  else if ((v4[6] & 2) != 0)
  {
    goto LABEL_20;
  }
  BOOL v14 = (v4[6] & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[6] & 4) == 0 || self->_serviceId != *((_DWORD *)v4 + 8)) {
      goto LABEL_20;
    }
    BOOL v14 = 1;
  }
LABEL_21:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_qrAccessToken, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_softwareVersion, v6, v7, v8);
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v12 = 0;
    return v9 ^ v5 ^ v10 ^ v11 ^ v12;
  }
  unint64_t v10 = 2654435761u * self->_participantCapabilities;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v11 = 2654435761u * self->_webParticipantCapabilities;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v12 = 2654435761 * self->_serviceId;
  return v9 ^ v5 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = *((void *)v4 + 3);
  id v10 = v4;
  if (v7)
  {
    objc_msgSend_setQrAccessToken_(self, v5, v7, v6);
    id v4 = v10;
  }
  uint64_t v8 = *((void *)v4 + 5);
  if (v8)
  {
    objc_msgSend_setSoftwareVersion_(self, v5, v8, v6);
    id v4 = v10;
  }
  char v9 = *((unsigned char *)v4 + 48);
  if (v9)
  {
    self->_participantCapabilities = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v9 = *((unsigned char *)v4 + 48);
    if ((v9 & 2) == 0)
    {
LABEL_7:
      if ((v9 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_webParticipantCapabilities = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_8:
    self->_serviceId = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_9:
}

- (NSData)qrAccessToken
{
  return self->_qrAccessToken;
}

- (void)setQrAccessToken:(id)a3
{
}

- (NSString)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(id)a3
{
}

- (unint64_t)participantCapabilities
{
  return self->_participantCapabilities;
}

- (unint64_t)webParticipantCapabilities
{
  return self->_webParticipantCapabilities;
}

- (unsigned)serviceId
{
  return self->_serviceId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_qrAccessToken, 0);
}

@end