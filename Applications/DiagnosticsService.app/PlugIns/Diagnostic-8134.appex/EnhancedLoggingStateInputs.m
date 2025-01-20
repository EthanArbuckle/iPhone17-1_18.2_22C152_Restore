@interface EnhancedLoggingStateInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (NSArray)consentHandles;
- (NSArray)queue;
- (NSDictionary)followUpOptions;
- (NSDictionary)metadata;
- (NSDictionary)parameterPayloads;
- (NSDictionary)rawParameters;
- (NSDictionary)specificationPayloads;
- (int64_t)retries;
- (unint64_t)command;
- (void)setCommand:(unint64_t)a3;
- (void)setConsentHandles:(id)a3;
- (void)setFollowUpOptions:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setParameterPayloads:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRawParameters:(id)a3;
- (void)setRetries:(int64_t)a3;
- (void)setSpecificationPayloads:(id)a3;
@end

@implementation EnhancedLoggingStateInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  char v25 = 0;
  [(EnhancedLoggingStateInputs *)self setRawParameters:v4];
  v5 = [v4 dk_numberFromRequiredKey:ELSParameterCommand lowerBound:&off_100008420 upperBound:&off_100008438 failed:&v25];
  v6 = v5;
  if (v25) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (!v7) {
    -[EnhancedLoggingStateInputs setCommand:](self, "setCommand:", [v5 integerValue]);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100004558;
  v24[3] = &unk_100008238;
  v24[4] = self;
  v8 = objc_retainBlock(v24);
  v9 = [v4 dk_dictionaryFromKey:ELSParameterPayloadsDict defaultValue:0 failed:&v25];
  [(EnhancedLoggingStateInputs *)self setParameterPayloads:v9];

  uint64_t v10 = ELSDefaultQueue;
  v11 = +[NSSet setWithObject:objc_opt_class()];
  v12 = [v4 dk_arrayFromRequiredKey:v10 types:v11 maxLength:30 failed:&v25 validator:v8];
  [(EnhancedLoggingStateInputs *)self setQueue:v12];

  uint64_t v13 = ELSDefaultConsentHandles;
  v14 = +[NSSet setWithObject:objc_opt_class()];
  v15 = [v4 dk_arrayFromKey:v13 types:v14 maxLength:30 defaultValue:0 failed:&v25 validator:&stru_100008278];
  [(EnhancedLoggingStateInputs *)self setConsentHandles:v15];

  v16 = [v4 dk_numberFromKey:ELSParameterRetries lowerBound:&off_100008450 upperBound:&off_100008468 defaultValue:&off_100008480 failed:&v25];
  v17 = v16;
  if (!v25 && v16) {
    -[EnhancedLoggingStateInputs setRetries:](self, "setRetries:", [v16 integerValue]);
  }
  v18 = [v4 dk_dictionaryFromKey:ELSDefaultMetadata defaultValue:0 failed:&v25];
  [(EnhancedLoggingStateInputs *)self setMetadata:v18];

  uint64_t v19 = ELSDefaultFollowUpOptions;
  v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", ELSFollowUpOptionFrequency, ELSFollowUpOptionUseSpringBoardNotification, 0);
  v21 = [v4 dk_dictionaryFromKey:v19 limitedToKeys:v20 defaultValue:0 failed:&v25];
  [(EnhancedLoggingStateInputs *)self setFollowUpOptions:v21];

  BOOL v22 = v25 == 0;
  return v22;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  char v6 = 0;
  id v4 = [a3 dk_dictionaryFromKey:ELSParameterPayloadsDict defaultValue:0 failed:&v6];
  [(EnhancedLoggingStateInputs *)self setSpecificationPayloads:v4];

  return v6 == 0;
}

- (NSDictionary)rawParameters
{
  return self->_rawParameters;
}

- (void)setRawParameters:(id)a3
{
}

- (unint64_t)command
{
  return self->_command;
}

- (void)setCommand:(unint64_t)a3
{
  self->_command = a3;
}

- (NSArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDictionary)parameterPayloads
{
  return self->_parameterPayloads;
}

- (void)setParameterPayloads:(id)a3
{
}

- (NSDictionary)specificationPayloads
{
  return self->_specificationPayloads;
}

- (void)setSpecificationPayloads:(id)a3
{
}

- (int64_t)retries
{
  return self->_retries;
}

- (void)setRetries:(int64_t)a3
{
  self->_retries = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDictionary)followUpOptions
{
  return self->_followUpOptions;
}

- (void)setFollowUpOptions:(id)a3
{
}

- (NSArray)consentHandles
{
  return self->_consentHandles;
}

- (void)setConsentHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentHandles, 0);
  objc_storeStrong((id *)&self->_followUpOptions, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_specificationPayloads, 0);
  objc_storeStrong((id *)&self->_parameterPayloads, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_rawParameters, 0);
}

@end