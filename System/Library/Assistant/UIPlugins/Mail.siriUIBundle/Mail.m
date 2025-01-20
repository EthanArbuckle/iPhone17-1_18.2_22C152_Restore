void sub_39A8(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;
  uint64_t vars8;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v1 = os_log_create("com.apple.mobilemail", (const char *)[v3 UTF8String]);
  v2 = (void *)qword_1F010;
  qword_1F010 = (uint64_t)v1;
}

void sub_3A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_3CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_3FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

double sub_4068(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7)
{
  double v13 = a7 + CGRectGetWidth(*(CGRect *)&a3) * -0.5;
  if (a2) {
    double v13 = v13 + *(double *)(a1 + 40);
  }
  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  CGRectGetHeight(v15);
  UIRoundToViewScale();
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  CGRectGetWidth(v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  CGRectGetHeight(v17);
  return v13;
}

void sub_4494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id a16)
{
  _Unwind_Resume(a1);
}

void sub_49B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4CFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4DBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4F04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 48), 8);
  _Unwind_Resume(a1);
}

void *sub_4F20(void *result, uint64_t a2)
{
  uint64_t v2 = result[4];
  if ((*(void *)(v2 + 8) & a2) != 0)
  {
    uint64_t v3 = *(void *)(result[5] + 8);
    uint64_t v4 = *(void *)(v3 + 24);
    if (v4 >= result[6]) {
      *(void *)(v2 + 24) |= a2;
    }
    else {
      *(void *)(v3 + 24) = v4 + 1;
    }
  }
  return result;
}

void sub_5320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_55E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFSAPersonAttributeFromEmail(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 emailAddressValue];
  uint64_t v3 = [v2 simpleAddress];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v1 stringValue];
  }
  v6 = v5;

  if ([v6 length])
  {
    id v7 = objc_alloc_init((Class)SAPersonAttribute);
    id v8 = v1;
    v9 = [v8 emailAddressValue];
    v10 = [v9 displayName];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v8 stringValue];
    }
    double v13 = v12;

    [v7 setData:v6];
    if ([v13 length]) {
      [v7 setDisplayText:v13];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void sub_5870(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFSAPersonAttributesFromEmails(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = MFSAPersonAttributeFromEmail(*(void **)(*((void *)&v9 + 1) + 8 * i));
        if (v7) {
          objc_msgSend(v2, "addObject:", v7, (void)v9);
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  if (![v2 count])
  {

    uint64_t v2 = 0;
  }

  return v2;
}

void sub_5A24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFCommentedEmailsFromSAPersonAttributes(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)ECEmailAddressFormatter);
  [v2 setShouldIncludeDisplayName:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_5B88;
  v6[3] = &unk_186B0;
  id v3 = v2;
  id v7 = v3;
  id v4 = objc_msgSend(v1, "ef_compactMap:", v6);
  if (![v4 count])
  {

    id v4 = 0;
  }

  return v4;
}

void sub_5B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_5B88(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 data];
  uint64_t v5 = +[ECEmailAddressComponents componentsWithString:v4];
  v6 = [v3 displayText];
  [v5 setDisplayName:v6];

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v5 emailAddressValue];
  long long v9 = (void *)v8;
  if (v8) {
    long long v10 = (void *)v8;
  }
  else {
    long long v10 = v4;
  }
  long long v11 = [v7 stringFromEmailAddressConvertible:v10];

  if ([v11 length]) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

void sub_5C74(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_5CB0()
{
}

void sub_5CB8()
{
}

void sub_5D40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_62A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_6624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_6D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6EE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6F90(uint64_t a1)
{
  [*(id *)(a1 + 32) _prepareSiriSnippetContents];
  [*(id *)(a1 + 32) setLoading:0];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 siriSnippetViewControllerViewDidLoad:*(void *)(a1 + 32)];
}

void sub_6FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_70BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_73B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_7908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_7B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_81B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_82D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_8384(double a1)
{
  id v2 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleSubheadline];
  [v2 scaledValueForValue:a1];
  double v4 = v3;

  return v4;
}

