@interface SGIdentityKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
+ (id)keyForContactExternalId:(int)a3;
+ (id)keyForContactUniqueId:(id)a3;
+ (id)keyForEmail:(id)a3;
+ (id)keyForInstantMessageAddress:(id)a3;
+ (id)keyForNormalizedEmail:(id)a3;
+ (id)keyForNormalizedPhone:(id)a3;
+ (id)keyForPersonHandle:(id)a3;
+ (id)keyForSocialProfile:(id)a3;
+ (unint64_t)identityTypeForKeyPart:(id)a3;
- (BOOL)hasEmailAddress;
- (BOOL)hasInstantMessageAddress;
- (BOOL)hasPhone;
- (BOOL)hasSocialProfile;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdentityKey:(id)a3;
- (NSString)externalId;
- (SGIdentityKey)initWithSerialized:(id)a3;
- (SGIdentityKey)initWithType:(unint64_t)a3 content:(id)a4;
- (id)description;
- (id)emailAddress;
- (id)instantMessageAddress;
- (id)phone;
- (id)serialize;
- (id)socialProfile;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation SGIdentityKey

- (void).cxx_destruct
{
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)externalId
{
  if (self->_type != 2)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SGIdentityKey.m", 308, @"Invalid parameter not satisfying: %@", @"_type == SGIdentityKeyTypeContact" object file lineNumber description];
  }
  content = self->_content;
  return content;
}

- (id)phone
{
  if (![(SGIdentityKey *)self hasPhone])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SGIdentityKey.m" lineNumber:257 description:@"Calling phone number selector on identity with no phone number."];
  }
  content = self->_content;
  if (!content)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SGIdentityKey.m" lineNumber:258 description:@"Identity key claims to be a phone number but it does not have one"];

    content = self->_content;
  }
  return content;
}

- (BOOL)hasPhone
{
  return self->_type == 3;
}

- (id)uniqueIdentifier
{
  if ([(SGIdentityKey *)self hasEmailAddress])
  {
    v4 = [(SGIdentityKey *)self emailAddress];
  }
  else if ([(SGIdentityKey *)self hasInstantMessageAddress])
  {
    v4 = [(SGIdentityKey *)self instantMessageAddress];
  }
  else if ([(SGIdentityKey *)self hasSocialProfile])
  {
    v4 = [(SGIdentityKey *)self socialProfile];
  }
  else if ([(SGIdentityKey *)self hasPhone])
  {
    v4 = [(SGIdentityKey *)self phone];
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SGIdentityKey.m" lineNumber:246 description:@"Should not ask for a unique identifier when this is neither an email nor an instance message address"];

    v4 = 0;
  }
  return v4;
}

- (id)socialProfile
{
  if (![(SGIdentityKey *)self hasSocialProfile])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SGIdentityKey.m" lineNumber:234 description:@"Calling socialProfile selector on identity with no social profile."];
  }
  content = self->_content;
  if (!content)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SGIdentityKey.m" lineNumber:235 description:@"Identity key claims to be a social profile but it does not have one"];

    content = self->_content;
  }
  return content;
}

- (BOOL)hasSocialProfile
{
  return self->_type == 5;
}

- (id)instantMessageAddress
{
  if (![(SGIdentityKey *)self hasInstantMessageAddress])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SGIdentityKey.m" lineNumber:222 description:@"Calling instant message selector on identity with no instant message address."];
  }
  content = self->_content;
  if (!content)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SGIdentityKey.m" lineNumber:223 description:@"Identity key claims to be an instant message address but it does not have one"];

    content = self->_content;
  }
  return content;
}

- (BOOL)hasInstantMessageAddress
{
  return self->_type == 4;
}

- (id)emailAddress
{
  if (![(SGIdentityKey *)self hasEmailAddress])
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SGIdentityKey.m" lineNumber:210 description:@"Calling email selector on identity with no email address."];
  }
  content = self->_content;
  if (!content)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"SGIdentityKey.m" lineNumber:211 description:@"Identity key claims to be an email address but it does not have one"];

    content = self->_content;
  }
  return content;
}

- (BOOL)hasEmailAddress
{
  return self->_type == 1;
}

- (id)description
{
  id v3 = [NSString alloc];
  unint64_t type = self->_type;
  if (type > 5) {
    v5 = @"UNKNOWN IDENTITY KEY TYPE!";
  }
  else {
    v5 = off_1E65BE9F8[type];
  }
  v6 = (void *)[v3 initWithFormat:@"[SGIdentityKey type:%@ content:%@]", v5, self->_content];
  return v6;
}

- (unint64_t)hash
{
  unint64_t type = self->_type;
  return [(NSString *)self->_content hash] - type + 32 * type;
}

