@interface INRunVoiceCommandIntentResponse
+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (int)_errorCodeFromCode:(int64_t)a3;
+ (int)_typeFromCode:(int64_t)a3;
+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5;
- (INArchivedObject)underlyingIntent;
- (INArchivedObject)underlyingIntentResponse;
- (INRunVoiceCommandIntentResponse)init;
- (INRunVoiceCommandIntentResponse)initWithBackingStore:(id)a3;
- (INRunVoiceCommandIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (INRunVoiceCommandIntentResponse)initWithCoder:(id)a3;
- (NSArray)steps;
- (NSDictionary)parameters;
- (NSNumber)continueRunning;
- (NSNumber)customResponsesDisabled;
- (NSNumber)interstitialDisabled;
- (NSNumber)prefersExecutionOnCompanion;
- (NSString)appBundleId;
- (NSString)localizedAppName;
- (NSString)responseTemplate;
- (NSString)underlyingIntentTitle;
- (NSString)verb;
- (id)_dictionaryRepresentation;
- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4;
- (int64_t)_codeWithName:(id)a3;
- (int64_t)_intentResponseCode;
- (int64_t)code;
- (int64_t)intentCategory;
- (int64_t)toggleState;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setContinueRunning:(id)a3;
- (void)setCustomResponsesDisabled:(id)a3;
- (void)setIntentCategory:(int64_t)a3;
- (void)setInterstitialDisabled:(id)a3;
- (void)setLocalizedAppName:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPrefersExecutionOnCompanion:(id)a3;
- (void)setResponseTemplate:(id)a3;
- (void)setSteps:(id)a3;
- (void)setToggleState:(int64_t)a3;
- (void)setUnderlyingIntent:(id)a3;
- (void)setUnderlyingIntentResponse:(id)a3;
- (void)setUnderlyingIntentTitle:(id)a3;
- (void)setVerb:(id)a3;
@end

@implementation INRunVoiceCommandIntentResponse

- (id)_dictionaryRepresentation
{
  v60[16] = *MEMORY[0x1E4F143B8];
  v59[0] = @"code";
  unint64_t v3 = [(INRunVoiceCommandIntentResponse *)self code];
  unint64_t v58 = v3;
  if (v3 < 0x16)
  {
    v4 = off_1E55167C0[v3];
    v57 = v4;
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
    v57 = 0;
  }
  v47 = v4;
  v60[0] = v4;
  v59[1] = @"appBundleId";
  uint64_t v5 = [(INRunVoiceCommandIntentResponse *)self appBundleId];
  v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v46 = (void *)v5;
  v60[1] = v5;
  v59[2] = @"intentCategory";
  int64_t v7 = [(INRunVoiceCommandIntentResponse *)self intentCategory];
  if ((unint64_t)(v7 - 1) > 0x13) {
    v8 = @"unknown";
  }
  else {
    v8 = off_1E551EA00[v7 - 1];
  }
  v55 = v8;
  v60[2] = v55;
  v59[3] = @"customResponsesDisabled";
  uint64_t v9 = [(INRunVoiceCommandIntentResponse *)self customResponsesDisabled];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v45 = (void *)v9;
  v60[3] = v9;
  v59[4] = @"responseTemplate";
  uint64_t v11 = [(INRunVoiceCommandIntentResponse *)self responseTemplate];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v11;
  v60[4] = v11;
  v59[5] = @"parameters";
  uint64_t v13 = [(INRunVoiceCommandIntentResponse *)self parameters];
  v14 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v13;
  v60[5] = v13;
  v59[6] = @"verb";
  uint64_t v15 = [(INRunVoiceCommandIntentResponse *)self verb];
  v16 = (void *)v15;
  if (!v15)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v15;
  v60[6] = v15;
  v59[7] = @"underlyingIntent";
  uint64_t v17 = [(INRunVoiceCommandIntentResponse *)self underlyingIntent];
  v18 = (void *)v17;
  if (!v17)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v17;
  v60[7] = v17;
  v59[8] = @"localizedAppName";
  uint64_t v19 = [(INRunVoiceCommandIntentResponse *)self localizedAppName];
  v20 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v51 = v18;
  v40 = (void *)v19;
  v60[8] = v19;
  v59[9] = @"underlyingIntentResponse";
  uint64_t v21 = [(INRunVoiceCommandIntentResponse *)self underlyingIntentResponse];
  v22 = (void *)v21;
  if (!v21)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v21;
  v60[9] = v21;
  v59[10] = @"toggleState";
  int64_t v23 = [(INRunVoiceCommandIntentResponse *)self toggleState];
  v24 = @"unknown";
  if (v23 == 2) {
    v24 = @"off";
  }
  if (v23 == 1) {
    v24 = @"on";
  }
  v49 = v24;
  v60[10] = v49;
  v59[11] = @"continueRunning";
  uint64_t v25 = [(INRunVoiceCommandIntentResponse *)self continueRunning];
  v26 = (void *)v25;
  if (!v25)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v50 = v20;
  v56 = v6;
  v38 = (void *)v25;
  v60[11] = v25;
  v59[12] = @"interstitialDisabled";
  uint64_t v27 = [(INRunVoiceCommandIntentResponse *)self interstitialDisabled];
  v28 = (void *)v27;
  if (!v27)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v52 = v16;
  v53 = v14;
  v54 = v12;
  v60[12] = v27;
  v59[13] = @"underlyingIntentTitle";
  v29 = [(INRunVoiceCommandIntentResponse *)self underlyingIntentTitle];
  v30 = v29;
  if (!v29)
  {
    v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = v10;
  v60[13] = v30;
  v59[14] = @"steps";
  v32 = [(INRunVoiceCommandIntentResponse *)self steps];
  v33 = v32;
  if (!v32)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v60[14] = v33;
  v59[15] = @"prefersExecutionOnCompanion";
  v34 = [(INRunVoiceCommandIntentResponse *)self prefersExecutionOnCompanion];
  v35 = v34;
  if (!v34)
  {
    v35 = [MEMORY[0x1E4F1CA98] null];
  }
  v60[15] = v35;
  id v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:16];
  if (!v34) {

  }
  if (!v32) {
  if (!v29)
  }

  if (!v28) {
  if (!v26)
  }

  if (!v22) {
  if (!v50)
  }

  if (!v51) {
  if (!v52)
  }

  if (!v53) {
  if (!v54)
  }

  if (!v31) {
  if (!v56)
  }

  if (v58 >= 0x16) {

  }
  return v48;
}

- (void)setPrefersExecutionOnCompanion:(id)a3
{
  id v7 = a3;
  v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setPrefersExecutionOnCompanion:", objc_msgSend(v7, "BOOLValue"));
  }
  else {
    [v4 setHasPrefersExecutionOnCompanion:0];
  }

  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setSteps:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToVoiceCommandStepInfos(v4);

  [v5 setSteps:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setUnderlyingIntentTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setUnderlyingIntentTitle:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setInterstitialDisabled:(id)a3
{
  id v7 = a3;
  id v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setInterstitialDisabled:", objc_msgSend(v7, "BOOLValue"));
  }
  else {
    [v4 setHasInterstitialDisabled:0];
  }

  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setContinueRunning:(id)a3
{
  id v7 = a3;
  id v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setContinueRunning:", objc_msgSend(v7, "BOOLValue"));
  }
  else {
    [v4 setHasContinueRunning:0];
  }

  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setToggleState:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = v6;
  if (v5 == 0x7FFFFFFF) {
    [v6 setHasToggleState:0];
  }
  else {
    [v6 setToggleState:v5];
  }

  id v9 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v8 = [v9 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v8];
}

- (void)setUnderlyingIntentResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToArchivedObject(v4);

  [v5 setUnderlyingIntentResponse:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setLocalizedAppName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setLocalizedAppName:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setUnderlyingIntent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToArchivedObject(v4);

  [v5 setUnderlyingIntent:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setVerb:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setVerb:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setParameters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = INIntentSlotValueTransformToDictionary(v4);

  [v5 setParameters:v6];
  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setResponseTemplate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setResponseTemplate:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setCustomResponsesDisabled:(id)a3
{
  id v7 = a3;
  id v4 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if (v7) {
    objc_msgSend(v4, "setCustomResponsesDisabled:", objc_msgSend(v7, "BOOLValue"));
  }
  else {
    [v4 setHasCustomResponsesDisabled:0];
  }

  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v5 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (void)setIntentCategory:(int64_t)a3
{
  uint64_t v4 = 0x7FFFFFFFLL;
  if ((unint64_t)(a3 - 1) <= 0x13) {
    uint64_t v4 = dword_18CFC4F38[a3 - 1];
  }
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasIntentCategory:0];
  }
  else {
    [v5 setIntentCategory:v4];
  }

  id v8 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  id v7 = [v8 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v7];
}

- (void)setAppBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  [v5 setAppBundleId:v4];

  id v7 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  v6 = [v7 data];
  [(INIntentResponse *)self _setPayloadResponseMessageData:v6];
}

- (NSNumber)prefersExecutionOnCompanion
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasPrefersExecutionOnCompanion])
  {
    id v4 = NSNumber;
    uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "prefersExecutionOnCompanion"));
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSArray)steps
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 steps];
  id v4 = INIntentSlotValueTransformFromVoiceCommandStepInfos(v3);

  return (NSArray *)v4;
}

