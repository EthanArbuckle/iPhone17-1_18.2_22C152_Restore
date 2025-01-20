void sub_2E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2EAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2EBC(uint64_t a1)
{
}

void sub_2EC4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_2F38(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t sub_3F98(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_3FA8(uint64_t a1)
{
}

void sub_3FB0(uint64_t a1)
{
  from = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained fetchInProgress])
  {
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    CFStringRef v45 = @"fetch already in progress resource";
    v3 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v4 = +[NSError errorWithDomain:@"CalendarSeparationErrorDomain" code:0 userInfo:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  else
  {
    [WeakRetained setFetchInProgress:1];
    v7 = [WeakRetained sharedResources];
    [v7 removeAllObjects];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v8 = [WeakRetained eventStore];
    v9 = [v8 sourcesEnabledForEntityType:0];

    id v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v39;
      v26 = v33;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ((objc_msgSend(v13, "isDelegate", v26) & 1) == 0
            && [v13 sourceType] == (char *)&dword_0 + 2
            && [v13 supportsDelegation])
          {
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
            v14 = [WeakRetained eventStore];
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v33[0] = sub_4408;
            v33[1] = &unk_82B8;
            id v34 = *(id *)(a1 + 40);
            objc_copyWeak(&v37, from);
            v35 = v13;
            id v36 = *(id *)(a1 + 32);
            [v14 fetchGrantedDelegatesForSource:v13 results:v32];

            objc_destroyWeak(&v37);
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v10);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = [WeakRetained eventStore];
    v3 = [v15 calendarsForEntityType:0];

    id v16 = [v3 countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v29;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v3);
          }
          v19 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
          v20 = [v19 source];
          unsigned __int8 v21 = [v20 isDelegate];

          if ((v21 & 1) == 0)
          {
            if (([v19 sharingStatus] == (char *)&dword_0 + 2
               || [v19 sharingStatus] == (char *)&dword_0 + 1)
              && ([v19 sharees],
                  v22 = objc_claimAutoreleasedReturnValue(),
                  BOOL v23 = [v22 count] == 0,
                  v22,
                  !v23)
              || [v19 isPublished])
            {
              v24 = [[CalendarSeparationSharedCalendar alloc] initWithCalendar:v19];
              v25 = [WeakRetained sharedResources];
              [v25 addObject:v24];
            }
          }
        }
        id v16 = [v3 countByEnumeratingWithState:&v28 objects:v42 count:16];
      }
      while (v16);
    }
  }
}

void sub_43EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_4408(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_44D8;
  v8[3] = &unk_8290;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, v8);

  objc_destroyWeak(&v12);
}

void sub_44D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([*(id *)(a1 + 32) count])
  {
    v2 = [[CalendarSeparationSharedAccount alloc] initWithSource:*(void *)(a1 + 40) andDelegates:*(void *)(a1 + 32)];
    id v3 = [WeakRetained sharedResources];
    [v3 addObject:v2];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_4574(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = a1 + 32;
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = WeakRetained;
  if (*(void *)(*(void *)(*(void *)(v4 + 8) + 8) + 40))
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
  else
  {
    uint64_t v5 = [WeakRetained sharedResources];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v5, 0);
  }
  [v6 setFetchInProgress:0];
}

void sub_481C(uint64_t a1)
{
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_3F98;
  v31[4] = sub_3FA8;
  id v32 = 0;
  v2 = dispatch_group_create();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) sharedResources];
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v28;
    v15 = v20;
    id obj = v3;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v8 = objc_msgSend(v7, "participants", obj, v15);
        id v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v24;
          while (2)
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v8);
              }
              if ([*(id *)(*((void *)&v23 + 1) + 8 * (void)j) matchesDSParticipation:*(void *)(a1 + 40)])
              {
                dispatch_group_enter(v2);
                uint64_t v12 = *(void *)(a1 + 40);
                v19[0] = _NSConcreteStackBlock;
                v19[1] = 3221225472;
                v20[0] = sub_4B48;
                v20[1] = &unk_8330;
                v22 = v31;
                unsigned __int8 v21 = v2;
                [v7 stopSharingWithParticipant:v12 completion:v19];

                goto LABEL_16;
              }
            }
            id v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v3 = obj;
      id v4 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v4);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4BB0;
  block[3] = &unk_8268;
  v13 = *(NSObject **)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  v18 = v31;
  dispatch_group_notify(v2, v13, block);

  _Block_object_dispose(v31, 8);
}

