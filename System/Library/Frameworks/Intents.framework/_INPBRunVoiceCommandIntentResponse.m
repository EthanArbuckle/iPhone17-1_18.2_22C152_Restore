@interface _INPBRunVoiceCommandIntentResponse
+ (BOOL)supportsSecureCoding;
+ (Class)stepType;
- (BOOL)continueRunning;
- (BOOL)customResponsesDisabled;
- (BOOL)hasAppBundleId;
- (BOOL)hasContinueRunning;
- (BOOL)hasCustomResponsesDisabled;
- (BOOL)hasIntentCategory;
- (BOOL)hasInterstitialDisabled;
- (BOOL)hasLocalizedAppName;
- (BOOL)hasParameters;
- (BOOL)hasPrefersExecutionOnCompanion;
- (BOOL)hasResponseTemplate;
- (BOOL)hasToggleState;
- (BOOL)hasUnderlyingIntent;
- (BOOL)hasUnderlyingIntentResponse;
- (BOOL)hasUnderlyingIntentTitle;
- (BOOL)hasVerb;
- (BOOL)interstitialDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersExecutionOnCompanion;
- (BOOL)readFrom:(id)a3;
- (NSArray)steps;
- (NSString)appBundleId;
- (NSString)localizedAppName;
- (NSString)responseTemplate;
- (NSString)underlyingIntentTitle;
- (NSString)verb;
- (_INPBArchivedObject)underlyingIntent;
- (_INPBArchivedObject)underlyingIntentResponse;
- (_INPBDictionary)parameters;
- (_INPBRunVoiceCommandIntentResponse)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)intentCategoryAsString:(int)a3;
- (id)stepAtIndex:(unint64_t)a3;
- (id)toggleStateAsString:(int)a3;
- (int)StringAsIntentCategory:(id)a3;
- (int)StringAsToggleState:(id)a3;
- (int)intentCategory;
- (int)toggleState;
- (unint64_t)hash;
- (unint64_t)stepsCount;
- (void)addStep:(id)a3;
- (void)clearSteps;
- (void)encodeWithCoder:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setContinueRunning:(BOOL)a3;
- (void)setCustomResponsesDisabled:(BOOL)a3;
- (void)setHasContinueRunning:(BOOL)a3;
- (void)setHasCustomResponsesDisabled:(BOOL)a3;
- (void)setHasIntentCategory:(BOOL)a3;
- (void)setHasInterstitialDisabled:(BOOL)a3;
- (void)setHasPrefersExecutionOnCompanion:(BOOL)a3;
- (void)setHasToggleState:(BOOL)a3;
- (void)setIntentCategory:(int)a3;
- (void)setInterstitialDisabled:(BOOL)a3;
- (void)setLocalizedAppName:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPrefersExecutionOnCompanion:(BOOL)a3;
- (void)setResponseTemplate:(id)a3;
- (void)setSteps:(id)a3;
- (void)setToggleState:(int)a3;
- (void)setUnderlyingIntent:(id)a3;
- (void)setUnderlyingIntentResponse:(id)a3;
- (void)setUnderlyingIntentTitle:(id)a3;
- (void)setVerb:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRunVoiceCommandIntentResponse

