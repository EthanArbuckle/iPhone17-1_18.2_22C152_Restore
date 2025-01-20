id MFSAPersonAttributeFromEmail(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t vars8;

  v1 = a1;
  v2 = [v1 emailAddressValue];
  v3 = [v2 simpleAddress];
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v5 = [v1 stringValue];
  }
  v6 = v5;

  if ([v6 length])
  {
    v7 = objc_alloc_init((Class)SAPersonAttribute);
    v8 = v1;
    v9 = [v8 emailAddressValue];
    v10 = [v9 displayName];
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      v12 = [v8 stringValue];
    }
    v13 = v12;

    [v7 setData:v6];
    if ([v13 length]) {
      [v7 setDisplayText:v13];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_4FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFSAPersonAttributesFromEmails(void *a1)
{
  id v1 = a1;
  v2 = +[NSMutableArray array];
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
        v7 = MFSAPersonAttributeFromEmail(*(void **)(*((void *)&v9 + 1) + 8 * i));
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

    v2 = 0;
  }

  return v2;
}

void sub_51B0(_Unwind_Exception *a1)
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
  v6[2] = sub_5314;
  v6[3] = &unk_C388;
  id v3 = v2;
  id v7 = v3;
  id v4 = objc_msgSend(v1, "ef_compactMap:", v6);
  if (![v4 count])
  {

    id v4 = 0;
  }

  return v4;
}

void sub_52DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_5314(uint64_t a1, void *a2)
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

void sub_5400(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_543C()
{
}

void sub_5444()
{
}

void sub_54CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_56EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_5DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5ED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_603C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

id sub_64CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setObjects:*(void *)(*(void *)(a1 + 40) + 8)];
}

void sub_65B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_67A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_694C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_6A3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _populateResults:*(void *)(a1 + 40)];
}

id sub_6AE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _searchFinished:*(void *)(a1 + 40)];
}

void sub_6CD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_739C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_7628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_76F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

void sub_7864(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_7890(void *a1, void *a2)
{
  uint64_t v3 = MSResultsKeyDateSent;
  id v4 = [a1 objectForKey:MSResultsKeyDateSent];
  uint64_t v5 = [a2 objectForKey:v3];
  v6 = (char *)[v4 compare:v5];
  if (v6 == (unsigned char *)&dword_0 + 1) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v6 == (char *)-1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }

  return v8;
}

void sub_7910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_79C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_7A40(id a1, SAPersonAttribute *a2)
{
  id v2 = [(SAPersonAttribute *)a2 data];
  id v3 = [objc_alloc((Class)ECEmailAddress) initWithString:v2];
  BOOL v4 = v3 == 0;

  return v4;
}

void sub_7A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  v26 = v25;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_7F44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_7F54(uint64_t a1)
{
}

void sub_7F5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 copy];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    long long v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v11 = objc_msgSend(v6, "ef_publicDescription");
      sub_8C68(v11, v12, v10);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_8034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id MFConversationReferenceFromHash(uint64_t a1)
{
  if (a1)
  {
    id v1 = +[NSString stringWithFormat:@"%@://conversation/%lld", EMAppleMailURLScheme, a1];
    id v2 = +[NSURL URLWithString:v1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void sub_81F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MFDocumentReferenceFromDocumentID(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSURLComponents);
  [v2 setScheme:EMAppleMailURLScheme];
  [v2 setHost:@"document"];
  id v3 = +[NSString stringWithFormat:@"/%@", v1];
  [v2 setPath:v3];

  BOOL v4 = [v2 URL];

  return v4;
}

void sub_82C4(_Unwind_Exception *a1)
{
  BOOL v4 = v3;

  _Unwind_Resume(a1);
}

void sub_844C(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_853C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_86E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_876C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_877C(id a1)
{
  id v3 = +[NSBundle mainBundle];
  uint64_t v1 = [v3 bundleIdentifier];
  id v2 = (void *)qword_111D8;
  qword_111D8 = v1;
}

void sub_87E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_8A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8C08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8C24(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error: Search timed out.", v1, 2u);
}

void sub_8C68(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to send email: %{public}@", buf, 0xCu);
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

uint64_t MSCanSendMail()
{
  return _MSCanSendMail();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__generateAceResults(void *a1, const char *a2, ...)
{
  return [a1 _generateAceResults];
}

id objc_msgSend__generateMSCriterion(void *a1, const char *a2, ...)
{
  return [a1 _generateMSCriterion];
}

id objc_msgSend__perform(void *a1, const char *a2, ...)
{
  return [a1 _perform];
}

id objc_msgSend__validate(void *a1, const char *a2, ...)
{
  return [a1 _validate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_conversationID(void *a1, const char *a2, ...)
{
  return [a1 conversationID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_databaseID(void *a1, const char *a2, ...)
{
  return [a1 databaseID];
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

id objc_msgSend_documentID(void *a1, const char *a2, ...)
{
  return [a1 documentID];
}

id objc_msgSend_emailAddressValue(void *a1, const char *a2, ...)
{
  return [a1 emailAddressValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return [a1 externalID];
}

id objc_msgSend_fromEmail(void *a1, const char *a2, ...)
{
  return [a1 fromEmail];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return [a1 identifiers];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
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

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_searchResultIdentifier(void *a1, const char *a2, ...)
{
  return [a1 searchResultIdentifier];
}

id objc_msgSend_simpleAddress(void *a1, const char *a2, ...)
{
  return [a1 simpleAddress];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return [a1 subject];
}

id objc_msgSend_toEmail(void *a1, const char *a2, ...)
{
  return [a1 toEmail];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}