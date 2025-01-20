@interface CLSClassKitSettingsController
- (BOOL)fetchAllActivities;
- (CLSClassKitSettingsController)init;
- (CLSCurrentUser)cachedCurrentUser;
- (NSMutableArray)userProgressActivities;
- (NSMutableDictionary)objectIDToAssignedItemMap;
- (NSMutableDictionary)objectIDToAttachmentMap;
- (NSMutableDictionary)objectIDToContextMap;
- (PSSpecifier)allowBrowseToggleSpecifier;
- (id)activeClassKitAppleIDWithSpecifier:(id)a3;
- (id)allowBrowseSync:(id)a3;
- (id)appleIDSpecifier;
- (id)bundleIdentifierForAttachment:(id)a3;
- (id)createStudentSpecifiers;
- (id)createTeacherSpecifiers;
- (id)descriptionForAttachment:(id)a3;
- (id)fileTypeDescriptionForAsset:(id)a3;
- (id)specifierWithContextActivity:(id)a3;
- (id)specifierWithHandoutAssignedItemActivity:(id)a3;
- (id)specifierWithProgressActivity:(id)a3;
- (id)specifiers;
- (void)loadUserProgressActivities;
- (void)setAllowBrowseSync:(id)a3 specifier:(id)a4;
- (void)setAllowBrowseToggleSpecifier:(id)a3;
- (void)setCachedCurrentUser:(id)a3;
- (void)setFetchAllActivities:(BOOL)a3;
- (void)setObjectIDToAssignedItemMap:(id)a3;
- (void)setObjectIDToAttachmentMap:(id)a3;
- (void)setObjectIDToContextMap:(id)a3;
- (void)setUserProgressActivities:(id)a3;
- (void)showMoreTapped:(id)a3;
- (void)showProgressPrivacyInfo:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CLSClassKitSettingsController

