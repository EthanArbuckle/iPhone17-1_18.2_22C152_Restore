@interface DACarKeyAdditionalCrossPlatformSharingData
+ (BOOL)supportsSecureCoding;
+ (id)decodeWithData:(id)a3 error:(id *)a4;
- (DACarKeyAdditionalCrossPlatformSharingData)initWithCoder:(id)a3;
- (DACarKeyAdditionalCrossPlatformSharingData)initWithDictionary:(id)a3;
- (DACarKeyAdditionalCrossPlatformSharingData)initWithSharingSessionUUID:(id)a3 bindingAttestation:(id)a4 targetDeviceType:(int64_t)a5 initiatorIdsPseudonym:(id)a6;
- (NSData)bindingAttestation;
- (NSString)initiatorIdsPseudonym;
- (NSUUID)sharingSessionUUID;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeWithError:(id *)a3;
- (int64_t)targetDeviceType;
- (void)encodeWithCoder:(id)a3;
- (void)setBindingAttestation:(id)a3;
@end

@implementation DACarKeyAdditionalCrossPlatformSharingData

- (DACarKeyAdditionalCrossPlatformSharingData)initWithSharingSessionUUID:(id)a3 bindingAttestation:(id)a4 targetDeviceType:(int64_t)a5 initiatorIdsPseudonym:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DACarKeyAdditionalCrossPlatformSharingData;
  v14 = [(DACarKeyAdditionalCrossPlatformSharingData *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sharingSessionUUID, a3);
    objc_storeStrong((id *)&v15->_bindingAttestation, a4);
    v15->_targetDeviceType = a5;
    objc_storeStrong((id *)&v15->_initiatorIdsPseudonym, a6);
  }

  return v15;
}

- (DACarKeyAdditionalCrossPlatformSharingData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DACarKeyAdditionalCrossPlatformSharingData;
  v5 = [(DACarKeyAdditionalCrossPlatformSharingData *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"sharingSessionUUID"];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x263F08C38]);
      v8 = [v4 objectForKeyedSubscript:@"sharingSessionUUID"];
      uint64_t v9 = [v7 initWithUUIDString:v8];
      sharingSessionUUID = v5->_sharingSessionUUID;
      v5->_sharingSessionUUID = (NSUUID *)v9;
    }
    id v11 = [v4 objectForKeyedSubscript:@"bindingAttestation"];
    uint64_t v12 = kmlUtilDataForHexString(v11);
    bindingAttestation = v5->_bindingAttestation;
    v5->_bindingAttestation = (NSData *)v12;

    v14 = [v4 objectForKeyedSubscript:@"targetDeviceType"];
    v5->_targetDeviceType = [v14 integerValue];

    uint64_t v15 = [v4 objectForKeyedSubscript:@"initiatorIdsPseudonym"];
    initiatorIdsPseudonym = v5->_initiatorIdsPseudonym;
    v5->_initiatorIdsPseudonym = (NSString *)v15;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[DACarKeyAdditionalCrossPlatformSharingData allocWithZone:](DACarKeyAdditionalCrossPlatformSharingData, "allocWithZone:") init];
  if (v5)
  {
    uint64_t v6 = [(NSUUID *)self->_sharingSessionUUID copyWithZone:a3];
    sharingSessionUUID = v5->_sharingSessionUUID;
    v5->_sharingSessionUUID = (NSUUID *)v6;

    uint64_t v8 = [(NSData *)self->_bindingAttestation copyWithZone:a3];
    bindingAttestation = v5->_bindingAttestation;
    v5->_bindingAttestation = (NSData *)v8;

    v5->_targetDeviceType = self->_targetDeviceType;
    uint64_t v10 = [(NSString *)self->_initiatorIdsPseudonym copyWithZone:a3];
    initiatorIdsPseudonym = v5->_initiatorIdsPseudonym;
    v5->_initiatorIdsPseudonym = (NSString *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DACarKeyAdditionalCrossPlatformSharingData *)self sharingSessionUUID];
  [v4 encodeObject:v5 forKey:@"sharingSessionUUID"];

  uint64_t v6 = [(DACarKeyAdditionalCrossPlatformSharingData *)self bindingAttestation];
  [v4 encodeObject:v6 forKey:@"bindingAttestation"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DACarKeyAdditionalCrossPlatformSharingData targetDeviceType](self, "targetDeviceType"), @"targetDeviceType");
  id v7 = [(DACarKeyAdditionalCrossPlatformSharingData *)self initiatorIdsPseudonym];
  [v4 encodeObject:v7 forKey:@"initiatorIdsPseudonym"];
}

