@interface NSUserActivity
+ (BOOL)_currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4;
+ (BOOL)_supportsUserActivityAppLinks;
+ (id)_currentUserActivityUUID;
+ (id)_fetchUserActivityWithUUID:(id)a3 intervalToWaitForDocumentSynchronizationToComplete:(double)a4 completionHandler:(id)a5;
+ (id)_userFacingErrorForLaunchServicesError:(id)a3 userInfo:(id)a4;
+ (void)_fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4;
+ (void)_registerUserActivityType:(id)a3 dynamicActivityType:(id)a4;
+ (void)_unregisterUserActivityType:(id)a3 dynamicActivityType:(id)a4;
+ (void)deleteAllSavedUserActivitiesWithCompletionHandler:(void *)handler;
+ (void)deleteSavedUserActivitiesWithPersistentIdentifiers:(NSArray *)persistentIdentifiers completionHandler:(void *)handler;
- (BOOL)_createUserActivityDataWithOptions:(id)a3 completionHandler:(id)a4;
- (BOOL)_createUserActivityStringsWithOptions:(id)a3 completionHandler:(id)a4;
- (BOOL)isEligibleForHandoff;
- (BOOL)isEligibleForPrediction;
- (BOOL)isEligibleForPublicIndexing;
- (BOOL)isEligibleForSearch;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsSave;
- (BOOL)supportsContinuationStreams;
- (CSSearchableItemAttributeSet)contentAttributeSet;
- (NSDate)_lastActivityDate;
- (NSDate)expirationDate;
- (NSDictionary)_contentAttributes;
- (NSDictionary)_frameworkPayload;
- (NSDictionary)_options;
- (NSDictionary)userInfo;
- (NSSet)keywords;
- (NSSet)requiredUserInfoKeys;
- (NSString)_contentIdentifier;
- (NSString)_contentType;
- (NSString)_subtitle;
- (NSString)_teamIdentifier;
- (NSString)activityType;
- (NSString)targetContentIdentifier;
- (NSString)title;
- (NSURL)referrerURL;
- (NSURL)webpageURL;
- (NSUUID)_uniqueIdentifier;
- (NSUserActivity)init;
- (NSUserActivity)initWithActivityType:(NSString *)activityType;
- (NSUserActivity)initWithInternalUserActivity:(id)a3;
- (NSUserActivity)initWithTypeIdentifier:(id)a3;
- (NSUserActivityDelegate)_frameworkDelegate;
- (NSUserActivityPersistentIdentifier)persistentIdentifier;
- (UAUserActivity)_internalUserActivity;
- (id)_determineMatchingApplicationBundleIdentifierWithOptions:(id)a3;
- (id)_initWithTypeIdentifier:(id)a3 suggestedActionType:(int64_t)a4 options:(id)a5;
- (id)_initWithUserActivityData:(id)a3;
- (id)_initWithUserActivityData:(id)a3 options:(id)a4;
- (id)_initWithUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5;
- (id)_initWithUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5 options:(id)a6;
- (id)_initWithUserActivityType:(id)a3 dynamicActivityType:(id)a4 options:(id)a5;
- (id)_parentUserActivity;
- (id)contentAttributes;
- (id)contentType;
- (id)contentUserAction;
- (id)delegate;
- (id)typeIdentifier;
- (id)webPageURL;
- (int64_t)_suggestedActionType;
- (unint64_t)hash;
- (void)_addKeywordsFromArray:(id)a3;
- (void)_prepareUserActivityForLaunchingWithOptions:(id)a3 completionHandler:(id)a4;
- (void)_resignCurrent;
- (void)_setFrameworkDelegate:(id)a3;
- (void)_setOptions:(id)a3;
- (void)addUserInfoEntriesFromDictionary:(NSDictionary *)otherDictionary;
- (void)becomeCurrent;
- (void)dealloc;
- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4;
- (void)didSynchronizeActivity;
- (void)getContinuationStreamsWithCompletionHandler:(void *)completionHandler;
- (void)invalidate;
- (void)resignCurrent;
- (void)setContentAttributeSet:(CSSearchableItemAttributeSet *)contentAttributeSet;
- (void)setContentUserAction:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setEligibleForHandoff:(BOOL)eligibleForHandoff;
- (void)setEligibleForPrediction:(BOOL)eligibleForPrediction;
- (void)setEligibleForPublicIndexing:(BOOL)eligibleForPublicIndexing;
- (void)setEligibleForSearch:(BOOL)eligibleForSearch;
- (void)setExpirationDate:(NSDate *)expirationDate;
- (void)setKeywords:(NSSet *)keywords;
- (void)setNeedsSave:(BOOL)needsSave;
- (void)setPersistentIdentifier:(NSUserActivityPersistentIdentifier)persistentIdentifier;
- (void)setReferrerURL:(NSURL *)referrerURL;
- (void)setRequiredUserInfoKeys:(NSSet *)requiredUserInfoKeys;
- (void)setSupportsContinuationStreams:(BOOL)supportsContinuationStreams;
- (void)setTargetContentIdentifier:(NSString *)targetContentIdentifier;
- (void)setTitle:(NSString *)title;
- (void)setUserInfo:(NSDictionary *)userInfo;
- (void)setWebPageURL:(id)a3;
- (void)setWebpageURL:(NSURL *)webpageURL;
- (void)willSynchronizeActivity;
@end