- (CLSClassKitSettingsController)init
{
  v12.receiver = self;
  v12.super_class = (Class)CLSClassKitSettingsController;
  v2 = [(CLSClassKitSettingsController *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    userProgressActivities = v2->_userProgressActivities;
    v2->_userProgressActivities = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objectIDToContextMap = v2->_objectIDToContextMap;
    v2->_objectIDToContextMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objectIDToAttachmentMap = v2->_objectIDToAttachmentMap;
    v2->_objectIDToAttachmentMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objectIDToAssignedItemMap = v2->_objectIDToAssignedItemMap;
    v2->_objectIDToAssignedItemMap = v9;
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLSClassKitSettingsController;
  [(CLSClassKitSettingsController *)&v10 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.ClassKit"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  v6 = +[NSLocale currentLocale];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 bundleURL];
  id v9 = [v5 initWithKey:@"Class Progress" table:0 locale:v6 bundleURL:v8];

  [(CLSClassKitSettingsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.application-icon.classkit" title:v9 localizedNavigationComponents:&__NSArray0__struct deepLink:v4];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, &stru_C3E8);
    objc_initWeak(&location, self);
    v6 = +[CLSDataStore shared];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_4698;
    v17[3] = &unk_C410;
    objc_copyWeak(&v19, &location);
    id v7 = v5;
    id v18 = v7;
    [v6 currentUserWithCompletion:v17];

    dispatch_time_t v8 = dispatch_time(0, 100000000);
    dispatch_block_wait(v7, v8);
    id v9 = [(CLSClassKitSettingsController *)self cachedCurrentUser];

    if (v9)
    {
      objc_super v10 = [(CLSClassKitSettingsController *)self cachedCurrentUser];
      unsigned int v11 = [v10 isInstructor];

      if (v11)
      {
        objc_super v12 = [(CLSClassKitSettingsController *)self createTeacherSpecifiers];
      }
      else
      {
        v13 = [(CLSClassKitSettingsController *)self cachedCurrentUser];
        unsigned int v14 = [v13 isStudent];

        if (v14)
        {
          objc_super v12 = [(CLSClassKitSettingsController *)self createStudentSpecifiers];
        }
        else
        {
          objc_super v12 = &__NSArray0__struct;
        }
      }
      v15 = *(void **)&self->PSListController_opaque[v3];
      *(void *)&self->PSListController_opaque[v3] = v12;
    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)createTeacherSpecifiers
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v15 = +[PSSpecifier groupSpecifierWithID:@"IdentityGroupID"];
  [v3 addObject:v15];
  v4 = [(CLSClassKitSettingsController *)self appleIDSpecifier];
  [v3 addObject:v4];
  dispatch_block_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"ALLOW_BROWSE_SYNC_HEADER" value:&stru_C6A8 table:@"ClassKitSettings"];
  id v7 = +[PSSpecifier groupSpecifierWithID:@"AllowBrowseSyncGroupID" name:v6];

  dispatch_time_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"ALLOW_BROWSE_SYNC_FOOTER" value:&stru_C6A8 table:@"ClassKitSettings"];
  [v7 setProperty:v9 forKey:PSFooterTextGroupKey];

  [v3 addObject:v7];
  objc_super v10 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v11 = [v10 localizedStringForKey:@"ALLOW_BROWSE_SYNC_TITLE" value:&stru_C6A8 table:@"ClassKitSettings"];
  objc_super v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"setAllowBrowseSync:specifier:" get:"allowBrowseSync:" detail:0 cell:6 edit:0];
  [(CLSClassKitSettingsController *)self setAllowBrowseToggleSpecifier:v12];

  v13 = [(CLSClassKitSettingsController *)self allowBrowseToggleSpecifier];
  [v3 addObject:v13];

  return v3;
}

- (id)createStudentSpecifiers
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"STUDENT_ACTIVITY_HEADER" value:&stru_C6A8 table:@"ClassKitSettings"];
  dispatch_block_t v5 = +[PSSpecifier groupSpecifierWithID:@"StudentProgressGroupID" name:v4];

  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"STUDENT_ACTIVITY_FOOTER_ABOUT_CLASSKIT_LINK" value:&stru_C6A8 table:@"ClassKitSettings"];

  dispatch_time_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"STUDENT_ACTIVITY_FOOTER" value:&stru_C6A8 table:@"ClassKitSettings"];
  objc_super v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v7);

  unsigned int v11 = [(CLSClassKitSettingsController *)self cachedCurrentUser];
  objc_super v12 = [v11 person];
  if ([v12 isProgressTrackingAllowed])
  {
    v13 = [(CLSClassKitSettingsController *)self cachedCurrentUser];
    unsigned __int8 v14 = [v13 organizationProgressTrackingAllowed];

    if (v14)
    {
      v15 = v5;
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [(id)v16 localizedStringForKey:@"STUDENT_ACTIVITY_HEADER_OPT_OUT" value:&stru_C6A8 table:@"ClassKitSettings"];
  v15 = +[PSSpecifier groupSpecifierWithID:@"StudentProgressGroupID" name:v17];

  id v18 = [(CLSClassKitSettingsController *)self cachedCurrentUser];
  LOBYTE(v16) = [v18 organizationProgressTrackingAllowed];

  if (v16)
  {
    id v19 = [(CLSClassKitSettingsController *)self cachedCurrentUser];
    v20 = [v19 person];
    unsigned __int8 v21 = [v20 isProgressTrackingAllowed];

    if (v21) {
      goto LABEL_10;
    }
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = v22;
    CFStringRef v24 = @"STUDENT_ACTIVITY_FOOTER_OPT_OUT_STUDENT";
  }
  else
  {
    v22 = +[NSBundle bundleForClass:objc_opt_class()];
    v23 = v22;
    CFStringRef v24 = @"STUDENT_ACTIVITY_FOOTER_OPT_OUT_ORG";
  }
  v25 = [v22 localizedStringForKey:v24 value:&stru_C6A8 table:@"ClassKitSettings"];
  uint64_t v26 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v7);

  objc_super v10 = (void *)v26;
LABEL_10:
  id v27 = [v10 rangeOfString:v7];
  NSUInteger v29 = v28;
  id v30 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
  v31 = +[PSSpecifier groupSpecifierWithID:@"IdentityGroupID"];
  [v30 addObject:v31];
  v32 = [(CLSClassKitSettingsController *)self appleIDSpecifier];
  [v30 addObject:v32];
  v49 = v10;
  v50 = (void *)v7;
  if (v27 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [v15 setProperty:v10 forKey:PSFooterTextGroupKey];
  }
  else
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v35 = v34 = v10;
    [v15 setProperty:v35 forKey:PSFooterCellClassGroupKey];

    [v15 setProperty:v34 forKey:PSFooterHyperlinkViewTitleKey];
    v57.id location = (NSUInteger)v27;
    v57.length = v29;
    v36 = NSStringFromRange(v57);
    [v15 setProperty:v36 forKey:PSFooterHyperlinkViewLinkRangeKey];

    v37 = +[NSValue valueWithNonretainedObject:self];
    [v15 setProperty:v37 forKey:PSFooterHyperlinkViewTargetKey];

    v38 = NSStringFromSelector("showProgressPrivacyInfo:");
    [v15 setProperty:v38 forKey:PSFooterHyperlinkViewActionKey];
  }
  [v30 addObject:v15];
  [(CLSClassKitSettingsController *)self loadUserProgressActivities];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v39 = [(CLSClassKitSettingsController *)self userProgressActivities];
  id v40 = [v39 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v52;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(void *)v52 != v42) {
          objc_enumerationMutation(v39);
        }
        v44 = [(CLSClassKitSettingsController *)self specifierWithProgressActivity:*(void *)(*((void *)&v51 + 1) + 8 * i)];
        [v30 addObject:v44];
      }
      id v41 = [v39 countByEnumeratingWithState:&v51 objects:v55 count:16];
    }
    while (v41);
  }

  if (![(CLSClassKitSettingsController *)self fetchAllActivities])
  {
    v45 = +[NSBundle bundleForClass:objc_opt_class()];
    v46 = [v45 localizedStringForKey:@"Show More" value:&stru_C6A8 table:@"ClassKitSettings"];
    v47 = +[PSSpecifier preferenceSpecifierNamed:v46 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v47 setButtonAction:"showMoreTapped:"];
    [v30 addObject:v47];
  }

  return v30;
}

