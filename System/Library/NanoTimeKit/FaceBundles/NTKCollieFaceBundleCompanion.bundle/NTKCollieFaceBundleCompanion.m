uint64_t sub_2128(uint64_t a1)
{
  uint64_t vars8;

  qword_2F788 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_2518(uint64_t a1, uint64_t a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_2590;
  v2[3] = &unk_28720;
  v2[4] = *(void *)(a1 + 32);
  v2[5] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_2590(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1 == *(void *)(v2 + 8) || (v1 | 4) == 4)
  {
    *(void *)(v2 + 8) = v1;
  }
  else
  {
    id v5 = +[NTKCollieStyleEditOption memojiIdentifiers];
    *(void *)(*(void *)(a1 + 32) + 8) = *(void *)(a1 + 40);
    +[NTKCollieStyleEditOption cloudSyncStatusInvalidatingIdentifiers:v5];
  }
}

void sub_28B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 supportsDeviceToDeviceEncryption]
    && [v3 accountStatus] == (char *)&dword_0 + 1)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v5 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_17CC4(v5);
    }

    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v4();
}

void sub_2AD4(id a1)
{
  qword_2F7A0 = +[AVTAnimoji animojiNames];

  _objc_release_x1();
}

id sub_2C2C()
{
  if (qword_2F7B8 != -1) {
    dispatch_once(&qword_2F7B8, &stru_28998);
  }
  v0 = (void *)qword_2F7B0;

  return v0;
}

id sub_2F74(id a1, AVTAvatarRecord *a2)
{
  uint64_t v2 = a2;
  id v3 = [(AVTAvatarRecord *)v2 identifier];
  id v5 = +[NTKCollieStyleEditOptionAvatarRecordCache _memojiDataRepresentationFromAvatarRecord:v2];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 sha1String];
  }
  else
  {
    v7 = &stru_29398;
  }

  v10[0] = @"identifier";
  v10[1] = @"sha1";
  v11[0] = v3;
  v11[1] = v7;
  v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  return v8;
}

void sub_3134(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_379C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_37C0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v9 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "_basenameForSnapshotImageIdentifier:poseType:size:", v9, 0, *(double *)(a1 + 56), *(double *)(a1 + 64));
  if ([*(id *)(a1 + 40) containsObject:v6])
  {
    v7 = *(void **)(a1 + 40);
    v8 = objc_msgSend((id)objc_opt_class(), "_basenameForSnapshotImageIdentifier:poseType:size:", v9, a4, *(double *)(a1 + 56), *(double *)(a1 + 64));
    [v7 addObject:v8];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

uint64_t sub_3B08(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 isEqualToString:@"avatar"])
  {
    [*(id *)(a1 + 32) addObject:v9];
    id v3 = [(id)objc_opt_class() _extendPreservelist:*(void *)(a1 + 32) snapshotKey:@"local"];
LABEL_3:
    id v4 = v9;
    goto LABEL_6;
  }
  id v3 = [v9 isEqualToString:@"memoji-identifier"];
  id v4 = v9;
  if (v3 && !*(unsigned char *)(a1 + 56))
  {
    id v5 = [(id)objc_opt_class() bridgeMemojiIdentifierForResourceDirectory:*(void *)(a1 + 48)];
    if (v5 && ([*(id *)(a1 + 40) hasAvatarStoreMemojiForIdentifier:v5] & 1) == 0)
    {
      v6 = +[NSString regularMemojiStyleNameForIdentifier:v5];
      v7 = [(id)objc_opt_class() dataRepresentationBasenameForStyleName:v6];
      [*(id *)(a1 + 32) addObject:v9];
      [*(id *)(a1 + 32) addObject:v7];
      [(id)objc_opt_class() _extendPreservelist:*(void *)(a1 + 32) snapshotKey:v6];
    }
    goto LABEL_3;
  }
LABEL_6:

  return _objc_release_x1(v3, v4);
}

void sub_438C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_48B4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSharedMemojiStyleName])
  {
    uint64_t v2 = +[NTKCollieStyleEditOptionAvatarRecordCache sharedMemojiForResourceDirectory:*(void *)(a1 + 40) oldAvatar:*(void *)(a1 + 48)];
LABEL_8:
    id v7 = (id)v2;
    goto LABEL_12;
  }
  unsigned int v3 = [*(id *)(a1 + 32) isRegularMemojiStyleName];
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 memojiIdentifier];
    id v6 = [*(id *)(a1 + 56) indexForRecordIdentifier:v5];
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [(id)objc_opt_class() bridgeMemojiForIdentifier:v5 resourceDirectory:*(void *)(a1 + 40)];
    }
    else {
    id v8 = [*(id *)(a1 + 56) memojiAvatarAtIndex:v6 oldAvatar:*(void *)(a1 + 48)];
    }

    id v7 = v8;
    goto LABEL_12;
  }
  if ([v4 isRegularAnimojiStyleName])
  {
    uint64_t v2 = +[AVTAnimoji animojiNamed:*(void *)(a1 + 32)];
    goto LABEL_8;
  }
  id v7 = 0;
