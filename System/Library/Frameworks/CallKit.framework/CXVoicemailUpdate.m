@interface CXVoicemailUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isPlayed;
- (BOOL)isTrashed;
- (CXHandle)sender;
- (CXVoicemailUpdate)initWithCoder:(id)a3;
- (CXVoicemailUpdate)initWithVoicemailUUID:(id)a3;
- (CXVoicemailUpdateHasSet)hasSet;
- (NSDate)dateReceived;
- (NSString)description;
- (NSURL)audioFileURL;
- (NSUUID)UUID;
- (NSUUID)voicemailUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioFileURL:(id)a3;
- (void)setDateReceived:(id)a3;
- (void)setHasSet:(CXVoicemailUpdateHasSet)a3;
- (void)setPlayed:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setTrashed:(BOOL)a3;
- (void)setUUID:(id)a3;
- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXVoicemailUpdate

- (CXVoicemailUpdate)initWithVoicemailUUID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CXVoicemailUpdate;
  v5 = [(CXVoicemailUpdate *)&v11 init];
  if (v5)
  {
    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXVoicemailUpdate initWithVoicemailUUID:]", @"voicemailUUID" format];
    }
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    uint64_t v8 = [v4 copy];
    voicemailUUID = v5->_voicemailUUID;
    v5->_voicemailUUID = (NSUUID *)v8;
  }
  return v5;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CXVoicemailUpdate *)self UUID];
  v5 = [v4 UUIDString];
  [v3 appendFormat:@" UUID=%@", v5];

  uint64_t v6 = [(CXVoicemailUpdate *)self voicemailUUID];
  v7 = [v6 UUIDString];
  [v3 appendFormat:@" voicemailUUID=%@", v7];

  if ([(CXVoicemailUpdate *)self hasSet])
  {
    uint64_t v8 = [(CXVoicemailUpdate *)self sender];
    [v3 appendFormat:@" sender=%@", v8];
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 2) != 0)
  {
    v9 = [(CXVoicemailUpdate *)self dateReceived];
    [v3 appendFormat:@" dateReceived=%@", v9];
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 4) != 0)
  {
    v10 = [(CXVoicemailUpdate *)self audioFileURL];
    [v3 appendFormat:@" audioFileURL=%@", v10];
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 8) != 0) {
    objc_msgSend(v3, "appendFormat:", @" played=%d", -[CXVoicemailUpdate isPlayed](self, "isPlayed"));
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 0x10) != 0) {
    objc_msgSend(v3, "appendFormat:", @" trashed=%d", -[CXVoicemailUpdate isTrashed](self, "isTrashed"));
  }
  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (void)setSender:(id)a3
{
  *(unsigned char *)&self->_hasSet |= 1u;
  self->_sender = (CXHandle *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setDateReceived:(id)a3
{
  *(unsigned char *)&self->_hasSet |= 2u;
  self->_dateReceived = (NSDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setAudioFileURL:(id)a3
{
  *(unsigned char *)&self->_hasSet |= 4u;
  self->_audioFileURL = (NSURL *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setPlayed:(BOOL)a3
{
  *(unsigned char *)&self->_hasSet |= 8u;
  self->_played = a3;
}

- (void)setTrashed:(BOOL)a3
{
  *(unsigned char *)&self->_hasSet |= 0x10u;
  self->_trashed = a3;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  v14 = a3;
  uint64_t v6 = [(CXVoicemailUpdate *)self UUID];
  v7 = (void *)[v6 copyWithZone:a4];
  [v14 setUUID:v7];

  if ([(CXVoicemailUpdate *)self hasSet])
  {
    v14[12] |= 1u;
    uint64_t v8 = [(CXVoicemailUpdate *)self sender];
    v9 = (void *)[v8 copyWithZone:a4];
    [v14 setSender:v9];
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 2) != 0)
  {
    v14[12] |= 2u;
    v10 = [(CXVoicemailUpdate *)self dateReceived];
    objc_super v11 = (void *)[v10 copyWithZone:a4];
    [v14 setDateReceived:v11];
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 4) != 0)
  {
    v14[12] |= 4u;
    v12 = [(CXVoicemailUpdate *)self audioFileURL];
    v13 = (void *)[v12 copyWithZone:a4];
    [v14 setAudioFileURL:v13];
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 8) != 0)
  {
    v14[12] |= 8u;
    objc_msgSend(v14, "setPlayed:", -[CXVoicemailUpdate isPlayed](self, "isPlayed"));
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 0x10) != 0)
  {
    v14[12] |= 0x10u;
    objc_msgSend(v14, "setTrashed:", -[CXVoicemailUpdate isTrashed](self, "isTrashed"));
  }
}

- (id)sanitizedCopy
{
  return [(CXVoicemailUpdate *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(CXVoicemailUpdate *)self voicemailUUID];
  v7 = (void *)[v6 copyWithZone:a3];
  uint64_t v8 = (void *)[v5 initWithVoicemailUUID:v7];

  [(CXVoicemailUpdate *)self updateSanitizedCopy:v8 withZone:a3];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(CXVoicemailUpdate *)self voicemailUUID];
  v7 = (void *)[v6 copyWithZone:a3];
  uint64_t v8 = (void *)[v5 initWithVoicemailUUID:v7];

  [(CXVoicemailUpdate *)self updateCopy:v8 withZone:a3];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXVoicemailUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_voicemailUUID);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = [(CXVoicemailUpdate *)self initWithVoicemailUUID:v7];
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_UUID);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    UUID = v8->_UUID;
    v8->_UUID = (NSUUID *)v11;

    uint64_t v27 = 0;
    id v13 = v4;
    v14 = NSStringFromSelector(sel_hasSet);
    v15 = (CXVoicemailUpdateHasSet *)[v13 decodeBytesForKey:v14 returnedLength:&v27];

    if (v27 != 4)
    {
      v25 = 0;
      goto LABEL_15;
    }
    v8->_hasSet = *v15;
    if ([(CXVoicemailUpdate *)v8 hasSet])
    {
      v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v17 = [v13 decodeObjectOfClasses:v16 forKey:@"sender"];
      sender = v8->_sender;
      v8->_sender = (CXHandle *)v17;
    }
    if (([(CXVoicemailUpdate *)v8 hasSet] & 2) != 0)
    {
      v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v20 = [v13 decodeObjectOfClasses:v19 forKey:@"dateReceived"];
      dateReceived = v8->_dateReceived;
      v8->_dateReceived = (NSDate *)v20;
    }
    if (([(CXVoicemailUpdate *)v8 hasSet] & 4) != 0)
    {
      v22 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      uint64_t v23 = [v13 decodeObjectOfClasses:v22 forKey:@"audioFileURL"];
      audioFileURL = v8->_audioFileURL;
      v8->_audioFileURL = (NSURL *)v23;
    }
    if (([(CXVoicemailUpdate *)v8 hasSet] & 8) != 0) {
      v8->_played = [v13 decodeBoolForKey:@"played"];
    }
    if (([(CXVoicemailUpdate *)v8 hasSet] & 0x10) != 0) {
      v8->_trashed = [v13 decodeBoolForKey:@"trashed"];
    }
  }
  v25 = v8;