@implementation NSUserActivity

- (void)setWebpageURL:(NSURL *)webpageURL
{
  v4 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v4 setWebpageURL:webpageURL];
}

- (void)resignCurrent
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v2 resignCurrent];
}

- (void)addUserInfoEntriesFromDictionary:(NSDictionary *)otherDictionary
{
  v4 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v4 addUserInfoEntriesFromDictionary:otherDictionary];
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (_MergedGlobals_140)
  {
    v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 setExpirationDate:expirationDate];
  }
}

- (void)setPersistentIdentifier:(NSUserActivityPersistentIdentifier)persistentIdentifier
{
  [(NSUserActivity *)self _internalUserActivity];
  if (objc_opt_respondsToSelector())
  {
    v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 setPersistentIdentifier:persistentIdentifier];
  }
}

- (void)setEligibleForPrediction:(BOOL)eligibleForPrediction
{
  BOOL v3 = eligibleForPrediction;
  v4 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v4 setEligibleForPrediction:v3];
}

- (void)setRequiredUserInfoKeys:(NSSet *)requiredUserInfoKeys
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (_MergedGlobals_140)
  {
    v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 setRequiredUserInfoKeys:requiredUserInfoKeys];
  }
}

- (void)setNeedsSave:(BOOL)needsSave
{
  BOOL v3 = needsSave;
  v4 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v4 setNeedsSave:v3];
}

- (BOOL)isEligibleForHandoff
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (!_MergedGlobals_140) {
    return 1;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return [(UAUserActivity *)v3 isEligibleForHandoff];
}

- (void)setEligibleForPublicIndexing:(BOOL)eligibleForPublicIndexing
{
  BOOL v3 = eligibleForPublicIndexing;
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (_MergedGlobals_140)
  {
    v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 setEligibleForPublicIndexing:v3];
  }
}

- (void)setKeywords:(NSSet *)keywords
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (_MergedGlobals_140)
  {
    v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 setKeywords:keywords];
  }
}

- (void)setEligibleForHandoff:(BOOL)eligibleForHandoff
{
  BOOL v3 = eligibleForHandoff;
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (_MergedGlobals_140)
  {
    v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 setEligibleForHandoff:v3];
  }
}

- (void)becomeCurrent
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v2 becomeCurrent];
}

- (void)setTitle:(NSString *)title
{
  v4 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v4 setTitle:title];
}

