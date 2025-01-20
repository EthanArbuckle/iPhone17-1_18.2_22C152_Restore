@interface AFEnablementConfigurationProviderParameters
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFEnablementConfigurationProviderParameters)init;
- (AFEnablementConfigurationProviderParameters)initWithBuilder:(id)a3;
- (AFEnablementConfigurationProviderParameters)initWithCoder:(id)a3;
- (AFEnablementConfigurationProviderParameters)initWithEnablementFlow:(int64_t)a3 newUser:(BOOL)a4 userStatusFetchError:(id)a5 dateStartedResolvingUserStatus:(id)a6 dateEndedResolvingUserStatus:(id)a7 experiment:(id)a8 experimentFetchError:(id)a9 dateStartedResolvingExperiment:(id)a10 dateEndedResolvingExperiment:(id)a11 outputVoiceCountForRecognitionLanguage:(id)a12 recognitionLanguageWithMultipleOutputVoicesExists:(BOOL)a13;
- (AFExperiment)experiment;
- (BOOL)isEqual:(id)a3;
- (BOOL)newUser;
- (BOOL)recognitionLanguageWithMultipleOutputVoicesExists;
- (NSDate)dateEndedResolvingExperiment;
- (NSDate)dateEndedResolvingUserStatus;
- (NSDate)dateStartedResolvingExperiment;
- (NSDate)dateStartedResolvingUserStatus;
- (NSDictionary)outputVoiceCountForRecognitionLanguage;
- (NSError)experimentFetchError;
- (NSError)userStatusFetchError;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)enablementFlow;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFEnablementConfigurationProviderParameters

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
}

- (BOOL)recognitionLanguageWithMultipleOutputVoicesExists
{
  return self->_recognitionLanguageWithMultipleOutputVoicesExists;
}

- (NSDictionary)outputVoiceCountForRecognitionLanguage
{
  return self->_outputVoiceCountForRecognitionLanguage;
}

- (NSDate)dateEndedResolvingExperiment
{
  return self->_dateEndedResolvingExperiment;
}

- (NSDate)dateStartedResolvingExperiment
{
  return self->_dateStartedResolvingExperiment;
}

- (NSError)experimentFetchError
{
  return self->_experimentFetchError;
}

- (AFExperiment)experiment
{
  return self->_experiment;
}

- (NSDate)dateEndedResolvingUserStatus
{
  return self->_dateEndedResolvingUserStatus;
}

- (NSDate)dateStartedResolvingUserStatus
{
  return self->_dateStartedResolvingUserStatus;
}

- (NSError)userStatusFetchError
{
  return self->_userStatusFetchError;
}

- (BOOL)newUser
{
  return self->_newUser;
}

- (int64_t)enablementFlow
{
  return self->_enablementFlow;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  int64_t enablementFlow = self->_enablementFlow;
  id v6 = a3;
  v7 = [v4 numberWithInteger:enablementFlow];
  [v6 encodeObject:v7 forKey:@"AFEnablementConfigurationProviderParameters::enablementFlow"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_newUser];
  [v6 encodeObject:v8 forKey:@"AFEnablementConfigurationProviderParameters::newUser"];

  [v6 encodeObject:self->_userStatusFetchError forKey:@"AFEnablementConfigurationProviderParameters::userStatusFetchError"];
  [v6 encodeObject:self->_dateStartedResolvingUserStatus forKey:@"AFEnablementConfigurationProviderParameters::dateStartedResolvingUserStatus"];
  [v6 encodeObject:self->_dateEndedResolvingUserStatus forKey:@"AFEnablementConfigurationProviderParameters::dateEndedResolvingUserStatus"];
  [v6 encodeObject:self->_experiment forKey:@"AFEnablementConfigurationProviderParameters::experiment"];
  [v6 encodeObject:self->_experimentFetchError forKey:@"AFEnablementConfigurationProviderParameters::experimentFetchError"];
  [v6 encodeObject:self->_dateStartedResolvingExperiment forKey:@"AFEnablementConfigurationProviderParameters::dateStartedResolvingExperiment"];
  [v6 encodeObject:self->_dateEndedResolvingExperiment forKey:@"AFEnablementConfigurationProviderParameters::dateEndedResolvingExperiment"];
  [v6 encodeObject:self->_outputVoiceCountForRecognitionLanguage forKey:@"AFEnablementConfigurationProviderParameters::outputVoiceCountForRecognitionLanguage"];
  id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_recognitionLanguageWithMultipleOutputVoicesExists];
  [v6 encodeObject:v9 forKey:@"AFEnablementConfigurationProviderParameters::recognitionLanguageWithMultipleOutputVoicesExists"];
}

