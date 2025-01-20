@interface _AFSpeechParametersMutation
- (BOOL)getCensorSpeech;
- (BOOL)getDetectUtterances;
- (BOOL)getFarField;
- (BOOL)getNarrowband;
- (BOOL)getSecureOfflineOnly;
- (BOOL)getShouldStoreAudioOnDevice;
- (BOOL)isDirty;
- (_AFSpeechParametersMutation)initWithBase:(id)a3;
- (double)getMaximumRecognitionDuration;
- (id)getApplicationName;
- (id)getInputOrigin;
- (id)getInteractionIdentifier;
- (id)getJitGrammar;
- (id)getLanguage;
- (id)getLocation;
- (id)getLoggingContext;
- (id)getModelOverrideURL;
- (id)getOriginalAudioFileURL;
- (id)getOverrides;
- (id)getProfile;
- (id)getTask;
- (void)setApplicationName:(id)a3;
- (void)setCensorSpeech:(BOOL)a3;
- (void)setDetectUtterances:(BOOL)a3;
- (void)setFarField:(BOOL)a3;
- (void)setInputOrigin:(id)a3;
- (void)setInteractionIdentifier:(id)a3;
- (void)setJitGrammar:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLocation:(id)a3;
- (void)setLoggingContext:(id)a3;
- (void)setMaximumRecognitionDuration:(double)a3;
- (void)setModelOverrideURL:(id)a3;
- (void)setNarrowband:(BOOL)a3;
- (void)setOriginalAudioFileURL:(id)a3;
- (void)setOverrides:(id)a3;
- (void)setProfile:(id)a3;
- (void)setSecureOfflineOnly:(BOOL)a3;
- (void)setShouldStoreAudioOnDevice:(BOOL)a3;
- (void)setTask:(id)a3;
@end

@implementation _AFSpeechParametersMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jitGrammar, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_loggingContext, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setJitGrammar:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x80001u;
}

- (id)getJitGrammar
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 8) != 0)
  {
    v2 = self->_jitGrammar;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base jitGrammar];
  }
  return v2;
}

- (void)setLocation:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x40001u;
}

- (id)getLocation
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 4) != 0)
  {
    v2 = self->_location;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base location];
  }
  return v2;
}

- (void)setInputOrigin:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x20001u;
}

- (id)getInputOrigin
{
  if ((*((unsigned char *)&self->_mutationFlags + 2) & 2) != 0)
  {
    v2 = self->_inputOrigin;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base inputOrigin];
  }
  return v2;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x10001u;
}

- (double)getMaximumRecognitionDuration
{
  if (*((unsigned char *)&self->_mutationFlags + 2)) {
    return self->_maximumRecognitionDuration;
  }
  [(AFSpeechParameters *)self->_base maximumRecognitionDuration];
  return result;
}

- (void)setShouldStoreAudioOnDevice:(BOOL)a3
{
  self->_shouldStoreAudioOnDevice = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x8001u;
}

- (BOOL)getShouldStoreAudioOnDevice
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x80) != 0) {
    return self->_shouldStoreAudioOnDevice;
  }
  else {
    return [(AFSpeechParameters *)self->_base shouldStoreAudioOnDevice];
  }
}

- (void)setSecureOfflineOnly:(BOOL)a3
{
  self->_secureOfflineOnly = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x4001u;
}

- (BOOL)getSecureOfflineOnly
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x40) != 0) {
    return self->_secureOfflineOnly;
  }
  else {
    return [(AFSpeechParameters *)self->_base secureOfflineOnly];
  }
}

- (void)setFarField:(BOOL)a3
{
  self->_farField = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x2001u;
}

- (BOOL)getFarField
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x20) != 0) {
    return self->_farField;
  }
  else {
    return [(AFSpeechParameters *)self->_base farField];
  }
}

- (void)setCensorSpeech:(BOOL)a3
{
  self->_censorSpeech = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x1001u;
}

- (BOOL)getCensorSpeech
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 0x10) != 0) {
    return self->_censorSpeech;
  }
  else {
    return [(AFSpeechParameters *)self->_base censorSpeech];
  }
}

- (void)setDetectUtterances:(BOOL)a3
{
  self->_detectUtterances = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x801u;
}

- (BOOL)getDetectUtterances
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 8) != 0) {
    return self->_detectUtterances;
  }
  else {
    return [(AFSpeechParameters *)self->_base detectUtterances];
  }
}

- (void)setNarrowband:(BOOL)a3
{
  self->_narrowband = a3;
  *(_DWORD *)&self->_mutationFlags |= 0x401u;
}

- (BOOL)getNarrowband
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 4) != 0) {
    return self->_narrowband;
  }
  else {
    return [(AFSpeechParameters *)self->_base narrowband];
  }
}

- (void)setOriginalAudioFileURL:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getOriginalAudioFileURL
{
  if ((*((unsigned char *)&self->_mutationFlags + 1) & 2) != 0)
  {
    v2 = self->_originalAudioFileURL;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base originalAudioFileURL];
  }
  return v2;
}

- (void)setModelOverrideURL:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getModelOverrideURL
{
  if (*((unsigned char *)&self->_mutationFlags + 1))
  {
    v2 = self->_modelOverrideURL;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base modelOverrideURL];
  }
  return v2;
}

- (void)setOverrides:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getOverrides
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_overrides;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base overrides];
  }
  return v2;
}

- (void)setProfile:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getProfile
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_profile;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base profile];
  }
  return v2;
}

- (void)setApplicationName:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getApplicationName
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_applicationName;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base applicationName];
  }
  return v2;
}

- (void)setLoggingContext:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getLoggingContext
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_loggingContext;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base loggingContext];
  }
  return v2;
}

- (void)setTask:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 9u;
}

- (id)getTask
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_task;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base task];
  }
  return v2;
}

- (void)setInteractionIdentifier:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 5u;
}

- (id)getInteractionIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_interactionIdentifier;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base interactionIdentifier];
  }
  return v2;
}

- (void)setLanguage:(id)a3
{
  *(_DWORD *)&self->_mutationFlags |= 3u;
}

- (id)getLanguage
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_language;
  }
  else
  {
    v2 = [(AFSpeechParameters *)self->_base language];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_DWORD *)&self->_mutationFlags & 1;
}

- (_AFSpeechParametersMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSpeechParametersMutation;
  v6 = [(_AFSpeechParametersMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end