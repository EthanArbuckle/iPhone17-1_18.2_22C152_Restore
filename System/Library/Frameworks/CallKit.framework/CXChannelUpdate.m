@interface CXChannelUpdate
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)accessoryButtonEventsEnabled;
- (CXChannelUpdate)init;
- (CXChannelUpdate)initWithCoder:(id)a3;
- (CXChannelUpdate)updateWithUpdate:(id)a3;
- (CXChannelUpdateHasSet)hasSet;
- (CXParticipant)activeRemoteParticipant;
- (CXSandboxExtendedURL)sandboxExtendedImageURL;
- (NSString)audioCategory;
- (NSString)audioMode;
- (NSString)name;
- (NSURL)imageURL;
- (NSUUID)UUID;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (int64_t)audioBluetoothFormat;
- (int64_t)audioInterruptionOperationMode;
- (int64_t)audioInterruptionProvider;
- (int64_t)serviceStatus;
- (int64_t)transmissionMode;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryButtonEventsEnabled:(BOOL)a3;
- (void)setActiveRemoteParticipant:(id)a3;
- (void)setAudioBluetoothFormat:(int64_t)a3;
- (void)setAudioCategory:(id)a3;
- (void)setAudioInterruptionOperationMode:(int64_t)a3;
- (void)setAudioInterruptionProvider:(int64_t)a3;
- (void)setAudioMode:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setName:(id)a3;
- (void)setSandboxExtendedImageURL:(id)a3;
- (void)setServiceStatus:(int64_t)a3;
- (void)setTransmissionMode:(int64_t)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXChannelUpdate

- (CXChannelUpdate)init
{
  v7.receiver = self;
  v7.super_class = (Class)CXChannelUpdate;
  v2 = [(CXChannelUpdate *)&v7 init];
  v3 = (CXChannelUpdate *)v2;
  if (v2)
  {
    *(_WORD *)(v2 + 9) = 0;
    v4 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    UUID = v3->_UUID;
    v3->_UUID = v4;
  }
  return v3;
}

- (void)setActiveRemoteParticipant:(id)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 1u;
  objc_storeStrong((id *)&self->_activeRemoteParticipant, a3);
}

- (void)setAudioBluetoothFormat:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 2u;
  self->_audioBluetoothFormat = a3;
}

- (void)setAudioCategory:(id)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 4u;
  self->_audioCategory = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setAudioInterruptionOperationMode:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x10u;
  self->_audioInterruptionOperationMode = a3;
}

- (void)setAudioInterruptionProvider:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 8u;
  self->_audioInterruptionProvider = a3;
}

- (void)setAudioMode:(id)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x20u;
  self->_audioMode = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setSandboxExtendedImageURL:(id)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x80u;
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, a3);
}

- (void)setName:(id)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x40u;
  self->_name = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setServiceStatus:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x100u;
  self->_serviceStatus = a3;
}

- (void)setTransmissionMode:(int64_t)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x200u;
  self->_transmissionMode = a3;
}

- (void)setAccessoryButtonEventsEnabled:(BOOL)a3
{
  *(_WORD *)(&self->_accessoryButtonEventsEnabled + 1) |= 0x400u;
  self->_accessoryButtonEventsEnabled = a3;
}

