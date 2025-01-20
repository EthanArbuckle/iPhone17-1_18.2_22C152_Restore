@interface CXProviderConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)includesCallsInRecents;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (BOOL)supportsAudioOnly;
- (BOOL)supportsCurrentPlatform;
- (BOOL)supportsDynamicSystemUI;
- (BOOL)supportsEmergency;
- (BOOL)supportsRinging;
- (BOOL)supportsVideo;
- (BOOL)supportsVoicemail;
- (CXProviderConfiguration)init;
- (CXProviderConfiguration)initWithCoder:(id)a3;
- (CXProviderConfiguration)initWithLocalizedName:(NSString *)localizedName;
- (CXSandboxExtendedURL)ringtoneSoundURL;
- (NSArray)emergencyHandles;
- (NSArray)emergencyLabeledHandles;
- (NSArray)handoffIdentifiers;
- (NSData)iconTemplateImageData;
- (NSOrderedSet)prioritizedSenderIdentities;
- (NSSet)senderIdentities;
- (NSSet)supportedHandleTypes;
- (NSString)description;
- (NSString)localizedName;
- (NSString)ringtoneSound;
- (NSUInteger)maximumCallGroups;
- (NSUInteger)maximumCallsPerCallGroup;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unsigned)audioSessionID;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setEmergencyHandles:(id)a3;
- (void)setEmergencyLabeledHandles:(id)a3;
- (void)setHandoffIdentifiers:(id)a3;
- (void)setIconTemplateImageData:(NSData *)iconTemplateImageData;
- (void)setIncludesCallsInRecents:(BOOL)includesCallsInRecents;
- (void)setLocalizedName:(id)a3;
- (void)setMaximumCallGroups:(NSUInteger)maximumCallGroups;
- (void)setMaximumCallsPerCallGroup:(NSUInteger)maximumCallsPerCallGroup;
- (void)setPrioritizedSenderIdentities:(id)a3;
- (void)setRingtoneSound:(NSString *)ringtoneSound;
- (void)setRingtoneSoundURL:(id)a3;
- (void)setSenderIdentities:(id)a3;
- (void)setSupportedHandleTypes:(NSSet *)supportedHandleTypes;
- (void)setSupportsAudioOnly:(BOOL)a3;
- (void)setSupportsCurrentPlatform:(BOOL)a3;
- (void)setSupportsDynamicSystemUI:(BOOL)a3;
- (void)setSupportsEmergency:(BOOL)a3;
- (void)setSupportsRinging:(BOOL)a3;
- (void)setSupportsVideo:(BOOL)supportsVideo;
- (void)setSupportsVoicemail:(BOOL)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXProviderConfiguration

- (CXProviderConfiguration)init
{
  v13.receiver = self;
  v13.super_class = (Class)CXProviderConfiguration;
  v2 = [(CXProviderConfiguration *)&v13 init];
  v3 = v2;
  if (v2)
  {
    emergencyHandles = v2->_emergencyHandles;
    v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v2->_emergencyHandles = (NSArray *)MEMORY[0x1E4F1CBF0];

    emergencyLabeledHandles = v3->_emergencyLabeledHandles;
    v3->_emergencyLabeledHandles = v5;

    handoffIdentifiers = v3->_handoffIdentifiers;
    v3->_handoffIdentifiers = v5;

    uint64_t v8 = [MEMORY[0x1E4F1CAA0] orderedSet];
    prioritizedSenderIdentities = v3->_prioritizedSenderIdentities;
    v3->_prioritizedSenderIdentities = (NSOrderedSet *)v8;

    *(_OWORD *)&v3->_maximumCallGroups = xmmword_1A6EA95B0;
    v3->_supportsAudioOnly = 1;
    v3->_includesCallsInRecents = 1;
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] set];
    supportedHandleTypes = v3->_supportedHandleTypes;
    v3->_supportedHandleTypes = (NSSet *)v10;

    *(_WORD *)&v3->_supportsCurrentPlatform = 257;
  }
  return v3;
}

