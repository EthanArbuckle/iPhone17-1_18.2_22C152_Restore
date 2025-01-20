@interface CRKCourseEnrollmentController
+ (CRKCourseEnrollmentController)sharedEnrollmentController;
+ (id)keyPathsForValuesAffectingSupportsRemoteLearning;
- (BOOL)canBrowseForInvitations;
- (BOOL)instructor:(id)a3 isForCourse:(id)a4;
- (BOOL)isCourseActive:(id)a3;
- (BOOL)isInstructorWithIdentifier:(id)a3 activeForCourse:(id)a4;
- (BOOL)isInstructorWithIdentifier:(id)a3 disconnectableForCourse:(id)a4;
- (BOOL)isInstructorWithIdentifier:(id)a3 observingStudentScreenForCourse:(id)a4;
- (BOOL)isSignedInToStudentMAID;
- (BOOL)isStudentScreenBeingObservedForCourse:(id)a3;
- (BOOL)supportsRemoteLearning;
- (BOOL)updateScreenObservingInstructors;
- (CATRemoteTaskOperation)fetchActiveInstructorsOperation;
- (CRKCourseEnrollmentController)init;
- (CRKCourseEnrollmentController)initWithStudentDaemonProxy:(id)a3;
- (CRKStudentDaemonProxy)studentDaemonProxy;
- (NSArray)courseInvitations;
- (NSArray)courses;
- (NSDictionary)observingInstructorIdentifiersByCourseIdentifiers;
- (NSHashTable)observers;
- (NSNumber)settingsUIVisible;
- (NSSet)acceptedInvitationIdentifiers;
- (NSSet)activeInstructors;
- (id)activeCourseIdentifiers;
- (id)activeCourses;
- (id)activeInstructorsWithIdentifier:(id)a3 forCourse:(id)a4;
- (id)anonymousInstructorUsersForCourse:(id)a3;
- (id)courseWithIdentifier:(id)a3;
- (id)coursesBySortingCourses:(id)a3;
- (id)instructorUsersForCourse:(id)a3;
- (id)invitationWithCourseIdentifier:(id)a3;
- (id)observersRespondingToSelector:(SEL)a3;
- (id)syntheticUserForAnonymousInstructor:(id)a3;
- (int64_t)iCloudAccountStatus;
- (unint64_t)configurationType;
- (void)addEnrollmentObserver:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applicationWillEnterForeground:(id)a3;
- (void)daemonProxy:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)daemonProxyDidConnect:(id)a3;
- (void)dealloc;
- (void)didUpdateActiveCourses;
- (void)didUpdateCourses;
- (void)didUpdateInvitations;
- (void)didUpdateSettingsUIVisibility;
- (void)disconnectInstructorWithIdentifier:(id)a3 forCourse:(id)a4;
- (void)disconnectOperationDidFinish:(id)a3;
- (void)fetchActiveInstructors;
- (void)fetchActiveInstructorsOperationDidFinish:(id)a3;
- (void)fetchConfiguration;
- (void)fetchConfigurationTypeOperationDidFinish:(id)a3;
- (void)fetchCourseInvitations;
- (void)fetchCourseInvitationsOperationDidFinish:(id)a3;
- (void)fetchCourses;
- (void)fetchCoursesOperationDidFinish:(id)a3;
- (void)fetchStoredCourses;
- (void)invitationWithIdentifierDidFail:(id)a3 withLocalizedReason:(id)a4;
- (void)notifyDaemonOfSettingsPaneActivationOperationDidFail:(id)a3;
- (void)setAcceptedInvitationIdentifiers:(id)a3;
- (void)setActiveInstructors:(id)a3;
- (void)setConfigurationType:(unint64_t)a3;
- (void)setCourseInvitations:(id)a3;
- (void)setCourses:(id)a3;
- (void)setFetchActiveInstructorsOperation:(id)a3;
- (void)setObservers:(id)a3;
- (void)setObservingInstructorIdentifiersByCourseIdentifiers:(id)a3;
- (void)setSettingsUIVisible:(id)a3;
- (void)setSignedInToStudentMAID:(BOOL)a3;
- (void)startBrowsingForInvitations;
- (void)startLongRunningOperations;
- (void)stopBrowsingForInvitations;
- (void)stopLongRunningOperations;
- (void)storeCourses;
- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)updateInvitationBrowsingStatus;
- (void)updateSettingsUIVisibility;
- (void)userDidActivateSettingsPane;
@end

