@interface PDDPStatus
+ (Class)serverAlertsType;
- (BOOL)hasCode;
- (BOOL)hasInternalMessage;
- (BOOL)hasKey;
- (BOOL)hasMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)serverAlerts;
- (NSString)internalMessage;
- (NSString)key;
- (NSString)message;
- (id)codeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)serverAlertsAtIndex:(unint64_t)a3;
- (int)StringAsCode:(id)a3;
- (int)code;
- (unint64_t)hash;
- (unint64_t)serverAlertsCount;
- (void)addServerAlerts:(id)a3;
- (void)clearServerAlerts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int)a3;
- (void)setHasCode:(BOOL)a3;
- (void)setInternalMessage:(id)a3;
- (void)setKey:(id)a3;
- (void)setMessage:(id)a3;
- (void)setServerAlerts:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPStatus

- (int)code
{
  if (*(unsigned char *)&self->_has) {
    return self->_code;
  }
  else {
    return 0;
  }
}

- (void)setCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_code = a3;
}

- (void)setHasCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)codeAsString:(int)a3
{
  if (a3 > 299)
  {
    switch(a3)
    {
      case 800:
        v4 = @"E_NOT_APPLICABLE_TYPE";
        break;
      case 801:
        v4 = @"E_ENTITY_NOT_FOUND";
        break;
      case 802:
        v4 = @"E_ENTITY_PRIVILEGE_CHANGE";
        break;
      case 803:
        v4 = @"E_MUST_ACCEPT_TERMS";
        break;
      case 804:
        v4 = @"E_ENTITY_EXPIRED";
        break;
      case 805:
        v4 = @"E_NOT_ALLOWED_FEDERATED_ORGANIZATION";
        break;
      case 806:
        v4 = @"E_DISALLOWED_EMAIL_DOMAIN";
        break;
      default:
        if (a3 == 300)
        {
          v4 = @"E_DEVICE_UNSUPPORTED";
        }
        else if (a3 == 500)
        {
          v4 = @"E_INVALID_FIELD_VALUE";
        }
        else
        {
LABEL_115:
          v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
LABEL_116:
        }
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 'd':
        v4 = @"E_BOOTSTRAP_REQUIRED";
        break;
      case 'e':
        v4 = @"E_AUTHENTICATION_FAILED";
        break;
      case 'f':
        v4 = @"E_NOT_AUTHORIZED";
        break;
      case 'g':
        v4 = @"E_MESCAL_SIGNATURE_REQUIRED";
        break;
      case 'h':
        v4 = @"E_MESCAL_BAD_SIGNATURE";
        break;
      case 'i':
        v4 = @"E_MESCAL_PARSE_ERROR";
        break;
      case 'j':
        v4 = @"E_BAD_REQUEST";
        break;
      case 'k':
        v4 = @"E_BAD_PROTOCOL_VERSION";
        break;
      case 'l':
        v4 = @"E_REQUEST_TOO_LARGE";
        break;
      case 'm':
        v4 = @"E_REQUEST_TOO_MANY_ITEMS";
        break;
      case 'n':
        v4 = @"E_SERVER_BUSY";
        break;
      case 'o':
        v4 = @"E_ACCESS_DENIED";
        break;
      case 'p':
        v4 = @"E_CONFLICT";
        break;
      case 'q':
        v4 = @"E_INVALID_STATE";
        break;
      case 'r':
        v4 = @"E_LOCK_TAKEN";
        break;
      case 's':
        v4 = @"E_DOWNSTREAM_SERVICE_FAILED";
        break;
      case 't':
        v4 = @"E_DOWNSTREAM_SERVICE_THROTTLED";
        break;
      case 'u':
        v4 = @"E_DRIVE_USER_QUOTA_EXCEEDED";
        break;
      case 'v':
        v4 = @"E_DRIVE_GROUP_QUOTA_EXCEEDED";
        break;
      case 'w':
        v4 = @"E_DRIVE_ORG_QUOTA_EXCEEDED";
        break;
      case 'x':
        v4 = @"E_RECORD_LIMIT_EXCEEDED";
        break;
      case 'y':
        v4 = @"E_DISALLOWED_COUNTRY_CODE";
        break;
      default:
        v4 = @"UNKNOWN_CODE";
        switch(a3)
        {
          case 0:
            goto LABEL_116;
          case 1:
            v4 = @"S_OK";
            break;
          case 2:
            v4 = @"E_ERROR";
            break;
          case 3:
            v4 = @"S_MIXED_RESPONSE";
            break;
          case 4:
            v4 = @"S_OK_HAS_MORE_DATA";
            break;
          case 5:
            v4 = @"S_PROCESSING";
            break;
          default:
            goto LABEL_115;
        }
        break;
    }
  }
  return v4;
}