- (CXProviderConfiguration)initWithLocalizedName:(NSString *)localizedName
{
  v4 = localizedName;
  v5 = [(CXProviderConfiguration *)self init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXProviderConfiguration initWithLocalizedName:]", @"localizedName" format];
    }
    uint64_t v6 = [(NSString *)v4 copy];
    v7 = v5->_localizedName;
    v5->_localizedName = (NSString *)v6;
  }
  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CXProviderConfiguration *)self localizedName];
  [v3 appendFormat:@" localizedName=%@", v4];

  v5 = [(CXProviderConfiguration *)self ringtoneSoundURL];
  [v3 appendFormat:@" ringtoneSoundURL=%@", v5];

  uint64_t v6 = [(CXProviderConfiguration *)self iconTemplateImageData];
  objc_msgSend(v3, "appendFormat:", @" iconTemplateImageData=%p", v6);

  objc_msgSend(v3, "appendFormat:", @" maximumCallGroups=%lu", -[CXProviderConfiguration maximumCallGroups](self, "maximumCallGroups"));
  objc_msgSend(v3, "appendFormat:", @" maximumCallsPerCallGroup=%lu", -[CXProviderConfiguration maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup"));
  objc_msgSend(v3, "appendFormat:", @" supportsAudioOnly=%d", -[CXProviderConfiguration supportsAudioOnly](self, "supportsAudioOnly"));
  objc_msgSend(v3, "appendFormat:", @" supportsVideo=%d", -[CXProviderConfiguration supportsVideo](self, "supportsVideo"));
  objc_msgSend(v3, "appendFormat:", @" supportsEmergency=%d", -[CXProviderConfiguration supportsEmergency](self, "supportsEmergency"));
  objc_msgSend(v3, "appendFormat:", @" supportsVoicemail=%d", -[CXProviderConfiguration supportsVoicemail](self, "supportsVoicemail"));
  objc_msgSend(v3, "appendFormat:", @" supportsCurrentPlatform=%d", -[CXProviderConfiguration supportsCurrentPlatform](self, "supportsCurrentPlatform"));
  objc_msgSend(v3, "appendFormat:", @" supportsRinging=%d", -[CXProviderConfiguration supportsRinging](self, "supportsRinging"));
  objc_msgSend(v3, "appendFormat:", @" includesCallsInRecents=%d", -[CXProviderConfiguration includesCallsInRecents](self, "includesCallsInRecents"));
  objc_msgSend(v3, "appendFormat:", @" audioSessionID=%u", -[CXProviderConfiguration audioSessionID](self, "audioSessionID"));
  objc_msgSend(v3, "appendFormat:", @" supportsDynamicSystemUI=%d", -[CXProviderConfiguration supportsDynamicSystemUI](self, "supportsDynamicSystemUI"));
  v7 = [(CXProviderConfiguration *)self supportedHandleTypes];
  uint64_t v8 = [v7 allObjects];
  v9 = [v8 componentsJoinedByString:@","];
  [v3 appendFormat:@" supportedHandleTypes=%@", v9];

  uint64_t v10 = [(CXProviderConfiguration *)self emergencyHandles];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [(CXProviderConfiguration *)self emergencyHandles];
    objc_super v13 = [v12 componentsJoinedByString:@", "];
    [v3 appendFormat:@" emergencyHandles=%@", v13];
  }
  v14 = [(CXProviderConfiguration *)self emergencyLabeledHandles];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    v16 = [(CXProviderConfiguration *)self emergencyLabeledHandles];
    v17 = [v16 componentsJoinedByString:@", "];
    [v3 appendFormat:@" emergencyLabeledHandles=%@", v17];
  }
  v18 = [(CXProviderConfiguration *)self handoffIdentifiers];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    v20 = [(CXProviderConfiguration *)self handoffIdentifiers];
    v21 = [v20 componentsJoinedByString:@", "];
    [v3 appendFormat:@" handoffIdentifiers=%@", v21];
  }
  v22 = [(CXProviderConfiguration *)self prioritizedSenderIdentities];
  uint64_t v23 = [v22 count];

  if (v23)
  {
    v24 = [(CXProviderConfiguration *)self prioritizedSenderIdentities];
    v25 = [v24 array];
    v26 = [v25 componentsJoinedByString:@", "];
    [v3 appendFormat:@" prioritizedSenderIdentities=%@", v26];
  }
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (void)setSenderIdentities:(id)a3
{
  id v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithSet:a3];
  [(CXProviderConfiguration *)self setPrioritizedSenderIdentities:v4];
}

