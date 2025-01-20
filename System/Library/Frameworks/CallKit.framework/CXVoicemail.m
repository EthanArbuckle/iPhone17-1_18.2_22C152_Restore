@interface CXVoicemail
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVoicemail:(id)a3;
- (BOOL)isPlayed;
- (BOOL)isTrashed;
- (CXHandle)sender;
- (CXVoicemail)init;
- (CXVoicemail)initWithCoder:(id)a3;
- (CXVoicemail)initWithUUID:(id)a3;
- (NSDate)dateReceived;
- (NSURL)audioFileURL;
- (NSUUID)UUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sanitizedCopy;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioFileURL:(id)a3;
- (void)setDateReceived:(id)a3;
- (void)setPlayed:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setTrashed:(BOOL)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXVoicemail

- (CXVoicemail)init
{
  return 0;
}

- (CXVoicemail)initWithUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CXVoicemail;
  v6 = [(CXVoicemail *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_UUID, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXVoicemail)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_UUID);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];
  v8 = [(CXVoicemail *)self initWithUUID:v7];

  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    v10 = NSStringFromSelector(sel_sender);
    uint64_t v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    sender = v8->_sender;
    v8->_sender = (CXHandle *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_dateReceived);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    dateReceived = v8->_dateReceived;
    v8->_dateReceived = (NSDate *)v15;

    uint64_t v17 = objc_opt_class();
    v18 = NSStringFromSelector(sel_audioFileURL);
    uint64_t v19 = [v4 decodeObjectOfClass:v17 forKey:v18];
    audioFileURL = v8->_audioFileURL;
    v8->_audioFileURL = (NSURL *)v19;

    v21 = NSStringFromSelector(sel_isPlayed);
    v8->_played = [v4 decodeBoolForKey:v21];

    v22 = NSStringFromSelector(sel_isTrashed);
    v8->_trashed = [v4 decodeBoolForKey:v22];
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXVoicemail *)self UUID];
  v6 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(CXVoicemail *)self sender];
  v8 = NSStringFromSelector(sel_sender);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(CXVoicemail *)self dateReceived];
  v10 = NSStringFromSelector(sel_dateReceived);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(CXVoicemail *)self audioFileURL];
  v12 = NSStringFromSelector(sel_audioFileURL);
  [v4 encodeObject:v11 forKey:v12];

  BOOL v13 = [(CXVoicemail *)self isPlayed];
  v14 = NSStringFromSelector(sel_isPlayed);
  [v4 encodeBool:v13 forKey:v14];

  BOOL v15 = [(CXVoicemail *)self isTrashed];
  NSStringFromSelector(sel_isTrashed);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v15 forKey:v16];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CXVoicemail *)self UUID];
  uint64_t v5 = [v4 UUIDString];
  [v3 appendFormat:@" UUID=%@", v5];

  v6 = [(CXVoicemail *)self sender];
  [v3 appendFormat:@" sender=%@", v6];

  v7 = [(CXVoicemail *)self dateReceived];
  [v3 appendFormat:@" dateReceived=%@", v7];

  v8 = [(CXVoicemail *)self audioFileURL];
  [v3 appendFormat:@" audioFileURL=%@", v8];

  objc_msgSend(v3, "appendFormat:", @" played=%d", -[CXVoicemail isPlayed](self, "isPlayed"));
  objc_msgSend(v3, "appendFormat:", @" trashed=%d", -[CXVoicemail isTrashed](self, "isTrashed"));
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CXVoicemail *)self isEqualToVoicemail:v4];

  return v5;
}

- (BOOL)isEqualToVoicemail:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXVoicemail *)self UUID];
  v6 = [v4 UUID];
  if ([v5 isEqual:v6])
  {
    uint64_t v7 = [(CXVoicemail *)self sender];
    uint64_t v8 = [v4 sender];
    if (v7 | v8 && ![(id)v7 isEqual:v8])
    {
      LOBYTE(v14) = 0;
    }
    else
    {
      uint64_t v9 = [(CXVoicemail *)self dateReceived];
      uint64_t v10 = [v4 dateReceived];
      if (v9 | v10 && ![(id)v9 isEqual:v10])
      {
        LOBYTE(v14) = 0;
      }
      else
      {
        uint64_t v11 = [(CXVoicemail *)self audioFileURL];
        uint64_t v12 = [v4 audioFileURL];
        if (v11 | v12 && ![(id)v11 isEqual:v12])
        {
          LOBYTE(v14) = 0;
        }
        else
        {
          uint64_t v17 = v9;
          int v13 = [(CXVoicemail *)self isPlayed];
          if (v13 == [v4 isPlayed])
          {
            BOOL v15 = [(CXVoicemail *)self isTrashed];
            int v14 = v15 ^ [v4 isTrashed] ^ 1;
          }
          else
          {
            LOBYTE(v14) = 0;
          }
          uint64_t v9 = v17;
        }
      }
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(CXVoicemail *)self UUID];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(CXVoicemail *)self sender];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(CXVoicemail *)self dateReceived];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(CXVoicemail *)self audioFileURL];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  if ([(CXVoicemail *)self isPlayed]) {
    uint64_t v11 = 1231;
  }
  else {
    uint64_t v11 = 1237;
  }
  if ([(CXVoicemail *)self isTrashed]) {
    uint64_t v12 = 1231;
  }
  else {
    uint64_t v12 = 1237;
  }
  unint64_t v13 = v10 ^ v11 ^ v12;

  return v13;
}

- (id)sanitizedCopy
{
  return [(CXVoicemail *)self sanitizedCopyWithZone:0];
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v9 = a3;
  [(CXVoicemail *)self updateSanitizedCopy:v9 withZone:a4];
  uint64_t v6 = [(CXVoicemail *)self sender];
  [v9 setSender:v6];

  uint64_t v7 = [(CXVoicemail *)self dateReceived];
  [v9 setDateReceived:v7];

  uint64_t v8 = [(CXVoicemail *)self audioFileURL];
  [v9 setAudioFileURL:v8];

  objc_msgSend(v9, "setPlayed:", -[CXVoicemail isPlayed](self, "isPlayed"));
  objc_msgSend(v9, "setTrashed:", -[CXVoicemail isTrashed](self, "isTrashed"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(CXVoicemail *)self UUID];
  uint64_t v7 = (void *)[v5 initWithUUID:v6];

  [(CXVoicemail *)self updateCopy:v7 withZone:a3];
  return v7;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (CXHandle)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSDate)dateReceived
{
  return self->_dateReceived;
}

- (void)setDateReceived:(id)a3
{
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
}

- (BOOL)isPlayed
{
  return self->_played;
}

- (void)setPlayed:(BOOL)a3
{
  self->_played = a3;
}

- (BOOL)isTrashed
{
  return self->_trashed;
}

- (void)setTrashed:(BOOL)a3
{
  self->_trashed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_dateReceived, 0);
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end