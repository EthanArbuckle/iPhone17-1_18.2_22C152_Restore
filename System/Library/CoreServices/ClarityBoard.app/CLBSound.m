@interface CLBSound
- (BOOL)isRepeating;
- (BOOL)playWithCompletion:(id)a3;
- (CLBSound)initWithSystemSoundID:(unsigned int)a3 behavior:(unint64_t)a4 vibrationPattern:(id)a5;
- (CLBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 toneIdentifier:(id)a5 vibrationIdentifier:(id)a6;
- (CLBSound)initWithToneAlertConfiguration:(id)a3;
- (NSDictionary)controllerAttributes;
- (NSDictionary)vibrationPattern;
- (NSString)accountIdentifier;
- (NSString)resolvedToneIdentifier;
- (NSString)ringtoneName;
- (NSString)toneIdentifier;
- (NSString)vibrationIdentifier;
- (TLAlertConfiguration)alertConfiguration;
- (double)maxDuration;
- (id)_descriptionWithLength:(unint64_t)a3;
- (id)completionBlock;
- (id)description;
- (id)shortDescription;
- (int64_t)alertType;
- (int64_t)soundType;
- (unint64_t)soundBehavior;
- (unsigned)systemSoundID;
- (void)setAccountIdentifier:(id)a3;
- (void)setAlertConfiguration:(id)a3;
- (void)setAlertType:(int64_t)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setControllerAttributes:(id)a3;
- (void)setMaxDuration:(double)a3;
- (void)setRepeats:(BOOL)a3;
- (void)setResolvedToneIdentifier:(id)a3;
- (void)setSoundBehavior:(unint64_t)a3;
- (void)setSoundType:(int64_t)a3;
- (void)setSystemSoundID:(unsigned int)a3;
- (void)setToneIdentifier:(id)a3;
- (void)setVibrationIdentifier:(id)a3;
- (void)setVibrationPattern:(id)a3;
- (void)stop;
@end

@implementation CLBSound

- (CLBSound)initWithSystemSoundID:(unsigned int)a3 behavior:(unint64_t)a4 vibrationPattern:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CLBSound;
  v9 = [(CLBSound *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(CLBSound *)v9 setSoundType:0];
    [(CLBSound *)v10 setSystemSoundID:v6];
    [(CLBSound *)v10 setSoundBehavior:a4];
    [(CLBSound *)v10 setVibrationPattern:v8];
  }

  return v10;
}

- (CLBSound)initWithToneAlert:(int64_t)a3 accountIdentifier:(id)a4 toneIdentifier:(id)a5 vibrationIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [objc_alloc((Class)TLAlertConfiguration) initWithType:a3];
  [v13 setTopic:v12];

  [v13 setToneIdentifier:v11];
  [v13 setVibrationIdentifier:v10];

  v14 = [(CLBSound *)self initWithToneAlertConfiguration:v13];
  return v14;
}

- (CLBSound)initWithToneAlertConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLBSound;
  v5 = [(CLBSound *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(CLBSound *)v5 setSoundType:1];
    [(CLBSound *)v6 setAlertConfiguration:v4];
  }

  return v6;
}

- (BOOL)playWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[CLBSoundController sharedInstance];
  LOBYTE(self) = [v5 playSound:self completion:v4];

  return (char)self;
}

- (void)stop
{
  id v3 = +[CLBSoundController sharedInstance];
  [v3 stopSound:self];
}

- (id)_descriptionWithLength:(unint64_t)a3
{
  int64_t v5 = [(CLBSound *)self soundType];
  if (v5 == 1)
  {
    if (a3)
    {
      if (a3 != 1)
      {
        id v13 = @"ToneAlert";
        goto LABEL_24;
      }
      if (self->_completionBlock) {
        CFStringRef v11 = @"YES";
      }
      else {
        CFStringRef v11 = @"NO";
      }
      id v12 = [(CLBSound *)self alertConfiguration];
      +[NSString stringWithFormat:@"\n   hasCompletionBlock: %@\n    Alert Configuration: %@\n", v11, v12];
    }
    else
    {
      id v12 = [(CLBSound *)self alertConfiguration];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Type:%ld", [v12 type], v15);
    id v10 = };

    id v13 = @"ToneAlert";
    if (!v10) {
      goto LABEL_24;
    }
LABEL_22:
    id v13 = [(__CFString *)v13 stringByAppendingString:v10];

    goto LABEL_24;
  }
  if (v5)
  {
    id v13 = 0;
    goto LABEL_24;
  }
  if (a3)
  {
    if (a3 != 1)
    {
      id v13 = @"SystemSound";
      goto LABEL_24;
    }
    if (self->_completionBlock) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
    uint64_t v7 = [(CLBSound *)self systemSoundID];
    unint64_t v8 = [(CLBSound *)self soundBehavior];
    v9 = [(CLBSound *)self vibrationPattern];
    id v10 = +[NSString stringWithFormat:@"\n   hasCompletionBlock: %@\n   SoundID: %lu\n   Behavior: %lu\n   Vibration Pattern: %@", v6, v7, v8, v9];
  }
  else
  {
    id v10 = +[NSString stringWithFormat:@"ID:%lu", [(CLBSound *)self systemSoundID]];
  }
  id v13 = @"SystemSound";
  if (v10) {
    goto LABEL_22;
  }
LABEL_24:

  return v13;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CLBSound;
  id v3 = [(CLBSound *)&v7 description];
  id v4 = [(CLBSound *)self _descriptionWithLength:1];
  int64_t v5 = [v3 stringByAppendingFormat:@"\n{  SoundType: %@\n}", v4];

  return v5;
}

- (id)shortDescription
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int64_t v5 = [(CLBSound *)self _descriptionWithLength:1];
  CFStringRef v6 = +[NSString stringWithFormat:@"%@ %p-%@", v4, self, v5];

  return v6;
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

- (unint64_t)soundBehavior
{
  return self->_soundBehavior;
}

- (void)setSoundBehavior:(unint64_t)a3
{
  self->_soundBehavior = a3;
}

- (NSString)ringtoneName
{
  return self->_ringtoneName;
}

- (NSDictionary)vibrationPattern
{
  return self->_vibrationPattern;
}

- (void)setVibrationPattern:(id)a3
{
}

- (BOOL)isRepeating
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (double)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(double)a3
{
  self->_maxDuration = a3;
}

- (NSDictionary)controllerAttributes
{
  return self->_controllerAttributes;
}

- (void)setControllerAttributes:(id)a3
{
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(int64_t)a3
{
  self->_alertType = a3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (void)setToneIdentifier:(id)a3
{
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (void)setVibrationIdentifier:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (NSString)resolvedToneIdentifier
{
  return self->_resolvedToneIdentifier;
}

- (void)setResolvedToneIdentifier:(id)a3
{
}

- (TLAlertConfiguration)alertConfiguration
{
  return self->_alertConfiguration;
}

- (void)setAlertConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertConfiguration, 0);
  objc_storeStrong((id *)&self->_resolvedToneIdentifier, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_controllerAttributes, 0);
  objc_storeStrong((id *)&self->_vibrationPattern, 0);

  objc_storeStrong((id *)&self->_ringtoneName, 0);
}

@end