LABEL_12:
  id v9 = v7;
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_5C5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_6124(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void sub_67A0(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (*(void *)(a1 + 32))
  {
    unint64_t v3 = 0;
    double v4 = 1.10000002;
    do
    {
      id v5 = *(id *)(*(void *)(a1 + 40) + 8 * v3);
      [v5 size];
      double v8 = v4 * v7;
      if (v3)
      {
        if (v3 == 2)
        {
          double v8 = v7 * 1.21000004;
          double v9 = (*(double *)(a1 + 48) - v6 * 1.21000004 * 0.5) * 0.5;
          double v4 = 1.21000004;
        }
        else
        {
          if (v3 != 1)
          {

            break;
          }
          double v9 = *(double *)(a1 + 48) + 5.0 - v4 * v6 * 0.5;
        }
      }
      else
      {
        double v9 = -5.0;
      }
      objc_msgSend(v5, "drawInRect:", v9, (*(double *)(a1 + 56) - v8 * 0.5) * 0.5 + 0.0);

      ++v3;
    }
    while (v3 < *(void *)(a1 + 32));
  }
}

void sub_69A0(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (*(void *)(a1 + 32))
  {
    for (unint64_t i = 0; i < *(void *)(a1 + 32); ++i)
    {
      id v4 = *(id *)(*(void *)(a1 + 40) + 8 * i);
      [v4 size];
      double v7 = v6 * 1.21000004 * 0.5;
      double v8 = -2.5;
      if (i)
      {
        if (i != 1)
        {

          break;
        }
        double v8 = *(double *)(a1 + 48) + 2.5 - v7;
      }
      objc_msgSend(v4, "drawInRect:", v8, (*(double *)(a1 + 56) - v5 * 1.21000004 * 0.5) * 0.5 + 0.0, v7);
    }
  }
}

id sub_6C54(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = [a2 name];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_6F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_6F2C(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v14 = a2;
  id v7 = a3;
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "snapshotImageForStyleName:resourceDirectory:poseType:size:", v7, 0, a4, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (!v9)
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_makeSnapshotImageForStyleName:resourceDirectory:poseType:size:", v7, 0, a4, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void *)(v11 + 24);
  *(void *)(v11 + 24) = v12 + 1;
  v13 = *(void **)(v10 + 8 * v12);
  *(void *)(v10 + 8 * v12) = v9;
}

void sub_72E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_7304(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v14 = a2;
  id v7 = a3;
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "snapshotImageForStyleName:resourceDirectory:poseType:size:", v7, 0, a4, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (!v9)
  {
    uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "_makeSnapshotImageForStyleName:resourceDirectory:poseType:size:", v7, 0, a4, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void *)(v11 + 24);
  *(void *)(v11 + 24) = v12 + 1;
  v13 = *(void **)(v10 + 8 * v12);
  *(void *)(v10 + 8 * v12) = v9;
}

void sub_7FC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_7FE8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "equalsStyleName:resourceDirectory:poseType:size:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void sub_7FFC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 64) objectAtIndex:0];
  objc_sync_exit(v2);

  if (v3)
  {
    double v4 = CACurrentMediaTime();
    double v5 = [v3 styleName];
    double v6 = [v3 resourceDirectory];
    id v7 = [v3 poseType];
    [v3 size];
    double v9 = v8;
    double v11 = v10;
    id v14 = *(void **)(a1 + 32);
    v13 = (id *)(a1 + 32);
    v15 = objc_msgSend(v14, "_makeSnapshotImageForStyleName:resourceDirectory:poseType:size:", v5, v6, v7, v9, v11);
    id v16 = *v13;
    objc_sync_enter(v16);
    [*((id *)*v13 + 8) removeObject:v3];
    objc_sync_exit(v16);

    v17 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = CACurrentMediaTime();
      v19 = [v3 completions];
      *(_DWORD *)buf = 136315906;
      v30 = "-[NTKCollieStyleEditOptionAvatarRecordCache _makeSnapshotImageForStyleName:resourceDirectory:poseType:size:c"
            "ompletion:]_block_invoke";
      __int16 v31 = 2112;
      v32 = v5;
      __int16 v33 = 2048;
      double v34 = v18 - v4;
      __int16 v35 = 1024;
      unsigned int v36 = [v19 count];
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%s: completed styleName = %@, build time = %.3fs, nCompletions = %u", buf, 0x26u);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v20 = objc_msgSend(v3, "completions", 0);
    id v21 = [v20 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v20);
          }
          (*(void (**)(double, double))(*(void *)(*((void *)&v24 + 1) + 8 * (void)v23) + 16))(v9, v11);
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v20 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v21);
    }
  }
}

void sub_82C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_83B0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_8490(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_8570(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_90EC(id a1)
{
  uint64_t v1 = NTKCacheDirectory();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"Animoji"];
  unint64_t v3 = (void *)qword_2F7B0;
  qword_2F7B0 = v2;

  double v4 = +[NSFileManager defaultManager];
  [v4 createDirectoryAtPath:qword_2F7B0 withIntermediateDirectories:1 attributes:0 error:0];

  double v5 = +[NSFileManager defaultManager];
  NSFileAttributeKey v7 = NSFileProtectionKey;
  NSFileProtectionType v8 = NSFileProtectionNone;
  double v6 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v5 setAttributes:v6 ofItemAtPath:qword_2F7B0 error:0];
}

void sub_920C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_9258(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_9278(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_9294(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_92C8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id NTKCollieFaceNSBundle()
{
  uint64_t v0 = objc_opt_class();

  return +[NSBundle bundleForClass:v0];
}

void sub_96DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9708(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA1_Update(*(CC_SHA1_CTX **)(*(void *)(*(void *)(a1 + 32) + 8) + 24), a2, len);
}

id sub_9D14(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "deprecated_ntk_setPaused:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_9DE0(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "deprecated_ntk_setPaused:", *(unsigned __int8 *)(a1 + 48));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

id sub_9EE8(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "deprecated_ntk_isPaused");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

uint64_t sub_A0E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_A0F4(uint64_t a1)
{
}

void sub_A0FC(uint64_t a1)
{
}

id sub_A1B8(uint64_t a1)
{
  [*(id *)(a1 + 32) ensureRenderer];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  uint64_t v4 = *(void *)(a1 + 40);
  double v5 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v5 setAvatar:v4];
}

void sub_A2DC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (v3)
  {
    [v2 ensureRenderer];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 16) avatar];
    double v5 = *(void **)(a1 + 32);

    if (v4 != v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      NSFileAttributeKey v7 = *(void **)(*(void *)(a1 + 40) + 16);
      [v7 setAvatar:v6];
    }
  }
  else
  {
    NSFileProtectionType v8 = [v2 quadView];
    [v8 discardContents];

    [*(id *)(*(void *)(a1 + 40) + 16) setAvatar:0];
    uint64_t v9 = *(void *)(a1 + 40);
    double v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = 0;
  }
}

id sub_A504(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) updateAtTime:*(double *)(a1 + 40)];
}

void sub_A67C(uint64_t a1)
{
}

void sub_A684(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "renderWithViewport:commandBuffer:passDescriptor:", *(void *)(a1 + 40), *(void *)(a1 + 48), 0.0, 0.0, *(double *)(*(void *)(a1 + 32) + 32), *(double *)(*(void *)(a1 + 32) + 40));
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A750;
  block[3] = &unk_28950;
  id v4 = *(id *)(a1 + 56);
  dispatch_async(v2, block);
}

intptr_t sub_A750(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  dispatch_time_t v2 = dispatch_time(0, 1000000000);

  return dispatch_group_wait(v1, v2);
}

__n128 sub_A890@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  switch((unint64_t)[a1 sizeClass])
  {
    case 3uLL:
      uint64_t v3 = &xmmword_26820;
      break;
    case 4uLL:
      uint64_t v3 = &xmmword_26850;
      break;
    case 5uLL:
    case 6uLL:
      uint64_t v3 = &xmmword_26880;
      break;
    case 7uLL:
      uint64_t v3 = &xmmword_268B0;
      break;
    case 8uLL:
      uint64_t v3 = &xmmword_268E0;
      break;
    default:
      uint64_t v3 = &xmmword_267F0;
      break;
  }
  long long v4 = v3[1];
  *(_OWORD *)a2 = *v3;
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = (__n128)v3[2];
  *(__n128 *)(a2 + 32) = result;
  return result;
}