- (AFEnablementConfigurationProviderParameters)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::enablementFlow"];
  uint64_t v23 = [v4 integerValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::newUser"];
  unsigned int v22 = [v5 BOOLValue];

  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::userStatusFetchError"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::dateStartedResolvingUserStatus"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::dateEndedResolvingUserStatus"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::experiment"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::experimentFetchError"];
  id v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::dateStartedResolvingExperiment"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::dateEndedResolvingExperiment"];
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v15 = [v3 decodeObjectOfClasses:v14 forKey:@"AFEnablementConfigurationProviderParameters::outputVoiceCountForRecognitionLanguage"];

  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFEnablementConfigurationProviderParameters::recognitionLanguageWithMultipleOutputVoicesExists"];

  LOBYTE(v3) = [v16 BOOLValue];
  LOBYTE(v19) = (_BYTE)v3;
  v17 = [(AFEnablementConfigurationProviderParameters *)self initWithEnablementFlow:v23 newUser:v22 userStatusFetchError:v21 dateStartedResolvingUserStatus:v20 dateEndedResolvingUserStatus:v6 experiment:v7 experimentFetchError:v8 dateStartedResolvingExperiment:v9 dateEndedResolvingExperiment:v10 outputVoiceCountForRecognitionLanguage:v15 recognitionLanguageWithMultipleOutputVoicesExists:v19];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFEnablementConfigurationProviderParameters *)a3;
  if (self == v4)
  {
    BOOL v25 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t enablementFlow = self->_enablementFlow;
      if (enablementFlow == [(AFEnablementConfigurationProviderParameters *)v5 enablementFlow]
        && (BOOL newUser = self->_newUser, newUser == [(AFEnablementConfigurationProviderParameters *)v5 newUser])
        && (BOOL recognitionLanguageWithMultipleOutputVoicesExists = self->_recognitionLanguageWithMultipleOutputVoicesExists,
            recognitionLanguageWithMultipleOutputVoicesExists == [(AFEnablementConfigurationProviderParameters *)v5 recognitionLanguageWithMultipleOutputVoicesExists]))
      {
        id v9 = [(AFEnablementConfigurationProviderParameters *)v5 userStatusFetchError];
        userStatusFetchError = self->_userStatusFetchError;
        if (userStatusFetchError == v9 || [(NSError *)userStatusFetchError isEqual:v9])
        {
          v11 = [(AFEnablementConfigurationProviderParameters *)v5 dateStartedResolvingUserStatus];
          dateStartedResolvingUserStatus = self->_dateStartedResolvingUserStatus;
          if (dateStartedResolvingUserStatus == v11
            || [(NSDate *)dateStartedResolvingUserStatus isEqual:v11])
          {
            uint64_t v13 = [(AFEnablementConfigurationProviderParameters *)v5 dateEndedResolvingUserStatus];
            dateEndedResolvingUserStatus = self->_dateEndedResolvingUserStatus;
            if (dateEndedResolvingUserStatus == v13
              || [(NSDate *)dateEndedResolvingUserStatus isEqual:v13])
            {
              v15 = [(AFEnablementConfigurationProviderParameters *)v5 experiment];
              experiment = self->_experiment;
              if (experiment == v15 || [(AFExperiment *)experiment isEqual:v15])
              {
                v17 = [(AFEnablementConfigurationProviderParameters *)v5 experimentFetchError];
                experimentFetchError = self->_experimentFetchError;
                if (experimentFetchError == v17
                  || [(NSError *)experimentFetchError isEqual:v17])
                {
                  uint64_t v19 = [(AFEnablementConfigurationProviderParameters *)v5 dateStartedResolvingExperiment];
                  dateStartedResolvingExperiment = self->_dateStartedResolvingExperiment;
                  if (dateStartedResolvingExperiment == v19
                    || [(NSDate *)dateStartedResolvingExperiment isEqual:v19])
                  {
                    v21 = [(AFEnablementConfigurationProviderParameters *)v5 dateEndedResolvingExperiment];
                    dateEndedResolvingExperiment = self->_dateEndedResolvingExperiment;
                    if (dateEndedResolvingExperiment == v21
                      || [(NSDate *)dateEndedResolvingExperiment isEqual:v21])
                    {
                      v27 = v21;
                      uint64_t v23 = [(AFEnablementConfigurationProviderParameters *)v5 outputVoiceCountForRecognitionLanguage];
                      outputVoiceCountForRecognitionLanguage = self->_outputVoiceCountForRecognitionLanguage;
                      BOOL v25 = outputVoiceCountForRecognitionLanguage == v23
                         || [(NSDictionary *)outputVoiceCountForRecognitionLanguage isEqual:v23];

                      v21 = v27;
                    }
                    else
                    {
                      BOOL v25 = 0;
                    }
                  }
                  else
                  {
                    BOOL v25 = 0;
                  }
                }
                else
                {
                  BOOL v25 = 0;
                }
              }
              else
              {
                BOOL v25 = 0;
              }
            }
            else
            {
              BOOL v25 = 0;
            }
          }
          else
          {
            BOOL v25 = 0;
          }
        }
        else
        {
          BOOL v25 = 0;
        }
      }
      else
      {
        BOOL v25 = 0;
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }

  return v25;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_enablementFlow];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_newUser];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(NSError *)self->_userStatusFetchError hash];
  uint64_t v8 = v7 ^ [(NSDate *)self->_dateStartedResolvingUserStatus hash];
  uint64_t v9 = v8 ^ [(NSDate *)self->_dateEndedResolvingUserStatus hash];
  unint64_t v10 = v6 ^ v9 ^ [(AFExperiment *)self->_experiment hash];
  uint64_t v11 = [(NSError *)self->_experimentFetchError hash];
  uint64_t v12 = v11 ^ [(NSDate *)self->_dateStartedResolvingExperiment hash];
  uint64_t v13 = v12 ^ [(NSDate *)self->_dateEndedResolvingExperiment hash];
  uint64_t v14 = v13 ^ [(NSDictionary *)self->_outputVoiceCountForRecognitionLanguage hash];
  v15 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_recognitionLanguageWithMultipleOutputVoicesExists];
  unint64_t v16 = v10 ^ v14 ^ [v15 hash];

  return v16;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v14.receiver = self;
  v14.super_class = (Class)AFEnablementConfigurationProviderParameters;
  v5 = [(AFEnablementConfigurationProviderParameters *)&v14 description];
  unint64_t enablementFlow = self->_enablementFlow;
  if (enablementFlow > 9) {
    uint64_t v7 = @"(unknown)";
  }
  else {
    uint64_t v7 = off_1E5929458[enablementFlow];
  }
  uint64_t v8 = v7;
  uint64_t v9 = v8;
  unint64_t v10 = @"YES";
  if (self->_newUser) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (!self->_recognitionLanguageWithMultipleOutputVoicesExists) {
    unint64_t v10 = @"NO";
  }
  v12 = (void *)[v4 initWithFormat:@"%@ {unint64_t enablementFlow = %@, newUser = %@, userStatusFetchError = %@, dateStartedResolvingUserStatus = %@, dateEndedResolvingUserStatus = %@, experiment = %@, experimentFetchError = %@, dateStartedResolvingExperiment = %@, dateEndedResolvingExperiment = %@, outputVoiceCountForRecognitionLanguage = %@, recognitionLanguageWithMultipleOutputVoicesExists = %@}", v5, v8, v11, *(_OWORD *)&self->_userStatusFetchError, *(_OWORD *)&self->_dateEndedResolvingUserStatus, *(_OWORD *)&self->_experimentFetchError, self->_dateEndedResolvingExperiment, self->_outputVoiceCountForRecognitionLanguage, v10];

  return v12;
}

