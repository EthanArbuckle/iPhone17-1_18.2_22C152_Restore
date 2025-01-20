@interface _AFEnablementConfigurationProviderParametersMutation
- (BOOL)getNewUser;
- (BOOL)getRecognitionLanguageWithMultipleOutputVoicesExists;
- (BOOL)isDirty;
- (_AFEnablementConfigurationProviderParametersMutation)initWithBase:(id)a3;
- (id)getDateEndedResolvingExperiment;
- (id)getDateEndedResolvingUserStatus;
- (id)getDateStartedResolvingExperiment;
- (id)getDateStartedResolvingUserStatus;
- (id)getExperiment;
- (id)getExperimentFetchError;
- (id)getOutputVoiceCountForRecognitionLanguage;
- (id)getUserStatusFetchError;
- (int64_t)getEnablementFlow;
- (void)setDateEndedResolvingExperiment:(id)a3;
- (void)setDateEndedResolvingUserStatus:(id)a3;
- (void)setDateStartedResolvingExperiment:(id)a3;
- (void)setDateStartedResolvingUserStatus:(id)a3;
- (void)setEnablementFlow:(int64_t)a3;
- (void)setExperiment:(id)a3;
- (void)setExperimentFetchError:(id)a3;
- (void)setNewUser:(BOOL)a3;
- (void)setOutputVoiceCountForRecognitionLanguage:(id)a3;
- (void)setRecognitionLanguageWithMultipleOutputVoicesExists:(BOOL)a3;
- (void)setUserStatusFetchError:(id)a3;
@end

@implementation _AFEnablementConfigurationProviderParametersMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputVoiceCountForRecognitionLanguage, 0);
  objc_storeStrong((id *)&self->_dateEndedResolvingExperiment, 0);
  objc_storeStrong((id *)&self->_dateStartedResolvingExperiment, 0);
  objc_storeStrong((id *)&self->_experimentFetchError, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_dateEndedResolvingUserStatus, 0);
  objc_storeStrong((id *)&self->_dateStartedResolvingUserStatus, 0);
  objc_storeStrong((id *)&self->_userStatusFetchError, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setRecognitionLanguageWithMultipleOutputVoicesExists:(BOOL)a3
{
  self->_recognitionLanguageWithMultipleOutputVoicesExists = a3;
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (BOOL)getRecognitionLanguageWithMultipleOutputVoicesExists
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0) {
    return self->_recognitionLanguageWithMultipleOutputVoicesExists;
  }
  else {
    return [(AFEnablementConfigurationProviderParameters *)self->_base recognitionLanguageWithMultipleOutputVoicesExists];
  }
}

- (void)setOutputVoiceCountForRecognitionLanguage:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getOutputVoiceCountForRecognitionLanguage
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_outputVoiceCountForRecognitionLanguage;
  }
  else
  {
    v2 = [(AFEnablementConfigurationProviderParameters *)self->_base outputVoiceCountForRecognitionLanguage];
  }
  return v2;
}

- (void)setDateEndedResolvingExperiment:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getDateEndedResolvingExperiment
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_dateEndedResolvingExperiment;
  }
  else
  {
    v2 = [(AFEnablementConfigurationProviderParameters *)self->_base dateEndedResolvingExperiment];
  }
  return v2;
}

- (void)setDateStartedResolvingExperiment:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getDateStartedResolvingExperiment
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_dateStartedResolvingExperiment;
  }
  else
  {
    v2 = [(AFEnablementConfigurationProviderParameters *)self->_base dateStartedResolvingExperiment];
  }
  return v2;
}

- (void)setExperimentFetchError:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getExperimentFetchError
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_experimentFetchError;
  }
  else
  {
    v2 = [(AFEnablementConfigurationProviderParameters *)self->_base experimentFetchError];
  }
  return v2;
}

- (void)setExperiment:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getExperiment
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_experiment;
  }
  else
  {
    v2 = [(AFEnablementConfigurationProviderParameters *)self->_base experiment];
  }
  return v2;
}

- (void)setDateEndedResolvingUserStatus:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getDateEndedResolvingUserStatus
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_dateEndedResolvingUserStatus;
  }
  else
  {
    v2 = [(AFEnablementConfigurationProviderParameters *)self->_base dateEndedResolvingUserStatus];
  }
  return v2;
}

- (void)setDateStartedResolvingUserStatus:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getDateStartedResolvingUserStatus
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_dateStartedResolvingUserStatus;
  }
  else
  {
    v2 = [(AFEnablementConfigurationProviderParameters *)self->_base dateStartedResolvingUserStatus];
  }
  return v2;
}

- (void)setUserStatusFetchError:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getUserStatusFetchError
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_userStatusFetchError;
  }
  else
  {
    v2 = [(AFEnablementConfigurationProviderParameters *)self->_base userStatusFetchError];
  }
  return v2;
}

- (void)setNewUser:(BOOL)a3
{
  self->_newUser = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (BOOL)getNewUser
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    return self->_newUser;
  }
  else {
    return [(AFEnablementConfigurationProviderParameters *)self->_base newUser];
  }
}

- (void)setEnablementFlow:(int64_t)a3
{
  self->_enablementFlow = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (int64_t)getEnablementFlow
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0) {
    return self->_enablementFlow;
  }
  else {
    return [(AFEnablementConfigurationProviderParameters *)self->_base enablementFlow];
  }
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFEnablementConfigurationProviderParametersMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFEnablementConfigurationProviderParametersMutation;
  v6 = [(_AFEnablementConfigurationProviderParametersMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end