void sub_AC64(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  double v5 = [a3 display];
  if ([v6 isEqualToString:NTKComplicationSlotDate])
  {
    [v5 setTextColor:*(void *)(a1 + 32)];
  }
  else if ([v6 isEqualToString:NTKComplicationSlotBottom])
  {
    [v5 setForegroundColor:*(void *)(a1 + 32)];
  }
}

void sub_B3B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_B3E8(uint64_t a1, int token)
{
  notify_cancel(token);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _didFirstUnlock];
    id WeakRetained = v4;
  }
}

void sub_B440(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _avatarStoreDidChange:v5];
  }
}

void sub_BC88(uint64_t a1)
{
  dispatch_time_t v2 = +[NTKCollieFaceBundle logObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1887C(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v11 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[16] == 1)
    {
      uint64_t v12 = (void *)WeakRetained[17];
      if (v12)
      {
        id v13 = v12;
      }
      else
      {
        id v14 = [WeakRetained device];
        id v13 = +[NTKCollieStyleEditOption defaultOptionForDevice:v14];
      }
      [v11 _transitionFromImageToAvatarForOption:v13 fromState:2];
    }
    v15 = +[NTKCollieFaceBundle logObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_18804(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

void sub_BF7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_BFA0(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained && !*(void *)(a3 + 24)) {
    [WeakRetained _topOfTheMinuteReached];
  }
}

void sub_C014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_C028(id a1)
{
  return (NSString *)@"Collie Second Activities";
}

void sub_C0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id sub_C408(void *a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  id v1 = a1;
  sub_A890(v1, (uint64_t)&v6);
  double v2 = *(double *)&v6;
  int v3 = NTKShowIndicScriptNumerals();

  if (!v3
    || (+[NTKSFCompactFont numericRoundedFontOfSize:v2 weight:UIFontWeightMedium], (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v4 = +[CLKFont systemFontOfSize:weight:design:](CLKFont, "systemFontOfSize:weight:design:", CLKRoundedFontDesignName, v2, UIFontWeightMedium, v6, v7, v8);
  }

  return v4;
}

void sub_C888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_C8A8(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 1) {
    return 0;
  }
  id v1 = +[CLKDevice currentDevice];
  if ([v1 isLocked]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = 2;
  }

  return v2;
}

void sub_C908(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [WeakRetained _transitionFromImageToAvatarForOption:*(void *)(a1 + 32) fromState:sub_C8A8(*(void *)(a1 + 48))];
  }
}

void sub_C96C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C9F0;
  block[3] = &unk_28C78;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_C9F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

NSString *_loadingTagFromStyleNameAndPoseType(uint64_t a1, uint64_t a2)
{
  return +[NSString stringWithFormat:@"%@-%u", a1, a2];
}

void sub_D830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_D84C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 loadingTag];
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if ((v5 & 1) == 0)
  {
    if (*(void *)(a1 + 40))
    {
      long long v6 = 0;
    }
    else
    {
      long long v6 = +[NTKCollieFaceImageView loadingImage];
    }
    [v3 setImage:v6];
    [v3 setLoadingTag:*(void *)(a1 + 32)];
  }
  return v5;
}

void sub_D8E4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D9E4;
    block[3] = &unk_28CF0;
    objc_copyWeak(v13, (id *)(a1 + 40));
    id v10 = v8;
    v13[1] = a4;
    id v11 = v7;
    id v12 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(v13);
  }
}

void sub_D9E4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = +[NSString stringWithFormat:@"%@-%u", *(void *)(a1 + 32), *(void *)(a1 + 64)];
    uint64_t v4 = [WeakRetained[6] loadingTag];
    unsigned int v5 = [v4 isEqualToString:v3];

    if (v5)
    {
      long long v6 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        [WeakRetained[6] timeIntervalSinceTagged];
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v7;
        __int16 v17 = 2048;
        uint64_t v18 = v8;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "loading fromSnapshotView image for styleName %@ after %.3fs", buf, 0x16u);
      }

      [WeakRetained[6] setImage:*(void *)(a1 + 40)];
    }
    uint64_t v9 = [WeakRetained[7] loadingTag];
    unsigned int v10 = [v9 isEqualToString:v3];

    if (v10)
    {
      id v11 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        [WeakRetained[7] timeIntervalSinceTagged];
        *(_DWORD *)buf = 138412546;
        uint64_t v16 = v12;
        __int16 v17 = 2048;
        uint64_t v18 = v13;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "loading toSnapshotView image for styleName %@ after %.3fs", buf, 0x16u);
      }

      [WeakRetained[7] setImage:*(void *)(a1 + 40)];
    }
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      (*(void (**)(void))(v14 + 16))();
    }
  }
}

void sub_E020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_E03C(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_E128;
    block[3] = &unk_28D40;
    objc_copyWeak(v9, v2);
    id v4 = *(id *)(a1 + 32);
    unsigned int v5 = *(void **)(a1 + 56);
    id v7 = v4;
    v9[1] = v5;
    __int16 v10 = *(_WORD *)(a1 + 64);
    id v8 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(v9);
  }
}

void sub_E128(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _asyncSetImageViewsForOption:*(void *)(a1 + 32) state:*(void *)(a1 + 56) resolveToyBox:*(unsigned __int8 *)(a1 + 64)];
    [v3 _transitionFromAvatarToImagePart3ForOption:*(void *)(a1 + 32) immediate:*(unsigned __int8 *)(a1 + 65) retainAvatar:*(unsigned __int8 *)(a1 + 64)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

void sub_E47C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_E4A0(id a1, NTKCollieFaceView *a2)
{
  avtView = a2->_avtView;
  uint64_t v3 = a2;
  [(CLKUIMetalQuadView *)avtView setAlpha:0.0];
  [(NTKCollieFaceImageView *)v3->_fromSnapshotView setAlpha:1.0];
  toSnapshotView = v3->_toSnapshotView;

  [(NTKCollieFaceImageView *)toSnapshotView setAlpha:0.0];
}

void sub_E518(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = v3;
  id v8 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    unsigned int v5 = [v3[17] isToybox];
    id v4 = v8;
    if (v5 && *((unsigned char *)v8 + 315))
    {
      [v8 _reloadToyBoxAvatar];
      [v8[6] setAlpha:0.0];
      [v8[7] setAlpha:1.0];
LABEL_8:
      id v4 = v8;
    }
  }
  else if (v3[16] != (char *)&dword_0 + 1 || *(unsigned char *)(a1 + 33))
  {
    [v3[3] setAvatar:0];
    id v6 = v8[29];
    v8[29] = 0;

    goto LABEL_8;
  }
  id v7 = [v4 contentView];
  [v7 bringSubviewToFront:v8[6]];
}

