@interface ATAudioTap
+ (BOOL)supportsSecureCoding;
- (ATAudioTap)initWithCoder:(id)a3;
- (ATAudioTap)initWithTapDescription:(id)a3;
- (ATAudioTapDescription)tapDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isScreenSharingHost;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setScreenSharingHost:(BOOL)a3;
@end

@implementation ATAudioTap

- (void).cxx_destruct
{
}

- (void)setScreenSharingHost:(BOOL)a3
{
  self->_screenSharingHost = a3;
}

- (BOOL)isScreenSharingHost
{
  return self->_screenSharingHost;
}

- (ATAudioTapDescription)tapDescription
{
  return self->_tapDescription;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATAudioTap *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ATAudioTap *)self tapDescription];
      v7 = [(ATAudioTap *)v5 tapDescription];
      if ([v6 isEqual:v7])
      {
        BOOL v8 = [(ATAudioTap *)self isScreenSharingHost];
        BOOL v9 = v8 ^ [(ATAudioTap *)v5 isScreenSharingHost] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (ATAudioTap)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tapDescription"];
  v6 = [(ATAudioTap *)self initWithTapDescription:v5];
  if (v6) {
    v6->_screenSharingHost = [v4 decodeBoolForKey:@"screenSharingHost"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_tapDescription forKey:@"tapDescription"];
  [v4 encodeBool:self->_screenSharingHost forKey:@"screenSharingHost"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ATAudioTap *)self tapDescription];
  v7 = [v6 description];
  BOOL v8 = [(ATAudioTap *)self isScreenSharingHost];
  BOOL v9 = "";
  if (v8) {
    BOOL v9 = ", screen sharing host -> YES";
  }
  v10 = [v3 stringWithFormat:@"<%@@%p: tap description -> %@%s>", v5, self, v7, v9];

  return v10;
}

- (ATAudioTap)initWithTapDescription:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)ATAudioTap;
    v6 = [(ATAudioTap *)&v11 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_tapDescription, a3);
    }
    self = v7;
    BOOL v8 = self;
  }
  else
  {
    BOOL v9 = gATAudioTapLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "ATAudioTap.mm";
      __int16 v14 = 1024;
      int v15 = 387;
      _os_log_impl(&dword_1A3931000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d tapDescription should be non-nil", buf, 0x12u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end