@implementation CRKCourseEnrollmentController

+ (CRKCourseEnrollmentController)sharedEnrollmentController
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, a1, @"CRKCourseEnrollmentController.m", 60, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  WeakRetained = objc_loadWeakRetained(&sSharedController);
  if (!WeakRetained)
  {
    WeakRetained = objc_opt_new();
    objc_storeWeak(&sSharedController, WeakRetained);
  }

  return (CRKCourseEnrollmentController *)WeakRetained;
}

- (CRKCourseEnrollmentController)init
{
  v3 = objc_opt_new();
  v4 = [(CRKCourseEnrollmentController *)self initWithStudentDaemonProxy:v3];

  return v4;
}

- (CRKCourseEnrollmentController)initWithStudentDaemonProxy:(id)a3
{
  v23[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"CRKCourseEnrollmentController.m", 77, @"Invalid parameter not satisfying: %@", @"daemonProxy" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)CRKCourseEnrollmentController;
  v7 = [(CRKCourseEnrollmentController *)&v22 init];
  if (v7)
  {
    v8 = [CRKSecureCodedUserDefaultsObject alloc];
    v9 = (void *)MEMORY[0x263EFFA08];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    v23[4] = objc_opt_class();
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:5];
    v11 = [v9 setWithArray:v10];
    uint64_t v12 = [(CRKSecureCodedUserDefaultsObject *)v8 initWithKey:@"ClassroomSettingsStoreCoursesKey" classes:v11];
    mStoredCourses = v7->mStoredCourses;
    v7->mStoredCourses = (CRKSecureCodedUserDefaultsObject *)v12;

    uint64_t v14 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    objc_storeStrong((id *)&v7->_studentDaemonProxy, a3);
    uint64_t v16 = objc_opt_new();
    activeInstructors = v7->_activeInstructors;
    v7->_activeInstructors = (NSSet *)v16;

    v7->_iCloudAccountStatus = 0;
    [v6 addObserver:v7];
    if ([v6 isConnected]) {
      [(CRKCourseEnrollmentController *)v7 daemonProxyDidConnect:v6];
    }
    else {
      [v6 connect];
    }
    [(CRKCourseEnrollmentController *)v7 fetchStoredCourses];
    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v7 selector:sel_applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v7 selector:sel_applicationDidEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  [(CRKCourseEnrollmentController *)self daemonProxyDidDisconnect:v3];

  v4.receiver = self;
  v4.super_class = (Class)CRKCourseEnrollmentController;
  [(CRKCourseEnrollmentController *)&v4 dealloc];
}

- (void)addEnrollmentObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKCourseEnrollmentController *)self observers];
  [v5 addObject:v4];
}

- (id)courseWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(CRKCourseEnrollmentController *)self courses];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [v9 courseIdentifier];
          char v11 = [v10 isEqual:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)invitationWithCourseIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(CRKCourseEnrollmentController *)self courseInvitations];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [v9 courseIdentifier];
          char v11 = [v10 isEqual:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)instructorUsersForCourse:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  id v6 = [v5 instructorsByIdentifier];
  uint64_t v7 = [v6 allValues];
  v8 = objc_msgSend(v4, "crk_setByCopyingObjectsFromArray:", v7);

  v9 = [(CRKCourseEnrollmentController *)self anonymousInstructorUsersForCourse:v5];

  v10 = [v8 setByAddingObjectsFromSet:v9];

  return v10;
}

- (BOOL)isCourseActive:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKCourseEnrollmentController *)self activeInstructors];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__CRKCourseEnrollmentController_isCourseActive___block_invoke;
  v8[3] = &unk_2646F4198;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(v4) = objc_msgSend(v5, "crk_containsObjectMatchingPredicate:", v8);

  return (char)v4;
}

uint64_t __48__CRKCourseEnrollmentController_isCourseActive___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) instructor:a2 isForCourse:*(void *)(a1 + 40)];
}

- (BOOL)isStudentScreenBeingObservedForCourse:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKCourseEnrollmentController *)self activeInstructors];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__CRKCourseEnrollmentController_isStudentScreenBeingObservedForCourse___block_invoke;
  v8[3] = &unk_2646F4198;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(v4) = objc_msgSend(v5, "crk_containsObjectMatchingPredicate:", v8);

  return (char)v4;
}