uint64_t sub_E644(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }

  return _objc_release_x1(WeakRetained, v3);
}

uint64_t sub_E6A4(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained && a2)
  {
    id v7 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v5 = v7;
  }

  return _objc_release_x1(WeakRetained, v5);
}

void sub_E8C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_E8E4(id a1, NTKCollieFaceView *a2)
{
  avtView = a2->_avtView;
  uint64_t v3 = a2;
  [(CLKUIMetalQuadView *)avtView setAlpha:1.0];
  [(NTKCollieFaceImageView *)v3->_fromSnapshotView setAlpha:0.0];
  toSnapshotView = v3->_toSnapshotView;

  [(NTKCollieFaceImageView *)toSnapshotView setAlpha:0.0];
}

void sub_E95C(id a1, NTKCollieFaceView *a2)
{
  id v2 = a2;
  id v4 = [(NTKCollieFaceView *)v2 contentView];
  avtView = v2->_avtView;

  [v4 bringSubviewToFront:avtView];
}

uint64_t sub_E9C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }

  return _objc_release_x1(WeakRetained, v3);
}

uint64_t sub_EA24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }

  return _objc_release_x1(WeakRetained, v3);
}

void sub_EB74(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained[3] renderer];
    objc_msgSend(v5, "ntk_configureForFramingModeWatchFace");
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6 == 1)
    {
      uint64_t v7 = [v4[17] sleepPose];
    }
    else
    {
      if (v6) {
        [v4[17] neutralPose];
      }
      else {
      uint64_t v7 = [v4[17] friendlyPose];
      }
    }
    id v8 = (void *)v7;
    uint64_t v9 = [v4[3] avatar];
    [v9 setPose:v8];

    id v10 = v4[2];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    void v11[2] = sub_ED08;
    v11[3] = &unk_28DC8;
    objc_copyWeak(&v13, v2);
    id v12 = *(id *)(a1 + 32);
    [v10 renderSynchronouslyWithImageQueueDiscard:1 inGroup:0 completion:v11];

    objc_destroyWeak(&v13);
  }
}

void sub_ECF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_ED08(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_EDB0;
  v2[3] = &unk_28DC8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

  objc_destroyWeak(&v4);
}

void sub_EDB0(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[16] == 1)
    {
      +[CATransaction begin];
      id v5 = (void *)v4[2];
      id v8 = _NSConcreteStackBlock;
      uint64_t v9 = 3221225472;
      id v10 = sub_EF8C;
      id v11 = &unk_28DC8;
      objc_copyWeak(&v13, v2);
      id v12 = *(id *)(a1 + 32);
      [v5 renderSynchronouslyWithImageQueueDiscard:1 inGroup:0 completion:&v8];
      +[CATransaction commit];

      objc_destroyWeak(&v13);
    }
    else
    {
      uint64_t v6 = +[NTKCollieFaceBundle logObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = v4[16];
        *(_DWORD *)buf = 136315650;
        v15 = "-[NTKCollieFaceView _restartRenderForAvatar:fromState:completion:]_block_invoke_3";
        __int16 v16 = 2048;
        __int16 v17 = v4;
        __int16 v18 = 1024;
        int v19 = v7;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%s(%p): while restarting render we changed to dataMode = %u, bailing", buf, 0x1Cu);
      }

      [v4 _unloadAvatar];
    }
  }
}

void sub_EF6C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_EF8C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_F034;
  v2[3] = &unk_28DC8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);

  objc_destroyWeak(&v4);
}

void sub_F034(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained[3] setPaused:0];
    [v4[2] setPaused:0];
    +[NSDate timeIntervalSinceReferenceDate];
    v4[36] = v3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v4;
  }
}

void sub_F3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_F3F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_F4C8;
  v6[3] = &unk_28E80;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_F4C8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      +[NTKCollieStyleEditOption invalidateCache];
      [v3[3] prewarmAvatar:*(void *)(a1 + 32)];
      id v4 = v3[2];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_F5B8;
      v5[3] = &unk_28AB0;
      v5[4] = v3;
      id v6 = *(id *)(a1 + 32);
      [v4 prewarmWithCompletion:v5];
    }
    else
    {
      *((unsigned char *)WeakRetained + 240) = 0;
    }
  }
}

void sub_F5B8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_F640;
  v2[3] = &unk_28AB0;
  id v1 = *(void **)(a1 + 40);
  void v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_F640(uint64_t a1)
{
  kdebug_trace();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 232);
  *(void *)(v2 + 232) = 0;

  [*(id *)(*(void *)(a1 + 32) + 24) setAvatar:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 240) = 0;
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 248);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_F92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_F948(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[NSDate timeIntervalSinceReferenceDate];
    WeakRetained[34] = v4;
    [WeakRetained _restartRenderForAvatar:v5 fromState:*(void *)(a1 + 48) completion:*(void *)(a1 + 32)];
  }
}

void sub_FC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_FC4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _startMachineFromState:*(void *)(a1 + 40)];
    [v3 _transitionFromImageToCurrentAvatarImmediate:*(unsigned char *)(a1 + 48) == 0];
    [v3 _reportStats];
    id WeakRetained = v3;
  }
}

