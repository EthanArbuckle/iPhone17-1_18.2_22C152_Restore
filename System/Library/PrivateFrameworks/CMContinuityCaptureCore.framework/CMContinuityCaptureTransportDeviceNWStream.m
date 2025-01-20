@interface CMContinuityCaptureTransportDeviceNWStream
- (NSString)description;
- (NSString)streamIdentifier;
- (NSUUID)streamUUID;
- (id)cipherKeyforSessionID:(id)a3;
- (id)initForIdentifier:(id)a3 nwClientID:(id)a4;
- (int64_t)entity;
@end

@implementation CMContinuityCaptureTransportDeviceNWStream

- (id)initForIdentifier:(id)a3 nwClientID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CMContinuityCaptureTransportDeviceNWStream;
  v9 = [(CMContinuityCaptureTransportDeviceNWStream *)&v11 init];
  if (v9)
  {
    v9->_entity = CMContinuityCaptureEntityTypeFromMediaIdentifer(v7);
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v9->_nwClientID, a4);
  }

  return v9;
}

- (NSString)streamIdentifier
{
  return self->_identifier;
}

- (int64_t)entity
{
  return self->_entity;
}

- (NSUUID)streamUUID
{
  return self->_nwClientID;
}

- (id)cipherKeyforSessionID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263EFF990];
  id v4 = a3;
  id v5 = (id) [[v3 alloc] initWithLength:32];
  *(_DWORD *)[v5 mutableBytes] = 1938474645;
  v6 = CMContinuityCaptureCreateCipherKey(v5, v4);

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(CMContinuityCaptureTransportDeviceNWStream *)self streamIdentifier];
  id v7 = [v3 stringWithFormat:@"%@: %@ entity:%u [%p]", v5, v6, self->_entity, self];

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwClientID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end