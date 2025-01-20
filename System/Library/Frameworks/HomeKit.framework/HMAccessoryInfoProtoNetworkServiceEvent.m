@interface HMAccessoryInfoProtoNetworkServiceEvent
+ (Class)ipv4AddressesType;
+ (Class)ipv6AddressesType;
- (BOOL)hasConfirmedIfaceName;
- (BOOL)hasIfaceName;
- (BOOL)hasIsPrimary;
- (BOOL)hasMacAddress;
- (BOOL)hasNetworkSignatureV4;
- (BOOL)hasNetworkSignatureV6;
- (BOOL)hasRouterIPv4;
- (BOOL)hasRouterIPv6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimary;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)ipv4Addresses;
- (NSMutableArray)ipv6Addresses;
- (NSString)confirmedIfaceName;
- (NSString)ifaceName;
- (NSString)macAddress;
- (NSString)networkSignatureV4;
- (NSString)networkSignatureV6;
- (NSString)routerIPv4;
- (NSString)routerIPv6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ipv4AddressesAtIndex:(unint64_t)a3;
- (id)ipv6AddressesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)ipv4AddressesCount;
- (unint64_t)ipv6AddressesCount;
- (void)addIpv4Addresses:(id)a3;
- (void)addIpv6Addresses:(id)a3;
- (void)clearIpv4Addresses;
- (void)clearIpv6Addresses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfirmedIfaceName:(id)a3;
- (void)setHasIsPrimary:(BOOL)a3;
- (void)setIfaceName:(id)a3;
- (void)setIpv4Addresses:(id)a3;
- (void)setIpv6Addresses:(id)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setMacAddress:(id)a3;
- (void)setNetworkSignatureV4:(id)a3;
- (void)setNetworkSignatureV6:(id)a3;
- (void)setRouterIPv4:(id)a3;
- (void)setRouterIPv6:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryInfoProtoNetworkServiceEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routerIPv6, 0);
  objc_storeStrong((id *)&self->_routerIPv4, 0);
  objc_storeStrong((id *)&self->_networkSignatureV6, 0);
  objc_storeStrong((id *)&self->_networkSignatureV4, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_ipv4Addresses, 0);
  objc_storeStrong((id *)&self->_ifaceName, 0);

  objc_storeStrong((id *)&self->_confirmedIfaceName, 0);
}

- (void)setRouterIPv6:(id)a3
{
}

- (NSString)routerIPv6
{
  return self->_routerIPv6;
}

- (void)setNetworkSignatureV6:(id)a3
{
}

- (NSString)networkSignatureV6
{
  return self->_networkSignatureV6;
}

- (void)setIpv6Addresses:(id)a3
{
}