uint64_t sub_105D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10724(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

double NTKCollieFaceTritiumContentBrightness()
{
  return 0.649999976;
}

double NTKCollieFaceTritiumTimeBrightness()
{
  return 0.649999976;
}

void sub_10758(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setBackgroundAlpha:*(void *)(a1 + 32) contentAlpha:*(double *)(a1 + 48) timeComplicationsColor:*(double *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

void sub_10960(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10984(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setBackgroundAlpha:*(void *)(a1 + 32) contentAlpha:*(double *)(a1 + 48) timeComplicationsColor:*(double *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

void sub_109DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setBackgroundAlpha:*(void *)(a1 + 32) contentAlpha:*(double *)(a1 + 56) timeComplicationsColor:*(double *)(a1 + 64)];
    [v3 _setBackgroundColor:*(void *)(a1 + 40) radiance:*(double *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

void sub_11448(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && [v5 isEqualToString:*(void *)(a1 + 32)]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_11770(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) userInfo];
  id v5 = [*(id *)(a1 + 48) resourceDirectory];
  id v6 = +[NTKCollieStyleEditOption changedOptionForOption:v3 avatarStoreChangedInfo:v4 resourceDirectory:v5];

  uint64_t v7 = sub_C8A8(*(void *)(*(void *)(a1 + 48) + 128));
  [*(id *)(a1 + 48) _transitionFromAvatarToImageForOption:v6 toState:v7 immediate:1 retainAvatar:0 forceImage:1];
  uint64_t v8 = *(void *)(a1 + 48);
  if (*(void *)(v8 + 128) != 3)
  {
    id v10 = [(id)v8 device];
    goto LABEL_5;
  }
  uint64_t v9 = (char *)[*(id *)(v8 + 8) mostRecentEditMode];
  id v10 = [*(id *)(a1 + 48) device];
  double v11 = 0.0;
  if (v9 != (unsigned char *)&dword_C + 3)
  {
LABEL_5:
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    sub_A890(v10, (uint64_t)&v13);
    double v11 = *(double *)&v14 * 0.5;
  }

  [*(id *)(*(void *)(a1 + 48) + 48) setVOffset:v11];
  [*(id *)(*(void *)(a1 + 48) + 56) setVOffset:v11];
  [*(id *)(a1 + 48) _unloadAvatar];
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 136), v6);
  uint64_t v12 = *(void *)(a1 + 48);
  if (v6 == *(void **)(a1 + 32))
  {
    if (*(void *)(v12 + 128) == 1) {
      [(id)v12 _transitionFromImageToAvatarForOption:v6 fromState:v7];
    }
  }
  else
  {
    [*(id *)(v12 + 8) selectOption:v6 forCustomEditMode:15 slot:0];
  }
}

void sub_11BAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_11BC8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

id NTKCollieColorAtIndex(unint64_t a1, uint64_t a2)
{
  uint64_t v3 = +[NTKCollieColorEditOption _orderedValuesForDevice:a2];
  if ((unint64_t)[v3 count] <= a1) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = a1;
  }
  id v5 = [v3 objectAtIndexedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

  return v6;
}

uint64_t sub_11DE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__orderedValuesForDevice:", a2);
  uint64_t v3 = qword_2F7C0;
  qword_2F7C0 = v2;

  return _objc_release_x1(v2, v3);
}

void sub_11FE0(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [*(id *)(a1 + 32) device];
  unint64_t v4 = +[NTKCollieColorEditOption _orderedValuesForDevice:v3];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v9);
        double v11 = objc_opt_class();
        id v12 = objc_msgSend(v10, "unsignedIntegerValue", (void)v17);
        long long v13 = [*(id *)(a1 + 32) device];
        long long v14 = [v11 _snapshotKeyForValue:v12 forDevice:v13];
        [v2 setObject:v14 forKeyedSubscript:v10];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  id v15 = [v2 copy];
  __int16 v16 = (void *)qword_2F7E0;
  qword_2F7E0 = (uint64_t)v15;
}

id sub_126C8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setDefaultLayoutRule:*(void *)(a1 + 40) forState:a2];
}

void sub_126D8(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) defaultLayoutRuleForState:a2];
  [v4 setVerticalLayout:3];
  [v4 setHorizontalLayout:1];
  [*(id *)(a1 + 32) setDefaultLayoutRule:v4 forState:a2];
  [v4 referenceFrame];
  CLKRectCenteredXInRectForDevice();
  objc_msgSend(v4, "setReferenceFrame:");
}

void sub_12970(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_12990(uint64_t a1, void *a2)
{
  uint64_t v3 = (CGContext *)[a2 CGContext];
  CGContextTranslateCTM(v3, 0.0, *(CGFloat *)(a1 + 56));
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextClipToMask(v3, *(CGRect *)(a1 + 64), (CGImageRef)[*(id *)(a1 + 32) CGImage]);
  [*(id *)(a1 + 40) setFill];
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 88);

  CGContextFillRect(v3, *(CGRect *)&v4);
}

void sub_131D4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 selectOption:v3 forCustomEditMode:15 slot:0];
  v10[0] = ntk_seasons_spring2015_pink;
  v10[1] = ntk_seasons_spring2015_purple;
  void v10[2] = ntk_seasons_spring2015_blue;
  v10[3] = ntk_seasons_spring2016_apricot;
  uint64_t v5 = +[NSArray arrayWithObjects:v10 count:4];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", arc4random() % (unint64_t)objc_msgSend(v5, "count"));
  uint64_t v7 = +[NTKPigmentEditOption pigmentNamed:v6];
  [v4 selectOption:v7 forCustomEditMode:10 slot:0];

  uint64_t v8 = +[NTKDateComplication complicationWithDateStyle:](NTKDateComplication, "complicationWithDateStyle:", [*(id *)(a1 + 48) _dateComplicationSlotSupportedStylesForDevice:*(void *)(a1 + 40)]);
  [v4 setComplication:v8 forSlot:NTKComplicationSlotDate];
  uint64_t v9 = +[NTKComplication anyComplicationOfType:10];

  [v4 setComplication:v9 forSlot:NTKComplicationSlotBottom];
}

void sub_14D6C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 40) + a3;
  id v5 = a2;
  id v7 = [objc_alloc((Class)NTKFaceBundleSortableGalleryFace) initWithFace:v5 priority:v4];

  uint64_t v6 = v7;
  if (v7)
  {
    [*(id *)(a1 + 32) addObject:v7];
    uint64_t v6 = v7;
  }
}

void sub_14EFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_15474(uint64_t a1)
{
  uint64_t v2 = +[NTKCollieStyleEditOption avatarRecordCache];
  uint64_t v3 = [v2 memojiIdentifiers];

  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_avtui_changedRecordIdentifiers");
  v7[0] = @"oldIDs";
  v7[1] = @"changedRecordIDs";
  v8[0] = v3;
  v8[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  [*(id *)(a1 + 40) invalidateCache];
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"NTKCollieAvatarStoreDidChangeNotification" object:0 userInfo:v5];
}

void sub_156AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v5[0] = @"oldIDs";
  v5[1] = @"changedRecordIDs";
  v6[0] = v2;
  v6[1] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  [*(id *)(a1 + 40) invalidateCache];
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"NTKCollieAvatarStoreDidChangeNotification" object:0 userInfo:v3];
}

void sub_15D18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_16084(id a1, NTKEditOption *a2)
{
  uint64_t v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [(NTKEditOption *)v2 styleName];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t sub_16EF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_172BC(uint64_t a1, void *a2, void *a3, uint64_t a4, double a5, double a6)
{
  id obj = a2;
  id v11 = a3;
  if (!(*(void *)(a1 + 56) | a4) && [*(id *)(a1 + 32) isEqualToString:v11]) {
    objc_storeWeak((id *)(*(void *)(a1 + 40) + 8), obj);
  }
  (*(void (**)(double, double))(*(void *)(a1 + 48) + 16))(a5, a6);
}

void sub_17C14(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "User not logged in", v1, 2u);
}

void sub_17C58(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_920C(&dword_0, a2, a3, "Unable to determine account security status, error = %@", a5, a6, a7, a8, 2u);
}

void sub_17CC4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "User needs iCloud security upgrade", v1, 2u);
}