- (id)description
{
  return [(AFEnablementConfigurationProviderParameters *)self _descriptionWithIndent:0];
}

- (AFEnablementConfigurationProviderParameters)initWithEnablementFlow:(int64_t)a3 newUser:(BOOL)a4 userStatusFetchError:(id)a5 dateStartedResolvingUserStatus:(id)a6 dateEndedResolvingUserStatus:(id)a7 experiment:(id)a8 experimentFetchError:(id)a9 dateStartedResolvingExperiment:(id)a10 dateEndedResolvingExperiment:(id)a11 outputVoiceCountForRecognitionLanguage:(id)a12 recognitionLanguageWithMultipleOutputVoicesExists:(BOOL)a13
{
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = a12;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __340__AFEnablementConfigurationProviderParameters_initWithEnablementFlow_newUser_userStatusFetchError_dateStartedResolvingUserStatus_dateEndedResolvingUserStatus_experiment_experimentFetchError_dateStartedResolvingExperiment_dateEndedResolvingExperiment_outputVoiceCountForRecognitionLanguage_recognitionLanguageWithMultipleOutputVoicesExists___block_invoke;
  v37[3] = &unk_1E5927AA0;
  id v45 = v23;
  int64_t v46 = a3;
  BOOL v47 = a4;
  id v38 = v16;
  id v39 = v17;
  id v40 = v18;
  id v41 = v19;
  id v42 = v20;
  id v43 = v21;
  id v44 = v22;
  BOOL v48 = a13;
  id v24 = v23;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  id v30 = v17;
  id v31 = v16;
  v32 = [(AFEnablementConfigurationProviderParameters *)self initWithBuilder:v37];

  return v32;
}

