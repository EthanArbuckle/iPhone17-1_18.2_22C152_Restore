@interface CTLazuliCapabilitiesInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isBot;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliCapabilitiesInformation:(id)a3;
- (BOOL)supportsChat;
- (BOOL)supportsFeature;
- (BOOL)supportsFileTransfer;
- (BOOL)supportsGeolocationCapabilities;
- (BOOL)supportsImageSharing;
- (BOOL)supportsVideoSharing;
- (CTLazuliAlternateIdentities)alternateIdentities;
- (CTLazuliCapabilitiesInformation)initWithCoder:(id)a3;
- (CTLazuliCapabilitiesInformation)initWithReflection:(const void *)a3;
- (CTLazuliDestination)recipient;
- (NSDate)validUntil;
- (NSString)supportedLazuliExtensions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)availibility;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateIdentities:(id)a3;
- (void)setAvailibility:(int64_t)a3;
- (void)setIsBot:(BOOL)a3;
- (void)setRecipient:(id)a3;
- (void)setSupportedLazuliExtensions:(id)a3;
- (void)setSupportsChat:(BOOL)a3;
- (void)setSupportsFeature:(BOOL)a3;
- (void)setSupportsFileTransfer:(BOOL)a3;
- (void)setSupportsGeolocationCapabilities:(BOOL)a3;
- (void)setSupportsImageSharing:(BOOL)a3;
- (void)setSupportsVideoSharing:(BOOL)a3;
- (void)setValidUntil:(id)a3;
@end

@implementation CTLazuliCapabilitiesInformation

- (id)description
{
  v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v5 = [(CTLazuliCapabilitiesInformation *)self recipient];
  [v4 appendFormat:@", recipient = %@", v5];

  [v4 appendFormat:@", supportsVideoSharing = %d", -[CTLazuliCapabilitiesInformation supportsVideoSharing](self, "supportsVideoSharing")];
  [v4 appendFormat:@", supportsImageSharing = %d", -[CTLazuliCapabilitiesInformation supportsImageSharing](self, "supportsImageSharing")];
  [v4 appendFormat:@", supportsChat = %d", -[CTLazuliCapabilitiesInformation supportsChat](self, "supportsChat")];
  [v4 appendFormat:@", supportsFileTransfer = %d", -[CTLazuliCapabilitiesInformation supportsFileTransfer](self, "supportsFileTransfer")];
  [v4 appendFormat:@", supportsGeolocationCapabilities = %d", -[CTLazuliCapabilitiesInformation supportsGeolocationCapabilities](self, "supportsGeolocationCapabilities")];
  [v4 appendFormat:@", isBot = %d", -[CTLazuliCapabilitiesInformation isBot](self, "isBot")];
  v6 = [(CTLazuliCapabilitiesInformation *)self supportedLazuliExtensions];
  [v4 appendFormat:@", supportedLazuliExtensions = %@", v6];

  [v4 appendFormat:@", supportsFeature = %d", -[CTLazuliCapabilitiesInformation supportsFeature](self, "supportsFeature")];
  int64_t v7 = [(CTLazuliCapabilitiesInformation *)self availibility];
  int64_t v12 = [(CTLazuliCapabilitiesInformation *)self availibility];
  [v4 appendFormat:@", availibility = [%ld - %s]", v7, print_CTLazuliCapabilitiesAvailibilityStatusType(&v12)];
  v8 = [(CTLazuliCapabilitiesInformation *)self alternateIdentities];
  [v4 appendFormat:@", alternateIdentities = %@", v8];

  v9 = [(CTLazuliCapabilitiesInformation *)self validUntil];
  if (v9)
  {
    self = [(CTLazuliCapabilitiesInformation *)self validUntil];
    v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    -[CTLazuliCapabilitiesInformation dateByAddingTimeInterval:](self, "dateByAddingTimeInterval:", (double)[v2 secondsFromGMT]);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = @"(nil)";
  }
  [v4 appendFormat:@", validUntil = %@", v10];
  if (v9)
  {
  }
  [v4 appendString:@">"];

  return v4;
}

