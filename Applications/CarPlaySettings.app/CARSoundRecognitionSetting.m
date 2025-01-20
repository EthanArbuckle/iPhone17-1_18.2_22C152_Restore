@interface CARSoundRecognitionSetting
+ (id)settingWithSoundType:(id)a3;
- (NSString)sound;
- (id)description;
- (void)setSound:(id)a3;
@end

@implementation CARSoundRecognitionSetting

+ (id)settingWithSoundType:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setSound:v3];

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CARSoundRecognitionSetting;
  id v3 = [(CARSoundRecognitionSetting *)&v7 description];
  v4 = [(CARSoundRecognitionSetting *)self sound];
  v5 = +[NSString stringWithFormat:@"%@ [name: %@]", v3, v4];

  return v5;
}

- (NSString)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (void).cxx_destruct
{
}

@end