- (BOOL)_createUserActivityStringsWithOptions:(id)a3 completionHandler:(id)a4
{
  [(NSUserActivity *)self _internalUserActivity];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  v7 = [(NSUserActivity *)self _internalUserActivity];

  return [(UAUserActivity *)v7 createUserActivityStringsWithSaving:1 options:a3 completionHandler:a4];
}

- (NSSet)keywords
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (!_MergedGlobals_140) {
    return 0;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return (NSSet *)[(UAUserActivity *)v3 keywords];
}

- (int64_t)_suggestedActionType
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return [(UAUserActivity *)v2 suggestedActionType];
}

- (void)setEligibleForSearch:(BOOL)eligibleForSearch
{
  BOOL v3 = eligibleForSearch;
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (_MergedGlobals_140)
  {
    v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 setEligibleForSearch:v3];
  }
}

- (BOOL)isEligibleForPublicIndexing
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (!_MergedGlobals_140) {
    return 0;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return [(UAUserActivity *)v3 isEligibleForPublicIndexing];
}

- (void)setDelegate:(id)delegate
{
  v4 = self;
  objc_storeWeak(&self->_delegate, delegate);
  if (([(UAUserActivity *)[(NSUserActivity *)v4 _internalUserActivity] isInvalidated] & 1) == 0)
  {
    v5 = [(NSUserActivity *)v4 _internalUserActivity];
    if (!delegate && ![(NSUserActivity *)v4 _frameworkDelegate]) {
      v4 = 0;
    }
    [(UAUserActivity *)v5 setDelegate:v4];
  }
}

- (void)_setFrameworkDelegate:(id)a3
{
  objc_storeWeak(&self->_frameworkDelegate, a3);
  if (([(UAUserActivity *)[(NSUserActivity *)self _internalUserActivity] isInvalidated] & 1) == 0)
  {
    v5 = [(NSUserActivity *)self _internalUserActivity];
    if ((unint64_t)a3 | (unint64_t)[(NSUserActivity *)self delegate]) {
      v6 = self;
    }
    else {
      v6 = 0;
    }
    [(UAUserActivity *)v5 setDelegate:v6];
  }
}

- (void)willSynchronizeActivity
{
  BOOL v3 = [(NSUserActivity *)self _frameworkDelegate];
  id v4 = [(NSUserActivity *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(NSUserActivityDelegate *)v3 userActivityWillSave:self];
  }
  if (objc_opt_respondsToSelector())
  {
    [v4 userActivityWillSave:self];
  }
}

- (NSUserActivityDelegate)_frameworkDelegate
{
  return (NSUserActivityDelegate *)objc_loadWeak(&self->_frameworkDelegate);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  id v4 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v4 setUserInfo:userInfo];
}

- (NSString)title
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return (NSString *)[(UAUserActivity *)v2 title];
}

- (NSUUID)_uniqueIdentifier
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return (NSUUID *)[(UAUserActivity *)v2 uniqueIdentifier];
}

- (BOOL)isEligibleForSearch
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (!_MergedGlobals_140) {
    return 0;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return [(UAUserActivity *)v3 isEligibleForSearch];
}

- (NSDictionary)userInfo
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return (NSDictionary *)[(UAUserActivity *)v2 userInfo];
}

- (BOOL)isEligibleForPrediction
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return [(UAUserActivity *)v2 isEligibleForPrediction];
}

- (NSURL)webpageURL
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return (NSURL *)[(UAUserActivity *)v2 webpageURL];
}

void __86__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v4 = [[NSUserActivity alloc] initWithInternalUserActivity:a2];
    v7 = 0;
  }
  else
  {
    if (a3) {
      v5 = +[NSUserActivity _userFacingErrorForLaunchServicesError:a3 userInfo:0];
    }
    else {
      v5 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3328 userInfo:0];
    }
    v7 = v5;
    id v4 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, NSUserActivity *, NSError *))(v6 + 16))(v6, v4, v7);
  }
  getUAUserActivityClass();
  if (objc_opt_respondsToSelector()) {
    [getUAUserActivityClass() endUserActivityUIProgressForUUID:*(void *)(a1 + 32)];
  }
}

