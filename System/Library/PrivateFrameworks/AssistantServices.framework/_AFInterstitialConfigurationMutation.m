@interface _AFInterstitialConfigurationMutation
- (BOOL)getIsDucking;
- (BOOL)getIsTwoShot;
- (BOOL)getIsVoiceTrigger;
- (BOOL)isDirty;
- (_AFInterstitialConfigurationMutation)initWithBase:(id)a3;
- (id)getLanguageCode;
- (id)getRecordRoute;
- (int64_t)getGender;
- (int64_t)getStyle;
- (unint64_t)getSpeechEndHostTime;
- (void)setGender:(int64_t)a3;
- (void)setIsDucking:(BOOL)a3;
- (void)setIsTwoShot:(BOOL)a3;
- (void)setIsVoiceTrigger:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setRecordRoute:(id)a3;
- (void)setSpeechEndHostTime:(unint64_t)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _AFInterstitialConfigurationMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setSpeechEndHostTime:(unint64_t)a3
{
  self->_speechEndHostTime = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (unint64_t)getSpeechEndHostTime
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_speechEndHostTime;
  }
  else {
    return [(AFInterstitialConfiguration *)self->_base speechEndHostTime];
  }
}

- (void)setIsTwoShot:(BOOL)a3
{
  self->_isTwoShot = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (BOOL)getIsTwoShot
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    return self->_isTwoShot;
  }
  else {
    return [(AFInterstitialConfiguration *)self->_base isTwoShot];
  }
}

- (void)setIsDucking:(BOOL)a3
{
  self->_isDucking = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (BOOL)getIsDucking
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0) {
    return self->_isDucking;
  }
  else {
    return [(AFInterstitialConfiguration *)self->_base isDucking];
  }
}

- (void)setIsVoiceTrigger:(BOOL)a3
{
  self->_isVoiceTrigger = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (BOOL)getIsVoiceTrigger
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    return self->_isVoiceTrigger;
  }
  else {
    return [(AFInterstitialConfiguration *)self->_base isVoiceTrigger];
  }
}

- (void)setRecordRoute:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getRecordRoute
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_recordRoute;
  }
  else
  {
    v2 = [(AFInterstitialConfiguration *)self->_base recordRoute];
  }
  return v2;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (int64_t)getGender
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    return self->_gender;
  }
  else {
    return [(AFInterstitialConfiguration *)self->_base gender];
  }
}

- (void)setLanguageCode:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getLanguageCode
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_languageCode;
  }
  else
  {
    v2 = [(AFInterstitialConfiguration *)self->_base languageCode];
  }
  return v2;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (int64_t)getStyle
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0) {
    return self->_style;
  }
  else {
    return [(AFInterstitialConfiguration *)self->_base style];
  }
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFInterstitialConfigurationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFInterstitialConfigurationMutation;
  v6 = [(_AFInterstitialConfigurationMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end