- (int)StringAsIntentCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CATEGORY_INFORMATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CATEGORY_PLAY_AUDIO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CATEGORY_PLAY_VIDEO"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CATEGORY_ORDER"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CATEGORY_NAVIGATION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CATEGORY_START"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SHARE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CREATE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SEARCH"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CATEGORY_TOGGLE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"CATEGORY_DOWNLOAD"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"CATEGORY_LOG"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CHECK_IN"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"CATEGORY_WORKFLOW"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"CATEGORY_REQUEST"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"CATEGORY_SET"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CALL_AUDIO"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"CATEGORY_CALL_VIDEO"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"CATEGORY_PLAY_SOUND"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"CATEGORY_USER_ACTIVITY"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)intentCategoryAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 0x15 && ((0x1FFDFFu >> v3))
  {
    int v4 = off_1E551B718[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verb, 0);
  objc_storeStrong((id *)&self->_underlyingIntentTitle, 0);
  objc_storeStrong((id *)&self->_underlyingIntentResponse, 0);
  objc_storeStrong((id *)&self->_underlyingIntent, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_responseTemplate, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

- (NSString)verb
{
  return self->_verb;
}

- (NSString)underlyingIntentTitle
{
  return self->_underlyingIntentTitle;
}

- (_INPBArchivedObject)underlyingIntentResponse
{
  return self->_underlyingIntentResponse;
}

- (_INPBArchivedObject)underlyingIntent
{
  return self->_underlyingIntent;
}

- (int)toggleState
{
  return self->_toggleState;
}

- (NSArray)steps
{
  return self->_steps;
}

- (NSString)responseTemplate
{
  return self->_responseTemplate;
}

- (BOOL)prefersExecutionOnCompanion
{
  return self->_prefersExecutionOnCompanion;
}

- (_INPBDictionary)parameters
{
  return self->_parameters;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (BOOL)interstitialDisabled
{
  return self->_interstitialDisabled;
}

- (int)intentCategory
{
  return self->_intentCategory;
}

- (BOOL)customResponsesDisabled
{
  return self->_customResponsesDisabled;
}

- (BOOL)continueRunning
{
  return self->_continueRunning;
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (id)dictionaryRepresentation
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_appBundleId)
  {
    int v4 = [(_INPBRunVoiceCommandIntentResponse *)self appBundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appBundleId"];
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasContinueRunning])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRunVoiceCommandIntentResponse continueRunning](self, "continueRunning"));
    [v3 setObject:v6 forKeyedSubscript:@"continueRunning"];
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasCustomResponsesDisabled])
  {
    v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRunVoiceCommandIntentResponse customResponsesDisabled](self, "customResponsesDisabled"));
    [v3 setObject:v7 forKeyedSubscript:@"customResponsesDisabled"];
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasIntentCategory])
  {
    uint64_t v8 = [(_INPBRunVoiceCommandIntentResponse *)self intentCategory];
    int v9 = v8 - 1;
    if (v8 - 1) < 0x15 && ((0x1FFDFFu >> v9))
    {
      v10 = off_1E551B718[v9];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v10 forKeyedSubscript:@"intentCategory"];
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasInterstitialDisabled])
  {
    v11 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRunVoiceCommandIntentResponse interstitialDisabled](self, "interstitialDisabled"));
    [v3 setObject:v11 forKeyedSubscript:@"interstitialDisabled"];
  }
  if (self->_localizedAppName)
  {
    v12 = [(_INPBRunVoiceCommandIntentResponse *)self localizedAppName];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"localizedAppName"];
  }
  v14 = [(_INPBRunVoiceCommandIntentResponse *)self parameters];
  v15 = [v14 dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"parameters"];

  if ([(_INPBRunVoiceCommandIntentResponse *)self hasPrefersExecutionOnCompanion])
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBRunVoiceCommandIntentResponse prefersExecutionOnCompanion](self, "prefersExecutionOnCompanion"));
    [v3 setObject:v16 forKeyedSubscript:@"prefersExecutionOnCompanion"];
  }
  if (self->_responseTemplate)
  {
    v17 = [(_INPBRunVoiceCommandIntentResponse *)self responseTemplate];
    v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"responseTemplate"];
  }
  if ([(NSArray *)self->_steps count])
  {
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v20 = self->_steps;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = [*(id *)(*((void *)&v37 + 1) + 8 * i) dictionaryRepresentation];
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v22);
    }

    [v3 setObject:v19 forKeyedSubscript:@"step"];
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasToggleState])
  {
    uint64_t v26 = [(_INPBRunVoiceCommandIntentResponse *)self toggleState];
    if (v26 == 1)
    {
      v27 = @"ON";
    }
    else if (v26 == 2)
    {
      v27 = @"OFF";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v26);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v27 forKeyedSubscript:@"toggleState"];
  }
  v28 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntent];
  v29 = [v28 dictionaryRepresentation];
  [v3 setObject:v29 forKeyedSubscript:@"underlyingIntent"];

  v30 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentResponse];
  v31 = [v30 dictionaryRepresentation];
  [v3 setObject:v31 forKeyedSubscript:@"underlyingIntentResponse"];

  if (self->_underlyingIntentTitle)
  {
    v32 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentTitle];
    v33 = (void *)[v32 copy];
    [v3 setObject:v33 forKeyedSubscript:@"underlyingIntentTitle"];
  }
  if (self->_verb)
  {
    v34 = [(_INPBRunVoiceCommandIntentResponse *)self verb];
    v35 = (void *)[v34 copy];
    [v3 setObject:v35 forKeyedSubscript:@"verb"];
  }

  return v3;
}