LABEL_15:

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(CXVoicemailUpdate *)self UUID];
  uint64_t v5 = NSStringFromSelector(sel_UUID);
  [v12 encodeObject:v4 forKey:v5];

  uint64_t v6 = [(CXVoicemailUpdate *)self voicemailUUID];
  v7 = NSStringFromSelector(sel_voicemailUUID);
  [v12 encodeObject:v6 forKey:v7];

  uint64_t v8 = NSStringFromSelector(sel_hasSet);
  [v12 encodeBytes:&self->_hasSet length:4 forKey:v8];

  if ([(CXVoicemailUpdate *)self hasSet])
  {
    uint64_t v9 = [(CXVoicemailUpdate *)self sender];
    [v12 encodeObject:v9 forKey:@"sender"];
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 2) != 0)
  {
    v10 = [(CXVoicemailUpdate *)self dateReceived];
    [v12 encodeObject:v10 forKey:@"dateReceived"];
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 4) != 0)
  {
    uint64_t v11 = [(CXVoicemailUpdate *)self audioFileURL];
    [v12 encodeObject:v11 forKey:@"audioFileURL"];
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 8) != 0) {
    objc_msgSend(v12, "encodeBool:forKey:", -[CXVoicemailUpdate isPlayed](self, "isPlayed"), @"played");
  }
  if (([(CXVoicemailUpdate *)self hasSet] & 0x10) != 0) {
    objc_msgSend(v12, "encodeBool:forKey:", -[CXVoicemailUpdate isTrashed](self, "isTrashed"), @"trashed");
  }
}

- (NSUUID)voicemailUUID
{
  return self->_voicemailUUID;
}

- (CXHandle)sender
{
  return self->_sender;
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (CXVoicemailUpdateHasSet)hasSet
{
  return self->_hasSet;
}

- (void)setHasSet:(CXVoicemailUpdateHasSet)a3
{
  self->_hasSet = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_voicemailUUID, 0);
}

@end