uint64_t __71__CRKCourseEnrollmentController_isStudentScreenBeingObservedForCourse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isObservingStudentScreen]) {
    uint64_t v4 = [*(id *)(a1 + 32) instructor:v3 isForCourse:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isInstructorWithIdentifier:(id)a3 disconnectableForCourse:(id)a4
{
  uint64_t v4 = [(CRKCourseEnrollmentController *)self activeInstructorsWithIdentifier:a3 forCourse:a4];
  char v5 = objc_msgSend(v4, "crk_containsObjectMatchingPredicate:", &__block_literal_global_34);

  return v5;
}

uint64_t __84__CRKCourseEnrollmentController_isInstructorWithIdentifier_disconnectableForCourse___block_invoke(uint64_t a1, void *a2)
{
  return [a2 allowsStudentInitiatedDisconnection];
}

- (BOOL)isInstructorWithIdentifier:(id)a3 activeForCourse:(id)a4
{
  uint64_t v4 = [(CRKCourseEnrollmentController *)self activeInstructorsWithIdentifier:a3 forCourse:a4];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)isInstructorWithIdentifier:(id)a3 observingStudentScreenForCourse:(id)a4
{
  uint64_t v4 = [(CRKCourseEnrollmentController *)self activeInstructorsWithIdentifier:a3 forCourse:a4];
  char v5 = objc_msgSend(v4, "crk_containsObjectMatchingPredicate:", &__block_literal_global_38);

  return v5;
}

uint64_t __92__CRKCourseEnrollmentController_isInstructorWithIdentifier_observingStudentScreenForCourse___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isObservingStudentScreen];
}

- (void)disconnectInstructorWithIdentifier:(id)a3 forCourse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = (id)objc_opt_new();
  [v11 setInstructorIdentifier:v7];

  v8 = [v6 courseIdentifier];

  [v11 setCourseIdentifier:v8];
  id v9 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  v10 = [v9 enqueuedOperationForRequest:v11];

  [v10 addTarget:self selector:sel_disconnectOperationDidFinish_ forOperationEvents:6];
}

- (void)disconnectOperationDidFinish:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 request];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = [NSString stringWithUTF8String:"-[CRKCourseEnrollmentController disconnectOperationDidFinish:]"];
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    [v7 handleFailureInFunction:v8, @"CRKCourseEnrollmentController.m", 201, @"expected %@, got %@", v10, v12 file lineNumber description];
  }
  char v5 = [v3 error];

  if (v5)
  {
    id v6 = _CRKLogSettings();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CRKCourseEnrollmentController disconnectOperationDidFinish:](v4, v6);
    }
  }
}

+ (id)keyPathsForValuesAffectingSupportsRemoteLearning
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"configurationType"];
}

- (BOOL)supportsRemoteLearning
{
  return [(CRKCourseEnrollmentController *)self configurationType] == 4;
}

- (void)userDidActivateSettingsPane
{
  id v3 = _CRKLogGeneral_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "User did activate Settings pane", v7, 2u);
  }

  uint64_t v4 = objc_opt_new();
  char v5 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  id v6 = [v5 enqueuedOperationForRequest:v4];

  [v6 addTarget:self selector:sel_notifyDaemonOfSettingsPaneActivationOperationDidFail_ forOperationEvents:4];
}

- (void)notifyDaemonOfSettingsPaneActivationOperationDidFail:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _CRKLogGeneral_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[CRKCourseEnrollmentController notifyDaemonOfSettingsPaneActivationOperationDidFail:](v3);
  }
}

- (void)daemonProxyDidConnect:(id)a3
{
  [(CRKCourseEnrollmentController *)self fetchCourses];
  [(CRKCourseEnrollmentController *)self fetchCourseInvitations];
  [(CRKCourseEnrollmentController *)self fetchActiveInstructors];

  [(CRKCourseEnrollmentController *)self startLongRunningOperations];
}

- (void)daemonProxy:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v8 = a4;
  id v6 = [NSString stringWithUTF8String:"com.apple.studentd.configuration.didchange"];
  int v7 = [v8 isEqualToString:v6];

  if (v7)
  {
    [(CRKCourseEnrollmentController *)self fetchConfiguration];
    [(CRKCourseEnrollmentController *)self fetchCourses];
  }
  else if ([v8 isEqualToString:@"CRKActiveInstructorsDidChange"])
  {
    [(CRKCourseEnrollmentController *)self fetchActiveInstructors];
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  uint64_t v4 = _CRKLogSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Connecting to studentd because Settings will enter the foreground", v6, 2u);
  }

  char v5 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  [v5 connect];
}

