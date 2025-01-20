@interface AEAssessmentState
+ (BOOL)supportsSecureCoding;
- (AEAssessmentIndividualConfiguration)mainIndividualConfiguration;
- (AEAssessmentState)initWithCoder:(id)a3;
- (BOOL)allowsAccessibilitySpeech;
- (BOOL)allowsActivityContinuation;
- (BOOL)allowsAutoCorrection;
- (BOOL)allowsContinuousPathKeyboard;
- (BOOL)allowsDictation;
- (BOOL)allowsKeyboardShortcuts;
- (BOOL)allowsPasswordAutoFill;
- (BOOL)allowsPredictiveKeyboard;
- (BOOL)allowsSmartPunctuation;
- (BOOL)allowsSpellCheck;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)configurationsByApplicationDescriptor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)isEqualToState:(void *)a1;
- (void)setAllowsAccessibilitySpeech:(BOOL)a3;
- (void)setAllowsActivityContinuation:(BOOL)a3;
- (void)setAllowsAutoCorrection:(BOOL)a3;
- (void)setAllowsContinuousPathKeyboard:(BOOL)a3;
- (void)setAllowsDictation:(BOOL)a3;
- (void)setAllowsKeyboardShortcuts:(BOOL)a3;
- (void)setAllowsPasswordAutoFill:(BOOL)a3;
- (void)setAllowsPredictiveKeyboard:(BOOL)a3;
- (void)setAllowsSmartPunctuation:(BOOL)a3;
- (void)setAllowsSpellCheck:(BOOL)a3;
- (void)setConfigurationsByApplicationDescriptor:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMainIndividualConfiguration:(id)a3;
@end

@implementation AEAssessmentState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithBool:", -[AEAssessmentState isEnabled](self, "isEnabled"));
  [v5 encodeObject:v6 forKey:@"enabled"];

  v7 = [(AEAssessmentState *)self configurationsByApplicationDescriptor];
  [v5 encodeObject:v7 forKey:@"configurationsByApplicationDescriptor"];

  v8 = [(AEAssessmentState *)self mainIndividualConfiguration];
  [v5 encodeObject:v8 forKey:@"mainIndividualConfiguration"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsAutoCorrection](self, "allowsAutoCorrection"));
  [v5 encodeObject:v9 forKey:@"allowsAutoCorrection"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsSmartPunctuation](self, "allowsSmartPunctuation"));
  [v5 encodeObject:v10 forKey:@"allowsSmartPunctuation"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsSpellCheck](self, "allowsSpellCheck"));
  [v5 encodeObject:v11 forKey:@"allowsSpellCheck"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsPredictiveKeyboard](self, "allowsPredictiveKeyboard"));
  [v5 encodeObject:v12 forKey:@"allowsPredictiveKeyboard"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsActivityContinuation](self, "allowsActivityContinuation"));
  [v5 encodeObject:v13 forKey:@"allowsActivityContinuation"];

  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsDictation](self, "allowsDictation"));
  [v5 encodeObject:v14 forKey:@"allowsDictation"];

  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsAccessibilitySpeech](self, "allowsAccessibilitySpeech"));
  [v5 encodeObject:v15 forKey:@"allowsAccessibilitySpeech"];

  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsPasswordAutoFill](self, "allowsPasswordAutoFill"));
  [v5 encodeObject:v16 forKey:@"allowsPasswordAutoFill"];

  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsContinuousPathKeyboard](self, "allowsContinuousPathKeyboard"));
  [v5 encodeObject:v17 forKey:@"allowsContinuousPathKeyboard"];

  objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsKeyboardShortcuts](self, "allowsKeyboardShortcuts"));
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v18 forKey:@"allowsKeyboardShortcuts"];
}

- (AEAssessmentState)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AEAssessmentState;
  id v5 = [(AEAssessmentState *)&v26 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enabled"];
    v5->_enabled = [v6 BOOLValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mainIndividualConfiguration"];
    mainIndividualConfiguration = v5->_mainIndividualConfiguration;
    v5->_mainIndividualConfiguration = (AEAssessmentIndividualConfiguration *)v7;

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"configurationsByApplicationDescriptor"];
    configurationsByApplicationDescriptor = v5->_configurationsByApplicationDescriptor;
    v5->_configurationsByApplicationDescriptor = (NSDictionary *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsAutoCorrection"];
    v5->_allowsAutoCorrection = [v15 BOOLValue];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsSmartPunctuation"];
    v5->_allowsSmartPunctuation = [v16 BOOLValue];

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsSpellCheck"];
    v5->_allowsSpellCheck = [v17 BOOLValue];

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsPredictiveKeyboard"];
    v5->_allowsPredictiveKeyboard = [v18 BOOLValue];

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsActivityContinuation"];
    v5->_allowsActivityContinuation = [v19 BOOLValue];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsDictation"];
    v5->_allowsDictation = [v20 BOOLValue];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsAccessibilitySpeech"];
    v5->_allowsAccessibilitySpeech = [v21 BOOLValue];

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsPasswordAutoFill"];
    v5->_allowsPasswordAutoFill = [v22 BOOLValue];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsContinuousPathKeyboard"];
    v5->_allowsContinuousPathKeyboard = [v23 BOOLValue];

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowsKeyboardShortcuts"];
    v5->_allowsKeyboardShortcuts = [v24 BOOLValue];
  }
  return v5;
}

