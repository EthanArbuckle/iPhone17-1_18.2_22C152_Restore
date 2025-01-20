@interface CNSensitiveContentAnalysisManager
+ (id)defaultManager;
- (BOOL)canShowBlockContactUI;
- (BOOL)isEntitledForSensitiveContentUI;
- (BOOL)isSensitiveContentAnalysisEnabled;
- (BOOL)requiresDescriptiveInterventions;
- (BOOL)shouldShowSensitiveContentUI;
- (BOOL)shouldShowUIForPosterWithSensitiveContent:(BOOL)a3 forContact:(id)a4;
- (CNSensitiveContentAnalysisManager)initWithEntitlementVerifier:(id)a3;
- (CNSensitiveContentUIEntitlementVerifier)entitlementVerifier;
- (SCSensitivityAnalyzer)sensitivityAnalyzer;
- (void)setEntitlementVerifier:(id)a3;
- (void)setSensitivityAnalyzer:(id)a3;
@end

@implementation CNSensitiveContentAnalysisManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitivityAnalyzer, 0);

  objc_storeStrong((id *)&self->_entitlementVerifier, 0);
}

- (void)setSensitivityAnalyzer:(id)a3
{
}

- (SCSensitivityAnalyzer)sensitivityAnalyzer
{
  return self->_sensitivityAnalyzer;
}

- (void)setEntitlementVerifier:(id)a3
{
}

- (CNSensitiveContentUIEntitlementVerifier)entitlementVerifier
{
  return self->_entitlementVerifier;
}

- (BOOL)requiresDescriptiveInterventions
{
  v2 = [(CNSensitiveContentAnalysisManager *)self sensitivityAnalyzer];
  BOOL v3 = [v2 analysisPolicy] == 2;

  return v3;
}

- (BOOL)isSensitiveContentAnalysisEnabled
{
  v2 = [(CNSensitiveContentAnalysisManager *)self sensitivityAnalyzer];
  BOOL v3 = [v2 analysisPolicy] != 0;

  return v3;
}

- (BOOL)canShowBlockContactUI
{
  v2 = [(CNSensitiveContentAnalysisManager *)self entitlementVerifier];
  char v3 = [v2 processHasCommunicationFilterEntitlements];

  return v3;
}

- (BOOL)isEntitledForSensitiveContentUI
{
  v2 = [(CNSensitiveContentAnalysisManager *)self entitlementVerifier];
  char v3 = [v2 canShowSensitiveContentUI];

  return v3;
}

- (BOOL)shouldShowSensitiveContentUI
{
  BOOL v3 = [(CNSensitiveContentAnalysisManager *)self isEntitledForSensitiveContentUI];
  if (v3)
  {
    LOBYTE(v3) = [(CNSensitiveContentAnalysisManager *)self isSensitiveContentAnalysisEnabled];
  }
  return v3;
}

- (BOOL)shouldShowUIForPosterWithSensitiveContent:(BOOL)a3 forContact:(id)a4
{
  if (!a3 || ([a4 overrideSensitiveContent] & 1) != 0) {
    return 0;
  }
  if (![(CNSensitiveContentAnalysisManager *)self isEntitledForSensitiveContentUI]) {
    return 1;
  }

  return [(CNSensitiveContentAnalysisManager *)self isSensitiveContentAnalysisEnabled];
}

- (CNSensitiveContentAnalysisManager)initWithEntitlementVerifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CNSensitiveContentAnalysisManager;
  BOOL v3 = [(CNSensitiveContentAnalysisManager *)&v10 init];
  if (v3)
  {
    v4 = objc_alloc_init(CNSensitiveContentUIEntitlementVerifier);
    entitlementVerifier = v3->_entitlementVerifier;
    v3->_entitlementVerifier = v4;

    v6 = (SCSensitivityAnalyzer *)objc_alloc_init(MEMORY[0x1E4F3BD58]);
    sensitivityAnalyzer = v3->_sensitivityAnalyzer;
    v3->_sensitivityAnalyzer = v6;

    v8 = v3;
  }

  return v3;
}

+ (id)defaultManager
{
  id v2 = objc_alloc((Class)a1);
  BOOL v3 = objc_alloc_init(CNSensitiveContentUIEntitlementVerifier);
  v4 = (void *)[v2 initWithEntitlementVerifier:v3];

  return v4;
}

@end