- (int)StringAsCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"S_OK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"E_ERROR"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"S_MIXED_RESPONSE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"S_OK_HAS_MORE_DATA"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"S_PROCESSING"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"E_BOOTSTRAP_REQUIRED"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"E_AUTHENTICATION_FAILED"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"E_NOT_AUTHORIZED"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"E_MESCAL_SIGNATURE_REQUIRED"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"E_MESCAL_BAD_SIGNATURE"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"E_MESCAL_PARSE_ERROR"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"E_BAD_REQUEST"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"E_BAD_PROTOCOL_VERSION"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"E_REQUEST_TOO_LARGE"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"E_REQUEST_TOO_MANY_ITEMS"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"E_SERVER_BUSY"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"E_ACCESS_DENIED"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"E_CONFLICT"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"E_INVALID_STATE"])
  {
    int v4 = 113;
  }
  else if ([v3 isEqualToString:@"E_LOCK_TAKEN"])
  {
    int v4 = 114;
  }
  else if ([v3 isEqualToString:@"E_DOWNSTREAM_SERVICE_FAILED"])
  {
    int v4 = 115;
  }
  else if ([v3 isEqualToString:@"E_DOWNSTREAM_SERVICE_THROTTLED"])
  {
    int v4 = 116;
  }
  else if ([v3 isEqualToString:@"E_DRIVE_USER_QUOTA_EXCEEDED"])
  {
    int v4 = 117;
  }
  else if ([v3 isEqualToString:@"E_DRIVE_GROUP_QUOTA_EXCEEDED"])
  {
    int v4 = 118;
  }
  else if ([v3 isEqualToString:@"E_DRIVE_ORG_QUOTA_EXCEEDED"])
  {
    int v4 = 119;
  }
  else if ([v3 isEqualToString:@"E_RECORD_LIMIT_EXCEEDED"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"E_DISALLOWED_COUNTRY_CODE"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"E_DEVICE_UNSUPPORTED"])
  {
    int v4 = 300;
  }
  else if ([v3 isEqualToString:@"E_INVALID_FIELD_VALUE"])
  {
    int v4 = 500;
  }
  else if ([v3 isEqualToString:@"E_NOT_APPLICABLE_TYPE"])
  {
    int v4 = 800;
  }
  else if ([v3 isEqualToString:@"E_ENTITY_NOT_FOUND"])
  {
    int v4 = 801;
  }
  else if ([v3 isEqualToString:@"E_ENTITY_PRIVILEGE_CHANGE"])
  {
    int v4 = 802;
  }
  else if ([v3 isEqualToString:@"E_MUST_ACCEPT_TERMS"])
  {
    int v4 = 803;
  }
  else if ([v3 isEqualToString:@"E_ENTITY_EXPIRED"])
  {
    int v4 = 804;
  }
  else if ([v3 isEqualToString:@"E_NOT_ALLOWED_FEDERATED_ORGANIZATION"])
  {
    int v4 = 805;
  }
  else if ([v3 isEqualToString:@"E_DISALLOWED_EMAIL_DOMAIN"])
  {
    int v4 = 806;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (BOOL)hasInternalMessage
{
  return self->_internalMessage != 0;
}

- (void)clearServerAlerts
{
}

- (void)addServerAlerts:(id)a3
{
  id v4 = a3;
  serverAlerts = self->_serverAlerts;
  id v8 = v4;
  if (!serverAlerts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_serverAlerts;
    self->_serverAlerts = v6;

    id v4 = v8;
    serverAlerts = self->_serverAlerts;
  }
  [(NSMutableArray *)serverAlerts addObject:v4];
}

- (unint64_t)serverAlertsCount
{
  return (unint64_t)[(NSMutableArray *)self->_serverAlerts count];
}

- (id)serverAlertsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_serverAlerts objectAtIndex:a3];
}