- (id)appleIDSpecifier
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"APPLE_ID_FIELD_LABEL" value:&stru_C6A8 table:@"ClassKitSettings"];

  dispatch_block_t v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:0 get:"activeClassKitAppleIDWithSpecifier:" detail:0 cell:2 edit:0];
  [v5 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v5 setProperty:v4 forKey:PSTitleKey];
  [v5 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v5 setButtonAction:"accountButtonTappedWithSpecifier:"];

  return v5;
}

- (void)loadUserProgressActivities
{
  id v50 = 0;
  id v3 = +[CLSQuery queryWithObjectType:objc_opt_class() predicate:0 error:&v50];
  id v33 = v50;
  v35 = +[NSSortDescriptor sortDescriptorWithKey:@"dateLastModified" ascending:0];
  long long v52 = v35;
  v4 = +[NSArray arrayWithObjects:&v52 count:1];
  [v3 setSortDescriptors:v4];

  if ([(CLSClassKitSettingsController *)self fetchAllActivities]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 8;
  }
  [v3 setFetchLimit:v5];
  +[CLSDataStore shared];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_56B4;
  v49[3] = &unk_C438;
  v6 = v49[4] = self;
  v36 = v3;
  [v6 awaitExecuteQuery:v3 completion:v49];
  if (![(CLSClassKitSettingsController *)self fetchAllActivities])
  {
    uint64_t v7 = [(CLSClassKitSettingsController *)self userProgressActivities];
    id v8 = [v7 count];

    if ((unint64_t)v8 <= 7) {
      [(CLSClassKitSettingsController *)self setFetchAllActivities:1];
    }
  }
  id v9 = objc_alloc_init((Class)NSMutableSet);
  id v10 = objc_alloc_init((Class)NSMutableSet);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  unsigned int v11 = [(CLSClassKitSettingsController *)self userProgressActivities];
  id v12 = [v11 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v46;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v17 = (char *)[v16 type];
        if ((unint64_t)v17 >= 2)
        {
          if (v17 != (unsigned char *)&dword_0 + 2) {
            continue;
          }
          id v18 = [v16 parentObjectID];
          id v19 = v10;
        }
        else
        {
          id v18 = [v16 parentObjectID];
          id v19 = v9;
        }
        [v19 addObject:v18];
      }
      id v13 = [v11 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v13);
  }

  v20 = [(CLSClassKitSettingsController *)self objectIDToContextMap];
  [v20 removeAllObjects];

  v32 = +[NSPredicate predicateWithFormat:@"objectID IN %@", v9];

  id v44 = 0;
  v34 = +[CLSQuery queryWithObjectType:objc_opt_class() predicate:v32 error:&v44];
  id v21 = v44;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_5794;
  v43[3] = &unk_C460;
  v43[4] = self;
  [v6 awaitExecuteQuery:v34 completion:v43];
  v22 = [(CLSClassKitSettingsController *)self objectIDToAssignedItemMap];

  [v22 removeAllObjects];
  id v23 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v24 = +[NSPredicate predicateWithFormat:@"objectID IN %@", v10];
  id v42 = 0;
  v25 = +[CLSQuery queryWithObjectType:objc_opt_class() predicate:v24 error:&v42];
  id v26 = v42;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_593C;
  v39[3] = &unk_C488;
  id v40 = v23;
  id v41 = self;
  id v27 = v23;
  [v6 awaitExecuteQuery:v25 completion:v39];
  NSUInteger v28 = [(CLSClassKitSettingsController *)self objectIDToAttachmentMap];
  [v28 removeAllObjects];

  NSUInteger v29 = +[NSPredicate predicateWithFormat:@"objectID IN %@", v27];

  id v38 = 0;
  id v30 = +[CLSQuery queryWithObjectType:objc_opt_class() predicate:v29 error:&v38];
  id v31 = v38;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_5B08;
  v37[3] = &unk_C460;
  v37[4] = self;
  [v6 awaitExecuteQuery:v30 completion:v37];
}

