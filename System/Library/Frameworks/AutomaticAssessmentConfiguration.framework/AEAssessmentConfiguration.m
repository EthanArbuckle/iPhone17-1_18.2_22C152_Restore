@interface AEAssessmentConfiguration
+ (id)configurationFromWrapper:(id)a3;
- (AEAssessmentConfiguration)init;
- (AEAssessmentParticipantConfiguration)mainParticipantConfiguration;
- (AEAutocorrectMode)autocorrectMode;
- (BOOL)allowsAccessibilitySpeech;
- (BOOL)allowsActivityContinuation;
- (BOOL)allowsContinuousPathKeyboard;
- (BOOL)allowsDictation;
- (BOOL)allowsKeyboardShortcuts;
- (BOOL)allowsPasswordAutoFill;
- (BOOL)allowsPredictiveKeyboard;
- (BOOL)allowsSpellCheck;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)configurationsByApplication;
- (id)configurationWrapper;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)isEqualToConfiguration:(uint64_t)a1;
- (unint64_t)hash;
- (void)removeApplication:(AEAssessmentApplication *)application;
- (void)setAllowsAccessibilitySpeech:(BOOL)allowsAccessibilitySpeech;
- (void)setAllowsActivityContinuation:(BOOL)allowsActivityContinuation;
- (void)setAllowsContinuousPathKeyboard:(BOOL)allowsContinuousPathKeyboard;
- (void)setAllowsDictation:(BOOL)allowsDictation;
- (void)setAllowsKeyboardShortcuts:(BOOL)allowsKeyboardShortcuts;
- (void)setAllowsPasswordAutoFill:(BOOL)allowsPasswordAutoFill;
- (void)setAllowsPredictiveKeyboard:(BOOL)allowsPredictiveKeyboard;
- (void)setAllowsSpellCheck:(BOOL)allowsSpellCheck;
- (void)setAutocorrectMode:(AEAutocorrectMode)autocorrectMode;
- (void)setBackingConfiguratonsByApplication:(uint64_t)a1;
- (void)setConfiguration:(AEAssessmentParticipantConfiguration *)configuration forApplication:(AEAssessmentApplication *)application;
- (void)setMainParticipantConfiguration:(uint64_t)a1;
@end

@implementation AEAssessmentConfiguration