- (NSSet)senderIdentities
{
  v2 = [(CXProviderConfiguration *)self prioritizedSenderIdentities];
  v3 = [v2 set];

  return (NSSet *)v3;
}

- (NSString)ringtoneSound
{
  v2 = [(CXProviderConfiguration *)self ringtoneSoundURL];
  v3 = [v2 URL];
  id v4 = [v3 lastPathComponent];

  return (NSString *)v4;
}

- (void)setRingtoneSound:(NSString *)ringtoneSound
{
  id v4 = ringtoneSound;
  [(CXProviderConfiguration *)self setRingtoneSoundURL:0];
  if ([(NSString *)v4 length])
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = [v5 URLsForDirectory:5 inDomains:1];
    v7 = [v6 firstObject];

    uint64_t v8 = [v7 URLByAppendingPathComponent:@"Sounds"];
    v9 = [v8 URLByAppendingPathComponent:v4];

    uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v11 = [v9 path];
    int v12 = [v10 fileExistsAtPath:v11];

    if (v12)
    {
      objc_super v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      v14 = [v9 path];
      id v25 = 0;
      uint64_t v15 = [v13 attributesOfItemAtPath:v14 error:&v25];
      id v16 = v25;

      if (v15)
      {
        v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F283B8]];
        v18 = (void *)*MEMORY[0x1E4F283D0];

        if (v17 != v18)
        {
          uint64_t v19 = [[CXSandboxExtendedURL alloc] initWithURL:v9];
          [(CXProviderConfiguration *)self setRingtoneSoundURL:v19];
        }
      }
      if (v16)
      {
        v20 = CXDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CXProviderConfiguration setRingtoneSound:]((uint64_t)v16, v20);
        }
      }
    }
    v21 = [(CXProviderConfiguration *)self ringtoneSoundURL];

    if (!v21)
    {
      v22 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v23 = [v22 URLForResource:v4 withExtension:0];

      if (v23)
      {
        v24 = [[CXSandboxExtendedURL alloc] initWithURL:v23];
        [(CXProviderConfiguration *)self setRingtoneSoundURL:v24];
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CXProviderConfiguration *)self isEqualToConfiguration:v4];

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXProviderConfiguration *)self emergencyHandles];
  uint64_t v6 = [v4 emergencyHandles];
  if ([v5 isEqualToArray:v6])
  {
    v7 = [(CXProviderConfiguration *)self emergencyLabeledHandles];
    uint64_t v8 = [v4 emergencyLabeledHandles];
    if ([v7 isEqualToArray:v8])
    {
      v9 = [(CXProviderConfiguration *)self handoffIdentifiers];
      uint64_t v10 = [v4 handoffIdentifiers];
      if ([v9 isEqualToArray:v10])
      {
        uint64_t v11 = [(CXProviderConfiguration *)self prioritizedSenderIdentities];
        int v12 = [v4 prioritizedSenderIdentities];
        if ([v11 isEqualToOrderedSet:v12])
        {
          v38 = v12;
          uint64_t v13 = [(CXProviderConfiguration *)self ringtoneSoundURL];
          uint64_t v14 = [v4 ringtoneSoundURL];
          v39 = (void *)v13;
          if (v13 | v14 && (uint64_t v15 = v14, v16 = [v39 isEqual:v14], v14 = v15, !v16))
          {
            char v28 = 0;
            int v12 = v38;
          }
          else
          {
            uint64_t v37 = v14;
            v17 = [(CXProviderConfiguration *)self iconTemplateImageData];
            v35 = [v4 iconTemplateImageData];
            v36 = v17;
            int v18 = objc_msgSend(v17, "isEqualToData:");
            int v12 = v38;
            if (v18)
            {
              v34 = v11;
              NSUInteger v19 = [(CXProviderConfiguration *)self maximumCallGroups];
              if (v19 != [v4 maximumCallGroups]) {
                goto LABEL_17;
              }
              NSUInteger v20 = [(CXProviderConfiguration *)self maximumCallsPerCallGroup];
              if (v20 != [v4 maximumCallsPerCallGroup]) {
                goto LABEL_17;
              }
              int v21 = [(CXProviderConfiguration *)self supportsAudioOnly];
              if (v21 == [v4 supportsAudioOnly]
                && (int v22 = [(CXProviderConfiguration *)self supportsVideo],
                    v22 == [v4 supportsVideo])
                && (int v23 = [(CXProviderConfiguration *)self supportsEmergency],
                    v23 == [v4 supportsEmergency])
                && (int v24 = [(CXProviderConfiguration *)self supportsCurrentPlatform],
                    v24 == [v4 supportsCurrentPlatform])
                && (int v25 = [(CXProviderConfiguration *)self supportsVoicemail],
                    v25 == [v4 supportsVoicemail])
                && (int v26 = [(CXProviderConfiguration *)self supportsRinging],
                    v26 == [v4 supportsRinging])
                && (int v27 = [(CXProviderConfiguration *)self includesCallsInRecents],
                    v27 == [v4 includesCallsInRecents]))
              {
                unsigned int v30 = [(CXProviderConfiguration *)self audioSessionID];
                if (v30 == [v4 audioSessionID]
                  && (int v31 = [(CXProviderConfiguration *)self supportsDynamicSystemUI],
                      v31 == [v4 supportsDynamicSystemUI]))
                {
                  v32 = [(CXProviderConfiguration *)self supportedHandleTypes];
                  v33 = [v4 supportedHandleTypes];
                  char v28 = [v32 isEqualToSet:v33];
                }
                else
                {
                  char v28 = 0;
                }
                uint64_t v11 = v34;
                int v12 = v38;
              }
              else
              {
LABEL_17:
                char v28 = 0;
                uint64_t v11 = v34;
              }
            }
            else
            {
              char v28 = 0;
            }

            uint64_t v14 = v37;
          }
        }
        else
        {
          char v28 = 0;
        }
      }
      else
      {
        char v28 = 0;
      }
    }
    else
    {
      char v28 = 0;
    }
  }
  else
  {
    char v28 = 0;
  }

  return v28;
}