- (BOOL)isEqualToCTLazuliCapabilitiesInformation:(id)a3
{
  id v7 = a3;
  v8 = [(CTLazuliCapabilitiesInformation *)self recipient];
  v9 = [v7 recipient];
  if ([v8 isEqualToCTLazuliDestination:v9])
  {
    int v10 = [(CTLazuliCapabilitiesInformation *)self supportsVideoSharing];
    if (v10 == [v7 supportsVideoSharing])
    {
      int v11 = [(CTLazuliCapabilitiesInformation *)self supportsImageSharing];
      if (v11 == [v7 supportsImageSharing])
      {
        int v12 = [(CTLazuliCapabilitiesInformation *)self supportsChat];
        if (v12 == [v7 supportsChat])
        {
          int v13 = [(CTLazuliCapabilitiesInformation *)self supportsFileTransfer];
          if (v13 == [v7 supportsFileTransfer])
          {
            int v14 = [(CTLazuliCapabilitiesInformation *)self supportsGeolocationCapabilities];
            if (v14 == [v7 supportsGeolocationCapabilities])
            {
              int v15 = [(CTLazuliCapabilitiesInformation *)self isBot];
              if (v15 == [v7 isBot])
              {
                v18 = [(CTLazuliCapabilitiesInformation *)self supportedLazuliExtensions];
                if (v18
                  || ([v7 supportedLazuliExtensions], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v4 = [(CTLazuliCapabilitiesInformation *)self supportedLazuliExtensions];
                  v5 = [v7 supportedLazuliExtensions];
                  if (([v4 isEqualToString:v5] & 1) == 0)
                  {

                    BOOL v16 = 0;
                    if (!v18) {
                      goto LABEL_26;
                    }
                    goto LABEL_27;
                  }
                  uint64_t v35 = v3;
                  LODWORD(v3) = 1;
                }
                else
                {
                  uint64_t v35 = 0;
                }
                int v19 = [(CTLazuliCapabilitiesInformation *)self supportsFeature];
                if (v19 != [v7 supportsFeature]
                  || (int64_t v20 = [(CTLazuliCapabilitiesInformation *)self availibility],
                      v20 != [v7 availibility]))
                {
                  BOOL v16 = 0;
                  if ((v3 & 1) == 0) {
                    goto LABEL_25;
                  }
                  goto LABEL_24;
                }
                v33 = [(CTLazuliCapabilitiesInformation *)self alternateIdentities];
                if (v33
                  || ([v7 alternateIdentities], (v29 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v34 = [(CTLazuliCapabilitiesInformation *)self alternateIdentities];
                  v32 = [v7 alternateIdentities];
                  if (!objc_msgSend(v34, "isEqualToCTLazuliAlternateIdentities:"))
                  {
                    BOOL v16 = 0;
                    goto LABEL_36;
                  }
                  char v31 = 1;
                }
                else
                {
                  v29 = 0;
                  char v31 = 0;
                }
                uint64_t v30 = [(CTLazuliCapabilitiesInformation *)self validUntil];
                if (v30 || ([v7 validUntil], (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
                {
                  v21 = [(CTLazuliCapabilitiesInformation *)self validUntil];
                  [v21 timeIntervalSince1970];
                  double v23 = v22;
                  v24 = [v7 validUntil];
                  [v24 timeIntervalSince1970];
                  BOOL v16 = v23 == v25;

                  v26 = (void *)v30;
                  if (!v30) {
                    v26 = v28;
                  }
                }
                else
                {
                  v26 = 0;
                  BOOL v16 = 1;
                }

                if ((v31 & 1) == 0)
                {
LABEL_37:
                  if (!v33) {

                  }
                  if (!v3)
                  {
LABEL_25:
                    uint64_t v3 = v35;
                    if (!v18)
                    {
LABEL_26:

                      v18 = 0;
                    }
LABEL_27:

                    goto LABEL_9;
                  }
LABEL_24:

                  goto LABEL_25;
                }
LABEL_36:

                goto LABEL_37;
              }
            }
          }
        }
      }
    }
  }
  BOOL v16 = 0;
LABEL_9:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliCapabilitiesInformation *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliCapabilitiesInformation *)self isEqualToCTLazuliCapabilitiesInformation:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliCapabilitiesInformation allocWithZone:a3];
  [(CTLazuliCapabilitiesInformation *)v4 setRecipient:self->_recipient];
  [(CTLazuliCapabilitiesInformation *)v4 setSupportsVideoSharing:self->_supportsVideoSharing];
  [(CTLazuliCapabilitiesInformation *)v4 setSupportsImageSharing:self->_supportsImageSharing];
  [(CTLazuliCapabilitiesInformation *)v4 setSupportsChat:self->_supportsChat];
  [(CTLazuliCapabilitiesInformation *)v4 setSupportsFileTransfer:self->_supportsFileTransfer];
  [(CTLazuliCapabilitiesInformation *)v4 setSupportsGeolocationCapabilities:self->_supportsGeolocationCapabilities];
  [(CTLazuliCapabilitiesInformation *)v4 setIsBot:self->_isBot];
  [(CTLazuliCapabilitiesInformation *)v4 setSupportedLazuliExtensions:self->_supportedLazuliExtensions];
  [(CTLazuliCapabilitiesInformation *)v4 setSupportsFeature:self->_supportsFeature];
  [(CTLazuliCapabilitiesInformation *)v4 setAvailibility:self->_availibility];
  [(CTLazuliCapabilitiesInformation *)v4 setAlternateIdentities:self->_alternateIdentities];
  [(CTLazuliCapabilitiesInformation *)v4 setValidUntil:self->_validUntil];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_recipient forKey:@"kRecipientKey"];
  [v5 encodeBool:self->_supportsVideoSharing forKey:@"kSupportsVideoSharingKey"];
  [v5 encodeBool:self->_supportsImageSharing forKey:@"kSupportsImageSharingKey"];
  [v5 encodeBool:self->_supportsChat forKey:@"kSupportsChatKey"];
  [v5 encodeBool:self->_supportsFileTransfer forKey:@"kSupportsFileTransferKey"];
  [v5 encodeBool:self->_supportsGeolocationCapabilities forKey:@"kSupportsGeolocationCapabilitiesKey"];
  [v5 encodeBool:self->_isBot forKey:@"kIsBotKey"];
  [v5 encodeObject:self->_supportedLazuliExtensions forKey:@"kSupportedLazuliExtensionsKey"];
  [v5 encodeBool:self->_supportsFeature forKey:@"kSupportsFeatureKey"];
  v4 = [NSNumber numberWithLong:self->_availibility];
  [v5 encodeObject:v4 forKey:@"kAvailibilityKey"];

  [v5 encodeObject:self->_alternateIdentities forKey:@"kAlternateIdentitiesKey"];
  [v5 encodeObject:self->_validUntil forKey:@"kValidUntilKey"];
}

- (CTLazuliCapabilitiesInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CTLazuliCapabilitiesInformation;
  id v5 = [(CTLazuliCapabilitiesInformation *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRecipientKey"];
    recipient = v5->_recipient;
    v5->_recipient = (CTLazuliDestination *)v6;

    v5->_supportsVideoSharing = [v4 decodeBoolForKey:@"kSupportsVideoSharingKey"];
    v5->_supportsImageSharing = [v4 decodeBoolForKey:@"kSupportsImageSharingKey"];
    v5->_supportsChat = [v4 decodeBoolForKey:@"kSupportsChatKey"];
    v5->_supportsFileTransfer = [v4 decodeBoolForKey:@"kSupportsFileTransferKey"];
    v5->_supportsGeolocationCapabilities = [v4 decodeBoolForKey:@"kSupportsGeolocationCapabilitiesKey"];
    v5->_isBot = [v4 decodeBoolForKey:@"kIsBotKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSupportedLazuliExtensionsKey"];
    supportedLazuliExtensions = v5->_supportedLazuliExtensions;
    v5->_supportedLazuliExtensions = (NSString *)v8;

    v5->_supportsFeature = [v4 decodeBoolForKey:@"kSupportsFeatureKey"];
    int v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAvailibilityKey"];
    v5->_availibility = [v10 longValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kAlternateIdentitiesKey"];
    alternateIdentities = v5->_alternateIdentities;
    v5->_alternateIdentities = (CTLazuliAlternateIdentities *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kValidUntilKey"];
    validUntil = v5->_validUntil;
    v5->_validUntil = (NSDate *)v13;
  }
  return v5;
}

- (CTLazuliCapabilitiesInformation)initWithReflection:(const void *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CTLazuliCapabilitiesInformation;
  id v4 = [(CTLazuliCapabilitiesInformation *)&v16 init];
  if (!v4) {
    return v4;
  }
  id v5 = [[CTLazuliDestination alloc] initWithReflection:a3];
  recipient = v4->_recipient;
  v4->_recipient = v5;

  v4->_supportsVideoSharing = *((unsigned char *)a3 + 112);
  v4->_supportsImageSharing = *((unsigned char *)a3 + 113);
  v4->_supportsChat = *((unsigned char *)a3 + 114);
  v4->_supportsFileTransfer = *((unsigned char *)a3 + 115);
  v4->_supportsGeolocationCapabilities = *((unsigned char *)a3 + 116);
  v4->_isBot = *((unsigned char *)a3 + 117);
  if (*((unsigned char *)a3 + 144))
  {
    if (*((char *)a3 + 143) >= 0) {
      id v7 = (char *)a3 + 120;
    }
    else {
      id v7 = (char *)*((void *)a3 + 15);
    }
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    supportedLazuliExtensions = v4->_supportedLazuliExtensions;
    v4->_supportedLazuliExtensions = (NSString *)v8;
  }
  else
  {
    supportedLazuliExtensions = v4->_supportedLazuliExtensions;
    v4->_supportedLazuliExtensions = 0;
  }

  v4->_supportsFeature = *((unsigned char *)a3 + 152);
  v4->_availibility = encode_CTLazuliGroupChatParticipantRoleType((_DWORD *)a3 + 39);
  if (!*((unsigned char *)a3 + 184))
  {
    alternateIdentities = v4->_alternateIdentities;
    v4->_alternateIdentities = 0;
    goto LABEL_12;
  }
  int v10 = [CTLazuliAlternateIdentities alloc];
  if (*((unsigned char *)a3 + 184))
  {
    uint64_t v11 = [(CTLazuliAlternateIdentities *)v10 initWithReflection:(char *)a3 + 160];
    alternateIdentities = v4->_alternateIdentities;
    v4->_alternateIdentities = (CTLazuliAlternateIdentities *)v11;
LABEL_12:

    if (*((unsigned char *)a3 + 200))
    {
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:*((double *)a3 + 24)];
      validUntil = v4->_validUntil;
      v4->_validUntil = (NSDate *)v13;
    }
    else
    {
      validUntil = v4->_validUntil;
      v4->_validUntil = 0;
    }

    return v4;
  }
  result = (CTLazuliCapabilitiesInformation *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliDestination)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (BOOL)supportsVideoSharing
{
  return self->_supportsVideoSharing;
}

- (void)setSupportsVideoSharing:(BOOL)a3
{
  self->_supportsVideoSharing = a3;
}

- (BOOL)supportsImageSharing
{
  return self->_supportsImageSharing;
}

- (void)setSupportsImageSharing:(BOOL)a3
{
  self->_supportsImageSharing = a3;
}

- (BOOL)supportsChat
{
  return self->_supportsChat;
}

- (void)setSupportsChat:(BOOL)a3
{
  self->_supportsChat = a3;
}

- (BOOL)supportsFileTransfer
{
  return self->_supportsFileTransfer;
}

- (void)setSupportsFileTransfer:(BOOL)a3
{
  self->_supportsFileTransfer = a3;
}

- (BOOL)supportsGeolocationCapabilities
{
  return self->_supportsGeolocationCapabilities;
}

- (void)setSupportsGeolocationCapabilities:(BOOL)a3
{
  self->_supportsGeolocationCapabilities = a3;
}

- (BOOL)isBot
{
  return self->_isBot;
}

- (void)setIsBot:(BOOL)a3
{
  self->_isBot = a3;
}

- (NSString)supportedLazuliExtensions
{
  return self->_supportedLazuliExtensions;
}

- (void)setSupportedLazuliExtensions:(id)a3
{
}

- (BOOL)supportsFeature
{
  return self->_supportsFeature;
}

- (void)setSupportsFeature:(BOOL)a3
{
  self->_supportsFeature = a3;
}

- (int64_t)availibility
{
  return self->_availibility;
}

- (void)setAvailibility:(int64_t)a3
{
  self->_availibility = a3;
}

- (CTLazuliAlternateIdentities)alternateIdentities
{
  return self->_alternateIdentities;
}

- (void)setAlternateIdentities:(id)a3
{
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (void)setValidUntil:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_alternateIdentities, 0);
  objc_storeStrong((id *)&self->_supportedLazuliExtensions, 0);

  objc_storeStrong((id *)&self->_recipient, 0);
}

@end