- (DACarKeyAdditionalCrossPlatformSharingData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DACarKeyAdditionalCrossPlatformSharingData;
  v5 = [(DACarKeyAdditionalCrossPlatformSharingData *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingSessionUUID"];
    sharingSessionUUID = v5->_sharingSessionUUID;
    v5->_sharingSessionUUID = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bindingAttestation"];
    bindingAttestation = v5->_bindingAttestation;
    v5->_bindingAttestation = (NSData *)v8;

    v5->_targetDeviceType = [v4 decodeIntegerForKey:@"targetDeviceType"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"initiatorIdsPseudonym"];
    initiatorIdsPseudonym = v5->_initiatorIdsPseudonym;
    v5->_initiatorIdsPseudonym = (NSString *)v10;
  }
  return v5;
}

- (id)encodeWithError:(id *)a3
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)decodeWithData:(id)a3 error:(id *)a4
{
  uint64_t v5 = decodeWithData_error__pred_347;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&decodeWithData_error__pred_347, &__block_literal_global_350);
  }
  id v7 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:decodeWithData_error__allowedClasses_348 fromData:v6 error:a4];

  return v7;
}

uint64_t __67__DACarKeyAdditionalCrossPlatformSharingData_decodeWithData_error___block_invoke()
{
  decodeWithData_error__allowedClasses_348 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = [NSString stringWithFormat:@"SharingSession UUID       : %@\n", self->_sharingSessionUUID];
  [v3 appendString:v4];

  uint64_t v5 = [NSString stringWithFormat:@"BindingAttestation        : %@\n", self->_bindingAttestation];
  [v3 appendString:v5];

  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Target Device Type        : %ld\n", self->_targetDeviceType);
  [v3 appendString:v6];

  id v7 = [NSString stringWithFormat:@"Initiator IDS Pseudonym   : %@\n", self->_initiatorIdsPseudonym];
  [v3 appendString:v7];

  return v3;
}

- (id)asDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(NSUUID *)self->_sharingSessionUUID UUIDString];
  [v3 setObject:v4 forKeyedSubscript:@"sharingSessionUUID"];

  uint64_t v5 = kmlUtilHexStringFromData(self->_bindingAttestation);
  [v3 setObject:v5 forKeyedSubscript:@"bindingAttestation"];

  id v6 = [NSNumber numberWithInteger:self->_targetDeviceType];
  [v3 setObject:v6 forKeyedSubscript:@"targetDeviceType"];

  [v3 setObject:self->_initiatorIdsPseudonym forKeyedSubscript:@"initiatorIdsPseudonym"];

  return v3;
}

- (NSUUID)sharingSessionUUID
{
  return self->_sharingSessionUUID;
}

- (NSData)bindingAttestation
{
  return self->_bindingAttestation;
}

- (void)setBindingAttestation:(id)a3
{
}

- (int64_t)targetDeviceType
{
  return self->_targetDeviceType;
}

- (NSString)initiatorIdsPseudonym
{
  return self->_initiatorIdsPseudonym;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorIdsPseudonym, 0);
  objc_storeStrong((id *)&self->_bindingAttestation, 0);

  objc_storeStrong((id *)&self->_sharingSessionUUID, 0);
}

@end