- (unint64_t)hash
{
  v33 = [(CXProviderConfiguration *)self emergencyHandles];
  uint64_t v3 = [v33 hash];
  id v4 = [(CXProviderConfiguration *)self emergencyLabeledHandles];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(CXProviderConfiguration *)self handoffIdentifiers];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(CXProviderConfiguration *)self prioritizedSenderIdentities];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  uint64_t v10 = [(CXProviderConfiguration *)self ringtoneSoundURL];
  uint64_t v11 = [v10 hash];
  int v12 = [(CXProviderConfiguration *)self iconTemplateImageData];
  uint64_t v13 = v11 ^ [v12 hash];
  NSUInteger v14 = v9 ^ v13 ^ [(CXProviderConfiguration *)self maximumCallGroups];
  NSUInteger v15 = [(CXProviderConfiguration *)self maximumCallsPerCallGroup];
  if ([(CXProviderConfiguration *)self supportsAudioOnly]) {
    uint64_t v16 = 1231;
  }
  else {
    uint64_t v16 = 1237;
  }
  NSUInteger v17 = v15 ^ v16;
  if ([(CXProviderConfiguration *)self supportsVideo]) {
    uint64_t v18 = 1231;
  }
  else {
    uint64_t v18 = 1237;
  }
  NSUInteger v19 = v14 ^ v17 ^ v18;
  if ([(CXProviderConfiguration *)self supportsEmergency]) {
    uint64_t v20 = 1231;
  }
  else {
    uint64_t v20 = 1237;
  }
  if ([(CXProviderConfiguration *)self supportsCurrentPlatform]) {
    uint64_t v21 = 1231;
  }
  else {
    uint64_t v21 = 1237;
  }
  uint64_t v22 = v20 ^ v21;
  if ([(CXProviderConfiguration *)self supportsVoicemail]) {
    uint64_t v23 = 1231;
  }
  else {
    uint64_t v23 = 1237;
  }
  uint64_t v24 = v22 ^ v23;
  if ([(CXProviderConfiguration *)self supportsRinging]) {
    uint64_t v25 = 1231;
  }
  else {
    uint64_t v25 = 1237;
  }
  uint64_t v26 = v19 ^ v24 ^ v25;
  if ([(CXProviderConfiguration *)self includesCallsInRecents]) {
    uint64_t v27 = 1231;
  }
  else {
    uint64_t v27 = 1237;
  }
  if ([(CXProviderConfiguration *)self supportsDynamicSystemUI]) {
    uint64_t v28 = 1231;
  }
  else {
    uint64_t v28 = 1237;
  }
  uint64_t v29 = v27 ^ v28 ^ [(CXProviderConfiguration *)self audioSessionID];
  unsigned int v30 = [(CXProviderConfiguration *)self supportedHandleTypes];
  unint64_t v31 = v26 ^ v29 ^ [v30 hash];

  return v31;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v8 = a3;
  objc_msgSend(v8, "setAudioSessionID:", -[CXProviderConfiguration audioSessionID](self, "audioSessionID"));
  uint64_t v5 = [(CXProviderConfiguration *)self ringtoneSoundURL];
  [v8 setRingtoneSoundURL:v5];

  uint64_t v6 = [(CXProviderConfiguration *)self iconTemplateImageData];
  [v8 setIconTemplateImageData:v6];

  objc_msgSend(v8, "setMaximumCallGroups:", -[CXProviderConfiguration maximumCallGroups](self, "maximumCallGroups"));
  objc_msgSend(v8, "setMaximumCallsPerCallGroup:", -[CXProviderConfiguration maximumCallsPerCallGroup](self, "maximumCallsPerCallGroup"));
  objc_msgSend(v8, "setSupportsVideo:", -[CXProviderConfiguration supportsVideo](self, "supportsVideo"));
  objc_msgSend(v8, "setIncludesCallsInRecents:", -[CXProviderConfiguration includesCallsInRecents](self, "includesCallsInRecents"));
  uint64_t v7 = [(CXProviderConfiguration *)self supportedHandleTypes];
  [v8 setSupportedHandleTypes:v7];

  objc_msgSend(v8, "setSupportsDynamicSystemUI:", -[CXProviderConfiguration supportsDynamicSystemUI](self, "supportsDynamicSystemUI"));
}

