@interface _CDContextualChangeRegistration
+ (BOOL)supportsSecureCoding;
+ (id)localNonWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 callback:(id)a5;
+ (id)localNonWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 clientIdentifier:(id)a5 callback:(id)a6;
+ (id)localWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 callback:(id)a5;
+ (id)localWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 clientIdentifier:(id)a5 callback:(id)a6;
+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 deviceTypes:(unint64_t)a5 clientIdentifier:(id)a6 mustWake:(BOOL)a7 callback:(id)a8;
+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 deviceTypes:(unint64_t)a5 clientIdentifier:(id)a6 mustWake:(BOOL)a7 qualityOfService:(unsigned int)a8 callback:(id)a9;
+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 clientIdentifier:(id)a7 mustWake:(BOOL)a8 callback:(id)a9;
+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 clientIdentifier:(id)a7 mustWake:(BOOL)a8 qualityOfService:(unsigned int)a9 callback:(id)a10;
+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 mustWake:(BOOL)a7 callback:(id)a8;
- (BOOL)isDeserialized;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiDeviceRegistration;
- (BOOL)mustWake;
- (NSString)clientIdentifier;
- (NSString)identifier;
- (NSString)locationManagerEffectiveBundleID;
- (NSString)locationManagerEffectiveBundlePath;
- (_CDContextualChangeRegistration)init;
- (_CDContextualChangeRegistration)initWithCoder:(id)a3;
- (_CDContextualChangeRegistration)initWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 deviceTypes:(unint64_t)a7 clientIdentifier:(id)a8 mustWake:(BOOL)a9 callback:(id)a10;
- (_CDContextualChangeRegistration)initWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 deviceTypes:(unint64_t)a7 clientIdentifier:(id)a8 mustWake:(BOOL)a9 qualityOfService:(unsigned int)a10 informativeCallback:(id)a11;
- (_CDContextualPredicate)dismissalPolicy;
- (_CDContextualPredicate)predicate;
- (id)callback;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)informativeCallback;
- (unint64_t)deviceSet;
- (unint64_t)deviceTypes;
- (unint64_t)hash;
- (unsigned)qualityOfService;
- (void)encodeWithCoder:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDeviceSet:(unint64_t)a3;
- (void)setDismissalPolicy:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInformativeCallback:(id)a3;
- (void)setIsDeserialized:(BOOL)a3;
- (void)setLocationManagerEffectiveBundleID:(id)a3;
- (void)setLocationManagerEffectiveBundlePath:(id)a3;
- (void)setMustWake:(BOOL)a3;
- (void)setPredicate:(id)a3;
@end

@implementation _CDContextualChangeRegistration