- (id)specifierWithProgressActivity:(id)a3
{
  id v5 = a3;
  v6 = (char *)[v5 type];
  if ((unint64_t)v6 >= 2)
  {
    if (v6 != (unsigned char *)&dword_0 + 2) {
      goto LABEL_6;
    }
    uint64_t v7 = [(CLSClassKitSettingsController *)self specifierWithHandoutAssignedItemActivity:v5];
  }
  else
  {
    uint64_t v7 = [(CLSClassKitSettingsController *)self specifierWithContextActivity:v5];
  }
  id v3 = (void *)v7;
LABEL_6:

  return v3;
}

- (id)specifierWithContextActivity:(id)a3
{
  id v4 = a3;
  id v5 = CLSLocalizedNameFromContextType();
  v6 = [(CLSClassKitSettingsController *)self objectIDToContextMap];
  uint64_t v7 = [v4 parentObjectID];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    id v9 = 0;
    id v10 = &stru_C6A8;
    goto LABEL_10;
  }
  id v9 = [v8 appIdentifier];
  id v10 = [v8 title];
  if ([v8 type] != (char *)&dword_10 + 1) {
    goto LABEL_8;
  }
  unsigned int v11 = [v8 customTypeName];
  id v12 = +[NSCharacterSet whitespaceCharacterSet];
  id v13 = [v11 stringByTrimmingCharactersInSet:v12];

  if (![v13 length])
  {

LABEL_8:
    [v8 type];
    id v13 = CLSLocalizedNameFromContextType();
    goto LABEL_9;
  }
  if (!v13) {
    goto LABEL_8;
  }
LABEL_9:

  id v5 = v13;
LABEL_10:
  uint64_t v14 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  [v14 setProperty:v5 forKey:@"CLSSettingsSpecifierContextType"];
  v15 = [v4 objectID];
  [v14 setProperty:v15 forKey:PSIDKey];

  uint64_t v16 = [v4 objectID];
  [v14 setProperty:v16 forKey:@"CLSSettingsSpecifierActivityID"];

  v17 = [v4 dateLastModified];
  [v14 setProperty:v17 forKey:@"CLSSettingsSpecifierActivityLastModifiedDate"];

  [v14 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v14 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  [v14 setProperty:v9 forKey:PSLazyIconAppID];

  return v14;
}

- (id)specifierWithHandoutAssignedItemActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(CLSClassKitSettingsController *)self objectIDToAssignedItemMap];
  v6 = [v4 parentObjectID];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = [(CLSClassKitSettingsController *)self objectIDToAttachmentMap];
    id v9 = [v7 parentObjectID];
    id v10 = [v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      unsigned int v11 = [v10 title];
      id v12 = [(CLSClassKitSettingsController *)self bundleIdentifierForAttachment:v10];
      id v13 = [(CLSClassKitSettingsController *)self descriptionForAttachment:v10];
    }
    else
    {
      unsigned int v11 = [v7 title];
      id v12 = [v7 appIdentifier];
      id v13 = &stru_C6A8;
    }
  }
  else
  {
    id v12 = 0;
    id v13 = &stru_C6A8;
    unsigned int v11 = &stru_C6A8;
  }
  uint64_t v14 = +[PSSpecifier preferenceSpecifierNamed:v11 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
  [v14 setProperty:v13 forKey:@"CLSSettingsSpecifierContextType"];
  v15 = [v4 objectID];
  [v14 setProperty:v15 forKey:PSIDKey];

  uint64_t v16 = [v4 objectID];
  [v14 setProperty:v16 forKey:@"CLSSettingsSpecifierActivityID"];

  v17 = [v4 dateLastModified];
  [v14 setProperty:v17 forKey:@"CLSSettingsSpecifierActivityLastModifiedDate"];

  [v14 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v14 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  [v14 setProperty:v12 forKey:PSLazyIconAppID];

  return v14;
}

- (id)bundleIdentifierForAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  v6 = [(CLSClassKitSettingsController *)self cachedCurrentUser];
  uint64_t v7 = [v6 person];
  id v8 = [v7 objectID];

  if (v5 || !v8)
  {
    if (v5) {
      goto LABEL_26;
    }
  }
  else if ([v4 type] == 2)
  {
    id v9 = [v4 assetForPerson:v8];
    id v10 = v9;
    if (v9)
    {
      unsigned int v11 = [v9 fileUTType];
      id v12 = [v11 identifier];
      id v13 = +[LSDocumentProxy documentProxyForName:0 type:v12 MIMEType:0];

      id v27 = v13;
      id v28 = 0;
      uint64_t v14 = [v13 availableClaimBindingsForMode:0 handlerRank:_LSHandlerRankOwner error:&v28];
      id v15 = v28;
      if (v15)
      {
        CLSInitLog();
        uint64_t v16 = CLSLogDefault;
        if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v30 = v15;
          _os_log_error_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "CLSClassKitSettingsController failed to query asset claim bindings. Error: %@", buf, 0xCu);
        }
      }
      v17 = [v14 firstObject];
      uint64_t v18 = [v17 bundleRecord];
      id v5 = [(id)v18 bundleIdentifier];

      unsigned int v26 = [v11 conformsToType:UTTypePDF];
      unsigned int v19 = [v11 conformsToType:UTTypeHTML];
      LOBYTE(v18) = [v11 conformsToType:UTTypeImage];
      unsigned int v20 = [v11 conformsToType:UTTypeMovie];

      if ((v18 & 1) != 0 || v20)
      {
        id v21 = @"com.apple.mobileslideshow";

        id v5 = v21;
      }
      int v22 = v26;
      if (!v5) {
        int v22 = 1;
      }
      if ((v22 | v19) != 1) {
        goto LABEL_24;
      }
    }
    else
    {
      id v5 = 0;
    }
    CFStringRef v24 = @"com.apple.DocumentsApp";

    id v5 = v24;
LABEL_24:

    goto LABEL_26;
  }
  if (![v4 type])
  {
    id v23 = &CLSSettingsMobileSafariAppBundleIdentifier;
    goto LABEL_21;
  }
  if ([v4 type] == 5 || objc_msgSend(v4, "type") == 6)
  {
    id v23 = &CLSSettingsSchoolworkAppBundleIdentifier;
LABEL_21:
    id v5 = *v23;
    goto LABEL_26;
  }
  id v5 = 0;
LABEL_26:

  return v5;
}