- (void)applicationDidEnterBackground:(id)a3
{
  uint64_t v4 = _CRKLogSettings();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "Disconnecting from studentd because Settings entered the background", v6, 2u);
  }

  char v5 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  [v5 disconnect];
}

- (void)startLongRunningOperations
{
  [(CRKCourseEnrollmentController *)self stopLongRunningOperations];

  [(CRKCourseEnrollmentController *)self fetchConfiguration];
}

- (void)stopLongRunningOperations
{
  self->mConfigurationFetched = 0;
}

- (void)updateInvitationBrowsingStatus
{
  if ([(CRKCourseEnrollmentController *)self canBrowseForInvitations])
  {
    if (!self->mBrowseOperation)
    {
      [(CRKCourseEnrollmentController *)self startBrowsingForInvitations];
    }
  }
  else
  {
    [(CRKCourseEnrollmentController *)self stopBrowsingForInvitations];
  }
}

- (BOOL)canBrowseForInvitations
{
  id v3 = +[CRKSystemInfo sharedSystemInfo];
  char v4 = [v3 isEphemeralMultiUser];

  if (v4) {
    return 0;
  }
  unint64_t v5 = [(CRKCourseEnrollmentController *)self configurationType];
  if (!self->mConfigurationFetched) {
    return 0;
  }
  BOOL v6 = (v5 >> 1) & 1;
  return ![(CRKCourseEnrollmentController *)self configurationType] || v6;
}

- (void)startBrowsingForInvitations
{
  [(CRKCourseEnrollmentController *)self stopBrowsingForInvitations];
  id v3 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  char v4 = objc_opt_new();
  unint64_t v5 = [v3 enqueuedOperationForRequest:v4];
  mBrowseOperation = self->mBrowseOperation;
  self->mBrowseOperation = v5;

  int v7 = self->mBrowseOperation;

  [(CATRemoteTaskOperation *)v7 setNotificationDelegate:self];
}

- (void)stopBrowsingForInvitations
{
  [(CATRemoteTaskOperation *)self->mBrowseOperation cancel];
  [(CATRemoteTaskOperation *)self->mBrowseOperation setNotificationDelegate:0];
  mBrowseOperation = self->mBrowseOperation;
  self->mBrowseOperation = 0;
}

- (void)fetchConfiguration
{
  id v5 = (id)objc_opt_new();
  id v3 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  char v4 = [v3 enqueuedOperationForRequest:v5];

  [v4 addTarget:self selector:sel_fetchConfigurationTypeOperationDidFinish_ forOperationEvents:6];
}

- (void)fetchConfigurationTypeOperationDidFinish:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"CRKCourseEnrollmentController.m", 314, @"Invalid parameter not satisfying: %@", @"fetchConfigurationTypeOperation" object file lineNumber description];
  }
  BOOL v6 = [v5 error];

  if (v6)
  {
    int v7 = _CRKLogSettings();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CRKCourseEnrollmentController fetchConfigurationTypeOperationDidFinish:](v5);
    }
  }
  else
  {
    id v8 = [v5 resultObject];
    -[CRKCourseEnrollmentController setConfigurationType:](self, "setConfigurationType:", [v8 configurationType]);
    -[CRKCourseEnrollmentController setSignedInToStudentMAID:](self, "setSignedInToStudentMAID:", [v8 isSignedInToStudentMAID]);
    self->mConfigurationFetched = 1;
    [(CRKCourseEnrollmentController *)self updateInvitationBrowsingStatus];
    [(CRKCourseEnrollmentController *)self updateSettingsUIVisibility];
  }
}

- (void)fetchCourses
{
  id v3 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  char v4 = objc_opt_new();
  id v5 = [v3 enqueuedOperationForRequest:v4];

  [v5 addTarget:self selector:sel_fetchCoursesOperationDidFinish_ forOperationEvents:6];
}