- (unint64_t)hash
{
  NSUInteger v19 = [(NSString *)self->_appBundleId hash];
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasContinueRunning]) {
    BOOL v3 = [(_INPBRunVoiceCommandIntentResponse *)self hasCustomResponsesDisabled];
  }
  else {
    BOOL v3 = [(_INPBRunVoiceCommandIntentResponse *)self hasCustomResponsesDisabled];
  }
  if (v3) {
    uint64_t v4 = 2654435761 * self->_customResponsesDisabled;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasIntentCategory]) {
    uint64_t v5 = 2654435761 * self->_intentCategory;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasInterstitialDisabled]) {
    uint64_t v6 = 2654435761 * self->_interstitialDisabled;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_localizedAppName hash];
  unint64_t v8 = [(_INPBDictionary *)self->_parameters hash];
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasPrefersExecutionOnCompanion]) {
    uint64_t v9 = 2654435761 * self->_prefersExecutionOnCompanion;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_responseTemplate hash];
  uint64_t v11 = [(NSArray *)self->_steps hash];
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasToggleState]) {
    uint64_t v12 = 2654435761 * self->_toggleState;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = v18 ^ v19 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  unint64_t v14 = v11 ^ v12 ^ [(_INPBArchivedObject *)self->_underlyingIntent hash];
  unint64_t v15 = v13 ^ v14 ^ [(_INPBArchivedObject *)self->_underlyingIntentResponse hash];
  NSUInteger v16 = [(NSString *)self->_underlyingIntentTitle hash];
  return v15 ^ v16 ^ [(NSString *)self->_verb hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_71;
  }
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self appBundleId];
  uint64_t v6 = [v4 appBundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_70;
  }
  uint64_t v7 = [(_INPBRunVoiceCommandIntentResponse *)self appBundleId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    uint64_t v9 = [(_INPBRunVoiceCommandIntentResponse *)self appBundleId];
    NSUInteger v10 = [v4 appBundleId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  int v12 = [(_INPBRunVoiceCommandIntentResponse *)self hasContinueRunning];
  if (v12 != [v4 hasContinueRunning]) {
    goto LABEL_71;
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasContinueRunning])
  {
    if ([v4 hasContinueRunning])
    {
      int continueRunning = self->_continueRunning;
      if (continueRunning != [v4 continueRunning]) {
        goto LABEL_71;
      }
    }
  }
  int v14 = [(_INPBRunVoiceCommandIntentResponse *)self hasCustomResponsesDisabled];
  if (v14 != [v4 hasCustomResponsesDisabled]) {
    goto LABEL_71;
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasCustomResponsesDisabled])
  {
    if ([v4 hasCustomResponsesDisabled])
    {
      int customResponsesDisabled = self->_customResponsesDisabled;
      if (customResponsesDisabled != [v4 customResponsesDisabled]) {
        goto LABEL_71;
      }
    }
  }
  int v16 = [(_INPBRunVoiceCommandIntentResponse *)self hasIntentCategory];
  if (v16 != [v4 hasIntentCategory]) {
    goto LABEL_71;
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasIntentCategory])
  {
    if ([v4 hasIntentCategory])
    {
      int intentCategory = self->_intentCategory;
      if (intentCategory != [v4 intentCategory]) {
        goto LABEL_71;
      }
    }
  }
  int v18 = [(_INPBRunVoiceCommandIntentResponse *)self hasInterstitialDisabled];
  if (v18 != [v4 hasInterstitialDisabled]) {
    goto LABEL_71;
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasInterstitialDisabled])
  {
    if ([v4 hasInterstitialDisabled])
    {
      int interstitialDisabled = self->_interstitialDisabled;
      if (interstitialDisabled != [v4 interstitialDisabled]) {
        goto LABEL_71;
      }
    }
  }
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self localizedAppName];
  uint64_t v6 = [v4 localizedAppName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_70;
  }
  uint64_t v20 = [(_INPBRunVoiceCommandIntentResponse *)self localizedAppName];
  if (v20)
  {
    uint64_t v21 = (void *)v20;
    uint64_t v22 = [(_INPBRunVoiceCommandIntentResponse *)self localizedAppName];
    uint64_t v23 = [v4 localizedAppName];
    int v24 = [v22 isEqual:v23];

    if (!v24) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self parameters];
  uint64_t v6 = [v4 parameters];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_70;
  }
  uint64_t v25 = [(_INPBRunVoiceCommandIntentResponse *)self parameters];
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    v27 = [(_INPBRunVoiceCommandIntentResponse *)self parameters];
    v28 = [v4 parameters];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  int v30 = [(_INPBRunVoiceCommandIntentResponse *)self hasPrefersExecutionOnCompanion];
  if (v30 != [v4 hasPrefersExecutionOnCompanion]) {
    goto LABEL_71;
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasPrefersExecutionOnCompanion])
  {
    if ([v4 hasPrefersExecutionOnCompanion])
    {
      int prefersExecutionOnCompanion = self->_prefersExecutionOnCompanion;
      if (prefersExecutionOnCompanion != [v4 prefersExecutionOnCompanion]) {
        goto LABEL_71;
      }
    }
  }
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self responseTemplate];
  uint64_t v6 = [v4 responseTemplate];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_70;
  }
  uint64_t v32 = [(_INPBRunVoiceCommandIntentResponse *)self responseTemplate];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBRunVoiceCommandIntentResponse *)self responseTemplate];
    v35 = [v4 responseTemplate];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self steps];
  uint64_t v6 = [v4 steps];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_70;
  }
  uint64_t v37 = [(_INPBRunVoiceCommandIntentResponse *)self steps];
  if (v37)
  {
    long long v38 = (void *)v37;
    long long v39 = [(_INPBRunVoiceCommandIntentResponse *)self steps];
    long long v40 = [v4 steps];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  int v42 = [(_INPBRunVoiceCommandIntentResponse *)self hasToggleState];
  if (v42 != [v4 hasToggleState]) {
    goto LABEL_71;
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasToggleState])
  {
    if ([v4 hasToggleState])
    {
      int toggleState = self->_toggleState;
      if (toggleState != [v4 toggleState]) {
        goto LABEL_71;
      }
    }
  }
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntent];
  uint64_t v6 = [v4 underlyingIntent];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_70;
  }
  uint64_t v44 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntent];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntent];
    v47 = [v4 underlyingIntent];
    int v48 = [v46 isEqual:v47];

    if (!v48) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentResponse];
  uint64_t v6 = [v4 underlyingIntentResponse];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_70;
  }
  uint64_t v49 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentResponse];
  if (v49)
  {
    v50 = (void *)v49;
    v51 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentResponse];
    v52 = [v4 underlyingIntentResponse];
    int v53 = [v51 isEqual:v52];

    if (!v53) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentTitle];
  uint64_t v6 = [v4 underlyingIntentTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_70;
  }
  uint64_t v54 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentTitle];
  if (v54)
  {
    v55 = (void *)v54;
    v56 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentTitle];
    v57 = [v4 underlyingIntentTitle];
    int v58 = [v56 isEqual:v57];

    if (!v58) {
      goto LABEL_71;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self verb];
  uint64_t v6 = [v4 verb];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v59 = [(_INPBRunVoiceCommandIntentResponse *)self verb];
    if (!v59)
    {

LABEL_74:
      BOOL v64 = 1;
      goto LABEL_72;
    }
    v60 = (void *)v59;
    v61 = [(_INPBRunVoiceCommandIntentResponse *)self verb];
    v62 = [v4 verb];
    char v63 = [v61 isEqual:v62];

    if (v63) {
      goto LABEL_74;
    }
  }
  else
  {
LABEL_70:
  }