- (NSString)underlyingIntentTitle
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 underlyingIntentTitle];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSNumber)interstitialDisabled
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasInterstitialDisabled])
  {
    id v4 = NSNumber;
    uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "interstitialDisabled"));
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)continueRunning
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasContinueRunning])
  {
    id v4 = NSNumber;
    uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "continueRunning"));
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (int64_t)toggleState
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasToggleState];
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v6 = [v5 toggleState];
  uint64_t v7 = 2 * (v6 == 2);
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (INArchivedObject)underlyingIntentResponse
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 underlyingIntentResponse];
  int v4 = INIntentSlotValueTransformFromArchivedObject(v3);

  return (INArchivedObject *)v4;
}

- (NSString)localizedAppName
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 localizedAppName];
  int v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (INArchivedObject)underlyingIntent
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 underlyingIntent];
  int v4 = INIntentSlotValueTransformFromArchivedObject(v3);

  return (INArchivedObject *)v4;
}

- (NSString)verb
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 verb];
  int v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSDictionary)parameters
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 parameters];
  int v4 = INIntentSlotValueTransformFromDictionary(v3);

  return (NSDictionary *)v4;
}

- (NSString)responseTemplate
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 responseTemplate];
  int v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (NSNumber)customResponsesDisabled
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  if ([v3 hasCustomResponsesDisabled])
  {
    int v4 = NSNumber;
    uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "customResponsesDisabled"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (int64_t)intentCategory
{
  unint64_t v3 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v4 = [v3 hasIntentCategory];
  uint64_t v5 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  int v6 = [v5 intentCategory];
  if (v4 && (v6 - 1) <= 0x14) {
    int64_t v7 = qword_18CFC4F88[v6 - 1];
  }
  else {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)appBundleId
{
  v2 = [(INIntentResponse *)self _responseMessagePBRepresentation];
  unint64_t v3 = [v2 appBundleId];
  int v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v3 = a3;
  [v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeUnspecified"];
  uint64_t v4 = [v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeReady"];
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeContinueInApp"]) {
    uint64_t v4 = 2;
  }
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeInProgress"]) {
    uint64_t v4 = 3;
  }
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeSuccess"]) {
    uint64_t v4 = 4;
  }
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeUserConfirmationRequired"])uint64_t v4 = 5; {
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailure"])
  }
    uint64_t v4 = 6;
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureRequiringAppLaunch"])uint64_t v4 = 7; {
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureAppConfigurationRequired"])uint64_t v4 = 8;
  }
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureUnsupportedOnDevice"])uint64_t v4 = 9; {
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureIntentBlacklisted"])uint64_t v4 = 10;
  }
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureCustomError"])uint64_t v4 = 11; {
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureAppNotInstalledOnDevice"])uint64_t v4 = 12;
  }
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureIntentUnsupportedByApp"])uint64_t v4 = 13; {
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureAuthenticationUnsupportedOnDevice"])uint64_t v4 = 14;
  }
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailurePhraseBlacklisted"])uint64_t v4 = 15; {
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureAppBlacklisted"])uint64_t v4 = 16;
  }
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureCompanionProtectedDataUnavailable"])uint64_t v4 = 17; {
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureCompanionUnavailable"])uint64_t v4 = 18;
  }
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureIntentBlocked"])uint64_t v4 = 19; {
  if ([v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailurePhraseBlocked"])int64_t v5 = 20;
  }
  else {
    int64_t v5 = v4;
  }
  int v6 = [v3 isEqualToString:@"INRunVoiceCommandIntentResponseCodeFailureAppBlocked"];

  if (v6) {
    return 21;
  }
  else {
    return v5;
  }
}

