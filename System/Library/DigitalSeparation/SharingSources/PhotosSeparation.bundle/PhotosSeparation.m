uint64_t sub_2DC8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(a1 + 32), a2);
  }
  return result;
}

void sub_2E80(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = dispatch_group_create();
  v4 = +[NSMutableArray arrayWithCapacity:2];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v9);
        dispatch_group_enter(v3);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_30C0;
        v18[3] = &unk_8250;
        id v19 = v4;
        v20 = v3;
        [v10 stopSharingWithCompletion:v18];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  v11 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3104;
  block[3] = &unk_8278;
  id v12 = *(id *)(a1 + 32);
  id v16 = v4;
  id v17 = v12;
  id v13 = v4;
  dispatch_group_notify(v3, v11, block);
}

void sub_30C0(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

void sub_3104(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) count])
    {
      v5[0] = NSLocalizedDescriptionKey;
      v5[1] = NSMultipleUnderlyingErrorsKey;
      uint64_t v2 = *(void *)(a1 + 32);
      v6[0] = @"Failed to stop sharing to all participants and resources";
      v6[1] = v2;
      v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
      v4 = +[NSError errorWithDomain:@"com.apple.photos.PhotosSeparation" code:8 userInfo:v3];
    }
    else
    {
      v4 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_32D8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_3384(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_397C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v3)
    {
      v7[0] = NSLocalizedDescriptionKey;
      v7[1] = NSUnderlyingErrorKey;
      v8[0] = @"Failed to stop sharing specified participants";
      v8[1] = v3;
      id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
      id v6 = +[NSError errorWithDomain:@"com.apple.photos.PhotosSeparation" code:1 userInfo:v5];

      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      id v6 = 0;
    }
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
}

uint64_t sub_3A84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_3A98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_3D78(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    if (v3)
    {
      v7[0] = NSLocalizedDescriptionKey;
      v7[1] = NSUnderlyingErrorKey;
      v8[0] = @"Failed to stop sharing library";
      v8[1] = v3;
      id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
      id v6 = +[NSError errorWithDomain:@"com.apple.photos.PhotosSeparation" code:4 userInfo:v5];

      uint64_t v4 = *(void *)(a1 + 32);
    }
    else
    {
      id v6 = 0;
    }
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }
}

uint64_t sub_3E80(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_3E94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_4AB4(uint64_t a1)
{
  id v2 = +[PHCloudSharedAlbumChangeRequest changeRequestForCloudSharedAlbum:*(void *)(*(void *)(a1 + 32) + 24)];
  [v2 setIsPublic:*(void *)(a1 + 40) == 2];
}

id sub_4B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _callCompletion:*(void *)(a1 + 40) withErrorCode:128 description:@"Failed to stop sharing public album link" underlyingError:a3];
}

void sub_4D24(uint64_t a1)
{
  id v2 = +[PHCloudSharedAlbumChangeRequest changeRequestForCloudSharedAlbum:*(void *)(*(void *)(a1 + 32) + 24)];
  id v3 = [*(id *)(a1 + 40) representedObject];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 40) representedObject];
    id v6 = v4;
    id v5 = +[NSArray arrayWithObjects:&v6 count:1];
    [v2 removeCloudSharedAlbumInvitationRecords:v5];
  }
}

id sub_4E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _callCompletion:*(void *)(a1 + 40) withErrorCode:1 description:@"Failed to stop sharing specified participants" underlyingError:a3];
}

id sub_4E20(uint64_t a1)
{
  return +[PHCloudSharedAlbumDeleteRequest deleteRequestForObject:*(void *)(*(void *)(a1 + 32) + 24)];
}

id sub_4E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _callCompletion:*(void *)(a1 + 40) withErrorCode:1 description:@"Failed to stop sharing specified participants" underlyingError:a3];
}

void sub_5024(uint64_t a1)
{
  id v1 = +[PHCloudSharedAlbumChangeRequest changeRequestForCloudSharedAlbum:*(void *)(*(void *)(a1 + 32) + 24)];
  [v1 setIsPublic:0];
  [v1 stopSharing];
}

id sub_508C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _callCompletion:*(void *)(a1 + 40) withErrorCode:2 description:@"Failed to stop sharing album" underlyingError:a3];
}

id sub_50A8(uint64_t a1)
{
  return +[PHCloudSharedAlbumDeleteRequest deleteRequestForObject:*(void *)(*(void *)(a1 + 32) + 24)];
}

id sub_50E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _callCompletion:*(void *)(a1 + 40) withErrorCode:2 description:@"Failed to stop sharing album" underlyingError:a3];
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_cloudOwnerEmail(void *a1, const char *a2, ...)
{
  return [a1 cloudOwnerEmail];
}

id objc_msgSend_cloudOwnerPhone(void *a1, const char *a2, ...)
{
  return [a1 cloudOwnerPhone];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return [a1 emailAddress];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_invitationRecords(void *a1, const char *a2, ...)
{
  return [a1 invitationRecords];
}

id objc_msgSend_inviteeEmails(void *a1, const char *a2, ...)
{
  return [a1 inviteeEmails];
}

id objc_msgSend_inviteeFirstName(void *a1, const char *a2, ...)
{
  return [a1 inviteeFirstName];
}

id objc_msgSend_inviteeLastName(void *a1, const char *a2, ...)
{
  return [a1 inviteeLastName];
}

id objc_msgSend_inviteePhones(void *a1, const char *a2, ...)
{
  return [a1 inviteePhones];
}

id objc_msgSend_isCloudMultipleContributorsEnabled(void *a1, const char *a2, ...)
{
  return [a1 isCloudMultipleContributorsEnabled];
}

id objc_msgSend_isCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 isCurrentUser];
}

id objc_msgSend_isOwnedByCurrentUser(void *a1, const char *a2, ...)
{
  return [a1 isOwnedByCurrentUser];
}

id objc_msgSend_isOwner(void *a1, const char *a2, ...)
{
  return [a1 isOwner];
}

id objc_msgSend_isSharedAlbumsEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSharedAlbumsEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_librarySpecificFetchOptions(void *a1, const char *a2, ...)
{
  return [a1 librarySpecificFetchOptions];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
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

id objc_msgSend_photoLibrary(void *a1, const char *a2, ...)
{
  return [a1 photoLibrary];
}

id objc_msgSend_publicURLEnabled(void *a1, const char *a2, ...)
{
  return [a1 publicURLEnabled];
}

id objc_msgSend_representedObject(void *a1, const char *a2, ...)
{
  return [a1 representedObject];
}

id objc_msgSend_resultType(void *a1, const char *a2, ...)
{
  return [a1 resultType];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_stopSharing(void *a1, const char *a2, ...)
{
  return [a1 stopSharing];
}

id objc_msgSend_systemPhotoLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 systemPhotoLibraryURL];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}