LABEL_71:
  BOOL v64 = 0;
LABEL_72:

  return v64;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBRunVoiceCommandIntentResponse allocWithZone:](_INPBRunVoiceCommandIntentResponse, "allocWithZone:") init];
  uint64_t v6 = (void *)[(NSString *)self->_appBundleId copyWithZone:a3];
  [(_INPBRunVoiceCommandIntentResponse *)v5 setAppBundleId:v6];

  if ([(_INPBRunVoiceCommandIntentResponse *)self hasContinueRunning]) {
    [(_INPBRunVoiceCommandIntentResponse *)v5 setContinueRunning:[(_INPBRunVoiceCommandIntentResponse *)self continueRunning]];
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasCustomResponsesDisabled]) {
    [(_INPBRunVoiceCommandIntentResponse *)v5 setCustomResponsesDisabled:[(_INPBRunVoiceCommandIntentResponse *)self customResponsesDisabled]];
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasIntentCategory]) {
    [(_INPBRunVoiceCommandIntentResponse *)v5 setIntentCategory:[(_INPBRunVoiceCommandIntentResponse *)self intentCategory]];
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasInterstitialDisabled]) {
    [(_INPBRunVoiceCommandIntentResponse *)v5 setInterstitialDisabled:[(_INPBRunVoiceCommandIntentResponse *)self interstitialDisabled]];
  }
  uint64_t v7 = (void *)[(NSString *)self->_localizedAppName copyWithZone:a3];
  [(_INPBRunVoiceCommandIntentResponse *)v5 setLocalizedAppName:v7];

  id v8 = [(_INPBDictionary *)self->_parameters copyWithZone:a3];
  [(_INPBRunVoiceCommandIntentResponse *)v5 setParameters:v8];

  if ([(_INPBRunVoiceCommandIntentResponse *)self hasPrefersExecutionOnCompanion]) {
    [(_INPBRunVoiceCommandIntentResponse *)v5 setPrefersExecutionOnCompanion:[(_INPBRunVoiceCommandIntentResponse *)self prefersExecutionOnCompanion]];
  }
  uint64_t v9 = (void *)[(NSString *)self->_responseTemplate copyWithZone:a3];
  [(_INPBRunVoiceCommandIntentResponse *)v5 setResponseTemplate:v9];

  NSUInteger v10 = (void *)[(NSArray *)self->_steps copyWithZone:a3];
  [(_INPBRunVoiceCommandIntentResponse *)v5 setSteps:v10];

  if ([(_INPBRunVoiceCommandIntentResponse *)self hasToggleState]) {
    [(_INPBRunVoiceCommandIntentResponse *)v5 setToggleState:[(_INPBRunVoiceCommandIntentResponse *)self toggleState]];
  }
  id v11 = [(_INPBArchivedObject *)self->_underlyingIntent copyWithZone:a3];
  [(_INPBRunVoiceCommandIntentResponse *)v5 setUnderlyingIntent:v11];

  id v12 = [(_INPBArchivedObject *)self->_underlyingIntentResponse copyWithZone:a3];
  [(_INPBRunVoiceCommandIntentResponse *)v5 setUnderlyingIntentResponse:v12];

  NSUInteger v13 = (void *)[(NSString *)self->_underlyingIntentTitle copyWithZone:a3];
  [(_INPBRunVoiceCommandIntentResponse *)v5 setUnderlyingIntentTitle:v13];

  int v14 = (void *)[(NSString *)self->_verb copyWithZone:a3];
  [(_INPBRunVoiceCommandIntentResponse *)v5 setVerb:v14];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRunVoiceCommandIntentResponse *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRunVoiceCommandIntentResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRunVoiceCommandIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        id v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRunVoiceCommandIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRunVoiceCommandIntentResponse *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBRunVoiceCommandIntentResponse *)self appBundleId];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasContinueRunning]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasCustomResponsesDisabled]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasIntentCategory]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasInterstitialDisabled]) {
    PBDataWriterWriteBOOLField();
  }
  id v6 = [(_INPBRunVoiceCommandIntentResponse *)self localizedAppName];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(_INPBRunVoiceCommandIntentResponse *)self parameters];

  if (v7)
  {
    id v8 = [(_INPBRunVoiceCommandIntentResponse *)self parameters];
    PBDataWriterWriteSubmessage();
  }
  if ([(_INPBRunVoiceCommandIntentResponse *)self hasPrefersExecutionOnCompanion]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v9 = [(_INPBRunVoiceCommandIntentResponse *)self responseTemplate];

  if (v9) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  NSUInteger v10 = self->_steps;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  if ([(_INPBRunVoiceCommandIntentResponse *)self hasToggleState]) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v15 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntent];

  if (v15)
  {
    int v16 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntent];
    PBDataWriterWriteSubmessage();
  }
  v17 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentResponse];

  if (v17)
  {
    int v18 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentResponse];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v19 = [(_INPBRunVoiceCommandIntentResponse *)self underlyingIntentTitle];

  if (v19) {
    PBDataWriterWriteStringField();
  }
  uint64_t v20 = [(_INPBRunVoiceCommandIntentResponse *)self verb];

  if (v20) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRunVoiceCommandIntentResponseReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasVerb
{
  return self->_verb != 0;
}

