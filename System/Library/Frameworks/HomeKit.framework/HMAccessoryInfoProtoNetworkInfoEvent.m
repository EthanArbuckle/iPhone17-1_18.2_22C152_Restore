@interface HMAccessoryInfoProtoNetworkInfoEvent
+ (Class)ipv4AddressesType;
+ (Class)ipv6AddressesType;
- (BOOL)hasIfaceName;
- (BOOL)hasMacAddress;
- (BOOL)hasType;
- (BOOL)hasWifiInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMAccessoryInfoProtoAirportInfoEvent)wifiInfo;
- (NSMutableArray)ipv4Addresses;
- (NSMutableArray)ipv6Addresses;
- (NSString)ifaceName;
- (NSString)macAddress;
- (NSString)type;
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
- (void)setIfaceName:(id)a3;
- (void)setIpv4Addresses:(id)a3;
- (void)setIpv6Addresses:(id)a3;
- (void)setMacAddress:(id)a3;
- (void)setType:(id)a3;
- (void)setWifiInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMAccessoryInfoProtoNetworkInfoEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiInfo, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_ipv4Addresses, 0);

  objc_storeStrong((id *)&self->_ifaceName, 0);
}

- (void)setWifiInfo:(id)a3
{
}

- (HMAccessoryInfoProtoAirportInfoEvent)wifiInfo
{
  return self->_wifiInfo;
}

- (void)setIpv6Addresses:(id)a3
{
}

- (NSMutableArray)ipv6Addresses
{
  return self->_ipv6Addresses;
}

- (void)setIpv4Addresses:(id)a3
{
}

- (NSMutableArray)ipv4Addresses
{
  return self->_ipv4Addresses;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[HMAccessoryInfoProtoNetworkInfoEvent setIfaceName:](self, "setIfaceName:");
  }
  if (*((void *)v4 + 4)) {
    -[HMAccessoryInfoProtoNetworkInfoEvent setMacAddress:](self, "setMacAddress:");
  }
  if (*((void *)v4 + 5)) {
    -[HMAccessoryInfoProtoNetworkInfoEvent setType:](self, "setType:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HMAccessoryInfoProtoNetworkInfoEvent *)self addIpv4Addresses:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        -[HMAccessoryInfoProtoNetworkInfoEvent addIpv6Addresses:](self, "addIpv6Addresses:", *(void *)(*((void *)&v17 + 1) + 8 * j), (void)v17);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  wifiInfo = self->_wifiInfo;
  uint64_t v16 = *((void *)v4 + 6);
  if (wifiInfo)
  {
    if (v16) {
      -[HMAccessoryInfoProtoAirportInfoEvent mergeFrom:](wifiInfo, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[HMAccessoryInfoProtoNetworkInfoEvent setWifiInfo:](self, "setWifiInfo:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_ifaceName hash];
  NSUInteger v4 = [(NSString *)self->_macAddress hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_type hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_ipv4Addresses hash];
  uint64_t v7 = [(NSMutableArray *)self->_ipv6Addresses hash];
  return v6 ^ v7 ^ [(HMAccessoryInfoProtoAirportInfoEvent *)self->_wifiInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((ifaceName = self->_ifaceName, !((unint64_t)ifaceName | v4[1]))
     || -[NSString isEqual:](ifaceName, "isEqual:"))
    && ((macAddress = self->_macAddress, !((unint64_t)macAddress | v4[4]))
     || -[NSString isEqual:](macAddress, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[5])) || -[NSString isEqual:](type, "isEqual:"))
    && ((ipv4Addresses = self->_ipv4Addresses, !((unint64_t)ipv4Addresses | v4[2]))
     || -[NSMutableArray isEqual:](ipv4Addresses, "isEqual:"))
    && ((ipv6Addresses = self->_ipv6Addresses, !((unint64_t)ipv6Addresses | v4[3]))
     || -[NSMutableArray isEqual:](ipv6Addresses, "isEqual:")))
  {
    wifiInfo = self->_wifiInfo;
    if ((unint64_t)wifiInfo | v4[6]) {
      char v11 = -[HMAccessoryInfoProtoAirportInfoEvent isEqual:](wifiInfo, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_ifaceName copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_macAddress copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_type copyWithZone:a3];
  char v11 = (void *)v5[5];
  v5[5] = v10;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v12 = self->_ipv4Addresses;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v32;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v32 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = (void *)[*(id *)(*((void *)&v31 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addIpv4Addresses:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v14);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v18 = self->_ipv6Addresses;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v22), "copyWithZone:", a3, (void)v27);
        [v5 addIpv6Addresses:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }

  id v24 = [(HMAccessoryInfoProtoAirportInfoEvent *)self->_wifiInfo copyWithZone:a3];
  v25 = (void *)v5[6];
  v5[6] = v24;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_ifaceName) {
    objc_msgSend(v12, "setIfaceName:");
  }
  if (self->_macAddress) {
    objc_msgSend(v12, "setMacAddress:");
  }
  if (self->_type) {
    objc_msgSend(v12, "setType:");
  }
  if ([(HMAccessoryInfoProtoNetworkInfoEvent *)self ipv4AddressesCount])
  {
    [v12 clearIpv4Addresses];
    unint64_t v4 = [(HMAccessoryInfoProtoNetworkInfoEvent *)self ipv4AddressesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(HMAccessoryInfoProtoNetworkInfoEvent *)self ipv4AddressesAtIndex:i];
        [v12 addIpv4Addresses:v7];
      }
    }
  }
  if ([(HMAccessoryInfoProtoNetworkInfoEvent *)self ipv6AddressesCount])
  {
    [v12 clearIpv6Addresses];
    unint64_t v8 = [(HMAccessoryInfoProtoNetworkInfoEvent *)self ipv6AddressesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        char v11 = [(HMAccessoryInfoProtoNetworkInfoEvent *)self ipv6AddressesAtIndex:j];
        [v12 addIpv6Addresses:v11];
      }
    }
  }
  if (self->_wifiInfo) {
    objc_msgSend(v12, "setWifiInfo:");
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
  if (self->_type) {
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

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_ipv6Addresses;
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

  if (self->_wifiInfo) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryInfoProtoNetworkInfoEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
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
  type = self->_type;
  if (type) {
    [v4 setObject:type forKey:@"type"];
  }
  ipv4Addresses = self->_ipv4Addresses;
  if (ipv4Addresses) {
    [v4 setObject:ipv4Addresses forKey:@"ipv4Addresses"];
  }
  ipv6Addresses = self->_ipv6Addresses;
  if (ipv6Addresses) {
    [v4 setObject:ipv6Addresses forKey:@"ipv6Addresses"];
  }
  wifiInfo = self->_wifiInfo;
  if (wifiInfo)
  {
    uint64_t v11 = [(HMAccessoryInfoProtoAirportInfoEvent *)wifiInfo dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"wifiInfo"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoProtoNetworkInfoEvent;
  id v4 = [(HMAccessoryInfoProtoNetworkInfoEvent *)&v8 description];
  unint64_t v5 = [(HMAccessoryInfoProtoNetworkInfoEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasWifiInfo
{
  return self->_wifiInfo != 0;
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

- (BOOL)hasType
{
  return self->_type != 0;
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