- (void)fetchCoursesOperationDidFinish:(id)a3
{
  id v8 = [a3 resultObject];
  char v4 = [v8 courses];
  id v5 = [(CRKCourseEnrollmentController *)self coursesBySortingCourses:v4];
  uint64_t v6 = [(CRKCourseEnrollmentController *)self activeCourseIdentifiers];
  [(CRKCourseEnrollmentController *)self setCourses:v5];
  uint64_t v7 = [(CRKCourseEnrollmentController *)self activeCourseIdentifiers];
  [(CRKCourseEnrollmentController *)self didUpdateCourses];
  if (v6 | v7 && ([(id)v6 isEqual:v7] & 1) == 0) {
    [(CRKCourseEnrollmentController *)self didUpdateActiveCourses];
  }
  [(CRKCourseEnrollmentController *)self updateSettingsUIVisibility];
}

- (void)setCourses:(id)a3
{
  objc_storeStrong((id *)&self->_courses, a3);

  [(CRKCourseEnrollmentController *)self storeCourses];
}

- (void)fetchStoredCourses
{
  self->_courses = [(CRKSecureCodedUserDefaultsObject *)self->mStoredCourses value];

  MEMORY[0x270F9A758]();
}

- (void)storeCourses
{
  id v4 = [(CRKCourseEnrollmentController *)self courses];
  if ([v4 count]) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }
  [(CRKSecureCodedUserDefaultsObject *)self->mStoredCourses setValue:v3];
}

- (void)fetchCourseInvitations
{
  id v3 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  id v4 = objc_opt_new();
  id v5 = [v3 enqueuedOperationForRequest:v4];

  [v5 addTarget:self selector:sel_fetchCourseInvitationsOperationDidFinish_ forOperationEvents:6];
}

- (void)fetchCourseInvitationsOperationDidFinish:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 resultObject];
  id v5 = [v4 courseInvitations];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"courseName" ascending:1 selector:sel_localizedStandardCompare_];
  v10[0] = v7;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v6 sortUsingDescriptors:v8];

  [(CRKCourseEnrollmentController *)self setCourseInvitations:v6];
  id v9 = [v4 acceptedInvitationIdentifiers];
  [(CRKCourseEnrollmentController *)self setAcceptedInvitationIdentifiers:v9];

  [(CRKCourseEnrollmentController *)self didUpdateInvitations];
  [(CRKCourseEnrollmentController *)self updateSettingsUIVisibility];
}

- (void)fetchActiveInstructors
{
  id v3 = [(CRKCourseEnrollmentController *)self fetchActiveInstructorsOperation];
  [v3 cancel];

  id v4 = [(CRKCourseEnrollmentController *)self studentDaemonProxy];
  id v5 = objc_opt_new();
  uint64_t v6 = [v4 enqueuedOperationForRequest:v5];
  [(CRKCourseEnrollmentController *)self setFetchActiveInstructorsOperation:v6];

  id v7 = [(CRKCourseEnrollmentController *)self fetchActiveInstructorsOperation];
  [v7 addTarget:self selector:sel_fetchActiveInstructorsOperationDidFinish_ forOperationEvents:6];
}

- (void)fetchActiveInstructorsOperationDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKCourseEnrollmentController *)self fetchActiveInstructorsOperation];

  if (v5 == v4)
  {
    [(CRKCourseEnrollmentController *)self setFetchActiveInstructorsOperation:0];
    uint64_t v6 = [v4 error];
    if (v6)
    {
      id v7 = _CRKLogGeneral_2();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CRKCourseEnrollmentController fetchActiveInstructorsOperationDidFinish:]((uint64_t)v6, v7);
      }
    }
    else
    {
      id v8 = [v4 resultObject];
      id v9 = (void *)MEMORY[0x263EFFA08];
      v10 = [v8 instructors];
      uint64_t v11 = [v9 setWithArray:v10];

      uint64_t v12 = [(CRKCourseEnrollmentController *)self activeInstructors];
      if (v12 | v11)
      {
        long long v13 = (void *)v12;
        long long v14 = [(CRKCourseEnrollmentController *)self activeInstructors];
        char v15 = [v14 isEqual:v11];

        if ((v15 & 1) == 0)
        {
          [(CRKCourseEnrollmentController *)self willChangeValueForKey:@"activeInstructors"];
          long long v16 = [(CRKCourseEnrollmentController *)self activeCourseIdentifiers];
          objc_storeStrong((id *)&self->_activeInstructors, (id)v11);
          v17 = [(CRKCourseEnrollmentController *)self activeCourseIdentifiers];
          BOOL v18 = [(CRKCourseEnrollmentController *)self updateScreenObservingInstructors];
          [(CRKCourseEnrollmentController *)self didChangeValueForKey:@"activeInstructors"];
          if (v16 != v17)
          {
            v19 = [(CRKCourseEnrollmentController *)self courses];
            v20 = [(CRKCourseEnrollmentController *)self coursesBySortingCourses:v19];
            [(CRKCourseEnrollmentController *)self setCourses:v20];

            [(CRKCourseEnrollmentController *)self didUpdateActiveCourses];
          }
          if (v18) {
            [(CRKCourseEnrollmentController *)self didUpdateCourses];
          }
        }
      }
    }
  }
}