- (void)setVerb:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  verb = self->_verb;
  self->_verb = v4;

  MEMORY[0x1F41817F8](v4, verb);
}

- (BOOL)hasUnderlyingIntentTitle
{
  return self->_underlyingIntentTitle != 0;
}

- (void)setUnderlyingIntentTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  underlyingIntentTitle = self->_underlyingIntentTitle;
  self->_underlyingIntentTitle = v4;

  MEMORY[0x1F41817F8](v4, underlyingIntentTitle);
}

- (BOOL)hasUnderlyingIntentResponse
{
  return self->_underlyingIntentResponse != 0;
}

- (void)setUnderlyingIntentResponse:(id)a3
{
}

- (BOOL)hasUnderlyingIntent
{
  return self->_underlyingIntent != 0;
}

- (void)setUnderlyingIntent:(id)a3
{
}

- (int)StringAsToggleState:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"ON"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"OFF"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)toggleStateAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"ON";
  }
  else if (a3 == 2)
  {
    int v4 = @"OFF";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)setHasToggleState:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasToggleState
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setToggleState:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xDF;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 0x20;
    self->_int toggleState = a3;
  }
}

- (id)stepAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_steps objectAtIndexedSubscript:a3];
}

- (unint64_t)stepsCount
{
  return [(NSArray *)self->_steps count];
}

