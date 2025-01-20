@interface BMPBSiriExecutionEvent
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasAppBundleId;
- (BOOL)hasIntentName;
- (BOOL)hasInteractionId;
- (BOOL)hasSlotValue;
- (BOOL)hasStatusReason;
- (BOOL)hasTaskId;
- (BOOL)hasTaskStep;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appBundleId;
- (NSString)intentName;
- (NSString)interactionId;
- (NSString)slotValue;
- (NSString)statusReason;
- (NSString)taskId;
- (double)absoluteTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)taskStepAsString:(int)a3;
- (int)StringAsTaskStep:(id)a3;
- (int)taskStep;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setAppBundleId:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasTaskStep:(BOOL)a3;
- (void)setIntentName:(id)a3;
- (void)setInteractionId:(id)a3;
- (void)setSlotValue:(id)a3;
- (void)setStatusReason:(id)a3;
- (void)setTaskId:(id)a3;
- (void)setTaskStep:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSiriExecutionEvent

- (BOOL)hasTaskId
{
  return self->_taskId != 0;
}

- (int)taskStep
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_taskStep;
  }
  else {
    return 0;
  }
}

- (void)setTaskStep:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_taskStep = a3;
}

- (void)setHasTaskStep:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTaskStep
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)taskStepAsString:(int)a3
{
  if (a3 >= 0x5E)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D7D10[a3];
  }

  return v3;
}