- (id)descriptionForAttachment:(id)a3
{
  id v4 = a3;
  if (![v4 type])
  {
    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = v10;
    CFStringRef v11 = @"STUDENT_ACTIVITY_WEB_LINK";
LABEL_11:
    id v9 = [v10 localizedStringForKey:v11 value:&stru_C6A8 table:@"ClassKitSettings"];
LABEL_15:

    goto LABEL_16;
  }
  if ([v4 type] == 2)
  {
    id v5 = [(CLSClassKitSettingsController *)self cachedCurrentUser];
    v6 = [v5 person];
    uint64_t v7 = [v6 objectID];

    if (v7)
    {
      id v8 = [v4 assetForPerson:v7];
      if (v8)
      {
        id v9 = [(CLSClassKitSettingsController *)self fileTypeDescriptionForAsset:v8];
      }
      else
      {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    goto LABEL_15;
  }
  if ([v4 type] == 5)
  {
    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = v10;
    CFStringRef v11 = @"ACTIVITY_EXIT_TICKET";
    goto LABEL_11;
  }
  if ([v4 type] == 6)
  {
    id v10 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v7 = v10;
    CFStringRef v11 = @"ACTIVITY_ASSESSMENT";
    goto LABEL_11;
  }
  id v9 = 0;
LABEL_16:

  return v9;
}

- (id)fileTypeDescriptionForAsset:(id)a3
{
  id v3 = [a3 fileUTType];
  id v4 = [v3 localizedDescription];

  return v4;
}

- (id)activeClassKitAppleIDWithSpecifier:(id)a3
{
  id v3 = +[CLSDataStore shared];
  id v4 = [v3 currentUser];

  id v5 = [v4 person];
  v6 = [v5 appleID];

  return v6;
}

- (void)setAllowBrowseSync:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 BOOLValue];
  id v9 = +[CLSDataStore shared];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_6934;
  v12[3] = &unk_C4D8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v10 = v6;
  id v11 = v7;
  [v9 setShouldSyncTeacherBrowsedContexts:v8 completion:v12];
}

- (id)allowBrowseSync:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, &stru_C4F8);
  id v5 = +[CLSDataStore shared];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_6BA8;
  v11[3] = &unk_C520;
  id v14 = &v15;
  id v6 = v3;
  id v12 = v6;
  id v7 = v4;
  id v13 = v7;
  [v5 shouldSyncTeacherBrowsedContextsWithCompletion:v11];

  dispatch_time_t v8 = dispatch_time(0, 200000000);
  dispatch_block_wait(v7, v8);
  id v9 = +[NSNumber numberWithBool:*((unsigned __int8 *)v16 + 24)];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)showMoreTapped:(id)a3
{
  [a3 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  if (![(CLSClassKitSettingsController *)self fetchAllActivities])
  {
    [(CLSClassKitSettingsController *)self setFetchAllActivities:1];
    [(CLSClassKitSettingsController *)self reloadSpecifiers];
  }
}

- (void)showProgressPrivacyInfo:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.classkit"];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (CLSCurrentUser)cachedCurrentUser
{
  return self->_cachedCurrentUser;
}

- (void)setCachedCurrentUser:(id)a3
{
}

- (PSSpecifier)allowBrowseToggleSpecifier
{
  return self->_allowBrowseToggleSpecifier;
}

- (void)setAllowBrowseToggleSpecifier:(id)a3
{
}

- (NSMutableArray)userProgressActivities
{
  return self->_userProgressActivities;
}

- (void)setUserProgressActivities:(id)a3
{
}

- (BOOL)fetchAllActivities
{
  return self->_fetchAllActivities;
}

- (void)setFetchAllActivities:(BOOL)a3
{
  self->_fetchAllActivities = a3;
}

- (NSMutableDictionary)objectIDToContextMap
{
  return self->_objectIDToContextMap;
}

- (void)setObjectIDToContextMap:(id)a3
{
}

- (NSMutableDictionary)objectIDToAssignedItemMap
{
  return self->_objectIDToAssignedItemMap;
}

- (void)setObjectIDToAssignedItemMap:(id)a3
{
}

- (NSMutableDictionary)objectIDToAttachmentMap
{
  return self->_objectIDToAttachmentMap;
}

- (void)setObjectIDToAttachmentMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIDToAttachmentMap, 0);
  objc_storeStrong((id *)&self->_objectIDToAssignedItemMap, 0);
  objc_storeStrong((id *)&self->_objectIDToContextMap, 0);
  objc_storeStrong((id *)&self->_userProgressActivities, 0);
  objc_storeStrong((id *)&self->_allowBrowseToggleSpecifier, 0);

  objc_storeStrong((id *)&self->_cachedCurrentUser, 0);
}

@end