void sub_17D08()
{
  sub_9244();
  sub_9278(&dword_0, v0, v1, "%s: encoding failed, error = %@", v2, v3, v4, v5, 2u);
}

void sub_17D7C()
{
  sub_9244();
  sub_9278(&dword_0, v0, v1, "%s: write failed, error = %@", v2, v3, v4, v5, 2u);
}

void sub_17DF0()
{
  sub_9244();
  sub_9278(&dword_0, v0, v1, "%s: unable to fetch custom avatars, error = %@", v2, v3, v4, v5, 2u);
}

void sub_17E64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_17EDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_17F54()
{
  sub_9244();
  sub_9278(&dword_0, v0, v1, "%s: Could not decode avatar recipe, error = %@", v2, v3, v4, v5, 2u);
}

void sub_17FC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_920C(&dword_0, a1, a3, "%s: shared memoji directory is invalid, directory = nil", a5, a6, a7, a8, 2u);
}

void sub_18040(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_180B8()
{
  int v2 = 136315650;
  sub_9228();
  sub_9258(&dword_0, v0, v1, "%s: Unabled to write data representation file %@, error = %@", v2);
}

void sub_1812C()
{
  int v2 = 136315650;
  sub_9228();
  sub_9258(&dword_0, v0, v1, "%s: Cannot create resource directory %@, error = %@", v2);
}

void sub_181A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1820C()
{
  sub_92B0();
  sub_92C8(&dword_0, v0, v1, "Unable to read bridge-memoji identifier from file %@, error = (%@)");
}

void sub_18274()
{
  int v2 = 136315650;
  sub_9228();
  sub_9258(&dword_0, v0, v1, "%s: Failed to write data representation file %@, error = %@", v2);
}

void sub_182E8()
{
  sub_92B0();
  sub_92C8(&dword_0, v0, v1, "Failed to write bridge-memoji identifier file %@, error = (%@)");
}

void sub_18350()
{
  int v2 = 136315650;
  sub_9228();
  sub_9258(&dword_0, v0, v1, "%s: Cannot create resource directory %@, error = %@", v2);
}

void sub_183C4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1843C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_184B4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1852C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_185A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1861C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_186A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1871C()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_18790()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_18804(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1887C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_188F4()
{
  v2[0] = 136315650;
  sub_11C08();
  __int16 v3 = v0;
  int v4 = 1;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "%s: unexpected live avatar transitioning from dataMode %u to %u", (uint8_t *)v2, 0x18u);
}

void sub_18980(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "-[NTKCollieFaceView _applyDataMode]";
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s: unexpected dataMode transition from %u to %u", (uint8_t *)&v4, 0x18u);
}

void sub_18A1C()
{
  v2[0] = 136315650;
  sub_11B98();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_0, v1, OS_LOG_TYPE_DEBUG, "%s(%p): dataMode = %u", (uint8_t *)v2, 0x1Cu);
}

void sub_18AAC()
{
  v1[0] = 136315394;
  sub_11C08();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s: mode = %u", (uint8_t *)v1, 0x12u);
}

void sub_18B2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18BA4()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_18C18(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedName];
  sub_11BE8();
  sub_11BC8(&dword_0, v3, v4, "%s(%p): loading avatar (characterStyle = %@)", v5, v6, v7, v8, 2u);
}

void sub_18CBC(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 localizedName];
  sub_11BE8();
  sub_11BC8(&dword_0, v3, v4, "%s(%p): avatar (characterStyle = %@) is good to go, skipping load", v5, v6, v7, v8, 2u);
}

void sub_18D60()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_18DD4()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_18E48()
{
  uint64_t v6 = LogBool();
  sub_11BC8(&dword_0, v0, v1, "%s(%p): start immediate=%@", v2, v3, v4, v5, 2u);
}

void sub_18F00()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_18F74()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_18FE8()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_1905C()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_190D0()
{
  sub_11B98();
  sub_11BAC(&dword_0, v0, v1, "%s(%p): start", v2, v3, v4, v5, 2u);
}