- (NSUserActivity)initWithInternalUserActivity:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSUserActivity;
  id v4 = [(NSUserActivity *)&v6 init];
  if (v4)
  {
    v4->_internal = a3;
    [(UAUserActivity *)[(NSUserActivity *)v4 _internalUserActivity] setDelegate:v4];
    [(UAUserActivity *)[(NSUserActivity *)v4 _internalUserActivity] setParentUserActivity:v4];
  }
  return v4;
}

- (NSUserActivity)initWithActivityType:(NSString *)activityType
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)NSUserActivity;
  id v4 = [(NSUserActivity *)&v7 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc((Class)getUAUserActivityClass()) initWithTypeIdentifier:activityType options:0];
    v4->_internal = (id)v5;
    if (v5)
    {
      [(UAUserActivity *)[(NSUserActivity *)v4 _internalUserActivity] setParentUserActivity:v4];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (NSString)activityType
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return (NSString *)[(UAUserActivity *)v2 typeIdentifier];
}

- (NSUserActivityPersistentIdentifier)persistentIdentifier
{
  [(NSUserActivity *)self _internalUserActivity];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return (NSUserActivityPersistentIdentifier)[(UAUserActivity *)v3 persistentIdentifier];
}

- (UAUserActivity)_internalUserActivity
{
  return (UAUserActivity *)objc_getProperty(self, a2, 8, 1);
}

+ (void)_fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4
{
  v7[6] = *MEMORY[0x1E4F143B8];
  getUAUserActivityClass();
  if (objc_opt_respondsToSelector()) {
    [getUAUserActivityClass() showUserActivityUIProgressForUUID:a3];
  }
  UAUserActivityClass = getUAUserActivityClass();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_completionHandler___block_invoke;
  v7[3] = &unk_1E51FB370;
  v7[4] = a3;
  v7[5] = a4;
  [UAUserActivityClass fetchUserActivityWithUUID:a3 completionHandler:v7];
}

+ (id)_currentUserActivityUUID
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (!_MergedGlobals_140) {
    return 0;
  }
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  UAUserActivityClass = getUAUserActivityClass();

  return (id)[UAUserActivityClass currentUserActivityUUID];
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_frameworkDelegate);

  objc_destroyWeak(&self->_delegate);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_delegate, 0);
  objc_storeWeak(&self->_frameworkDelegate, 0);
  [self->_internal invalidate];

  v3.receiver = self;
  v3.super_class = (Class)NSUserActivity;
  [(NSUserActivity *)&v3 dealloc];
}

- (void)setContentUserAction:(id)a3
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (_MergedGlobals_140)
  {
    uint64_t v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 setContentUserAction:a3];
  }
}

- (NSUserActivity)init
{
  return [(NSUserActivity *)self initWithActivityType:0];
}

- (BOOL)needsSave
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return [(UAUserActivity *)v2 needsSave];
}

- (NSURL)referrerURL
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return (NSURL *)[(UAUserActivity *)v2 referrerURL];
}

- (void)setReferrerURL:(NSURL *)referrerURL
{
  uint64_t v4 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v4 setReferrerURL:referrerURL];
}

- (id)contentType
{
  return 0;
}

- (id)contentAttributes
{
  return 0;
}

- (id)contentUserAction
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (!_MergedGlobals_140) {
    return 0;
  }
  objc_super v3 = [(NSUserActivity *)self _internalUserActivity];

  return (id)[(UAUserActivity *)v3 contentUserAction];
}

- (BOOL)supportsContinuationStreams
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return [(UAUserActivity *)v2 supportsContinuationStreams];
}

- (void)setSupportsContinuationStreams:(BOOL)supportsContinuationStreams
{
  BOOL v3 = supportsContinuationStreams;
  uint64_t v4 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v4 setSupportsContinuationStreams:v3];
}

- (void)invalidate
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v2 invalidate];
}

