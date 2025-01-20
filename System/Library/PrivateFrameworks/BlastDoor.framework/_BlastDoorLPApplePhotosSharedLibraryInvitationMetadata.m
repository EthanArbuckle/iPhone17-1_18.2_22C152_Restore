@interface _BlastDoorLPApplePhotosSharedLibraryInvitationMetadata
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation;
- (BOOL)isEqual:(id)a3;
- (NSString)message;
- (NSString)originatorDisplayName;
- (_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOriginatorDisplayName:(id)a3;
@end

@implementation _BlastDoorLPApplePhotosSharedLibraryInvitationMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata)initWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata;
  v5 = [(_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"message");
    message = v5->_message;
    v5->_message = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"originatorDisplayName");
    originatorDisplayName = v5->_originatorDisplayName;
    v5->_originatorDisplayName = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  message = self->_message;
  id v5 = a3;
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", message, @"message");
  objc_msgSend(v5, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_originatorDisplayName, @"originatorDisplayName");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata allocWithZone:a3];
  if (v4)
  {
    id v5 = [(_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *)self message];
    [(_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *)v4 setMessage:v5];

    uint64_t v6 = [(_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *)self originatorDisplayName];
    [(_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *)v4 setOriginatorDisplayName:v6];

    v7 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata;
  if ([(_BlastDoorLPApplePhotosSharedLibraryInvitationMetadata *)&v10 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      unint64_t v7 = v6[2];
      if (v7 | (unint64_t)self->_message && !objc_msgSend((id)v7, "isEqual:"))
      {
        char v5 = 0;
      }
      else
      {
        unint64_t v8 = v6[3];
        if (v8 | (unint64_t)self->_originatorDisplayName) {
          char v5 = objc_msgSend((id)v8, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_message hash];
  return [(NSString *)self->_originatorDisplayName hash] ^ v3;
}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"message", @"originatorDisplayName", 0);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)originatorDisplayName
{
  return self->_originatorDisplayName;
}

- (void)setOriginatorDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatorDisplayName, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end