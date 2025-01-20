@interface UNNotificationSound
+ (BOOL)supportsSecureCoding;
+ (UNNotificationSound)criticalSoundNamed:(UNNotificationSoundName)name;
+ (UNNotificationSound)criticalSoundNamed:(UNNotificationSoundName)name withAudioVolume:(float)volume;
+ (UNNotificationSound)defaultCriticalSound;
+ (UNNotificationSound)defaultCriticalSoundWithAudioVolume:(float)volume;
+ (UNNotificationSound)defaultRingtoneSound;
+ (UNNotificationSound)defaultSound;
+ (UNNotificationSound)defaultSystemSound;
+ (UNNotificationSound)ringtoneSoundNamed:(UNNotificationSoundName)name;
+ (UNNotificationSound)soundNamed:(UNNotificationSoundName)name;
+ (UNNotificationSound)soundWithAlertType:(int64_t)a3;
+ (id)_soundWithAlertType:(int64_t)a3 audioVolume:(id)a4 critical:(BOOL)a5 toneFileName:(id)a6;
- (BOOL)isCritical;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldIgnoreAccessibilityDisabledVibrationSetting;
- (BOOL)shouldIgnoreRingerSwitch;
- (BOOL)shouldRepeat;
- (NSNumber)audioVolume;
- (NSString)alertTopic;
- (NSString)audioCategory;
- (NSString)toneFileName;
- (NSString)toneIdentifier;
- (NSString)vibrationIdentifier;
- (NSURL)toneFileURL;
- (NSURL)vibrationPatternFileURL;
- (UNNotificationSound)init;
- (UNNotificationSound)initWithCoder:(id)a3;
- (double)maximumDuration;
- (id)_initWithAlertType:(int64_t)a3 alertTopic:(id)a4 audioCategory:(id)a5 audioVolume:(id)a6 critical:(BOOL)a7 maximumDuration:(double)a8 shouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a9 shouldIgnoreRingerSwitch:(BOOL)a10 shouldRepeat:(BOOL)a11 toneFileName:(id)a12 toneFileURL:(id)a13 toneIdentifier:(id)a14 toneMediaLibraryItemIdentifier:(unint64_t)a15 vibrationIdentifier:(id)a16 vibrationPatternFileURL:(id)a17;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)alertType;
- (unint64_t)hash;
- (unint64_t)toneMediaLibraryItemIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationSound

+ (UNNotificationSound)defaultSound
{
  return (UNNotificationSound *)[a1 soundWithAlertType:17];
}

+ (UNNotificationSound)defaultSystemSound
{
  return (UNNotificationSound *)[a1 soundWithAlertType:16];
}

+ (UNNotificationSound)defaultRingtoneSound
{
  return (UNNotificationSound *)[a1 soundWithAlertType:1];
}

+ (UNNotificationSound)defaultCriticalSound
{
  return (UNNotificationSound *)[a1 _soundWithAlertType:17 audioVolume:0 critical:1 toneFileName:0];
}

+ (UNNotificationSound)defaultCriticalSoundWithAudioVolume:(float)volume
{
  v4 = objc_msgSend(NSNumber, "numberWithFloat:");
  v5 = [a1 _soundWithAlertType:17 audioVolume:v4 critical:1 toneFileName:0];

  return (UNNotificationSound *)v5;
}

+ (UNNotificationSound)criticalSoundNamed:(UNNotificationSoundName)name
{
  return (UNNotificationSound *)[a1 _soundWithAlertType:17 audioVolume:0 critical:1 toneFileName:name];
}

+ (UNNotificationSound)criticalSoundNamed:(UNNotificationSoundName)name withAudioVolume:(float)volume
{
  v6 = NSNumber;
  v7 = name;
  *(float *)&double v8 = volume;
  v9 = [v6 numberWithFloat:v8];
  v10 = [a1 _soundWithAlertType:17 audioVolume:v9 critical:1 toneFileName:v7];

  return (UNNotificationSound *)v10;
}

+ (UNNotificationSound)soundNamed:(UNNotificationSoundName)name
{
  return (UNNotificationSound *)[a1 _soundWithAlertType:17 audioVolume:0 critical:0 toneFileName:name];
}

+ (UNNotificationSound)ringtoneSoundNamed:(UNNotificationSoundName)name
{
  return (UNNotificationSound *)[a1 _soundWithAlertType:1 audioVolume:0 critical:0 toneFileName:name];
}

+ (UNNotificationSound)soundWithAlertType:(int64_t)a3
{
  return (UNNotificationSound *)[a1 _soundWithAlertType:a3 audioVolume:0 critical:0 toneFileName:0];
}

