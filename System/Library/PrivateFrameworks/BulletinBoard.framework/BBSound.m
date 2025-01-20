@interface BBSound
+ (BOOL)supportsSecureCoding;
- (BBSound)initWithCoder:(id)a3;
- (BBSound)initWithToneAlert:(int64_t)a3;
- (BBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4;
- (BBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 ignoreRingerSwitch:(BOOL)a5;
- (BBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 toneIdentifier:(id)a5 vibrationIdentifier:(id)a6 ignoreRingerSwitch:(BOOL)a7;
- (BBSound)initWithToneAlert:(int64_t)a3 ignoreRingerSwitch:(BOOL)a4;
- (BBSound)initWithToneAlert:(int64_t)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5;
- (BBSound)initWithToneAlert:(int64_t)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5 ignoreRingerSwitch:(BOOL)a6;
- (BBSound)initWithToneAlertConfiguration:(id)a3;
- (BOOL)ignoreRingerSwitch;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRepeating;
- (NSDictionary)vibrationPattern;
- (NSString)accountIdentifier;
- (NSString)audioCategory;
- (NSString)ringtoneName;
- (NSString)songPath;
- (NSString)toneIdentifier;
- (NSString)vibrationIdentifier;
- (TLAlertConfiguration)alertConfiguration;
- (double)maxDuration;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)description;
- (id)replacementObjectForCoder:(id)a3;
- (int64_t)alertType;
- (int64_t)soundType;
- (unint64_t)hash;
- (unint64_t)soundBehavior;
- (unsigned)systemSoundID;
- (void)encodeWithCoder:(id)a3;
- (void)setAlertConfiguration:(id)a3;
- (void)setAudioCategory:(id)a3;
- (void)setMaxDuration:(double)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setRingtoneName:(id)a3;
- (void)setSongPath:(id)a3;
- (void)setSoundBehavior:(unint64_t)a3;
- (void)setSoundType:(int64_t)a3;
- (void)setSystemSoundID:(unsigned int)a3;
- (void)setVibrationPattern:(id)a3;
@end

@implementation BBSound

- (BBSound)initWithToneAlert:(int64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F7FC70]) initWithType:a3];
  v5 = [(BBSound *)self initWithToneAlertConfiguration:v4];

  return v5;
}

- (BBSound)initWithToneAlert:(int64_t)a3 ignoreRingerSwitch:(BOOL)a4
{
  return [(BBSound *)self initWithToneAlert:a3 accountIdentifier:0 ignoreRingerSwitch:a4];
}

