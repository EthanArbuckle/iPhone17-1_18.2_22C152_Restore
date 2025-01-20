@interface ATPMessage
- (ATPError)streamError;
- (ATPRequest)request;
- (ATPResponse)response;
- (BOOL)additionalPayload;
- (BOOL)hasAdditionalPayload;
- (BOOL)hasMessageID;
- (BOOL)hasMessageType;
- (BOOL)hasParameters;
- (BOOL)hasParamsSignature;
- (BOOL)hasPayload;
- (BOOL)hasPayloadSignature;
- (BOOL)hasRequest;
- (BOOL)hasResponse;
- (BOOL)hasSessionID;
- (BOOL)hasStreamError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)parameters;
- (NSData)paramsSignature;
- (NSData)payload;
- (NSData)payloadSignature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattedDescription;
- (id)messageTypeAsString:(int)a3;
- (int)StringAsMessageType:(id)a3;
- (int)messageType;
- (unint64_t)hash;
- (unsigned)messageID;
- (unsigned)sessionID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdditionalPayload:(BOOL)a3;
- (void)setHasAdditionalPayload:(BOOL)a3;
- (void)setHasMessageID:(BOOL)a3;
- (void)setHasMessageType:(BOOL)a3;
- (void)setHasSessionID:(BOOL)a3;
- (void)setMessageID:(unsigned int)a3;
- (void)setMessageType:(int)a3;
- (void)setParameters:(id)a3;
- (void)setParamsSignature:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPayloadSignature:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setStreamError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATPMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamError, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_payloadSignature, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_paramsSignature, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)setStreamError:(id)a3
{
}

- (ATPError)streamError
{
  return self->_streamError;
}

- (BOOL)additionalPayload
{
  return self->_additionalPayload;
}

- (void)setPayload:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setResponse:(id)a3
{
}

- (ATPResponse)response
{
  return self->_response;
}

- (void)setRequest:(id)a3
{
}

- (ATPRequest)request
{
  return self->_request;
}

- (void)setPayloadSignature:(id)a3
{
}

- (NSData)payloadSignature
{
  return self->_payloadSignature;
}

- (void)setParamsSignature:(id)a3
{
}

- (NSData)paramsSignature
{
  return self->_paramsSignature;
}

- (void)setParameters:(id)a3
{
}

- (NSData)parameters
{
  return self->_parameters;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 84);
  if ((v6 & 2) != 0)
  {
    self->_messageType = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 84);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_messageID = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
LABEL_4:
    self->_sessionID = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v13 = v4;
  if (*((void *)v4 + 2))
  {
    -[ATPMessage setParameters:](self, "setParameters:");
    id v5 = v13;
  }
  if (*((void *)v5 + 3))
  {
    -[ATPMessage setParamsSignature:](self, "setParamsSignature:");
    id v5 = v13;
  }
  if (*((void *)v5 + 5))
  {
    -[ATPMessage setPayloadSignature:](self, "setPayloadSignature:");
    id v5 = v13;
  }
  request = self->_request;
  uint64_t v8 = *((void *)v5 + 6);
  if (request)
  {
    if (!v8) {
      goto LABEL_20;
    }
    -[ATPRequest mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_20;
    }
    -[ATPMessage setRequest:](self, "setRequest:");
  }
  id v5 = v13;
LABEL_20:
  response = self->_response;
  uint64_t v10 = *((void *)v5 + 7);
  if (response)
  {
    if (!v10) {
      goto LABEL_26;
    }
    -[ATPResponse mergeFrom:](response, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_26;
    }
    -[ATPMessage setResponse:](self, "setResponse:");
  }
  id v5 = v13;
