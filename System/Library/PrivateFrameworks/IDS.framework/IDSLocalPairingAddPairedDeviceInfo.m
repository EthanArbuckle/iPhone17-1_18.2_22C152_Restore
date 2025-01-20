@interface IDSLocalPairingAddPairedDeviceInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldPairDirectlyOverIPsec;
- (BOOL)supportsIPsecWithSPPLink;
- (IDSLocalPairingAddPairedDeviceInfo)initWithCBUUID:(id)a3 pairingProtocolVersion:(int64_t)a4 BTOutOfBandKey:(id)a5;
- (IDSLocalPairingAddPairedDeviceInfo)initWithCoder:(id)a3;
- (NSData)BTOutOfBandKey;
- (NSData)bluetoothMACAddress;
- (NSUUID)cbuuid;
- (id)description;
- (int64_t)pairingProtocolVersion;
- (int64_t)pairingType;
- (void)encodeWithCoder:(id)a3;
- (void)setBluetoothMACAddress:(id)a3;
- (void)setPairingType:(int64_t)a3;
- (void)setShouldPairDirectlyOverIPsec:(BOOL)a3;
- (void)setSupportsIPsecWithSPPLink:(BOOL)a3;
@end

@implementation IDSLocalPairingAddPairedDeviceInfo

- (IDSLocalPairingAddPairedDeviceInfo)initWithCBUUID:(id)a3 pairingProtocolVersion:(int64_t)a4 BTOutOfBandKey:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSLocalPairingAddPairedDeviceInfo;
  v11 = [(IDSLocalPairingAddPairedDeviceInfo *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cbuuid, a3);
    v12->_pairingProtocolVersion = a4;
    objc_storeStrong((id *)&v12->_BTOutOfBandKey, a5);
    v12->_supportsIPsecWithSPPLink = 0;
    bluetoothMACAddress = v12->_bluetoothMACAddress;
    v12->_bluetoothMACAddress = 0;

    v12->_shouldPairDirectlyOverIPsec = 0;
    v12->_pairingType = 0;
  }

  return v12;
}

- (id)description
{
  v14 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(IDSLocalPairingAddPairedDeviceInfo *)self cbuuid];
  int64_t v6 = [(IDSLocalPairingAddPairedDeviceInfo *)self pairingProtocolVersion];
  v7 = [(IDSLocalPairingAddPairedDeviceInfo *)self BTOutOfBandKey];
  uint64_t v8 = [v7 length];
  uint64_t v9 = [(IDSLocalPairingAddPairedDeviceInfo *)self supportsIPsecWithSPPLink];
  uint64_t v10 = [(IDSLocalPairingAddPairedDeviceInfo *)self shouldPairDirectlyOverIPsec];
  v11 = [(IDSLocalPairingAddPairedDeviceInfo *)self bluetoothMACAddress];
  v12 = [v14 stringWithFormat:@"<%@: %p cbuuid: %@, pairingProtocolVersion: %ld, BTOutOfBandKey.length: %ld, supportsIPsecWithSPPLink: %ld, shouldPairDirectlyOverIPsec: %ld, bluetoothMACAddress.length: %ld, pairingType: %ld>", v4, self, v5, v6, v8, v9, v10, objc_msgSend(v11, "length"), -[IDSLocalPairingAddPairedDeviceInfo pairingType](self, "pairingType")];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSLocalPairingAddPairedDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kcbuuid"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"kPairingProtocolVersion"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBTOutOfBandKey"];
  uint64_t v8 = [(IDSLocalPairingAddPairedDeviceInfo *)self initWithCBUUID:v5 pairingProtocolVersion:v6 BTOutOfBandKey:v7];
  -[IDSLocalPairingAddPairedDeviceInfo setSupportsIPsecWithSPPLink:](v8, "setSupportsIPsecWithSPPLink:", [v4 decodeBoolForKey:@"kSupportsIPsecWithSPPLink"]);
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBluetoothMACAddress"];
  [(IDSLocalPairingAddPairedDeviceInfo *)v8 setBluetoothMACAddress:v9];

  -[IDSLocalPairingAddPairedDeviceInfo setShouldPairDirectlyOverIPsec:](v8, "setShouldPairDirectlyOverIPsec:", [v4 decodeBoolForKey:@"kShouldPairDirectlyOverIPsec"]);
  uint64_t v10 = [v4 decodeIntegerForKey:@"kPairingType"];

  [(IDSLocalPairingAddPairedDeviceInfo *)v8 setPairingType:v10];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(IDSLocalPairingAddPairedDeviceInfo *)self cbuuid];
  [v7 encodeObject:v4 forKey:@"kcbuuid"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[IDSLocalPairingAddPairedDeviceInfo pairingProtocolVersion](self, "pairingProtocolVersion"), @"kPairingProtocolVersion");
  v5 = [(IDSLocalPairingAddPairedDeviceInfo *)self BTOutOfBandKey];
  [v7 encodeObject:v5 forKey:@"kBTOutOfBandKey"];

  objc_msgSend(v7, "encodeBool:forKey:", -[IDSLocalPairingAddPairedDeviceInfo supportsIPsecWithSPPLink](self, "supportsIPsecWithSPPLink"), @"kSupportsIPsecWithSPPLink");
  objc_msgSend(v7, "encodeBool:forKey:", -[IDSLocalPairingAddPairedDeviceInfo shouldPairDirectlyOverIPsec](self, "shouldPairDirectlyOverIPsec"), @"kShouldPairDirectlyOverIPsec");
  uint64_t v6 = [(IDSLocalPairingAddPairedDeviceInfo *)self bluetoothMACAddress];
  [v7 encodeObject:v6 forKey:@"kBluetoothMACAddress"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[IDSLocalPairingAddPairedDeviceInfo pairingType](self, "pairingType"), @"kPairingType");
}

- (NSUUID)cbuuid
{
  return self->_cbuuid;
}

- (int64_t)pairingProtocolVersion
{
  return self->_pairingProtocolVersion;
}

- (NSData)BTOutOfBandKey
{
  return self->_BTOutOfBandKey;
}

- (BOOL)supportsIPsecWithSPPLink
{
  return self->_supportsIPsecWithSPPLink;
}

- (void)setSupportsIPsecWithSPPLink:(BOOL)a3
{
  self->_supportsIPsecWithSPPLink = a3;
}

- (NSData)bluetoothMACAddress
{
  return self->_bluetoothMACAddress;
}

- (void)setBluetoothMACAddress:(id)a3
{
}

- (BOOL)shouldPairDirectlyOverIPsec
{
  return self->_shouldPairDirectlyOverIPsec;
}

- (void)setShouldPairDirectlyOverIPsec:(BOOL)a3
{
  self->_shouldPairDirectlyOverIPsec = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothMACAddress, 0);
  objc_storeStrong((id *)&self->_BTOutOfBandKey, 0);

  objc_storeStrong((id *)&self->_cbuuid, 0);
}

@end