- (BBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4
{
  return [(BBSound *)self initWithToneAlert:a3 accountIdentifier:a4 ignoreRingerSwitch:0];
}

- (BBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 ignoreRingerSwitch:(BOOL)a5
{
  return [(BBSound *)self initWithToneAlert:a3 accountIdentifier:a4 toneIdentifier:0 vibrationIdentifier:0 ignoreRingerSwitch:a5];
}

- (BBSound)initWithToneAlert:(int64_t)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5
{
  return [(BBSound *)self initWithToneAlert:a3 toneIdentifier:a4 vibrationIdentifier:a5 ignoreRingerSwitch:0];
}

- (BBSound)initWithToneAlert:(int64_t)a3 toneIdentifier:(id)a4 vibrationIdentifier:(id)a5 ignoreRingerSwitch:(BOOL)a6
{
  return [(BBSound *)self initWithToneAlert:a3 accountIdentifier:0 toneIdentifier:a4 vibrationIdentifier:a5 ignoreRingerSwitch:a6];
}

- (BBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 toneIdentifier:(id)a5 vibrationIdentifier:(id)a6 ignoreRingerSwitch:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void *)[objc_alloc(MEMORY[0x263F7FC70]) initWithType:a3];
  v16 = v15;
  if (v12) {
    [v15 setTopic:v12];
  }
  if (v13) {
    [v16 setToneIdentifier:v13];
  }
  if (v14) {
    [v16 setVibrationIdentifier:v14];
  }
  [v16 setShouldIgnoreRingerSwitch:v7];
  v17 = [(BBSound *)self initWithToneAlertConfiguration:v16];

  return v17;
}

- (BBSound)initWithToneAlertConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BBSound;
  v5 = [(BBSound *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(BBSound *)v5 setSoundType:2];
    [v4 setPrefersToDisallowExternalPlayback:1];
    [(BBSound *)v6 setAlertConfiguration:v4];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BBSound *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 = v4;
      v6 = [(BBSound *)self alertConfiguration];
      BOOL v7 = [(BBSound *)v5 alertConfiguration];
      if (BSEqualObjects())
      {
        objc_super v8 = [(BBSound *)self audioCategory];
        v9 = [(BBSound *)v5 audioCategory];
        if (BSEqualObjects()
          && ([(BBSound *)self maxDuration],
              [(BBSound *)v5 maxDuration],
              BSFloatEqualToFloat())
          && (BOOL v10 = [(BBSound *)self isRepeating], v10 == [(BBSound *)v5 isRepeating]))
        {
          id v13 = [(BBSound *)self ringtoneName];
          id v14 = [(BBSound *)v5 ringtoneName];
          if (BSEqualObjects()
            && (unint64_t v15 = [(BBSound *)self soundBehavior],
                v15 == [(BBSound *)v5 soundBehavior])
            && (int64_t v16 = [(BBSound *)self soundType], v16 == [(BBSound *)v5 soundType])
            && (unsigned int v17 = [(BBSound *)self systemSoundID],
                v17 == [(BBSound *)v5 systemSoundID]))
          {
            v19 = [(BBSound *)self vibrationPattern];
            v18 = [(BBSound *)v5 vibrationPattern];
            char v11 = BSEqualObjects();
          }
          else
          {
            char v11 = 0;
          }
        }
        else
        {
          char v11 = 0;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int v3 = 1 << ([(BBSound *)self soundType] + 8);
  id v4 = [(BBSound *)self alertConfiguration];
  uint64_t v5 = [v4 hash] + v3;

  v6 = [(BBSound *)self audioCategory];
  uint64_t v7 = v5 + [v6 hash];

  objc_super v8 = NSNumber;
  [(BBSound *)self maxDuration];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v10 = v7 + [v9 hash];

  uint64_t v11 = v10 + [(BBSound *)self isRepeating];
  id v12 = [(BBSound *)self ringtoneName];
  uint64_t v13 = [v12 hash];

  unint64_t v14 = v11 + v13 + [(BBSound *)self soundBehavior];
  unint64_t v15 = v14 + [(BBSound *)self systemSoundID];
  int64_t v16 = [(BBSound *)self vibrationPattern];
  unint64_t v17 = v15 + [v16 hash];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBSound)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BBSound;
  uint64_t v5 = [(BBSound *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"alertConfiguration"];
    [(BBSound *)v5 setAlertConfiguration:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioCategory"];
    [(BBSound *)v5 setAudioCategory:v7];

    [v4 decodeDoubleForKey:@"maxDuration"];
    -[BBSound setMaxDuration:](v5, "setMaxDuration:");
    -[BBSound setRepeats:](v5, "setRepeats:", [v4 decodeBoolForKey:@"repeats"]);
    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ringtoneName"];
    [(BBSound *)v5 setRingtoneName:v8];

    -[BBSound setSoundBehavior:](v5, "setSoundBehavior:", (int)[v4 decodeInt32ForKey:@"soundBehavior"]);
    -[BBSound setSoundType:](v5, "setSoundType:", (int)[v4 decodeInt32ForKey:@"soundType"]);
    -[BBSound setSystemSoundID:](v5, "setSystemSoundID:", [v4 decodeInt32ForKey:@"systemSoundID"]);
    v9 = BBAllowedClasses();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"vibrationPattern"];
    [(BBSound *)v5 setVibrationPattern:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BBSound *)self alertConfiguration];
  [v4 encodeObject:v5 forKey:@"alertConfiguration"];

  v6 = [(BBSound *)self audioCategory];
  [v4 encodeObject:v6 forKey:@"audioCategory"];

  [(BBSound *)self maxDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maxDuration");
  objc_msgSend(v4, "encodeBool:forKey:", -[BBSound isRepeating](self, "isRepeating"), @"repeats");
  uint64_t v7 = [(BBSound *)self ringtoneName];
  [v4 encodeObject:v7 forKey:@"ringtoneName"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[BBSound soundBehavior](self, "soundBehavior"), @"soundBehavior");
  objc_msgSend(v4, "encodeInteger:forKey:", -[BBSound soundType](self, "soundType"), @"soundType");
  objc_msgSend(v4, "encodeInt32:forKey:", -[BBSound systemSoundID](self, "systemSoundID"), @"systemSoundID");
  id v8 = [(BBSound *)self vibrationPattern];
  [v4 encodeObject:v8 forKey:@"vibrationPattern"];
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  uint64_t v5 = [v4 cacheObject:self];

  return v5;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  id v4 = [self bb_objectCache];
  uint64_t v5 = [v4 cacheObject:self];

  return v5;
}

- (int64_t)alertType
{
  v2 = [(BBSound *)self alertConfiguration];
  int64_t v3 = [v2 type];

  return v3;
}

- (NSString)accountIdentifier
{
  v2 = [(BBSound *)self alertConfiguration];
  int64_t v3 = [v2 topic];

  return (NSString *)v3;
}

- (NSString)toneIdentifier
{
  v2 = [(BBSound *)self alertConfiguration];
  int64_t v3 = [v2 toneIdentifier];

  return (NSString *)v3;
}

- (NSString)vibrationIdentifier
{
  v2 = [(BBSound *)self alertConfiguration];
  int64_t v3 = [v2 vibrationIdentifier];

  return (NSString *)v3;
}

- (BOOL)ignoreRingerSwitch
{
  v2 = [(BBSound *)self alertConfiguration];
  char v3 = [v2 shouldIgnoreRingerSwitch];

  return v3;
}

- (id)description
{
  int64_t v3 = [(BBSound *)self soundType];
  switch(v3)
  {
    case 2:
      uint64_t v10 = NSString;
      uint64_t v7 = [(BBSound *)self alertConfiguration];
      id v8 = [v10 stringWithFormat:@"alertConfiguration: %@; ", v7];
      v9 = @"ToneAlert";
      goto LABEL_12;
    case 1:
      uint64_t v11 = NSString;
      uint64_t v7 = [(BBSound *)self ringtoneName];
      if ([(BBSound *)self isRepeating]) {
        objc_super v12 = @"YES";
      }
      else {
        objc_super v12 = @"NO";
      }
      [(BBSound *)self maxDuration];
      uint64_t v14 = v13;
      unint64_t v15 = [(BBSound *)self vibrationPattern];
      uint64_t v16 = [(BBSound *)self audioCategory];
      unint64_t v17 = (void *)v16;
      v18 = @"Default";
      if (v16) {
        v18 = (__CFString *)v16;
      }
      objc_msgSend(v11, "stringWithFormat:", @"name: %@; repeats: %@; maxDuration: %lf; vibPattern: %@; audioCategory: %@",
        v7,
        v12,
        v14,
        v15,
      id v8 = v18);

      v9 = @"Ringtone";
      goto LABEL_12;
    case 0:
      id v4 = NSString;
      uint64_t v5 = [(BBSound *)self systemSoundID];
      unint64_t v6 = [(BBSound *)self soundBehavior];
      uint64_t v7 = [(BBSound *)self vibrationPattern];
      id v8 = [v4 stringWithFormat:@"soundID: %u; behavior: %lu; vibPattern: %@", v5, v6, v7];
      v9 = @"SystemSound";
LABEL_12:

      goto LABEL_14;
  }
  v9 = 0;
  id v8 = 0;
LABEL_14:
  v19 = [NSString stringWithFormat:@"<%@: %p; [%@] %@>", objc_opt_class(), self, v9, v8];

  return v19;
}

- (TLAlertConfiguration)alertConfiguration
{
  return self->_alertConfiguration;
}

- (void)setAlertConfiguration:(id)a3
{
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (void)setAudioCategory:(id)a3
{
}

- (double)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(double)a3
{
  self->_maxDuration = a3;
}

- (BOOL)isRepeating
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (NSString)ringtoneName
{
  return self->_ringtoneName;
}

- (void)setRingtoneName:(id)a3
{
}

- (unint64_t)soundBehavior
{
  return self->_soundBehavior;
}

- (void)setSoundBehavior:(unint64_t)a3
{
  self->_soundBehavior = a3;
}

- (int64_t)soundType
{
  return self->_soundType;
}

- (void)setSoundType:(int64_t)a3
{
  self->_soundType = a3;
}

- (unsigned)systemSoundID
{
  return self->_systemSoundID;
}

- (void)setSystemSoundID:(unsigned int)a3
{
  self->_systemSoundID = a3;
}

- (NSDictionary)vibrationPattern
{
  return self->_vibrationPattern;
}

- (void)setVibrationPattern:(id)a3
{
}

- (NSString)songPath
{
  return self->_songPath;
}

- (void)setSongPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songPath, 0);
  objc_storeStrong((id *)&self->_vibrationPattern, 0);
  objc_storeStrong((id *)&self->_ringtoneName, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_alertConfiguration, 0);
}

@end