- (id)informativeCallback
{
  return objc_getProperty(self, a2, 88, 1);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (_CDContextualPredicate)predicate
{
  return self->_predicate;
}

- (id)callback
{
  return objc_getProperty(self, a2, 40, 1);
}

- (unsigned)qualityOfService
{
  return self->_qualityOfService;
}

- (NSString)locationManagerEffectiveBundleID
{
  return self->_locationManagerEffectiveBundleID;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  [v6 encodeObject:self->_predicate forKey:@"predicate"];
  dismissalPolicy = self->_dismissalPolicy;
  if (dismissalPolicy) {
    [v6 encodeObject:dismissalPolicy forKey:@"dismissal"];
  }
  [v6 encodeInteger:self->_deviceSet forKey:@"deviceSet"];
  [v6 encodeInteger:self->_deviceTypes forKey:@"deviceTypes"];
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v6 encodeObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  if (self->_mustWake) {
    [v6 encodeBool:1 forKey:@"mustWake"];
  }
  [v6 encodeInteger:self->_qualityOfService forKey:@"qualityOfService"];
  [v6 encodeObject:self->_locationManagerEffectiveBundleID forKey:@"locationManagerEffectiveBundleID"];
  [v6 encodeObject:self->_locationManagerEffectiveBundlePath forKey:@"locationManagerEffectiveBundlePath"];
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (BOOL)isMultiDeviceRegistration
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)mustWake
{
  return self->_mustWake;
}

- (unint64_t)deviceSet
{
  return self->_deviceSet;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_informativeCallback, 0);
  objc_storeStrong((id *)&self->_locationManagerEffectiveBundlePath, 0);
  objc_storeStrong((id *)&self->_locationManagerEffectiveBundleID, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_dismissalPolicy, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (_CDContextualChangeRegistration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predicate"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    if ([v4 containsValueForKey:@"dismissal"])
    {
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dismissal"];
      if (!v10) {
        goto LABEL_14;
      }
    }
    else
    {
      v10 = 0;
    }
    unint64_t v11 = [v4 decodeIntegerForKey:@"deviceSet"];
    uint64_t v12 = [v4 decodeIntegerForKey:@"deviceTypes"];
    if (v11 <= 1)
    {
      uint64_t v13 = v12;
      v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
      char v19 = [v4 containsValueForKey:@"mustWake"];
      if ([v4 containsValueForKey:@"qualityOfService"]) {
        int v14 = [v4 decodeIntegerForKey:@"qualityOfService"];
      }
      else {
        int v14 = 9;
      }
      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationManagerEffectiveBundleID"];
      v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationManagerEffectiveBundlePath"];
      HIDWORD(v18) = v14;
      LOBYTE(v18) = v19;
      v9 = (_CDContextualChangeRegistration *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v5, v7, v10, v11, v13, v20, v18, 0);
      [(_CDContextualChangeRegistration *)v9 setLocationManagerEffectiveBundleID:v15];
      [(_CDContextualChangeRegistration *)v9 setLocationManagerEffectiveBundlePath:v16];

      goto LABEL_17;
    }
LABEL_14:
    v9 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (void)setLocationManagerEffectiveBundlePath:(id)a3
{
}

- (void)setLocationManagerEffectiveBundleID:(id)a3
{
}

- (_CDContextualChangeRegistration)initWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 deviceTypes:(unint64_t)a7 clientIdentifier:(id)a8 mustWake:(BOOL)a9 qualityOfService:(unsigned int)a10 informativeCallback:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  id v20 = a11;
  v28.receiver = self;
  v28.super_class = (Class)_CDContextualChangeRegistration;
  v21 = [(_CDContextualChangeRegistration *)&v28 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_identifier, a3);
    objc_storeStrong((id *)&v22->_predicate, a4);
    objc_storeStrong((id *)&v22->_dismissalPolicy, a5);
    v22->_deviceSet = a6;
    v22->_deviceTypes = a7;
    objc_storeStrong((id *)&v22->_clientIdentifier, a8);
    v22->_mustWake = a9;
    v22->_qualityOfService = a10;
    uint64_t v23 = MEMORY[0x192FB2040](v20);
    id informativeCallback = v22->_informativeCallback;
    v22->_id informativeCallback = (id)v23;

    v22->_isDeserialized = v20 != 0;
  }

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CDContextualChangeRegistration *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      identifier = self->_identifier;
      uint64_t v6 = [(_CDContextualChangeRegistration *)v4 identifier];
      char v7 = [(NSString *)identifier isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (_CDContextualChangeRegistration)init
{
  return 0;
}

- (_CDContextualChangeRegistration)initWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 deviceTypes:(unint64_t)a7 clientIdentifier:(id)a8 mustWake:(BOOL)a9 callback:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)_CDContextualChangeRegistration;
  id v20 = [(_CDContextualChangeRegistration *)&v27 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_identifier, a3);
    objc_storeStrong((id *)&v21->_predicate, a4);
    objc_storeStrong((id *)&v21->_dismissalPolicy, a5);
    v21->_deviceSet = a6;
    v21->_deviceTypes = a7;
    objc_storeStrong((id *)&v21->_clientIdentifier, a8);
    v21->_mustWake = a9;
    v21->_qualityOfService = 9;
    uint64_t v22 = MEMORY[0x192FB2040](v19);
    id callback = v21->_callback;
    v21->_id callback = (id)v22;

    v21->_isDeserialized = v19 != 0;
  }

  return v21;
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 mustWake:(BOOL)a7 callback:(id)a8
{
  if (a6 == 1) {
    uint64_t v14 = 0xFFFFLL;
  }
  else {
    uint64_t v14 = 0;
  }
  id v15 = a8;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  LOBYTE(v21) = a7;
  id v19 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v18 contextualPredicate:v17 dismissalPolicy:v16 deviceSet:a6 deviceTypes:v14 clientIdentifier:0 mustWake:v21 callback:v15];

  return v19;
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 clientIdentifier:(id)a7 mustWake:(BOOL)a8 callback:(id)a9
{
  LODWORD(v10) = 9;
  return (id)[a1 registrationWithIdentifier:a3 contextualPredicate:a4 dismissalPolicy:a5 deviceSet:a6 clientIdentifier:a7 mustWake:a8 qualityOfService:v10 callback:a9];
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 dismissalPolicy:(id)a5 deviceSet:(unint64_t)a6 clientIdentifier:(id)a7 mustWake:(BOOL)a8 qualityOfService:(unsigned int)a9 callback:(id)a10
{
  if (a6 == 1) {
    uint64_t v17 = 0xFFFFLL;
  }
  else {
    uint64_t v17 = 0;
  }
  id v18 = a10;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  HIDWORD(v25) = a9;
  LOBYTE(v25) = a8;
  uint64_t v23 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v22, v21, v20, a6, v17, v19, v25, v18);

  return v23;
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 deviceTypes:(unint64_t)a5 clientIdentifier:(id)a6 mustWake:(BOOL)a7 callback:(id)a8
{
  return (id)[a1 registrationWithIdentifier:a3 contextualPredicate:a4 deviceTypes:a5 clientIdentifier:a6 mustWake:a7 qualityOfService:9 callback:a8];
}

+ (id)registrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 deviceTypes:(unint64_t)a5 clientIdentifier:(id)a6 mustWake:(BOOL)a7 qualityOfService:(unsigned int)a8 callback:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  if (a5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      HIDWORD(v20) = a8;
      LOBYTE(v20) = a7;
      a5 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v15, v16, 0, 1, a5, v17, v20, v18);
    }
    else
    {
      a5 = 0;
    }
  }

  return (id)a5;
}

