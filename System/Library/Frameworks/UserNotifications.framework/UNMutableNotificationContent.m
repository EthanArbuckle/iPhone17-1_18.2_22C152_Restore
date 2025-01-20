@interface UNMutableNotificationContent
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAccessoryImageName:(id)a3;
- (void)setAttachments:(NSArray *)attachments;
- (void)setAttributedBody:(id)a3;
- (void)setBadge:(NSNumber *)badge;
- (void)setBody:(NSString *)body;
- (void)setCategoryIdentifier:(NSString *)categoryIdentifier;
- (void)setCommunicationContext:(id)a3;
- (void)setContentType:(id)a3;
- (void)setDate:(id)a3;
- (void)setDefaultActionBundleIdentifier:(id)a3;
- (void)setDefaultActionTitle:(id)a3;
- (void)setDefaultActionURL:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFilterCriteria:(NSString *)filterCriteria;
- (void)setFooter:(id)a3;
- (void)setHasDefaultAction:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setIcon:(id)a3;
- (void)setInterruptionLevel:(UNNotificationInterruptionLevel)interruptionLevel;
- (void)setLaunchImageName:(NSString *)launchImageName;
- (void)setPeopleIdentifiers:(id)a3;
- (void)setRealertCount:(unint64_t)a3;
- (void)setRelevanceScore:(double)relevanceScore;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setShouldAuthenticateDefaultAction:(BOOL)a3;
- (void)setShouldBackgroundDefaultAction:(BOOL)a3;
- (void)setShouldDisplayActionsInline:(BOOL)a3;
- (void)setShouldHideDate:(BOOL)a3;
- (void)setShouldHideTime:(BOOL)a3;
- (void)setShouldIgnoreDoNotDisturb:(BOOL)a3;
- (void)setShouldIgnoreDowntime:(BOOL)a3;
- (void)setShouldPreemptPresentedNotification:(BOOL)a3;
- (void)setShouldPreventNotificationDismissalAfterDefaultAction:(BOOL)a3;
- (void)setShouldShowSubordinateIcon:(BOOL)a3;
- (void)setShouldSuppressDefaultAction:(BOOL)a3;
- (void)setShouldSuppressScreenLightUp:(BOOL)a3;
- (void)setShouldSuppressSyncDismissalWhenRemoved:(BOOL)a3;
- (void)setShouldUseRequestIdentifierForDismissalSync:(BOOL)a3;
- (void)setSound:(UNNotificationSound *)sound;
- (void)setSpeechLanguage:(id)a3;
- (void)setSubtitle:(NSString *)subtitle;
- (void)setSummaryArgument:(NSString *)summaryArgument;
- (void)setSummaryArgumentCount:(NSUInteger)summaryArgumentCount;
- (void)setTargetContentIdentifier:(NSString *)targetContentIdentifier;
- (void)setThreadIdentifier:(NSString *)threadIdentifier;
- (void)setTitle:(NSString *)title;
- (void)setTopicIdentifiers:(id)a3;
- (void)setUserInfo:(NSDictionary *)userInfo;
@end

@implementation UNMutableNotificationContent