void sub_19144(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[NTKCollieFace _handleSharingMetadata:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s: unable to save shared face, error = %@", (uint8_t *)&v2, 0x16u);
}

void sub_191D0(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 styleName];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "recipe for bridge memoji '%@' is invalid, error = %@", (uint8_t *)&v6, 0x16u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

uint64_t CLKInterpolateBetweenFloatsClipped()
{
  return _CLKInterpolateBetweenFloatsClipped();
}

uint64_t CLKInterpolateBetweenFloatsUnclipped()
{
  return _CLKInterpolateBetweenFloatsUnclipped();
}

uint64_t CLKLocaleNumberSystemForFirstLanguage()
{
  return _CLKLocaleNumberSystemForFirstLanguage();
}

uint64_t CLKLocaleNumberSystemFromNumeralOption()
{
  return _CLKLocaleNumberSystemFromNumeralOption();
}

uint64_t CLKMapFractionIntoRange()
{
  return _CLKMapFractionIntoRange();
}

uint64_t CLKRectCenteredXInRectForDevice()
{
  return _CLKRectCenteredXInRectForDevice();
}

uint64_t CLKRoundForDevice()
{
  return _CLKRoundForDevice();
}

uint64_t CLKRunningInProcess()
{
  return _CLKRunningInProcess();
}

uint64_t LogBool()
{
  return _LogBool();
}

uint64_t NTKAllUtilityLargeNarrowComplicationTypes()
{
  return _NTKAllUtilityLargeNarrowComplicationTypes();
}

uint64_t NTKCacheDirectory()
{
  return _NTKCacheDirectory();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKColorByApplyingBlackOverlay()
{
  return _NTKColorByApplyingBlackOverlay();
}

uint64_t NTKComplicationSlotDescriptor()
{
  return _NTKComplicationSlotDescriptor();
}

uint64_t NTKComplicationTypeRankedListWithDefaultTypes()
{
  return _NTKComplicationTypeRankedListWithDefaultTypes();
}

uint64_t NTKEnumerateComplicationStates()
{
  return _NTKEnumerateComplicationStates();
}

uint64_t NTKFaceColorName()
{
  return _NTKFaceColorName();
}

uint64_t NTKInterpolateBetweenColors()
{
  return _NTKInterpolateBetweenColors();
}

uint64_t NTKIsDaemonOrFaceSnapshotService()
{
  return _NTKIsDaemonOrFaceSnapshotService();
}

uint64_t NTKIsFaceSnapshotService()
{
  return _NTKIsFaceSnapshotService();
}

uint64_t NTKNewUniqueTeporaryResourceDirectory()
{
  return _NTKNewUniqueTeporaryResourceDirectory();
}

uint64_t NTKNumeralOptionFromCLKLocaleNumberSystem()
{
  return _NTKNumeralOptionFromCLKLocaleNumberSystem();
}

uint64_t NTKShowIndicScriptNumerals()
{
  return _NTKShowIndicScriptNumerals();
}

uint64_t NTKStarbearEnabled()
{
  return _NTKStarbearEnabled();
}

uint64_t NTKWrappedDateComplicationType()
{
  return _NTKWrappedDateComplicationType();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint32_t arc4random(void)
{
  return _arc4random();
}

long double atan(long double __x)
{
  return _atan(__x);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

long double tan(long double __x)
{
  return _tan(__x);
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return [a1 CGContext];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__addCrownSequencer(void *a1, const char *a2, ...)
{
  return [a1 _addCrownSequencer];
}

id objc_msgSend__addSecondActivities(void *a1, const char *a2, ...)
{
  return [a1 _addSecondActivities];
}

id objc_msgSend__addTapGestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 _addTapGestureRecognizers];
}

id objc_msgSend__animalToyboxCharacters(void *a1, const char *a2, ...)
{
  return [a1 _animalToyboxCharacters];
}

id objc_msgSend__animojiIdentifiersCount(void *a1, const char *a2, ...)
{
  return [a1 _animojiIdentifiersCount];
}

id objc_msgSend__createTimeViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _createTimeViewIfNecessary];
}

id objc_msgSend__currentProcessNeedsToMonitorCloudSyncStatus(void *a1, const char *a2, ...)
{
  return [a1 _currentProcessNeedsToMonitorCloudSyncStatus];
}

id objc_msgSend__dateComplicationFont(void *a1, const char *a2, ...)
{
  return [a1 _dateComplicationFont];
}

id objc_msgSend__dateComplicationFrame(void *a1, const char *a2, ...)
{
  return [a1 _dateComplicationFrame];
}

id objc_msgSend__didFirstUnlock(void *a1, const char *a2, ...)
{
  return [a1 _didFirstUnlock];
}

id objc_msgSend__ensureMemojiAvatarRecords(void *a1, const char *a2, ...)
{
  return [a1 _ensureMemojiAvatarRecords];
}

id objc_msgSend__ensureMemojiAvatarRecordsReally(void *a1, const char *a2, ...)
{
  return [a1 _ensureMemojiAvatarRecordsReally];
}

id objc_msgSend__ensureMemojiManifest(void *a1, const char *a2, ...)
{
  return [a1 _ensureMemojiManifest];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__loadSharedViews(void *a1, const char *a2, ...)
{
  return [a1 _loadSharedViews];
}

id objc_msgSend__memojiAvatarRecords(void *a1, const char *a2, ...)
{
  return [a1 _memojiAvatarRecords];
}

id objc_msgSend__memojiIdentifiersCount(void *a1, const char *a2, ...)
{
  return [a1 _memojiIdentifiersCount];
}

id objc_msgSend__memojiManifest(void *a1, const char *a2, ...)
{
  return [a1 _memojiManifest];
}

id objc_msgSend__memojiManifestFilePath(void *a1, const char *a2, ...)
{
  return [a1 _memojiManifestFilePath];
}

id objc_msgSend__memojiManifestFileRecords(void *a1, const char *a2, ...)
{
  return [a1 _memojiManifestFileRecords];
}

id objc_msgSend__recomputeContentsRect(void *a1, const char *a2, ...)
{
  return [a1 _recomputeContentsRect];
}

id objc_msgSend__reloadToyBoxAvatar(void *a1, const char *a2, ...)
{
  return [a1 _reloadToyBoxAvatar];
}

id objc_msgSend__removeCrownSequencer(void *a1, const char *a2, ...)
{
  return [a1 _removeCrownSequencer];
}

id objc_msgSend__removeObservers(void *a1, const char *a2, ...)
{
  return [a1 _removeObservers];
}

id objc_msgSend__removeTapGestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 _removeTapGestureRecognizers];
}

id objc_msgSend__reportStats(void *a1, const char *a2, ...)
{
  return [a1 _reportStats];
}

id objc_msgSend__repositionCrownSequencer(void *a1, const char *a2, ...)
{
  return [a1 _repositionCrownSequencer];
}

id objc_msgSend__sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 _sharedInstance];
}

id objc_msgSend__sharedMemojiPreserveList(void *a1, const char *a2, ...)
{
  return [a1 _sharedMemojiPreserveList];
}

id objc_msgSend__shouldHideUI(void *a1, const char *a2, ...)
{
  return [a1 _shouldHideUI];
}

id objc_msgSend__snapshotImageSize(void *a1, const char *a2, ...)
{
  return [a1 _snapshotImageSize];
}

id objc_msgSend__status(void *a1, const char *a2, ...)
{
  return [a1 _status];
}

id objc_msgSend__stopSecondActivities(void *a1, const char *a2, ...)
{
  return [a1 _stopSecondActivities];
}

id objc_msgSend__topOfTheMinuteReached(void *a1, const char *a2, ...)
{
  return [a1 _topOfTheMinuteReached];
}

id objc_msgSend__toyboxAnimojiIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _toyboxAnimojiIdentifier];
}

id objc_msgSend__toyboxMemojiIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _toyboxMemojiIdentifier];
}

id objc_msgSend__toyboxResolvedPoseStyleName(void *a1, const char *a2, ...)
{
  return [a1 _toyboxResolvedPoseStyleName];
}

id objc_msgSend__unloadAvatar(void *a1, const char *a2, ...)
{
  return [a1 _unloadAvatar];
}

id objc_msgSend__unloadSharedViews(void *a1, const char *a2, ...)
{
  return [a1 _unloadSharedViews];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return [a1 accountStatus];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_animojiIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 animojiIdentifiers];
}

id objc_msgSend_animojiNames(void *a1, const char *a2, ...)
{
  return [a1 animojiNames];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return [a1 ascender];
}

id objc_msgSend_avatar(void *a1, const char *a2, ...)
{
  return [a1 avatar];
}

id objc_msgSend_avatarData(void *a1, const char *a2, ...)
{
  return [a1 avatarData];
}

id objc_msgSend_avatarFramingTopMargin(void *a1, const char *a2, ...)
{
  return [a1 avatarFramingTopMargin];
}

id objc_msgSend_avatarLoaderQueueSharedInstance(void *a1, const char *a2, ...)
{
  return [a1 avatarLoaderQueueSharedInstance];
}

id objc_msgSend_avatarRecordCache(void *a1, const char *a2, ...)
{
  return [a1 avatarRecordCache];
}

id objc_msgSend_avatarStore(void *a1, const char *a2, ...)
{
  return [a1 avatarStore];
}

