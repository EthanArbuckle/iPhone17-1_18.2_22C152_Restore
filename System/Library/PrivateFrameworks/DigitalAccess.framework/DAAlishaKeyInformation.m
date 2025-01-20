@interface DAAlishaKeyInformation
+ (BOOL)supportsSecureCoding;
+ (id)withEndpoint:(id)a3;
- (BOOL)fleetVehicle;
- (BOOL)onlineImmobilizerToken;
- (BOOL)serverIssued;
- (BOOL)vehicleSupportsSharingPassword;
- (DAAlishaKeyEncryptedRequest)trackingRequest;
- (DAAlishaKeyInformation)initWithCoder:(id)a3;
- (NSArray)supportedTransports;
- (NSData)revocationAttestation;
- (NSData)trackingReceipt;
- (NSString)invitationIdentifier;
- (NSString)localIdentifier;
- (NSString)name;
- (NSString)ownerIDSIdentifier;
- (NSString)pairedEntityIdentifier;
- (NSUUID)sharingSessionUUID;
- (id)description;
- (unint64_t)agreedAppletVersion;
- (unint64_t)agreedFrameworkVersion;
- (unint64_t)agreedVehicleServerVersion;
- (unint64_t)longTermSharedSecretLength;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAAlishaKeyInformation

+ (id)withEndpoint:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v3 friendlyName];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [v3 subjectIdentifier];
  v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [v3 readerInfo];
  v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [v3 invitationIdentifier];
  v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  v13 = [v3 sharingSessionUUID];
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x263F08C38]);
    v15 = [v3 sharingSessionUUID];
    uint64_t v16 = [v14 initWithUUIDString:v15];
    v17 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = v16;
  }
  else
  {
    v15 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;
  }

  uint64_t v18 = [v3 ownerIDSIdentifier];
  v19 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v18;

  uint64_t v20 = [v3 trackingReceipt];
  v21 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v20;

  uint64_t v22 = [v3 revocationAttestation];
  v23 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v22;

  uint64_t v24 = [v3 trackingRequest];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [v3 trackingRequest];
    id v47 = 0;
    uint64_t v27 = +[DAAlishaKeyEncryptedRequest decodeWithData:v26 error:&v47];
    id v28 = v47;
    v29 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v27;

    if (v28) {
      NSLog(&cfstr_Daalishakeyenc.isa, v28);
    }
  }
  else
  {
    v30 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = 0;

    id v28 = 0;
  }
  v31 = [KmlDeviceConfigurationData alloc];
  v32 = [v3 deviceConfiguration];
  v33 = (void *)-[KmlDeviceConfigurationData initWithData:]((uint64_t)v31, v32);

  *(unsigned char *)(v4 + 8) = -[KmlDeviceConfigurationData isFriendImmoTokenOrSlotOnline]((uint64_t)v33);
  uint64_t v34 = -[KmlDeviceConfigurationData readerSupportedTransports]((uint64_t)v33);
  v35 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v34;

  *(unsigned char *)(v4 + 9) = -[KmlDeviceConfigurationData sharingPasswordRequired]((BOOL)v33);
  id v36 = objc_alloc(MEMORY[0x263F8BD80]);
  v37 = [v3 readerInfo];
  v38 = (void *)[v36 initWithReaderInformation:v37];

  v39 = [v38 manufacturer];
  v40 = [v38 brand];
  v41 = [v3 readerConfigID];
  v42 = SESEndPointCarKeyDowngradeVersionSetting();

  v43 = (void *)-[KmlVersions initWithEndpoint:downgradeFrameworkSetting:]((uint64_t)[KmlVersions alloc], v3, v42);
  *(void *)(v4 + 104) = [v43 agreedKmlVehicleVersion];
  *(void *)(v4 + 112) = [v43 agreedAppletVehicleVersion];
  *(void *)(v4 + 120) = [v43 agreedKmlVehicleServerVersion];
  v44 = [v3 configuration];
  LODWORD(v41) = [v44 opt2];

  *(unsigned char *)(v4 + 11) = kmlUtilIsFleetKey(v41);
  *(unsigned char *)(v4 + 10) = kmlUtilIsServerIssuedKey(v41);
  v45 = [v3 longTermSharedSecret];
  *(void *)(v4 + 88) = [v45 length];

  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [(DAAlishaKeyInformation *)self name];
  [v14 encodeObject:v4 forKey:@"name"];

  uint64_t v5 = [(DAAlishaKeyInformation *)self localIdentifier];
  [v14 encodeObject:v5 forKey:@"localIdentifier"];

  v6 = [(DAAlishaKeyInformation *)self pairedEntityIdentifier];
  [v14 encodeObject:v6 forKey:@"pairedEntityIdentifier"];

  uint64_t v7 = [(DAAlishaKeyInformation *)self invitationIdentifier];
  [v14 encodeObject:v7 forKey:@"invitationIdentifier"];

  v8 = [(DAAlishaKeyInformation *)self sharingSessionUUID];
  [v14 encodeObject:v8 forKey:@"sharingSessionUUID"];

  uint64_t v9 = [(DAAlishaKeyInformation *)self ownerIDSIdentifier];
  [v14 encodeObject:v9 forKey:@"ownerIDSIdentifier"];

  v10 = [(DAAlishaKeyInformation *)self trackingReceipt];
  [v14 encodeObject:v10 forKey:@"trackingReceipt"];

  uint64_t v11 = [(DAAlishaKeyInformation *)self revocationAttestation];
  [v14 encodeObject:v11 forKey:@"revocationAttestation"];

  v12 = [(DAAlishaKeyInformation *)self trackingRequest];
  [v14 encodeObject:v12 forKey:@"trackingRequest"];

  objc_msgSend(v14, "encodeBool:forKey:", -[DAAlishaKeyInformation onlineImmobilizerToken](self, "onlineImmobilizerToken"), @"onlineImmobilizerToken");
  v13 = [(DAAlishaKeyInformation *)self supportedTransports];
  [v14 encodeObject:v13 forKey:@"supportedTransports"];

  objc_msgSend(v14, "encodeBool:forKey:", -[DAAlishaKeyInformation vehicleSupportsSharingPassword](self, "vehicleSupportsSharingPassword"), @"vehicleSupportsSharingPassword");
  objc_msgSend(v14, "encodeInt:forKey:", -[DAAlishaKeyInformation longTermSharedSecretLength](self, "longTermSharedSecretLength"), @"longTermSharedSecretLength");
  objc_msgSend(v14, "encodeInt:forKey:", -[DAAlishaKeyInformation agreedFrameworkVersion](self, "agreedFrameworkVersion"), @"agreedFrameworkVersion");
  objc_msgSend(v14, "encodeInt:forKey:", -[DAAlishaKeyInformation agreedAppletVersion](self, "agreedAppletVersion"), @"agreedAppletVersion");
  objc_msgSend(v14, "encodeInt:forKey:", -[DAAlishaKeyInformation agreedVehicleServerVersion](self, "agreedVehicleServerVersion"), @"agreedVehicleServerVersion");
  objc_msgSend(v14, "encodeBool:forKey:", -[DAAlishaKeyInformation fleetVehicle](self, "fleetVehicle"), @"isFleetVehicle");
  objc_msgSend(v14, "encodeBool:forKey:", -[DAAlishaKeyInformation serverIssued](self, "serverIssued"), @"isServerIssued");
}