LABEL_26:
  if (*((void *)v5 + 4))
  {
    -[ATPMessage setPayload:](self, "setPayload:");
    id v5 = v13;
  }
  if ((*((unsigned char *)v5 + 84) & 8) != 0)
  {
    self->_additionalPayload = *((unsigned char *)v5 + 80);
    *(unsigned char *)&self->_has |= 8u;
  }
  streamError = self->_streamError;
  uint64_t v12 = *((void *)v5 + 9);
  if (streamError)
  {
    if (v12) {
      -[ATPError mergeFrom:](streamError, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[ATPMessage setStreamError:](self, "setStreamError:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v13 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v13 = 2654435761 * self->_messageType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_messageID;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_sessionID;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v4 = 0;
LABEL_8:
  uint64_t v5 = [(NSData *)self->_parameters hash];
  uint64_t v6 = [(NSData *)self->_paramsSignature hash];
  uint64_t v7 = [(NSData *)self->_payloadSignature hash];
  unint64_t v8 = [(ATPRequest *)self->_request hash];
  unint64_t v9 = [(ATPResponse *)self->_response hash];
  uint64_t v10 = [(NSData *)self->_payload hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_additionalPayload;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(ATPError *)self->_streamError hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_messageType != *((_DWORD *)v4 + 3)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_33;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_messageID != *((_DWORD *)v4 + 2)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0 || self->_sessionID != *((_DWORD *)v4 + 16)) {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_33;
  }
  parameters = self->_parameters;
  if ((unint64_t)parameters | *((void *)v4 + 2) && !-[NSData isEqual:](parameters, "isEqual:")) {
    goto LABEL_33;
  }
  paramsSignature = self->_paramsSignature;
  if ((unint64_t)paramsSignature | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](paramsSignature, "isEqual:")) {
      goto LABEL_33;
    }
  }
  payloadSignature = self->_payloadSignature;
  if ((unint64_t)payloadSignature | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](payloadSignature, "isEqual:")) {
      goto LABEL_33;
    }
  }
  request = self->_request;
  if ((unint64_t)request | *((void *)v4 + 6))
  {
    if (!-[ATPRequest isEqual:](request, "isEqual:")) {
      goto LABEL_33;
    }
  }
  response = self->_response;
  if ((unint64_t)response | *((void *)v4 + 7))
  {
    if (!-[ATPResponse isEqual:](response, "isEqual:")) {
      goto LABEL_33;
    }
  }
  payload = self->_payload;
  if ((unint64_t)payload | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](payload, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    if ((*((unsigned char *)v4 + 84) & 8) == 0) {
      goto LABEL_39;
    }
LABEL_33:
    char v11 = 0;
    goto LABEL_34;
  }
  if ((*((unsigned char *)v4 + 84) & 8) == 0) {
    goto LABEL_33;
  }
  if (!self->_additionalPayload)
  {
    if (!*((unsigned char *)v4 + 80)) {
      goto LABEL_39;
    }
    goto LABEL_33;
  }
  if (!*((unsigned char *)v4 + 80)) {
    goto LABEL_33;
  }
LABEL_39:
  streamError = self->_streamError;
  if ((unint64_t)streamError | *((void *)v4 + 9)) {
    char v11 = -[ATPError isEqual:](streamError, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_34:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_messageType;
    *(unsigned char *)(v5 + 84) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_messageID;
  *(unsigned char *)(v5 + 84) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 64) = self->_sessionID;
    *(unsigned char *)(v5 + 84) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSData *)self->_parameters copyWithZone:a3];
  unint64_t v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  uint64_t v10 = [(NSData *)self->_paramsSignature copyWithZone:a3];
  char v11 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v10;

  uint64_t v12 = [(NSData *)self->_payloadSignature copyWithZone:a3];
  uint64_t v13 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v12;

  id v14 = [(ATPRequest *)self->_request copyWithZone:a3];
  v15 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v14;

  id v16 = [(ATPResponse *)self->_response copyWithZone:a3];
  v17 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v16;

  uint64_t v18 = [(NSData *)self->_payload copyWithZone:a3];
  v19 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v18;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v6 + 80) = self->_additionalPayload;
    *(unsigned char *)(v6 + 84) |= 8u;
  }
  id v20 = [(ATPError *)self->_streamError copyWithZone:a3];
  v21 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v20;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_messageType;
    *((unsigned char *)v4 + 84) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_messageID;
  *((unsigned char *)v4 + 84) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[16] = self->_sessionID;
    *((unsigned char *)v4 + 84) |= 4u;
  }