- (void)getContinuationStreamsWithCompletionHandler:(void *)completionHandler
{
  v5[5] = *MEMORY[0x1E4F143B8];
  if (completionHandler)
  {
    uint64_t v4 = [(NSUserActivity *)self _internalUserActivity];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__NSUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke;
    v5[3] = &unk_1E51FB348;
    v5[4] = completionHandler;
    [(UAUserActivity *)v4 getContinuationStreamsWithCompletionHandler:v5];
  }
}

uint64_t __62__NSUserActivity_getContinuationStreamsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  +[NSUserActivity _userFacingErrorForLaunchServicesError:a4 userInfo:0];
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

- (NSSet)requiredUserInfoKeys
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (!_MergedGlobals_140) {
    return 0;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return (NSSet *)[(UAUserActivity *)v3 requiredUserInfoKeys];
}

- (NSDate)expirationDate
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (!_MergedGlobals_140) {
    return 0;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return (NSDate *)[(UAUserActivity *)v3 expirationDate];
}

+ (void)deleteSavedUserActivitiesWithPersistentIdentifiers:(NSArray *)persistentIdentifiers completionHandler:(void *)handler
{
  if (getUAUserActivityClass() && (getUAUserActivityClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    UAUserActivityClass = getUAUserActivityClass();
    [UAUserActivityClass deleteSavedUserActivitiesWithPersistentIdentifiers:persistentIdentifiers completionHandler:handler];
  }
  else if (handler)
  {
    objc_super v7 = (void (*)(void *))*((void *)handler + 2);
    v7(handler);
  }
}

+ (void)deleteAllSavedUserActivitiesWithCompletionHandler:(void *)handler
{
  if (getUAUserActivityClass() && (getUAUserActivityClass(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    UAUserActivityClass = getUAUserActivityClass();
    [UAUserActivityClass deleteAllSavedUserActivitiesWithCompletionHandler:handler];
  }
  else if (handler)
  {
    uint64_t v5 = (void (*)(void *))*((void *)handler + 2);
    v5(handler);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  objc_super v7 = [(NSUserActivity *)self _uniqueIdentifier];
  uint64_t v8 = [a3 _uniqueIdentifier];

  return [(NSUUID *)v7 isEqual:v8];
}

- (unint64_t)hash
{
  v2 = [(NSUserActivity *)self _uniqueIdentifier];

  return [(NSUUID *)v2 hash];
}

- (NSString)targetContentIdentifier
{
  if (![(NSUserActivity *)self _internalUserActivity]) {
    return 0;
  }
  [(NSUserActivity *)self _internalUserActivity];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return (NSString *)[(UAUserActivity *)v3 targetContentIdentifier];
}

- (void)setTargetContentIdentifier:(NSString *)targetContentIdentifier
{
  if ([(NSUserActivity *)self _internalUserActivity])
  {
    [(NSUserActivity *)self _internalUserActivity];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = [(NSUserActivity *)self _internalUserActivity];
      [(UAUserActivity *)v5 setTargetContentIdentifier:targetContentIdentifier];
    }
  }
}

- (id)typeIdentifier
{
  if (typeIdentifier_sOnce != -1) {
    dispatch_once(&typeIdentifier_sOnce, &__block_literal_global_65);
  }

  return [(NSUserActivity *)self activityType];
}

void __32__NSUserActivity_typeIdentifier__block_invoke()
{
}

- (NSUserActivity)initWithTypeIdentifier:(id)a3
{
  if (initWithTypeIdentifier__sOnce != -1) {
    dispatch_once(&initWithTypeIdentifier__sOnce, &__block_literal_global_21);
  }

  return [(NSUserActivity *)self initWithActivityType:a3];
}

void __41__NSUserActivity_initWithTypeIdentifier___block_invoke()
{
}

- (id)webPageURL
{
  if (webPageURL_sOnce != -1) {
    dispatch_once(&webPageURL_sOnce, &__block_literal_global_26);
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return (id)[(UAUserActivity *)v3 webpageURL];
}

void __28__NSUserActivity_webPageURL__block_invoke()
{
}

- (void)setWebPageURL:(id)a3
{
  if (setWebPageURL__sOnce != -1) {
    dispatch_once(&setWebPageURL__sOnce, &__block_literal_global_31);
  }
  uint64_t v5 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v5 setWebpageURL:a3];
}

void __32__NSUserActivity_setWebPageURL___block_invoke()
{
}

- (void)didSynchronizeActivity
{
  BOOL v3 = [(NSUserActivity *)self _frameworkDelegate];
  id v4 = [(NSUserActivity *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(NSUserActivityDelegate *)v3 userActivityWasContinued:self];
  }
  if (objc_opt_respondsToSelector())
  {
    [v4 userActivityWasContinued:self];
  }
}

- (void)didReceiveInputStream:(id)a3 outputStream:(id)a4
{
  objc_super v7 = [(NSUserActivity *)self _frameworkDelegate];
  id v8 = [(NSUserActivity *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(NSUserActivityDelegate *)v7 userActivity:self didReceiveInputStream:a3 outputStream:a4];
  }
  if (objc_opt_respondsToSelector())
  {
    [v8 userActivity:self didReceiveInputStream:a3 outputStream:a4];
  }
}

- (NSString)_subtitle
{
  return 0;
}

- (NSString)_contentType
{
  return 0;
}

- (NSString)_contentIdentifier
{
  return 0;
}

- (NSDictionary)_contentAttributes
{
  return 0;
}

- (void)_addKeywordsFromArray:(id)a3
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  if (_MergedGlobals_140)
  {
    uint64_t v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 addKeywordsFromArray:a3];
  }
}

- (id)_parentUserActivity
{
  return 0;
}

+ (BOOL)_supportsUserActivityAppLinks
{
  if (qword_1EB1EDA70 != -1) {
    dispatch_once(&qword_1EB1EDA70, &__block_literal_global_311);
  }
  return _MergedGlobals_140;
}

- (id)_initWithUserActivityData:(id)a3
{
  uint64_t v4 = [objc_alloc((Class)getUAUserActivityClass()) initWithUserActivityData:a3 options:0];
  if (!v4
    || (uint64_t v5 = (void *)v4,
        self = [(NSUserActivity *)self initWithInternalUserActivity:v4],
        v5,
        !self))
  {
    [(NSUserActivity *)self dealloc];
    return 0;
  }
  return self;
}

- (id)_initWithUserActivityData:(id)a3 options:(id)a4
{
  uint64_t v5 = [objc_alloc((Class)getUAUserActivityClass()) initWithUserActivityData:a3 options:a4];
  if (!v5
    || (objc_super v6 = (void *)v5,
        self = [(NSUserActivity *)self initWithInternalUserActivity:v5],
        v6,
        !self))
  {
    [(NSUserActivity *)self dealloc];
    return 0;
  }
  return self;
}

- (id)_initWithUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5
{
  uint64_t v6 = [objc_alloc((Class)getUAUserActivityClass()) initWithUserActivityStrings:a3 optionalString:a4 tertiaryData:a5 options:0];
  if (!v6
    || (objc_super v7 = (void *)v6,
        self = [(NSUserActivity *)self initWithInternalUserActivity:v6],
        v7,
        !self))
  {
    [(NSUserActivity *)self dealloc];
    return 0;
  }
  return self;
}

- (id)_initWithUserActivityStrings:(id)a3 secondaryString:(id)a4 optionalData:(id)a5 options:(id)a6
{
  uint64_t v7 = [objc_alloc((Class)getUAUserActivityClass()) initWithUserActivityStrings:a3 optionalString:a4 tertiaryData:a5 options:a6];
  if (!v7
    || (id v8 = (void *)v7,
        self = [(NSUserActivity *)self initWithInternalUserActivity:v7],
        v8,
        !self))
  {
    [(NSUserActivity *)self dealloc];
    return 0;
  }
  return self;
}

- (BOOL)_createUserActivityDataWithOptions:(id)a3 completionHandler:(id)a4
{
  [(NSUserActivity *)self _internalUserActivity];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v7 = [(NSUserActivity *)self _internalUserActivity];

  return [(UAUserActivity *)v7 createUserActivityDataWithSaving:1 options:a3 completionHandler:a4];
}

- (void)_prepareUserActivityForLaunchingWithOptions:(id)a3 completionHandler:(id)a4
{
  [(NSUserActivity *)self _internalUserActivity];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v7 prepareUserActivityForLaunchingWithOptions:a3 completionHandler:a4];
  }
}