- (AEAssessmentConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)AEAssessmentConfiguration;
  v2 = [(AEAssessmentConfiguration *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mainParticipantConfiguration = v2->_mainParticipantConfiguration;
    v2->_mainParticipantConfiguration = (AEAssessmentParticipantConfiguration *)v3;

    uint64_t v5 = objc_opt_new();
    backingConfiguratonsByApplication = v2->_backingConfiguratonsByApplication;
    v2->_backingConfiguratonsByApplication = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (NSDictionary)configurationsByApplication
{
  if (self) {
    self = (AEAssessmentConfiguration *)self->_backingConfiguratonsByApplication;
  }
  v2 = (void *)[(AEAssessmentConfiguration *)self copy];

  return (NSDictionary *)v2;
}

- (void)setConfiguration:(AEAssessmentParticipantConfiguration *)configuration forApplication:(AEAssessmentApplication *)application
{
  v6 = application;
  uint64_t v7 = [(AEAssessmentParticipantConfiguration *)configuration copy];
  if (self) {
    backingConfiguratonsByApplication = self->_backingConfiguratonsByApplication;
  }
  else {
    backingConfiguratonsByApplication = 0;
  }
  id v9 = (id)v7;
  [(NSMutableDictionary *)backingConfiguratonsByApplication setObject:v7 forKeyedSubscript:v6];
}

- (void)removeApplication:(AEAssessmentApplication *)application
{
  if (self) {
    self = (AEAssessmentConfiguration *)self->_backingConfiguratonsByApplication;
  }
  [(AEAssessmentConfiguration *)self setObject:0 forKeyedSubscript:application];
}

- (id)configurationWrapper
{
  uint64_t v3 = objc_opt_new();
  v4 = objc_opt_new();
  if (self) {
    backingConfiguratonsByApplication = self->_backingConfiguratonsByApplication;
  }
  else {
    backingConfiguratonsByApplication = 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__AEAssessmentConfiguration_configurationWrapper__block_invoke;
  v9[3] = &unk_264DA27E8;
  v9[4] = v4;
  [(NSMutableDictionary *)backingConfiguratonsByApplication enumerateKeysAndObjectsUsingBlock:v9];
  v6 = [(AEAssessmentConfiguration *)self mainParticipantConfiguration];
  uint64_t v7 = [v6 individualConfiguration];
  [v3 setMainIndividualConfiguration:v7];

  [v3 setConfigurationsByApplicationDescriptor:v4];
  [v3 setAllowsAutoCorrection:self->_autocorrectMode & 1];
  [v3 setAllowsSmartPunctuation:(self->_autocorrectMode >> 1) & 1];
  [v3 setAllowsSpellCheck:self->_allowsSpellCheck];
  [v3 setAllowsPredictiveKeyboard:self->_allowsPredictiveKeyboard];
  [v3 setAllowsKeyboardShortcuts:self->_allowsKeyboardShortcuts];
  [v3 setAllowsActivityContinuation:self->_allowsActivityContinuation];
  [v3 setAllowsDictation:self->_allowsDictation];
  [v3 setAllowsAccessibilitySpeech:self->_allowsAccessibilitySpeech];
  [v3 setAllowsPasswordAutoFill:self->_allowsPasswordAutoFill];
  [v3 setAllowsContinuousPathKeyboard:self->_allowsContinuousPathKeyboard];

  return v3;
}

void __49__AEAssessmentConfiguration_configurationWrapper__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 individualConfiguration];
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v5 applicationDescriptor];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

+ (id)configurationFromWrapper:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  v6 = [v3 configurationsByApplicationDescriptor];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__AEAssessmentConfiguration_configurationFromWrapper___block_invoke;
  v14[3] = &unk_264DA2810;
  v14[4] = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v14];

  uint64_t v7 = (void *)[v5 mutableCopy];
  -[AEAssessmentConfiguration setBackingConfiguratonsByApplication:](v4, v7);

  id v8 = [v3 mainIndividualConfiguration];
  id v9 = +[AEAssessmentParticipantConfiguration instanceFromIndividualConfiguration:v8];
  -[AEAssessmentConfiguration setMainParticipantConfiguration:](v4, v9);

  *(void *)(v4 + 16) |= [v3 allowsAutoCorrection];
  int v10 = [v3 allowsSmartPunctuation];
  uint64_t v11 = 2;
  if (!v10) {
    uint64_t v11 = 0;
  }
  *(void *)(v4 + 16) |= v11;
  *(unsigned char *)(v4 + 8) = [v3 allowsSpellCheck];
  *(unsigned char *)(v4 + 9) = [v3 allowsPredictiveKeyboard];
  *(unsigned char *)(v4 + 10) = [v3 allowsKeyboardShortcuts];
  *(unsigned char *)(v4 + 11) = [v3 allowsActivityContinuation];
  *(unsigned char *)(v4 + 12) = [v3 allowsDictation];
  *(unsigned char *)(v4 + 13) = [v3 allowsAccessibilitySpeech];
  *(unsigned char *)(v4 + 14) = [v3 allowsPasswordAutoFill];
  char v12 = [v3 allowsContinuousPathKeyboard];

  *(unsigned char *)(v4 + 15) = v12;

  return (id)v4;
}

void __54__AEAssessmentConfiguration_configurationFromWrapper___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v7 = +[AEAssessmentApplication instanceFromApplicationDescriptor:a2];
  v6 = +[AEAssessmentParticipantConfiguration instanceFromIndividualConfiguration:v5];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