- (unint64_t)hash
{
  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState isEnabled](self, "isEnabled"));
  uint64_t v3 = [v29 hash];
  v28 = [(AEAssessmentState *)self mainIndividualConfiguration];
  uint64_t v4 = [v28 hash];
  v27 = [(AEAssessmentState *)self configurationsByApplicationDescriptor];
  uint64_t v5 = v4 ^ [v27 hash] ^ v3;
  objc_super v26 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsAutoCorrection](self, "allowsAutoCorrection"));
  uint64_t v6 = [v26 hash];
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsSmartPunctuation](self, "allowsSmartPunctuation"));
  uint64_t v7 = v5 ^ v6 ^ [v25 hash];
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsSpellCheck](self, "allowsSpellCheck"));
  uint64_t v8 = [v24 hash];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsPredictiveKeyboard](self, "allowsPredictiveKeyboard"));
  uint64_t v10 = v8 ^ [v9 hash];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsActivityContinuation](self, "allowsActivityContinuation"));
  uint64_t v12 = v7 ^ v10 ^ [v11 hash];
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsDictation](self, "allowsDictation"));
  uint64_t v14 = [v13 hash];
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsAccessibilitySpeech](self, "allowsAccessibilitySpeech"));
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsPasswordAutoFill](self, "allowsPasswordAutoFill"));
  uint64_t v18 = v16 ^ [v17 hash];
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsContinuousPathKeyboard](self, "allowsContinuousPathKeyboard"));
  uint64_t v20 = v12 ^ v18 ^ [v19 hash];
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[AEAssessmentState allowsKeyboardShortcuts](self, "allowsKeyboardShortcuts"));
  unint64_t v22 = v20 ^ [v21 hash];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (AEAssessmentState *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    unsigned __int8 v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v6 = -[AEAssessmentState isEqualToState:](self, v5);
  }
  else {
LABEL_5:
  }
    unsigned __int8 v6 = 0;
LABEL_7:

  return v6;
}