+ (id)_soundWithAlertType:(int64_t)a3 audioVolume:(id)a4 critical:(BOOL)a5 toneFileName:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  LOWORD(v14) = 0;
  v12 = objc_msgSend(objc_alloc((Class)a1), "_initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:", a3, 0, 0, v11, v6, 0, 0.0, v14, v10, 0, 0, 0, 0, 0);

  return v12;
}

- (id)_initWithAlertType:(int64_t)a3 alertTopic:(id)a4 audioCategory:(id)a5 audioVolume:(id)a6 critical:(BOOL)a7 maximumDuration:(double)a8 shouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a9 shouldIgnoreRingerSwitch:(BOOL)a10 shouldRepeat:(BOOL)a11 toneFileName:(id)a12 toneFileURL:(id)a13 toneIdentifier:(id)a14 toneMediaLibraryItemIdentifier:(unint64_t)a15 vibrationIdentifier:(id)a16 vibrationPatternFileURL:(id)a17
{
  id v50 = a4;
  id v49 = a5;
  id v22 = a6;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  id v26 = a16;
  id v27 = a17;
  v51.receiver = self;
  v51.super_class = (Class)UNNotificationSound;
  v28 = [(UNNotificationSound *)&v51 init];
  v29 = v28;
  if (v28)
  {
    v28->_alertType = a3;
    uint64_t v30 = [v50 copy];
    alertTopic = v29->_alertTopic;
    v29->_alertTopic = (NSString *)v30;

    uint64_t v32 = [v49 copy];
    audioCategory = v29->_audioCategory;
    v29->_audioCategory = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    audioVolume = v29->_audioVolume;
    v29->_audioVolume = (NSNumber *)v34;

    uint64_t v36 = [v23 copy];
    toneFileName = v29->_toneFileName;
    v29->_toneFileName = (NSString *)v36;

    uint64_t v38 = [v24 copy];
    toneFileURL = v29->_toneFileURL;
    v29->_toneFileURL = (NSURL *)v38;

    v29->_critical = a7;
    v29->_maximumDuration = a8;
    v29->_shouldIgnoreAccessibilityDisabledVibrationSetting = a9;
    v29->_shouldIgnoreRingerSwitch = a10;
    v29->_shouldRepeat = a11;
    uint64_t v40 = [v25 copy];
    toneIdentifier = v29->_toneIdentifier;
    v29->_toneIdentifier = (NSString *)v40;

    v29->_toneMediaLibraryItemIdentifier = a15;
    uint64_t v42 = [v27 copy];
    vibrationPatternFileURL = v29->_vibrationPatternFileURL;
    v29->_vibrationPatternFileURL = (NSURL *)v42;

    uint64_t v44 = [v26 copy];
    vibrationIdentifier = v29->_vibrationIdentifier;
    v29->_vibrationIdentifier = (NSString *)v44;
  }
  return v29;
}

- (UNNotificationSound)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UNNotificationSound.m" lineNumber:122 description:@"use +soundWithIdentifier:"];

  return 0;
}

