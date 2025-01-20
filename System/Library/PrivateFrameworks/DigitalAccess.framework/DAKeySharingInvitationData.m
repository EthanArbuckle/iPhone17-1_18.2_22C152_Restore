@interface DAKeySharingInvitationData
+ (BOOL)supportsSecureCoding;
- (DAKeySharingInvitationData)initWithCoder:(id)a3;
- (DAKeySharingInvitationData)initWithSessionUUID:(id)a3 invitationIdentifier:(id)a4 friendKeyIdentifier:(id)a5 sharingTarget:(int64_t)a6 state:(int64_t)a7 vehicleEnteredPasscode:(id)a8;
- (NSString)friendKeyIdentifier;
- (NSString)invitationIdentifier;
- (NSString)passwordPiece;
- (NSString)vehicleEnteredPasscode;
- (NSUUID)sharingSessionIdentifier;
- (id)description;
- (int64_t)invitationState;
- (int64_t)sharingTargetType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DAKeySharingInvitationData

- (DAKeySharingInvitationData)initWithSessionUUID:(id)a3 invitationIdentifier:(id)a4 friendKeyIdentifier:(id)a5 sharingTarget:(int64_t)a6 state:(int64_t)a7 vehicleEnteredPasscode:(id)a8
{
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)DAKeySharingInvitationData;
  v18 = [(DAKeySharingInvitationData *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sharingSessionIdentifier, a3);
    objc_storeStrong((id *)&v19->_invitationIdentifier, a4);
    objc_storeStrong((id *)&v19->_friendKeyIdentifier, a5);
    v19->_sharingTargetType = a6;
    v19->_invitationState = a7;
    passwordPiece = v19->_passwordPiece;
    v19->_passwordPiece = 0;

    objc_storeStrong((id *)&v19->_vehicleEnteredPasscode, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DAKeySharingInvitationData *)self sharingSessionIdentifier];
  [v4 encodeObject:v5 forKey:@"sharingSessionIdentifier"];

  v6 = [(DAKeySharingInvitationData *)self invitationIdentifier];
  [v4 encodeObject:v6 forKey:@"invitationIdentifier"];

  v7 = [(DAKeySharingInvitationData *)self friendKeyIdentifier];
  [v4 encodeObject:v7 forKey:@"friendKeyIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[DAKeySharingInvitationData sharingTargetType](self, "sharingTargetType"), @"sharingTargetType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[DAKeySharingInvitationData invitationState](self, "invitationState"), @"invitationState");
  id v8 = [(DAKeySharingInvitationData *)self vehicleEnteredPasscode];
  [v4 encodeObject:v8 forKey:@"vehicleEnteredPasscode"];
}

- (DAKeySharingInvitationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DAKeySharingInvitationData;
  v5 = [(DAKeySharingInvitationData *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharingSessionIdentifier"];
    sharingSessionIdentifier = v5->_sharingSessionIdentifier;
    v5->_sharingSessionIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invitationIdentifier"];
    invitationIdentifier = v5->_invitationIdentifier;
    v5->_invitationIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"friendKeyIdentifier"];
    friendKeyIdentifier = v5->_friendKeyIdentifier;
    v5->_friendKeyIdentifier = (NSString *)v10;

    v5->_sharingTargetType = [v4 decodeIntegerForKey:@"sharingTargetType"];
    v5->_invitationState = [v4 decodeIntegerForKey:@"invitationState"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleEnteredPasscode"];
    vehicleEnteredPasscode = v5->_vehicleEnteredPasscode;
    v5->_vehicleEnteredPasscode = (NSString *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = [NSString stringWithFormat:@"SessionUUID           : %@\n", self->_sharingSessionIdentifier];
  [v3 appendString:v4];

  v5 = [NSString stringWithFormat:@"Invitation ID         : %@\n", self->_invitationIdentifier];
  [v3 appendString:v5];

  uint64_t v6 = [NSString stringWithFormat:@"Friend Key ID         : %@\n", self->_friendKeyIdentifier];
  [v3 appendString:v6];

  v7 = objc_msgSend(NSString, "stringWithFormat:", @"Sharing Target        : %ld\n", self->_sharingTargetType);
  [v3 appendString:v7];

  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invitation State      : %ld\n", self->_invitationState);
  [v3 appendString:v8];

  v9 = objc_msgSend(NSString, "stringWithFormat:", @"VEP length            : %ld", -[NSString length](self->_vehicleEnteredPasscode, "length"));
  [v3 appendString:v9];

  return v3;
}

- (NSUUID)sharingSessionIdentifier
{
  return self->_sharingSessionIdentifier;
}

- (NSString)invitationIdentifier
{
  return self->_invitationIdentifier;
}

- (NSString)friendKeyIdentifier
{
  return self->_friendKeyIdentifier;
}

- (int64_t)sharingTargetType
{
  return self->_sharingTargetType;
}

- (int64_t)invitationState
{
  return self->_invitationState;
}

- (NSString)passwordPiece
{
  return self->_passwordPiece;
}

- (NSString)vehicleEnteredPasscode
{
  return self->_vehicleEnteredPasscode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_passwordPiece, 0);
  objc_storeStrong((id *)&self->_friendKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_invitationIdentifier, 0);

  objc_storeStrong((id *)&self->_sharingSessionIdentifier, 0);
}

@end