void sub_4B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

void sub_4B48(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_4BB0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_4C8C(uint64_t a1)
{
  v20[0] = 0;
  v20[1] = v20;
  void v20[2] = 0x3032000000;
  v20[3] = sub_3F98;
  v20[4] = sub_3FA8;
  id v21 = 0;
  v2 = dispatch_group_create();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) sharedResources];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  uint64_t v9 = a1;
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v6);
        dispatch_group_enter(v2);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_4EFC;
        v13[3] = &unk_8330;
        v15 = v20;
        v14 = v2;
        [v7 stopSharingWithCompletion:v13];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v4);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4F64;
  block[3] = &unk_8268;
  v8 = *(NSObject **)(v9 + 40);
  id v11 = *(id *)(v9 + 48);
  uint64_t v12 = v20;
  dispatch_group_notify(v2, v8, block);

  _Block_object_dispose(v20, 8);
}

void sub_4ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_4EFC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_4F64(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_contactPredicate(void *a1, const char *a2, ...)
{
  return [a1 contactPredicate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_csParticipants(void *a1, const char *a2, ...)
{
  return [a1 csParticipants];
}

id objc_msgSend_defaultProvider(void *a1, const char *a2, ...)
{
  return [a1 defaultProvider];
}

id objc_msgSend_delegates(void *a1, const char *a2, ...)
{
  return [a1 delegates];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_eventStore(void *a1, const char *a2, ...)
{
  return [a1 eventStore];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return [a1 familyName];
}

id objc_msgSend_fetchInProgress(void *a1, const char *a2, ...)
{
  return [a1 fetchInProgress];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_isDelegate(void *a1, const char *a2, ...)
{
  return [a1 isDelegate];
}

id objc_msgSend_isPublished(void *a1, const char *a2, ...)
{
  return [a1 isPublished];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return [a1 nameComponents];
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return [a1 participants];
}

id objc_msgSend_permission(void *a1, const char *a2, ...)
{
  return [a1 permission];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_preferredUserAddress(void *a1, const char *a2, ...)
{
  return [a1 preferredUserAddress];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_sharedOwnerEmail(void *a1, const char *a2, ...)
{
  return [a1 sharedOwnerEmail];
}

id objc_msgSend_sharedOwnerName(void *a1, const char *a2, ...)
{
  return [a1 sharedOwnerName];
}

id objc_msgSend_sharedOwnerPhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 sharedOwnerPhoneNumber];
}

id objc_msgSend_sharedResources(void *a1, const char *a2, ...)
{
  return [a1 sharedResources];
}

id objc_msgSend_shareeAccessLevel(void *a1, const char *a2, ...)
{
  return [a1 shareeAccessLevel];
}

id objc_msgSend_sharees(void *a1, const char *a2, ...)
{
  return [a1 sharees];
}

id objc_msgSend_shareesAndOwner(void *a1, const char *a2, ...)
{
  return [a1 shareesAndOwner];
}

id objc_msgSend_sharingStatus(void *a1, const char *a2, ...)
{
  return [a1 sharingStatus];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return [a1 sourceType];
}

id objc_msgSend_stringRemovingMailto(void *a1, const char *a2, ...)
{
  return [a1 stringRemovingMailto];
}

id objc_msgSend_supportsDelegation(void *a1, const char *a2, ...)
{
  return [a1 supportsDelegation];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_updateGrantedDelegate_action_source_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateGrantedDelegate:action:source:completion:");
}