- (BOOL)updateScreenObservingInstructors
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v27 = self;
  id v4 = [(CRKCourseEnrollmentController *)self activeInstructors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v9 isObservingStudentScreen])
        {
          v10 = [v9 sessionIdentifier];
          uint64_t v11 = [v10 groupIdentifier];
          uint64_t v12 = [v11 stringValue];

          long long v13 = [v3 objectForKeyedSubscript:v12];
          if (!v13)
          {
            long long v13 = objc_opt_new();
            [v3 setObject:v13 forKeyedSubscript:v12];
          }
          long long v14 = [v9 userIdentifier];
          [v13 addObject:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v6);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  char v15 = [v3 allValues];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * j) sortUsingSelector:sel_compare_];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v17);
  }

  uint64_t v20 = [v3 copy];
  uint64_t v21 = [(CRKCourseEnrollmentController *)v27 observingInstructorIdentifiersByCourseIdentifiers];
  if (v21 | v20
    && (objc_super v22 = (void *)v21,
        -[CRKCourseEnrollmentController observingInstructorIdentifiersByCourseIdentifiers](v27, "observingInstructorIdentifiersByCourseIdentifiers"), v23 = objc_claimAutoreleasedReturnValue(), char v24 = [v23 isEqual:v20], v23, v22, (v24 & 1) == 0))
  {
    [(CRKCourseEnrollmentController *)v27 setObservingInstructorIdentifiersByCourseIdentifiers:v20];
    BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (id)coursesBySortingCourses:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__CRKCourseEnrollmentController_coursesBySortingCourses___block_invoke;
  v5[3] = &unk_2646F41E0;
  v5[4] = self;
  id v3 = [a3 sortedArrayUsingComparator:v5];

  return v3;
}

uint64_t __57__CRKCourseEnrollmentController_coursesBySortingCourses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [*(id *)(a1 + 32) isCourseActive:v5];
  int v8 = [*(id *)(a1 + 32) isCourseActive:v6];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    uint64_t v12 = -1;
  }
  else if ((v8 ^ 1 | v7) == 1)
  {
    v10 = [v5 courseName];
    uint64_t v11 = [v6 courseName];
    uint64_t v12 = [v10 localizedStandardCompare:v11];
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

- (id)activeCourses
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(CRKCourseEnrollmentController *)self courses];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__CRKCourseEnrollmentController_activeCourses__block_invoke;
  v8[3] = &unk_2646F4208;
  v8[4] = self;
  id v5 = objc_msgSend(v4, "crk_filterUsingBlock:", v8);
  id v6 = [v3 setWithArray:v5];

  return v6;
}

uint64_t __46__CRKCourseEnrollmentController_activeCourses__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isCourseActive:a2];
}

- (id)activeCourseIdentifiers
{
  v2 = [(CRKCourseEnrollmentController *)self activeCourses];
  id v3 = objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_87);

  return v3;
}

uint64_t __56__CRKCourseEnrollmentController_activeCourseIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 courseIdentifier];
}

- (id)activeInstructorsWithIdentifier:(id)a3 forCourse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(CRKCourseEnrollmentController *)self activeInstructors];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __75__CRKCourseEnrollmentController_activeInstructorsWithIdentifier_forCourse___block_invoke;
  v13[3] = &unk_2646F4250;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  uint64_t v11 = objc_msgSend(v8, "crk_filterUsingBlock:", v13);

  return v11;
}

uint64_t __75__CRKCourseEnrollmentController_activeInstructorsWithIdentifier_forCourse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  LODWORD(v3) = [v3 instructor:v5 isForCourse:v4];
  id v6 = [v5 userIdentifier];

  LODWORD(v2) = [v6 isEqual:*(void *)(v2 + 48)];
  return v3 & v2;
}