void __340__AFEnablementConfigurationProviderParameters_initWithEnablementFlow_newUser_userStatusFetchError_dateStartedResolvingUserStatus_dateEndedResolvingUserStatus_experiment_experimentFetchError_dateStartedResolvingExperiment_dateEndedResolvingExperiment_outputVoiceCountForRecognitionLanguage_recognitionLanguageWithMultipleOutputVoicesExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 96);
  id v4 = a2;
  [v4 setEnablementFlow:v3];
  [v4 setNewUser:*(unsigned __int8 *)(a1 + 104)];
  [v4 setUserStatusFetchError:*(void *)(a1 + 32)];
  [v4 setDateStartedResolvingUserStatus:*(void *)(a1 + 40)];
  [v4 setDateEndedResolvingUserStatus:*(void *)(a1 + 48)];
  [v4 setExperiment:*(void *)(a1 + 56)];
  [v4 setExperimentFetchError:*(void *)(a1 + 64)];
  [v4 setDateStartedResolvingExperiment:*(void *)(a1 + 72)];
  [v4 setDateEndedResolvingExperiment:*(void *)(a1 + 80)];
  [v4 setOutputVoiceCountForRecognitionLanguage:*(void *)(a1 + 88)];
  [v4 setRecognitionLanguageWithMultipleOutputVoicesExists:*(unsigned __int8 *)(a1 + 105)];
}

- (AFEnablementConfigurationProviderParameters)init
{
  return [(AFEnablementConfigurationProviderParameters *)self initWithBuilder:0];
}