- (id)sanitizedCopy
{
  return [(CXProviderConfiguration *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXProviderConfiguration *)self updateSanitizedCopy:v5 withZone:a3];

  return v5;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v10 = a3;
  [(CXProviderConfiguration *)self updateSanitizedCopy:v10 withZone:a4];
  uint64_t v6 = [(CXProviderConfiguration *)self emergencyHandles];
  [v10 setEmergencyHandles:v6];

  uint64_t v7 = [(CXProviderConfiguration *)self emergencyLabeledHandles];
  [v10 setEmergencyLabeledHandles:v7];

  id v8 = [(CXProviderConfiguration *)self handoffIdentifiers];
  [v10 setHandoffIdentifiers:v8];

  uint64_t v9 = [(CXProviderConfiguration *)self prioritizedSenderIdentities];
  [v10 setPrioritizedSenderIdentities:v9];

  objc_msgSend(v10, "setSupportsAudioOnly:", -[CXProviderConfiguration supportsAudioOnly](self, "supportsAudioOnly"));
  objc_msgSend(v10, "setSupportsEmergency:", -[CXProviderConfiguration supportsEmergency](self, "supportsEmergency"));
  objc_msgSend(v10, "setSupportsVoicemail:", -[CXProviderConfiguration supportsVoicemail](self, "supportsVoicemail"));
  objc_msgSend(v10, "setSupportsCurrentPlatform:", -[CXProviderConfiguration supportsCurrentPlatform](self, "supportsCurrentPlatform"));
  objc_msgSend(v10, "setSupportsRinging:", -[CXProviderConfiguration supportsRinging](self, "supportsRinging"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXProviderConfiguration *)self updateCopy:v5 withZone:a3];
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXProviderConfiguration)initWithCoder:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v63 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"CXProviderConfiguration cannot be decoded by non-XPC coders." userInfo:0];
    objc_exception_throw(v63);
  }
  uint64_t v5 = [v4 connection];
  uint64_t v6 = [(CXProviderConfiguration *)self init];
  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    id v10 = NSStringFromSelector(sel_emergencyHandles);
    uint64_t v11 = [v4 decodeObjectOfClasses:v9 forKey:v10];
    emergencyHandles = v6->_emergencyHandles;
    v6->_emergencyHandles = (NSArray *)v11;

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    NSUInteger v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = NSStringFromSelector(sel_emergencyLabeledHandles);
    uint64_t v17 = [v4 decodeObjectOfClasses:v15 forKey:v16];
    emergencyLabeledHandles = v6->_emergencyLabeledHandles;
    v6->_emergencyLabeledHandles = (NSArray *)v17;

    NSUInteger v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = NSStringFromSelector(sel_handoffIdentifiers);
    uint64_t v23 = [v4 decodeObjectOfClasses:v21 forKey:v22];
    handoffIdentifiers = v6->_handoffIdentifiers;
    v6->_handoffIdentifiers = (NSArray *)v23;

    uint64_t v25 = objc_opt_class();
    uint64_t v26 = NSStringFromSelector(sel_localizedName);
    uint64_t v27 = [v4 decodeObjectOfClass:v25 forKey:v26];
    localizedName = v6->_localizedName;
    v6->_localizedName = (NSString *)v27;

    uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    unint64_t v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v32 = NSStringFromSelector(sel_prioritizedSenderIdentities);
    uint64_t v33 = [v4 decodeObjectOfClasses:v31 forKey:v32];
    prioritizedSenderIdentities = v6->_prioritizedSenderIdentities;
    v6->_prioritizedSenderIdentities = (NSOrderedSet *)v33;

    uint64_t v35 = objc_opt_class();
    v36 = NSStringFromSelector(sel_iconTemplateImageData);
    uint64_t v37 = [v4 decodeObjectOfClass:v35 forKey:v36];
    iconTemplateImageData = v6->_iconTemplateImageData;
    v6->_iconTemplateImageData = (NSData *)v37;

    v39 = NSStringFromSelector(sel_maximumCallGroups);
    v6->_maximumCallGroups = [v4 decodeIntegerForKey:v39];

    v40 = NSStringFromSelector(sel_maximumCallsPerCallGroup);
    v6->_maximumCallsPerCallGroup = [v4 decodeIntegerForKey:v40];

    v41 = NSStringFromSelector(sel_supportsAudioOnly);
    v6->_supportsAudioOnly = [v4 decodeBoolForKey:v41];

    v42 = NSStringFromSelector(sel_supportsVideo);
    v6->_supportsVideo = [v4 decodeBoolForKey:v42];

    v43 = NSStringFromSelector(sel_supportsEmergency);
    v6->_supportsEmergency = [v4 decodeBoolForKey:v43];

    v44 = NSStringFromSelector(sel_supportsCurrentPlatform);
    v6->_supportsCurrentPlatform = [v4 decodeBoolForKey:v44];

    v45 = NSStringFromSelector(sel_supportsVoicemail);
    v6->_supportsVoicemail = [v4 decodeBoolForKey:v45];

    v46 = NSStringFromSelector(sel_supportsRinging);
    v6->_supportsRinging = [v4 decodeBoolForKey:v46];

    v47 = NSStringFromSelector(sel_supportsDynamicSystemUI);
    v6->_supportsDynamicSystemUI = [v4 decodeBoolForKey:v47];

    v48 = NSStringFromSelector(sel_includesCallsInRecents);
    v6->_includesCallsInRecents = [v4 decodeBoolForKey:v48];

    v49 = NSStringFromSelector(sel_audioSessionID);
    v6->_audioSessionID = [v4 decodeInt32ForKey:v49];

    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    v53 = NSStringFromSelector(sel_supportedHandleTypes);
    uint64_t v54 = [v4 decodeObjectOfClasses:v52 forKey:v53];
    supportedHandleTypes = v6->_supportedHandleTypes;
    v6->_supportedHandleTypes = (NSSet *)v54;

    uint64_t v56 = objc_opt_class();
    v57 = NSStringFromSelector(sel_ringtoneSoundURL);
    v58 = [v4 decodeObjectOfClass:v56 forKey:v57];

    if (v58 && v5)
    {
      v59 = [v58 URL];
      int v60 = objc_msgSend(v5, "cx_clientSandboxCanAccessFileURL:", v59);

      if (v60)
      {
        objc_storeStrong((id *)&v6->_ringtoneSoundURL, v58);
      }
      else
      {
        v61 = CXDefaultLog();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v58;
          _os_log_impl(&dword_1A6E3A000, v61, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring ringtone sound URL because CXProviderConfiguration client did not have access to it: %@", buf, 0xCu);
        }
      }
    }
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXProviderConfiguration *)self localizedName];
  uint64_t v6 = NSStringFromSelector(sel_localizedName);
  [v4 encodeObject:v5 forKey:v6];

  uint64_t v7 = [(CXProviderConfiguration *)self emergencyHandles];
  uint64_t v8 = NSStringFromSelector(sel_emergencyHandles);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(CXProviderConfiguration *)self emergencyLabeledHandles];
  id v10 = NSStringFromSelector(sel_emergencyLabeledHandles);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(CXProviderConfiguration *)self handoffIdentifiers];
  int v12 = NSStringFromSelector(sel_handoffIdentifiers);
  [v4 encodeObject:v11 forKey:v12];

  uint64_t v13 = [(CXProviderConfiguration *)self prioritizedSenderIdentities];
  uint64_t v14 = NSStringFromSelector(sel_prioritizedSenderIdentities);
  [v4 encodeObject:v13 forKey:v14];

  NSUInteger v15 = [(CXProviderConfiguration *)self ringtoneSoundURL];
  uint64_t v16 = NSStringFromSelector(sel_ringtoneSoundURL);
  [v4 encodeObject:v15 forKey:v16];

  uint64_t v17 = [(CXProviderConfiguration *)self iconTemplateImageData];
  uint64_t v18 = NSStringFromSelector(sel_iconTemplateImageData);
  [v4 encodeObject:v17 forKey:v18];

  NSUInteger v19 = [(CXProviderConfiguration *)self maximumCallGroups];
  uint64_t v20 = NSStringFromSelector(sel_maximumCallGroups);
  [v4 encodeInteger:v19 forKey:v20];

  NSUInteger v21 = [(CXProviderConfiguration *)self maximumCallsPerCallGroup];
  uint64_t v22 = NSStringFromSelector(sel_maximumCallsPerCallGroup);
  [v4 encodeInteger:v21 forKey:v22];

  BOOL v23 = [(CXProviderConfiguration *)self supportsAudioOnly];
  uint64_t v24 = NSStringFromSelector(sel_supportsAudioOnly);
  [v4 encodeBool:v23 forKey:v24];

  BOOL v25 = [(CXProviderConfiguration *)self supportsVideo];
  uint64_t v26 = NSStringFromSelector(sel_supportsVideo);
  [v4 encodeBool:v25 forKey:v26];

  BOOL v27 = [(CXProviderConfiguration *)self supportsEmergency];
  uint64_t v28 = NSStringFromSelector(sel_supportsEmergency);
  [v4 encodeBool:v27 forKey:v28];

  BOOL v29 = [(CXProviderConfiguration *)self supportsVoicemail];
  uint64_t v30 = NSStringFromSelector(sel_supportsVoicemail);
  [v4 encodeBool:v29 forKey:v30];

  BOOL v31 = [(CXProviderConfiguration *)self supportsCurrentPlatform];
  v32 = NSStringFromSelector(sel_supportsCurrentPlatform);
  [v4 encodeBool:v31 forKey:v32];

  BOOL v33 = [(CXProviderConfiguration *)self supportsRinging];
  v34 = NSStringFromSelector(sel_supportsRinging);
  [v4 encodeBool:v33 forKey:v34];

  BOOL v35 = [(CXProviderConfiguration *)self includesCallsInRecents];
  v36 = NSStringFromSelector(sel_includesCallsInRecents);
  [v4 encodeBool:v35 forKey:v36];

  uint64_t v37 = [(CXProviderConfiguration *)self audioSessionID];
  v38 = NSStringFromSelector(sel_audioSessionID);
  [v4 encodeInt32:v37 forKey:v38];

  v39 = [(CXProviderConfiguration *)self supportedHandleTypes];
  v40 = NSStringFromSelector(sel_supportedHandleTypes);
  [v4 encodeObject:v39 forKey:v40];

  BOOL v41 = [(CXProviderConfiguration *)self supportsDynamicSystemUI];
  NSStringFromSelector(sel_supportsDynamicSystemUI);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v41 forKey:v42];
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSData)iconTemplateImageData
{
  return self->_iconTemplateImageData;
}