- (int64_t)_intentResponseCode
{
  int64_t v2 = [(INRunVoiceCommandIntentResponse *)self code];
  if ((unint64_t)(v2 - 1) > 0x14) {
    return 0;
  }
  else {
    return qword_18CFC4008[v2 - 1];
  }
}

- (INRunVoiceCommandIntentResponse)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INRunVoiceCommandIntentResponse;
  return [(INIntentResponse *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)INRunVoiceCommandIntentResponse;
  [(INIntentResponse *)&v3 encodeWithCoder:a3];
}

- (int64_t)code
{
  v3.receiver = self;
  v3.super_class = (Class)INRunVoiceCommandIntentResponse;
  return [(INIntentResponse *)&v3 code];
}

- (INRunVoiceCommandIntentResponse)initWithBackingStore:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)INRunVoiceCommandIntentResponse;
  return [(INIntentResponse *)&v4 initWithBackingStore:a3];
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)INRunVoiceCommandIntentResponse;
  return [(INIntentResponse *)&v5 _initWithCode:a3 userActivity:a4];
}

- (INRunVoiceCommandIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t v7 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int64_t v8 = v7;
    if ((unint64_t)a3 > 0x15) {
      id v9 = 0;
    }
    else {
      id v9 = off_1E55167C0[a3];
    }
    v10 = v9;
    *(_DWORD *)buf = 136315906;
    uint64_t v15 = "-[INRunVoiceCommandIntentResponse initWithCode:userActivity:]";
    __int16 v16 = 2048;
    int64_t v17 = a3;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_18CB2F000, v8, OS_LOG_TYPE_INFO, "%s code = %zd (%@), userActivity = %@", buf, 0x2Au);
  }
  v13.receiver = self;
  v13.super_class = (Class)INRunVoiceCommandIntentResponse;
  uint64_t v11 = [(INIntentResponse *)&v13 _initWithCode:a3 userActivity:v6];

  return v11;
}

- (INRunVoiceCommandIntentResponse)init
{
  return [(INRunVoiceCommandIntentResponse *)self initWithCode:0 userActivity:0];
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 7;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) < 0xE) {
    return a3 - 7;
  }
  else {
    return 0x7FFFFFFF;
  }
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x14) {
    return 3;
  }
  else {
    return dword_18CFC3FB0[a3 - 1];
  }
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result = 0;
  switch(a3)
  {
    case 0:
      int64_t result = 4;
      break;
    case 1:
      uint64_t v6 = (a4 - 1);
      int64_t v7 = 6;
      if (a5) {
        int64_t v7 = 7;
      }
      if (v6 >= 0xE) {
        int64_t result = v7;
      }
      else {
        int64_t result = v6 + 8;
      }
      break;
    case 2:
      int64_t result = 3;
      break;
    case 4:
      int64_t result = 2;
      break;
    case 5:
      int64_t result = 1;
      break;
    case 7:
      int64_t result = 5;
      break;
    default:
      return result;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end