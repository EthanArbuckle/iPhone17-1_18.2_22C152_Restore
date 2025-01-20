@interface HMRemoteEventRouterProtoServerDiagnosticInfo
+ (Class)connectedClientsType;
- (BOOL)hasConnectionState;
- (BOOL)hasLastConnected;
- (BOOL)hasMode;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)connectedClients;
- (double)lastConnected;
- (id)connectedClientsAtIndex:(unint64_t)a3;
- (id)connectionStateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)modeAsString:(int)a3;
- (int)StringAsConnectionState:(id)a3;
- (int)StringAsMode:(id)a3;
- (int)connectionState;
- (int)mode;
- (unint64_t)connectedClientsCount;
- (unint64_t)hash;
- (unint64_t)version;
- (void)addConnectedClients:(id)a3;
- (void)clearConnectedClients;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectedClients:(id)a3;
- (void)setConnectionState:(int)a3;
- (void)setHasConnectionState:(BOOL)a3;
- (void)setHasLastConnected:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setLastConnected:(double)a3;
- (void)setMode:(int)a3;
- (void)setVersion:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMRemoteEventRouterProtoServerDiagnosticInfo

- (void).cxx_destruct
{
}

- (void)setConnectedClients:(id)a3
{
}

- (NSMutableArray)connectedClients
{
  return self->_connectedClients;
}

- (double)lastConnected
{
  return self->_lastConnected;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 40);
  if ((v6 & 2) != 0)
  {
    self->_version = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 40);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_mode = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 8u;
  char v6 = *((unsigned char *)v4 + 40);
  if ((v6 & 4) == 0)
  {
LABEL_4:
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  self->_connectionState = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 40))
  {
LABEL_5:
    self->_lastConnected = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 3);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[HMRemoteEventRouterProtoServerDiagnosticInfo addConnectedClients:](self, "addConnectedClients:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_version;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_mode;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v5 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v10 = 0;
      return v4 ^ v3 ^ v5 ^ v10 ^ [(NSMutableArray *)self->_connectedClients hash];
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_connectionState;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double lastConnected = self->_lastConnected;
  double v7 = -lastConnected;
  if (lastConnected >= 0.0) {
    double v7 = self->_lastConnected;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ [(NSMutableArray *)self->_connectedClients hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_version != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_24:
    char v6 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_mode != *((_DWORD *)v4 + 9)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_connectionState != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_lastConnected != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_24;
  }
  connectedClients = self->_connectedClients;
  if ((unint64_t)connectedClients | *((void *)v4 + 3)) {
    char v6 = -[NSMutableArray isEqual:](connectedClients, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_25:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_version;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 36) = self->_mode;
  *(unsigned char *)(v5 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  *(_DWORD *)(v5 + 32) = self->_connectionState;
  *(unsigned char *)(v5 + 40) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *(double *)(v5 + 8) = self->_lastConnected;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
LABEL_6:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long double v8 = self->_connectedClients;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addConnectedClients:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_version;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_15:
      *((_DWORD *)v4 + 8) = self->_connectionState;
      *((unsigned char *)v4 + 40) |= 4u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_mode;
  *((unsigned char *)v4 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_15;
  }
LABEL_4:
  if (has)
  {
LABEL_5:
    v4[1] = *(void *)&self->_lastConnected;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_6:
  id v10 = v4;
  if ([(HMRemoteEventRouterProtoServerDiagnosticInfo *)self connectedClientsCount])
  {
    [v10 clearConnectedClients];
    unint64_t v6 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)self connectedClientsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)self connectedClientsAtIndex:i];
        [v10 addConnectedClients:v9];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_connectedClients;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMRemoteEventRouterProtoServerDiagnosticInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    long long v14 = [NSNumber numberWithUnsignedLongLong:self->_version];
    [v3 setObject:v14 forKey:@"version"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  uint64_t mode = self->_mode;
  if (mode >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mode);
    uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v16 = off_1E5942DD0[mode];
  }
  [v3 setObject:v16 forKey:@"mode"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  uint64_t connectionState = self->_connectionState;
  if (connectionState >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_connectionState);
    long long v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v18 = off_1E5942DE8[connectionState];
  }
  [v3 setObject:v18 forKey:@"connectionState"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    uint64_t v5 = [NSNumber numberWithDouble:self->_lastConnected];
    [v3 setObject:v5 forKey:@"lastConnected"];
  }
LABEL_6:
  if ([(NSMutableArray *)self->_connectedClients count])
  {
    unint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_connectedClients, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = self->_connectedClients;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"connectedClients"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMRemoteEventRouterProtoServerDiagnosticInfo;
  id v4 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)&v8 description];
  uint64_t v5 = [(HMRemoteEventRouterProtoServerDiagnosticInfo *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)connectedClientsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_connectedClients objectAtIndex:a3];
}

- (unint64_t)connectedClientsCount
{
  return [(NSMutableArray *)self->_connectedClients count];
}

- (void)addConnectedClients:(id)a3
{
  id v4 = a3;
  connectedClients = self->_connectedClients;
  id v8 = v4;
  if (!connectedClients)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_connectedClients;
    self->_connectedClients = v6;

    id v4 = v8;
    connectedClients = self->_connectedClients;
  }
  [(NSMutableArray *)connectedClients addObject:v4];
}

- (void)clearConnectedClients
{
}

- (BOOL)hasLastConnected
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasLastConnected:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setLastConnected:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double lastConnected = a3;
}

- (int)StringAsConnectionState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Connected"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Disconnected"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)connectionStateAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5942DE8[a3];
  }

  return v3;
}

- (BOOL)hasConnectionState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasConnectionState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setConnectionState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t connectionState = a3;
}

- (int)connectionState
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_connectionState;
  }
  else {
    return 0;
  }
}

- (int)StringAsMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Primary"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Resident"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)modeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5942DD0[a3];
  }

  return v3;
}

- (BOOL)hasMode
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setMode:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t mode = a3;
}

- (int)mode
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_mode;
  }
  else {
    return 0;
  }
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setVersion:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

+ (Class)connectedClientsType
{
  return (Class)objc_opt_class();
}

@end