- (void)setContentType:(id)a3
{
  self->super._contentType = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setCommunicationContext:(id)a3
{
  self->super._communicationContext = (_UNNotificationCommunicationContext *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setAccessoryImageName:(id)a3
{
}

- (void)setAttachments:(NSArray *)attachments
{
  if (attachments) {
    self->super._attachments = (NSArray *)[(NSArray *)attachments copy];
  }
  else {
    self->super._attachments = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  MEMORY[0x1F41817F8]();
}

- (void)setBadge:(NSNumber *)badge
{
  self->super._badge = (NSNumber *)[(NSNumber *)badge copy];

  MEMORY[0x1F41817F8]();
}

- (void)setBody:(NSString *)body
{
  self->super._body = (NSString *)[(NSString *)body copy];

  MEMORY[0x1F41817F8]();
}

- (void)setAttributedBody:(id)a3
{
  self->super._attributedBody = (NSAttributedString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setCategoryIdentifier:(NSString *)categoryIdentifier
{
  if (categoryIdentifier) {
    self->super._categoryIdentifier = (NSString *)[(NSString *)categoryIdentifier copy];
  }
  else {
    self->super._categoryIdentifier = (NSString *)&stru_1F062A810;
  }

  MEMORY[0x1F41817F8]();
}

- (void)setDate:(id)a3
{
}

- (void)setDefaultActionTitle:(id)a3
{
  self->super._defaultActionTitle = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setDefaultActionURL:(id)a3
{
  self->super._defaultActionURL = (NSURL *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setDefaultActionBundleIdentifier:(id)a3
{
  self->super._defaultActionBundleIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setExpirationDate:(id)a3
{
  self->super._expirationDate = (NSDate *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setHeader:(id)a3
{
  self->super._header = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setFooter:(id)a3
{
  self->super._footer = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setIcon:(id)a3
{
}

- (void)setHasDefaultAction:(BOOL)a3
{
}

- (void)setLaunchImageName:(NSString *)launchImageName
{
  if (launchImageName) {
    v3 = launchImageName;
  }
  else {
    v3 = (NSString *)&stru_1F062A810;
  }
  objc_storeStrong((id *)&self->super._launchImageName, v3);
}

- (void)setPeopleIdentifiers:(id)a3
{
  if (a3) {
    self->super._peopleIdentifiers = (NSArray *)[a3 copy];
  }
  else {
    self->super._peopleIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
  }

  MEMORY[0x1F41817F8]();
}

- (void)setShouldHideDate:(BOOL)a3
{
  self->super._shouldHideDate = a3;
}

- (void)setShouldHideTime:(BOOL)a3
{
  self->super._shouldHideTime = a3;
}

- (void)setShouldIgnoreDoNotDisturb:(BOOL)a3
{
  self->super._shouldIgnoreDoNotDisturb = a3;
}

- (void)setShouldIgnoreDowntime:(BOOL)a3
{
  self->super._shouldIgnoreDowntime = a3;
}

- (void)setShouldAuthenticateDefaultAction:(BOOL)a3
{
  self->super._shouldAuthenticateDefaultAction = a3;
}

- (void)setShouldBackgroundDefaultAction:(BOOL)a3
{
  self->super._shouldBackgroundDefaultAction = a3;
}

- (void)setShouldPreventNotificationDismissalAfterDefaultAction:(BOOL)a3
{
  self->super._shouldPreventNotificationDismissalAfterDefaultAction = a3;
}

- (void)setShouldShowSubordinateIcon:(BOOL)a3
{
  self->super._shouldShowSubordinateIcon = a3;
}

- (void)setShouldSuppressDefaultAction:(BOOL)a3
{
  self->super._shouldSuppressDefaultAction = a3;
}

- (void)setShouldSuppressScreenLightUp:(BOOL)a3
{
  self->super._shouldSuppressScreenLightUp = a3;
}

- (void)setShouldSuppressSyncDismissalWhenRemoved:(BOOL)a3
{
  self->super._shouldSuppressSyncDismissalWhenRemoved = a3;
}

- (void)setShouldUseRequestIdentifierForDismissalSync:(BOOL)a3
{
  self->super._shouldUseRequestIdentifierForDismissalSync = a3;
}

- (void)setShouldPreemptPresentedNotification:(BOOL)a3
{
  self->super._shouldPreemptPresentedNotification = a3;
}

- (void)setShouldDisplayActionsInline:(BOOL)a3
{
  self->super._shouldDisplayActionsInline = a3;
}

- (void)setSound:(UNNotificationSound *)sound
{
  self->super._sound = (UNNotificationSound *)[(UNNotificationSound *)sound copy];

  MEMORY[0x1F41817F8]();
}

- (void)setSubtitle:(NSString *)subtitle
{
}

- (void)setThreadIdentifier:(NSString *)threadIdentifier
{
  if (threadIdentifier) {
    self->super._threadIdentifier = (NSString *)[(NSString *)threadIdentifier copy];
  }
  else {
    self->super._threadIdentifier = (NSString *)&stru_1F062A810;
  }

  MEMORY[0x1F41817F8]();
}

- (void)setTitle:(NSString *)title
{
  self->super._title = (NSString *)[(NSString *)title copy];

  MEMORY[0x1F41817F8]();
}

- (void)setTopicIdentifiers:(id)a3
{
  self->super._topicIdentifiers = (NSSet *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setRealertCount:(unint64_t)a3
{
  self->super._realertCount = a3;
}

- (void)setSummaryArgument:(NSString *)summaryArgument
{
  self->super._summaryArgument = (NSString *)[(NSString *)summaryArgument copy];

  MEMORY[0x1F41817F8]();
}

- (void)setSummaryArgumentCount:(NSUInteger)summaryArgumentCount
{
  self->super._summaryArgumentCount = summaryArgumentCount;
}

- (void)setTargetContentIdentifier:(NSString *)targetContentIdentifier
{
  self->super._targetContentIdentifier = (NSString *)[(NSString *)targetContentIdentifier copy];

  MEMORY[0x1F41817F8]();
}

- (void)setInterruptionLevel:(UNNotificationInterruptionLevel)interruptionLevel
{
  self->super._interruptionLevel = interruptionLevel;
}

- (void)setRelevanceScore:(double)relevanceScore
{
  if (relevanceScore >= 0.0)
  {
    if (relevanceScore <= 1.0) {
      self->super._relevanceScore = relevanceScore;
    }
    else {
      self->super._relevanceScore = 1.0;
    }
  }
  else
  {
    self->super._relevanceScore = 0.0;
  }
}

- (void)setFilterCriteria:(NSString *)filterCriteria
{
  self->super._filterCriteria = (NSString *)[(NSString *)filterCriteria copy];

  MEMORY[0x1F41817F8]();
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  self->super._screenCaptureProhibited = a3;
}

- (void)setSpeechLanguage:(id)a3
{
  self->super._speechLanguage = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  self->super._userInfo = (NSDictionary *)[(NSDictionary *)userInfo copy];

  MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v58 = [(UNNotificationContent *)self speechLanguage];
  v40 = +[UNNotificationContent allocWithZone:a3];
  v57 = [(UNNotificationContent *)self contentType];
  v56 = [(UNNotificationContent *)self communicationContext];
  v55 = [(UNNotificationContent *)self accessoryImageName];
  v54 = [(UNNotificationContent *)self attachments];
  v52 = [(UNNotificationContent *)self badge];
  v51 = [(UNNotificationContent *)self body];
  v53 = [(UNNotificationContent *)self attributedBody];
  v47 = [(UNNotificationContent *)self categoryIdentifier];
  v50 = [(UNNotificationContent *)self date];
  v49 = [(UNNotificationContent *)self icon];
  v48 = [(UNNotificationContent *)self defaultActionTitle];
  v46 = [(UNNotificationContent *)self defaultActionURL];
  v39 = [(UNNotificationContent *)self defaultActionBundleIdentifier];
  v38 = [(UNNotificationContent *)self expirationDate];
  v37 = [(UNNotificationContent *)self header];
  v45 = [(UNNotificationContent *)self footer];
  v36 = [(UNNotificationContent *)self launchImageName];
  v44 = [(UNNotificationContent *)self peopleIdentifiers];
  BOOL v35 = [(UNNotificationContent *)self shouldHideDate];
  BOOL v34 = [(UNNotificationContent *)self shouldHideTime];
  BOOL v33 = [(UNNotificationContent *)self shouldIgnoreDoNotDisturb];
  BOOL v32 = [(UNNotificationContent *)self shouldIgnoreDowntime];
  BOOL v31 = [(UNNotificationContent *)self shouldSuppressScreenLightUp];
  BOOL v30 = [(UNNotificationContent *)self shouldAuthenticateDefaultAction];
  BOOL v29 = [(UNNotificationContent *)self shouldBackgroundDefaultAction];
  BOOL v28 = [(UNNotificationContent *)self shouldPreventNotificationDismissalAfterDefaultAction];
  BOOL v25 = [(UNNotificationContent *)self shouldShowSubordinateIcon];
  BOOL v27 = [(UNNotificationContent *)self shouldSuppressDefaultAction];
  BOOL v26 = [(UNNotificationContent *)self shouldSuppressSyncDismissalWhenRemoved];
  BOOL v24 = [(UNNotificationContent *)self shouldUseRequestIdentifierForDismissalSync];
  BOOL v23 = [(UNNotificationContent *)self shouldPreemptPresentedNotification];
  BOOL v5 = [(UNNotificationContent *)self shouldDisplayActionsInline];
  v43 = [(UNNotificationContent *)self sound];
  v42 = [(UNNotificationContent *)self subtitle];
  v20 = [(UNNotificationContent *)self threadIdentifier];
  v22 = [(UNNotificationContent *)self title];
  v21 = [(UNNotificationContent *)self topicIdentifiers];
  unint64_t v6 = [(UNNotificationContent *)self realertCount];
  v7 = [(UNNotificationContent *)self summaryArgument];
  NSUInteger v8 = [(UNNotificationContent *)self summaryArgumentCount];
  v9 = [(UNNotificationContent *)self targetContentIdentifier];
  UNNotificationInterruptionLevel v10 = [(UNNotificationContent *)self interruptionLevel];
  [(UNNotificationContent *)self relevanceScore];
  double v12 = v11;
  v13 = [(UNNotificationContent *)self filterCriteria];
  BOOL v14 = [(UNNotificationContent *)self screenCaptureProhibited];
  v15 = [(UNNotificationContent *)self userInfo];
  LOBYTE(v19) = v14;
  BYTE5(v18) = v5;
  BYTE4(v18) = v23;
  BYTE3(v18) = v24;
  BYTE2(v18) = v26;
  BYTE1(v18) = v27;
  LOBYTE(v18) = v25;
  HIBYTE(v17) = v28;
  BYTE6(v17) = v29;
  BYTE5(v17) = v30;
  BYTE4(v17) = v31;
  BYTE3(v17) = v32;
  BYTE2(v17) = v33;
  BYTE1(v17) = v34;
  LOBYTE(v17) = v35;
  id v41 = -[UNNotificationContent _initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:](v40, "_initWithContentType:communicationContext:accessoryImageName:attachments:badge:body:attributedBody:categoryIdentifier:date:icon:defaultActionTitle:defaultActionURL:defaultActionBundleIdentifier:expirationDate:header:footer:launchImageName:peopleIdentifiers:shouldHideDate:shouldHideTime:shouldIgnoreDoNotDisturb:shouldIgnoreDowntime:shouldSuppressScreenLightUp:shouldAuthenticateDefaultAction:shouldBackgroundDefaultAction:shouldPreventNotificationDismissalAfterDefaultAction:shouldShowSubordinateIcon:shouldSuppressDefaultAction:shouldSuppressSyncDismissalWhenRemoved:shouldUseRequestIdentifierForDismissalSync:shouldPreemptPresentedNotification:shouldDisplayActionsInline:sound:subtitle:threadIdentifier:title:topicIdentifiers:realertCount:summaryArgument:summaryArgumentCount:targetContentIdentifier:interruptionLevel:relevanceScore:filterCriteria:screenCaptureProhibited:speechLanguage:userInfo:", v57, v56, v55, v54, v52, v51, v12, v53, v47,
          v50,
          v49,
          v48,
          v46,
          v39,
          v38,
          v37,
          v45,
          v36,
          v44,
          v17,
          v18,
          v43,
          v42,
          v20,
          v22,
          v21,
          v6,
          v7,
          v8,
          v9,
          v10,
          v13,
          v19,
          v58,
          v15);

  return v41;
}

@end