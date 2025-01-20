@interface _ACCBLEPairingAccessoryInfo
- (BOOL)pairingFinished;
- (NSData)blePairingUUID;
- (NSData)supportedPairTypes;
- (NSDictionary)accInfoDict;
- (NSString)accessoryUID;
- (NSString)activeProvider;
- (_ACCBLEPairingAccessoryInfo)initWithUID:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6;
- (id)description;
- (void)dealloc;
- (void)setAccInfoDict:(id)a3;
- (void)setAccessoryUID:(id)a3;
- (void)setActiveProvider:(id)a3;
- (void)setBlePairingUUID:(id)a3;
- (void)setPairingFinished:(BOOL)a3;
- (void)setSupportedPairTypes:(id)a3;
@end

@implementation _ACCBLEPairingAccessoryInfo

- (_ACCBLEPairingAccessoryInfo)initWithUID:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_ACCBLEPairingAccessoryInfo;
  v15 = [(_ACCBLEPairingAccessoryInfo *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessoryUID, a3);
    objc_storeStrong((id *)&v16->_blePairingUUID, a4);
    objc_storeStrong((id *)&v16->_accInfoDict, a5);
    objc_storeStrong((id *)&v16->_supportedPairTypes, a6);
    activeProvider = v16->_activeProvider;
    v16->_activeProvider = 0;

    v16->_pairingFinished = 0;
  }

  return v16;
}

- (void)dealloc
{
  accessoryUID = self->_accessoryUID;
  self->_accessoryUID = 0;

  blePairingUUID = self->_blePairingUUID;
  self->_blePairingUUID = 0;

  accInfoDict = self->_accInfoDict;
  self->_accInfoDict = 0;

  supportedPairTypes = self->_supportedPairTypes;
  self->_supportedPairTypes = 0;

  activeProvider = self->_activeProvider;
  self->_activeProvider = 0;

  v8.receiver = self;
  v8.super_class = (Class)_ACCBLEPairingAccessoryInfo;
  [(_ACCBLEPairingAccessoryInfo *)&v8 dealloc];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<_ACCBLEPairingAccessoryInfo>[%@, blePairingUUID=%@, activeProvider=%@]", self->_accessoryUID, self->_blePairingUUID, self->_activeProvider];
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (NSData)blePairingUUID
{
  return self->_blePairingUUID;
}

- (void)setBlePairingUUID:(id)a3
{
}

- (NSDictionary)accInfoDict
{
  return self->_accInfoDict;
}

- (void)setAccInfoDict:(id)a3
{
}

- (NSData)supportedPairTypes
{
  return self->_supportedPairTypes;
}

- (void)setSupportedPairTypes:(id)a3
{
}

- (BOOL)pairingFinished
{
  return self->_pairingFinished;
}

- (void)setPairingFinished:(BOOL)a3
{
  self->_pairingFinished = a3;
}

- (NSString)activeProvider
{
  return self->_activeProvider;
}

- (void)setActiveProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeProvider, 0);
  objc_storeStrong((id *)&self->_supportedPairTypes, 0);
  objc_storeStrong((id *)&self->_accInfoDict, 0);
  objc_storeStrong((id *)&self->_blePairingUUID, 0);

  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

@end