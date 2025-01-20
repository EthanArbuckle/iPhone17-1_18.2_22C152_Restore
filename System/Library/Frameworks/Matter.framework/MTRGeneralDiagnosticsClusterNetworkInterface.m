@interface MTRGeneralDiagnosticsClusterNetworkInterface
- (MTRGeneralDiagnosticsClusterNetworkInterface)init;
- (NSArray)iPv4Addresses;
- (NSArray)iPv6Addresses;
- (NSData)hardwareAddress;
- (NSNumber)isOperational;
- (NSNumber)offPremiseServicesReachableIPv4;
- (NSNumber)offPremiseServicesReachableIPv6;
- (NSNumber)type;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHardwareAddress:(NSData *)hardwareAddress;
- (void)setIPv4Addresses:(NSArray *)iPv4Addresses;
- (void)setIPv6Addresses:(NSArray *)iPv6Addresses;
- (void)setIsOperational:(NSNumber *)isOperational;
- (void)setName:(NSString *)name;
- (void)setOffPremiseServicesReachableIPv4:(NSNumber *)offPremiseServicesReachableIPv4;
- (void)setOffPremiseServicesReachableIPv6:(NSNumber *)offPremiseServicesReachableIPv6;
- (void)setType:(NSNumber *)type;
@end

@implementation MTRGeneralDiagnosticsClusterNetworkInterface

- (MTRGeneralDiagnosticsClusterNetworkInterface)init
{
  v22.receiver = self;
  v22.super_class = (Class)MTRGeneralDiagnosticsClusterNetworkInterface;
  v2 = [(MTRGeneralDiagnosticsClusterNetworkInterface *)&v22 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_26F969DC8;

    isOperational = v3->_isOperational;
    v3->_isOperational = (NSNumber *)&unk_26F9C8620;

    offPremiseServicesReachableIPv4 = v3->_offPremiseServicesReachableIPv4;
    v3->_offPremiseServicesReachableIPv4 = 0;

    offPremiseServicesReachableIPv6 = v3->_offPremiseServicesReachableIPv6;
    v3->_offPremiseServicesReachableIPv6 = 0;

    uint64_t v10 = objc_msgSend_data(MEMORY[0x263EFF8F8], v8, v9);
    hardwareAddress = v3->_hardwareAddress;
    v3->_hardwareAddress = (NSData *)v10;

    uint64_t v14 = objc_msgSend_array(MEMORY[0x263EFF8C0], v12, v13);
    iPv4Addresses = v3->_iPv4Addresses;
    v3->_iPv4Addresses = (NSArray *)v14;

    uint64_t v18 = objc_msgSend_array(MEMORY[0x263EFF8C0], v16, v17);
    iPv6Addresses = v3->_iPv6Addresses;
    v3->_iPv6Addresses = (NSArray *)v18;

    type = v3->_type;
    v3->_type = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGeneralDiagnosticsClusterNetworkInterface);
  v7 = objc_msgSend_name(self, v5, v6);
  objc_msgSend_setName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_isOperational(self, v9, v10);
  objc_msgSend_setIsOperational_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_offPremiseServicesReachableIPv4(self, v13, v14);
  objc_msgSend_setOffPremiseServicesReachableIPv4_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_offPremiseServicesReachableIPv6(self, v17, v18);
  objc_msgSend_setOffPremiseServicesReachableIPv6_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_hardwareAddress(self, v21, v22);
  objc_msgSend_setHardwareAddress_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_iPv4Addresses(self, v25, v26);
  objc_msgSend_setIPv4Addresses_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_iPv6Addresses(self, v29, v30);
  objc_msgSend_setIPv6Addresses_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_type(self, v33, v34);
  objc_msgSend_setType_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  name = self->_name;
  isOperational = self->_isOperational;
  offPremiseServicesReachableIPv4 = self->_offPremiseServicesReachableIPv4;
  offPremiseServicesReachableIPuint64_t v6 = self->_offPremiseServicesReachableIPv6;
  v11 = objc_msgSend_base64EncodedStringWithOptions_(self->_hardwareAddress, v10, 0);
  objc_msgSend_stringWithFormat_(v3, v12, @"<%@: name:%@; isOperational:%@; offPremiseServicesReachableIPv4:%@; offPremiseServicesReachableIPv6:%@; hardwareAddress:%@; iPv4Addresses:%@; iPv6Addresses:%@; type:%@; >",
    v5,
    name,
    isOperational,
    offPremiseServicesReachableIPv4,
    offPremiseServicesReachableIPv6,
    v11,
    self->_iPv4Addresses,
    self->_iPv6Addresses,
  uint64_t v13 = self->_type);

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (NSNumber)isOperational
{
  return self->_isOperational;
}

- (void)setIsOperational:(NSNumber *)isOperational
{
}

- (NSNumber)offPremiseServicesReachableIPv4
{
  return self->_offPremiseServicesReachableIPv4;
}

- (void)setOffPremiseServicesReachableIPv4:(NSNumber *)offPremiseServicesReachableIPv4
{
}

- (NSNumber)offPremiseServicesReachableIPv6
{
  return self->_offPremiseServicesReachableIPv6;
}

- (void)setOffPremiseServicesReachableIPv6:(NSNumber *)offPremiseServicesReachableIPv6
{
}

- (NSData)hardwareAddress
{
  return self->_hardwareAddress;
}

- (void)setHardwareAddress:(NSData *)hardwareAddress
{
}

- (NSArray)iPv4Addresses
{
  return self->_iPv4Addresses;
}

- (void)setIPv4Addresses:(NSArray *)iPv4Addresses
{
}

- (NSArray)iPv6Addresses
{
  return self->_iPv6Addresses;
}

- (void)setIPv6Addresses:(NSArray *)iPv6Addresses
{
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(NSNumber *)type
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_iPv6Addresses, 0);
  objc_storeStrong((id *)&self->_iPv4Addresses, 0);
  objc_storeStrong((id *)&self->_hardwareAddress, 0);
  objc_storeStrong((id *)&self->_offPremiseServicesReachableIPv6, 0);
  objc_storeStrong((id *)&self->_offPremiseServicesReachableIPv4, 0);
  objc_storeStrong((id *)&self->_isOperational, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end