LABEL_5:
  uint64_t v6 = v4;
  if (self->_parameters)
  {
    objc_msgSend(v4, "setParameters:");
    id v4 = v6;
  }
  if (self->_paramsSignature)
  {
    objc_msgSend(v6, "setParamsSignature:");
    id v4 = v6;
  }
  if (self->_payloadSignature)
  {
    objc_msgSend(v6, "setPayloadSignature:");
    id v4 = v6;
  }
  if (self->_request)
  {
    objc_msgSend(v6, "setRequest:");
    id v4 = v6;
  }
  if (self->_response)
  {
    objc_msgSend(v6, "setResponse:");
    id v4 = v6;
  }
  if (self->_payload)
  {
    objc_msgSend(v6, "setPayload:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 80) = self->_additionalPayload;
    *((unsigned char *)v4 + 84) |= 8u;
  }
  if (self->_streamError)
  {
    objc_msgSend(v6, "setStreamError:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_parameters)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_paramsSignature)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_payloadSignature)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_response)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_payload)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_streamError)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  id v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v8 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        BOOL v15 = v10++ >= 9;
        if (v15)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      unint64_t v18 = v11 >> 3;
      if ((int)(v11 >> 3) <= 19)
      {
        switch((int)v18)
        {
          case 1:
            char v19 = 0;
            unsigned int v20 = 0;
            uint64_t v21 = 0;
            *(unsigned char *)&self->_has |= 2u;
            while (2)
            {
              uint64_t v22 = *v4;
              unint64_t v23 = *(void *)((char *)a3 + v22);
              if (v23 == -1 || v23 >= *(void *)((char *)a3 + *v5))
              {
                *((unsigned char *)a3 + *v6) = 1;
              }
              else
              {
                char v24 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v23);
                *(void *)((char *)a3 + v22) = v23 + 1;
                v21 |= (unint64_t)(v24 & 0x7F) << v19;
                if (v24 < 0)
                {
                  v19 += 7;
                  BOOL v15 = v20++ >= 9;
                  if (v15)
                  {
                    LODWORD(v21) = 0;
                    goto LABEL_73;
                  }
                  continue;
                }
              }
              break;
            }
            if (*((unsigned char *)a3 + *v6)) {
              LODWORD(v21) = 0;
            }
LABEL_73:
            uint64_t v46 = 12;
            goto LABEL_82;
          case 2:
            char v26 = 0;
            unsigned int v27 = 0;
            uint64_t v21 = 0;
            *(unsigned char *)&self->_has |= 1u;
            while (2)
            {
              uint64_t v28 = *v4;
              unint64_t v29 = *(void *)((char *)a3 + v28);
              if (v29 == -1 || v29 >= *(void *)((char *)a3 + *v5))
              {
                *((unsigned char *)a3 + *v6) = 1;
              }
              else
              {
                char v30 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v29);
                *(void *)((char *)a3 + v28) = v29 + 1;
                v21 |= (unint64_t)(v30 & 0x7F) << v26;
                if (v30 < 0)
                {
                  v26 += 7;
                  BOOL v15 = v27++ >= 9;
                  if (v15)
                  {
                    LODWORD(v21) = 0;
                    goto LABEL_77;
                  }
                  continue;
                }
              }
              break;
            }
            if (*((unsigned char *)a3 + *v6)) {
              LODWORD(v21) = 0;
            }
LABEL_77:
            uint64_t v46 = 8;
            goto LABEL_82;
          case 3:
            char v31 = 0;
            unsigned int v32 = 0;
            uint64_t v21 = 0;
            *(unsigned char *)&self->_has |= 4u;
            break;
          case 4:
            PBReaderReadData();
            v36 = (objc_class *)objc_claimAutoreleasedReturnValue();
            uint64_t v37 = 16;
            goto LABEL_57;
          case 5:
            PBReaderReadData();
            v36 = (objc_class *)objc_claimAutoreleasedReturnValue();
            uint64_t v37 = 24;
            goto LABEL_57;
          case 6:
            PBReaderReadData();
            v36 = (objc_class *)objc_claimAutoreleasedReturnValue();
            uint64_t v37 = 40;
            goto LABEL_57;
          default:
            goto LABEL_68;
        }
        while (1)
        {
          uint64_t v33 = *v4;
          unint64_t v34 = *(void *)((char *)a3 + v33);
          if (v34 == -1 || v34 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          char v35 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v34);
          *(void *)((char *)a3 + v33) = v34 + 1;
          v21 |= (unint64_t)(v35 & 0x7F) << v31;
          if ((v35 & 0x80) == 0) {
            goto LABEL_79;
          }
          v31 += 7;
          BOOL v15 = v32++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_81;
          }
        }
        *((unsigned char *)a3 + *v6) = 1;
LABEL_79:
        if (*((unsigned char *)a3 + *v6)) {
          LODWORD(v21) = 0;
        }
LABEL_81:
        uint64_t v46 = 64;
LABEL_82:
        *(_DWORD *)((char *)&self->super.super.isa + v46) = v21;
        continue;
      }
      if ((int)v18 <= 29)
      {
        if (v18 == 20)
        {
          v25 = objc_alloc_init(ATPRequest);
          objc_storeStrong((id *)&self->_request, v25);
          if (!PBReaderPlaceMark() || !ATPRequestReadFrom((uint64_t)v25, (uint64_t)a3))
          {
LABEL_89:

            LOBYTE(v45) = 0;
            return v45;
          }
        }
        else
        {
          if (v18 != 21)
          {
LABEL_68:
            int v45 = PBReaderSkipValueWithTag();
            if (!v45) {
              return v45;
            }
            continue;
          }
          v25 = objc_alloc_init(ATPResponse);
          objc_storeStrong((id *)&self->_response, v25);
          if (!PBReaderPlaceMark() || (ATPResponseReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0) {
            goto LABEL_89;
          }
        }
      }
      else
      {
        if (v18 == 30)
        {
          PBReaderReadData();
          v36 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v37 = 32;
LABEL_57:
          v38 = *(Class *)((char *)&self->super.super.isa + v37);
          *(Class *)((char *)&self->super.super.isa + v37) = v36;

          continue;
        }
        if (v18 == 31)
        {
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0;
          *(unsigned char *)&self->_has |= 8u;
          while (1)
          {
            uint64_t v42 = *v4;
            unint64_t v43 = *(void *)((char *)a3 + v42);
            if (v43 == -1 || v43 >= *(void *)((char *)a3 + *v5)) {
              break;
            }
            char v44 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v43);
            *(void *)((char *)a3 + v42) = v43 + 1;
            v41 |= (unint64_t)(v44 & 0x7F) << v39;
            if ((v44 & 0x80) == 0) {
              goto LABEL_84;
            }
            v39 += 7;
            BOOL v15 = v40++ >= 9;
            if (v15)
            {
              uint64_t v41 = 0;
              goto LABEL_86;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_84:
          if (*((unsigned char *)a3 + *v6)) {
            uint64_t v41 = 0;
          }
LABEL_86:
          self->_additionalPayload = v41 != 0;
          continue;
        }
        if (v18 != 32) {
          goto LABEL_68;
        }
        v25 = objc_alloc_init(ATPError);
        objc_storeStrong((id *)&self->_streamError, v25);
        if (!PBReaderPlaceMark() || (ATPErrorReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0) {
          goto LABEL_89;
        }
      }
      PBReaderRecallMark();
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v45) = *((unsigned char *)a3 + *v6) == 0;
  return v45;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t messageType = self->_messageType;
    if (messageType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_messageType);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E6B8BC98[messageType];
    }
    [v3 setObject:v6 forKey:@"messageType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_messageID];
    [v3 setObject:v7 forKey:@"messageID"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_sessionID];
    [v3 setObject:v8 forKey:@"sessionID"];
  }
  parameters = self->_parameters;
  if (parameters) {
    [v3 setObject:parameters forKey:@"parameters"];
  }
  paramsSignature = self->_paramsSignature;
  if (paramsSignature) {
    [v3 setObject:paramsSignature forKey:@"paramsSignature"];
  }
  payloadSignature = self->_payloadSignature;
  if (payloadSignature) {
    [v3 setObject:payloadSignature forKey:@"payloadSignature"];
  }
  request = self->_request;
  if (request)
  {
    unint64_t v13 = [(ATPRequest *)request dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"request"];
  }
  response = self->_response;
  if (response)
  {
    BOOL v15 = [(ATPResponse *)response dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"response"];
  }
  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v17 = [NSNumber numberWithBool:self->_additionalPayload];
    [v3 setObject:v17 forKey:@"additionalPayload"];
  }
  streamError = self->_streamError;
  if (streamError)
  {
    char v19 = [(ATPError *)streamError dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"streamError"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATPMessage;
  id v4 = [(ATPMessage *)&v8 description];
  uint64_t v5 = [(ATPMessage *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasStreamError
{
  return self->_streamError != 0;
}

- (BOOL)hasAdditionalPayload
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasAdditionalPayload:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setAdditionalPayload:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_additionalPayload = a3;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasPayloadSignature
{
  return self->_payloadSignature != 0;
}

- (BOOL)hasParamsSignature
{
  return self->_paramsSignature != 0;
}

- (BOOL)hasParameters
{
  return self->_parameters != 0;
}

- (BOOL)hasSessionID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSessionID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setSessionID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sessionID = a3;
}

- (BOOL)hasMessageID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMessageID:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMessageID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_messageID = a3;
}

- (int)StringAsMessageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Request"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Response"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ResponsePartial"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RequestData"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ResponseData"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)messageTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6B8BC98[a3];
  }

  return v3;
}