- (NSString)_teamIdentifier
{
  [(NSUserActivity *)self _internalUserActivity];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return (NSString *)[(UAUserActivity *)v3 teamID];
}

+ (BOOL)_currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4
{
  getUAUserActivityClass();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  UAUserActivityClass = getUAUserActivityClass();

  return [UAUserActivityClass currentUserActivityUUIDWithOptions:a3 completionHandler:a4];
}

- (id)_determineMatchingApplicationBundleIdentifierWithOptions:(id)a3
{
  [(NSUserActivity *)self _internalUserActivity];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(NSUserActivity *)self _internalUserActivity];

  return (id)[(UAUserActivity *)v5 determineMatchingApplicationBundleIdentfierWithOptions:a3];
}

+ (id)_fetchUserActivityWithUUID:(id)a3 intervalToWaitForDocumentSynchronizationToComplete:(double)a4 completionHandler:(id)a5
{
  v11[6] = *MEMORY[0x1E4F143B8];
  getUAUserActivityClass();
  if (objc_opt_respondsToSelector())
  {
    UAUserActivityClass = getUAUserActivityClass();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __137__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_intervalToWaitForDocumentSynchronizationToComplete_completionHandler___block_invoke;
    v11[3] = &unk_1E51FB370;
    v11[4] = a3;
    v11[5] = a5;
    return (id)[UAUserActivityClass fetchUserActivityWithUUID:a3 intervalToWaitForDocumentSynchronizationToComplete:v11 completionHandler:a4];
  }
  else
  {
    [a1 _fetchUserActivityWithUUID:a3 completionHandler:a5];
    return 0;
  }
}

