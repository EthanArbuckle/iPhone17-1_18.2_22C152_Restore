@interface HKSharingRecipientIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)sharingRecipientIdentifierFromStringRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKSharingRecipientIdentifier)initWithCoder:(id)a3;
- (NSString)clinicalAccountIdentifier;
- (NSUUID)invitationUUID;
- (id)_initWithRecipientIdentifierType:(unint64_t)a3 invitationUUID:(id)a4 clinicalAccountIdentifier:(id)a5;
- (id)description;
- (id)initForClinicalAccountIdentifier:(id)a3;
- (id)initForInvitationUUID:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSharingRecipientIdentifier

- (id)initForInvitationUUID:(id)a3
{
  return [(HKSharingRecipientIdentifier *)self _initWithRecipientIdentifierType:0 invitationUUID:a3 clinicalAccountIdentifier:0];
}

- (id)initForClinicalAccountIdentifier:(id)a3
{
  return [(HKSharingRecipientIdentifier *)self _initWithRecipientIdentifierType:1 invitationUUID:0 clinicalAccountIdentifier:a3];
}

- (id)_initWithRecipientIdentifierType:(unint64_t)a3 invitationUUID:(id)a4 clinicalAccountIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKSharingRecipientIdentifier;
  v10 = [(HKSharingRecipientIdentifier *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    uint64_t v12 = [v8 copy];
    invitationUUID = v11->_invitationUUID;
    v11->_invitationUUID = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    clinicalAccountIdentifier = v11->_clinicalAccountIdentifier;
    v11->_clinicalAccountIdentifier = (NSString *)v14;
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  v7 = @"Clinical Account";
  if (!self->_type) {
    v7 = @"Shared Summary";
  }
  id v8 = [v3 stringWithFormat:@"<%@:%p %@ %@ %@>", v5, self, v7, self->_invitationUUID, self->_clinicalAccountIdentifier];

  return v8;
}

- (unint64_t)hash
{
  unint64_t type = self->_type;
  uint64_t v4 = [(NSUUID *)self->_invitationUUID hash] ^ type;
  return v4 ^ [(NSString *)self->_clinicalAccountIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  if (self->_type != v4[1]) {
    goto LABEL_9;
  }
  invitationUUID = self->_invitationUUID;
  v6 = (NSUUID *)v4[2];
  if (invitationUUID != v6 && (!v6 || !-[NSUUID isEqual:](invitationUUID, "isEqual:"))) {
    goto LABEL_9;
  }
  clinicalAccountIdentifier = self->_clinicalAccountIdentifier;
  id v8 = (NSString *)v4[3];
  if (clinicalAccountIdentifier == v8)
  {
    char v9 = 1;
    goto LABEL_10;
  }
  if (v8) {
    char v9 = -[NSString isEqual:](clinicalAccountIdentifier, "isEqual:");
  }
  else {
LABEL_9:
  }
    char v9 = 0;
LABEL_10:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"Type"];
  [v5 encodeObject:self->_invitationUUID forKey:@"InvitationUUID"];
  [v5 encodeObject:self->_clinicalAccountIdentifier forKey:@"ClinicalAccountIdentifier"];
}

- (HKSharingRecipientIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"Type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"InvitationUUID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClinicalAccountIdentifier"];

  id v8 = [(HKSharingRecipientIdentifier *)self _initWithRecipientIdentifierType:v5 invitationUUID:v6 clinicalAccountIdentifier:v7];
  return v8;
}

+ (id)sharingRecipientIdentifierFromStringRepresentation:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"SharedSummary-"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"SharedSummary-", "length")];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
    id v6 = [[HKSharingRecipientIdentifier alloc] initForInvitationUUID:v5];

LABEL_5:
    goto LABEL_7;
  }
  if ([v3 hasPrefix:@"ClinicalAccount-"])
  {
    id v4 = [v3 substringFromIndex:objc_msgSend(@"ClinicalAccount-", "length")];
    id v6 = [[HKSharingRecipientIdentifier alloc] initForClinicalAccountIdentifier:v4];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)invitationUUID
{
  return self->_invitationUUID;
}

- (NSString)clinicalAccountIdentifier
{
  return self->_clinicalAccountIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clinicalAccountIdentifier, 0);

  objc_storeStrong((id *)&self->_invitationUUID, 0);
}

@end