- (BOOL)hasMessageType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasMessageType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setMessageType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t messageType = a3;
}

- (int)messageType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_messageType;
  }
  else {
    return 0;
  }
}

- (id)formattedDescription
{
  int messageType = self->_messageType;
  if ((messageType - 2) >= 3)
  {
    if (messageType == 1)
    {
      unsigned int v10 = NSString;
      uint64_t messageID = self->_messageID;
      NSUInteger v12 = [(NSData *)self->_parameters length];
      NSUInteger v13 = [(NSData *)self->_payload length];
      BOOL v14 = !self->_additionalPayload;
      BOOL v15 = [(ATPResponse *)self->_response error];
      int v4 = [v10 stringWithFormat:@"[ID=%d, %@, params=[%lu bytes], payload=[%lu bytes], EOF=%d, err=%@]", messageID, @"Response", v12, v13, v14, v15];
    }
    else if (messageType)
    {
      int v4 = 0;
    }
    else
    {
      uint64_t v5 = NSString;
      uint64_t v6 = self->_messageID;
      uint64_t v7 = [(ATPRequest *)self->_request command];
      uint64_t v8 = self->_messageType;
      if (v8 > 4) {
        char v9 = @"Unknown";
      }
      else {
        char v9 = off_1E6B8C0C0[v8];
      }
      int v16 = [(ATPRequest *)self->_request dataClass];
      int v4 = [v5 stringWithFormat:@"[ID=%d, %@ %@, %@, params=[%lu bytes], payload=[%lu bytes], EOF=%d]", v6, v7, v9, v16, -[NSData length](self->_parameters, "length"), -[NSData length](self->_payload, "length"), !self->_additionalPayload];
    }
  }
  else
  {
    int v4 = [NSString stringWithFormat:@"[ID=%d, %@, params=[%lu bytes], payload=[%lu bytes], EOF=%d]", self->_messageID, off_1E6B8C0E8[messageType - 2], -[NSData length](self->_parameters, "length"), -[NSData length](self->_payload, "length"), !self->_additionalPayload];
  }

  return v4;
}

@end