void __137__NSUserActivity_NSUserActivityPrivate___fetchUserActivityWithUUID_intervalToWaitForDocumentSynchronizationToComplete_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = [[NSUserActivity alloc] initWithInternalUserActivity:a2];
    uint64_t v7 = 0;
  }
  else
  {
    if (a3) {
      uint64_t v5 = +[NSUserActivity _userFacingErrorForLaunchServicesError:a3 userInfo:0];
    }
    else {
      uint64_t v5 = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:3328 userInfo:0];
    }
    uint64_t v7 = v5;
    uint64_t v4 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, NSUserActivity *, NSError *))(v6 + 16))(v6, v4, v7);
  }
  getUAUserActivityClass();
  if (objc_opt_respondsToSelector()) {
    [getUAUserActivityClass() endUserActivityUIProgressForUUID:*(void *)(a1 + 32)];
  }
}

+ (void)_registerUserActivityType:(id)a3 dynamicActivityType:(id)a4
{
  getUAUserActivityClass();
  if (objc_opt_respondsToSelector())
  {
    UAUserActivityClass = getUAUserActivityClass();
    [UAUserActivityClass addDynamicUserActivity:a4 matching:a3];
  }
}

+ (void)_unregisterUserActivityType:(id)a3 dynamicActivityType:(id)a4
{
  getUAUserActivityClass();
  if (objc_opt_respondsToSelector())
  {
    UAUserActivityClass = getUAUserActivityClass();
    [UAUserActivityClass removeDynamicUserActivity:a4 matching:a3];
  }
}