- (void)setBackingConfiguratonsByApplication:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setMainParticipantConfiguration:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[AEAssessmentConfiguration allocWithZone:a3] init];
  if (self) {
    backingConfiguratonsByApplication = self->_backingConfiguratonsByApplication;
  }
  else {
    backingConfiguratonsByApplication = 0;
  }
  v6 = (void *)[(NSMutableDictionary *)backingConfiguratonsByApplication mutableCopy];
  -[AEAssessmentConfiguration setBackingConfiguratonsByApplication:]((uint64_t)v4, v6);

  id v7 = [(AEAssessmentConfiguration *)self mainParticipantConfiguration];
  -[AEAssessmentConfiguration setMainParticipantConfiguration:]((uint64_t)v4, v7);

  v4->_autocorrectMode = self->_autocorrectMode;
  v4->_allowsSpellCheck = self->_allowsSpellCheck;
  v4->_allowsPredictiveKeyboard = self->_allowsPredictiveKeyboard;
  v4->_allowsKeyboardShortcuts = self->_allowsKeyboardShortcuts;
  v4->_allowsActivityContinuation = self->_allowsActivityContinuation;
  v4->_allowsDictation = self->_allowsDictation;
  v4->_allowsAccessibilitySpeech = self->_allowsAccessibilitySpeech;
  v4->_allowsPasswordAutoFill = self->_allowsPasswordAutoFill;
  v4->_allowsContinuousPathKeyboard = self->_allowsContinuousPathKeyboard;
  return v4;
}

- (unint64_t)hash
{
  v24 = [NSNumber numberWithUnsignedInteger:self->_autocorrectMode];
  uint64_t v3 = [v24 hash];
  v23 = [NSNumber numberWithBool:self->_allowsSpellCheck];
  uint64_t v4 = [v23 hash] ^ v3;
  v22 = [NSNumber numberWithBool:self->_allowsPredictiveKeyboard];
  uint64_t v5 = [v22 hash];
  v6 = [NSNumber numberWithBool:self->_allowsKeyboardShortcuts];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  id v8 = [NSNumber numberWithBool:self->_allowsActivityContinuation];
  uint64_t v9 = [v8 hash];
  int v10 = [NSNumber numberWithBool:self->_allowsDictation];
  uint64_t v11 = v9 ^ [v10 hash];
  char v12 = [NSNumber numberWithBool:self->_allowsAccessibilitySpeech];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  v14 = [NSNumber numberWithBool:self->_allowsPasswordAutoFill];
  uint64_t v15 = [v14 hash];
  v16 = [NSNumber numberWithBool:self->_allowsContinuousPathKeyboard];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(AEAssessmentConfiguration *)self mainParticipantConfiguration];
  uint64_t v19 = v17 ^ [v18 hash];
  unint64_t v20 = v13 ^ v19 ^ [(NSMutableDictionary *)self->_backingConfiguratonsByApplication hash];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AEAssessmentConfiguration *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v6 = 1;
    goto LABEL_7;
  }
  if ([(AEAssessmentConfiguration *)v4 isMemberOfClass:objc_opt_class()]) {
    char v6 = -[AEAssessmentConfiguration isEqualToConfiguration:]((uint64_t)self, v5);
  }
  else {
LABEL_5:
  }
    char v6 = 0;
LABEL_7:

  return v6;
}