- (DAAlishaKeyInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DAAlishaKeyInformation;
  uint64_t v5 = [(DAAlishaKeyInformation *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localIdentifier"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairedEntityIdentifier"];
    pairedEntityIdentifier = v5->_pairedEntityIdentifier;
    v5->_pairedEntityIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationIdentifier"];
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingSessionUUID"];
    sharingSessionUUID = v5->_sharingSessionUUID;
    v5->_sharingSessionUUID = (NSUUID *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ownerIDSIdentifier"];
    ownerIDSIdentifier = v5->_ownerIDSIdentifier;
    v5->_ownerIDSIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingReceipt"];
    trackingReceipt = v5->_trackingReceipt;
    v5->_trackingReceipt = (NSData *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"revocationAttestation"];
    revocationAttestation = v5->_revocationAttestation;
    v5->_revocationAttestation = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingRequest"];
    trackingRequest = v5->_trackingRequest;
    v5->_trackingRequest = (DAAlishaKeyEncryptedRequest *)v22;

    v5->_onlineImmobilizerToken = [v4 decodeBoolForKey:@"onlineImmobilizerToken"];
    uint64_t v24 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"supportedTransports"];
    supportedTransports = v5->_supportedTransports;
    v5->_supportedTransports = (NSArray *)v24;

    v5->_vehicleSupportsSharingPassword = [v4 decodeBoolForKey:@"vehicleSupportsSharingPassword"];
    v5->_longTermSharedSecretLength = (int)[v4 decodeIntForKey:@"longTermSharedSecretLength"];
    v5->_agreedFrameworkVersion = (int)[v4 decodeIntForKey:@"agreedFrameworkVersion"];
    v5->_agreedAppletVersion = (int)[v4 decodeIntForKey:@"agreedAppletVersion"];
    v5->_agreedVehicleServerVersion = (int)[v4 decodeIntForKey:@"agreedVehicleServerVersion"];
    v5->_fleetVehicle = [v4 decodeBoolForKey:@"isFleetVehicle"];
    v5->_serverIssued = [v4 decodeBoolForKey:@"isServerIssued"];
  }

  return v5;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F089D8] string];
  [v3 appendFormat:@"Alisha Key Information:\n"];
  [v3 appendFormat:@"    KeyName         : %@\n", self->_name];
  [v3 appendFormat:@"    KeyLocalId      : %@\n", self->_localIdentifier];
  [v3 appendFormat:@"    ReaderId        : %@\n", self->_pairedEntityIdentifier];
  [v3 appendFormat:@"    InvitationId    : %@\n", self->_invitationIdentifier];
  [v3 appendFormat:@"    Session UUID    : %@\n", self->_sharingSessionUUID];
  [v3 appendFormat:@"    OwnerIDSId      : %@\n", self->_ownerIDSIdentifier];
  objc_msgSend(v3, "appendFormat:", @"    OnlineImmoToken : %d\n", self->_onlineImmobilizerToken);
  if (self->_fleetVehicle) {
    id v4 = @"Fleet";
  }
  else {
    id v4 = @"Private";
  }
  [v3 appendFormat:@"    VehicleType     : %@\n", v4];
  if (self->_serverIssued) {
    uint64_t v5 = @"Server";
  }
  else {
    uint64_t v5 = @"Device";
  }
  [v3 appendFormat:@"    KeyIssueSource  : %@\n", v5];
  objc_msgSend(v3, "appendFormat:", @"    VEP supported   : %d\n", self->_vehicleSupportsSharingPassword);
  objc_msgSend(v3, "appendFormat:", @"    LongTermSecretLength   : %lu\n", self->_longTermSharedSecretLength);
  [v3 appendFormat:@"    SupportedTransports :"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_supportedTransports;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = DAKeyTransportTypeAsString((int)[*(id *)(*((void *)&v15 + 1) + 8 * i) shortValue]);
        [v3 appendFormat:@"%@,", v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = kmlUtilHexStringFromData(self->_trackingReceipt);
  [v3 appendFormat:@"\n  TrackingReceipt : %@\n", v12];

  v13 = kmlUtilHexStringFromData(self->_revocationAttestation);
  [v3 appendFormat:@"    RevocationAttestation : %@\n", v13];

  [v3 appendFormat:@"    TrackingRequest : { %@ }\n", self->_trackingRequest];
  objc_msgSend(v3, "appendFormat:", @"    AgreedFrameworkVersion       : %02lx\n", self->_agreedFrameworkVersion);
  objc_msgSend(v3, "appendFormat:", @"    AgreedAppletVersion          : %02lx\n", self->_agreedAppletVersion);
  objc_msgSend(v3, "appendFormat:", @"    AgreedVehicleServerVersion   : %02lx\n", self->_agreedVehicleServerVersion);

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)pairedEntityIdentifier
{
  return self->_pairedEntityIdentifier;
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSUUID)sharingSessionUUID
{
  return self->_sharingSessionUUID;
}

- (NSString)ownerIDSIdentifier
{
  return self->_ownerIDSIdentifier;
}

- (NSData)trackingReceipt
{
  return self->_trackingReceipt;
}

- (NSData)revocationAttestation
{
  return self->_revocationAttestation;
}

- (DAAlishaKeyEncryptedRequest)trackingRequest
{
  return self->_trackingRequest;
}

- (BOOL)onlineImmobilizerToken
{
  return self->_onlineImmobilizerToken;
}

- (BOOL)vehicleSupportsSharingPassword
{
  return self->_vehicleSupportsSharingPassword;
}

- (unint64_t)longTermSharedSecretLength
{
  return self->_longTermSharedSecretLength;
}

- (NSArray)supportedTransports
{
  return self->_supportedTransports;
}

- (unint64_t)agreedFrameworkVersion
{
  return self->_agreedFrameworkVersion;
}

- (unint64_t)agreedAppletVersion
{
  return self->_agreedAppletVersion;
}

- (unint64_t)agreedVehicleServerVersion
{
  return self->_agreedVehicleServerVersion;
}

- (BOOL)serverIssued
{
  return self->_serverIssued;
}

- (BOOL)fleetVehicle
{
  return self->_fleetVehicle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTransports, 0);
  objc_storeStrong((id *)&self->_trackingRequest, 0);
  objc_storeStrong((id *)&self->_revocationAttestation, 0);
  objc_storeStrong((id *)&self->_trackingReceipt, 0);
  objc_storeStrong((id *)&self->_ownerIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingSessionUUID, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end