+ (Class)serverAlertsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPStatus;
  id v3 = [(PDDPStatus *)&v7 description];
  id v4 = [(PDDPStatus *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int code = self->_code;
    if (code > 299)
    {
      int v8 = code - 800;
      uint64_t v6 = (code - 800);
      switch(v8)
      {
        case 0:
          objc_super v7 = @"E_NOT_APPLICABLE_TYPE";
          break;
        case 1:
          objc_super v7 = @"E_ENTITY_NOT_FOUND";
          break;
        case 2:
          objc_super v7 = @"E_ENTITY_PRIVILEGE_CHANGE";
          break;
        case 3:
          objc_super v7 = @"E_MUST_ACCEPT_TERMS";
          break;
        case 4:
          objc_super v7 = @"E_ENTITY_EXPIRED";
          break;
        case 5:
          objc_super v7 = @"E_NOT_ALLOWED_FEDERATED_ORGANIZATION";
          break;
        case 6:
          objc_super v7 = @"E_DISALLOWED_EMAIL_DOMAIN";
          break;
        default:
          if (v6 == 300)
          {
            objc_super v7 = @"E_DEVICE_UNSUPPORTED";
          }
          else if (v6 == 500)
          {
            objc_super v7 = @"E_INVALID_FIELD_VALUE";
          }
          else
          {
LABEL_44:
            objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
          }
          break;
      }
    }
    else
    {
      int v5 = code - 100;
      uint64_t v6 = (code - 100);
      switch(v5)
      {
        case 0:
          objc_super v7 = @"E_BOOTSTRAP_REQUIRED";
          break;
        case 1:
          objc_super v7 = @"E_AUTHENTICATION_FAILED";
          break;
        case 2:
          objc_super v7 = @"E_NOT_AUTHORIZED";
          break;
        case 3:
          objc_super v7 = @"E_MESCAL_SIGNATURE_REQUIRED";
          break;
        case 4:
          objc_super v7 = @"E_MESCAL_BAD_SIGNATURE";
          break;
        case 5:
          objc_super v7 = @"E_MESCAL_PARSE_ERROR";
          break;
        case 6:
          objc_super v7 = @"E_BAD_REQUEST";
          break;
        case 7:
          objc_super v7 = @"E_BAD_PROTOCOL_VERSION";
          break;
        case 8:
          objc_super v7 = @"E_REQUEST_TOO_LARGE";
          break;
        case 9:
          objc_super v7 = @"E_REQUEST_TOO_MANY_ITEMS";
          break;
        case 10:
          objc_super v7 = @"E_SERVER_BUSY";
          break;
        case 11:
          objc_super v7 = @"E_ACCESS_DENIED";
          break;
        case 12:
          objc_super v7 = @"E_CONFLICT";
          break;
        case 13:
          objc_super v7 = @"E_INVALID_STATE";
          break;
        case 14:
          objc_super v7 = @"E_LOCK_TAKEN";
          break;
        case 15:
          objc_super v7 = @"E_DOWNSTREAM_SERVICE_FAILED";
          break;
        case 16:
          objc_super v7 = @"E_DOWNSTREAM_SERVICE_THROTTLED";
          break;
        case 17:
          objc_super v7 = @"E_DRIVE_USER_QUOTA_EXCEEDED";
          break;
        case 18:
          objc_super v7 = @"E_DRIVE_GROUP_QUOTA_EXCEEDED";
          break;
        case 19:
          objc_super v7 = @"E_DRIVE_ORG_QUOTA_EXCEEDED";
          break;
        case 20:
          objc_super v7 = @"E_RECORD_LIMIT_EXCEEDED";
          break;
        case 21:
          objc_super v7 = @"E_DISALLOWED_COUNTRY_CODE";
          break;
        default:
          objc_super v7 = @"UNKNOWN_CODE";
          switch((int)v6)
          {
            case 0:
              goto LABEL_45;
            case 1:
              objc_super v7 = @"S_OK";
              break;
            case 2:
              objc_super v7 = @"E_ERROR";
              break;
            case 3:
              objc_super v7 = @"S_MIXED_RESPONSE";
              break;
            case 4:
              objc_super v7 = @"S_OK_HAS_MORE_DATA";
              break;
            case 5:
              objc_super v7 = @"S_PROCESSING";
              break;
            default:
              goto LABEL_44;
          }
          break;
      }
    }
LABEL_45:
    [v3 setObject:v7 forKey:@"code"];
  }
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  message = self->_message;
  if (message) {
    [v3 setObject:message forKey:@"message"];
  }
  internalMessage = self->_internalMessage;
  if (internalMessage) {
    [v3 setObject:internalMessage forKey:@"internal_message"];
  }
  if ([(NSMutableArray *)self->_serverAlerts count])
  {
    id v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_serverAlerts, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v13 = self->_serverAlerts;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v20 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKey:@"server_alerts"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D3710((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_key) {
    PBDataWriterWriteStringField();
  }
  if (self->_message) {
    PBDataWriterWriteStringField();
  }
  if (self->_internalMessage) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = self->_serverAlerts;
  uint64_t v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_code;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v9 = v4;
  if (self->_key) {
    objc_msgSend(v4, "setKey:");
  }
  if (self->_message) {
    objc_msgSend(v9, "setMessage:");
  }
  if (self->_internalMessage) {
    objc_msgSend(v9, "setInternalMessage:");
  }
  if ([(PDDPStatus *)self serverAlertsCount])
  {
    [v9 clearServerAlerts];
    unint64_t v5 = [(PDDPStatus *)self serverAlertsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPStatus *)self serverAlertsAtIndex:i];
        [v9 addServerAlerts:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_code;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v7 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(NSString *)self->_message copyWithZone:a3];
  long long v10 = (void *)v6[4];
  v6[4] = v9;

  id v11 = [(NSString *)self->_internalMessage copyWithZone:a3];
  long long v12 = (void *)v6[2];
  v6[2] = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_serverAlerts;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [v6 addServerAlerts:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
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
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_code != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3) && !-[NSString isEqual:](key, "isEqual:")) {
    goto LABEL_15;
  }
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](message, "isEqual:")) {
      goto LABEL_15;
    }
  }
  internalMessage = self->_internalMessage;
  if ((unint64_t)internalMessage | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](internalMessage, "isEqual:")) {
      goto LABEL_15;
    }
  }
  serverAlerts = self->_serverAlerts;
  if ((unint64_t)serverAlerts | *((void *)v4 + 5)) {
    unsigned __int8 v9 = -[NSMutableArray isEqual:](serverAlerts, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_code;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_key hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_message hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_internalMessage hash];
  return v6 ^ (unint64_t)[(NSMutableArray *)self->_serverAlerts hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[12])
  {
    self->_int code = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[PDDPStatus setKey:](self, "setKey:");
  }
  if (*((void *)v5 + 4)) {
    -[PDDPStatus setMessage:](self, "setMessage:");
  }
  if (*((void *)v5 + 2)) {
    -[PDDPStatus setInternalMessage:](self, "setInternalMessage:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 5);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PDDPStatus addServerAlerts:](self, "addServerAlerts:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)internalMessage
{
  return self->_internalMessage;
}

- (void)setInternalMessage:(id)a3
{
}

- (NSMutableArray)serverAlerts
{
  return self->_serverAlerts;
}

- (void)setServerAlerts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverAlerts, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_internalMessage, 0);
}

@end