void sub_83E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_84A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_9620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_985C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_98D4(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_1F028;
  qword_1F028 = (uint64_t)v1;

  [(id)qword_1F028 setDateStyle:2];
  double v3 = (void *)qword_1F028;

  [v3 setTimeStyle:1];
}

void sub_9A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_A06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _Unwind_Exception *exception_object, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_A1F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A620(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A8E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_AAD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_AB88(double a1)
{
  id v2 = +[UIFontMetrics defaultMetrics];
  [v2 scaledValueForValue:a1];
  double v4 = v3;

  return v4;
}

void sub_ABD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_C244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_C994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_CDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

id getMailPreferenceValueWithDefault(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = +[NSUserDefaults em_userDefaults];
  id v6 = [v5 valueForKey:v3];

  if (!v6) {
    id v6 = v4;
  }

  return v6;
}

void sub_D0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getEmailPreferenceValue(void *a1)
{
  id v1 = a1;
  id v2 = +[NSUserDefaults em_userDefaults];
  id v3 = [v2 valueForKey:v1];

  return v3;
}

void sub_D170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getEmailPreferenceBoolValue(void *a1)
{
  id v1 = a1;
  id v2 = +[NSUserDefaults em_userDefaults];
  id v3 = [v2 BOOLForKey:v1];

  return v3;
}

void sub_D1E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void setEmailPreferenceValue(void *a1, void *a2)
{
  id v5 = a1;
  id v3 = a2;
  id v4 = +[NSUserDefaults em_userDefaults];
  [v4 setObject:v3 forKey:v5];
  if (([v4 synchronize] & 1) == 0) {
    NSLog(@"Failed to synchronize");
  }
  CFPreferencesAppSynchronize(EMUserDefaultsMailAppGroup);
}

void sub_D2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void setEmailPreferenceBoolValue(void *a1, uint64_t a2)
{
  id v4 = a1;
  id v3 = +[NSNumber numberWithBool:a2];
  setEmailPreferenceValue(v4, v3);
}

void sub_D334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id getMailPreferenceValue(void *a1)
{
  id v1 = getMailPreferenceValueWithDefault(a1, 0);

  return v1;
}

id getMailBoolPreferenceValueWithDefault(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = +[NSNumber numberWithBool:a2];
  id v5 = getMailPreferenceValueWithDefault(v3, v4);

  id v6 = [v5 BOOLValue];
  return v6;
}

void sub_D3FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getMailBoolPreferenceValue(void *a1)
{
  id v1 = getMailPreferenceValueWithDefault(a1, 0);
  id v2 = [v1 BOOLValue];

  return v2;
}

void sub_D464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL showToCCIndicators(int a1)
{
  unsigned int MailBoolPreferenceValue = dword_1EFF8;
  if (dword_1EFF8 < 0 || a1)
  {
    unsigned int MailBoolPreferenceValue = getMailBoolPreferenceValue(@"ShowToCCIndicators");
    dword_1EFF8 = MailBoolPreferenceValue;
  }
  return MailBoolPreferenceValue != 0;
}

BOOL conversationViewShowsNewestAtTop(int a1)
{
  unsigned int MailBoolPreferenceValue = dword_1EFFC;
  if (dword_1EFFC < 0 || a1)
  {
    unsigned int MailBoolPreferenceValue = getMailBoolPreferenceValue(@"ConversationViewShowsNewestAtTop");
    dword_1EFFC = MailBoolPreferenceValue;
  }
  return MailBoolPreferenceValue != 0;
}

BOOL conversationViewIncludesRelatedMessages(int a1)
{
  unsigned int v1 = dword_1F000;
  if (dword_1F000 < 0 || a1)
  {
    unsigned int v1 = getMailBoolPreferenceValue(@"ConversationViewExcludesRelatedMessages") ^ 1;
    dword_1F000 = v1;
  }
  return v1 != 0;
}

BOOL collapseReadConversationMessages(int a1)
{
  unsigned int MailBoolPreferenceValueWithDefault = dword_1F004;
  if (dword_1F004 < 0 || a1)
  {
    unsigned int MailBoolPreferenceValueWithDefault = getMailBoolPreferenceValueWithDefault(@"CollapseReadConversationMessages", 1);
    dword_1F004 = MailBoolPreferenceValueWithDefault;
  }
  return MailBoolPreferenceValueWithDefault != 0;
}

id includeAttachmentsWithReplies(int a1)
{
  id v2 = (void *)qword_1F038;
  if (qword_1F038) {
    BOOL v3 = a1 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    id v4 = getMailPreferenceValueWithDefault(@"IncludeAttachmentReplies", @"IncludeAttachmentRepliesWhenAdding");
    id v5 = [v4 copy];
    id v6 = (void *)qword_1F038;
    qword_1F038 = (uint64_t)v5;

    id v2 = (void *)qword_1F038;
  }

  return v2;
}

void sub_D628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL mutedThreadsMoveToArchive(int a1)
{
  int v1 = dword_1F008;
  if (dword_1F008 < 0 || a1)
  {
    id v2 = getMailPreferenceValueWithDefault(EMUserDefaultMutedThreadActionKey, EMUserDefaultMutedThreadActionMarkAsRead);
    dword_1F008 = [EMUserDefaultMutedThreadActionMoveToArchiveOrDelete isEqual:v2];

    int v1 = dword_1F008;
  }
  return v1 != 0;
}

void sub_D6B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id rightSwipeSetting(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1F048);
  id v2 = (id)qword_1F040;
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = a1 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v5 = v2;
  }
  else
  {
    id v5 = getMailPreferenceValueWithDefault(@"LeftEdgeSwipeAction", @"SwipeActionRead");

    if ((void *)qword_1F040 != v5) {
      objc_storeStrong((id *)&qword_1F040, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1F048);

  return v5;
}

void sub_D77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id leftSwipeSetting(int a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1F058);
  id v2 = (id)qword_1F050;
  BOOL v3 = v2;
  if (v2) {
    BOOL v4 = a1 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v5 = v2;
  }
  else
  {
    id v5 = getMailPreferenceValueWithDefault(@"RightEdgeSwipeAction", @"SwipeActionFlag");

    if ((void *)qword_1F050 != v5) {
      objc_storeStrong((id *)&qword_1F050, v5);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1F058);

  return v5;
}

void sub_D848(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id preferencesBundle()
{
  v0 = (void *)qword_1F060;
  if (!qword_1F060)
  {
    int v1 = UISystemRootDirectory();
    id v2 = [v1 stringByAppendingPathComponent:@"System/Library/PreferenceBundles/MobileMailSettings"];
    BOOL v3 = [v2 stringByAppendingPathExtension:@"bundle"];
    uint64_t v4 = +[NSBundle bundleWithPath:v3];
    id v5 = (void *)qword_1F060;
    qword_1F060 = v4;

    v0 = (void *)qword_1F060;
  }

  return v0;
}

void sub_D908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MailTableCellTextLeftForLevel(uint64_t a1)
{
  id v2 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  double result = 55.0;
  if (IsAccessibilityCategory) {
    double result = 16.0;
  }
  if (a1 >= 1)
  {
    double result = result + 31.0;
    if (a1 != 1) {
      return result + (float)((float)(a1 - 1) * 30.0);
    }
  }
  return result;
}

void sub_D9B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double MailTableCellImageCenterForLevel(uint64_t a1)
{
  double v2 = MailTableCellTextLeftForLevel(a1);
  double v3 = 32.0;
  if (a1) {
    double v3 = 23.0;
  }
  return v2 + -9.5 + v3 * -0.5;
}

void sub_DA54(id a1)
{
  id v1 = +[UIApplication sharedApplication];
  byte_1F068 = [v1 userInterfaceLayoutDirection] == (char *)&def_4BE8 + 1;
}

void sub_DAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_DCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_DD7C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&def_4BE8, log, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
}

void sub_DDD4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&def_4BE8, a2, OS_LOG_TYPE_DEBUG, "#SiriMailSnippet MFAssistantEmail: %@", (uint8_t *)&v2, 0xCu);
}