- (NSURL)imageURL
{
  v2 = [(CXChannelUpdate *)self sandboxExtendedImageURL];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

- (void)setImageURL:(id)a3
{
  if (a3)
  {
    uint64_t v4 = CXGetSandboxExtendedFileURL(a3);
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(CXChannelUpdate *)self setSandboxExtendedImageURL:v4];
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v13 = (char *)a3;
  v6 = [(CXChannelUpdate *)self UUID];
  uint64_t v7 = [v6 copyWithZone:a4];
  v8 = (void *)*((void *)v13 + 12);
  *((void *)v13 + 12) = v7;

  if ([(CXChannelUpdate *)self hasSet])
  {
    *(_WORD *)(v13 + 9) |= 1u;
    v9 = [(CXChannelUpdate *)self activeRemoteParticipant];
    [v13 setActiveRemoteParticipant:v9];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x40) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x40u;
    v10 = [(CXChannelUpdate *)self name];
    v11 = (void *)[v10 copyWithZone:a4];
    [v13 setName:v11];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x80) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x80u;
    v12 = [(CXChannelUpdate *)self sandboxExtendedImageURL];
    [v13 setSandboxExtendedImageURL:v12];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x100) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x100u;
    objc_msgSend(v13, "setServiceStatus:", -[CXChannelUpdate serviceStatus](self, "serviceStatus"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x200) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x200u;
    objc_msgSend(v13, "setTransmissionMode:", -[CXChannelUpdate transmissionMode](self, "transmissionMode"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x400) != 0)
  {
    *(_WORD *)(v13 + 9) |= 0x400u;
    objc_msgSend(v13, "setAccessoryButtonEventsEnabled:", -[CXChannelUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"));
  }
}

- (id)sanitizedCopy
{
  return [(CXChannelUpdate *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXChannelUpdate *)self updateSanitizedCopy:v5 withZone:a3];

  return v5;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v10 = (char *)a3;
  -[CXChannelUpdate updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:");
  if (([(CXChannelUpdate *)self hasSet] & 2) != 0)
  {
    *(_WORD *)(v10 + 9) |= 2u;
    objc_msgSend(v10, "setAudioBluetoothFormat:", -[CXChannelUpdate audioBluetoothFormat](self, "audioBluetoothFormat"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 4) != 0)
  {
    *(_WORD *)(v10 + 9) |= 4u;
    v6 = [(CXChannelUpdate *)self audioCategory];
    uint64_t v7 = (void *)[v6 copyWithZone:a4];
    [v10 setAudioCategory:v7];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x10) != 0)
  {
    *(_WORD *)(v10 + 9) |= 0x10u;
    objc_msgSend(v10, "setAudioInterruptionOperationMode:", -[CXChannelUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 8) != 0)
  {
    *(_WORD *)(v10 + 9) |= 8u;
    objc_msgSend(v10, "setAudioInterruptionProvider:", -[CXChannelUpdate audioInterruptionProvider](self, "audioInterruptionProvider"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x20) != 0)
  {
    *(_WORD *)(v10 + 9) |= 0x20u;
    v8 = [(CXChannelUpdate *)self audioMode];
    v9 = (void *)[v8 copyWithZone:a4];
    [v10 setAudioMode:v9];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [(CXChannelUpdate *)self updateCopy:v5 withZone:a3];
  return v5;
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelUpdate)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CXChannelUpdate;
  uint64_t v5 = [(CXChannelUpdate *)&v38 init];
  if (!v5)
  {
LABEL_35:
    v34 = v5;
    goto LABEL_36;
  }
  uint64_t v37 = 0;
  id v6 = v4;
  id v7 = NSStringFromSelector(sel_hasSet);
  uint64_t v8 = (_WORD *)[v6 decodeBytesForKey:v7 returnedLength:&v37];

  if (v37 == 2)
  {
    *(_WORD *)(v5 + 9) = *v8;
    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_UUID);
    uint64_t v11 = [v6 decodeObjectOfClass:v9 forKey:v10];
    v12 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v11;

    if ([v5 hasSet])
    {
      v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v14 = [v6 decodeObjectOfClasses:v13 forKey:@"activeRemoteParticipant"];
      v15 = (void *)*((void *)v5 + 2);
      *((void *)v5 + 2) = v14;
    }
    if (([v5 hasSet] & 2) != 0) {
      *((void *)v5 + 6) = [v6 decodeIntegerForKey:@"audioBluetoothFormat"];
    }
    if (([v5 hasSet] & 4) != 0)
    {
      v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v17 = [v6 decodeObjectOfClasses:v16 forKey:@"audioCategory"];
      v18 = (void *)*((void *)v5 + 7);
      *((void *)v5 + 7) = v17;
    }
    if (([v5 hasSet] & 0x10) != 0) {
      *((void *)v5 + 8) = [v6 decodeIntegerForKey:@"audioInterruptionOperationMode"];
    }
    if (([v5 hasSet] & 8) != 0) {
      *((void *)v5 + 9) = [v6 decodeIntegerForKey:@"audioInterruptionProvider"];
    }
    if (([v5 hasSet] & 0x20) != 0)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v20 = [v6 decodeObjectOfClasses:v19 forKey:@"audioMode"];
      v21 = (void *)*((void *)v5 + 10);
      *((void *)v5 + 10) = v20;
    }
    if (([v5 hasSet] & 0x40) != 0)
    {
      v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v23 = [v6 decodeObjectOfClasses:v22 forKey:@"name"];
      v24 = (void *)*((void *)v5 + 3);
      *((void *)v5 + 3) = v23;
    }
    if (([v5 hasSet] & 0x100) != 0) {
      *((void *)v5 + 4) = [v6 decodeIntegerForKey:@"serviceStatus"];
    }
    if (([v5 hasSet] & 0x200) != 0) {
      *((void *)v5 + 5) = [v6 decodeIntegerForKey:@"transmissionMode"];
    }
    if (([v5 hasSet] & 0x400) != 0) {
      v5[8] = [v6 decodeBoolForKey:@"accessoryButtonEventsEnabled"];
    }
    uint64_t v25 = objc_opt_class();
    v26 = NSStringFromSelector(sel_sandboxExtendedImageURL);
    v27 = [v6 decodeObjectOfClass:v25 forKey:v26];

    if (v27)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v6 connection], v28 = objc_claimAutoreleasedReturnValue(), v28, v28))
      {
        v29 = [v6 connection];
        v30 = [v27 URL];
        int v31 = objc_msgSend(v29, "cx_clientSandboxCanAccessFileURL:", v30);

        if (v31)
        {
          id v32 = v27;
          v33 = *((void *)v5 + 11);
          *((void *)v5 + 11) = v32;
        }
        else
        {
          v33 = CXDefaultLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v27;
            _os_log_impl(&dword_1A6E3A000, v33, OS_LOG_TYPE_DEFAULT, "[WARN] Client does not have permission to access %@", buf, 0xCu);
          }
        }
      }
      else
      {
        id v35 = v27;
        v29 = (void *)*((void *)v5 + 11);
        *((void *)v5 + 11) = v35;
      }
    }
    goto LABEL_35;
  }
  v34 = 0;
