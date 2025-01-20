@interface DACarKeyPrivateCrossPlatformSharingData
+ (BOOL)supportsSecureCoding;
- (DACarKeyPrivateCrossPlatformSharingData)initWithCoder:(id)a3;
- (DACarKeyPrivateCrossPlatformSharingData)initWithVehicleEnteredPasscode:(id)a3 pairedEntityIdentifier:(id)a4;
- (NSString)pairedEntityIdentifier;
- (NSString)vehicleEnteredPasscode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DACarKeyPrivateCrossPlatformSharingData

- (DACarKeyPrivateCrossPlatformSharingData)initWithVehicleEnteredPasscode:(id)a3 pairedEntityIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DACarKeyPrivateCrossPlatformSharingData;
  v9 = [(DACarKeyPrivateCrossPlatformSharingData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vehicleEnteredPasscode, a3);
    objc_storeStrong((id *)&v10->_pairedEntityIdentifier, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[DACarKeyPrivateCrossPlatformSharingData allocWithZone:](DACarKeyPrivateCrossPlatformSharingData, "allocWithZone:") init];
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_vehicleEnteredPasscode copyWithZone:a3];
    vehicleEnteredPasscode = v5->_vehicleEnteredPasscode;
    v5->_vehicleEnteredPasscode = (NSString *)v6;

    uint64_t v8 = [(NSString *)self->_pairedEntityIdentifier copyWithZone:a3];
    pairedEntityIdentifier = v5->_pairedEntityIdentifier;
    v5->_pairedEntityIdentifier = (NSString *)v8;
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
  v5 = [(DACarKeyPrivateCrossPlatformSharingData *)self vehicleEnteredPasscode];
  [v4 encodeObject:v5 forKey:@"vehicleEnteredPasscode"];

  id v6 = [(DACarKeyPrivateCrossPlatformSharingData *)self pairedEntityIdentifier];
  [v4 encodeObject:v6 forKey:@"pairedEntityIdentifier"];
}

- (DACarKeyPrivateCrossPlatformSharingData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DACarKeyPrivateCrossPlatformSharingData;
  v5 = [(DACarKeyPrivateCrossPlatformSharingData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleEnteredPasscode"];
    vehicleEnteredPasscode = v5->_vehicleEnteredPasscode;
    v5->_vehicleEnteredPasscode = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairedEntityIdentifier"];
    pairedEntityIdentifier = v5->_pairedEntityIdentifier;
    v5->_pairedEntityIdentifier = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"VEP length                : %d\n", -[NSString length](self->_vehicleEnteredPasscode, "length"));
  [v3 appendString:v4];

  v5 = [NSString stringWithFormat:@"Paired Entity Identifier  : %@\n", self->_pairedEntityIdentifier];
  [v3 appendString:v5];

  return v3;
}

- (NSString)vehicleEnteredPasscode
{
  return self->_vehicleEnteredPasscode;
}

- (NSString)pairedEntityIdentifier
{
  return self->_pairedEntityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedEntityIdentifier, 0);

  objc_storeStrong((id *)&self->_vehicleEnteredPasscode, 0);
}

@end