- (void)setIconTemplateImageData:(NSData *)iconTemplateImageData
{
}

- (NSUInteger)maximumCallGroups
{
  return self->_maximumCallGroups;
}

- (void)setMaximumCallGroups:(NSUInteger)maximumCallGroups
{
  self->_maximumCallGroups = maximumCallGroups;
}

- (NSUInteger)maximumCallsPerCallGroup
{
  return self->_maximumCallsPerCallGroup;
}

- (void)setMaximumCallsPerCallGroup:(NSUInteger)maximumCallsPerCallGroup
{
  self->_maximumCallsPerCallGroup = maximumCallsPerCallGroup;
}

- (BOOL)includesCallsInRecents
{
  return self->_includesCallsInRecents;
}

- (void)setIncludesCallsInRecents:(BOOL)includesCallsInRecents
{
  self->_includesCallsInRecents = includesCallsInRecents;
}

- (BOOL)supportsVideo
{
  return self->_supportsVideo;
}

- (void)setSupportsVideo:(BOOL)supportsVideo
{
  self->_supportsVideo = supportsVideo;
}

- (NSSet)supportedHandleTypes
{
  return self->_supportedHandleTypes;
}

- (void)setSupportedHandleTypes:(NSSet *)supportedHandleTypes
{
}

- (NSArray)emergencyHandles
{
  return self->_emergencyHandles;
}