- (BOOL)isEqualToIdentityKey:(id)a3
{
  v4 = (SGIdentityKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else if (self->_type == v4->_type)
  {
    v6 = self->_content;
    v7 = v6;
    if (v6 == v5->_content) {
      char v8 = 1;
    }
    else {
      char v8 = -[NSString isEqual:](v6, "isEqual:");
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGIdentityKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGIdentityKey *)self isEqualToIdentityKey:v5];

  return v6;
}

- (id)serialize
{
  unint64_t type = self->_type;
  switch(type)
  {
    case 0uLL:
      id v3 = [MEMORY[0x1E4F28B00] currentHandler];
      v4 = [NSString stringWithUTF8String:"NSString *keyForIdentityKeyType(SGIdentityKeyType)"];
      [v3 handleFailureInFunction:v4 file:@"SGIdentityKey.m" lineNumber:44 description:@"No key for SGIdentityKeyTypeUninitialized. Initialize it."];

      goto LABEL_4;
    case 1uLL:
      v7 = @"email";
      goto LABEL_10;
    case 2uLL:
      v7 = @"contact";
      goto LABEL_10;
    case 3uLL:
      v7 = @"unkphone";
      goto LABEL_10;
    case 4uLL:
      v7 = @"text-message";
      goto LABEL_10;
    case 5uLL:
      v7 = @"social-profile";
LABEL_10:
      char v8 = v7;
      break;
    default:
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v6 = [NSString stringWithUTF8String:"NSString *keyForIdentityKeyType(SGIdentityKeyType)"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"SGIdentityKey.m", 63, @"No key for type value %d", type);

LABEL_4:
      v7 = 0;
      break;
  }
  v9 = SGDelimitedStringsSerialize();

  return v9;
}

- (SGIdentityKey)initWithType:(unint64_t)a3 content:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGIdentityKey.m", 169, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];
  }
  v9 = [(SGIdentityKey *)self init];
  v10 = v9;
  if (v9)
  {
    v9->_unint64_t type = a3;
    objc_storeStrong((id *)&v9->_content, a4);
  }

  return v10;
}

- (SGIdentityKey)initWithSerialized:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGIdentityKey.m", 158, @"Invalid parameter not satisfying: %@", @"serialized" object file lineNumber description];
  }
  BOOL v6 = SGDelimitedStringsDeserialize();
  if ([v6 count] != 2)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGIdentityKey.m", 160, @"Invalid parameter not satisfying: %@", @"parts.count == 2" object file lineNumber description];
  }
  v7 = [v6 objectAtIndexedSubscript:0];
  unint64_t v8 = +[SGIdentityKey identityTypeForKeyPart:v7];

  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [v6 objectAtIndexedSubscript:0];
    [v14 handleFailureInMethod:a2, self, @"SGIdentityKey.m", 162, @"Unknown type: %@", v15 object file lineNumber description];
  }
  v9 = [v6 objectAtIndexedSubscript:1];
  v10 = [(SGIdentityKey *)self initWithType:v8 content:v9];

  return v10;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1C) {
    return (a3 & 0xFFFFFFF) == 4;
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGIdentityKey.m", 302, @"Unknown entity type: %lu", a3);

  return 0;
}

+ (unint64_t)identityTypeForKeyPart:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"email"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"contact"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"unkphone"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"text-message"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"social-profile"])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)keyForContactUniqueId:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[SGIdentityKey alloc] initWithType:2 content:v3];

  return v4;
}

+ (id)keyForContactExternalId:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v4 = [SGIdentityKey alloc];
  id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v3);
  BOOL v6 = [(SGIdentityKey *)v4 initWithType:2 content:v5];

  return v6;
}

+ (id)keyForPersonHandle:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [v5 handles];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"SGIdentityKey.m", 103, @"Invalid parameter not satisfying: %@", @"person.handles.count > 0" object file lineNumber description];
  }
  unint64_t v8 = [v5 handleIdentifier];
  v9 = [v5 handles];

  v10 = [v9 objectAtIndexedSubscript:0];

  if ([v8 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    uint64_t v11 = [a1 keyForEmail:v10];
LABEL_9:
    v13 = (void *)v11;
    goto LABEL_10;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    v12 = SGNormalizePhoneNumber();
    v13 = [a1 keyForNormalizedPhone:v12];

    goto LABEL_10;
  }
  if ([v8 isEqualToString:*MEMORY[0x1E4F1AE60]])
  {
    uint64_t v11 = [a1 keyForInstantMessageAddress:v10];
    goto LABEL_9;
  }
  int v15 = [v8 isEqualToString:*MEMORY[0x1E4F1AF78]];
  v16 = sgLogHandle();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      v18 = "IdentityKey for social profile types currently unsupported: %@";
LABEL_19:
      _os_log_error_impl(&dword_1CA650000, v16, OS_LOG_TYPE_ERROR, v18, buf, 0xCu);
    }
  }
  else if (v17)
  {
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    v18 = "Unknown handle type %@";
    goto LABEL_19;
  }

  v13 = 0;
LABEL_10:

  return v13;
}

+ (id)keyForSocialProfile:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [SGIdentityKey alloc];
  SGNormalizeSocialProfile(v3);
  objc_claimAutoreleasedReturnValue();

  id v5 = [(SGIdentityKey *)v4 initWithType:5 content:v3];
  return v5;
}

+ (id)keyForInstantMessageAddress:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [SGIdentityKey alloc];
  id v5 = SGNormalizeInstantMessageAddress(v3);

  BOOL v6 = [(SGIdentityKey *)v4 initWithType:4 content:v5];
  return v6;
}

+ (id)keyForNormalizedPhone:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[SGIdentityKey alloc] initWithType:3 content:v3];

  return v4;
}

+ (id)keyForNormalizedEmail:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [[SGIdentityKey alloc] initWithType:1 content:v3];

  return v4;
}

+ (id)keyForEmail:(id)a3
{
  id v3 = SGNormalizeEmailAddress();
  unint64_t v4 = +[SGIdentityKey keyForNormalizedEmail:v3];

  return v4;
}

@end