- (NSMutableArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setRouterIPv4:(id)a3
{
}

- (NSString)routerIPv4
{
  return self->_routerIPv4;
}

- (void)setNetworkSignatureV4:(id)a3
{
}

- (NSString)networkSignatureV4
{
  return self->_networkSignatureV4;
}

- (void)setIpv4Addresses:(id)a3
{
}

- (NSMutableArray)ipv4Addresses
{
  return self->_ipv4Addresses;
}

- (void)setConfirmedIfaceName:(id)a3
{
}

- (NSString)confirmedIfaceName
{
  return self->_confirmedIfaceName;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setMacAddress:(id)a3
{
}

- (NSString)macAddress
{
  return self->_macAddress;
}

- (void)setIfaceName:(id)a3
{
}

- (NSString)ifaceName
{
  return self->_ifaceName;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[HMAccessoryInfoProtoNetworkServiceEvent setIfaceName:](self, "setIfaceName:");
  }
  if (*((void *)v4 + 5)) {
    -[HMAccessoryInfoProtoNetworkServiceEvent setMacAddress:](self, "setMacAddress:");
  }
  if (*((unsigned char *)v4 + 84))
  {
    self->_isPrimary = *((unsigned char *)v4 + 80);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[HMAccessoryInfoProtoNetworkServiceEvent setConfirmedIfaceName:](self, "setConfirmedIfaceName:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HMAccessoryInfoProtoNetworkServiceEvent *)self addIpv4Addresses:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 6)) {
    -[HMAccessoryInfoProtoNetworkServiceEvent setNetworkSignatureV4:](self, "setNetworkSignatureV4:");
  }
  if (*((void *)v4 + 8)) {
    [(HMAccessoryInfoProtoNetworkServiceEvent *)self setRouterIPv4:"setRouterIPv4:"];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[HMAccessoryInfoProtoNetworkServiceEvent addIpv6Addresses:](self, "addIpv6Addresses:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 7)) {
    -[HMAccessoryInfoProtoNetworkServiceEvent setNetworkSignatureV6:](self, "setNetworkSignatureV6:");
  }
  if (*((void *)v4 + 9)) {
    [(HMAccessoryInfoProtoNetworkServiceEvent *)self setRouterIPv6:"setRouterIPv6:"];
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_ifaceName hash];
  NSUInteger v4 = [(NSString *)self->_macAddress hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_isPrimary;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_confirmedIfaceName hash];
  uint64_t v7 = [(NSMutableArray *)self->_ipv4Addresses hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_networkSignatureV4 hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_routerIPv4 hash];
  uint64_t v10 = [(NSMutableArray *)self->_ipv6Addresses hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_networkSignatureV6 hash];
  return v9 ^ v11 ^ [(NSString *)self->_routerIPv6 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  ifaceName = self->_ifaceName;
  if ((unint64_t)ifaceName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](ifaceName, "isEqual:")) {
      goto LABEL_28;
    }
  }
  macAddress = self->_macAddress;
  if ((unint64_t)macAddress | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](macAddress, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 84))
    {
      if (self->_isPrimary)
      {
        if (!*((unsigned char *)v4 + 80)) {
          goto LABEL_28;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 80)) {
        goto LABEL_14;
      }
    }
LABEL_28:
    char v14 = 0;
    goto LABEL_29;
  }
  if (*((unsigned char *)v4 + 84)) {
    goto LABEL_28;
  }
LABEL_14:
  confirmedIfaceName = self->_confirmedIfaceName;
  if ((unint64_t)confirmedIfaceName | *((void *)v4 + 1)
    && !-[NSString isEqual:](confirmedIfaceName, "isEqual:"))
  {
    goto LABEL_28;
  }
  ipv4Addresses = self->_ipv4Addresses;
  if ((unint64_t)ipv4Addresses | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](ipv4Addresses, "isEqual:")) {
      goto LABEL_28;
    }
  }
  networkSignatureV4 = self->_networkSignatureV4;
  if ((unint64_t)networkSignatureV4 | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](networkSignatureV4, "isEqual:")) {
      goto LABEL_28;
    }
  }
  routerIPid v4 = self->_routerIPv4;
  if ((unint64_t)routerIPv4 | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](routerIPv4, "isEqual:")) {
      goto LABEL_28;
    }
  }
  ipv6Addresses = self->_ipv6Addresses;
  if ((unint64_t)ipv6Addresses | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](ipv6Addresses, "isEqual:")) {
      goto LABEL_28;
    }
  }
  networkSignatureV6 = self->_networkSignatureV6;
  if ((unint64_t)networkSignatureV6 | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](networkSignatureV6, "isEqual:")) {
      goto LABEL_28;
    }
  }
  routerIPNSUInteger v6 = self->_routerIPv6;
  if ((unint64_t)routerIPv6 | *((void *)v4 + 9)) {
    char v14 = -[NSString isEqual:](routerIPv6, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_29:

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_ifaceName copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_macAddress copyWithZone:a3];
  NSUInteger v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 80) = self->_isPrimary;
    *(unsigned char *)(v5 + 84) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_confirmedIfaceName copyWithZone:a3];
  NSUInteger v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v12 = self->_ipv4Addresses;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v38;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v16) copyWithZone:a3];
        [(id)v5 addIpv4Addresses:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_networkSignatureV4 copyWithZone:a3];
  long long v19 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v18;

  uint64_t v20 = [(NSString *)self->_routerIPv4 copyWithZone:a3];
  long long v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v22 = self->_ipv6Addresses;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v26), "copyWithZone:", a3, (void)v33);
        [(id)v5 addIpv6Addresses:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v24);
  }

  uint64_t v28 = [(NSString *)self->_networkSignatureV6 copyWithZone:a3];
  v29 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v28;

  uint64_t v30 = [(NSString *)self->_routerIPv6 copyWithZone:a3];
  v31 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v30;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v14 = v4;
  if (self->_ifaceName)
  {
    objc_msgSend(v4, "setIfaceName:");
    id v4 = v14;
  }
  if (self->_macAddress)
  {
    objc_msgSend(v14, "setMacAddress:");
    id v4 = v14;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[80] = self->_isPrimary;
    v4[84] |= 1u;
  }
  if (self->_confirmedIfaceName) {
    objc_msgSend(v14, "setConfirmedIfaceName:");
  }
  if ([(HMAccessoryInfoProtoNetworkServiceEvent *)self ipv4AddressesCount])
  {
    [v14 clearIpv4Addresses];
    unint64_t v5 = [(HMAccessoryInfoProtoNetworkServiceEvent *)self ipv4AddressesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(HMAccessoryInfoProtoNetworkServiceEvent *)self ipv4AddressesAtIndex:i];
        [v14 addIpv4Addresses:v8];
      }
    }
  }
  if (self->_networkSignatureV4) {
    objc_msgSend(v14, "setNetworkSignatureV4:");
  }
  if (self->_routerIPv4) {
    objc_msgSend(v14, "setRouterIPv4:");
  }
  if ([(HMAccessoryInfoProtoNetworkServiceEvent *)self ipv6AddressesCount])
  {
    [v14 clearIpv6Addresses];
    unint64_t v9 = [(HMAccessoryInfoProtoNetworkServiceEvent *)self ipv6AddressesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(HMAccessoryInfoProtoNetworkServiceEvent *)self ipv6AddressesAtIndex:j];
        [v14 addIpv6Addresses:v12];
      }
    }
  }
  if (self->_networkSignatureV6) {
    objc_msgSend(v14, "setNetworkSignatureV6:");
  }
  uint64_t v13 = v14;
  if (self->_routerIPv6)
  {
    objc_msgSend(v14, "setRouterIPv6:");
    uint64_t v13 = v14;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_ifaceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_macAddress) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_confirmedIfaceName) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v5 = self->_ipv4Addresses;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  if (self->_networkSignatureV4) {
    PBDataWriterWriteStringField();
  }
  if (self->_routerIPv4) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v10 = self->_ipv6Addresses;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_networkSignatureV6) {
    PBDataWriterWriteStringField();
  }
  if (self->_routerIPv6) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoNetworkServiceEventReadFrom(self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  ifaceName = self->_ifaceName;
  if (ifaceName) {
    [v3 setObject:ifaceName forKey:@"ifaceName"];
  }
  macAddress = self->_macAddress;
  if (macAddress) {
    [v4 setObject:macAddress forKey:@"macAddress"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = [NSNumber numberWithBool:self->_isPrimary];
    [v4 setObject:v7 forKey:@"isPrimary"];
  }
  confirmedIfaceName = self->_confirmedIfaceName;
  if (confirmedIfaceName) {
    [v4 setObject:confirmedIfaceName forKey:@"confirmedIfaceName"];
  }
  ipv4Addresses = self->_ipv4Addresses;
  if (ipv4Addresses) {
    [v4 setObject:ipv4Addresses forKey:@"ipv4Addresses"];
  }
  networkSignatureV4 = self->_networkSignatureV4;
  if (networkSignatureV4) {
    [v4 setObject:networkSignatureV4 forKey:@"networkSignatureV4"];
  }
  routerIPid v4 = self->_routerIPv4;
  if (routerIPv4) {
    [v4 setObject:routerIPv4 forKey:@"routerIPv4"];
  }
  ipv6Addresses = self->_ipv6Addresses;
  if (ipv6Addresses) {
    [v4 setObject:ipv6Addresses forKey:@"ipv6Addresses"];
  }
  networkSignatureV6 = self->_networkSignatureV6;
  if (networkSignatureV6) {
    [v4 setObject:networkSignatureV6 forKey:@"networkSignatureV6"];
  }
  routerIPuint64_t v6 = self->_routerIPv6;
  if (routerIPv6) {
    [v4 setObject:routerIPv6 forKey:@"routerIPv6"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoNetworkServiceEvent;
  id v4 = [(HMAccessoryInfoProtoNetworkServiceEvent *)&v8 description];
  unint64_t v5 = [(HMAccessoryInfoProtoNetworkServiceEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRouterIPv6
{
  return self->_routerIPv6 != 0;
}

- (BOOL)hasNetworkSignatureV6
{
  return self->_networkSignatureV6 != 0;
}

- (id)ipv6AddressesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ipv6Addresses objectAtIndex:a3];
}

- (unint64_t)ipv6AddressesCount
{
  return [(NSMutableArray *)self->_ipv6Addresses count];
}

- (void)addIpv6Addresses:(id)a3
{
  id v4 = a3;
  ipv6Addresses = self->_ipv6Addresses;
  id v8 = v4;
  if (!ipv6Addresses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_ipv6Addresses;
    self->_ipv6Addresses = v6;

    id v4 = v8;
    ipv6Addresses = self->_ipv6Addresses;
  }
  [(NSMutableArray *)ipv6Addresses addObject:v4];
}

- (void)clearIpv6Addresses
{
}

- (BOOL)hasRouterIPv4
{
  return self->_routerIPv4 != 0;
}

- (BOOL)hasNetworkSignatureV4
{
  return self->_networkSignatureV4 != 0;
}

- (id)ipv4AddressesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_ipv4Addresses objectAtIndex:a3];
}

- (unint64_t)ipv4AddressesCount
{
  return [(NSMutableArray *)self->_ipv4Addresses count];
}

- (void)addIpv4Addresses:(id)a3
{
  id v4 = a3;
  ipv4Addresses = self->_ipv4Addresses;
  id v8 = v4;
  if (!ipv4Addresses)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_ipv4Addresses;
    self->_ipv4Addresses = v6;

    id v4 = v8;
    ipv4Addresses = self->_ipv4Addresses;
  }
  [(NSMutableArray *)ipv4Addresses addObject:v4];
}

- (void)clearIpv4Addresses
{
}

- (BOOL)hasConfirmedIfaceName
{
  return self->_confirmedIfaceName != 0;
}

- (BOOL)hasIsPrimary
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasIsPrimary:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setIsPrimary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isPrimary = a3;
}

- (BOOL)hasMacAddress
{
  return self->_macAddress != 0;
}

- (BOOL)hasIfaceName
{
  return self->_ifaceName != 0;
}

+ (Class)ipv6AddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)ipv4AddressesType
{
  return (Class)objc_opt_class();
}

@end