- (int)StringAsTaskStep:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Start"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Authentication"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Wait"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Resume"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Canceled"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Failed"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Completed"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"HandoffToCompanion"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SiriExecutionTaskStepTypeSaved"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"UserAuthenticated"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ResolveConfirmStart"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"ResolveConfirmFinish"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"HandleIntentStart"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"HandleIntentFinish"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Disambiguation"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PromptForData"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"Confirmation"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"TapToEditCorrection"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"FetchData"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"ResolveApp"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SuggestApp"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"DisambiguateApp"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"ConfirmApp"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"SearchCompleted"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"Generic"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"PromptUnlock"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"ShowInterstitial"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"ContactResolution"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"DeviceSearch"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"IntentAutoConfirm"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"CheckUnsetRelationship"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"ConfirmIntent"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"ModifySlotValue"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"ReadingStart"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"RememberUnsetRelationship"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"ResolveSlotAuthenticationRequired"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"ResolveSlotConfirm"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"ConfirmationAccepted"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"ConfirmationRejected"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"ResolveSlotDisambiguate"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"DisambiguationResponseReceived"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"DisambiguationManualOverride"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"ResolveSlotNeedsValue"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"ResolveSlotNotRequired"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"ResolveSlotSuccess"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"ResolveSlotUnsupported"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"SetUnsetRelationship"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"SubtaskCompleted"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"TermConditionCheck"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"DirectExecution"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"SearchKnowledgeFromSports"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"SearchLocalEventsFromSports"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"SearchWebFromSports"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"IntentReformation"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"DialogCompleted"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"DialogFailed"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"SportsProbeStarted"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"SportsProbeNoResultsOrUnsupported"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"SportsProbeFailed"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"SportsProbeSuccessful"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"Preprocess"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"Render"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"FlowReplan"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"SendViaSnippet"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"ContentChangedViaSnippet"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"GateKeeperNewCall"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"GateKeeperNewMessage"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"GateKeeperReadMessage"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"Skip"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"Stop"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"Reply"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"AudioReply"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"ReadAgain"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"ModifyMessage"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"ReplyWithCall"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"TCCAccepted"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"TCCDeclined"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"GetCallBackgroundState"])
  {
    int v4 = 78;
  }
  else if ([v3 isEqualToString:@"SearchFailed"])
  {
    int v4 = 79;
  }
  else if ([v3 isEqualToString:@"Fallback"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"PartialFailure"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"Correction"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"AutoSend"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"AutoSendStarted"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"CheckSharingPolicy"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"PostNotificationToCompanion"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"ExecuteOnRemote"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"NeedsServerExecution"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"CheckPersonalDomainSetting"])
  {
    int v4 = 89;
  }
  else if ([v3 isEqualToString:@"CheckPersonalDomainSettingResponse"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"RequestIdentity"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"ConfirmIdentity"])
  {
    int v4 = 92;
  }
  else if ([v3 isEqualToString:@"CheckCompanionCompatibility"])
  {
    int v4 = 93;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasStatusReason
{
  return self->_statusReason != 0;
}

- (BOOL)hasSlotValue
{
  return self->_slotValue != 0;
}

- (BOOL)hasIntentName
{
  return self->_intentName != 0;
}

- (BOOL)hasAppBundleId
{
  return self->_appBundleId != 0;
}

- (BOOL)hasInteractionId
{
  return self->_interactionId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSiriExecutionEvent;
  int v4 = [(BMPBSiriExecutionEvent *)&v8 description];
  v5 = [(BMPBSiriExecutionEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  taskId = self->_taskId;
  if (taskId) {
    [v3 setObject:taskId forKey:@"taskId"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t taskStep = self->_taskStep;
    if (taskStep >= 0x5E)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_taskStep);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E55D7D10[taskStep];
    }
    [v4 setObject:v7 forKey:@"taskStep"];
  }
  statusReason = self->_statusReason;
  if (statusReason) {
    [v4 setObject:statusReason forKey:@"statusReason"];
  }
  slotValue = self->_slotValue;
  if (slotValue) {
    [v4 setObject:slotValue forKey:@"slotValue"];
  }
  intentName = self->_intentName;
  if (intentName) {
    [v4 setObject:intentName forKey:@"intentName"];
  }
  appBundleId = self->_appBundleId;
  if (appBundleId) {
    [v4 setObject:appBundleId forKey:@"appBundleId"];
  }
  interactionId = self->_interactionId;
  if (interactionId) {
    [v4 setObject:interactionId forKey:@"interactionId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v13 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v4 setObject:v13 forKey:@"absoluteTimestamp"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSiriExecutionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_statusReason)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_slotValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_intentName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_appBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_interactionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_taskId)
  {
    objc_msgSend(v4, "setTaskId:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_taskStep;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  if (self->_statusReason)
  {
    objc_msgSend(v5, "setStatusReason:");
    id v4 = v5;
  }
  if (self->_slotValue)
  {
    objc_msgSend(v5, "setSlotValue:");
    id v4 = v5;
  }
  if (self->_intentName)
  {
    objc_msgSend(v5, "setIntentName:");
    id v4 = v5;
  }
  if (self->_appBundleId)
  {
    objc_msgSend(v5, "setAppBundleId:");
    id v4 = v5;
  }
  if (self->_interactionId)
  {
    objc_msgSend(v5, "setInteractionId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    *((unsigned char *)v4 + 68) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_taskId copyWithZone:a3];
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_taskStep;
    *(unsigned char *)(v5 + 68) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_statusReason copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_slotValue copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_intentName copyWithZone:a3];
  v13 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v12;

  uint64_t v14 = [(NSString *)self->_appBundleId copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  uint64_t v16 = [(NSString *)self->_interactionId copyWithZone:a3];
  v17 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v16;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  taskId = self->_taskId;
  if ((unint64_t)taskId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](taskId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_taskStep != *((_DWORD *)v4 + 16)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_23:
    BOOL v11 = 0;
    goto LABEL_24;
  }
  statusReason = self->_statusReason;
  if ((unint64_t)statusReason | *((void *)v4 + 6)
    && !-[NSString isEqual:](statusReason, "isEqual:"))
  {
    goto LABEL_23;
  }
  slotValue = self->_slotValue;
  if ((unint64_t)slotValue | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](slotValue, "isEqual:")) {
      goto LABEL_23;
    }
  }
  intentName = self->_intentName;
  if ((unint64_t)intentName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](intentName, "isEqual:")) {
      goto LABEL_23;
    }
  }
  appBundleId = self->_appBundleId;
  if ((unint64_t)appBundleId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](appBundleId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  interactionId = self->_interactionId;
  if ((unint64_t)interactionId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](interactionId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  BOOL v11 = (*((unsigned char *)v4 + 68) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
    BOOL v11 = 1;
  }
LABEL_24:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_taskId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_taskStep;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_statusReason hash];
  NSUInteger v6 = [(NSString *)self->_slotValue hash];
  NSUInteger v7 = [(NSString *)self->_intentName hash];
  NSUInteger v8 = [(NSString *)self->_appBundleId hash];
  NSUInteger v9 = [(NSString *)self->_interactionId hash];
  if (*(unsigned char *)&self->_has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v12 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v12 = self->_absoluteTimestamp;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*((void *)v4 + 7))
  {
    -[BMPBSiriExecutionEvent setTaskId:](self, "setTaskId:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    self->_uint64_t taskStep = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 6))
  {
    -[BMPBSiriExecutionEvent setStatusReason:](self, "setStatusReason:");
    id v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[BMPBSiriExecutionEvent setSlotValue:](self, "setSlotValue:");
    id v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[BMPBSiriExecutionEvent setIntentName:](self, "setIntentName:");
    id v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBSiriExecutionEvent setAppBundleId:](self, "setAppBundleId:");
    id v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[BMPBSiriExecutionEvent setInteractionId:](self, "setInteractionId:");
    id v4 = v5;
  }
  if (*((unsigned char *)v4 + 68))
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(id)a3
{
}

- (NSString)statusReason
{
  return self->_statusReason;
}

- (void)setStatusReason:(id)a3
{
}

- (NSString)slotValue
{
  return self->_slotValue;
}

- (void)setSlotValue:(id)a3
{
}

- (NSString)intentName
{
  return self->_intentName;
}

- (void)setIntentName:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setInteractionId:(id)a3
{
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskId, 0);
  objc_storeStrong((id *)&self->_statusReason, 0);
  objc_storeStrong((id *)&self->_slotValue, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_intentName, 0);

  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end