- (void)addStep:(id)a3
{
  id v4 = a3;
  steps = self->_steps;
  id v8 = v4;
  if (!steps)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_steps;
    self->_steps = v6;

    id v4 = v8;
    steps = self->_steps;
  }
  [(NSArray *)steps addObject:v4];
}

- (void)clearSteps
{
}

- (void)setSteps:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  steps = self->_steps;
  self->_steps = v4;

  MEMORY[0x1F41817F8](v4, steps);
}

- (BOOL)hasResponseTemplate
{
  return self->_responseTemplate != 0;
}

- (void)setResponseTemplate:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  responseTemplate = self->_responseTemplate;
  self->_responseTemplate = v4;

  MEMORY[0x1F41817F8](v4, responseTemplate);
}

- (void)setHasPrefersExecutionOnCompanion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPrefersExecutionOnCompanion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPrefersExecutionOnCompanion:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int prefersExecutionOnCompanion = a3;
}

- (BOOL)hasParameters
{
  return self->_parameters != 0;
}

- (void)setParameters:(id)a3
{
}

- (BOOL)hasLocalizedAppName
{
  return self->_localizedAppName != 0;
}

- (void)setLocalizedAppName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  localizedAppName = self->_localizedAppName;
  self->_localizedAppName = v4;

  MEMORY[0x1F41817F8](v4, localizedAppName);
}

- (void)setHasInterstitialDisabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInterstitialDisabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setInterstitialDisabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int interstitialDisabled = a3;
}

- (void)setHasIntentCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIntentCategory
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIntentCategory:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFB;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 4;
    self->_int intentCategory = a3;
  }
}

- (void)setHasCustomResponsesDisabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCustomResponsesDisabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCustomResponsesDisabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int customResponsesDisabled = a3;
}

- (void)setHasContinueRunning:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContinueRunning
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setContinueRunning:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int continueRunning = a3;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (void)setAppBundleId:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  appBundleId = self->_appBundleId;
  self->_appBundleId = v4;

  MEMORY[0x1F41817F8](v4, appBundleId);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)stepType
{
  return (Class)objc_opt_class();
}

@end