- (id)_initWithTypeIdentifier:(id)a3 suggestedActionType:(int64_t)a4 options:(id)a5
{
  id v6 = (id)[objc_alloc((Class)getUAUserActivityClass()) initWithTypeIdentifier:a3 suggestedActionType:a4 options:a5];

  return [(NSUserActivity *)self initWithInternalUserActivity:v6];
}

- (id)_initWithUserActivityType:(id)a3 dynamicActivityType:(id)a4 options:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NSUserActivity;
  id v8 = [(NSUserActivity *)&v10 init];
  if (v8
    && [getUAUserActivityClass() instancesRespondToSelector:sel_initWithTypeIdentifier_dynamicIdentifier_options_])
  {
    v8->_internal = (id)[objc_alloc((Class)getUAUserActivityClass()) initWithTypeIdentifier:a3 dynamicIdentifier:a4 options:a5];
  }
  return v8;
}

- (NSDictionary)_frameworkPayload
{
  return 0;
}

- (NSDate)_lastActivityDate
{
  return 0;
}

- (NSDictionary)_options
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  return (NSDictionary *)[(UAUserActivity *)v2 options];
}

- (void)_setOptions:(id)a3
{
  uint64_t v4 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v4 setOptions:a3];
}

- (void)_resignCurrent
{
  v2 = [(NSUserActivity *)self _internalUserActivity];

  [(UAUserActivity *)v2 resignCurrent];
}

+ (id)_userFacingErrorForLaunchServicesError:(id)a3 userInfo:(id)a4
{
  if (!a3) {
    return a3;
  }
  id v6 = (void *)[a3 domain];
  uint64_t v7 = [a3 code];
  if (![v6 isEqual:getUAContinuityErrorDomain()])
  {
    if ([v6 isEqual:@"NSPOSIXErrorDomain"])
    {
      char v10 = v7 - 45;
      if ((unint64_t)(v7 - 45) <= 0x21)
      {
        if (((1 << v10) & 0x8060) != 0) {
          goto LABEL_19;
        }
        if (((1 << v10) & 0x200000001) != 0)
        {
          uint64_t v9 = 3328;
          if (@"NSCocoaErrorDomain") {
            goto LABEL_22;
          }
          return a3;
        }
      }
      if (v7 == 2)
      {
LABEL_19:
        uint64_t v9 = 4609;
        if (@"NSCocoaErrorDomain") {
          goto LABEL_22;
        }
        return a3;
      }
    }
    else if ([v6 isEqual:@"NSCocoaErrorDomain"])
    {
      return a3;
    }
    uint64_t v9 = 4608;
    if (@"NSCocoaErrorDomain") {
      goto LABEL_22;
    }
    return a3;
  }
  uint64_t v8 = 4608;
  if (v7 == -110) {
    uint64_t v8 = 4611;
  }
  if (v7 == -109) {
    uint64_t v9 = 4610;
  }
  else {
    uint64_t v9 = v8;
  }
  if (!@"NSCocoaErrorDomain") {
    return a3;
  }
LABEL_22:
  id v12 = (id)[a4 mutableCopy];
  if (v12 || (id v12 = (id)[MEMORY[0x1E4F1CA60] dictionary]) != 0) {
    [v12 setObject:a3 forKey:@"NSUnderlyingError"];
  }

  return +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:v9 userInfo:v12];
}

- (CSSearchableItemAttributeSet)contentAttributeSet
{
  [(NSUserActivity *)self _internalUserActivity];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  BOOL v3 = [(NSUserActivity *)self _internalUserActivity];

  return (CSSearchableItemAttributeSet *)[(UAUserActivity *)v3 contentAttributeSet];
}

- (void)setContentAttributeSet:(CSSearchableItemAttributeSet *)contentAttributeSet
{
  [(NSUserActivity *)self _internalUserActivity];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(NSUserActivity *)self _internalUserActivity];
    [(UAUserActivity *)v5 setContentAttributeSet:contentAttributeSet];
  }
}

@end