LABEL_36:

  return v34;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(CXChannelUpdate *)self UUID];
  uint64_t v5 = NSStringFromSelector(sel_UUID);
  [v12 encodeObject:v4 forKey:v5];

  id v6 = NSStringFromSelector(sel_hasSet);
  [v12 encodeBytes:&self->_accessoryButtonEventsEnabled + 1 length:2 forKey:v6];

  if ([(CXChannelUpdate *)self hasSet])
  {
    id v7 = [(CXChannelUpdate *)self activeRemoteParticipant];
    [v12 encodeObject:v7 forKey:@"activeRemoteParticipant"];
  }
  if (([(CXChannelUpdate *)self hasSet] & 2) != 0) {
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate audioBluetoothFormat](self, "audioBluetoothFormat"), @"audioBluetoothFormat");
  }
  if (([(CXChannelUpdate *)self hasSet] & 4) != 0)
  {
    uint64_t v8 = [(CXChannelUpdate *)self audioCategory];
    [v12 encodeObject:v8 forKey:@"audioCategory"];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x10) != 0) {
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"), @"audioInterruptionOperationMode");
  }
  if (([(CXChannelUpdate *)self hasSet] & 8) != 0) {
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate audioInterruptionProvider](self, "audioInterruptionProvider"), @"audioInterruptionProvider");
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x20) != 0)
  {
    uint64_t v9 = [(CXChannelUpdate *)self audioMode];
    [v12 encodeObject:v9 forKey:@"audioMode"];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x40) != 0)
  {
    v10 = [(CXChannelUpdate *)self name];
    [v12 encodeObject:v10 forKey:@"name"];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x80) != 0)
  {
    uint64_t v11 = [(CXChannelUpdate *)self sandboxExtendedImageURL];
    [v12 encodeObject:v11 forKey:@"sandboxExtendedImageURL"];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x100) != 0) {
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate serviceStatus](self, "serviceStatus"), @"serviceStatus");
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x200) != 0) {
    objc_msgSend(v12, "encodeInteger:forKey:", -[CXChannelUpdate transmissionMode](self, "transmissionMode"), @"transmissionMode");
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x400) != 0) {
    objc_msgSend(v12, "encodeBool:forKey:", -[CXChannelUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"), @"accessoryButtonEventsEnabled");
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(CXChannelUpdate *)self UUID];
  id v6 = [v3 stringWithFormat:@"<%@ %p UUID=%@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  uint64_t v4 = [(CXChannelUpdate *)self UUID];
  [v3 appendFormat:@" UUID=%@", v4];

  if ([(CXChannelUpdate *)self hasSet])
  {
    uint64_t v5 = [(CXChannelUpdate *)self activeRemoteParticipant];
    [v3 appendFormat:@" activeRemoteParticipant=%@", v5];
  }
  if (([(CXChannelUpdate *)self hasSet] & 2) != 0) {
    objc_msgSend(v3, "appendFormat:", @" audioBluetoothFormat=%ld", -[CXChannelUpdate audioBluetoothFormat](self, "audioBluetoothFormat"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 4) != 0)
  {
    id v6 = [(CXChannelUpdate *)self audioCategory];
    [v3 appendFormat:@" audioCategory=%@", v6];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x10) != 0) {
    objc_msgSend(v3, "appendFormat:", @" audioInterruptionOperationMode=%ld", -[CXChannelUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 8) != 0) {
    objc_msgSend(v3, "appendFormat:", @" audioInterruptionProvider=%ld", -[CXChannelUpdate audioInterruptionProvider](self, "audioInterruptionProvider"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x20) != 0)
  {
    id v7 = [(CXChannelUpdate *)self audioMode];
    [v3 appendFormat:@" audioMode=%@", v7];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x80) != 0)
  {
    uint64_t v8 = [(CXChannelUpdate *)self sandboxExtendedImageURL];
    [v3 appendFormat:@" imageURL=%@", v8];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x40) != 0)
  {
    uint64_t v9 = [(CXChannelUpdate *)self name];
    [v3 appendFormat:@" name=%@", v9];
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x100) != 0) {
    objc_msgSend(v3, "appendFormat:", @" serviceStatus=%ld", -[CXChannelUpdate serviceStatus](self, "serviceStatus"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x200) != 0) {
    objc_msgSend(v3, "appendFormat:", @" transmissionMode=%ld", -[CXChannelUpdate transmissionMode](self, "transmissionMode"));
  }
  if (([(CXChannelUpdate *)self hasSet] & 0x400) != 0) {
    objc_msgSend(v3, "appendFormat:", @" accessoryButtonEventsEnabled=%d", -[CXChannelUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"));
  }
  [v3 appendString:@">"];

  return v3;
}

- (CXChannelUpdate)updateWithUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(CXChannelUpdate *)self copy];
  if ([v4 hasSet])
  {
    id v6 = [v4 activeRemoteParticipant];
    [v5 setActiveRemoteParticipant:v6];
  }
  if (([v4 hasSet] & 2) != 0) {
    objc_msgSend(v5, "setAudioBluetoothFormat:", objc_msgSend(v4, "audioBluetoothFormat"));
  }
  if (([v4 hasSet] & 4) != 0)
  {
    id v7 = [v4 audioCategory];
    [v5 setAudioCategory:v7];
  }
  if (([v4 hasSet] & 0x10) != 0) {
    objc_msgSend(v5, "setAudioInterruptionOperationMode:", objc_msgSend(v4, "audioInterruptionOperationMode"));
  }
  if (([v4 hasSet] & 8) != 0) {
    objc_msgSend(v5, "setAudioInterruptionProvider:", objc_msgSend(v4, "audioInterruptionProvider"));
  }
  if (([v4 hasSet] & 0x20) != 0)
  {
    uint64_t v8 = [v4 audioMode];
    [v5 setAudioMode:v8];
  }
  if (([v4 hasSet] & 0x40) != 0)
  {
    uint64_t v9 = [v4 name];
    [v5 setName:v9];
  }
  if (([v4 hasSet] & 0x80) != 0)
  {
    v10 = [v4 sandboxExtendedImageURL];
    [v5 setSandboxExtendedImageURL:v10];
  }
  if (([v4 hasSet] & 0x100) != 0) {
    objc_msgSend(v5, "setServiceStatus:", objc_msgSend(v4, "serviceStatus"));
  }
  if (([v4 hasSet] & 0x200) != 0) {
    objc_msgSend(v5, "setTransmissionMode:", objc_msgSend(v4, "transmissionMode"));
  }
  if (([v4 hasSet] & 0x400) != 0) {
    objc_msgSend(v5, "setAccessoryButtonEventsEnabled:", objc_msgSend(v4, "accessoryButtonEventsEnabled"));
  }

  return (CXChannelUpdate *)v5;
}

- (CXParticipant)activeRemoteParticipant
{
  return self->_activeRemoteParticipant;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (int64_t)transmissionMode
{
  return self->_transmissionMode;
}

- (BOOL)accessoryButtonEventsEnabled
{
  return self->_accessoryButtonEventsEnabled;
}

- (int64_t)audioBluetoothFormat
{
  return self->_audioBluetoothFormat;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (int64_t)audioInterruptionOperationMode
{
  return self->_audioInterruptionOperationMode;
}

- (int64_t)audioInterruptionProvider
{
  return self->_audioInterruptionProvider;
}

- (NSString)audioMode
{
  return self->_audioMode;
}

- (CXChannelUpdateHasSet)hasSet
{
  return (CXChannelUpdateHasSet)*(unsigned __int16 *)(&self->_accessoryButtonEventsEnabled + 1);
}

- (CXSandboxExtendedURL)sandboxExtendedImageURL
{
  return self->_sandboxExtendedImageURL;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_sandboxExtendedImageURL, 0);
  objc_storeStrong((id *)&self->_audioMode, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_activeRemoteParticipant, 0);
}

@end