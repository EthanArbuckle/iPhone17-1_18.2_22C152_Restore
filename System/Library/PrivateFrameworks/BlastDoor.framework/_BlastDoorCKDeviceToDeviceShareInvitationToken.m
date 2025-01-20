@interface _BlastDoorCKDeviceToDeviceShareInvitationToken
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSData)sharingInvitationData;
- (NSString)participantID;
- (NSURL)shareURL;
- (_BlastDoorCKDeviceToDeviceShareInvitationToken)initWithCoder:(id)a3;
- (_BlastDoorCKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4;
- (_BlastDoorCKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4 participantID:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setShareURL:(id)a3;
- (void)setSharingInvitationData:(id)a3;
@end

@implementation _BlastDoorCKDeviceToDeviceShareInvitationToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorCKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4
{
  return [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)self initWithSharingInvitationData:a3 shareURL:a4 participantID:0];
}

- (_BlastDoorCKDeviceToDeviceShareInvitationToken)initWithSharingInvitationData:(id)a3 shareURL:(id)a4 participantID:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_BlastDoorCKDeviceToDeviceShareInvitationToken;
  v11 = [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)&v16 init];
  if (v11)
  {
    v12 = (void *)[v8 copy];
    [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)v11 setSharingInvitationData:v12];

    v13 = (void *)[v9 copy];
    [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)v11 setShareURL:v13];

    v14 = (void *)[v10 copy];
    [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)v11 setParticipantID:v14];
  }
  return v11;
}

- (_BlastDoorCKDeviceToDeviceShareInvitationToken)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && ![v4 _strictSecureDecodingEnabled])
  {
    id v9 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1B3EA6580]();
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ShareInvitationData"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ShareURL"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ParticipantID"];
    self = [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)self initWithSharingInvitationData:v6 shareURL:v7 participantID:v8];

    id v9 = self;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1B3EA6580]();
  v5 = [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)self sharingInvitationData];
  [v8 encodeObject:v5 forKey:@"ShareInvitationData"];

  v6 = [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)self shareURL];
  [v8 encodeObject:v6 forKey:@"ShareURL"];

  v7 = [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)self participantID];
  [v8 encodeObject:v7 forKey:@"ParticipantID"];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_BlastDoorCKDeviceToDeviceShareInvitationToken;
  if ([(_BlastDoorCKDeviceToDeviceShareInvitationToken *)&v11 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v4;
      unint64_t v7 = v6[1];
      if (v7 | (unint64_t)self->_sharingInvitationData && !objc_msgSend((id)v7, "isEqual:")
        || (unint64_t v8 = v6[2], v8 | (unint64_t)self->_shareURL) && !objc_msgSend((id)v8, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v9 = v6[3];
        if (v9 | (unint64_t)self->_participantID) {
          char v5 = objc_msgSend((id)v9, "isEqual:");
        }
        else {
          char v5 = 1;
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)self sharingInvitationData];
  uint64_t v4 = [v3 hash];
  char v5 = [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)self shareURL];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(_BlastDoorCKDeviceToDeviceShareInvitationToken *)self participantID];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ShareInvitationData", @"ShareURL", @"ParticipantID", 0);
}

- (NSData)sharingInvitationData
{
  return self->_sharingInvitationData;
}

- (void)setSharingInvitationData:(id)a3
{
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_sharingInvitationData, 0);
}

@end