- (BOOL)instructor:(id)a3 isForCourse:(id)a4
{
  id v5 = a4;
  id v6 = [a3 sessionIdentifier];
  id v7 = [v6 groupIdentifier];
  int v8 = [v5 courseIdentifier];

  LOBYTE(v5) = [v7 isEqual:v8];
  return (char)v5;
}

- (id)anonymousInstructorUsersForCourse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = [v4 instructorsByIdentifier];
  id v7 = [v6 allKeys];
  int v8 = [v5 setWithArray:v7];

  id v9 = [(CRKCourseEnrollmentController *)self activeInstructors];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__CRKCourseEnrollmentController_anonymousInstructorUsersForCourse___block_invoke;
  v14[3] = &unk_2646F4278;
  id v15 = v4;
  id v16 = v8;
  uint64_t v17 = self;
  id v10 = v8;
  id v11 = v4;
  uint64_t v12 = objc_msgSend(v9, "crk_mapUsingBlock:", v14);

  return v12;
}

id __67__CRKCourseEnrollmentController_anonymousInstructorUsersForCourse___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) courseIdentifier];
  if (!v6)
  {
    uint64_t v2 = [v5 sessionIdentifier];
    uint64_t v7 = [v2 groupIdentifier];
    if (!v7)
    {

      goto LABEL_10;
    }
    id v3 = (void *)v7;
  }
  int v8 = [*(id *)(a1 + 32) courseIdentifier];
  id v9 = [v5 sessionIdentifier];
  id v10 = [v9 groupIdentifier];
  int v11 = [v8 isEqual:v10];

  if (v6)
  {

    if (!v11) {
      goto LABEL_11;
    }
  }
  else
  {

    if ((v11 & 1) == 0) {
      goto LABEL_11;
    }
  }
LABEL_10:
  uint64_t v12 = *(void **)(a1 + 40);
  long long v13 = [v5 userIdentifier];
  LOBYTE(v12) = [v12 containsObject:v13];

  if (v12)
  {
LABEL_11:
    id v14 = 0;
    goto LABEL_13;
  }
  id v14 = [*(id *)(a1 + 48) syntheticUserForAnonymousInstructor:v5];
LABEL_13:

  return v14;
}

- (id)syntheticUserForAnonymousInstructor:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [v3 userIdentifier];
  [v4 setUserIdentifier:v5];

  id v6 = [v3 displayName];

  [v4 setDisplayName:v6];
  [v4 setRole:2];

  return v4;
}

- (void)updateSettingsUIVisibility
{
  id v3 = [(CRKCourseEnrollmentController *)self courses];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(CRKCourseEnrollmentController *)self courseInvitations];
    if ([v5 count]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(CRKCourseEnrollmentController *)self isSignedInToStudentMAID];
    }
  }
  uint64_t v6 = [(CRKCourseEnrollmentController *)self settingsUIVisible];
  if (!v6
    || (uint64_t v7 = (void *)v6,
        [(CRKCourseEnrollmentController *)self settingsUIVisible],
        int v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 BOOLValue],
        v8,
        v7,
        v4 != v9))
  {
    id v10 = [NSNumber numberWithBool:v4];
    [(CRKCourseEnrollmentController *)self setSettingsUIVisible:v10];

    [(CRKCourseEnrollmentController *)self didUpdateSettingsUIVisibility];
  }
}

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  if ([v10 isEqualToString:@"CRKCourseInvitationsUpdatedNotification"])
  {
    [(CRKCourseEnrollmentController *)self fetchCourseInvitations];
  }
  else if ([v10 isEqualToString:@"CRKCourseInvitationDidFailNotification"])
  {
    int v8 = [v7 objectForKeyedSubscript:@"Course"];
    int v9 = [v7 objectForKeyedSubscript:@"Reason"];
    [(CRKCourseEnrollmentController *)self invitationWithIdentifierDidFail:v8 withLocalizedReason:v9];
  }
}

- (id)observersRespondingToSelector:(SEL)a3
{
  BOOL v4 = [(CRKCourseEnrollmentController *)self observers];
  id v5 = [v4 allObjects];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__CRKCourseEnrollmentController_observersRespondingToSelector___block_invoke;
  v8[3] = &__block_descriptor_40_e57_B16__0__NSObject_CRKCourseEnrollmentControllerObserver__8l;
  v8[4] = a3;
  uint64_t v6 = objc_msgSend(v5, "crk_filterUsingBlock:", v8);

  return v6;
}

