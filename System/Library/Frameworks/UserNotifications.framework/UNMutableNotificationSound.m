@interface UNMutableNotificationSound
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlertTopic:(id)a3;
- (void)setAudioCategory:(id)a3;
- (void)setAudioVolume:(id)a3;
- (void)setCritical:(BOOL)a3;
- (void)setMaximumDuration:(double)a3;
- (void)setShouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a3;
- (void)setShouldIgnoreRingerSwitch:(BOOL)a3;
- (void)setShouldRepeat:(BOOL)a3;
- (void)setToneFileName:(id)a3;
- (void)setToneFileURL:(id)a3;
- (void)setToneIdentifier:(id)a3;
- (void)setToneMediaLibraryItemIdentifier:(unint64_t)a3;
- (void)setVibrationIdentifier:(id)a3;
- (void)setVibrationPatternFileURL:(id)a3;
@end

@implementation UNMutableNotificationSound

- (void)setAlertTopic:(id)a3
{
  self->super._alertTopic = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setAudioCategory:(id)a3
{
  self->super._audioCategory = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setAudioVolume:(id)a3
{
}

- (void)setCritical:(BOOL)a3
{
  self->super._critical = a3;
}

- (void)setMaximumDuration:(double)a3
{
  self->super._maximumDuration = a3;
}

- (void)setShouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a3
{
  self->super._shouldIgnoreAccessibilityDisabledVibrationSetting = a3;
}

- (void)setShouldIgnoreRingerSwitch:(BOOL)a3
{
  self->super._shouldIgnoreRingerSwitch = a3;
}

- (void)setShouldRepeat:(BOOL)a3
{
  self->super._shouldRepeat = a3;
}

- (void)setToneFileName:(id)a3
{
  self->super._toneFileName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setToneFileURL:(id)a3
{
  self->super._toneFileURL = (NSURL *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setToneIdentifier:(id)a3
{
  self->super._toneIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setToneMediaLibraryItemIdentifier:(unint64_t)a3
{
  self->super._toneMediaLibraryItemIdentifier = a3;
}

- (void)setVibrationIdentifier:(id)a3
{
  self->super._vibrationIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setVibrationPatternFileURL:(id)a3
{
  self->super._vibrationPatternFileURL = (NSURL *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v23 = +[UNNotificationSound allocWithZone:a3];
  int64_t v22 = [(UNNotificationSound *)self alertType];
  v21 = [(UNNotificationSound *)self alertTopic];
  v20 = [(UNNotificationSound *)self audioCategory];
  v4 = [(UNNotificationSound *)self audioVolume];
  BOOL v19 = [(UNNotificationSound *)self isCritical];
  [(UNNotificationSound *)self maximumDuration];
  double v6 = v5;
  BOOL v7 = [(UNNotificationSound *)self shouldIgnoreAccessibilityDisabledVibrationSetting];
  BOOL v8 = [(UNNotificationSound *)self shouldIgnoreRingerSwitch];
  BOOL v9 = [(UNNotificationSound *)self shouldRepeat];
  v10 = [(UNNotificationSound *)self toneFileName];
  v11 = [(UNNotificationSound *)self toneFileURL];
  v12 = [(UNNotificationSound *)self toneIdentifier];
  unint64_t v13 = [(UNNotificationSound *)self toneMediaLibraryItemIdentifier];
  v14 = [(UNNotificationSound *)self vibrationIdentifier];
  v15 = [(UNNotificationSound *)self vibrationPatternFileURL];
  BYTE1(v18) = v9;
  LOBYTE(v18) = v8;
  id v16 = -[UNNotificationSound _initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:](v23, "_initWithAlertType:alertTopic:audioCategory:audioVolume:critical:maximumDuration:shouldIgnoreAccessibilityDisabledVibrationSetting:shouldIgnoreRingerSwitch:shouldRepeat:toneFileName:toneFileURL:toneIdentifier:toneMediaLibraryItemIdentifier:vibrationIdentifier:vibrationPatternFileURL:", v22, v21, v20, v4, v19, v7, v6, v18, v10, v11, v12, v13, v14, v15);

  return v16;
}

@end