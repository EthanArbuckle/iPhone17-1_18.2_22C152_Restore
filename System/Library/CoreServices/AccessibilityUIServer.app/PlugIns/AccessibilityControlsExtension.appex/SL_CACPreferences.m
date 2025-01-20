@interface SL_CACPreferences
+ (id)sharedPreferences;
- (BOOL)attentionAware;
- (BOOL)playSoundUponRecognition;
- (BOOL)showHints;
- (BOOL)showTextResponseUponRecognition;
- (CACPreferences)cacPrefs;
- (SL_CACPreferences)init;
- (id)alwaysShowOverlayType;
- (void)setAlwaysShowOverlayType:(id)a3;
- (void)setAttentionAware:(BOOL)a3;
- (void)setCacPrefs:(id)a3;
- (void)setPlaySoundUponRecognition:(BOOL)a3;
- (void)setShowHints:(BOOL)a3;
- (void)setShowTextResponseUponRecognition:(BOOL)a3;
@end

@implementation SL_CACPreferences

+ (id)sharedPreferences
{
  if (qword_10043C068 != -1) {
    dispatch_once(&qword_10043C068, &stru_100406FD8);
  }
  v2 = (void *)qword_10043C060;

  return v2;
}

- (SL_CACPreferences)init
{
  v8.receiver = self;
  v8.super_class = (Class)SL_CACPreferences;
  v2 = [(SL_CACPreferences *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)qword_10043C070;
    uint64_t v13 = qword_10043C070;
    if (!qword_10043C070)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100004C40;
      v9[3] = &unk_100407000;
      v9[4] = &v10;
      sub_100004C40((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v10, 8);
    uint64_t v5 = [v4 sharedPreferences];
    cacPrefs = v2->_cacPrefs;
    v2->_cacPrefs = (CACPreferences *)v5;
  }
  return v2;
}

- (BOOL)showTextResponseUponRecognition
{
  v2 = [(SL_CACPreferences *)self cacPrefs];
  unsigned __int8 v3 = [v2 showTextResponseUponRecognition];

  return v3;
}

- (void)setShowTextResponseUponRecognition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SL_CACPreferences *)self cacPrefs];
  [v4 setShowTextResponseUponRecognition:v3];
}

- (BOOL)playSoundUponRecognition
{
  v2 = [(SL_CACPreferences *)self cacPrefs];
  unsigned __int8 v3 = [v2 playSoundUponRecognition];

  return v3;
}

- (void)setPlaySoundUponRecognition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SL_CACPreferences *)self cacPrefs];
  [v4 setPlaySoundUponRecognition:v3];
}

- (BOOL)showHints
{
  v2 = [(SL_CACPreferences *)self cacPrefs];
  BOOL v3 = [v2 userHintsFeatures] == (id)3;

  return v3;
}

- (void)setShowHints:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SL_CACPreferences *)self cacPrefs];
  id v6 = v4;
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setUserHintsFeatures:v5];
}

- (id)alwaysShowOverlayType
{
  v2 = [(SL_CACPreferences *)self cacPrefs];
  BOOL v3 = [v2 alwaysShowOverlayType];

  return v3;
}

- (void)setAlwaysShowOverlayType:(id)a3
{
  id v4 = a3;
  id v5 = [(SL_CACPreferences *)self cacPrefs];
  [v5 setAlwaysShowOverlayType:v4];
}

- (BOOL)attentionAware
{
  v2 = [(SL_CACPreferences *)self cacPrefs];
  BOOL v3 = [v2 attentionAwareAction];
  unsigned __int8 v4 = [v3 isEqualToString:@"SleepAndWake"];

  return v4;
}

- (void)setAttentionAware:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = [(SL_CACPreferences *)self cacPrefs];
  id v6 = v4;
  if (v3) {
    CFStringRef v5 = @"SleepAndWake";
  }
  else {
    CFStringRef v5 = @"None";
  }
  [v4 setAttentionAwareAction:v5];
}

- (CACPreferences)cacPrefs
{
  return self->_cacPrefs;
}

- (void)setCacPrefs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end