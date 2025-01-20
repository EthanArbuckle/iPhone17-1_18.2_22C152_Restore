@interface CTLazuliSystemConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)bsfUsesSecureTransport;
- (BOOL)featureDisabledByProfile;
- (BOOL)featureDisabledStoreDemo;
- (BOOL)featureEnabledByDefault;
- (BOOL)featureSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliSystemConfiguration:(id)a3;
- (CTLazuliBusinessMessagingCapabilities)businessMessagingCapabilities;
- (CTLazuliChatCapabilities)chatCapabilities;
- (CTLazuliDiscoveryCapabilities)discoverCapabilities;
- (CTLazuliFileTransferCapabilities)fileTransferCapabilities;
- (CTLazuliGroupChatCapabilities)groupChatCapabilites;
- (CTLazuliMessagingCapabilities)messagingCapabilities;
- (CTLazuliOperationStatus)operationStatus;
- (CTLazuliSystemConfiguration)initWithCoder:(id)a3;
- (CTLazuliSystemConfiguration)initWithReflection:(const void *)a3;
- (CTLazuliUserIdentities)identity;
- (NSNumber)bsfPort;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBsfPort:(id)a3;
- (void)setBsfUsesSecureTransport:(BOOL)a3;
- (void)setBusinessMessagingCapabilities:(id)a3;
- (void)setChatCapabilities:(id)a3;
- (void)setDiscoverCapabilities:(id)a3;
- (void)setFeatureDisabledByProfile:(BOOL)a3;
- (void)setFeatureDisabledStoreDemo:(BOOL)a3;
- (void)setFeatureEnabledByDefault:(BOOL)a3;
- (void)setFeatureSupported:(BOOL)a3;
- (void)setFileTransferCapabilities:(id)a3;
- (void)setGroupChatCapabilites:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setMessagingCapabilities:(id)a3;
- (void)setOperationStatus:(id)a3;
@end

