@interface MCEncryptedProfileServicePayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCEncryptedProfileServicePayload)initWithURLString:(id)a3 profile:(id)a4;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)title;
- (id)verboseDescription;
@end

@implementation MCEncryptedProfileServicePayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.placeholder.encryptedprofileservice"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"DEVICE_ENROLLMENT_CHALLENGE_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"DEVICE_ENROLLMENT_CHALLENGE_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCEncryptedProfileServicePayload)initWithURLString:(id)a3 profile:(id)a4
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v17[0] = @"PayloadVersion";
  v17[1] = @"PayloadType";
  v18[0] = &unk_1EF4D0AA8;
  v18[1] = @"com.apple.placeholder.encryptedprofileservice";
  v17[2] = @"PayloadIdentifier";
  v8 = NSString;
  id v9 = a4;
  v10 = [v8 MCMakeUUID];
  v18[2] = v10;
  v17[3] = @"PayloadUUID";
  v11 = [NSString MCMakeUUID];
  v18[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  v13 = (void *)[v12 mutableCopy];

  v16.receiver = self;
  v16.super_class = (Class)MCEncryptedProfileServicePayload;
  v14 = [(MCPayload *)&v16 initWithDictionary:v13 profile:v9 outError:0];

  if (v14) {
    objc_storeStrong((id *)&v14->_urlString, a3);
  }

  return v14;
}

- (id)verboseDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v7.receiver = self;
  v7.super_class = (Class)MCEncryptedProfileServicePayload;
  uint64_t v4 = [(MCPayload *)&v7 verboseDescription];
  uint64_t v5 = [v3 stringWithString:v4];

  if (self->_urlString) {
    [v5 appendFormat:@"URL         : %@", self->_urlString];
  }
  return v5;
}

- (id)title
{
  return MCLocalizedString(@"DEVICE_ENROLLMENT_CHALLENGE_TITLE");
}

- (id)subtitle1Label
{
  if (self->_urlString) {
    uint64_t v2 = @"DEVICE_ENROLLMENT_CHALLENGE_URL_COLON";
  }
  else {
    uint64_t v2 = @"DEVICE_ENROLLMENT_CHALLENGE_URL_MISSING";
  }
  uint64_t v3 = MCLocalizedString(v2);
  return v3;
}

- (id)subtitle1Description
{
  return self->_urlString;
}

- (void).cxx_destruct
{
}

@end