- (unint64_t)hash
{
  int64_t v3 = [(UNNotificationSound *)self alertType];
  v29 = [(UNNotificationSound *)self alertTopic];
  uint64_t v4 = [v29 hash] ^ v3;
  v28 = [(UNNotificationSound *)self audioCategory];
  uint64_t v5 = [v28 hash];
  BOOL v6 = [(UNNotificationSound *)self audioVolume];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  double v8 = NSNumber;
  [(UNNotificationSound *)self maximumDuration];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v10 = [v9 hash];
  uint64_t v11 = v7 ^ [(UNNotificationSound *)self isCritical];
  uint64_t v12 = v11 ^ [(UNNotificationSound *)self shouldIgnoreAccessibilityDisabledVibrationSetting];
  uint64_t v13 = v12 ^ [(UNNotificationSound *)self shouldIgnoreRingerSwitch] ^ v10;
  uint64_t v14 = [(UNNotificationSound *)self shouldRepeat];
  v15 = [(UNNotificationSound *)self toneFileName];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(UNNotificationSound *)self toneFileURL];
  uint64_t v18 = v16 ^ [v17 hash];
  v19 = [(UNNotificationSound *)self toneIdentifier];
  uint64_t v20 = v13 ^ v18 ^ [v19 hash];
  v21 = objc_msgSend(NSNumber, "numberWithDouble:", (double)-[UNNotificationSound toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"));
  uint64_t v22 = [v21 hash];
  id v23 = [(UNNotificationSound *)self vibrationIdentifier];
  uint64_t v24 = v20 ^ [v23 hash];
  id v25 = [(UNNotificationSound *)self vibrationPatternFileURL];
  unint64_t v26 = v24 ^ [v25 hash] ^ v22;

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = UNEqualIntegers(-[UNNotificationSound alertType](self, "alertType"), [v4 alertType]);
    BOOL v6 = [(UNNotificationSound *)self alertTopic];
    uint64_t v7 = [v4 alertTopic];
    int v8 = v5 & UNEqualStrings(v6, (void *)v7);

    v9 = [(UNNotificationSound *)self audioCategory];
    uint64_t v10 = [v4 audioCategory];
    LODWORD(v7) = UNEqualStrings(v9, v10);

    uint64_t v11 = [(UNNotificationSound *)self audioVolume];
    uint64_t v12 = [v4 audioVolume];
    LODWORD(v7) = v8 & v7 & UNEqualObjects((void *)v11, (void *)v12);

    [(UNNotificationSound *)self maximumDuration];
    double v14 = v13;
    [v4 maximumDuration];
    LODWORD(v11) = UNEqualDoubles(v14, v15);
    LODWORD(v12) = v11 & UNEqualBools(-[UNNotificationSound isCritical](self, "isCritical"), [v4 isCritical]);
    LODWORD(v7) = v7 & v12 & UNEqualBools(-[UNNotificationSound shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting"), [v4 shouldIgnoreAccessibilityDisabledVibrationSetting]);
    LODWORD(v11) = UNEqualBools(-[UNNotificationSound shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch"), [v4 shouldIgnoreRingerSwitch]);
    int v16 = v11 & UNEqualBools(-[UNNotificationSound shouldRepeat](self, "shouldRepeat"), [v4 shouldRepeat]);
    v17 = [(UNNotificationSound *)self toneFileName];
    uint64_t v18 = [v4 toneFileName];
    int v19 = v16 & UNEqualStrings(v17, v18);

    uint64_t v20 = [(UNNotificationSound *)self toneFileURL];
    v21 = [v4 toneFileURL];
    LODWORD(v7) = v7 & v19 & UNEqualObjects(v20, v21);

    uint64_t v22 = [(UNNotificationSound *)self toneIdentifier];
    id v23 = [v4 toneIdentifier];
    int v24 = v7 & UNEqualStrings((void *)v22, v23);

    LODWORD(v22) = UNEqualDoubles((double)-[UNNotificationSound toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"), (double)(unint64_t)[v4 toneMediaLibraryItemIdentifier]);
    id v25 = [(UNNotificationSound *)self vibrationIdentifier];
    unint64_t v26 = [v4 vibrationIdentifier];
    int v27 = v24 & UNEqualStrings(v25, v26);

    v28 = [(UNNotificationSound *)self vibrationPatternFileURL];
    v29 = [v4 vibrationPatternFileURL];
    int v30 = v27 & UNEqualObjects(v28, v29) & v22;
  }
  else
  {
    LOBYTE(v30) = 1;
  }

  return v30;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v23 = +[UNMutableNotificationSound allocWithZone:a3];
  int64_t v22 = [(UNNotificationSound *)self alertType];
  v21 = [(UNNotificationSound *)self alertTopic];
  uint64_t v20 = [(UNNotificationSound *)self audioCategory];
  id v4 = [(UNNotificationSound *)self audioVolume];
  BOOL v19 = [(UNNotificationSound *)self isCritical];
  [(UNNotificationSound *)self maximumDuration];
  double v6 = v5;
  BOOL v7 = [(UNNotificationSound *)self shouldIgnoreAccessibilityDisabledVibrationSetting];
  BOOL v8 = [(UNNotificationSound *)self shouldIgnoreRingerSwitch];
  BOOL v9 = [(UNNotificationSound *)self shouldRepeat];
  uint64_t v10 = [(UNNotificationSound *)self toneFileName];
  uint64_t v11 = [(UNNotificationSound *)self toneFileURL];
  uint64_t v12 = [(UNNotificationSound *)self toneIdentifier];
  unint64_t v13 = [(UNNotificationSound *)self toneMediaLibraryItemIdentifier];
  double v14 = [(UNNotificationSound *)self vibrationIdentifier];
  double v15 = [(UNNotificationSound *)self vibrationPatternFileURL];
  BYTE1(v18) = v9;
  LOBYTE(v18) = v8;
  id v16 = -[UNNotificationSound _initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:](v23, "_initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:", v22, v21, v20, v4, v19, v7, v6, v18, v10, v11, v12, v13, v14, v15);

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(UNNotificationSound *)self alertTopic];
  [v4 encodeObject:v5 forKey:@"alertTopic"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationSound alertType](self, "alertType"), @"alertType");
  double v6 = [(UNNotificationSound *)self audioCategory];
  [v4 encodeObject:v6 forKey:@"audioCategory"];

  BOOL v7 = [(UNNotificationSound *)self audioVolume];
  [v4 encodeObject:v7 forKey:@"audioVolume"];

  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSound isCritical](self, "isCritical"), @"critical");
  [(UNNotificationSound *)self maximumDuration];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maximumDuration");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSound shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting"), @"shouldIgnoreAccessibilityDisabledVibrationSetting");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSound shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch"), @"shouldIgnoreRingerSwitch");
  objc_msgSend(v4, "encodeBool:forKey:", -[UNNotificationSound shouldRepeat](self, "shouldRepeat"), @"shouldRepeat");
  BOOL v8 = [(UNNotificationSound *)self toneFileName];
  [v4 encodeObject:v8 forKey:@"toneFileName"];

  BOOL v9 = [(UNNotificationSound *)self toneFileURL];
  [v4 encodeObject:v9 forKey:@"toneFileURL"];

  uint64_t v10 = [(UNNotificationSound *)self toneIdentifier];
  [v4 encodeObject:v10 forKey:@"toneIdentifier"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[UNNotificationSound toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"), @"toneMediaLibraryItemIdentifier");
  uint64_t v11 = [(UNNotificationSound *)self vibrationIdentifier];
  [v4 encodeObject:v11 forKey:@"vibrationIdentifier"];

  id v12 = [(UNNotificationSound *)self vibrationPatternFileURL];
  [v4 encodeObject:v12 forKey:@"vibrationPatternFileURL"];
}

- (UNNotificationSound)initWithCoder:(id)a3
{
  id v3 = a3;
  int64_t v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"alertTopic"];
  uint64_t v21 = [v3 decodeIntegerForKey:@"alertType"];
  uint64_t v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"audioCategory"];
  BOOL v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"audioVolume"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"toneFileName"];
  double v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"toneFileURL"];
  [v3 decodeDoubleForKey:@"maximumDuration"];
  double v7 = v6;
  unsigned int v18 = [v3 decodeBoolForKey:@"critical"];
  uint64_t v8 = [v3 decodeBoolForKey:@"shouldIgnoreAccessibilityDisabledVibrationSetting"];
  char v9 = [v3 decodeBoolForKey:@"shouldIgnoreRingerSwitch"];
  char v10 = [v3 decodeBoolForKey:@"shouldRepeat"];
  uint64_t v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"toneIdentifier"];
  uint64_t v12 = [v3 decodeInt64ForKey:@"toneMediaLibraryItemIdentifier"];
  unint64_t v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"vibrationIdentifier"];
  double v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"vibrationPatternFileURL"];

  BYTE1(v17) = v10;
  LOBYTE(v17) = v9;
  double v15 = -[UNNotificationSound _initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:](self, "_initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:", v21, v22, v20, v19, v18, v8, v7, v17, v4, v5, v11, v12, v13, v14);

  return v15;
}

- (NSString)alertTopic
{
  return self->_alertTopic;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (NSNumber)audioVolume
{
  return self->_audioVolume;
}

- (unint64_t)toneMediaLibraryItemIdentifier
{
  return self->_toneMediaLibraryItemIdentifier;
}

- (double)maximumDuration
{
  return self->_maximumDuration;
}

- (BOOL)shouldIgnoreAccessibilityDisabledVibrationSetting
{
  return self->_shouldIgnoreAccessibilityDisabledVibrationSetting;
}

- (BOOL)shouldIgnoreRingerSwitch
{
  return self->_shouldIgnoreRingerSwitch;
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (NSString)toneFileName
{
  return self->_toneFileName;
}

- (NSURL)toneFileURL
{
  return self->_toneFileURL;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (NSURL)vibrationPatternFileURL
{
  return self->_vibrationPatternFileURL;
}

- (BOOL)isCritical
{
  return self->_critical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrationPatternFileURL, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_toneFileURL, 0);
  objc_storeStrong((id *)&self->_toneFileName, 0);
  objc_storeStrong((id *)&self->_audioVolume, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);

  objc_storeStrong((id *)&self->_alertTopic, 0);
}

@end