@implementation CTLazuliSystemConfiguration

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliSystemConfiguration *)self messagingCapabilities];
  [v3 appendFormat:@", messagingCapabilities = %@", v4];

  v5 = [(CTLazuliSystemConfiguration *)self chatCapabilities];
  [v3 appendFormat:@", chatCapabilities = %@", v5];

  v6 = [(CTLazuliSystemConfiguration *)self groupChatCapabilites];
  [v3 appendFormat:@", groupChatCapabilites = %@", v6];

  v7 = [(CTLazuliSystemConfiguration *)self fileTransferCapabilities];
  [v3 appendFormat:@", fileTransferCapabilities = %@", v7];

  v8 = [(CTLazuliSystemConfiguration *)self operationStatus];
  [v3 appendFormat:@", operationStatus = %@", v8];

  v9 = [(CTLazuliSystemConfiguration *)self discoverCapabilities];
  [v3 appendFormat:@", discoverCapabilities = %@", v9];

  v10 = [(CTLazuliSystemConfiguration *)self identity];
  [v3 appendFormat:@", identity = %@", v10];

  v11 = [(CTLazuliSystemConfiguration *)self businessMessagingCapabilities];
  [v3 appendFormat:@", businessMessagingCapabilities = %@", v11];

  [v3 appendFormat:@", featureSupported = %d", -[CTLazuliSystemConfiguration featureSupported](self, "featureSupported")];
  [v3 appendFormat:@", featureEnabledByDefault = %d", -[CTLazuliSystemConfiguration featureEnabledByDefault](self, "featureEnabledByDefault")];
  [v3 appendFormat:@", featureDisabledByProfile = %d", -[CTLazuliSystemConfiguration featureDisabledByProfile](self, "featureDisabledByProfile")];
  [v3 appendFormat:@", featureDisabledStoreDemo = %d", -[CTLazuliSystemConfiguration featureDisabledStoreDemo](self, "featureDisabledStoreDemo")];
  v12 = [(CTLazuliSystemConfiguration *)self bsfPort];
  [v3 appendFormat:@", bsfPort = %@", v12];

  [v3 appendFormat:@", bsfUsesSecureTransport = %d", -[CTLazuliSystemConfiguration bsfUsesSecureTransport](self, "bsfUsesSecureTransport")];
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliSystemConfiguration:(id)a3
{
  id v8 = a3;
  v9 = [(CTLazuliSystemConfiguration *)self messagingCapabilities];
  if (v9 || ([v8 messagingCapabilities], (v57 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(CTLazuliSystemConfiguration *)self messagingCapabilities];
    v4 = [v8 messagingCapabilities];
    if (![v3 isEqualToCTLazuliMessagingCapabilities:v4])
    {
      LOBYTE(v10) = 0;
      goto LABEL_75;
    }
    int v58 = 1;
  }
  else
  {
    v57 = 0;
    int v58 = 0;
  }
  v11 = [(CTLazuliSystemConfiguration *)self chatCapabilities];
  if (v11 || ([v8 chatCapabilities], (v53 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = [(CTLazuliSystemConfiguration *)self chatCapabilities];
    v6 = [v8 chatCapabilities];
    if (![v5 isEqualToCTLazuliChatCapabilities:v6])
    {
      LOBYTE(v10) = 0;
      goto LABEL_72;
    }
    int v55 = 1;
  }
  else
  {
    v53 = 0;
    int v55 = 0;
  }
  v12 = [(CTLazuliSystemConfiguration *)self groupChatCapabilites];
  if (v12 || ([v8 groupChatCapabilites], (v48 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v56 = [(CTLazuliSystemConfiguration *)self groupChatCapabilites];
    v54 = [v8 groupChatCapabilites];
    if (!objc_msgSend(v56, "isEqualToCTLazuliGroupChatCapabilities:"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_69;
    }
    int v50 = 1;
  }
  else
  {
    v48 = 0;
    int v50 = 0;
  }
  v51 = [(CTLazuliSystemConfiguration *)self fileTransferCapabilities];
  if (v51 || ([v8 fileTransferCapabilities], (v43 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v52 = [(CTLazuliSystemConfiguration *)self fileTransferCapabilities];
    v49 = [v8 fileTransferCapabilities];
    if (!objc_msgSend(v52, "isEqualToCTLazuliFileTransferCapabilities:"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_66;
    }
    int v45 = 1;
  }
  else
  {
    v43 = 0;
    int v45 = 0;
  }
  v46 = [(CTLazuliSystemConfiguration *)self operationStatus];
  if (v46 || ([v8 operationStatus], (v38 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v47 = [(CTLazuliSystemConfiguration *)self operationStatus];
    v44 = [v8 operationStatus];
    if (!objc_msgSend(v47, "isEqualToCTLazuliOperationStatus:"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_63;
    }
    int v40 = 1;
  }
  else
  {
    v38 = 0;
    int v40 = 0;
  }
  v41 = [(CTLazuliSystemConfiguration *)self discoverCapabilities];
  if (v41 || ([v8 discoverCapabilities], (v33 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v42 = [(CTLazuliSystemConfiguration *)self discoverCapabilities];
    v39 = [v8 discoverCapabilities];
    if (!objc_msgSend(v42, "isEqualToCTLazuliDiscoveryCapabilities:"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_60;
    }
    int v35 = 1;
  }
  else
  {
    v33 = 0;
    int v35 = 0;
  }
  v36 = [(CTLazuliSystemConfiguration *)self identity];
  if (v36 || ([v8 identity], (v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v37 = [(CTLazuliSystemConfiguration *)self identity];
    v34 = [v8 identity];
    if (!objc_msgSend(v37, "isEqualToCTLazuliUserIdentities:"))
    {
      LOBYTE(v10) = 0;
      goto LABEL_57;
    }
    int v30 = 1;
  }
  else
  {
    v28 = 0;
    int v30 = 0;
  }
  v31 = [(CTLazuliSystemConfiguration *)self businessMessagingCapabilities];
  if (v31
    || ([v8 businessMessagingCapabilities], (v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v32 = [(CTLazuliSystemConfiguration *)self businessMessagingCapabilities];
    v29 = [v8 businessMessagingCapabilities];
    if (!objc_msgSend(v32, "isEqualToCTLazuliBusinessMessagingCapabilities:"))
    {
      LOBYTE(v10) = 0;
LABEL_54:

      goto LABEL_55;
    }
    int v27 = 1;
  }
  else
  {
    v26 = 0;
    int v27 = 0;
  }
  int v13 = [(CTLazuliSystemConfiguration *)self featureSupported];
  if (v13 != [v8 featureSupported]
    || (int v14 = [(CTLazuliSystemConfiguration *)self featureEnabledByDefault],
        v14 != [v8 featureEnabledByDefault])
    || (int v15 = [(CTLazuliSystemConfiguration *)self featureDisabledByProfile],
        v15 != [v8 featureDisabledByProfile])
    || (int v16 = [(CTLazuliSystemConfiguration *)self featureDisabledStoreDemo],
        v16 != [v8 featureDisabledStoreDemo]))
  {
    LOBYTE(v10) = 0;
    if (!v27) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  uint64_t v25 = [(CTLazuliSystemConfiguration *)self bsfPort];
  if (!v25)
  {
    uint64_t v21 = [v8 bsfPort];
    if (!v21)
    {
      uint64_t v21 = 0;
      int v22 = 0;
LABEL_99:
      BOOL v19 = [(CTLazuliSystemConfiguration *)self bsfUsesSecureTransport];
      int v10 = v19 ^ [v8 bsfUsesSecureTransport] ^ 1;
      if (!v22) {
        goto LABEL_101;
      }
      goto LABEL_100;
    }
  }
  v24 = [(CTLazuliSystemConfiguration *)self bsfPort];
  uint64_t v18 = [v24 longValue];
  v23 = [v8 bsfPort];
  if (v18 == [v23 longValue])
  {
    int v22 = 1;
    goto LABEL_99;
  }
  LOBYTE(v10) = 0;
LABEL_100:

LABEL_101:
  v20 = (void *)v25;
  if (!v25) {
    v20 = (void *)v21;
  }

  if (v27) {
    goto LABEL_54;
  }
LABEL_55:
  if (v31)
  {

    if (!v30) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }

  if (v30)
  {
LABEL_57:
  }
LABEL_58:
  if (v36)
  {

    if (!v35) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }

  if (v35)
  {
LABEL_60:
  }
LABEL_61:
  if (v41)
  {

    if (!v40) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }

  if (v40)
  {
LABEL_63:
  }
LABEL_64:
  if (v46)
  {

    if (!v45) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }

  if (v45)
  {
LABEL_66:
  }
LABEL_67:
  if (v51)
  {

    if (!v50) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }

  if (v50)
  {
LABEL_69:
  }
LABEL_70:
  if (v12)
  {

    if (!v55) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }

  if (v55)
  {
LABEL_72:
  }
LABEL_73:
  if (v11)
  {

    if (!v58) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }

  if (v58)
  {
LABEL_75:
  }
LABEL_76:
  if (!v9) {

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CTLazuliSystemConfiguration *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliSystemConfiguration *)self isEqualToCTLazuliSystemConfiguration:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[CTLazuliSystemConfiguration allocWithZone:a3];
  [(CTLazuliSystemConfiguration *)v4 setMessagingCapabilities:self->_messagingCapabilities];
  [(CTLazuliSystemConfiguration *)v4 setChatCapabilities:self->_chatCapabilities];
  [(CTLazuliSystemConfiguration *)v4 setGroupChatCapabilites:self->_groupChatCapabilites];
  [(CTLazuliSystemConfiguration *)v4 setFileTransferCapabilities:self->_fileTransferCapabilities];
  [(CTLazuliSystemConfiguration *)v4 setOperationStatus:self->_operationStatus];
  [(CTLazuliSystemConfiguration *)v4 setDiscoverCapabilities:self->_discoverCapabilities];
  [(CTLazuliSystemConfiguration *)v4 setIdentity:self->_identity];
  [(CTLazuliSystemConfiguration *)v4 setBusinessMessagingCapabilities:self->_businessMessagingCapabilities];
  [(CTLazuliSystemConfiguration *)v4 setFeatureSupported:self->_featureSupported];
  [(CTLazuliSystemConfiguration *)v4 setFeatureEnabledByDefault:self->_featureEnabledByDefault];
  [(CTLazuliSystemConfiguration *)v4 setFeatureDisabledByProfile:self->_featureDisabledByProfile];
  [(CTLazuliSystemConfiguration *)v4 setFeatureDisabledStoreDemo:self->_featureDisabledStoreDemo];
  [(CTLazuliSystemConfiguration *)v4 setBsfPort:self->_bsfPort];
  [(CTLazuliSystemConfiguration *)v4 setBsfUsesSecureTransport:self->_bsfUsesSecureTransport];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_messagingCapabilities forKey:@"kMessagingCapabilitiesKey"];
  [v4 encodeObject:self->_chatCapabilities forKey:@"kChatCapabilitiesKey"];
  [v4 encodeObject:self->_groupChatCapabilites forKey:@"kGroupChatCapabilitesKey"];
  [v4 encodeObject:self->_fileTransferCapabilities forKey:@"kFileTransferCapabilitiesKey"];
  [v4 encodeObject:self->_operationStatus forKey:@"kOperationStatusKey"];
  [v4 encodeObject:self->_discoverCapabilities forKey:@"kDiscoverCapabilitiesKey"];
  [v4 encodeObject:self->_identity forKey:@"kIdentityKey"];
  [v4 encodeObject:self->_businessMessagingCapabilities forKey:@"kBusinessMessagingCapabilitiesKey"];
  [v4 encodeBool:self->_featureSupported forKey:@"kFeatureSupportedKey"];
  [v4 encodeBool:self->_featureEnabledByDefault forKey:@"kFeatureEnabledByDefaultKey"];
  [v4 encodeBool:self->_featureDisabledByProfile forKey:@"kFeatureDisabledByProfileKey"];
  [v4 encodeBool:self->_featureDisabledStoreDemo forKey:@"kFeatureDisabledStoreDemoKey"];
  [v4 encodeObject:self->_bsfPort forKey:@"kBsfPortKey"];
  [v4 encodeBool:self->_bsfUsesSecureTransport forKey:@"kBsfUsesSecureTransportKey"];
}

- (CTLazuliSystemConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CTLazuliSystemConfiguration;
  v5 = [(CTLazuliSystemConfiguration *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMessagingCapabilitiesKey"];
    messagingCapabilities = v5->_messagingCapabilities;
    v5->_messagingCapabilities = (CTLazuliMessagingCapabilities *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kChatCapabilitiesKey"];
    chatCapabilities = v5->_chatCapabilities;
    v5->_chatCapabilities = (CTLazuliChatCapabilities *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kGroupChatCapabilitesKey"];
    groupChatCapabilites = v5->_groupChatCapabilites;
    v5->_groupChatCapabilites = (CTLazuliGroupChatCapabilities *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kFileTransferCapabilitiesKey"];
    fileTransferCapabilities = v5->_fileTransferCapabilities;
    v5->_fileTransferCapabilities = (CTLazuliFileTransferCapabilities *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kOperationStatusKey"];
    operationStatus = v5->_operationStatus;
    v5->_operationStatus = (CTLazuliOperationStatus *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kDiscoverCapabilitiesKey"];
    discoverCapabilities = v5->_discoverCapabilities;
    v5->_discoverCapabilities = (CTLazuliDiscoveryCapabilities *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kIdentityKey"];
    identity = v5->_identity;
    v5->_identity = (CTLazuliUserIdentities *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBusinessMessagingCapabilitiesKey"];
    businessMessagingCapabilities = v5->_businessMessagingCapabilities;
    v5->_businessMessagingCapabilities = (CTLazuliBusinessMessagingCapabilities *)v20;

    v5->_featureSupported = [v4 decodeBoolForKey:@"kFeatureSupportedKey"];
    v5->_featureEnabledByDefault = [v4 decodeBoolForKey:@"kFeatureEnabledByDefaultKey"];
    v5->_featureDisabledByProfile = [v4 decodeBoolForKey:@"kFeatureDisabledByProfileKey"];
    v5->_featureDisabledStoreDemo = [v4 decodeBoolForKey:@"kFeatureDisabledStoreDemoKey"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kBsfPortKey"];
    bsfPort = v5->_bsfPort;
    v5->_bsfPort = (NSNumber *)v22;

    v5->_bsfUsesSecureTransport = [v4 decodeBoolForKey:@"kBsfUsesSecureTransportKey"];
  }

  return v5;
}

- (CTLazuliSystemConfiguration)initWithReflection:(const void *)a3
{
  v33.receiver = self;
  v33.super_class = (Class)CTLazuliSystemConfiguration;
  id v4 = [(CTLazuliSystemConfiguration *)&v33 init];
  v5 = v4;
  if (!v4) {
    return v5;
  }
  if (*((unsigned char *)a3 + 8))
  {
    uint64_t v6 = [CTLazuliMessagingCapabilities alloc];
    if (!*((unsigned char *)a3 + 8)) {
      goto LABEL_39;
    }
    uint64_t v7 = [(CTLazuliMessagingCapabilities *)v6 initWithReflection:a3];
    messagingCapabilities = v5->_messagingCapabilities;
    v5->_messagingCapabilities = (CTLazuliMessagingCapabilities *)v7;
  }
  else
  {
    messagingCapabilities = v4->_messagingCapabilities;
    v4->_messagingCapabilities = 0;
  }

  if (*((unsigned char *)a3 + 88))
  {
    v9 = [CTLazuliChatCapabilities alloc];
    if (!*((unsigned char *)a3 + 88)) {
      goto LABEL_39;
    }
    uint64_t v10 = [(CTLazuliChatCapabilities *)v9 initWithReflection:(char *)a3 + 16];
    chatCapabilities = v5->_chatCapabilities;
    v5->_chatCapabilities = (CTLazuliChatCapabilities *)v10;
  }
  else
  {
    chatCapabilities = v5->_chatCapabilities;
    v5->_chatCapabilities = 0;
  }

  if (*((unsigned char *)a3 + 128))
  {
    uint64_t v12 = [CTLazuliGroupChatCapabilities alloc];
    if (!*((unsigned char *)a3 + 128)) {
      goto LABEL_39;
    }
    uint64_t v13 = [(CTLazuliGroupChatCapabilities *)v12 initWithReflection:(char *)a3 + 96];
    groupChatCapabilites = v5->_groupChatCapabilites;
    v5->_groupChatCapabilites = (CTLazuliGroupChatCapabilities *)v13;
  }
  else
  {
    groupChatCapabilites = v5->_groupChatCapabilites;
    v5->_groupChatCapabilites = 0;
  }

  if (*((unsigned char *)a3 + 352))
  {
    int v15 = [CTLazuliFileTransferCapabilities alloc];
    if (!*((unsigned char *)a3 + 352)) {
      goto LABEL_39;
    }
    uint64_t v16 = [(CTLazuliFileTransferCapabilities *)v15 initWithReflection:(char *)a3 + 136];
    fileTransferCapabilities = v5->_fileTransferCapabilities;
    v5->_fileTransferCapabilities = (CTLazuliFileTransferCapabilities *)v16;
  }
  else
  {
    fileTransferCapabilities = v5->_fileTransferCapabilities;
    v5->_fileTransferCapabilities = 0;
  }

  if (*((unsigned char *)a3 + 372))
  {
    uint64_t v18 = [CTLazuliOperationStatus alloc];
    if (!*((unsigned char *)a3 + 372)) {
      goto LABEL_39;
    }
    uint64_t v19 = [(CTLazuliOperationStatus *)v18 initWithReflection:(char *)a3 + 360];
    operationStatus = v5->_operationStatus;
    v5->_operationStatus = (CTLazuliOperationStatus *)v19;
  }
  else
  {
    operationStatus = v5->_operationStatus;
    v5->_operationStatus = 0;
  }

  if (*((unsigned char *)a3 + 380))
  {
    uint64_t v21 = [CTLazuliDiscoveryCapabilities alloc];
    if (!*((unsigned char *)a3 + 380)) {
      goto LABEL_39;
    }
    uint64_t v22 = [(CTLazuliDiscoveryCapabilities *)v21 initWithReflection:(char *)a3 + 376];
    discoverCapabilities = v5->_discoverCapabilities;
    v5->_discoverCapabilities = (CTLazuliDiscoveryCapabilities *)v22;
  }
  else
  {
    discoverCapabilities = v5->_discoverCapabilities;
    v5->_discoverCapabilities = 0;
  }

  if (*((unsigned char *)a3 + 432))
  {
    v24 = [CTLazuliUserIdentities alloc];
    if (!*((unsigned char *)a3 + 432)) {
      goto LABEL_39;
    }
    uint64_t v25 = [(CTLazuliUserIdentities *)v24 initWithReflection:(char *)a3 + 384];
    identity = v5->_identity;
    v5->_identity = (CTLazuliUserIdentities *)v25;
  }
  else
  {
    identity = v5->_identity;
    v5->_identity = 0;
  }

  if (!*((unsigned char *)a3 + 448))
  {
    businessMessagingCapabilities = v5->_businessMessagingCapabilities;
    v5->_businessMessagingCapabilities = 0;
    goto LABEL_34;
  }
  int v27 = [CTLazuliBusinessMessagingCapabilities alloc];
  if (*((unsigned char *)a3 + 448))
  {
    uint64_t v28 = [(CTLazuliBusinessMessagingCapabilities *)v27 initWithReflection:(char *)a3 + 440];
    businessMessagingCapabilities = v5->_businessMessagingCapabilities;
    v5->_businessMessagingCapabilities = (CTLazuliBusinessMessagingCapabilities *)v28;
LABEL_34:

    v5->_featureSupported = *((unsigned char *)a3 + 452);
    v5->_featureEnabledByDefault = *((unsigned char *)a3 + 453);
    v5->_featureDisabledByProfile = *((unsigned char *)a3 + 454);
    v5->_featureDisabledStoreDemo = *((unsigned char *)a3 + 455);
    if (*((unsigned char *)a3 + 464))
    {
      uint64_t v30 = [NSNumber numberWithUnsignedLong:*((void *)a3 + 57)];
      bsfPort = v5->_bsfPort;
      v5->_bsfPort = (NSNumber *)v30;
    }
    else
    {
      bsfPort = v5->_bsfPort;
      v5->_bsfPort = 0;
    }

    v5->_bsfUsesSecureTransport = *((unsigned char *)a3 + 472);
    return v5;
  }
LABEL_39:
  result = (CTLazuliSystemConfiguration *)std::__throw_bad_optional_access[abi:nn180100]();
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTLazuliMessagingCapabilities)messagingCapabilities
{
  return self->_messagingCapabilities;
}

- (void)setMessagingCapabilities:(id)a3
{
}

- (CTLazuliChatCapabilities)chatCapabilities
{
  return self->_chatCapabilities;
}

- (void)setChatCapabilities:(id)a3
{
}

- (CTLazuliGroupChatCapabilities)groupChatCapabilites
{
  return self->_groupChatCapabilites;
}

- (void)setGroupChatCapabilites:(id)a3
{
}

- (CTLazuliFileTransferCapabilities)fileTransferCapabilities
{
  return self->_fileTransferCapabilities;
}

- (void)setFileTransferCapabilities:(id)a3
{
}

- (CTLazuliOperationStatus)operationStatus
{
  return self->_operationStatus;
}

- (void)setOperationStatus:(id)a3
{
}

- (CTLazuliDiscoveryCapabilities)discoverCapabilities
{
  return self->_discoverCapabilities;
}

- (void)setDiscoverCapabilities:(id)a3
{
}

- (CTLazuliUserIdentities)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (CTLazuliBusinessMessagingCapabilities)businessMessagingCapabilities
{
  return self->_businessMessagingCapabilities;
}

- (void)setBusinessMessagingCapabilities:(id)a3
{
}

- (BOOL)featureSupported
{
  return self->_featureSupported;
}

- (void)setFeatureSupported:(BOOL)a3
{
  self->_featureSupported = a3;
}

- (BOOL)featureEnabledByDefault
{
  return self->_featureEnabledByDefault;
}

- (void)setFeatureEnabledByDefault:(BOOL)a3
{
  self->_featureEnabledByDefault = a3;
}

- (BOOL)featureDisabledByProfile
{
  return self->_featureDisabledByProfile;
}

- (void)setFeatureDisabledByProfile:(BOOL)a3
{
  self->_featureDisabledByProfile = a3;
}

- (BOOL)featureDisabledStoreDemo
{
  return self->_featureDisabledStoreDemo;
}

- (void)setFeatureDisabledStoreDemo:(BOOL)a3
{
  self->_featureDisabledStoreDemo = a3;
}

- (NSNumber)bsfPort
{
  return self->_bsfPort;
}

- (void)setBsfPort:(id)a3
{
}

- (BOOL)bsfUsesSecureTransport
{
  return self->_bsfUsesSecureTransport;
}

- (void)setBsfUsesSecureTransport:(BOOL)a3
{
  self->_bsfUsesSecureTransport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bsfPort, 0);
  objc_storeStrong((id *)&self->_businessMessagingCapabilities, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_discoverCapabilities, 0);
  objc_storeStrong((id *)&self->_operationStatus, 0);
  objc_storeStrong((id *)&self->_fileTransferCapabilities, 0);
  objc_storeStrong((id *)&self->_groupChatCapabilites, 0);
  objc_storeStrong((id *)&self->_chatCapabilities, 0);

  objc_storeStrong((id *)&self->_messagingCapabilities, 0);
}

@end