uint64_t __63__CRKCourseEnrollmentController_observersRespondingToSelector___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)didUpdateSettingsUIVisibility
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(CRKCourseEnrollmentController *)self observersRespondingToSelector:sel_enrollmentControllerDidUpdateSettingsUIVisibility_];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) enrollmentControllerDidUpdateSettingsUIVisibility:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)didUpdateCourses
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(CRKCourseEnrollmentController *)self observersRespondingToSelector:sel_enrollmentControllerDidUpdateCourses_];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) enrollmentControllerDidUpdateCourses:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)didUpdateActiveCourses
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(CRKCourseEnrollmentController *)self observersRespondingToSelector:sel_enrollmentControllerDidUpdateActiveCourses_];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) enrollmentControllerDidUpdateActiveCourses:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)didUpdateInvitations
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = [(CRKCourseEnrollmentController *)self observersRespondingToSelector:sel_enrollmentControllerDidUpdateInvitations_];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) enrollmentControllerDidUpdateInvitations:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)invitationWithIdentifierDidFail:(id)a3 withLocalizedReason:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(CRKCourseEnrollmentController *)self observersRespondingToSelector:sel_enrollmentController_invitationWithIdentifierDidFail_localizedReason_];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) enrollmentController:self invitationWithIdentifierDidFail:v6 localizedReason:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (unint64_t)configurationType
{
  return self->_configurationType;
}

- (void)setConfigurationType:(unint64_t)a3
{
  self->_configurationType = a3;
}

- (NSNumber)settingsUIVisible
{
  return self->_settingsUIVisible;
}

- (void)setSettingsUIVisible:(id)a3
{
}

- (CRKStudentDaemonProxy)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (int64_t)iCloudAccountStatus
{
  return self->_iCloudAccountStatus;
}

- (NSArray)courses
{
  return self->_courses;
}

- (NSArray)courseInvitations
{
  return self->_courseInvitations;
}

- (void)setCourseInvitations:(id)a3
{
}

- (NSSet)acceptedInvitationIdentifiers
{
  return self->_acceptedInvitationIdentifiers;
}

- (void)setAcceptedInvitationIdentifiers:(id)a3
{
}

- (NSDictionary)observingInstructorIdentifiersByCourseIdentifiers
{
  return self->_observingInstructorIdentifiersByCourseIdentifiers;
}

- (void)setObservingInstructorIdentifiersByCourseIdentifiers:(id)a3
{
}

- (CATRemoteTaskOperation)fetchActiveInstructorsOperation
{
  return self->_fetchActiveInstructorsOperation;
}

- (void)setFetchActiveInstructorsOperation:(id)a3
{
}

- (NSSet)activeInstructors
{
  return self->_activeInstructors;
}

- (void)setActiveInstructors:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)isSignedInToStudentMAID
{
  return self->_signedInToStudentMAID;
}

- (void)setSignedInToStudentMAID:(BOOL)a3
{
  self->_signedInToStudentMAID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeInstructors, 0);
  objc_storeStrong((id *)&self->_fetchActiveInstructorsOperation, 0);
  objc_storeStrong((id *)&self->_observingInstructorIdentifiersByCourseIdentifiers, 0);
  objc_storeStrong((id *)&self->_acceptedInvitationIdentifiers, 0);
  objc_storeStrong((id *)&self->_courseInvitations, 0);
  objc_storeStrong((id *)&self->_courses, 0);
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
  objc_storeStrong((id *)&self->_settingsUIVisible, 0);
  objc_storeStrong((id *)&self->mStoredCourses, 0);

  objc_storeStrong((id *)&self->mBrowseOperation, 0);
}

- (void)disconnectOperationDidFinish:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 instructorIdentifier];
  uint64_t v5 = [a1 courseIdentifier];
  id v6 = [v5 stringValue];
  int v7 = 138543618;
  long long v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Failed to disconnect from instructor: %{public}@ course: %{public}@", (uint8_t *)&v7, 0x16u);
}

- (void)notifyDaemonOfSettingsPaneActivationOperationDidFail:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 error];
  uint64_t v2 = [v1 verboseDescription];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v3, v4, "Failed to notify daemon ot Settings pane activation: %{public}@", v5, v6, v7, v8, 2u);
}

- (void)fetchConfigurationTypeOperationDidFinish:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_0_1(&dword_224C00000, v2, v3, "Failed to fetch student configuration type: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)fetchActiveInstructorsOperationDidFinish:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch active instructors: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end