@interface NWPBPath
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NWPBPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_directInterface, 0);
  objc_storeStrong((id *)&self->_delegateInterface, 0);
  objc_storeStrong((id *)&self->_clientUUID, 0);

  objc_storeStrong((id *)&self->_agents, 0);
}

- (unint64_t)hash
{
  unint64_t v3 = [(NWPBEndpoint *)self->_endpoint hash];
  unint64_t v4 = [(NWPBParameters *)self->_parameters hash];
  NSUInteger v5 = [(NSString *)self->_clientUUID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_status;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(NWPBInterface *)self->_directInterface hash];
  unint64_t v8 = [(NWPBInterface *)self->_delegateInterface hash];
  uint64_t v9 = [(NSMutableArray *)self->_agents hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_ipv4;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v11 = 2654435761 * self->_ipv6;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v12 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v13 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v12 = 2654435761 * self->_local;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v13 = 2654435761 * self->_direct;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  endpoint = self->_endpoint;
  if ((unint64_t)endpoint | *((void *)v4 + 5))
  {
    if (!-[NWPBEndpoint isEqual:](endpoint, "isEqual:")) {
      goto LABEL_45;
    }
  }
  parameters = self->_parameters;
  if ((unint64_t)parameters | *((void *)v4 + 6))
  {
    if (!-[NWPBParameters isEqual:](parameters, "isEqual:")) {
      goto LABEL_45;
    }
  }
  clientUUID = self->_clientUUID;
  if ((unint64_t)clientUUID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientUUID, "isEqual:")) {
      goto LABEL_45;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_status != *((_DWORD *)v4 + 14)) {
      goto LABEL_45;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_45;
  }
  directInterface = self->_directInterface;
  if ((unint64_t)directInterface | *((void *)v4 + 4)
    && !-[NWPBInterface isEqual:](directInterface, "isEqual:"))
  {
    goto LABEL_45;
  }
  delegateInterface = self->_delegateInterface;
  if ((unint64_t)delegateInterface | *((void *)v4 + 3))
  {
    if (!-[NWPBInterface isEqual:](delegateInterface, "isEqual:")) {
      goto LABEL_45;
    }
  }
  agents = self->_agents;
  if ((unint64_t)agents | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](agents, "isEqual:")) {
      goto LABEL_45;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) == 0) {
      goto LABEL_45;
    }
    if (self->_ipv4)
    {
      if (!*((unsigned char *)v4 + 61)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 61))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0) {
      goto LABEL_45;
    }
    if (self->_ipv6)
    {
      if (!*((unsigned char *)v4 + 62)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 62))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0) {
      goto LABEL_45;
    }
    if (self->_local)
    {
      if (!*((unsigned char *)v4 + 63)) {
        goto LABEL_45;
      }
    }
    else if (*((unsigned char *)v4 + 63))
    {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_45;
  }
  BOOL v11 = (*((unsigned char *)v4 + 64) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) != 0)
    {
      if (self->_direct)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_45;
        }
      }
      else if (*((unsigned char *)v4 + 60))
      {
        goto LABEL_45;
      }
      BOOL v11 = 1;
      goto LABEL_46;
    }
LABEL_45:
    BOOL v11 = 0;
  }
LABEL_46:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NWPBEndpoint *)self->_endpoint copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  id v8 = [(NWPBParameters *)self->_parameters copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_clientUUID copyWithZone:a3];
  BOOL v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 56) = self->_status;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  id v12 = [(NWPBInterface *)self->_directInterface copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  id v14 = [(NWPBInterface *)self->_delegateInterface copyWithZone:a3];
  v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v16 = self->_agents;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = (id)[*(id *)(*((void *)&v27 + 1) + 8 * i) copyWithZone:a3];
        v22 = *(void **)(v5 + 8);
        if (!v22)
        {
          id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v24 = *(void **)(v5 + 8);
          *(void *)(v5 + 8) = v23;

          v22 = *(void **)(v5 + 8);
        }
        [v22 addObject:v21];
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v18);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 61) = self->_ipv4;
    *(unsigned char *)(v5 + 64) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_14:
      if ((has & 0x10) == 0) {
        goto LABEL_15;
      }
LABEL_20:
      *(unsigned char *)(v5 + 63) = self->_local;
      *(unsigned char *)(v5 + 64) |= 0x10u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        return (id)v5;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_14;
  }
  *(unsigned char *)(v5 + 62) = self->_ipv6;
  *(unsigned char *)(v5 + 64) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_20;
  }
LABEL_15:
  if ((has & 2) != 0)
  {
LABEL_16:
    *(unsigned char *)(v5 + 60) = self->_direct;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  return (id)v5;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_endpoint) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_parameters) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_clientUUID) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_directInterface) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_delegateInterface) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_agents;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_22:
      if ((has & 0x10) == 0) {
        goto LABEL_23;
      }
LABEL_28:
      PBDataWriterWriteBOOLField();
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_22;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_28;
  }
LABEL_23:
  if ((has & 2) != 0) {
LABEL_24:
  }
    PBDataWriterWriteBOOLField();
LABEL_25:
}

- (BOOL)readFrom:(id)a3
{
  return NWPBPathReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  endpoint = self->_endpoint;
  if (endpoint)
  {
    uint64_t v5 = [(NWPBEndpoint *)endpoint dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"endpoint"];
  }
  parameters = self->_parameters;
  if (parameters)
  {
    uint64_t v7 = [(NWPBParameters *)parameters dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"parameters"];
  }
  clientUUID = self->_clientUUID;
  if (clientUUID) {
    [v3 setObject:clientUUID forKey:@"clientUUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t status = self->_status;
    if (status >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = off_1E52485A8[status];
    }
    [v3 setObject:v10 forKey:@"status"];
  }
  directInterface = self->_directInterface;
  if (directInterface)
  {
    long long v12 = [(NWPBInterface *)directInterface dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"directInterface"];
  }
  delegateInterface = self->_delegateInterface;
  if (delegateInterface)
  {
    long long v14 = [(NWPBInterface *)delegateInterface dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"delegateInterface"];
  }
  if ([(NSMutableArray *)self->_agents count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_agents, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v16 = self->_agents;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"agents"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v25 = [NSNumber numberWithBool:self->_ipv4];
    [v3 setObject:v25 forKey:@"ipv4"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_27:
      if ((has & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_27;
  }
  v26 = [NSNumber numberWithBool:self->_ipv6];
  [v3 setObject:v26 forKey:@"ipv6"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_28:
    if ((has & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_35:
  long long v27 = [NSNumber numberWithBool:self->_local];
  [v3 setObject:v27 forKey:@"local"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_29:
    id v23 = [NSNumber numberWithBool:self->_direct];
    [v3 setObject:v23 forKey:@"direct"];
  }
LABEL_30:

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NWPBPath;
  id v4 = [(NWPBPath *)&v8 description];
  uint64_t v5 = [(NWPBPath *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end