- (uint64_t)isEqualToConfiguration:(uint64_t)a1
{
  uint64_t v7 = a2;
  id v8 = v7;
  if (!a1) {
    goto LABEL_16;
  }
  if (*(id *)(a1 + 16) != v7[2]
    || *(unsigned __int8 *)(a1 + 8) != *((unsigned __int8 *)v7 + 8)
    || *(unsigned __int8 *)(a1 + 9) != *((unsigned __int8 *)v7 + 9)
    || *(unsigned __int8 *)(a1 + 10) != *((unsigned __int8 *)v7 + 10)
    || *(unsigned __int8 *)(a1 + 11) != *((unsigned __int8 *)v7 + 11)
    || *(unsigned __int8 *)(a1 + 12) != *((unsigned __int8 *)v7 + 12)
    || *(unsigned __int8 *)(a1 + 13) != *((unsigned __int8 *)v7 + 13)
    || *(unsigned __int8 *)(a1 + 14) != *((unsigned __int8 *)v7 + 14)
    || *(unsigned __int8 *)(a1 + 15) != *((unsigned __int8 *)v7 + 15))
  {
    a1 = 0;
    goto LABEL_16;
  }
  uint64_t v9 = [(id)a1 mainParticipantConfiguration];
  if (v9
    || ([v8 mainParticipantConfiguration], (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v3 = [(id)a1 mainParticipantConfiguration];
    uint64_t v4 = [v8 mainParticipantConfiguration];
    if (![v3 isEqual:v4])
    {

      a1 = 0;
      goto LABEL_24;
    }
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
  }
  id v12 = *(id *)(a1 + 32);
  if (!v12)
  {
    id v5 = v8[4];
    if (!v5)
    {
      a1 = 1;
      if ((v10 & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  uint64_t v13 = *(void **)(a1 + 32);
  id v14 = v8[4];
  id v15 = v13;
  a1 = [v15 isEqual:v14];

  if (!v12)
  {

    if ((v10 & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  if (v10)
  {
LABEL_23:
  }
LABEL_24:
  if (!v9) {

  }
LABEL_16:
  return a1;
}

- (AEAutocorrectMode)autocorrectMode
{
  return self->_autocorrectMode;
}

- (void)setAutocorrectMode:(AEAutocorrectMode)autocorrectMode
{
  self->_autocorrectMode = autocorrectMode;
}

- (BOOL)allowsSpellCheck
{
  return self->_allowsSpellCheck;
}

- (void)setAllowsSpellCheck:(BOOL)allowsSpellCheck
{
  self->_allowsSpellCheck = allowsSpellCheck;
}

- (BOOL)allowsPredictiveKeyboard
{
  return self->_allowsPredictiveKeyboard;
}

- (void)setAllowsPredictiveKeyboard:(BOOL)allowsPredictiveKeyboard
{
  self->_allowsPredictiveKeyboard = allowsPredictiveKeyboard;
}

- (BOOL)allowsKeyboardShortcuts
{
  return self->_allowsKeyboardShortcuts;
}

- (void)setAllowsKeyboardShortcuts:(BOOL)allowsKeyboardShortcuts
{
  self->_allowsKeyboardShortcuts = allowsKeyboardShortcuts;
}

- (BOOL)allowsActivityContinuation
{
  return self->_allowsActivityContinuation;
}

- (void)setAllowsActivityContinuation:(BOOL)allowsActivityContinuation
{
  self->_allowsActivityContinuation = allowsActivityContinuation;
}

- (BOOL)allowsDictation
{
  return self->_allowsDictation;
}

- (void)setAllowsDictation:(BOOL)allowsDictation
{
  self->_allowsDictation = allowsDictation;
}

- (BOOL)allowsAccessibilitySpeech
{
  return self->_allowsAccessibilitySpeech;
}

- (void)setAllowsAccessibilitySpeech:(BOOL)allowsAccessibilitySpeech
{
  self->_allowsAccessibilitySpeech = allowsAccessibilitySpeech;
}

- (BOOL)allowsPasswordAutoFill
{
  return self->_allowsPasswordAutoFill;
}

- (void)setAllowsPasswordAutoFill:(BOOL)allowsPasswordAutoFill
{
  self->_allowsPasswordAutoFill = allowsPasswordAutoFill;
}

- (BOOL)allowsContinuousPathKeyboard
{
  return self->_allowsContinuousPathKeyboard;
}

- (void)setAllowsContinuousPathKeyboard:(BOOL)allowsContinuousPathKeyboard
{
  self->_allowsContinuousPathKeyboard = allowsContinuousPathKeyboard;
}

- (AEAssessmentParticipantConfiguration)mainParticipantConfiguration
{
  return self->_mainParticipantConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingConfiguratonsByApplication, 0);

  objc_storeStrong((id *)&self->_mainParticipantConfiguration, 0);
}

@end