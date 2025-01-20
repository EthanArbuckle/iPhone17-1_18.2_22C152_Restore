@interface INExtensionContext
+ (BOOL)supportsSecureCoding;
- (INExtensionContext)initWithCoder:(id)a3;
- (NSArray)_airPlayRouteIdentifiers;
- (NSString)_recordDeviceIdentifier;
- (NSString)_recordRoute;
- (NSUUID)_recordDeviceUID;
- (unsigned)_audioSessionID;
- (void)_setAirPlayRouteIdentifiers:(id)a3;
- (void)_setAudioSessionID:(unsigned int)a3;
- (void)_setRecordDeviceIdentifier:(id)a3;
- (void)_setRecordDeviceUID:(id)a3;
- (void)_setRecordRoute:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INExtensionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airPlayRouteIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_recordDeviceUID, 0);

  objc_storeStrong((id *)&self->_recordRoute, 0);
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (unsigned)_audioSessionID
{
  return self->_audioSessionID;
}

- (void)_setAirPlayRouteIdentifiers:(id)a3
{
}

- (NSArray)_airPlayRouteIdentifiers
{
  return self->_airPlayRouteIdentifiers;
}

- (void)_setRecordDeviceIdentifier:(id)a3
{
}

- (NSString)_recordDeviceIdentifier
{
  return self->_recordDeviceIdentifier;
}

- (void)_setRecordDeviceUID:(id)a3
{
}

- (NSUUID)_recordDeviceUID
{
  return self->_recordDeviceUID;
}

- (void)_setRecordRoute:(id)a3
{
}

- (NSString)_recordRoute
{
  return self->_recordRoute;
}

- (INExtensionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INExtensionContext;
  v5 = [(INExtensionContext *)&v14 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordRoute"];
    [(INExtensionContext *)v5 _setRecordRoute:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordDeviceUID"];
    [(INExtensionContext *)v5 _setRecordDeviceUID:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordDeviceIdentifier"];
    [(INExtensionContext *)v5 _setRecordDeviceIdentifier:v8];

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"_airPlayRouteIdentifiers"];
    [(INExtensionContext *)v5 _setAirPlayRouteIdentifiers:v12];

    -[INExtensionContext _setAudioSessionID:](v5, "_setAudioSessionID:", [v4 decodeInt32ForKey:@"_audioSessionID"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  recordRoute = self->_recordRoute;
  id v5 = a3;
  [v5 encodeObject:recordRoute forKey:@"_recordRoute"];
  [v5 encodeObject:self->_recordDeviceUID forKey:@"_recordDeviceUID"];
  [v5 encodeObject:self->_recordDeviceIdentifier forKey:@"_recordDeviceIdentifier"];
  [v5 encodeObject:self->_airPlayRouteIdentifiers forKey:@"_airPlayRouteIdentifiers"];
  [v5 encodeInt32:self->_audioSessionID forKey:@"_audioSessionID"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __54___INExtensionContext_handleIntent_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  }
  return result;
}

uint64_t __47___INExtensionContext_handleIntent_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __64___INExtensionContext_confirmationResponseForIntent_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __84___INExtensionContext_cancelTransactionDueToTimeoutWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelTransactionDueToTimeoutWithIntentIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __74___INExtensionContext_completeTransactionWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeTransactionWithIntentIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __71___INExtensionContext_beginTransactionWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginTransactionWithIntentIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

@end