id objc_msgSend_avatarStoreForWatch(void *a1, const char *a2, ...)
{
  return [a1 avatarStoreForWatch];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return [a1 camera];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_cloudSyncStatus(void *a1, const char *a2, ...)
{
  return [a1 cloudSyncStatus];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_completions(void *a1, const char *a2, ...)
{
  return [a1 completions];
}

id objc_msgSend_complicationContainerView(void *a1, const char *a2, ...)
{
  return [a1 complicationContainerView];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createFunCamEnvironment(void *a1, const char *a2, ...)
{
  return [a1 createFunCamEnvironment];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_discardContents(void *a1, const char *a2, ...)
{
  return [a1 discardContents];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_endCache(void *a1, const char *a2, ...)
{
  return [a1 endCache];
}

id objc_msgSend_ensureBridgeMemojiResources(void *a1, const char *a2, ...)
{
  return [a1 ensureBridgeMemojiResources];
}

id objc_msgSend_ensureRenderer(void *a1, const char *a2, ...)
{
  return [a1 ensureRenderer];
}

id objc_msgSend_faceColor(void *a1, const char *a2, ...)
{
  return [a1 faceColor];
}

id objc_msgSend_faceColorPalette(void *a1, const char *a2, ...)
{
  return [a1 faceColorPalette];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_friendlyPose(void *a1, const char *a2, ...)
{
  return [a1 friendlyPose];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interpolatedColorPalette(void *a1, const char *a2, ...)
{
  return [a1 interpolatedColorPalette];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateCache(void *a1, const char *a2, ...)
{
  return [a1 invalidateCache];
}

id objc_msgSend_invalidateDigitalTimeLabelStyle(void *a1, const char *a2, ...)
{
  return [a1 invalidateDigitalTimeLabelStyle];
}

id objc_msgSend_isAnyMemojiStyleName(void *a1, const char *a2, ...)
{
  return [a1 isAnyMemojiStyleName];
}

id objc_msgSend_isBridgeMemoji(void *a1, const char *a2, ...)
{
  return [a1 isBridgeMemoji];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isRegularAnimojiStyleName(void *a1, const char *a2, ...)
{
  return [a1 isRegularAnimojiStyleName];
}

id objc_msgSend_isRegularMemoji(void *a1, const char *a2, ...)
{
  return [a1 isRegularMemoji];
}

id objc_msgSend_isRegularMemojiStyleName(void *a1, const char *a2, ...)
{
  return [a1 isRegularMemojiStyleName];
}

id objc_msgSend_isResourcedStyleName(void *a1, const char *a2, ...)
{
  return [a1 isResourcedStyleName];
}

id objc_msgSend_isSharedMemoji(void *a1, const char *a2, ...)
{
  return [a1 isSharedMemoji];
}

id objc_msgSend_isSharedMemojiStyleName(void *a1, const char *a2, ...)
{
  return [a1 isSharedMemojiStyleName];
}

id objc_msgSend_isTinker(void *a1, const char *a2, ...)
{
  return [a1 isTinker];
}

id objc_msgSend_isToybox(void *a1, const char *a2, ...)
{
  return [a1 isToybox];
}

id objc_msgSend_isToyboxAnimojiStyleName(void *a1, const char *a2, ...)
{
  return [a1 isToyboxAnimojiStyleName];
}

id objc_msgSend_isToyboxAnyStyleName(void *a1, const char *a2, ...)
{
  return [a1 isToyboxAnyStyleName];
}

id objc_msgSend_isToyboxMemoji(void *a1, const char *a2, ...)
{
  return [a1 isToyboxMemoji];
}

id objc_msgSend_isToyboxMemojiStyleName(void *a1, const char *a2, ...)
{
  return [a1 isToyboxMemojiStyleName];
}

id objc_msgSend_isValidStyleName(void *a1, const char *a2, ...)
{
  return [a1 isValidStyleName];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutRule(void *a1, const char *a2, ...)
{
  return [a1 layoutRule];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listControllerThumbnailScope(void *a1, const char *a2, ...)
{
  return [a1 listControllerThumbnailScope];
}

id objc_msgSend_loadIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadIfNeeded];
}

id objc_msgSend_loadingImage(void *a1, const char *a2, ...)
{
  return [a1 loadingImage];
}

id objc_msgSend_loadingTag(void *a1, const char *a2, ...)
{
  return [a1 loadingTag];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_logObject(void *a1, const char *a2, ...)
{
  return [a1 logObject];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_memojiIdentifier(void *a1, const char *a2, ...)
{
  return [a1 memojiIdentifier];
}

id objc_msgSend_memojiIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 memojiIdentifiers];
}

id objc_msgSend_mostRecentEditMode(void *a1, const char *a2, ...)
{
  return [a1 mostRecentEditMode];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_neutralPose(void *a1, const char *a2, ...)
{
  return [a1 neutralPose];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nrDeviceVersion(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceVersion];
}

id objc_msgSend_numeralOption(void *a1, const char *a2, ...)
{
  return [a1 numeralOption];
}

id objc_msgSend_physicalizedPose(void *a1, const char *a2, ...)
{
  return [a1 physicalizedPose];
}

id objc_msgSend_pose(void *a1, const char *a2, ...)
{
  return [a1 pose];
}

id objc_msgSend_poseType(void *a1, const char *a2, ...)
{
  return [a1 poseType];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_quadView(void *a1, const char *a2, ...)
{
  return [a1 quadView];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return [a1 referenceFrame];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_renderer(void *a1, const char *a2, ...)
{
  return [a1 renderer];
}

id objc_msgSend_requestForCustomAvatars(void *a1, const char *a2, ...)
{
  return [a1 requestForCustomAvatars];
}

id objc_msgSend_resourceDirectory(void *a1, const char *a2, ...)
{
  return [a1 resourceDirectory];
}

id objc_msgSend_rootContainerView(void *a1, const char *a2, ...)
{
  return [a1 rootContainerView];
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return [a1 rootNode];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return [a1 scene];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_sha1String(void *a1, const char *a2, ...)
{
  return [a1 sha1String];
}

id objc_msgSend_sharedDevice(void *a1, const char *a2, ...)
{
  return [a1 sharedDevice];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_sleepPose(void *a1, const char *a2, ...)
{
  return [a1 sleepPose];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_styleName(void *a1, const char *a2, ...)
{
  return [a1 styleName];
}

id objc_msgSend_supportedComplicationSlots(void *a1, const char *a2, ...)
{
  return [a1 supportedComplicationSlots];
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return [a1 supportsDeviceToDeviceEncryption];
}

id objc_msgSend_switcherSnapshotView(void *a1, const char *a2, ...)
{
  return [a1 switcherSnapshotView];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeIntervalSinceTagged(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceTagged];
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return [a1 timeView];
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 unlockedSinceBoot];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}