- (void)isEqualToState:(void *)a1
{
  id v8 = a2;
  if (!a1) {
    goto LABEL_35;
  }
  int v9 = [a1 isEnabled];
  if (v9 != [v8 isEnabled])
  {
    a1 = 0;
    goto LABEL_35;
  }
  uint64_t v10 = [a1 mainIndividualConfiguration];
  if (v10
    || ([v8 mainIndividualConfiguration], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v2 = [a1 mainIndividualConfiguration];
    uint64_t v3 = [v8 mainIndividualConfiguration];
    if (([v2 isEqual:v3] & 1) == 0)
    {

      a1 = 0;
      goto LABEL_32;
    }
    int v11 = 1;
  }
  else
  {
    int v11 = 0;
  }
  uint64_t v12 = [a1 configurationsByApplicationDescriptor];
  if (v12
    || ([v8 configurationsByApplicationDescriptor],
        (v24 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = [a1 configurationsByApplicationDescriptor];
    unsigned __int8 v6 = [v8 configurationsByApplicationDescriptor];
    if (([v5 isEqual:v6] & 1) == 0)
    {

      a1 = 0;
      if (v12) {
        goto LABEL_30;
      }
LABEL_15:

      if ((v11 & 1) == 0) {
        goto LABEL_32;
      }
      goto LABEL_31;
    }
    objc_super v26 = v4;
    int v25 = 1;
  }
  else
  {
    objc_super v26 = v4;
    v24 = 0;
    int v25 = 0;
  }
  int v13 = [a1 allowsAutoCorrection];
  if (v13 != [v8 allowsAutoCorrection]) {
    goto LABEL_27;
  }
  int v14 = [a1 allowsSmartPunctuation];
  if (v14 != [v8 allowsSmartPunctuation]
    || (int v15 = [a1 allowsSpellCheck], v15 != objc_msgSend(v8, "allowsSpellCheck"))
    || (int v16 = [a1 allowsPredictiveKeyboard],
        v16 != [v8 allowsPredictiveKeyboard])
    || (int v17 = [a1 allowsActivityContinuation],
        v17 != [v8 allowsActivityContinuation])
    || (int v18 = [a1 allowsDictation], v18 != objc_msgSend(v8, "allowsDictation"))
    || (int v19 = [a1 allowsAccessibilitySpeech],
        v19 != [v8 allowsAccessibilitySpeech])
    || (int v20 = [a1 allowsPasswordAutoFill], v20 != objc_msgSend(v8, "allowsPasswordAutoFill"))|| (v21 = objc_msgSend(a1, "allowsContinuousPathKeyboard"), v21 != objc_msgSend(v8, "allowsContinuousPathKeyboard")))
  {
LABEL_27:
    a1 = 0;
    if (!v25) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  int v23 = [a1 allowsKeyboardShortcuts];
  a1 = (void *)(v23 ^ [v8 allowsKeyboardShortcuts] ^ 1);
  if (v25)
  {
LABEL_28:
  }
LABEL_29:
  uint64_t v4 = v26;
  if (!v12) {
    goto LABEL_15;
  }
LABEL_30:

  if (v11)
  {
LABEL_31:
  }
LABEL_32:
  if (!v10) {

  }
LABEL_35:
  return a1;
}

- (id)description
{
  int v23 = NSString;
  uint64_t v22 = objc_opt_class();
  if ([(AEAssessmentState *)self isEnabled]) {
    uint64_t v3 = @"Yes";
  }
  else {
    uint64_t v3 = @"No";
  }
  int v21 = v3;
  int v20 = [(AEAssessmentState *)self mainIndividualConfiguration];
  uint64_t v4 = [(AEAssessmentState *)self configurationsByApplicationDescriptor];
  if ([(AEAssessmentState *)self allowsAutoCorrection]) {
    uint64_t v5 = @"Yes";
  }
  else {
    uint64_t v5 = @"No";
  }
  int v19 = v5;
  if ([(AEAssessmentState *)self allowsSmartPunctuation]) {
    unsigned __int8 v6 = @"Yes";
  }
  else {
    unsigned __int8 v6 = @"No";
  }
  int v18 = v6;
  if ([(AEAssessmentState *)self allowsSpellCheck]) {
    uint64_t v7 = @"Yes";
  }
  else {
    uint64_t v7 = @"No";
  }
  int v17 = v7;
  if ([(AEAssessmentState *)self allowsPredictiveKeyboard]) {
    id v8 = @"Yes";
  }
  else {
    id v8 = @"No";
  }
  if ([(AEAssessmentState *)self allowsActivityContinuation]) {
    int v9 = @"Yes";
  }
  else {
    int v9 = @"No";
  }
  if ([(AEAssessmentState *)self allowsDictation]) {
    uint64_t v10 = @"Yes";
  }
  else {
    uint64_t v10 = @"No";
  }
  if ([(AEAssessmentState *)self allowsAccessibilitySpeech]) {
    int v11 = @"Yes";
  }
  else {
    int v11 = @"No";
  }
  if ([(AEAssessmentState *)self allowsPasswordAutoFill]) {
    uint64_t v12 = @"Yes";
  }
  else {
    uint64_t v12 = @"No";
  }
  if ([(AEAssessmentState *)self allowsContinuousPathKeyboard]) {
    int v13 = @"Yes";
  }
  else {
    int v13 = @"No";
  }
  if ([(AEAssessmentState *)self allowsKeyboardShortcuts]) {
    int v14 = @"Yes";
  }
  else {
    int v14 = @"No";
  }
  int v15 = [v23 stringWithFormat:@"<%@: %p { isEnabled = %@, mainIndividualConfiguration = %@, configurationsByApplicationDescriptor = %@, allowsAutoCorrection = %@, allowsSmartPunctuation = %@, allowsSpellCheck = %@, allowsPredictiveKeyboard = %@, allowsActivityContinuation = %@, allowsDictation = %@, allowsAccessibilitySpeech = %@, allowsPasswordAutoFill = %@, allowsContinuousPathKeyboard = %@, allowsKeyboardShortcuts = %@}>", v22, self, v21, v20, v4, v19, v18, v17, v8, v9, v10, v11, v12, v13, v14];

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  objc_msgSend(v4, "setEnabled:", -[AEAssessmentState isEnabled](self, "isEnabled"));
  uint64_t v5 = [(AEAssessmentState *)self configurationsByApplicationDescriptor];
  [v4 setConfigurationsByApplicationDescriptor:v5];

  unsigned __int8 v6 = [(AEAssessmentState *)self mainIndividualConfiguration];
  [v4 setMainIndividualConfiguration:v6];

  objc_msgSend(v4, "setAllowsAutoCorrection:", -[AEAssessmentState allowsAutoCorrection](self, "allowsAutoCorrection"));
  objc_msgSend(v4, "setAllowsSmartPunctuation:", -[AEAssessmentState allowsSmartPunctuation](self, "allowsSmartPunctuation"));
  objc_msgSend(v4, "setAllowsSpellCheck:", -[AEAssessmentState allowsSpellCheck](self, "allowsSpellCheck"));
  objc_msgSend(v4, "setAllowsPredictiveKeyboard:", -[AEAssessmentState allowsPredictiveKeyboard](self, "allowsPredictiveKeyboard"));
  objc_msgSend(v4, "setAllowsActivityContinuation:", -[AEAssessmentState allowsActivityContinuation](self, "allowsActivityContinuation"));
  objc_msgSend(v4, "setAllowsDictation:", -[AEAssessmentState allowsDictation](self, "allowsDictation"));
  objc_msgSend(v4, "setAllowsAccessibilitySpeech:", -[AEAssessmentState allowsAccessibilitySpeech](self, "allowsAccessibilitySpeech"));
  objc_msgSend(v4, "setAllowsPasswordAutoFill:", -[AEAssessmentState allowsPasswordAutoFill](self, "allowsPasswordAutoFill"));
  objc_msgSend(v4, "setAllowsContinuousPathKeyboard:", -[AEAssessmentState allowsContinuousPathKeyboard](self, "allowsContinuousPathKeyboard"));
  objc_msgSend(v4, "setAllowsKeyboardShortcuts:", -[AEAssessmentState allowsKeyboardShortcuts](self, "allowsKeyboardShortcuts"));
  return v4;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (AEAssessmentIndividualConfiguration)mainIndividualConfiguration
{
  return self->_mainIndividualConfiguration;
}

- (void)setMainIndividualConfiguration:(id)a3
{
}

- (NSDictionary)configurationsByApplicationDescriptor
{
  return self->_configurationsByApplicationDescriptor;
}

- (void)setConfigurationsByApplicationDescriptor:(id)a3
{
}

- (BOOL)allowsAutoCorrection
{
  return self->_allowsAutoCorrection;
}

- (void)setAllowsAutoCorrection:(BOOL)a3
{
  self->_allowsAutoCorrection = a3;
}

- (BOOL)allowsSmartPunctuation
{
  return self->_allowsSmartPunctuation;
}

- (void)setAllowsSmartPunctuation:(BOOL)a3
{
  self->_allowsSmartPunctuation = a3;
}

- (BOOL)allowsSpellCheck
{
  return self->_allowsSpellCheck;
}

- (void)setAllowsSpellCheck:(BOOL)a3
{
  self->_allowsSpellCheck = a3;
}

- (BOOL)allowsPredictiveKeyboard
{
  return self->_allowsPredictiveKeyboard;
}

- (void)setAllowsPredictiveKeyboard:(BOOL)a3
{
  self->_allowsPredictiveKeyboard = a3;
}

- (BOOL)allowsKeyboardShortcuts
{
  return self->_allowsKeyboardShortcuts;
}

- (void)setAllowsKeyboardShortcuts:(BOOL)a3
{
  self->_allowsKeyboardShortcuts = a3;
}

- (BOOL)allowsActivityContinuation
{
  return self->_allowsActivityContinuation;
}

- (void)setAllowsActivityContinuation:(BOOL)a3
{
  self->_allowsActivityContinuation = a3;
}

- (BOOL)allowsDictation
{
  return self->_allowsDictation;
}

- (void)setAllowsDictation:(BOOL)a3
{
  self->_allowsDictation = a3;
}

- (BOOL)allowsAccessibilitySpeech
{
  return self->_allowsAccessibilitySpeech;
}

- (void)setAllowsAccessibilitySpeech:(BOOL)a3
{
  self->_allowsAccessibilitySpeech = a3;
}

- (BOOL)allowsPasswordAutoFill
{
  return self->_allowsPasswordAutoFill;
}

- (void)setAllowsPasswordAutoFill:(BOOL)a3
{
  self->_allowsPasswordAutoFill = a3;
}

- (BOOL)allowsContinuousPathKeyboard
{
  return self->_allowsContinuousPathKeyboard;
}

- (void)setAllowsContinuousPathKeyboard:(BOOL)a3
{
  self->_allowsContinuousPathKeyboard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationsByApplicationDescriptor, 0);
  objc_storeStrong((id *)&self->_mainIndividualConfiguration, 0);
}

@end