+ (id)localWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  LOBYTE(v13) = 1;
  unint64_t v11 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 contextualPredicate:v9 dismissalPolicy:0 deviceSet:0 deviceTypes:0 clientIdentifier:0 mustWake:v13 callback:v8];

  return v11;
}

+ (id)localWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 clientIdentifier:(id)a5 callback:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  HIDWORD(v16) = 9;
  LOBYTE(v16) = 1;
  uint64_t v14 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v13, v12, 0, 0, 0, v11, v16, v10);

  return v14;
}

+ (id)localNonWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 callback:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  LOBYTE(v13) = 0;
  id v11 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v10 contextualPredicate:v9 dismissalPolicy:0 deviceSet:0 deviceTypes:0 clientIdentifier:0 mustWake:v13 callback:v8];

  return v11;
}

+ (id)localNonWakingRegistrationWithIdentifier:(id)a3 contextualPredicate:(id)a4 clientIdentifier:(id)a5 callback:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  HIDWORD(v16) = 9;
  LOBYTE(v16) = 0;
  uint64_t v14 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", v13, v12, 0, 0, 0, v11, v16, v10);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id informativeCallback = self->_informativeCallback;
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  predicate = self->_predicate;
  dismissalPolicy = self->_dismissalPolicy;
  unint64_t deviceSet = self->_deviceSet;
  unint64_t deviceTypes = self->_deviceTypes;
  clientIdentifier = self->_clientIdentifier;
  if (informativeCallback)
  {
    HIDWORD(v15) = self->_qualityOfService;
    LOBYTE(v15) = self->_mustWake;
    id v12 = objc_msgSend(v5, "initWithIdentifier:contextualPredicate:dismissalPolicy:deviceSet:deviceTypes:clientIdentifier:mustWake:qualityOfService:informativeCallback:", identifier, predicate, dismissalPolicy, deviceSet, deviceTypes, clientIdentifier, v15, self->_informativeCallback);
  }
  else
  {
    LOBYTE(v15) = self->_mustWake;
    id v12 = (void *)[v5 initWithIdentifier:identifier contextualPredicate:predicate dismissalPolicy:dismissalPolicy deviceSet:deviceSet deviceTypes:deviceTypes clientIdentifier:clientIdentifier mustWake:v15 callback:self->_callback];
  }
  id v13 = v12;
  [v12 setLocationManagerEffectiveBundleID:self->_locationManagerEffectiveBundleID];
  [v13 setLocationManagerEffectiveBundlePath:self->_locationManagerEffectiveBundlePath];
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  if (self->_deviceSet) {
    v3 = @"ANY DEVICE";
  }
  else {
    v3 = @"LOCAL ONLY";
  }
  id v4 = v3;
  v5 = &stru_1EDDD9B38;
  if (self->_callback) {
    uint64_t v6 = @" LEGACY";
  }
  else {
    uint64_t v6 = &stru_1EDDD9B38;
  }
  char v7 = v6;
  if (self->_clientIdentifier)
  {
    v5 = [NSString stringWithFormat:@" (%@)", self->_clientIdentifier];
  }
  id v8 = [NSString stringWithFormat:@"<_CDContextualChangeRegistration%@ %p [%@]%@ (%@ / %X): %@>", v7, self, self->_identifier, v5, v4, self->_deviceTypes, self->_predicate];

  return v8;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setPredicate:(id)a3
{
}

- (_CDContextualPredicate)dismissalPolicy
{
  return self->_dismissalPolicy;
}

- (void)setDismissalPolicy:(id)a3
{
}

- (void)setDeviceSet:(unint64_t)a3
{
  self->_unint64_t deviceSet = a3;
}

- (unint64_t)deviceTypes
{
  return self->_deviceTypes;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void)setMustWake:(BOOL)a3
{
  self->_mustWake = a3;
}

- (BOOL)isDeserialized
{
  return self->_isDeserialized;
}

- (void)setIsDeserialized:(BOOL)a3
{
  self->_isDeserialized = a3;
}

- (NSString)locationManagerEffectiveBundlePath
{
  return self->_locationManagerEffectiveBundlePath;
}

- (void)setInformativeCallback:(id)a3
{
}

@end