- (void)setEmergencyHandles:(id)a3
{
}

- (NSArray)emergencyLabeledHandles
{
  return self->_emergencyLabeledHandles;
}

- (void)setEmergencyLabeledHandles:(id)a3
{
}

- (NSArray)handoffIdentifiers
{
  return self->_handoffIdentifiers;
}

- (void)setHandoffIdentifiers:(id)a3
{
}

- (NSOrderedSet)prioritizedSenderIdentities
{
  return self->_prioritizedSenderIdentities;
}

- (void)setPrioritizedSenderIdentities:(id)a3
{
}

- (CXSandboxExtendedURL)ringtoneSoundURL
{
  return self->_ringtoneSoundURL;
}

- (void)setRingtoneSoundURL:(id)a3
{
}

- (BOOL)supportsAudioOnly
{
  return self->_supportsAudioOnly;
}

- (void)setSupportsAudioOnly:(BOOL)a3
{
  self->_supportsAudioOnly = a3;
}

- (BOOL)supportsEmergency
{
  return self->_supportsEmergency;
}

- (void)setSupportsEmergency:(BOOL)a3
{
  self->_supportsEmergency = a3;
}

- (BOOL)supportsVoicemail
{
  return self->_supportsVoicemail;
}

- (void)setSupportsVoicemail:(BOOL)a3
{
  self->_supportsVoicemail = a3;
}

- (BOOL)supportsCurrentPlatform
{
  return self->_supportsCurrentPlatform;
}

- (void)setSupportsCurrentPlatform:(BOOL)a3
{
  self->_supportsCurrentPlatform = a3;
}

- (BOOL)supportsRinging
{
  return self->_supportsRinging;
}

- (void)setSupportsRinging:(BOOL)a3
{
  self->_supportsRinging = a3;
}

- (BOOL)supportsDynamicSystemUI
{
  return self->_supportsDynamicSystemUI;
}

- (void)setSupportsDynamicSystemUI:(BOOL)a3
{
  self->_supportsDynamicSystemUI = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringtoneSoundURL, 0);
  objc_storeStrong((id *)&self->_prioritizedSenderIdentities, 0);
  objc_storeStrong((id *)&self->_handoffIdentifiers, 0);
  objc_storeStrong((id *)&self->_emergencyLabeledHandles, 0);
  objc_storeStrong((id *)&self->_emergencyHandles, 0);
  objc_storeStrong((id *)&self->_supportedHandleTypes, 0);
  objc_storeStrong((id *)&self->_iconTemplateImageData, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

- (void)setRingtoneSound:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Error while querying file attributes: %@", (uint8_t *)&v2, 0xCu);
}

@end