void sub_DE4C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&def_4BE8, log, OS_LOG_TYPE_DEBUG, "#SiriMailSnippet MessageStatusIndicatorOptions is MessageStatusIndicatorNone", v1, 2u);
}

void sub_DE90(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&def_4BE8, log, OS_LOG_TYPE_DEBUG, "#SiriMailSnippet MessageStatusIndicatorOptions is not MessageStatusIndicatorNone", v1, 2u);
}

void sub_DED4(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&def_4BE8, a2, OS_LOG_TYPE_DEBUG, "#SiriMailSnippet MessageStatusIndicatorOptions options: %lu", (uint8_t *)&v2, 0xCu);
}

void sub_DF4C(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&def_4BE8, a2, OS_LOG_TYPE_DEBUG, "#SiriMailSnippet MSResultsStatus statusFlags: %lu", (uint8_t *)&v2, 0xCu);
}

void sub_DFC4(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&def_4BE8, a2, OS_LOG_TYPE_DEBUG, "#SiriMailSnippet isOutgoing: %b", (uint8_t *)v2, 8u);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MFLocalizedAddressSeparator()
{
  return _MFLocalizedAddressSeparator();
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

uint64_t UISystemRootDirectory()
{
  return _UISystemRootDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_main_np(void)
{
  return _pthread_main_np();
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__createViews(void *a1, const char *a2, ...)
{
  return [a1 _createViews];
}

id objc_msgSend__isNaturallyRTL(void *a1, const char *a2, ...)
{
  return [a1 _isNaturallyRTL];
}

id objc_msgSend__prepareSiriSnippetContents(void *a1, const char *a2, ...)
{
  return [a1 _prepareSiriSnippetContents];
}

id objc_msgSend__prepareSiriSnippetViewController(void *a1, const char *a2, ...)
{
  return [a1 _prepareSiriSnippetViewController];
}

id objc_msgSend__repopulateFields(void *a1, const char *a2, ...)
{
  return [a1 _repopulateFields];
}

id objc_msgSend__setUpConstraints(void *a1, const char *a2, ...)
{
  return [a1 _setUpConstraints];
}

id objc_msgSend__setUpIndicatorViews(void *a1, const char *a2, ...)
{
  return [a1 _setUpIndicatorViews];
}

id objc_msgSend_addressLabel(void *a1, const char *a2, ...)
{
  return [a1 addressLabel];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bodyLabel(void *a1, const char *a2, ...)
{
  return [a1 bodyLabel];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return [a1 capHeight];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_collectionViewContentSize(void *a1, const char *a2, ...)
{
  return [a1 collectionViewContentSize];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return [a1 collectionViewLayout];
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return [a1 constraints];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_conversationNotificationLevel(void *a1, const char *a2, ...)
{
  return [a1 conversationNotificationLevel];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateLabel(void *a1, const char *a2, ...)
{
  return [a1 dateLabel];
}

id objc_msgSend_dateSent(void *a1, const char *a2, ...)
{
  return [a1 dateSent];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return [a1 defaultMetrics];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayText(void *a1, const char *a2, ...)
{
  return [a1 displayText];
}

id objc_msgSend_dotIndicatorImage(void *a1, const char *a2, ...)
{
  return [a1 dotIndicatorImage];
}

id objc_msgSend_draftURL(void *a1, const char *a2, ...)
{
  return [a1 draftURL];
}

id objc_msgSend_effectiveIndicatorOptions(void *a1, const char *a2, ...)
{
  return [a1 effectiveIndicatorOptions];
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return [a1 emailAddressValue];
}

id objc_msgSend_emails(void *a1, const char *a2, ...)
{
  return [a1 emails];
}

id objc_msgSend_errorOnlyCompletionHandlerAdapter(void *a1, const char *a2, ...)
{
  return [a1 errorOnlyCompletionHandlerAdapter];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_flagColors(void *a1, const char *a2, ...)
{
  return [a1 flagColors];
}

id objc_msgSend_flagShapeImage(void *a1, const char *a2, ...)
{
  return [a1 flagShapeImage];
}

id objc_msgSend_flagged(void *a1, const char *a2, ...)
{
  return [a1 flagged];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_fromEmail(void *a1, const char *a2, ...)
{
  return [a1 fromEmail];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_headerPunchOut(void *a1, const char *a2, ...)
{
  return [a1 headerPunchOut];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_horizontalStatusIndicatorViews(void *a1, const char *a2, ...)
{
  return [a1 horizontalStatusIndicatorViews];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_indicatorOptions(void *a1, const char *a2, ...)
{
  return [a1 indicatorOptions];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_isAMOSIdentifier(void *a1, const char *a2, ...)
{
  return [a1 isAMOSIdentifier];
}

id objc_msgSend_isBlocked(void *a1, const char *a2, ...)
{
  return [a1 isBlocked];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return [a1 loadView];
}

id objc_msgSend_mailMessageListSelectedStatusIndicatorColor(void *a1, const char *a2, ...)
{
  return [a1 mailMessageListSelectedStatusIndicatorColor];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_midXToMidXSpacing(void *a1, const char *a2, ...)
{
  return [a1 midXToMidXSpacing];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return [a1 opacity];
}

id objc_msgSend_outgoing(void *a1, const char *a2, ...)
{
  return [a1 outgoing];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_punchOutUri(void *a1, const char *a2, ...)
{
  return [a1 punchOutUri];
}

id objc_msgSend_read(void *a1, const char *a2, ...)
{
  return [a1 read];
}

id objc_msgSend_recipientsBcc(void *a1, const char *a2, ...)
{
  return [a1 recipientsBcc];
}

id objc_msgSend_recipientsCc(void *a1, const char *a2, ...)
{
  return [a1 recipientsCc];
}

id objc_msgSend_recipientsTo(void *a1, const char *a2, ...)
{
  return [a1 recipientsTo];
}

id objc_msgSend_referenceId(void *a1, const char *a2, ...)
{
  return [a1 referenceId];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return [a1 resourceSpecifier];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_simpleAddress(void *a1, const char *a2, ...)
{
  return [a1 simpleAddress];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_snippet(void *a1, const char *a2, ...)
{
  return [a1 snippet];
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return [a1 statusFlags];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_subjectAndBodyStackView(void *a1, const char *a2, ...)
{
  return [a1 subjectAndBodyStackView];
}

id objc_msgSend_subjectAndHorizontalStatusIconStackView(void *a1, const char *a2, ...)
{
  return [a1 subjectAndHorizontalStatusIconStackView];
}

id objc_msgSend_subjectLabel(void *a1, const char *a2, ...)
{
  return [a1 subjectLabel];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlackColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return [a1 systemIndigoColor];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return [a1 systemPinkColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 tertiaryLabelColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_timeSensitivePromotionsImage(void *a1, const char *a2, ...)
{
  return [a1 timeSensitivePromotionsImage];
}

id objc_msgSend_timeSensitiveTransactionsImage(void *a1, const char *a2, ...)
{
  return [a1 timeSensitiveTransactionsImage];
}

id objc_msgSend_timeSensitiveUpdatesImage(void *a1, const char *a2, ...)
{
  return [a1 timeSensitiveUpdatesImage];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_useSelectedColors(void *a1, const char *a2, ...)
{
  return [a1 useSelectedColors];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_verticalStatusIconView(void *a1, const char *a2, ...)
{
  return [a1 verticalStatusIconView];
}

id objc_msgSend_verticalStatusIndicatorViews(void *a1, const char *a2, ...)
{
  return [a1 verticalStatusIndicatorViews];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}