@interface MPAVAuxiliaryDevice
+ (id)otherConnectedDevicesFromRouteDescription:(id)a3;
- (BOOL)isPlaying;
- (MPAVAuxiliaryDevice)initWithDictionary:(id)a3;
- (NSString)deviceName;
- (NSString)modelIdentifier;
- (NSString)productName;
- (NSString)uniqueID;
@end

@implementation MPAVAuxiliaryDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_productName, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (MPAVAuxiliaryDevice)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPAVAuxiliaryDevice;
  v5 = [(MPAVAuxiliaryDevice *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F74DC8]];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:*MEMORY[0x1E4F74DC0]];
    productName = v5->_productName;
    v5->_productName = (NSString *)v8;

    uint64_t v10 = [v4 objectForKey:*MEMORY[0x1E4F74DB0]];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v10;

    uint64_t v12 = [v4 objectForKey:*MEMORY[0x1E4F74DA8]];
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v12;

    v14 = [v4 objectForKey:*MEMORY[0x1E4F74DB8]];
    v5->_playing = [v14 BOOLValue];
  }
  return v5;
}

+ (id)otherConnectedDevicesFromRouteDescription:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = [v3 objectForKey:*MEMORY[0x1E4F74DA0]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [[MPAVAuxiliaryDevice alloc] initWithDictionary:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

@end