- (AFEnablementConfigurationProviderParameters)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFEnablementConfigurationProviderParametersMutation *))a3;
  v33.receiver = self;
  v33.super_class = (Class)AFEnablementConfigurationProviderParameters;
  v5 = [(AFEnablementConfigurationProviderParameters *)&v33 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFEnablementConfigurationProviderParametersMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFEnablementConfigurationProviderParametersMutation *)v7 isDirty])
    {
      v6->_unint64_t enablementFlow = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getEnablementFlow];
      v6->_BOOL newUser = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getNewUser];
      uint64_t v8 = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getUserStatusFetchError];
      uint64_t v9 = [v8 copy];
      userStatusFetchError = v6->_userStatusFetchError;
      v6->_userStatusFetchError = (NSError *)v9;

      uint64_t v11 = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getDateStartedResolvingUserStatus];
      uint64_t v12 = [v11 copy];
      dateStartedResolvingUserStatus = v6->_dateStartedResolvingUserStatus;
      v6->_dateStartedResolvingUserStatus = (NSDate *)v12;

      objc_super v14 = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getDateEndedResolvingUserStatus];
      uint64_t v15 = [v14 copy];
      dateEndedResolvingUserStatus = v6->_dateEndedResolvingUserStatus;
      v6->_dateEndedResolvingUserStatus = (NSDate *)v15;

      id v17 = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getExperiment];
      uint64_t v18 = [v17 copy];
      experiment = v6->_experiment;
      v6->_experiment = (AFExperiment *)v18;

      id v20 = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getExperimentFetchError];
      uint64_t v21 = [v20 copy];
      experimentFetchError = v6->_experimentFetchError;
      v6->_experimentFetchError = (NSError *)v21;

      id v23 = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getDateStartedResolvingExperiment];
      uint64_t v24 = [v23 copy];
      dateStartedResolvingExperiment = v6->_dateStartedResolvingExperiment;
      v6->_dateStartedResolvingExperiment = (NSDate *)v24;

      id v26 = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getDateEndedResolvingExperiment];
      uint64_t v27 = [v26 copy];
      dateEndedResolvingExperiment = v6->_dateEndedResolvingExperiment;
      v6->_dateEndedResolvingExperiment = (NSDate *)v27;

      id v29 = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getOutputVoiceCountForRecognitionLanguage];
      uint64_t v30 = [v29 copy];
      outputVoiceCountForRecognitionLanguage = v6->_outputVoiceCountForRecognitionLanguage;
      v6->_outputVoiceCountForRecognitionLanguage = (NSDictionary *)v30;

      v6->_BOOL recognitionLanguageWithMultipleOutputVoicesExists = [(_AFEnablementConfigurationProviderParametersMutation *)v7 getRecognitionLanguageWithMultipleOutputVoicesExists];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFEnablementConfigurationProviderParametersMutation *))a3;
  if (v4)
  {
    v5 = [[_AFEnablementConfigurationProviderParametersMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFEnablementConfigurationProviderParametersMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFEnablementConfigurationProviderParameters);
      v6->_unint64_t enablementFlow = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getEnablementFlow];
      v6->_BOOL newUser = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getNewUser];
      uint64_t v7 = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getUserStatusFetchError];
      uint64_t v8 = [v7 copy];
      userStatusFetchError = v6->_userStatusFetchError;
      v6->_userStatusFetchError = (NSError *)v8;

      unint64_t v10 = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getDateStartedResolvingUserStatus];
      uint64_t v11 = [v10 copy];
      dateStartedResolvingUserStatus = v6->_dateStartedResolvingUserStatus;
      v6->_dateStartedResolvingUserStatus = (NSDate *)v11;

      uint64_t v13 = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getDateEndedResolvingUserStatus];
      uint64_t v14 = [v13 copy];
      dateEndedResolvingUserStatus = v6->_dateEndedResolvingUserStatus;
      v6->_dateEndedResolvingUserStatus = (NSDate *)v14;

      id v16 = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getExperiment];
      uint64_t v17 = [v16 copy];
      experiment = v6->_experiment;
      v6->_experiment = (AFExperiment *)v17;

      id v19 = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getExperimentFetchError];
      uint64_t v20 = [v19 copy];
      experimentFetchError = v6->_experimentFetchError;
      v6->_experimentFetchError = (NSError *)v20;

      id v22 = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getDateStartedResolvingExperiment];
      uint64_t v23 = [v22 copy];
      dateStartedResolvingExperiment = v6->_dateStartedResolvingExperiment;
      v6->_dateStartedResolvingExperiment = (NSDate *)v23;

      id v25 = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getDateEndedResolvingExperiment];
      uint64_t v26 = [v25 copy];
      dateEndedResolvingExperiment = v6->_dateEndedResolvingExperiment;
      v6->_dateEndedResolvingExperiment = (NSDate *)v26;

      id v28 = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getOutputVoiceCountForRecognitionLanguage];
      uint64_t v29 = [v28 copy];
      outputVoiceCountForRecognitionLanguage = v6->_outputVoiceCountForRecognitionLanguage;
      v6->_outputVoiceCountForRecognitionLanguage = (NSDictionary *)v29;

      v6->_BOOL recognitionLanguageWithMultipleOutputVoicesExists = [(_AFEnablementConfigurationProviderParametersMutation *)v5 getRecognitionLanguageWithMultipleOutputVoicesExists];
    }
    else
    {
      uint64_t v6 = (AFEnablementConfigurationProviderParameters *)[(AFEnablementConfigurationProviderParameters *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFEnablementConfigurationProviderParameters *)[(AFEnablementConfigurationProviderParameters *)self copy];
  }

  return v6;
}

@end