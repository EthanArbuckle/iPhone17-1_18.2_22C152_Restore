void sub_5764(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CGAffineTransform *v6;
  void *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;

  if (([*(id *)(*(void *)(a1 + 32) + 8) isEqualToNumber:&off_6B240] & 1) != 0
    || [*(id *)(*(void *)(a1 + 32) + 8) isEqualToNumber:&off_6B258])
  {
    v2 = [*(id *)(a1 + 32) layer];
    v3 = v2;
    if (v2) {
      [v2 affineTransform];
    }
    else {
      memset(&v12, 0, sizeof(v12));
    }
    CGAffineTransformScale(&v13, &v12, -1.0, 1.0);
    v4 = [*(id *)(a1 + 32) layer];
    v5 = v4;
    v11 = v13;
    v6 = &v11;
  }
  else
  {
    v7 = [*(id *)(a1 + 32) layer];
    v3 = v7;
    if (v7) {
      [v7 affineTransform];
    }
    else {
      memset(&v9, 0, sizeof(v9));
    }
    CGAffineTransformScale(&v10, &v9, 1.0, -1.0);
    v4 = [*(id *)(a1 + 32) layer];
    v5 = v4;
    v8 = v10;
    v6 = &v8;
  }
  objc_msgSend(v4, "setAffineTransform:", v6, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx, *(void *)&v9.a, *(void *)&v9.b, *(void *)&v9.c, *(void *)&v9.d, *(void *)&v9.tx, *(void *)&v9.ty);
}

void sub_5920(uint64_t a1)
{
  memset(&v38, 0, sizeof(v38));
  if ([*(id *)(*(void *)(a1 + 32) + 8) isEqualToNumber:&off_6B240])
  {
    long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v37.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v37.c = v2;
    *(_OWORD *)&v37.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v38, &v37, -1.57079633);
    v3 = *(_DWORD **)(a1 + 32);
    int v4 = v3[4];
    if (v4 == 2)
    {
      CGAffineTransform v37 = v38;
      CGAffineTransformScale(&v34, &v37, -1.0, -1.0);
      v5 = [v3 layer];
      v6 = v5;
      CGAffineTransform v33 = v34;
      v7 = &v33;
    }
    else
    {
      CGAffineTransform v37 = v38;
      if (v4 == 1)
      {
        CGAffineTransformScale(&v36, &v37, 1.0, 1.0);
        v5 = [v3 layer];
        v6 = v5;
        CGAffineTransform v35 = v36;
        v7 = &v35;
      }
      else
      {
        CGAffineTransformScale(&v32, &v37, -1.0, 1.0);
        v5 = [v3 layer];
        v6 = v5;
        CGAffineTransform v31 = v32;
        v7 = &v31;
      }
    }
  }
  else if ([*(id *)(*(void *)(a1 + 32) + 8) isEqualToNumber:&off_6B270])
  {
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v37.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v37.c = v8;
    *(_OWORD *)&v37.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v38, &v37, 3.14159265);
    v9 = *(_DWORD **)(a1 + 32);
    int v10 = v9[4];
    if (v10)
    {
      if (v10 != 2) {
        return;
      }
      CGAffineTransform v37 = v38;
      CGAffineTransformScale(&v30, &v37, 1.0, 1.0);
      v5 = [v9 layer];
      v6 = v5;
      CGAffineTransform v29 = v30;
      v7 = &v29;
    }
    else
    {
      CGAffineTransform v37 = v38;
      CGAffineTransformScale(&v28, &v37, -1.0, 1.0);
      v5 = [v9 layer];
      v6 = v5;
      CGAffineTransform v27 = v28;
      v7 = &v27;
    }
  }
  else
  {
    unsigned int v11 = [*(id *)(*(void *)(a1 + 32) + 8) isEqualToNumber:&off_6B258];
    long long v12 = *(_OWORD *)&CGAffineTransformIdentity.c;
    if (v11)
    {
      *(_OWORD *)&v37.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v37.c = v12;
      *(_OWORD *)&v37.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
      CGAffineTransformRotate(&v38, &v37, 1.57079633);
      v13 = *(_DWORD **)(a1 + 32);
      int v14 = v13[4];
      if (v14 == 2)
      {
        CGAffineTransform v37 = v38;
        CGAffineTransformScale(&v24, &v37, -1.0, -1.0);
        v5 = [v13 layer];
        v6 = v5;
        CGAffineTransform v23 = v24;
        v7 = &v23;
      }
      else
      {
        CGAffineTransform v37 = v38;
        if (v14 == 1)
        {
          CGAffineTransformScale(&v26, &v37, 1.0, 1.0);
          v5 = [v13 layer];
          v6 = v5;
          CGAffineTransform v25 = v26;
          v7 = &v25;
        }
        else
        {
          CGAffineTransformScale(&v22, &v37, -1.0, 1.0);
          v5 = [v13 layer];
          v6 = v5;
          CGAffineTransform v21 = v22;
          v7 = &v21;
        }
      }
    }
    else
    {
      *(_OWORD *)&v37.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v37.c = v12;
      *(_OWORD *)&v37.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
      CGAffineTransformRotate(&v38, &v37, 0.0);
      v15 = *(_DWORD **)(a1 + 32);
      int v16 = v15[4];
      if (v16)
      {
        if (v16 != 1) {
          return;
        }
        CGAffineTransform v37 = v38;
        CGAffineTransformScale(&v20, &v37, -1.0, -1.0);
        v5 = [v15 layer];
        v6 = v5;
        CGAffineTransform v19 = v20;
        v7 = &v19;
      }
      else
      {
        CGAffineTransform v37 = v38;
        CGAffineTransformScale(&v18, &v37, -1.0, 1.0);
        v5 = [v15 layer];
        v6 = v5;
        CGAffineTransform v17 = v18;
        v7 = &v17;
      }
    }
  }
  objc_msgSend(v5, "setAffineTransform:", v7, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
}

void *sub_5E34(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  switch(result[3])
  {
    case 1:
      result = _[result applyTransformForPortrait];
      break;
    case 2:
      result = _[result applyTransformationForPortraitUpsideDown];
      break;
    case 3:
      result = _[result applyTransformationForLandscapeLeft];
      break;
    case 4:
      result = _[result applyTransformationForLandscapeRight];
      break;
    default:
      return result;
  }
  return result;
}

id sub_80A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_970C()
{
  [v0 alpha];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9790;
  v4[3] = &unk_68F70;
  v4[4] = v1;
  long long v2 = objc_retainBlock(v4);

  return v2;
}

id sub_9790(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

id sub_9B28()
{
  [v0 alpha];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_9BAC;
  v4[3] = &unk_68F70;
  v4[4] = v1;
  long long v2 = objc_retainBlock(v4);

  return v2;
}

id sub_9BAC(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

id RPCCUIBundle()
{
  return +[NSBundle bundleWithIdentifier:@"com.apple.replaykit.VideoConferenceControlCenterModule"];
}

id sub_BDB8(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 32) effectsDidUpdate];
}

void sub_C52C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id sub_D174(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 121))
  {
    [*(id *)(v2 + 40) addObject:*(void *)(v2 + 136)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 123))
  {
    [*(id *)(v2 + 40) addObject:*(void *)(v2 + 152)];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 125)) {
    [*(id *)(v2 + 40) addObject:*(void *)(v2 + 144)];
  }
  int v3 = _os_feature_enabled_impl();
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 127))
  {
    int v5 = *(unsigned char *)(v4 + 129) ? v3 : 0;
    if (v5 == 1)
    {
      [*(id *)(v4 + 40) addObject:*(void *)(v4 + 160)];
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  [*(id *)(v4 + 48) removeAllObjects];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 40);
  id v7 = [v6 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v44;
    uint64_t v10 = AVControlCenterVideoEffectCenterStage;
    uint64_t v11 = AVControlCenterVideoEffectBackgroundBlur;
    uint64_t v39 = AVControlCenterVideoEffectReactions;
    uint64_t v40 = AVControlCenterVideoEffectStudioLighting;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        int v14 = objc_msgSend(v13, "activityIdentifier", v39);
        if ([v14 isEqualToString:v10])
        {
          int v15 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 120);

          if (v15) {
            goto LABEL_35;
          }
        }
        else
        {
        }
        int v16 = [v13 activityIdentifier];
        if ([v16 isEqualToString:v11])
        {
          int v17 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 122);

          if (v17) {
            goto LABEL_35;
          }
        }
        else
        {
        }
        CGAffineTransform v18 = [v13 activityIdentifier];
        if ([v18 isEqualToString:v40])
        {
          int v19 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 124);

          if (v19)
          {
            CGAffineTransform v20 = [*(id *)(*(void *)(a1 + 32) + 144) _effect];
            CGAffineTransform v21 = v20;
            CFStringRef v22 = @"cube.fill";
LABEL_34:
            [v20 setSymbolImageName:v22];

LABEL_35:
            [*(id *)(*(void *)(a1 + 32) + 48) addObject:v13];
            continue;
          }
        }
        else
        {
        }
        CGAffineTransform v23 = [v13 activityIdentifier];
        if ([v23 isEqualToString:v39])
        {
          uint64_t v24 = *(void *)(a1 + 32);
          if (*(unsigned char *)(v24 + 126))
          {
            int v25 = *(unsigned __int8 *)(v24 + 128);

            if (!v25) {
              continue;
            }
            CGAffineTransform v20 = [*(id *)(*(void *)(a1 + 32) + 160) _effect];
            CGAffineTransform v21 = v20;
            CFStringRef v22 = @"plus.bubble.tapback.fill";
            goto LABEL_34;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v8);
  }

  CGAffineTransform v26 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    CGAffineTransform v27 = *(void **)(a1 + 32);
    CGAffineTransform v28 = v26;
    CGAffineTransform v29 = [v27 description];
    uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 40);
    *(_DWORD *)buf = 138543618;
    v48 = v29;
    __int16 v49 = 2112;
    uint64_t v50 = v30;
    _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] availableActivies=%@", buf, 0x16u);
  }
  CGAffineTransform v31 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    CGAffineTransform v32 = *(void **)(a1 + 32);
    CGAffineTransform v33 = v31;
    CGAffineTransform v34 = [v32 description];
    uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 48);
    *(_DWORD *)buf = 138543618;
    v48 = v34;
    __int16 v49 = 2112;
    uint64_t v50 = v35;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] activeActivies=%@", buf, 0x16u);
  }
  [*(id *)(a1 + 32) _checkCenterStageAvailability];
  CGAffineTransform v36 = *(void **)(a1 + 32);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_D630;
  v42[3] = &unk_68FB8;
  v42[4] = v36;
  [v36 _enumerateObserversRespondingToSelector:"activeActivityDidChangeForManager:" usingBlock:v42];
  CGAffineTransform v37 = *(void **)(a1 + 32);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_D6A0;
  v41[3] = &unk_68FB8;
  v41[4] = v37;
  return [v37 _enumerateObserversRespondingToSelector:"activeModeDidChangeForManager:" usingBlock:v41];
}

void sub_D630(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
    sub_4A324();
  }
  [v3 activeActivityDidChangeForManager:*(void *)(a1 + 32)];
}

void sub_D6A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
    sub_4A3F0(a1, v4, (uint64_t)v3);
  }
  [v3 activeModeDidChangeForManager:*(void *)(a1 + 32)];
}

id sub_DBC4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  id v3 = [v2 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v27;
    uint64_t v6 = AVControlCenterVideoEffectCenterStage;
    uint64_t v7 = AVControlCenterVideoEffectBackgroundBlur;
    uint64_t v23 = AVControlCenterVideoEffectStudioLighting;
    uint64_t v22 = AVControlCenterVideoEffectReactions;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "activityIdentifier", v22);
        if ([v10 isEqualToString:v6])
        {
          int v11 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 120);

          if (v11) {
            goto LABEL_21;
          }
        }
        else
        {
        }
        long long v12 = [v9 activityIdentifier];
        if ([v12 isEqualToString:v7])
        {
          int v13 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 122);

          if (v13) {
            goto LABEL_21;
          }
        }
        else
        {
        }
        int v14 = [v9 activityIdentifier];
        if ([v14 isEqualToString:v23])
        {
          int v15 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 124);

          if (v15) {
            goto LABEL_21;
          }
        }
        else
        {
        }
        int v16 = [v9 activityIdentifier];
        if ([v16 isEqualToString:v22])
        {
          uint64_t v17 = *(void *)(a1 + 32);
          if (*(unsigned char *)(v17 + 126))
          {
            int v18 = *(unsigned __int8 *)(v17 + 128);

            if (!v18) {
              continue;
            }
LABEL_21:
            [*(id *)(*(void *)(a1 + 32) + 48) addObject:v9];
            continue;
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v4);
  }

  int v19 = *(void **)(a1 + 32);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_DEA0;
  v25[3] = &unk_68FB8;
  v25[4] = v19;
  [v19 _enumerateObserversRespondingToSelector:"activeActivityDidChangeForManager:" usingBlock:v25];
  CGAffineTransform v20 = *(void **)(a1 + 32);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_DF10;
  v24[3] = &unk_68FB8;
  v24[4] = v20;
  return [v20 _enumerateObserversRespondingToSelector:"activeModeDidChangeForManager:" usingBlock:v24];
}

void sub_DEA0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
    sub_4A324();
  }
  [v3 activeActivityDidChangeForManager:*(void *)(a1 + 32)];
}

void sub_DF10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
    sub_4A3F0(a1, v4, (uint64_t)v3);
  }
  [v3 activeModeDidChangeForManager:*(void *)(a1 + 32)];
}

id sub_E0E8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_E160;
  v3[3] = &unk_68FB8;
  v3[4] = v1;
  return [v1 _enumerateObserversRespondingToSelector:"externalCameraDidChangeForManager:" usingBlock:v3];
}

void sub_E160(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 description];
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] observer of external camera change", (uint8_t *)&v8, 0xCu);
  }
  [v3 externalCameraDidChangeForManager:*(void *)(a1 + 32)];
}

id sub_E4B4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_E52C;
  v3[3] = &unk_68FB8;
  v3[4] = v1;
  return [v1 _enumerateObserversRespondingToSelector:"externalCameraDidChangeForManager:" usingBlock:v3];
}

void sub_E52C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    uint64_t v7 = [v5 description];
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying observer of external camera change", (uint8_t *)&v8, 0xCu);
  }
  [v3 externalCameraDidChangeForManager:*(void *)(a1 + 32)];
}

void sub_E7F4(id a1)
{
  uint64_t v1 = [RPCCActivityManager alloc];
  id v5 = +[NSBundle mainBundle];
  id v2 = [v5 bundleIdentifier];
  id v3 = [(RPCCActivityManager *)v1 _initWithIdentifier:v2];
  id v4 = (void *)qword_7DD80;
  qword_7DD80 = (uint64_t)v3;
}

BOOL sub_E9A4(id a1, RPCCActivityDescribing *a2, unint64_t a3, BOOL *a4)
{
  if (([(RPCCActivityDescribing *)a2 isPlaceholder] & 1) == 0) {
    *a4 = 0;
  }
  return 0;
}

void sub_EC58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_ECDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_F3A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_F444(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
    sub_4A68C(a1, v4, (uint64_t)v3);
  }
  [v3 availableActivitiesDidChangeForManager:*(void *)(a1 + 32)];
}

void sub_F6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_F728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_F84C(uint64_t a1, void *a2)
{
  id v3 = [a2 activityUniqueIdentifier];
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_FA10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_FA2C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  unsigned int v3 = [*(id *)(*(void *)(a1 + 40) + 48) containsObject:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(*(void *)(a1 + 40) + 48);
  if (v3)
  {
    [v5 removeObject:v4];
    uint64_t v6 = [*(id *)(a1 + 32) activityIdentifier];
    unsigned int v7 = [v6 isEqualToString:AVControlCenterVideoEffectStudioLighting];

    if (v7)
    {
      int v8 = [v2 _effect];
      uint64_t v9 = v8;
      CFStringRef v10 = @"cube";
LABEL_10:
      [v8 setSymbolImageName:v10];

      goto LABEL_11;
    }
    int v13 = [*(id *)(a1 + 32) activityIdentifier];
    unsigned int v14 = [v13 isEqualToString:AVControlCenterVideoEffectReactions];

    if (v14)
    {
      int v8 = [v2 _effect];
      uint64_t v9 = v8;
      CFStringRef v10 = @"plus.bubble.tapback";
      goto LABEL_10;
    }
  }
  else
  {
    [v5 addObject:v4];
    int v11 = [*(id *)(a1 + 32) activityIdentifier];
    unsigned int v12 = [v11 isEqualToString:AVControlCenterVideoEffectStudioLighting];

    if (v12)
    {
      int v8 = [v2 _effect];
      uint64_t v9 = v8;
      CFStringRef v10 = @"cube.fill";
      goto LABEL_10;
    }
    int v15 = [*(id *)(a1 + 32) activityIdentifier];
    unsigned int v16 = [v15 isEqualToString:AVControlCenterVideoEffectReactions];

    if (v16)
    {
      int v8 = [v2 _effect];
      uint64_t v9 = v8;
      CFStringRef v10 = @"plus.bubble.tapback.fill";
      goto LABEL_10;
    }
  }
LABEL_11:
  uint64_t v17 = *(void **)(a1 + 40);
  int v18 = [*(id *)(a1 + 32) activityIdentifier];
  [v17 setState:v3 ^ 1 forActivity:v18];

  int v19 = *(void **)(a1 + 40);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_FC94;
  v22[3] = &unk_68FB8;
  v22[4] = v19;
  [v19 _enumerateObserversRespondingToSelector:"activeActivityDidChangeForManager:" usingBlock:v22];
  CGAffineTransform v20 = *(void **)(a1 + 40);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_FD04;
  v21[3] = &unk_68FB8;
  v21[4] = v20;
  [v20 _enumerateObserversRespondingToSelector:"activeModeDidChangeForManager:" usingBlock:v21];
}

void sub_FC94(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
    sub_4A324();
  }
  [v3 activeActivityDidChangeForManager:*(void *)(a1 + 32)];
}

void sub_FD04(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
    sub_4A3F0(a1, v4, (uint64_t)v3);
  }
  [v3 activeModeDidChangeForManager:*(void *)(a1 + 32)];
}

uint64_t sub_10154(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)RPCCLogActivities;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = v4;
    unsigned int v7 = [v5 description];
    int v9 = 138543618;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Toggle activity: %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _updateActiveActivity:v3];

  return 1;
}

void sub_10300(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)RPCCLogActivities, OS_LOG_TYPE_DEBUG)) {
    sub_4A7F0();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) copyWithZone:0];
  [v3 activityManager:v4 lifetimeDescriptionsDidChangeForActivity:v5];
}

void sub_10858(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_11268(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x16u);
}

void sub_11288(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_debug_impl(a1, v11, OS_LOG_TYPE_DEBUG, a4, &buf, 0x20u);
}

id sub_112D0(uint64_t a1, void *a2)
{
  return a2;
}

void sub_112E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_11308(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_11328()
{
  return v0;
}

uint64_t sub_11334()
{
  return v0;
}

id sub_11340(uint64_t a1, void *a2)
{
  return a2;
}

void sub_11448(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

double sub_12CD0(void *a1, unint64_t a2, uint64_t a3, int a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15 = a1;
  unsigned int v16 = v15;
  if (a3)
  {
    [v15 scaledValueForValue:35.0];
    double v18 = v17;
    [v16 scaledValueForValue:6.0];
    double x = v18 * (double)a2 - v19 * (double)a2;
    if (a4)
    {
      v36.origin.double x = a5;
      v36.origin.y = a6;
      v36.size.width = a7;
      v36.size.height = a8;
      double x = CGRectGetMaxX(v36) - x - v18;
    }
  }
  else
  {
    if (a2 == 2)
    {
      [v15 scaledValueForValue:15.0];
      double v26 = v25;
      v39.origin.double x = a5;
      v39.origin.y = a6;
      v39.size.width = a7;
      v39.size.height = a8;
      double MinX = CGRectGetMinX(v39);
      double v28 = 25.0;
      if (a4) {
        double v28 = 19.0;
      }
      [v16 scaledValueForValue:v28];
      double v30 = MinX + v29;
      [v16 scaledValueForValue:4.0];
      double x = v30 + v31 * 0.5 - v26 * 0.5;
      v40.origin.double x = a5;
      v40.origin.y = a6;
      v40.size.width = a7;
      v40.size.height = a8;
      CGRectGetMinY(v40);
      [v16 scaledValueForValue:3.0];
      [v16 scaledValueForValue:25.0];
      double v24 = 2.0;
    }
    else if (a2 == 1)
    {
      [v15 scaledValueForValue:19.0];
      v41.origin.double x = a5;
      v41.origin.y = a6;
      v41.size.width = a7;
      v41.size.height = a8;
      double x = CGRectGetMinX(v41);
      if ((a4 & 1) == 0)
      {
        [v16 scaledValueForValue:25.0];
        double v33 = x + v32;
        [v16 scaledValueForValue:4.0];
        double x = v33 + v34;
      }
      v42.origin.double x = a5;
      v42.origin.y = a6;
      v42.size.width = a7;
      v42.size.height = a8;
      CGRectGetMinY(v42);
      double v24 = 8.0;
    }
    else
    {
      if (a2)
      {
        double x = CGRectZero.origin.x;
        goto LABEL_17;
      }
      [v15 scaledValueForValue:25.0];
      v37.origin.double x = a5;
      v37.origin.y = a6;
      v37.size.width = a7;
      v37.size.height = a8;
      double x = CGRectGetMinX(v37);
      if (a4)
      {
        [v16 scaledValueForValue:19.0];
        double v22 = x + v21;
        [v16 scaledValueForValue:4.0];
        double x = v22 + v23;
      }
      v38.origin.double x = a5;
      v38.origin.y = a6;
      v38.size.width = a7;
      v38.size.height = a8;
      CGRectGetMinY(v38);
      double v24 = 3.0;
    }
    [v16 scaledValueForValue:v24];
  }
LABEL_17:

  return x;
}

void sub_1512C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_15168(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [v4 preferredContentSizeCategory];

  uint64_t v6 = [WeakRetained traitCollection];
  unsigned int v7 = [v6 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8)
  {
    int v9 = [WeakRetained _activityListView];
    [v9 adjustForContentSizeCategoryChange];
  }
}

void sub_15228(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[8] availableActivities];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_152E0;
    v4[3] = &unk_69088;
    v4[4] = v2;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

id sub_152E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureActivityListViewWithAvailableActivities:*(void *)(a1 + 40)];
}

void sub_1537C(uint64_t a1)
{
  if (SBSGetScreenLockStatus() == 1)
  {
    uint64_t v2 = RPCCUILogSelection;
    if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "CMCaptureFrameReceiver: device is locked", buf, 2u);
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15458;
    block[3] = &unk_68F10;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_15458(uint64_t a1)
{
  uint64_t v2 = +[CMCaptureFrameReceiver availableFrameSenderEndpointsByPID];
  id v3 = RPCCUILogSelection;
  if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v32 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "CMCaptureFrameReceiver: available endpoints: %@", buf, 0xCu);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        memset(v24, 0, sizeof(v24));
        __int16 v11 = [v4 objectForKeyedSubscript:v10];
        if ([v11 countByEnumeratingWithState:v24 objects:v29 count:16])
        {
          id v12 = **((id **)&v24[0] + 1);

          unsigned int v7 = v12;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);

    if (v7)
    {
      int v13 = RPCCUILogSelection;
      if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = *(void **)(*(void *)(a1 + 32) + 32);
        *(_DWORD *)buf = 138412290;
        double v32 = v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "CMCaptureFrameReceiver: _applicationBundleID: %@", buf, 0xCu);
      }
      id v15 = RPCCUILogSelection;
      if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v32 = v7;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "CMCaptureFrameReceiver: endpoint: %@", buf, 0xCu);
      }
      id v16 = objc_alloc((Class)CMCaptureFrameReceiver);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_157C4;
      v23[3] = &unk_69150;
      v23[4] = *(void *)(a1 + 32);
      id v17 = [v16 initWithFrameSenderServerEndpoint:v7 frameReceiverHandler:v23];
      uint64_t v18 = *(void *)(a1 + 32);
      double v19 = *(void **)(v18 + 16);
      *(void *)(v18 + 16) = v17;

      CGAffineTransform v20 = RPCCUILogSelection;
      if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
      {
        double v21 = *(void **)(*(void *)(a1 + 32) + 16);
        *(_DWORD *)buf = 138412290;
        double v32 = v21;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "CMCaptureFrameReceiver created frameReceiver: %@", buf, 0xCu);
      }
    }
  }
  else
  {

    unsigned int v7 = 0;
  }
  double v22 = RPCCUILogSelection;
  if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "CMCaptureFrameReceiver: done", buf, 2u);
  }
}

void sub_157C4(uint64_t a1, uint64_t a2, int a3)
{
  if (a2 && a3)
  {
    id v4 = [*(id *)(a1 + 32) _activityListView];
    [v4 enqueueSampleBuffer:a2];
  }
}

void sub_158E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_15984;
    v2[3] = &unk_69178;
    v2[4] = WeakRetained;
    BOOL v3 = SBSGetScreenLockStatus() != 0;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  }
}

void sub_15984(uint64_t a1)
{
  uint64_t v2 = *(unsigned char *)(a1 + 40) == 0;
  BOOL v3 = [*(id *)(a1 + 32) _activityListView];
  id v4 = [v3 headerView];
  [v4 setShouldCreateVideoPreview:v2];

  LODWORD(v2) = *(unsigned __int8 *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) _activityListView];
  id v6 = v5;
  if (v2) {
    [v5 removeVideoView];
  }
  else {
    [v5 addVideoView];
  }
}

void sub_15D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_15D2C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[8] availableActivities];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_15DE4;
    v4[3] = &unk_69088;
    v4[4] = v2;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

id sub_15DE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureActivityListViewWithAvailableActivities:*(void *)(a1 + 40)];
}

id sub_161DC(uint64_t a1, void *a2)
{
  id v3 = [a2 activityUniqueIdentifier];
  id v4 = [*(id *)(a1 + 32) activityUniqueIdentifier];
  id v5 = [v3 isEqual:v4];

  return v5;
}

void sub_1697C(uint64_t a1)
{
  uint64_t v2 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = (uint64_t *)(a1 + 32);
  v13[0] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v13[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v14[0] = &__kCFBooleanTrue;
  v14[1] = &__kCFBooleanTrue;
  v13[2] = FBSOpenApplicationOptionKeyLaunchOrigin;
  v14[2] = @"FCUIAppLaunchOriginActivityPicker";
  id v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  id v10 = 0;
  unsigned int v6 = [v2 openSensitiveURL:v4 withOptions:v5 error:&v10];
  id v7 = v10;

  uint64_t v8 = RPCCUILogSelection;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *v3;
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Launched URL %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_ERROR))
  {
    sub_4A960(v3, (uint64_t)v7, v8);
  }
}

void sub_16ED8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_16F7C;
  v3[3] = &unk_69088;
  v3[4] = WeakRetained;
  id v4 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_16F7C(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1713C;
  v7[3] = &unk_691C8;
  objc_copyWeak(&v8, &location);
  uint64_t v2 = +[UIAction actionWithHandler:v7];
  id v3 = +[RPCCUIActivityPickerEducationCardView defaultEducationCardViewWithDismissAction:v2];

  id v4 = +[UIAction actionWithHandler:&stru_69208];
  [v3 setDefaultAction:v4];

  [*(id *)(a1 + 40) setHeaderView:v3];
  [*(id *)(a1 + 32) _setConfiguringEducationCard:0];
  [*(id *)(a1 + 32) _updatePreferredContentSize];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_172B4;
  v5[3] = &unk_68F10;
  id v6 = *(id *)(a1 + 40);
  +[UIView rpccui_animateWithDefaultParameters:v5 completion:0];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void sub_1711C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1713C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController Activity picker education view dismiss action triggered: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissHeader];
}

void sub_17208(id a1, UIAction *a2)
{
  uint64_t v2 = a2;
  id v3 = RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "RPCCUIActivityPickerViewController Activity picker education view default action triggered: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

id sub_172B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void sub_178C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v23 - 88));
  _Unwind_Resume(a1);
}

void sub_17918(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = RPCCUILogSelection;
  if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEBUG)) {
    sub_4A9EC((uint64_t)v5, (uint64_t)v3, v6);
  }
  id v7 = [v3 sender];
  [v7 value];
  int v9 = v8;
  id v10 = [WeakRetained _activityManager];
  __int16 v11 = [v3 identifier];
  LODWORD(v12) = v9;
  [v10 setIntensity:v11 forActivityIdentifier:v12];
}

void sub_17A00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = RPCCUILogSelection;
  if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEBUG)) {
    sub_4AA74((uint64_t)WeakRetained, v3);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_alloc_init(_FCCCAnimator);
  id v6 = objc_alloc_init((Class)_UIViewControllerTransitionContext);
  id v7 = [v4 view];
  [v6 _setContainerView:v7];

  [v6 _setAnimator:v5];
  int v8 = [v6 _transitionCoordinator];
  int v9 = [v4 _activityListView];
  [v9 toggleExpandedActivityView:WeakRetained withTransitionCoordinator:v8];

  [(_FCCCAnimator *)v5 animateTransition:v6];
  [v4 _updatePreferredContentSize];
}

void sub_17F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  objc_destroyWeak((id *)(v31 - 248));
  _Unwind_Resume(a1);
}

uint64_t sub_17FB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_17FC0(uint64_t a1)
{
}

void sub_17FC8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 activityUniqueIdentifier];
  int v8 = [*(id *)(a1 + 32) activityUniqueIdentifier];
  int v9 = BSEqualObjects();

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_18078(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = RPCCUILogSelection;
  if (os_log_type_enabled((os_log_t)RPCCUILogSelection, OS_LOG_TYPE_DEBUG)) {
    sub_4AAEC((uint64_t)WeakRetained, v3);
  }
  unsigned int v4 = [WeakRetained isPlaceholder];
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = v5;
  if (v4)
  {
    [v5 _openSetupUI:WeakRetained];
  }
  else
  {
    id v7 = [v5 _activityManager];
    int v8 = [v7 activeActivities];
    unsigned int v9 = [v8 containsObject:*(void *)(a1 + 32)];

    id v10 = [WeakRetained menuView];
    [v10 updateMenuItemViewWithState:v9 ^ 1];

    __int16 v11 = [v6 _activityManager];
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = +[NSString stringWithFormat:@"Activity control tapped: %@", WeakRetained];
    [v11 setActivity:v12 active:0 reason:v13];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_18214;
    block[3] = &unk_68F10;
    id v15 = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_18214(uint64_t a1)
{
  return _[*(id *)(a1 + 32) updateActivityIconImageView];
}

uint64_t sub_183F8(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return (uint64_t)_objc_msgSend(v3, "__runAlongsideAnimations");
  }
  return result;
}

id sub_1844C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) completeTransition:a2];
}

void FCUIRegisterLogging()
{
  if (qword_7DD90 != -1) {
    dispatch_once(&qword_7DD90, &stru_69330);
  }
}

void sub_18490(id a1)
{
  os_log_t v1 = os_log_create("com.apple.replaykitccui", "Selection");
  uint64_t v2 = (void *)RPCCUILogSelection;
  RPCCUILogSelection = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.replaykitccui", "Module");
  unsigned int v4 = (void *)RPCCUILogModule;
  RPCCUILogModule = (uint64_t)v3;

  RPCCUILogDiscovery = (uint64_t)os_log_create("com.apple.replaykitccui", "Discovery");

  _objc_release_x1();
}

id sub_1896C(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(*(void *)(a1 + 32) + 8) _setCornerRadius:CGRectGetHeight(*(CGRect *)(a1 + 40)) * 0.5];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);

  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

id sub_18E9C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:1];
}

id sub_18F18(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:0];
}

uint64_t sub_1A294(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  double v4 = [v2 activityIdentifier];
  double v5 = [v3 activityIdentifier];

  uint64_t v6 = BSEqualObjects();
  return v6;
}

id sub_1A304(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void sub_1A310(uint64_t a1, uint64_t a2, void *a3, double a4, double a5)
{
  unsigned int v9 = a3;
  if (*(double *)(a1 + 32) <= 0.0)
  {
    if (!v9) {
      goto LABEL_9;
    }
    id v15 = v9;
    v9[2]();
  }
  else
  {
    if (a2 <= 0) {
      double v10 = 0.0;
    }
    else {
      double v10 = a4 + a5 * (double)a2;
    }
    id v15 = v9;
    id v11 = objc_alloc((Class)UIViewPropertyAnimator);
    double v12 = *(double *)(a1 + 32);
    id v13 = objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 38.0, 0.0, 0.0);
    id v14 = [v11 initWithDuration:v13 timingParameters:v12];

    [v14 addAnimations:v15];
    [v14 startAnimationAfterDelay:v10];
  }
  unsigned int v9 = v15;
LABEL_9:
}

void sub_1A418(uint64_t a1)
{
  uint64_t v2 = _NSConcreteStackBlock;
  uint64_t v3 = 3221225472;
  double v4 = sub_1A4CC;
  double v5 = &unk_69088;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  +[UIView performWithoutAnimation:&v2];
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0, v2, v3, v4, v5);
}

void sub_1A4CC(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) objectForKey:v1];
  [v2 CGRectValue];
  objc_msgSend(v1, "setFrame:");
}

id sub_1A524(uint64_t a1)
{
  return +[UIView _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:*(void *)(a1 + 32) options:0 animations:0.0 completion:0.0];
}

void sub_1A75C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id sub_1A774(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "sizeThatFitsCollapsedToPill:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id sub_1A790(uint64_t a1, double a2, double a3)
{
  CGFloat v5 = CGRectGetWidth(*(CGRect *)(a1 + 48)) / a2;
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  CGAffineTransformMakeScale(&v15, v5, Height / a3);
  id v7 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  long long v8 = *(_OWORD *)&v15.tx;
  long long v9 = *(_OWORD *)&v15.a;
  v7[3] = *(_OWORD *)&v15.c;
  void v7[4] = v8;
  v7[2] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  long long v10 = *(_OWORD *)(a1 + 96);
  long long v13 = *(_OWORD *)(a1 + 80);
  long long v14 = v10;
  v12[2] = sub_1A874;
  v12[3] = &unk_69358;
  v12[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v12];
}

id sub_1A874(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) _invalidateContentSize];
  id v2 = *(void **)(a1 + 32);

  return _[v2 layoutSubviews];
}

void sub_1A8C0(_OWORD *a1, void *a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8)
{
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1AA4C;
  v26[3] = &unk_69418;
  id v15 = a2;
  id v27 = v15;
  double v29 = a5;
  double v30 = a6;
  double v31 = a7;
  double v32 = a8;
  long long v16 = a1[2];
  long long v33 = a1[3];
  long long v34 = a1[4];
  long long v28 = v16;
  id v17 = a4;
  +[UIView performWithoutAnimation:v26];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1AAEC;
  v20[3] = &unk_69358;
  id v21 = v15;
  double v22 = a5;
  double v23 = a6;
  double v24 = a7;
  double v25 = a8;
  uint64_t v18 = (void (*)(void *, uint64_t, void *, double, double))v17[2];
  id v19 = v15;
  v18(v17, a3, v20, 0.045, 0.025);
}

id sub_1AA4C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "convertRect:fromView:", 0, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  UIRectCenteredIntegralRectScale();
  [v2 setFrame:0];
  uint64_t v3 = *(void **)(a1 + 32);
  double v4 = *(_OWORD **)(*(void *)(a1 + 48) + 8);
  long long v5 = v4[3];
  v7[0] = v4[2];
  v7[1] = v5;
  v7[2] = v4[4];
  [v3 setTransform:v7];
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_1AAEC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v2 setTransform:v5];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

double sub_1AC60(uint64_t a1)
{
  return *(double *)(a1 + 48);
}

id sub_1AC68(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1ACF0;
  v3[3] = &unk_69358;
  v3[4] = *(void *)(a1 + 32);
  long long v1 = *(_OWORD *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 40);
  long long v5 = v1;
  return +[UIView performWithoutAnimation:v3];
}

id sub_1ACF0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) _invalidateContentSize];
  [*(id *)(*(void *)(a1 + 32) + 8) setNeedsLayout];
  id v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

void sub_1AD50(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v23 = a2;
  double v24 = a4;
  if (a3 >= 1)
  {
    a11 = *(double *)(a1 + 48);
    a12 = *(double *)(a1 + 56);
  }
  objc_msgSend(v23, "setFrame:", a9, a10, a11, a12);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1AF70;
  v36[3] = &unk_68F10;
  id v25 = v23;
  id v37 = v25;
  +[UIView performWithoutAnimation:v36];
  if (a3 >= 1)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1AF7C;
    v30[3] = &unk_69358;
    id v31 = v25;
    double v32 = a5;
    double v33 = a6;
    double v34 = a7;
    double v35 = a8;
    v24[2](v24, a3, v30, 0.045, 0.025);
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1AF90;
  v28[3] = &unk_68F10;
  id v29 = v25;
  long long v26 = v24[2];
  id v27 = v25;
  v26(v24, a3, v28, 0.115, 0.025);
}

id sub_1AF70(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_1AF7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id sub_1AF90(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_1B25C(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateContentSize];
  id v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t sub_1BDE8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  long long v4 = [v2 activityIdentifier];
  long long v5 = [v3 activityIdentifier];

  uint64_t v6 = BSEqualObjects();
  return v6;
}

id sub_1C30C(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v1 setTransform:v4];
}

id sub_1C34C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setContentDetached:0];
}

id sub_1C82C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:0.0];
}

id sub_1C934(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setAlpha:0.0];
}

id sub_1CA3C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setAlpha:0.0];
}

id sub_1CD1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_1D6A0(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void sub_1DE6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  if (v4)
  {
    long long v5 = [v4 objectForKey:v3];
    [v5 CGRectValue];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *(double *)(a1 + 48);
    double v9 = *(double *)(a1 + 56);
    double v11 = *(double *)(a1 + 64);
    double v13 = *(double *)(a1 + 72);
  }
  long long v14 = (void *)RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    v31.origin.double x = v7;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v13;
    long long v16 = NSStringFromCGRect(v31);
    *(_DWORD *)buf = 138412290;
    double v30 = v16;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView activityListView layoutSubviews frame=%@", buf, 0xCu);
  }
  id v17 = [v3 superview];
  uint64_t v18 = *(void **)(a1 + 40);

  if (v17 == v18)
  {
    objc_msgSend(v3, "setFrame:", v7, v9, v11, v13);
  }
  else
  {
    [*(id *)(a1 + 40) addSubview:v3];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1E0D4;
    v23[3] = &unk_69358;
    id v19 = v3;
    id v24 = v19;
    double v25 = v7;
    double v26 = v9;
    double v27 = v11;
    double v28 = v13;
    +[UIView performWithoutAnimation:v23];
    [v19 setAlpha:1.0];
  }
  CGAffineTransform v20 = (void *)RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v20;
    [v3 frame];
    double v22 = NSStringFromCGRect(v32);
    *(_DWORD *)buf = 138412290;
    double v30 = v22;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "FCUIActivityListContentView activityListView layoutSubviews end frame=%@", buf, 0xCu);
  }
}

id sub_1E0D4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

id sub_1E118(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

id sub_1E888(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) enqueueSampleBuffer:*(void *)(a1 + 40)];
}

void sub_1EBB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1EBE0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1EED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1EEEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1EEFC(uint64_t a1)
{
}

void sub_1EF04(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  id v9 = a2;
  if (v9)
  {
    id v10 = v9;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v9 = v10;
    *a6 = 1;
  }
}

void sub_1F100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1F118(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  id v9 = a2;
  if (v9)
  {
    id v10 = v9;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v9 = v10;
    *a6 = 1;
  }
}

id sub_1FB48(uint64_t a1)
{
  long long v1 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v2;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v1 setTransform:v4];
}

id sub_1FB94(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id sub_1FBB4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v2 = *(void **)(*(void *)(a1 + 32) + 160);

  return [v2 layoutIfNeeded];
}

id sub_1FC08(uint64_t a1)
{
  long long v1 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

id sub_1FDD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_20090(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureDetailLabelIfNecessary];
  [*(id *)(*(void *)(a1 + 32) + 40) setText:*(void *)(a1 + 40)];
  long long v2 = *(void **)(*(void *)(a1 + 32) + 40);

  return [v2 setAlpha:0.0];
}

void sub_202F4(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    id v3 = objc_getAssociatedObject(*(id *)(a1 + 32), &unk_7DD98);
    unsigned int v4 = [v3 isEqual:*(void *)(a1 + 40)];

    if (v4)
    {
      [*(id *)(*(void *)(a1 + 32) + 8) setClipsToBounds:0];
      long long v5 = *(void **)(a1 + 32);
      objc_setAssociatedObject(v5, &unk_7DD98, 0, (char *)&dword_0 + 1);
    }
  }
}

void sub_2055C(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    id v3 = objc_getAssociatedObject(*(id *)(a1 + 32), &unk_7DD98);
    unsigned int v4 = [v3 isEqual:*(void *)(a1 + 40)];

    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32) + 96;
      CGSize size = CGRectZero.size;
      *(CGPoint *)uint64_t v5 = CGRectZero.origin;
      *(CGSize *)(v5 + 16) = size;
      [*(id *)(*(void *)(a1 + 32) + 8) setClipsToBounds:0];
      [*(id *)(a1 + 32) _setTextLayoutDisabled:0];
      double v7 = *(void **)(a1 + 32);
      objc_setAssociatedObject(v7, &unk_7DD98, 0, (char *)&dword_0 + 1);
    }
  }
}

double sub_22730(double *a1, void *a2)
{
  uint64_t v2 = *(void *)(*((void *)a1 + 4) + 80);
  double v3 = a1[5];
  double v4 = a1[6];
  double v5 = a1[7];
  double v6 = a1[8];
  id v7 = a2;
  objc_msgSend(v7, "rpccui_measuringHeightWithNumberOfLines:", objc_msgSend(v7, "rpccui_numberOfLinesInFrame:maximum:drawingContext:", 0, v2, v3, v4, v5, v6));
  double v9 = v8;

  return v9;
}

id sub_22FD0(uint64_t a1)
{
  id v2 = objc_alloc((Class)UIView);
  [*(id *)(a1 + 32) bounds];
  id v3 = objc_msgSend(v2, "initWithFrame:");
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 16);
  if (*(void *)(v6 + 8)) {
    +[UIColor systemBackgroundColor];
  }
  else {
  double v8 = +[UIColor labelColor];
  }
  [v7 setBackgroundColor:v8];

  double v9 = [*(id *)(a1 + 32) layer];
  CALayerCornerCurve v10 = [v9 cornerCurve];

  double v11 = *(void **)(a1 + 32);
  double v12 = (void *)v11[2];
  if (v10 == kCACornerCurveContinuous)
  {
    [v11 _continuousCornerRadius];
    objc_msgSend(v12, "_setContinuousCornerRadius:");
  }
  else
  {
    [v11 _cornerRadius];
    objc_msgSend(v12, "_setCornerRadius:");
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (*(void *)(v13 + 8) == 2)
  {
    long long v14 = [*(id *)(v13 + 16) layer];
    [v14 setShadowPathIsBounds:1];
    LODWORD(v15) = 1036831949;
    [v14 setShadowOpacity:v15];
    objc_msgSend(v14, "setShadowOffset:", 0.0, 4.0);
    [v14 setShadowRadius:15.0];

    uint64_t v13 = *(void *)(a1 + 32);
  }
  [*(id *)(v13 + 16) setAlpha:0.0];
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 16)];
  long long v16 = *(void **)(*(void *)(a1 + 32) + 16);

  return [v16 setAutoresizingMask:18];
}

id sub_24AA4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void sub_24AC4(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 48) containsObject:v11])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_24BD8;
    void v13[3] = &unk_69358;
    id v12 = v11;
    id v14 = v12;
    double v15 = a3;
    double v16 = a4;
    double v17 = a5;
    double v18 = a6;
    +[UIView performWithoutAnimation:v13];
    [v12 setAlpha:1.0];
  }
  else
  {
    objc_msgSend(v11, "setFrame:", a3, a4, a5, a6);
  }
}

id sub_24BD8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:0.0];
}

id sub_24C20(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void RPCCRegisterLogging()
{
  if (qword_7DDA0 != -1) {
    dispatch_once(&qword_7DDA0, &stru_69608);
  }
}

void sub_26F08(id a1)
{
  os_log_t v1 = os_log_create("com.apple.replaykitccui", "Activities");
  uint64_t v2 = RPCCLogActivities;
  RPCCLogActivities = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_26FA0(id a1)
{
  uint64_t v1 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  uint64_t v2 = qword_7DDA8;
  qword_7DDA8 = v1;

  _objc_release_x1(v1, v2);
}

void sub_27AE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_27B00(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setExpanded:*(unsigned __int8 *)(a1 + 40)];
  }
}

double sub_28ED8(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8, uint64_t a9, CGFloat *a10, CGFloat *a11)
{
  CGRectGetWidth(*(CGRect *)&a1);
  BSRectWithSize();
  double v30 = a8;
  UIRectCenteredIntegralRect();
  double v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  double v25 = v24;
  CGFloat v29 = a2;
  v31.origin.double x = a1;
  v31.origin.y = a2;
  CGFloat v26 = v19;
  v31.size.width = a3;
  v31.size.height = a4;
  double Height = CGRectGetHeight(v31);
  v32.origin.double x = v26;
  v32.origin.y = v21;
  v32.size.width = v23;
  v32.size.height = v25;
  if (Height / CGRectGetHeight(v32) < 1.0)
  {
    CGFloat v26 = a1;
    CGFloat v21 = v29;
    CGFloat v23 = a3;
    double v25 = a4;
  }
  *a11 = v26;
  a11[1] = v21;
  a11[2] = v23;
  a11[3] = v30;
  v33.origin.double x = v26;
  v33.origin.y = v21;
  v33.size.width = v23;
  v33.size.height = v25;
  a11[1] = CGRectGetMaxY(v33) - a11[3];
  *a10 = v26;
  a10[1] = v21;
  a10[2] = v23;
  a10[3] = v25;
  double result = v25 - a11[3];
  a10[3] = result;
  return result;
}

id sub_29004(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  UIRectIntegralWithScale();
  objc_msgSend(v2, "setFrame:");
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  UIRectIntegralWithScale();
  objc_msgSend(v3, "setFrame:");
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  UIRectIntegralWithScale();

  return objc_msgSend(v4, "setFrame:");
}

id sub_29148()
{
  [v0 alpha];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_291CC;
  _OWORD v4[3] = &unk_68F70;
  v4[4] = v1;
  uint64_t v2 = objc_retainBlock(v4);

  return v2;
}

id sub_291CC(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

void sub_29EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_29F28(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  double v5 = [v4 preferredContentSizeCategory];

  uint64_t v6 = [WeakRetained traitCollection];
  id v7 = [v6 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8) {
    [WeakRetained[5] adjustForContentSizeCategoryChange];
  }
}

void sub_29FE4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCameraState];
  [*(id *)(a1 + 32) _updatePreviouslyActiveActivity:*(void *)(*(void *)(a1 + 32) + 64)];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  if (*(unsigned char *)(v2 + 144)) {
    CCUIExpandedModuleContinuousCornerRadius();
  }
  else {
    CCUICompactModuleContinuousCornerRadius();
  }
  objc_msgSend(v3, "_setContinuousCornerRadius:");
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 144)) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  [*(id *)(v4 + 16) setAlpha:v5];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) view];
  id v8 = v6;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 144)) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  [v6 setAlpha:v7];
}

id sub_2A4C4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCameraState];
  [*(id *)(a1 + 32) _updatePreviouslyActiveActivity:*(void *)(*(void *)(a1 + 32) + 64)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateActiveActivities];
}

id sub_2A5F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreviouslyActiveActivity:0];
}

void sub_2A718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2A734(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained[8];
    if (!v3) {
      id v3 = WeakRetained[10];
    }
    uint64_t v50 = WeakRetained;
    id v4 = v3;
    if (*((unsigned char *)v50 + 144))
    {
      double v5 = *(void **)(a1 + 32);
      BSRectWithSize();
      objc_msgSend(v5, "_activityPickerExpandedFrameForBounds:");
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      id v14 = [v50[2] superview];
      double v15 = [v50[6] view];
      double v16 = [v15 superview];
      objc_msgSend(v14, "convertRect:toView:", v16, *((double *)v50 + 12), *((double *)v50 + 13), *((double *)v50 + 14), *((double *)v50 + 15));
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;

      objc_msgSend(v50[6], "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:", v4, 0, *(void *)(a1 + 40), v7, v9, v11, v13, v18, v20, v22, v24);
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      id v33 = v50[2];
      double v34 = [v33 superview];
      objc_msgSend(v34, "convertRect:fromView:", 0, v26, v28, v30, v32);
      objc_msgSend(v33, "setFrame:");
    }
    else
    {
      double v35 = [v50[2] superview];
      CGRect v36 = [v50[6] view];
      id v37 = [v36 superview];
      objc_msgSend(v35, "convertRect:toView:", v37, *((double *)v50 + 12), *((double *)v50 + 13), *((double *)v50 + 14), *((double *)v50 + 15));
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;

      objc_msgSend(v50[6], "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:", v4, 0, *(void *)(a1 + 40), v39, v41, v43, v45);
      objc_msgSend(v50[2], "setFrame:", *((double *)v50 + 12), *((double *)v50 + 13), *((double *)v50 + 14), *((double *)v50 + 15));
    }
    id v46 = v50[3];
    if (*((unsigned char *)v50 + 144)) {
      CCUIExpandedModuleContinuousCornerRadius();
    }
    else {
      CCUICompactModuleContinuousCornerRadius();
    }
    objc_msgSend(v46, "_setContinuousCornerRadius:");
    if (*((unsigned char *)v50 + 144)) {
      double v47 = 0.0;
    }
    else {
      double v47 = 1.0;
    }
    [v50[2] setAlpha:v47];
    v48 = [v50[6] view];
    if (*((unsigned char *)v50 + 144)) {
      double v49 = 1.0;
    }
    else {
      double v49 = 0.0;
    }
    [v48 setAlpha:v49];

    id WeakRetained = v50;
  }
}

void sub_2AF54(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2AF68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) activeActivity];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_2B01C;
    _OWORD v4[3] = &unk_69088;
    v4[4] = WeakRetained;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  }
}

id sub_2B01C(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateActiveActivity:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _updateActiveActivities];
}

void sub_2B15C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2B170(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2B20C;
    block[3] = &unk_696F8;
    char v5 = 0;
    void block[4] = WeakRetained;
    id v4 = 0;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_2B20C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 145) = *(unsigned char *)(a1 + 48);
  return _[*(id *)(a1 + 32) _updateSuggestedActivity:*(void *)(a1 + 40)];
}

void sub_2B324(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2B5F4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

uint64_t sub_2C6C8()
{
  uint64_t v2 = 0;
  id v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = qword_7DDB8;
  uint64_t v5 = qword_7DDB8;
  if (!qword_7DDB8)
  {
    long long v6 = *(_OWORD *)off_69718;
    long long v7 = *(_OWORD *)&off_69728;
    v3[3] = _sl_dlopen();
    qword_7DDB8 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_2C7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2C7F0(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_7DDB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2C880()
{
  uint64_t v0 = sub_2C6C8();
  if (!v0)
  {
    uint64_t v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id sub_2C8DC()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_7DDC0;
  uint64_t v7 = qword_7DDC0;
  if (!qword_7DDC0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_2C9C0;
    v3[3] = &unk_69768;
    v3[4] = &v4;
    sub_2C9C0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2C9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_2C9C0(uint64_t a1)
{
  sub_2C880();
  Class result = objc_getClass("MTMaterialView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_4B0D8();
  }
  qword_7DDC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2CA18()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_7DDC8;
  uint64_t v7 = qword_7DDC8;
  if (!qword_7DDC8)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_2CAFC;
    v3[3] = &unk_69768;
    v3[4] = &v4;
    sub_2CAFC((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2CAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_2CAFC(uint64_t a1)
{
  sub_2C880();
  Class result = objc_getClass("MTVisualStylingProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_4B100();
  }
  qword_7DDC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2CB54()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_7DDD0;
  uint64_t v7 = qword_7DDD0;
  if (!qword_7DDD0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_2CC38;
    v3[3] = &unk_69768;
    v3[4] = &v4;
    sub_2CC38((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2CC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_2CC38(uint64_t a1)
{
  sub_2C880();
  Class result = objc_getClass("UIView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_4B128();
  }
  qword_7DDD0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_2D398(uint64_t a1)
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)RPCCUIActivityPickerEducationCardView;
  objc_msgSendSuper2(&v4, "layoutSubviews");
  [*(id *)(a1 + 32) _updateTextAttributesIfNecessary];
  uint64_t v2 = *(void **)(a1 + 32);
  [v2 bounds];
  objc_msgSend(v2, "_layoutSubviewInBounds:measuringOnly:", 0);
  return +[CATransaction commit];
}

id sub_2F700(uint64_t a1)
{
  [*(id *)(a1 + 32) setupInitialModuleState];
  [*(id *)(a1 + 32) layoutVideoConferenceSubviews];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateVideoButtonConstraints];
}

id sub_306C8(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutVideoConferenceSubviews];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateVideoButtonConstraints];
}

uint64_t sub_32D50()
{
  return 0;
}

void sub_32D58()
{
  sub_33424();
  id v1 = v0;
  oslog = sub_4B570();
  os_log_type_t v2 = sub_4B3B0();
  if (os_log_type_enabled(oslog, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)id v3 = 136315138;
    uint64_t v10 = v4;
    uint64_t v5 = (id *)&v1[OBJC_IVAR____TtC34VideoConferenceControlCenterModule31VideoEffectsControlCenterModule_contentModuleContext];
    swift_beginAccess();
    id v6 = *v5;
    sub_33ABC(&qword_7D7D8);
    uint64_t v7 = sub_4B310();
    sub_33464(v7, v8, &v10);
    sub_4B580();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, oslog, v2, "set content module context: %s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void *sub_32F24()
{
  id v1 = (void **)(v0
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule31VideoEffectsControlCenterModule_contentModuleContext);
  swift_beginAccess();
  os_log_type_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_32F74(void *a1)
{
  id v3 = (void **)(v1
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule31VideoEffectsControlCenterModule_contentModuleContext);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint8_t *v3 = a1;
  id v5 = a1;

  sub_32D58();
}

void (*sub_32FE0(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_33040;
}

void sub_33040(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_32D58();
  }
}

void sub_33074(void *a1)
{
  id v3 = (void **)(v1
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule31VideoEffectsControlCenterModule_contentModuleContext);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint8_t *v3 = a1;
  id v5 = a1;

  sub_32D58();
}

void *sub_3316C(void *a1)
{
  uint64_t v2 = v1;
  type metadata accessor for VideoEffectsViewController();
  uint64_t v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  BOOL v5 = a1 && ![a1 environment];
  (*(void (**)(BOOL))((char *)&stru_108.flags + (swift_isaMask & *v4)))(v5);
  id v6 = (void **)(v2
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule31VideoEffectsControlCenterModule_contentModuleContext);
  swift_beginAccess();
  uint64_t v7 = *v6;
  unint64_t v8 = *(void (**)(void *))&stru_158.segname[(swift_isaMask & *v4) - 8];
  id v9 = v7;
  v8(v7);
  return v4;
}

id sub_332F4()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_33328()
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule31VideoEffectsControlCenterModule_contentModuleContext] = 0;
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, "init");
}

id sub_333B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VideoEffectsControlCenterModule()
{
  return self;
}

unint64_t sub_33424()
{
  unint64_t result = qword_7D7D0;
  if (!qword_7D7D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_7D7D0);
  }
  return result;
}

uint64_t sub_33464(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_33538(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_33B50((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_33B50((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_33B00((uint64_t)v12);
  return v7;
}

uint64_t sub_33538(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_4B590();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_336F4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_4B5F0();
  if (!v8)
  {
    sub_4B680();
    __break(1u);
LABEL_17:
    uint64_t result = sub_4B6F0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_336F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_3378C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_3396C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_3396C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_3378C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_33904(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_4B5D0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_4B680();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_4B330();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_4B6F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_4B680();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_33904(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_33ABC((uint64_t *)&unk_7D7E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  _OWORD v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_3396C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_33ABC((uint64_t *)&unk_7D7E0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  double v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_4B6F0();
  __break(1u);
  return result;
}

uint64_t sub_33ABC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_33B00(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_33B50(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_33BB0()
{
  uint64_t v0 = sub_4B210();
  sub_42130(v0, qword_7DDE8);
  sub_40BC0(v0, (uint64_t)qword_7DDE8);
  return sub_4B200();
}

uint64_t sub_33C34(uint64_t result)
{
  return result;
}

BOOL sub_33C3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_33C50()
{
  Swift::UInt v1 = *v0;
  sub_4B740();
  sub_4B750(v1);
  return sub_4B760();
}

void sub_33C98()
{
  sub_4B750(*v0);
}

Swift::Int sub_33CC4()
{
  Swift::UInt v1 = *v0;
  sub_4B740();
  sub_4B750(v1);
  return sub_4B760();
}

unint64_t sub_33D08@<X0>(unint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_40708(*a1);
  *a2 = result;
  return result;
}

void sub_33D34(void *a1@<X8>)
{
  *a1 = *v1;
}

CGFloat sub_33D40()
{
  return CGSizeZero.width;
}

double sub_33D50()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule16VideoEffectsView_controlSize;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_33D98(double a1, double a2)
{
  size_t v5 = (double *)(v2 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule16VideoEffectsView_controlSize);
  uint64_t result = swift_beginAccess();
  double *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*sub_33DF0())()
{
  return j__swift_endAccess;
}

char *sub_33E50(double a1, double a2)
{
  id v5 = objc_allocWithZone(v2);
  id v6 = [self mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = (char *)objc_msgSend(v5, "initWithFrame:", v8, v10, v12, v14);
  double v16 = (double *)&v15[OBJC_IVAR____TtC34VideoConferenceControlCenterModule16VideoEffectsView_controlSize];
  swift_beginAccess();
  *double v16 = a1;
  v16[1] = a2;
  return v15;
}

uint64_t sub_33FAC()
{
  return (*(uint64_t (**)(void))((char *)&stru_20.maxprot + (swift_isaMask & *v0)))();
}

id sub_33FE0(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return objc_msgSend(v9, "initWithFrame:", a1, a2, a3, a4);
}

id sub_34044(double a1, double a2, double a3, double a4)
{
  *(CGSize *)&v4[OBJC_IVAR____TtC34VideoConferenceControlCenterModule16VideoEffectsView_controlSize] = CGSizeZero;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for VideoEffectsView();
  return objc_msgSendSuper2(&v10, "initWithFrame:", a1, a2, a3, a4);
}

id sub_34148(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_3418C(void *a1)
{
  *(CGSize *)&v1[OBJC_IVAR____TtC34VideoConferenceControlCenterModule16VideoEffectsView_controlSize] = CGSizeZero;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for VideoEffectsView();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_34254()
{
  return sub_3CE28(type metadata accessor for VideoEffectsView);
}

void *sub_3426C()
{
  return &unk_55450;
}

uint64_t sub_34278()
{
  return 0;
}

uint64_t sub_34280()
{
  return *v0;
}

uint64_t sub_34288(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t (*sub_34290())()
{
  return nullsub_3;
}

uint64_t sub_342B4()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_342BC(uint64_t result)
{
  *(unsigned char *)(v1 + 1) = result;
  return result;
}

uint64_t (*sub_342C4())()
{
  return nullsub_3;
}

uint64_t sub_342E4()
{
  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t sub_342EC(uint64_t result)
{
  *(unsigned char *)(v1 + 2) = result;
  return result;
}

uint64_t (*sub_342F4())()
{
  return nullsub_3;
}

uint64_t sub_34314()
{
  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t sub_3431C(uint64_t result)
{
  *(unsigned char *)(v1 + 3) = result;
  return result;
}

uint64_t (*sub_34324())()
{
  return nullsub_3;
}

uint64_t sub_34344()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_34374(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t (*sub_343AC())()
{
  return nullsub_3;
}

uint64_t sub_343CC()
{
  return 0;
}

uint64_t sub_343D8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_34408(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t (*sub_34440())()
{
  return nullsub_3;
}

uint64_t sub_34460()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_34490(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t (*sub_344C8())()
{
  return nullsub_3;
}

uint64_t sub_344E8()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_34518(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

uint64_t (*sub_34550())()
{
  return nullsub_3;
}

id sub_34570()
{
  id v0 = [self systemBlueColor];

  return v0;
}

id sub_345B0()
{
  return *(id *)(v0 + 72);
}

void sub_345B8(uint64_t a1)
{
  *(void *)(v1 + 72) = a1;
}

uint64_t (*sub_345E4())()
{
  return nullsub_3;
}

uint64_t sub_34604()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_34634(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return result;
}

uint64_t (*sub_3466C())()
{
  return nullsub_3;
}

uint64_t sub_3468C()
{
  uint64_t v1 = *(void *)(v0 + 96);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_346BC(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 96) = a1;
  *(void *)(v2 + 104) = a2;
  return result;
}

uint64_t (*sub_346F4())()
{
  return nullsub_3;
}

double sub_34714()
{
  return 20.0;
}

double sub_3471C()
{
  return *(double *)(v0 + 112);
}

void sub_34724(double a1)
{
  *(double *)(v1 + 112) = a1;
}

uint64_t (*sub_3472C())()
{
  return nullsub_3;
}

double sub_3474C()
{
  return *(double *)(v0 + 120);
}

void sub_34754(double a1)
{
  *(double *)(v1 + 120) = a1;
}

uint64_t (*sub_3475C())()
{
  return nullsub_3;
}

uint64_t sub_3477C()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_347AC(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return result;
}

uint64_t (*sub_347E4())()
{
  return nullsub_3;
}

uint64_t sub_34808@<X0>(uint64_t result@<X0>, char a2@<W1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, double a11@<D1>, long long a12, long long a13, long long a14, long long a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  *(unsigned char *)a9 = result;
  *(unsigned char *)(a9 + 1) = a2;
  *(unsigned char *)(a9 + 2) = a3;
  *(unsigned char *)(a9 + 3) = a4;
  *(void *)(a9 + 8) = a5;
  *(void *)(a9 + 16) = a6;
  *(void *)(a9 + 24) = a7;
  *(void *)(a9 + 32) = a8;
  *(_OWORD *)(a9 + 40) = a12;
  *(_OWORD *)(a9 + 56) = a13;
  *(_OWORD *)(a9 + 72) = a14;
  *(_OWORD *)(a9 + 88) = a15;
  *(void *)(a9 + 104) = a16;
  *(double *)(a9 + 112) = a10;
  *(double *)(a9 + 120) = a11;
  *(void *)(a9 + 128) = a17;
  *(void *)(a9 + 136) = a18;
  return result;
}

BOOL sub_34850(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[7];
  v11[6] = a1[6];
  v11[7] = v2;
  v11[8] = a1[8];
  long long v3 = a1[3];
  v11[2] = a1[2];
  v11[3] = v3;
  long long v4 = a1[5];
  v11[4] = a1[4];
  v11[5] = v4;
  long long v5 = a1[1];
  v11[0] = *a1;
  v11[1] = v5;
  long long v6 = a2[7];
  v12[6] = a2[6];
  v12[7] = v6;
  v12[8] = a2[8];
  long long v7 = a2[3];
  v12[2] = a2[2];
  uint64_t v12[3] = v7;
  long long v8 = a2[5];
  v12[4] = a2[4];
  void v12[5] = v8;
  long long v9 = a2[1];
  v12[0] = *a2;
  v12[1] = v9;
  return sub_4073C((unsigned __int8 *)v11, (unsigned __int8 *)v12);
}

void sub_348D4(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

void sub_348E0()
{
  qword_7DE08 = 0x405C400000000000;
}

void sub_348F4()
{
  qword_7DE18 = 0x4069000000000000;
}

void sub_34904()
{
  qword_7DE28 = 0x4024000000000000;
}

void sub_34914()
{
  qword_7DE38 = 0x4020000000000000;
}

void sub_34924()
{
  qword_7DE48 = 0x4064600000000000;
}

double sub_34938()
{
  double result = *(double *)sub_45034();
  qword_7DE58 = *(void *)&result;
  return result;
}

double sub_3495C()
{
  if (qword_7DE50 != -1) {
    swift_once();
  }
  double v0 = *(double *)&qword_7DE58;
  if (qword_7DE30 != -1) {
    swift_once();
  }
  double result = v0 * 3.0 + *(double *)&qword_7DE38 + *(double *)&qword_7DE38;
  *(double *)&qword_7DE68 = result;
  return result;
}

id sub_34A00()
{
  id v0 = objc_allocWithZone((Class)UIView);

  return [v0 init];
}

id sub_34A38()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_previewViewContainer);
  swift_beginAccess();
  long long v2 = *v1;

  return v2;
}

void sub_34A90(void *a1)
{
}

uint64_t (*sub_34A9C())()
{
  return j_j__swift_endAccess;
}

id sub_34AF8()
{
  id v0 = objc_allocWithZone((Class)NSLayoutConstraint);

  return [v0 init];
}

id sub_34B30()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_previewViewContainerHeightConstraint);
  swift_beginAccess();
  long long v2 = *v1;

  return v2;
}

void sub_34B88(void *a1)
{
}

uint64_t (*sub_34B94())()
{
  return j_j__swift_endAccess;
}

void *sub_34BF0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoPreviewView);
  swift_beginAccess();
  long long v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_34C40(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoPreviewView);
  swift_beginAccess();
  long long v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_34C94())()
{
  return j_j__swift_endAccess;
}

id sub_34CF0()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_containerView));
}

id sub_34D04()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v1 = self;
  id v2 = [v1 preferredFontForTextStyle:UIFontTextStyleCallout];
  [v2 pointSize];
  double v4 = v3;

  double v5 = 18.0;
  if (v4 <= 18.0) {
    double v5 = v4;
  }
  id v6 = [v1 systemFontOfSize:v5];
  [v0 setFont:v6];

  [v0 setNumberOfLines:0];
  [v0 setLineBreakMode:0];
  [v0 setTextAlignment:1];
  [v0 controlCenterApplyPrimaryContentShadow];
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v0;
}

id sub_34E48()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_unavailableLabel));
}

void sub_34E58()
{
  if (qword_7DE70 != -1) {
    swift_once();
  }
  sub_34F30();
}

long long *sub_34EE4()
{
  if (qword_7DE70 != -1) {
    swift_once();
  }
  return &xmmword_7E730;
}

void sub_34F30()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRetain();
  NSString v2 = sub_4B2D0();
  swift_bridgeObjectRelease();
  double v3 = self;
  id v4 = [v3 _systemImageNamed:v2];

  if (!v4)
  {
    NSString v5 = sub_4B2D0();
    id v4 = [v3 _systemImageNamed:v5];
  }
  swift_bridgeObjectRetain();
  NSString v6 = sub_4B2D0();
  swift_bridgeObjectRelease();
  id v7 = [v3 _systemImageNamed:v6];

  if (!v7)
  {
    NSString v8 = sub_4B2D0();
    id v7 = [v3 _systemImageNamed:v8];
  }
  if (v4)
  {
    if (v7)
    {
      type metadata accessor for EffectControl();
      uint64_t v10 = *((void *)v1 + 1);
      uint64_t v9 = *((void *)v1 + 2);
      uint64_t v11 = *((void *)v1 + 3);
      uint64_t v12 = *((void *)v1 + 4);
      int v13 = v1[1];
      swift_bridgeObjectRetain();
      id v14 = v4;
      swift_bridgeObjectRetain();
      id v15 = [v7 imageWithRenderingMode:2];
      uint64_t v16 = *((void *)v1 + 16);
      uint64_t v17 = swift_bridgeObjectRetain();
      sub_46664(v13, v14, v10, v9, v11, v12, v15, v16, v17);
      double v19 = v18;
      uint64_t v20 = *v1;
      [v18 setTag:v20];
      [*(id *)&v19[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph] setTag:v20];
      [*(id *)&v19[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron] setTag:v20];
      [*(id *)&v19[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider] setTag:v20];
      double v21 = v19;
      NSString v22 = sub_4B2D0();
      [v21 setAccessibilityIdentifier:v22];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_351D0()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_centerStageButton));
}

void sub_351E0()
{
  if (qword_7DE78 != -1) {
    swift_once();
  }
  sub_34F30();
}

long long *sub_3526C()
{
  if (qword_7DE78 != -1) {
    swift_once();
  }
  return &xmmword_7E7C0;
}

id sub_352B8()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_portraitButton));
}

void sub_352C8()
{
  if (qword_7DE80 != -1) {
    swift_once();
  }
  sub_34F30();
}

long long *sub_35354()
{
  if (qword_7DE80 != -1) {
    swift_once();
  }
  return &xmmword_7E850;
}

id sub_353A0()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_studioLightButton));
}

void sub_353B0()
{
  if (qword_7DE88 != -1) {
    swift_once();
  }
  sub_34F30();
}

long long *sub_3543C()
{
  if (qword_7DE88 != -1) {
    swift_once();
  }
  return &xmmword_7E8E0;
}

id sub_35488()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton));
}

uint64_t sub_354E0()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_shouldLoadFromSensor);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_35574(char a1)
{
  double v3 = (unsigned char *)(v1
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_shouldLoadFromSensor);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_355C0())()
{
  return j_j__swift_endAccess;
}

void *sub_35668()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_contentModuleContext);
  swift_beginAccess();
  NSString v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_35738(void *a1)
{
  id v3 = (void **)(v1
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_contentModuleContext);
  swift_beginAccess();
  id v4 = *v3;
  unsigned char *v3 = a1;
  id v5 = a1;

  sub_36F00();
}

void (*sub_357A4(uint64_t a1))(uint64_t a1, char a2)
{
  *(void *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_35804;
}

void sub_35804(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_36F00();
  }
}

id sub_35838()
{
  id v0 = objc_allocWithZone((Class)VideoEffectsManager);

  return [v0 init];
}

id sub_35870()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsManager);
  swift_beginAccess();
  NSString v2 = *v1;

  return v2;
}

void sub_358C8(void *a1)
{
}

uint64_t (*sub_358D4())()
{
  return j_j__swift_endAccess;
}

id sub_35930()
{
  return sub_332F4();
}

id sub_3595C()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsPreview));
}

uint64_t sub_3596C()
{
  sub_33ABC(&qword_7D8C0);
  uint64_t v1 = swift_allocObject();
  NSString v2 = *(void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_portraitButton);
  *(_OWORD *)(v1 + 16) = xmmword_553B0;
  id v3 = *(void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_studioLightButton);
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  id v4 = *(void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton);
  id v5 = *(void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_centerStageButton);
  *(void *)(v1 + 48) = v4;
  *(void *)(v1 + 56) = v5;
  uint64_t v11 = v1;
  sub_4B370();
  id v6 = v2;
  id v7 = v3;
  id v8 = v4;
  id v9 = v5;
  return v11;
}

unint64_t sub_35A20()
{
  unint64_t result = (*(uint64_t (**)(void))((char *)&stru_158.offset + (swift_isaMask & *v0)))();
  unint64_t v2 = result;
  if (!(result >> 62))
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
    if (v3) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    return (unint64_t)&_swiftEmptyArrayStorage;
  }
  unint64_t result = sub_4B6A0();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_14;
  }
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_4B5E0();
      }
      else {
        id v5 = *(id *)(v2 + 8 * i + 32);
      }
      id v6 = v5;
      if ([v5 isHidden])
      {
      }
      else
      {
        sub_4B600();
        sub_4B620();
        sub_4B630();
        sub_4B610();
      }
    }
    swift_bridgeObjectRelease();
    return (unint64_t)&_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_35B88()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_35B94()
{
  return sub_363D0();
}

uint64_t sub_35BA0(uint64_t a1)
{
  return sub_36424(a1, &OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_buttonRects);
}

uint64_t (*sub_35BAC())()
{
  return j_j__swift_endAccess;
}

double sub_35C08()
{
  return 0.0;
}

double sub_35C1C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_expandedButtonRect;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_35C68(double a1, double a2, double a3, double a4)
{
  id v9 = (double *)(v4
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_expandedButtonRect);
  uint64_t result = swift_beginAccess();
  double *v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return result;
}

uint64_t (*sub_35CD4())()
{
  return j_j__swift_endAccess;
}

unint64_t sub_35D30()
{
  return sub_40AC8(&_swiftEmptyArrayStorage);
}

unint64_t sub_35D3C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_33ABC((uint64_t *)&unk_7DD60);
  unint64_t v2 = (void *)sub_4B6E0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    id v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_3F368((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_35E48()
{
  return sub_363D0();
}

uint64_t sub_35E54(uint64_t a1)
{
  return sub_36424(a1, &OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_buttonTopConstraints);
}

uint64_t (*sub_35E60())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_35EBC()
{
  return sub_363D0();
}

uint64_t sub_35EC8(uint64_t a1)
{
  return sub_36424(a1, &OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_buttonHeightConstraints);
}

uint64_t (*sub_35ED4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_35FAC()
{
  return (*(uint64_t (**)(void))((char *)&stru_248.offset + (swift_isaMask & *v0)))();
}

double sub_35FE8()
{
  return 0.0;
}

double sub_36038()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_compactContinuousCornerRadius;
  swift_beginAccess();
  return *(double *)v1;
}

void sub_36180(double a1)
{
  uint64_t v3 = (double *)((char *)v1
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_compactContinuousCornerRadius);
  uint64_t v4 = swift_beginAccess();
  double *v3 = a1;
  id v5 = (void *)(*(uint64_t (**)(uint64_t))((char *)&stru_B8.flags + (swift_isaMask & *v1)))(v4);
  double v6 = *v3;
  if (qword_7DE20 != -1) {
    swift_once();
  }
  [v5 _setContinuousCornerRadius:v6 - *(double *)&qword_7DE28];
}

void (*sub_36268(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_compactContinuousCornerRadius;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_362D4;
}

void sub_362D4(void **a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = swift_endAccess();
  if ((a2 & 1) == 0)
  {
    id v5 = (void *)v3[3];
    uint64_t v6 = v3[4];
    id v7 = (void *)(*(uint64_t (**)(uint64_t))((char *)&stru_B8.flags + (swift_isaMask & *v5)))(v4);
    double v8 = *(double *)((char *)v5 + v6);
    if (qword_7DE20 != -1) {
      swift_once();
    }
    [v7 _setContinuousCornerRadius:v8 - *(double *)&qword_7DE28];
  }

  free(v3);
}

unint64_t sub_363B8()
{
  return sub_35D3C((uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_363C4()
{
  return sub_363D0();
}

uint64_t sub_363D0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_36418(uint64_t a1)
{
  return sub_36424(a1, &OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_categoriesToVisualStylingProviders);
}

uint64_t sub_36424(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  *uint64_t v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_36474())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_364D0()
{
  sub_33ABC(&qword_7D8C0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_553C0;
  *(void *)(v0 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:2];
  *(void *)(v0 + 40) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  sub_4B370();
  return v0;
}

uint64_t sub_3660C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_366DC(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_requiredVisualStyleCategories);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_36730())()
{
  return j_j__swift_endAccess;
}

id sub_3678C()
{
  id v0 = objc_allocWithZone((Class)RPCCMTVisualStylingProvider);

  return [v0 init];
}

id sub_367C4()
{
  uint64_t v1 = (void **)(v0
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_platterStrokeVisualStylingProvider);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_3681C(void *a1)
{
}

void sub_36828(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  id v5 = *v4;
  *uint64_t v4 = a1;
}

uint64_t (*sub_36878())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_368D4()
{
  return 1;
}

BOOL sub_368E4()
{
  return ((*(uint64_t (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v0)))() & 1) == 0;
}

double sub_369B4()
{
  (*(void (**)(void))((char *)&stru_248.offset + (swift_isaMask & *v0)))();
  if (qword_7DE00 != -1) {
    swift_once();
  }
  double v1 = *(double *)&qword_7DE08;
  if (qword_7DE30 != -1) {
    swift_once();
  }
  double v2 = *(double *)&qword_7DE38;
  if (qword_7DE40 != -1) {
    swift_once();
  }
  double v3 = v1 + v2;
  double v4 = *(double *)&qword_7DE48;
  if (qword_7DE20 != -1) {
    swift_once();
  }
  double v5 = v3 + v4;
  double v6 = *(double *)&qword_7DE28 + *(double *)&qword_7DE28;
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  double v7 = v5 + v6;
  uint64_t v8 = sub_4B210();
  sub_40BC0(v8, (uint64_t)qword_7DDE8);
  char v9 = sub_4B1F0();
  os_log_type_t v10 = sub_4B390();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 134218240;
    sub_4B580();
    *(_WORD *)(v11 + 12) = 2048;
    sub_4B580();
    _os_log_impl(&dword_0, v9, v10, "video effects control size width=%f and height=%f", (uint8_t *)v11, 0x16u);
    swift_slowDealloc();
  }

  return v7;
}

double sub_36C24()
{
  double v1 = *(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & *v0) + 8];
  double v2 = (void *)v1();
  id v3 = [v2 centerStage];

  LODWORD(v2) = [v3 isAvailable];
  if (v2) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  double v5 = (void *)v1();
  id v6 = [v5 backgroundBlur];

  LODWORD(v5) = [v6 isAvailable];
  if (v5) {
    double v4 = v4 + 1.0;
  }
  double v7 = (void *)v1();
  id v8 = [v7 studioLighting];

  LODWORD(v7) = [v8 isAvailable];
  if (v7) {
    double v4 = v4 + 1.0;
  }
  char v9 = (void *)v1();
  id v10 = [v9 reactions];

  LODWORD(v9) = [v10 isAvailable];
  if (v9)
  {
    uint64_t v11 = (void *)v1();
    id v12 = [v11 gestures];

    LODWORD(v11) = [v12 isAvailable];
    if (v11) {
      double v4 = v4 + 1.0;
    }
  }
  if (qword_7DE50 != -1) {
    swift_once();
  }
  double v13 = *(double *)&qword_7DE58;
  if (qword_7DE30 != -1) {
    swift_once();
  }
  double v14 = 3.0;
  if (v4 > 3.0) {
    double v14 = v4;
  }
  return v14 * v13 + (v14 + -1.0) * *(double *)&qword_7DE38;
}

double sub_36E94()
{
  double v0 = sub_36C24();
  if (qword_7DE20 != -1) {
    swift_once();
  }
  return v0 + 0.0 + *(double *)&qword_7DE28 + *(double *)&qword_7DE28;
}

void sub_36F00()
{
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_4B210();
  sub_40BC0(v1, (uint64_t)qword_7DDE8);
  double v2 = v0;
  id v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B390();
  if (os_log_type_enabled(v3, v4))
  {
    double v5 = (uint8_t *)swift_slowAlloc();
    id v6 = (void *)swift_slowAlloc();
    *(_DWORD *)double v5 = 138412290;
    uint64_t v7 = (*(uint64_t (**)(void))&stru_158.sectname[swift_isaMask & *v2])();
    sub_4B580();
    void *v6 = v7;

    _os_log_impl(&dword_0, v3, v4, "refreshCurrentApplication, context=%@", v5, 0xCu);
    sub_33ABC(&qword_7D910);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v8 = (void *)(*(uint64_t (**)(void))&stru_158.sectname[swift_isaMask & *v2])();
  if (v8)
  {
    char v9 = v8;
    id v10 = v8;
    uint64_t v11 = sub_4B1F0();
    os_log_type_t v12 = sub_4B390();
    if (os_log_type_enabled(v11, v12))
    {
      double v13 = (uint8_t *)swift_slowAlloc();
      double v27 = (void *)swift_slowAlloc();
      *(_DWORD *)double v13 = 138412290;
      double v14 = v10;
      sub_4B580();
      *double v27 = v9;

      _os_log_impl(&dword_0, v11, v12, "setting module context on effects manager %@", v13, 0xCu);
      sub_33ABC(&qword_7D910);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v11 = v10;
    }

    id v15 = (void *)(*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & *v2) + 8])();
    [v15 updateCurrentApplicationWithContext:v10];

    sub_38C04();
    id v16 = [v2 viewIfLoaded];
    if (!v16) {
      goto LABEL_16;
    }
    uint64_t v17 = v16;
    type metadata accessor for VideoEffectsView();
    uint64_t v18 = swift_dynamicCastClass();
    if (v18)
    {
      double v19 = (void *)v18;
      sub_3B400(1);
      double v20 = sub_369B4();
      (*(void (**)(double))((char *)&stru_20.nsects + (swift_isaMask & *v19)))(v20);
      double v21 = sub_36C24();
      NSString v22 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v2) - 8])();
      [v22 setConstant:v21];

      id v23 = [v2 view];
      if (v23)
      {
        double v24 = v23;
        [v23 invalidateIntrinsicContentSize];

        id v25 = [v2 view];
        if (v25)
        {
          id v26 = v25;
          [v25 setNeedsLayout];

          uint64_t v17 = v26;
          goto LABEL_15;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      return;
    }
LABEL_15:

LABEL_16:
  }
}

void sub_37414(void *a1)
{
  double v2 = v1;
  os_log_type_t v4 = *(uint64_t (**)(void))((char *)&stru_158.reloff + (swift_isaMask & *v1));
  unint64_t v5 = v4();
  id v6 = a1;
  id v19 = sub_40D38(v5, v6);
  swift_bridgeObjectRelease();

  if (v19)
  {
    sub_49438(0);
  }
  else
  {
    if (qword_7DDE0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_4B210();
    sub_40BC0(v7, (uint64_t)qword_7DDE8);
    id v8 = v6;
    char v9 = sub_4B1F0();
    os_log_type_t v10 = sub_4B390();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      v20[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315394;
      sub_33464(0xD000000000000013, 0x800000000005FBF0, v20);
      sub_4B580();
      *(_WORD *)(v11 + 12) = 2048;
      [v8 tag];
      sub_4B580();

      _os_log_impl(&dword_0, v9, v10, "VideoEffectsViewController %s Could not find corresponding button for tag %ld", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v12 = v2;
    double v13 = sub_4B1F0();
    os_log_type_t v14 = sub_4B390();
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      v20[0] = swift_slowAlloc();
      *(_DWORD *)id v15 = 136315138;
      v4();
      type metadata accessor for EffectControl();
      uint64_t v16 = sub_4B360();
      unint64_t v18 = v17;
      swift_bridgeObjectRelease();
      sub_33464(v16, v18, v20);
      sub_4B580();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v13, v14, "Supported buttons: %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

void sub_37860(void *a1)
{
  double v2 = v1;
  os_log_type_t v4 = *(uint64_t (**)(void))((char *)&stru_158.reloff + (swift_isaMask & *v1));
  unint64_t v5 = v4();
  id v6 = a1;
  uint64_t v7 = sub_40BF8(v5, v6);
  swift_bridgeObjectRelease();

  if (v7)
  {
    id v8 = v7;
    objc_msgSend(v8, "setSelected:", objc_msgSend(v8, "isSelected") ^ 1);

    char v9 = [v8 isSelected];
    char v10 = sub_34278();
    char v11 = sub_368D4();
    sub_48B1C(v9, v10 & 1, v11 & 1);
    id v12 = [v6 tag];
    if ((unint64_t)v12 >= 4) {
      unsigned __int8 v13 = 0;
    }
    else {
      unsigned __int8 v13 = v12;
    }
    if (qword_7DDE0 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_4B210();
    sub_40BC0(v14, (uint64_t)qword_7DDE8);
    id v15 = sub_4B1F0();
    os_log_type_t v16 = sub_4B390();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = swift_slowAlloc();
      v30[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v17 = 136315394;
      sub_33464(0xD000000000000015, 0x800000000005FC10, v30);
      sub_4B580();
      *(_WORD *)(v17 + 12) = 2048;
      sub_4B580();
      _os_log_impl(&dword_0, v15, v16, "%s toggling VideoEffect %ld", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    unint64_t v18 = (void *)(*(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & *v2) + 8])();
    objc_msgSend(v18, "setState:forEffect:", objc_msgSend(v8, "isSelected"), v13);

    sub_49530();
  }
  else
  {
    if (qword_7DDE0 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_4B210();
    sub_40BC0(v19, (uint64_t)qword_7DDE8);
    id v20 = v6;
    double v21 = sub_4B1F0();
    os_log_type_t v22 = sub_4B390();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      v30[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315394;
      sub_33464(0xD000000000000015, 0x800000000005FC10, v30);
      sub_4B580();
      *(_WORD *)(v23 + 12) = 2048;
      [v20 tag];
      sub_4B580();

      _os_log_impl(&dword_0, v21, v22, "%s Could not find corresponding button for tag %ld", (uint8_t *)v23, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v8 = v2;
    double v24 = sub_4B1F0();
    os_log_type_t v25 = sub_4B390();
    if (os_log_type_enabled(v24, v25))
    {
      id v26 = (uint8_t *)swift_slowAlloc();
      v30[0] = swift_slowAlloc();
      *(_DWORD *)id v26 = 136315138;
      v4();
      type metadata accessor for EffectControl();
      uint64_t v27 = sub_4B360();
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      sub_33464(v27, v29, v30);
      sub_4B580();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_0, v24, v25, "Supported buttons %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
}

void sub_37EB4(void *a1)
{
  double v2 = v1;
  id v4 = [a1 tag];
  if ((unint64_t)v4 >= 4) {
    unsigned __int8 v5 = 0;
  }
  else {
    unsigned __int8 v5 = v4;
  }
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_4B210();
  sub_40BC0(v6, (uint64_t)qword_7DDE8);
  uint64_t v7 = sub_4B1F0();
  os_log_type_t v8 = sub_4B390();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315394;
    sub_33464(0xD000000000000016, 0x800000000005FC30, &v12);
    sub_4B580();
    *(_WORD *)(v9 + 12) = 2048;
    sub_4B580();
    _os_log_impl(&dword_0, v7, v8, "%s VideoEffect %ld slider changed.", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  char v11 = (void *)(*(uint64_t (**)(uint64_t))&stru_158.segname[(swift_isaMask & *v2) + 8])(v10);
  [a1 value];
  objc_msgSend(v11, "setIntensity:forEffect:", v5);
}

void sub_3814C(void *a1)
{
  double v2 = v1;
  sub_42194(0, (unint64_t *)&qword_7D7D0);
  id v3 = (void *)sub_4B570();
  sub_4B3B0();
  sub_4B1E0();

  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_4B210();
  sub_40BC0(v4, (uint64_t)qword_7DDE8);
  unsigned __int8 v5 = v2;
  uint64_t v6 = sub_4B1F0();
  os_log_type_t v7 = sub_4B390();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315394;
    sub_33464(0xD000000000000016, 0x800000000005FC60, aBlock);
    uint64_t v9 = sub_4B580();
    *(_WORD *)(v8 + 12) = 2080;
    uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t))((char *)&stru_B8.flags + (swift_isaMask & *v5)))(v9);
    [v10 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v58.origin.double x = v12;
    v58.origin.y = v14;
    v58.size.width = v16;
    v58.size.height = v18;
    uint64_t v19 = NSStringFromCGRect(v58);
    uint64_t v20 = sub_4B300();
    unint64_t v22 = v21;

    sub_33464(v20, v22, aBlock);
    sub_4B580();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v6, v7, "%s %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v23 = *(uint64_t (**)(void))((char *)&stru_158.reloff + (swift_isaMask & *v5));
  unint64_t v24 = v23();
  id v25 = a1;
  id v26 = sub_40D38(v24, v25);
  swift_bridgeObjectRelease();

  if (!v26)
  {
    double v40 = v25;
    double v41 = sub_4B1F0();
    os_log_type_t v42 = sub_4B390();
    if (os_log_type_enabled(v41, v42))
    {
      double v43 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)double v43 = 134217984;
      aBlock[0] = (uint64_t)[v40 tag];
      sub_4B580();

      _os_log_impl(&dword_0, v41, v42, "Could not find corresponding button for tag %ld", v43, 0xCu);
      swift_slowDealloc();

      return;
    }

LABEL_25:
    return;
  }
  unint64_t v27 = v23();
  sub_389CC((uint64_t)v26, v27);
  char v29 = v28;
  uint64_t v30 = swift_bridgeObjectRelease();
  if (v29)
  {
    double v40 = v26;
    double v44 = sub_4B1F0();
    os_log_type_t v45 = sub_4B390();
    if (os_log_type_enabled(v44, v45))
    {
      id v46 = (uint8_t *)swift_slowAlloc();
      double v47 = (void *)swift_slowAlloc();
      *(_DWORD *)id v46 = 138412290;
      aBlock[0] = (uint64_t)v40;
      v48 = v40;
      sub_4B580();
      *double v47 = v26;

      _os_log_impl(&dword_0, v44, v45, "Could not find index for %@", v46, 0xCu);
      sub_33ABC(&qword_7D910);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }

    goto LABEL_25;
  }
  (*(void (**)(uint64_t))&stru_1A8.sectname[swift_isaMask & *v26])(v30);
  id v31 = [v5 view];
  if (!v31) {
    goto LABEL_35;
  }
  double v32 = v31;
  [v31 bringSubviewToFront:v26];

  unint64_t v33 = v23();
  id v34 = v25;
  unint64_t v35 = (unint64_t)sub_4095C(v33, v34);
  swift_bridgeObjectRelease();

  if (v35 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v36 = sub_4B6A0();
    if (v36) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v36 = *(void *)((char *)&dword_10 + (v35 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v36)
    {
LABEL_11:
      if (v36 >= 1)
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if ((v35 & 0xC000000000000001) != 0) {
            double v38 = (void *)sub_4B5E0();
          }
          else {
            double v38 = *(id *)(v35 + 8 * i + 32);
          }
          double v39 = v38;
          if ((*(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v38)))()) {
            (*(void (**)(void))&stru_1A8.sectname[swift_isaMask & *v39])();
          }
        }
        goto LABEL_27;
      }
      __break(1u);
LABEL_35:
      __break(1u);
      return;
    }
  }
LABEL_27:
  swift_bridgeObjectRelease();
  sub_3B400(1);
  double v49 = *(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v26));
  if (v49()) {
    double v50 = 0.1;
  }
  else {
    double v50 = 0.3;
  }
  if (v49()) {
    double v51 = 0.0;
  }
  else {
    double v51 = 0.2;
  }
  v52 = self;
  uint64_t v53 = swift_allocObject();
  *(void *)(v53 + 16) = v35;
  *(void *)(v53 + 24) = v26;
  aBlock[4] = (uint64_t)sub_40EAC;
  aBlock[5] = v53;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_38B58;
  aBlock[3] = (uint64_t)&unk_698B0;
  v54 = _Block_copy(aBlock);
  v55 = v26;
  swift_release();
  [v52 animateWithDuration:0 delay:v54 options:0 animations:v50 completion:v51];

  _Block_release(v54);
}

void sub_389CC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)sub_4B5E0();
      }
      else
      {
        if (!*(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8)))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      unsigned __int8 v5 = v4;
      type metadata accessor for EffectControl();
      char v6 = sub_4B400();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v11 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v11 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v8 = (id)sub_4B5E0();
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0) {
              goto LABEL_18;
            }
            if (v11 >= *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8))) {
              goto LABEL_19;
            }
            id v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          uint64_t v9 = v8;
          char v10 = sub_4B400();

          if (v10) {
            return;
          }
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        uint64_t v3 = sub_4B6A0();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

uint64_t sub_38B58(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_38C04()
{
  uint64_t v1 = v0;
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_4B210();
  sub_40BC0(v2, (uint64_t)qword_7DDE8);
  uint64_t v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B390();
  if (os_log_type_enabled(v3, v4))
  {
    unsigned __int8 v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v71 = swift_slowAlloc();
    *(_DWORD *)unsigned __int8 v5 = 136315138;
    uint64_t v70 = sub_33464(0xD000000000000014, 0x8000000000060300, &v71);
    sub_4B580();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  char v6 = *(void **)((char *)v1
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_centerStageButton);
  os_log_type_t v7 = *(uint64_t (**)(void))&stru_158.segname[(swift_isaMask & *v1) + 8];
  uint64_t v9 = (void *)((uint64_t (*)(uint64_t))v7)(v8);
  id v10 = [v9 centerStage];

  LODWORD(v9) = [v10 isAvailable];
  unint64_t v11 = (void *)((uint64_t (*)(id))v7)([v6 setHidden:v9 ^ 1]);
  id v12 = [v11 centerStage];

  id v13 = [v12 enabled];
  CGFloat v14 = (void *)((uint64_t (*)(id))v7)([v6 setSelected:v13]);
  id v15 = [v14 centerStage];

  LOBYTE(v14) = [v15 enabled];
  LOBYTE(v15) = sub_34278();
  char v16 = sub_368D4();
  id v17 = sub_48B1C((char)v14, v15 & 1, v16 & 1);
  CGFloat v18 = *(char **)((char *)v1
                 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_portraitButton);
  uint64_t v19 = (void *)((uint64_t (*)(id))v7)(v17);
  id v20 = [v19 backgroundBlur];

  LODWORD(v19) = [v20 isAvailable];
  unint64_t v21 = (void *)((uint64_t (*)(id))v7)([v18 setHidden:v19 ^ 1]);
  id v22 = [v21 backgroundBlur];

  id v23 = [v22 enabled];
  unint64_t v24 = (void *)((uint64_t (*)(id))v7)([v18 setSelected:v23]);
  id v25 = [v24 backgroundBlur];

  LOBYTE(v24) = [v25 enabled];
  LOBYTE(v25) = sub_34278();
  char v26 = sub_368D4();
  sub_48B1C((char)v24, v25 & 1, v26 & 1);
  id v27 = *(id *)&v18[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider];
  char v28 = (void *)((uint64_t (*)(id))v7)(v27);
  id v29 = [v28 backgroundBlur];

  [v29 intensity];
  int v31 = v30;

  LODWORD(v32) = v31;
  [v27 setValue:0 animated:v32];

  unint64_t v33 = *(char **)((char *)v1
                 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_studioLightButton);
  unint64_t v35 = (void *)((uint64_t (*)(uint64_t))v7)(v34);
  id v36 = [v35 studioLighting];

  LODWORD(v35) = [v36 isAvailable];
  id v37 = (void *)((uint64_t (*)(id))v7)([v33 setHidden:v35 ^ 1]);
  id v38 = [v37 studioLighting];

  id v39 = [v38 enabled];
  double v40 = (void *)((uint64_t (*)(id))v7)([v33 setSelected:v39]);
  id v41 = [v40 studioLighting];

  LOBYTE(v40) = [v41 enabled];
  LOBYTE(v41) = sub_34278();
  char v42 = sub_368D4();
  sub_48B1C((char)v40, v41 & 1, v42 & 1);
  id v43 = *(id *)&v33[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider];
  double v44 = (void *)((uint64_t (*)(id))v7)(v43);
  id v45 = [v44 studioLighting];

  [v45 intensity];
  int v47 = v46;

  LODWORD(v48) = v47;
  [v43 setValue:0 animated:v48];

  double v49 = *(void **)((char *)v1
                 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton);
  double v51 = (void *)((uint64_t (*)(uint64_t))v7)(v50);
  id v52 = [v51 reactions];

  LODWORD(v51) = [v52 isAvailable];
  if (v51)
  {
    v54 = (void *)((uint64_t (*)(uint64_t))v7)(v53);
    id v55 = [v54 gestures];

    LODWORD(v54) = [v55 isAvailable];
    uint64_t v56 = v54 ^ 1;
  }
  else
  {
    uint64_t v56 = 1;
  }
  v57 = (void *)((uint64_t (*)(id))v7)(objc_msgSend(v49, "setHidden:", v56, v70));
  id v58 = [v57 reactions];

  id v59 = [v58 enabled];
  if (v59)
  {
    v60 = (void *)v7();
    id v61 = [v60 gestures];

    id v59 = [v61 enabled];
  }
  v62 = (void *)((uint64_t (*)(id))v7)([v49 setSelected:v59]);
  id v63 = [v62 reactions];

  LODWORD(v62) = [v63 enabled];
  if (v62)
  {
    v64 = (void *)v7();
    id v65 = [v64 gestures];

    char v66 = [v65 enabled];
  }
  else
  {
    char v66 = 0;
  }
  char v67 = sub_34278();
  char v68 = sub_368D4();
  return sub_48B1C(v66, v67 & 1, v68 & 1);
}

id sub_39404()
{
  double v1 = sub_36C24();
  uint64_t v2 = *(uint64_t (**)(void))((char *)&stru_B8.flags + (swift_isaMask & *v0));
  uint64_t v3 = (void *)v2();
  id v4 = [v3 heightAnchor];

  id v5 = [v4 constraintEqualToConstant:v1];
  (*(void (**)(id))&stru_108.segname[swift_isaMask & *v0])(v5);
  sub_33ABC(&qword_7D8C0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_553D0;
  os_log_type_t v7 = *(uint64_t (**)(void))((char *)v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_containerView);
  uint64_t v8 = [v7 trailingAnchor];
  p_cb = (SEL *)&selRef_compactContinuousCornerRadius;
  v77 = v0;
  id result = [v0 view];
  if (result)
  {
    unint64_t v11 = result;
    id v12 = (SEL *)[result trailingAnchor];

    if (qword_7DE20 != -1) {
      goto LABEL_24;
    }
    while (1)
    {
      id v13 = [v8 constraintEqualToAnchor:v12 constant:-*(double *)&qword_7DE28];

      *(void *)(v6 + 32) = v13;
      id v14 = [v7 topAnchor];
      uint64_t v8 = v77;
      id result = objc_msgSend(v77, p_cb[444]);
      if (!result) {
        goto LABEL_32;
      }
      id v15 = result;
      id v16 = [result topAnchor];

      id v17 = [v14 constraintEqualToAnchor:v16 constant:*(double *)&qword_7DE28];
      *(void *)(v6 + 40) = v17;
      id v18 = [v7 leadingAnchor];
      uint64_t v19 = (void *)v2();
      id v20 = [v19 trailingAnchor];

      id v21 = [v18 constraintEqualToAnchor:v20 constant:*(double *)&qword_7DE28];
      *(void *)(v6 + 48) = v21;
      id v22 = [v7 widthAnchor];
      if (qword_7DE40 != -1) {
        swift_once();
      }
      id v23 = [v22 constraintEqualToConstant:*(double *)&qword_7DE48];

      *(void *)(v6 + 56) = v23;
      id v24 = [v7 heightAnchor];
      id v25 = (void *)v2();
      id v26 = [v25 heightAnchor];

      id v27 = [v24 constraintEqualToAnchor:v26];
      *(void *)(v6 + 64) = v27;
      char v28 = (void *)v2();
      id v29 = [v28 leadingAnchor];

      id result = [v77 view];
      if (!result) {
        goto LABEL_33;
      }
      int v30 = result;
      id v31 = [result leadingAnchor];

      p_cb = (SEL *)&OBJC_PROTOCOL___CCUIContentModuleBackgroundViewController.cb;
      id v32 = [v29 constraintEqualToAnchor:v31 constant:*(double *)&qword_7DE28];

      *(void *)(v6 + 72) = v32;
      unint64_t v33 = (void *)v2();
      id v34 = [v33 topAnchor];

      id result = [v77 view];
      if (!result) {
        goto LABEL_34;
      }
      unint64_t v35 = result;
      id v12 = (SEL *)NSLayoutConstraint_ptr;
      id v36 = self;
      uint64_t v2 = (uint64_t (*)(void))[v35 topAnchor];

      id v37 = [v34 constraintEqualToAnchor:v2 constant:*(double *)&qword_7DE28];
      *(void *)(v6 + 80) = v37;
      *(void *)(v6 + 88) = (*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v77) - 8])();
      v82[0] = v6;
      sub_4B370();
      sub_42194(0, &qword_7DB10);
      Class isa = sub_4B340().super.isa;
      swift_bridgeObjectRelease();
      [v36 activateConstraints:isa];

      uint64_t v39 = (swift_isaMask & *v77) + 392;
      os_log_type_t v7 = *(uint64_t (**)(void))((char *)&stru_158.offset + (swift_isaMask & *v77));
      unint64_t v40 = v7();
      if (v40 >> 62)
      {
        uint64_t v6 = sub_4B6A0();
        uint64_t v41 = swift_bridgeObjectRelease();
        if (v6 < 0)
        {
          __break(1u);
LABEL_27:
          uint64_t v43 = sub_4B6A0();
          if (!v43)
          {
LABEL_28:
            return (id)swift_bridgeObjectRelease();
          }
          goto LABEL_13;
        }
      }
      else
      {
        uint64_t v6 = *(void *)((char *)&dword_10 + (v40 & 0xFFFFFFFFFFFFFF8));
        uint64_t v41 = swift_bridgeObjectRelease();
      }
      id v12 = (SEL *)&selRef_isDrivingActivity;
      unint64_t v42 = ((uint64_t (*)(uint64_t))v7)(v41);
      uint64_t v39 = v42;
      if (!v6) {
        goto LABEL_28;
      }
      if (v42 >> 62) {
        goto LABEL_27;
      }
      uint64_t v43 = *(void *)((char *)&dword_10 + (v42 & 0xFFFFFFFFFFFFFF8));
      if (!v43) {
        goto LABEL_28;
      }
LABEL_13:
      unint64_t v44 = 0;
      uint64_t v72 = v39 & 0xFFFFFFFFFFFFFF8;
      uint64_t v75 = v6 - 1;
      unint64_t v76 = v39 & 0xC000000000000001;
      uint64_t v73 = v43;
      uint64_t v74 = v39;
      while (v76)
      {
        id v45 = (SEL *)sub_4B5E0();
LABEL_18:
        p_cb = v45;
        [(SEL *)v45 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v46 = [(SEL *)p_cb topAnchor];
        id v79 = *(id *)((char *)v8
                    + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_containerView);
        id v47 = [v79 topAnchor];
        id v48 = objc_msgSend(v46, v12[119], v47);

        id v49 = [(SEL *)p_cb heightAnchor];
        if (qword_7DE50 != -1) {
          swift_once();
        }
        id v50 = [v49 constraintEqualToConstant:*(double *)&qword_7DE58];

        id v51 = [(SEL *)p_cb tag];
        id v52 = *(uint64_t (**)(void *))((char *)&stru_1A8.offset + (swift_isaMask & *v8));
        id v78 = v48;
        uint64_t v53 = (void (*)(void *, void))v52(v82);
        id v55 = v54;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v80 = *v55;
        uint64_t *v55 = 0x8000000000000000;
        sub_400F8((uint64_t)v78, (uint64_t)v51, isUniquelyReferenced_nonNull_native);
        uint64_t *v55 = v80;
        swift_bridgeObjectRelease();
        v53(v82, 0);
        id v57 = [(SEL *)p_cb tag];
        id v58 = *(uint64_t (**)(void *))((char *)&stru_1A8.reserved2 + (swift_isaMask & *v8));
        uint64_t v2 = (uint64_t (*)(void))v50;
        id v59 = (void (*)(void *, void))v58(v82);
        id v61 = v60;
        char v62 = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v81 = *v61;
        *id v61 = 0x8000000000000000;
        sub_400F8((uint64_t)v2, (uint64_t)v57, v62);
        *id v61 = v81;
        swift_bridgeObjectRelease();
        v59(v82, 0);
        uint64_t v6 = self;
        sub_33ABC(&qword_7D8C0);
        uint64_t v63 = swift_allocObject();
        *(_OWORD *)(v63 + 16) = xmmword_553B0;
        id v64 = [(SEL *)p_cb leadingAnchor];
        id v65 = [v79 leadingAnchor];
        id v66 = [v64 constraintEqualToAnchor:v65];

        *(void *)(v63 + 32) = v66;
        id v67 = [(SEL *)p_cb trailingAnchor];
        id v68 = [v79 trailingAnchor];
        id v69 = [v67 constraintEqualToAnchor:v68];

        *(void *)(v63 + 40) = v69;
        *(void *)(v63 + 48) = v78;
        *(void *)(v63 + 56) = v2;
        v82[0] = v63;
        sub_4B370();
        id v70 = v78;
        os_log_type_t v7 = v2;
        Class v71 = sub_4B340().super.isa;
        swift_bridgeObjectRelease();
        [(id)v6 activateConstraints:v71];

        if (v75 != v44)
        {
          id v12 = (SEL *)&selRef_isDrivingActivity;
          ++v44;
          uint64_t v39 = v74;
          uint64_t v8 = v77;
          if (v73 != v44) {
            continue;
          }
        }
        return (id)swift_bridgeObjectRelease();
      }
      if (v44 < *(void *)(v72 + 16))
      {
        id v45 = (SEL *)*(id *)(v39 + 8 * v44 + 32);
        goto LABEL_18;
      }
      __break(1u);
LABEL_24:
      swift_once();
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

void sub_39F58()
{
  double v1 = (void *)(*(uint64_t (**)(void))&stru_108.segname[(swift_isaMask & *v0) + 16])();
  if (v1)
  {
    uint64_t v2 = v1;
    [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v3 = self;
    sub_33ABC(&qword_7D8C0);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_553B0;
    id v5 = [v2 centerXAnchor];
    uint64_t v6 = *(uint64_t (**)(void))((char *)&stru_B8.flags + (swift_isaMask & *v0));
    os_log_type_t v7 = (void *)v6();
    id v8 = [v7 centerXAnchor];

    id v9 = [v5 constraintEqualToAnchor:v8];
    *(void *)(v4 + 32) = v9;
    id v10 = [v2 centerYAnchor];
    unint64_t v11 = (void *)v6();
    id v12 = [v11 centerYAnchor];

    id v13 = [v10 constraintEqualToAnchor:v12];
    *(void *)(v4 + 40) = v13;
    id v14 = [v2 heightAnchor];
    id v15 = (void *)v6();
    id v16 = [v15 heightAnchor];

    id v17 = [v14 constraintEqualToAnchor:v16];
    *(void *)(v4 + 48) = v17;
    id v18 = [v2 widthAnchor];
    id v19 = [v2 heightAnchor];
    id v20 = [v18 constraintEqualToAnchor:v19];

    *(void *)(v4 + 56) = v20;
    uint64_t v25 = v4;
    sub_4B370();
    sub_42194(0, &qword_7DB10);
    os_log_t oslog = (os_log_t)sub_4B340().super.isa;
    swift_bridgeObjectRelease();
    [v3 activateConstraints:oslog];
  }
  else
  {
    if (qword_7DDE0 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_4B210();
    sub_40BC0(v21, (uint64_t)qword_7DDE8);
    os_log_t oslog = (os_log_t)sub_4B1F0();
    os_log_type_t v22 = sub_4B3A0();
    if (os_log_type_enabled(oslog, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)id v23 = 136315138;
      sub_33464(0xD000000000000020, 0x80000000000602D0, &v25);
      sub_4B580();
      _os_log_impl(&dword_0, oslog, v22, "%s nil videoPreviewView", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return;
    }
  }
}

void sub_3A3C4()
{
  double v1 = v0;
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_4B210();
  sub_40BC0(v2, (uint64_t)qword_7DDE8);
  uint64_t v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B390();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    v42[0] = swift_slowAlloc();
    *(_DWORD *)id v5 = 136315138;
    sub_33464(0x7765695664616F6CLL, 0xEA00000000002928, v42);
    sub_4B580();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v6 = *(uint64_t (**)(uint64_t))&stru_158.segname[(swift_isaMask & *v1) + 8];
  id v8 = (void *)v6(v7);
  id v9 = *(uint64_t (**)(void *))((char *)&stru_108.reloff + (swift_isaMask & *v1));
  [v8 setShouldLoadFromSensor:v9(v8) & 1];

  unint64_t v11 = (void *)v6(v10);
  [v11 setDelegate:v1];

  uint64_t v13 = v9(v12);
  if (v13)
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t))&stru_158.sectname[swift_isaMask & *v1])(v13);
    if (v14)
    {
      id v15 = v14;
      sub_36F00();
    }
    else
    {
      id v15 = sub_4B1F0();
      os_log_type_t v40 = sub_4B3A0();
      if (os_log_type_enabled(v15, v40))
      {
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v41 = 0;
        _os_log_impl(&dword_0, v15, v40, "could not unwrap module context", v41, 2u);
        swift_slowDealloc();
      }
    }
  }
  else
  {
    id v15 = v6(v13);
    [v15 setupWithoutSensorData];
  }

  id v17 = (void *)v6(v16);
  [v17 updateVideoEffectsStates];

  id v19 = (void *)v6(v18);
  [v19 setupVideoEffectsModeNotifications];

  double v20 = sub_369B4();
  uint64_t v22 = v21;
  id v23 = objc_allocWithZone((Class)type metadata accessor for VideoEffectsView());
  id v24 = [self mainScreen];
  [v24 bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  unint64_t v33 = (char *)objc_msgSend(v23, "initWithFrame:", v26, v28, v30, v32);
  id v34 = (double *)&v33[OBJC_IVAR____TtC34VideoConferenceControlCenterModule16VideoEffectsView_controlSize];
  swift_beginAccess();
  *id v34 = v20;
  *((void *)v34 + 1) = v22;
  [v1 setView:v33];

  unint64_t v35 = self;
  sub_44E28();
  swift_bridgeObjectRetain();
  NSString v36 = sub_4B2D0();
  swift_bridgeObjectRelease();
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v38 = [self bundleForClass:ObjCClassFromMetadata];
  id v39 = [v35 _visualStylingProviderForStyleSetNamed:v36 inBundle:v38];

  if (v39) {
    (*(void (**)(id))&stru_248.segname[(swift_isaMask & *v1) - 8])(v39);
  }
  else {
    __break(1u);
  }
}

uint64_t sub_3A94C()
{
  double v1 = v0;
  v29.receiver = v0;
  v29.super_class = (Class)type metadata accessor for VideoEffectsViewController();
  objc_msgSendSuper2(&v29, "viewDidLoad");
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_4B210();
  sub_40BC0(v2, (uint64_t)qword_7DDE8);
  uint64_t v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B390();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)id v5 = 136315138;
    sub_33464(0x4C64694477656976, 0xED0000292864616FLL, &v28);
    sub_4B580();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v6 = *(uint64_t (**)(void))((char *)&stru_B8.flags + (swift_isaMask & *v1));
  uint64_t v7 = (void *)v6();
  id v8 = [self systemGrayTintColor];
  [v7 setBackgroundColor:v8];

  id v9 = (void *)v6();
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v10 = (void *)v6();
  double v11 = (*(double (**)(void))&stru_1F8.segname[(swift_isaMask & *v1) - 8])();
  if (qword_7DE20 != -1) {
    swift_once();
  }
  [v10 _setContinuousCornerRadius:v11 - *(double *)&qword_7DE28];

  id v12 = (void *)v6();
  [v12 setClipsToBounds:1];

  uint64_t result = (uint64_t)[v1 view];
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v14 = (void *)result;
  id v15 = (void *)v6();
  [v14 addSubview:v15];

  uint64_t v16 = *(void **)((char *)v1
                 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_containerView);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t result = (uint64_t)[v1 view];
  if (!result)
  {
LABEL_26:
    __break(1u);
    return result;
  }
  id v17 = (void *)result;
  [(id)result addSubview:v16];

  unint64_t v18 = (*(uint64_t (**)(void))((char *)&stru_158.offset + (swift_isaMask & *v1)))();
  unint64_t v19 = v18;
  double v27 = v16;
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_4B6A0();
    uint64_t v20 = result;
    if (result) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v20 = *(void *)((char *)&dword_10 + (v18 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain();
    if (v20)
    {
LABEL_11:
      if (v20 >= 1)
      {
        uint64_t v21 = 0;
        unint64_t v22 = v19 & 0xC000000000000001;
        unint64_t v23 = v19;
        do
        {
          if (v22) {
            id v24 = (char *)sub_4B5E0();
          }
          else {
            id v24 = (char *)*(id *)(v19 + 8 * v21 + 32);
          }
          double v25 = v24;
          if (qword_7DE50 != -1) {
            swift_once();
          }
          ++v21;
          [v25 _setContinuousCornerRadius:*(double *)&qword_7DE58 * 0.5];
          [v27 addSubview:v25];
          double v26 = *(void **)&v25[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph];
          [v26 addTarget:v1 action:"buttonTappedWithSender:" forControlEvents:64];
          [v26 addTarget:v1 action:"buttonDownWithSender:" forControlEvents:1];
          [*(id *)&v25[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron] addTarget:v1 action:"chevronTappedWithSender:" forControlEvents:64];
          [*(id *)&v25[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider] addTarget:v1 action:"sliderChangedWithSender:" forControlEvents:4096];

          unint64_t v19 = v23;
        }
        while (v20 != v21);
        goto LABEL_21;
      }
      __break(1u);
      goto LABEL_25;
    }
  }
LABEL_21:
  swift_bridgeObjectRelease_n();
  sub_3AFD8();
  sub_39404();
  sub_38C04();
  sub_3B400(0);
  uint64_t result = (*(uint64_t (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v1)))();
  if ((result & 1) == 0) {
    return (uint64_t)[v1 viewWillAppear:1];
  }
  return result;
}

uint64_t sub_3AFD8()
{
  if (qword_7DE40 != -1) {
    swift_once();
  }
  double v1 = *(double *)&qword_7DE48;
  if (qword_7DE50 != -1) {
    swift_once();
  }
  double v2 = *(double *)&qword_7DE58;
  if (qword_7DE30 != -1) {
    swift_once();
  }
  double v3 = *(double *)&qword_7DE38;
  uint64_t v4 = *(void *)((*(uint64_t (**)(void))((char *)&stru_158.flags + (swift_isaMask & *v0)))() + 16);
  swift_bridgeObjectRelease();
  if (!v4)
  {
    type metadata accessor for CGRect(0);
    uint64_t v5 = sub_4B380();
    *(void *)(v5 + 16) = 4;
    *(_OWORD *)(v5 + 32) = 0u;
    *(_OWORD *)(v5 + 48) = 0u;
    *(_OWORD *)(v5 + 64) = 0u;
    *(_OWORD *)(v5 + 80) = 0u;
    *(_OWORD *)(v5 + 96) = 0u;
    *(_OWORD *)(v5 + 112) = 0u;
    *(_OWORD *)(v5 + 128) = 0u;
    *(_OWORD *)(v5 + 144) = 0u;
    (*(void (**)(void))((char *)&stru_158.reserved2 + (swift_isaMask & *v0)))();
  }
  uint64_t v6 = *(uint64_t (**)(unsigned char *))&stru_1A8.sectname[swift_isaMask & *v0];
  uint64_t v7 = (void (*)(unsigned char *, void))v6(v19);
  id v9 = v8;
  uint64_t v10 = *v8;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  void *v9 = v10;
  if (isUniquelyReferenced_nonNull_native)
  {
    if (*((void *)v10 + 2)) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v10 = (double *)sub_406F4(v10);
    void *v9 = v10;
    if (*((void *)v10 + 2))
    {
LABEL_11:
      v10[4] = 0.0;
      v10[5] = 0.0;
      v10[6] = v1;
      v10[7] = v2;
      v7(v19, 0);
      uint64_t v7 = (void (*)(unsigned char *, void))v6(v19);
      id v9 = v12;
      uint64_t v10 = *v12;
      char v13 = swift_isUniquelyReferenced_nonNull_native();
      void *v9 = v10;
      if (v13) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_21:
  uint64_t v10 = (double *)sub_406F4(v10);
  void *v9 = v10;
LABEL_12:
  if (*((void *)v10 + 2) < 2uLL)
  {
    __break(1u);
  }
  else
  {
    double v3 = v2 + v3;
    v10[8] = 0.0;
    v10[9] = v3;
    v10[10] = v1;
    v10[11] = v2;
    v7(v19, 0);
    uint64_t v7 = (void (*)(unsigned char *, void))v6(v19);
    id v9 = v14;
    uint64_t v10 = *v14;
    char v15 = swift_isUniquelyReferenced_nonNull_native();
    void *v9 = v10;
    if (v15) {
      goto LABEL_14;
    }
  }
  uint64_t v10 = (double *)sub_406F4(v10);
  void *v9 = v10;
LABEL_14:
  if (*((void *)v10 + 2) < 3uLL)
  {
    __break(1u);
  }
  else
  {
    v10[12] = 0.0;
    v10[13] = v3 + v3;
    v10[14] = v1;
    v10[15] = v2;
    v7(v19, 0);
    uint64_t v7 = (void (*)(unsigned char *, void))v6(v19);
    id v9 = v16;
    uint64_t v10 = *v16;
    char v17 = swift_isUniquelyReferenced_nonNull_native();
    void *v9 = v10;
    if (v17) {
      goto LABEL_16;
    }
  }
  uint64_t v10 = (double *)sub_406F4(v10);
  void *v9 = v10;
LABEL_16:
  if (*((void *)v10 + 2) < 4uLL)
  {
    __break(1u);
    goto LABEL_27;
  }
  v10[16] = 0.0;
  v10[17] = v3 * 3.0;
  v10[18] = v1;
  v10[19] = v2;
  v7(v19, 0);
  if (qword_7DE60 != -1) {
LABEL_27:
  }
    swift_once();
  return (*(uint64_t (**)(double, double, double, double))&stru_1A8.segname[swift_isaMask & *v0])(0.0, 0.0, v1, *(double *)&qword_7DE68);
}

void sub_3B400(char a1)
{
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_4B210();
  sub_40BC0(v3, (uint64_t)qword_7DDE8);
  uint64_t v4 = sub_4B1F0();
  os_log_type_t v5 = sub_4B390();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    sub_33464(0xD00000000000002ALL, 0x8000000000060360, aBlock);
    sub_4B580();
    _os_log_impl(&dword_0, v4, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v7 = v1;
  id v8 = sub_4B1F0();
  os_log_type_t v9 = sub_4B390();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 134217984;
    unint64_t v11 = (*(uint64_t (**)(void))((char *)&stru_158.reloff + (swift_isaMask & (uint64_t)v7->isa)))();
    if (v11 >> 62) {
      uint64_t v12 = sub_4B6A0();
    }
    else {
      uint64_t v12 = *(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8));
    }

    swift_bridgeObjectRelease();
    aBlock[0] = v12;
    sub_4B580();

    _os_log_impl(&dword_0, v8, v9, "supportedCount=%ld", v10, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    id v8 = v7;
  }

  if (a1) {
    double v13 = 0.3;
  }
  else {
    double v13 = 0.0;
  }
  uint64_t v14 = self;
  uint64_t v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = (uint64_t)sub_41CF4;
  aBlock[5] = v15;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_38B58;
  aBlock[3] = (uint64_t)&unk_69C68;
  uint64_t v16 = _Block_copy(aBlock);
  swift_release();
  [v14 animateWithDuration:v16 animations:v13];
  _Block_release(v16);
}

void *sub_3B7A0(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v6 = sub_3F368((uint64_t)a1);
      if (v7)
      {
        os_log_type_t v5 = *(void **)(*(void *)(a2 + 56) + 8 * v6);
        id v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  id v3 = a1;
  uint64_t v4 = sub_4B660();

  if (!v4) {
    return 0;
  }
  sub_42194(0, &qword_7D918);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  os_log_type_t v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

void sub_3B878(char a1)
{
  double v2 = v1;
  v24.receiver = v2;
  v24.super_class = (Class)type metadata accessor for VideoEffectsViewController();
  objc_msgSendSuper2(&v24, "viewWillAppear:", a1 & 1);
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_4B210();
  sub_40BC0(v4, (uint64_t)qword_7DDE8);
  os_log_type_t v5 = sub_4B1F0();
  os_log_type_t v6 = sub_4B390();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)char v7 = 136315138;
    sub_33464(0xD000000000000012, 0x800000000005FC80, &v23);
    sub_4B580();
    _os_log_impl(&dword_0, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_36F00();
  id v8 = *(void **)((char *)v2
                  + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsPreview);
  if (qword_7DE00 != -1) {
    swift_once();
  }
  if (qword_7DE10 != -1) {
    swift_once();
  }
  double v9 = sub_4102C();
  uint64_t v10 = (*(uint64_t (**)(double))((char *)&stru_68.reserved2 + (swift_isaMask & *v8)))(v9);
  unint64_t v11 = (void *)(*(uint64_t (**)(uint64_t))&stru_68.sectname[swift_isaMask & *v8])(v10);
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = v11;
    uint64_t v14 = sub_4B1F0();
    os_log_type_t v15 = sub_4B390();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc();
      unint64_t v22 = (void *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315394;
      sub_33464(0xD000000000000012, 0x800000000005FC80, &v23);
      sub_4B580();
      *(_WORD *)(v16 + 12) = 2112;
      id v17 = v13;
      sub_4B580();
      *unint64_t v22 = v12;

      _os_log_impl(&dword_0, v14, v15, "%s adding videoView=%@ to previewView", (uint8_t *)v16, 0x16u);
      sub_33ABC(&qword_7D910);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    unint64_t v18 = *(uint64_t (**)(void *))((char *)&stru_108.size + (swift_isaMask & *v2));
    id v19 = v13;
    uint64_t v20 = v18(v12);
    uint64_t v21 = (void *)(*(uint64_t (**)(uint64_t))((char *)&stru_B8.flags + (swift_isaMask & *v2)))(v20);
    [v21 addSubview:v19];

    sub_39F58();
    (*(void (**)(void))((char *)&stru_68.reloff + (swift_isaMask & *v8)))();
  }
}

id sub_3BDE8(char a1)
{
  double v2 = v1;
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_4B210();
  sub_40BC0(v4, (uint64_t)qword_7DDE8);
  os_log_type_t v5 = sub_4B1F0();
  os_log_type_t v6 = sub_4B390();
  if (os_log_type_enabled(v5, v6))
  {
    char v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)char v7 = 136315138;
    sub_33464(0xD000000000000015, 0x800000000005FCA0, &v15);
    sub_4B580();
    _os_log_impl(&dword_0, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v8 = *(void **)((char *)v2
                  + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsPreview);
  uint64_t v10 = (*(uint64_t (**)(uint64_t))((char *)&stru_68.flags + (swift_isaMask & *v8)))(v9);
  unint64_t v11 = (void *)(*(uint64_t (**)(uint64_t))&stru_108.segname[(swift_isaMask & *v2) + 16])(v10);
  if (v11)
  {
    uint64_t v12 = v11;
    [v11 removeFromSuperview];
    (*(void (**)(void))((char *)&stru_108.size + (swift_isaMask & *v2)))(0);
  }
  (*(void (**)(void *))&stru_B8.sectname[swift_isaMask & *v8])(v11);
  id v13 = (objc_class *)type metadata accessor for VideoEffectsViewController();
  v16.receiver = v2;
  v16.super_class = v13;
  return objc_msgSendSuper2(&v16, "viewWillDisappear:", a1 & 1);
}

id sub_3C0F4(char a1)
{
  return sub_3C248(a1, 0xD000000000000011, 0x800000000005FCC0, (SEL *)&selRef_viewDidAppear_);
}

id sub_3C18C(char a1)
{
  return sub_3C248(a1, 0xD000000000000014, 0x800000000005FCE0, (SEL *)&selRef_viewDidDisappear_);
}

id sub_3C224(char a1)
{
  return sub_3C248(a1, 0xD000000000000013, 0x800000000005FD00, (SEL *)&selRef_viewIsAppearing_);
}

id sub_3C248(char a1, uint64_t a2, unint64_t a3, SEL *a4)
{
  id v8 = v4;
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_4B210();
  sub_40BC0(v10, (uint64_t)qword_7DDE8);
  unint64_t v11 = sub_4B1F0();
  os_log_type_t v12 = sub_4B390();
  if (os_log_type_enabled(v11, v12))
  {
    id v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)id v13 = 136315138;
    sub_33464(a2, a3, &v16);
    sub_4B580();
    _os_log_impl(&dword_0, v11, v12, "%s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v14 = (objc_class *)type metadata accessor for VideoEffectsViewController();
  v17.receiver = v8;
  v17.super_class = v14;
  return objc_msgSendSuper2(&v17, *a4, a1 & 1);
}

id sub_3C474(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_4B2D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id sub_3C4EC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_previewViewContainer;
  id v7 = objc_allocWithZone((Class)UIView);
  id v8 = v3;
  *(void *)&v3[v6] = [v7 init];
  uint64_t v9 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_previewViewContainerHeightConstraint;
  *(void *)&v8[v9] = [objc_allocWithZone((Class)NSLayoutConstraint) init];
  *(void *)&v8[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoPreviewView] = 0;
  uint64_t v10 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_containerView;
  *(void *)&v8[v10] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v11 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_unavailableLabel;
  *(void *)&v8[v11] = sub_34D04();
  uint64_t v12 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_centerStageButton;
  if (qword_7DE70 != -1) {
    swift_once();
  }
  long long v67 = xmmword_7E790;
  long long v68 = xmmword_7E7A0;
  long long v69 = xmmword_7E7B0;
  long long v63 = xmmword_7E750;
  long long v64 = unk_7E760;
  long long v65 = xmmword_7E770;
  long long v66 = unk_7E780;
  long long v61 = xmmword_7E730;
  long long v62 = unk_7E740;
  sub_34F30();
  *(void *)&v8[v12] = v13;
  uint64_t v14 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_portraitButton;
  if (qword_7DE78 != -1) {
    swift_once();
  }
  long long v58 = xmmword_7E820;
  long long v59 = xmmword_7E830;
  long long v60 = xmmword_7E840;
  long long v54 = xmmword_7E7E0;
  long long v55 = unk_7E7F0;
  long long v56 = xmmword_7E800;
  long long v57 = unk_7E810;
  long long v52 = xmmword_7E7C0;
  long long v53 = unk_7E7D0;
  sub_34F30();
  *(void *)&v8[v14] = v15;
  uint64_t v16 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_studioLightButton;
  if (qword_7DE80 != -1) {
    swift_once();
  }
  long long v49 = xmmword_7E8B0;
  long long v50 = xmmword_7E8C0;
  long long v51 = xmmword_7E8D0;
  long long v45 = xmmword_7E870;
  long long v46 = unk_7E880;
  long long v47 = xmmword_7E890;
  long long v48 = *(_OWORD *)byte_7E8A0;
  long long v43 = xmmword_7E850;
  long long v44 = unk_7E860;
  sub_34F30();
  *(void *)&v8[v16] = v17;
  uint64_t v18 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton;
  if (qword_7DE88 != -1) {
    swift_once();
  }
  long long v41 = xmmword_7E950;
  long long v42 = xmmword_7E960;
  long long v36 = xmmword_7E900;
  long long v37 = unk_7E910;
  long long v39 = unk_7E930;
  long long v40 = xmmword_7E940;
  long long v38 = xmmword_7E920;
  long long v34 = xmmword_7E8E0;
  long long v35 = unk_7E8F0;
  sub_34F30();
  *(void *)&v8[v18] = v19;
  v8[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_shouldLoadFromSensor] = 0;
  *(void *)&v8[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_contentModuleContext] = 0;
  uint64_t v20 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsManager;
  *(void *)&v8[v20] = [objc_allocWithZone((Class)VideoEffectsManager) init];
  uint64_t v21 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsPreview;
  type metadata accessor for VideoEffectsPreview();
  *(void *)&v8[v21] = sub_332F4();
  *(void *)&v8[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_buttonRects] = &_swiftEmptyArrayStorage;
  unint64_t v22 = &v8[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_expandedButtonRect];
  *(_OWORD *)unint64_t v22 = 0u;
  *((_OWORD *)v22 + 1) = 0u;
  uint64_t v23 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_buttonTopConstraints;
  *(void *)&v8[v23] = sub_40AC8(&_swiftEmptyArrayStorage);
  uint64_t v24 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_buttonHeightConstraints;
  *(void *)&v8[v24] = sub_40AC8(&_swiftEmptyArrayStorage);
  *(void *)&v8[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_compactContinuousCornerRadius] = 0;
  uint64_t v25 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_categoriesToVisualStylingProviders;
  *(void *)&v8[v25] = sub_35D3C((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v26 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_requiredVisualStyleCategories;
  sub_33ABC(&qword_7D8C0);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_553C0;
  *(void *)(v27 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:2];
  *(void *)(v27 + 40) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  uint64_t v33 = v27;
  sub_4B370();
  *(void *)&v8[v26] = v27;
  uint64_t v28 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_platterStrokeVisualStylingProvider;
  *(void *)&v8[v28] = [objc_allocWithZone((Class)RPCCMTVisualStylingProvider) init];

  if (a2)
  {
    NSString v29 = sub_4B2D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v29 = 0;
  }
  v32.receiver = v8;
  v32.super_class = (Class)type metadata accessor for VideoEffectsViewController();
  id v30 = objc_msgSendSuper2(&v32, "initWithNibName:bundle:", v29, a3);

  return v30;
}

id sub_3C9B4(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_previewViewContainer;
  id v4 = objc_allocWithZone((Class)UIView);
  os_log_type_t v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_previewViewContainerHeightConstraint;
  *(void *)&v5[v6] = [objc_allocWithZone((Class)NSLayoutConstraint) init];
  *(void *)&v5[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoPreviewView] = 0;
  uint64_t v7 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_containerView;
  *(void *)&v5[v7] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v8 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_unavailableLabel;
  *(void *)&v5[v8] = sub_34D04();
  uint64_t v9 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_centerStageButton;
  if (qword_7DE70 != -1) {
    swift_once();
  }
  long long v63 = xmmword_7E790;
  long long v64 = xmmword_7E7A0;
  long long v65 = xmmword_7E7B0;
  long long v59 = xmmword_7E750;
  long long v60 = unk_7E760;
  long long v61 = xmmword_7E770;
  long long v62 = unk_7E780;
  long long v57 = xmmword_7E730;
  long long v58 = unk_7E740;
  sub_34F30();
  *(void *)&v5[v9] = v10;
  uint64_t v11 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_portraitButton;
  if (qword_7DE78 != -1) {
    swift_once();
  }
  long long v54 = xmmword_7E820;
  long long v55 = xmmword_7E830;
  long long v56 = xmmword_7E840;
  long long v50 = xmmword_7E7E0;
  long long v51 = unk_7E7F0;
  long long v52 = xmmword_7E800;
  long long v53 = unk_7E810;
  long long v48 = xmmword_7E7C0;
  long long v49 = unk_7E7D0;
  sub_34F30();
  *(void *)&v5[v11] = v12;
  uint64_t v13 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_studioLightButton;
  if (qword_7DE80 != -1) {
    swift_once();
  }
  long long v45 = xmmword_7E8B0;
  long long v46 = xmmword_7E8C0;
  long long v47 = xmmword_7E8D0;
  long long v41 = xmmword_7E870;
  long long v42 = unk_7E880;
  long long v43 = xmmword_7E890;
  long long v44 = *(_OWORD *)byte_7E8A0;
  long long v39 = xmmword_7E850;
  long long v40 = unk_7E860;
  sub_34F30();
  *(void *)&v5[v13] = v14;
  uint64_t v15 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton;
  if (qword_7DE88 != -1) {
    swift_once();
  }
  long long v37 = xmmword_7E950;
  long long v38 = xmmword_7E960;
  long long v32 = xmmword_7E900;
  long long v33 = unk_7E910;
  long long v35 = unk_7E930;
  long long v36 = xmmword_7E940;
  long long v34 = xmmword_7E920;
  long long v30 = xmmword_7E8E0;
  long long v31 = unk_7E8F0;
  sub_34F30();
  *(void *)&v5[v15] = v16;
  v5[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_shouldLoadFromSensor] = 0;
  *(void *)&v5[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_contentModuleContext] = 0;
  uint64_t v17 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsManager;
  *(void *)&v5[v17] = [objc_allocWithZone((Class)VideoEffectsManager) init];
  uint64_t v18 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsPreview;
  type metadata accessor for VideoEffectsPreview();
  *(void *)&v5[v18] = sub_332F4();
  *(void *)&v5[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_buttonRects] = &_swiftEmptyArrayStorage;
  uint64_t v19 = &v5[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_expandedButtonRect];
  *(_OWORD *)uint64_t v19 = 0u;
  *((_OWORD *)v19 + 1) = 0u;
  uint64_t v20 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_buttonTopConstraints;
  *(void *)&v5[v20] = sub_40AC8(&_swiftEmptyArrayStorage);
  uint64_t v21 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_buttonHeightConstraints;
  *(void *)&v5[v21] = sub_40AC8(&_swiftEmptyArrayStorage);
  *(void *)&v5[OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_compactContinuousCornerRadius] = 0;
  uint64_t v22 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_categoriesToVisualStylingProviders;
  *(void *)&v5[v22] = sub_35D3C((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v23 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_requiredVisualStyleCategories;
  sub_33ABC(&qword_7D8C0);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_553C0;
  *(void *)(v24 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:2];
  *(void *)(v24 + 40) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  uint64_t v29 = v24;
  sub_4B370();
  *(void *)&v5[v23] = v24;
  uint64_t v25 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_platterStrokeVisualStylingProvider;
  *(void *)&v5[v25] = [objc_allocWithZone((Class)RPCCMTVisualStylingProvider) init];

  v28.receiver = v5;
  v28.super_class = (Class)type metadata accessor for VideoEffectsViewController();
  id v26 = objc_msgSendSuper2(&v28, "initWithCoder:", a1);

  return v26;
}

id sub_3CE10()
{
  return sub_3CE28(type metadata accessor for VideoEffectsViewController);
}

id sub_3CE28(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_3CFAC()
{
  double v1 = v0;
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_4B210();
  sub_40BC0(v2, (uint64_t)qword_7DDE8);
  objc_super v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B390();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v5 = 136315138;
    sub_33464(0xD000000000000012, 0x800000000005FD20, &v6);
    sub_4B580();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_38C04();
  if ([v1 isViewLoaded]) {
    sub_3B400(1);
  }
}

void *sub_3D19C(uint64_t a1)
{
  id v2 = [objc_allocWithZone((Class)NSNumber) initWithInteger:a1];
  uint64_t v3 = (*(uint64_t (**)(void))&stru_1F8.segname[(swift_isaMask & *v1) + 16])();
  os_log_type_t v4 = sub_3B7A0(v2, v3);

  swift_bridgeObjectRelease();
  return v4;
}

void sub_3D250(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_7DDE0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_4B210();
  sub_40BC0(v6, (uint64_t)qword_7DDE8);
  id v7 = a1;
  uint64_t v8 = sub_4B1F0();
  os_log_type_t v9 = sub_4B390();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315650;
    sub_33464(0xD000000000000020, 0x800000000005FD40, v32);
    sub_4B580();
    *(_WORD *)(v10 + 12) = 2080;
    uint64_t v11 = a1;
    uint64_t v12 = a2;
    id v13 = v7;
    sub_33ABC((uint64_t *)&unk_7D920);
    uint64_t v14 = sub_4B310();
    sub_33464(v14, v15, v32);
    sub_4B580();

    a2 = v12;
    a1 = v11;
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 22) = 2080;
    type metadata accessor for RPCCMTVisualStyleCategory(0);
    uint64_t v16 = sub_4B310();
    sub_33464(v16, v17, v32);
    sub_4B580();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v8, v9, "%s setting provider=%s for categor=%s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v18 = [objc_allocWithZone((Class)NSNumber) initWithInteger:a2];
  uint64_t v19 = *(uint64_t (**)(void))&stru_1F8.segname[(swift_isaMask & *v3) + 16];
  id v20 = v18;
  uint64_t v21 = v19();
  uint64_t v22 = sub_3B7A0(v20, v21);

  swift_bridgeObjectRelease();
  if (a1)
  {
    uint64_t v23 = v7;
    if (v22)
    {
      sub_42194(0, &qword_7D918);
      id v24 = v7;
      id v25 = v22;
      char v26 = sub_4B400();

      if (v26)
      {

        goto LABEL_15;
      }
    }
  }
  else
  {
    uint64_t v23 = v7;
    if (!v22) {
      goto LABEL_15;
    }
  }
  uint64_t v27 = *(uint64_t (**)(uint64_t *))((char *)&stru_1F8.offset + (swift_isaMask & *v3));
  id v28 = v23;
  id v29 = v20;
  long long v30 = (void (*)(uint64_t *, void))v27(v32);
  if (a1)
  {
    sub_3F6B4((uint64_t)v28, v29);
    long long v31 = v29;
  }
  else
  {
    long long v31 = (void *)sub_3F564((unint64_t)v29);
  }
  v30(v32, 0);
  sub_3D674(a2, a1, v22);

  id v20 = v22;
LABEL_15:
}

void sub_3D674(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  if (a1 == 2)
  {
    if (qword_7DDE0 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_4B210();
    sub_40BC0(v13, (uint64_t)qword_7DDE8);
    uint64_t v14 = sub_4B1F0();
    os_log_type_t v15 = sub_4B390();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136315138;
      sub_33464(0xD000000000000045, 0x800000000005FD70, &v17);
      sub_4B580();
      _os_log_impl(&dword_0, v14, v15, "%s updating provider views for fill", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    if (a3) {
      [a3 stopAutomaticallyUpdatingView:*(void *)(v4 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton)];
    }
    if (a2) {
      [a2 automaticallyUpdateView:*(void *)(v4 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton) withStyle:0];
    }
  }
  else if (a1 == 1)
  {
    if (qword_7DDE0 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_4B210();
    sub_40BC0(v7, (uint64_t)qword_7DDE8);
    uint64_t v8 = sub_4B1F0();
    os_log_type_t v9 = sub_4B390();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 136315138;
      sub_33464(0xD000000000000045, 0x800000000005FD70, &v17);
      sub_4B580();
      _os_log_impl(&dword_0, v8, v9, "%s updating provider views for stroke", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    if (a3)
    {
      id v11 = [*(id *)(*(void *)(v4+ OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton)+ OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph) titleLabel];
      [a3 stopAutomaticallyUpdatingView:v11];
    }
    if (a2)
    {
      id v12 = [*(id *)(*(void *)(v4+ OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton)+ OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph) titleLabel];
      [a2 automaticallyUpdateView:v12 withStyle:0];
    }
  }
}

double sub_3DAA4()
{
  double v0 = self;
  NSString v1 = sub_4B2D0();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  uint64_t v3 = sub_4B300();
  uint64_t v5 = v4;

  id v6 = [self systemBlueColor];
  LODWORD(xmmword_7E730) = 0x10000;
  *((void *)&xmmword_7E730 + 1) = v3;
  unk_7E740 = v5;
  qword_7E748 = 0;
  *(void *)&xmmword_7E750 = 0;
  *((void *)&xmmword_7E750 + 1) = 0xD000000000000016;
  unk_7E760 = 0x8000000000060550;
  qword_7E768 = 0xD000000000000016;
  *(void *)&xmmword_7E770 = 0x8000000000060550;
  *((void *)&xmmword_7E770 + 1) = v6;
  unk_7E780 = 0xD000000000000016;
  qword_7E788 = 0x8000000000060550;
  *(void *)&xmmword_7E790 = 0xD000000000000016;
  *((void *)&xmmword_7E790 + 1) = 0x8000000000060550;
  double result = 23.0;
  xmmword_7E7A0 = xmmword_553E0;
  xmmword_7E7B0 = 0uLL;
  return result;
}

uint64_t sub_3DBA0@<X0>(uint64_t a1@<X8>)
{
  return sub_3E0F0(&qword_7DE70, (uint64_t)&xmmword_7E730, a1);
}

double sub_3DBC4()
{
  double v0 = self;
  NSString v1 = sub_4B2D0();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  uint64_t v3 = sub_4B300();
  uint64_t v5 = v4;

  NSString v6 = sub_4B2D0();
  id v7 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v6];

  uint64_t v8 = sub_4B300();
  uint64_t v10 = v9;

  NSString v11 = sub_4B2D0();
  id v12 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v11];

  uint64_t v13 = sub_4B300();
  uint64_t v15 = v14;

  id v16 = [self systemBlueColor];
  LODWORD(xmmword_7E7C0) = 65793;
  *((void *)&xmmword_7E7C0 + 1) = v3;
  unk_7E7D0 = v5;
  qword_7E7D8 = v8;
  *(void *)&xmmword_7E7E0 = v10;
  *((void *)&xmmword_7E7E0 + 1) = 0x7669737275632E66;
  unk_7E7F0 = 0xE900000000000065;
  qword_7E7F8 = 0x7669737275632E66;
  *(void *)&xmmword_7E800 = 0xE900000000000065;
  *((void *)&xmmword_7E800 + 1) = v16;
  unk_7E810 = 0x7669737275632E66;
  qword_7E818 = 0xE900000000000065;
  *(void *)&xmmword_7E820 = 0x7669737275632E66;
  *((void *)&xmmword_7E820 + 1) = 0xE900000000000065;
  double result = 27.0;
  xmmword_7E830 = xmmword_553F0;
  *(void *)&xmmword_7E840 = v13;
  *((void *)&xmmword_7E840 + 1) = v15;
  return result;
}

uint64_t sub_3DD84@<X0>(uint64_t a1@<X8>)
{
  return sub_3E0F0(&qword_7DE78, (uint64_t)&xmmword_7E7C0, a1);
}

double sub_3DDA8()
{
  double v0 = self;
  NSString v1 = sub_4B2D0();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  uint64_t v3 = sub_4B300();
  uint64_t v5 = v4;

  NSString v6 = sub_4B2D0();
  id v7 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v6];

  uint64_t v8 = sub_4B300();
  uint64_t v10 = v9;

  NSString v11 = sub_4B2D0();
  id v12 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v11];

  uint64_t v13 = sub_4B300();
  uint64_t v15 = v14;

  id v16 = [self systemBlueColor];
  LODWORD(xmmword_7E850) = 65794;
  *((void *)&xmmword_7E850 + 1) = v3;
  unk_7E860 = v5;
  qword_7E868 = v8;
  *(void *)&xmmword_7E870 = v10;
  *((void *)&xmmword_7E870 + 1) = 0x6C69662E65627563;
  unk_7E880 = 0xE90000000000006CLL;
  qword_7E888 = 1700951395;
  *(void *)&xmmword_7E890 = 0xE400000000000000;
  *((void *)&xmmword_7E890 + 1) = v16;
  strcpy(byte_7E8A0, "sun.max.fill");
  BYTE5(qword_7E8A8) = 0;
  HIWORD(qword_7E8A8) = -5120;
  strcpy((char *)&xmmword_7E8B0, "sun.max.fill");
  BYTE13(xmmword_7E8B0) = 0;
  HIWORD(xmmword_7E8B0) = -5120;
  double result = 32.0;
  xmmword_7E8C0 = xmmword_55400;
  *(void *)&xmmword_7E8D0 = v13;
  *((void *)&xmmword_7E8D0 + 1) = v15;
  return result;
}

uint64_t sub_3DF90@<X0>(uint64_t a1@<X8>)
{
  return sub_3E0F0(&qword_7DE80, (uint64_t)&xmmword_7E850, a1);
}

double sub_3DFB4()
{
  double v0 = self;
  NSString v1 = sub_4B2D0();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  uint64_t v3 = sub_4B300();
  uint64_t v5 = v4;

  id v6 = [self systemBlueColor];
  LODWORD(xmmword_7E8E0) = 65539;
  *((void *)&xmmword_7E8E0 + 1) = v3;
  unk_7E8F0 = v5;
  qword_7E8F8 = 0;
  *(void *)&xmmword_7E900 = 0;
  *((void *)&xmmword_7E900 + 1) = 0xD000000000000013;
  unk_7E910 = 0x80000000000603E0;
  qword_7E918 = 0xD000000000000018;
  *(void *)&xmmword_7E920 = 0x8000000000060400;
  *((void *)&xmmword_7E920 + 1) = v6;
  unk_7E930 = 0xD000000000000013;
  qword_7E938 = 0x80000000000603E0;
  *(void *)&xmmword_7E940 = 0xD000000000000018;
  *((void *)&xmmword_7E940 + 1) = 0x8000000000060400;
  double result = 23.0;
  xmmword_7E950 = xmmword_553E0;
  xmmword_7E960 = 0uLL;
  return result;
}

uint64_t sub_3E0CC@<X0>(uint64_t a1@<X8>)
{
  return sub_3E0F0(&qword_7DE88, (uint64_t)&xmmword_7E8E0, a1);
}

uint64_t sub_3E0F0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }

  return sub_41054(a2, a3);
}

void sub_3E144()
{
  qword_7DE98 = 0x4031000000000000;
}

void sub_3E154()
{
  qword_7DEA8 = 0x402A000000000000;
}

void sub_3E164()
{
  qword_7DEB8 = 0x4039000000000000;
}

void sub_3E174()
{
  qword_7DEC8 = 0x4024000000000000;
}

void *sub_3E184(int a1)
{
  id v2 = v1;
  int v67 = a1;
  uint64_t v3 = sub_33ABC((uint64_t *)&unk_7DCB0);
  __chkstk_darwin(v3 - 8);
  long long v66 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_33ABC(&qword_7D930);
  __chkstk_darwin(v5 - 8);
  long long v65 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_33ABC(&qword_7D938);
  __chkstk_darwin(v7 - 8);
  long long v59 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_4B420();
  uint64_t v9 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  NSString v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_4B450();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_4B530();
  uint64_t v63 = *(void *)(v16 - 8);
  uint64_t v64 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  long long v58 = (char *)&v56 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  id v20 = (char *)&v56 - v19;
  uint64_t v21 = sub_4B1C0();
  uint64_t v61 = *(void *)(v21 - 8);
  uint64_t v62 = v21;
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v56 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4B1B0();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  id v24 = self;
  if (qword_7DE90 != -1) {
    swift_once();
  }
  aBlock[0] = [v24 systemFontOfSize:*(double *)&qword_7DE98];
  sub_41068();
  long long v60 = v23;
  sub_4B1A0();
  sub_4B520();
  swift_bridgeObjectRetain();
  sub_4B510();
  swift_bridgeObjectRetain();
  NSString v25 = sub_4B2D0();
  swift_bridgeObjectRelease();
  id v26 = [self _systemImageNamed:v25];

  sub_4B4F0();
  (*(void (**)(char *, void, uint64_t))(v13 + 104))(v15, enum case for UIButton.Configuration.TitleAlignment.leading(_:), v12);
  sub_4B470();
  sub_4B460();
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for UIButton.Configuration.CornerStyle.capsule(_:), v57);
  sub_4B430();
  if (qword_7DEB0 != -1) {
    swift_once();
  }
  sub_4B480();
  if (qword_7DEC0 != -1) {
    swift_once();
  }
  sub_4B440();
  if (qword_7DEA0 != -1) {
    swift_once();
  }
  id v27 = [self configurationWithPointSize:*(double *)&qword_7DEA8];
  sub_4B410();
  sub_42194(0, (unint64_t *)&unk_7DD70);
  uint64_t v29 = v63;
  uint64_t v28 = v64;
  long long v30 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
  v30(v58, v20, v64);
  long long v31 = (void *)sub_4B540();
  long long v32 = (_OWORD *)swift_allocObject();
  long long v33 = *((_OWORD *)v2 + 7);
  v32[7] = *((_OWORD *)v2 + 6);
  v32[8] = v33;
  v32[9] = *((_OWORD *)v2 + 8);
  long long v34 = *((_OWORD *)v2 + 3);
  v32[3] = *((_OWORD *)v2 + 2);
  uint64_t v32[4] = v34;
  long long v35 = *((_OWORD *)v2 + 5);
  v32[5] = *((_OWORD *)v2 + 4);
  v32[6] = v35;
  long long v36 = *((_OWORD *)v2 + 1);
  v32[1] = *(_OWORD *)v2;
  v32[2] = v36;
  aBlock[4] = sub_41158;
  aBlock[5] = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_3EDF0;
  aBlock[3] = &unk_69920;
  long long v37 = _Block_copy(aBlock);
  sub_41160((uint64_t)v2);
  swift_release();
  [v31 setConfigurationUpdateHandler:v37];
  _Block_release(v37);
  uint64_t v38 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v39 = swift_allocObject();
  long long v40 = *((_OWORD *)v2 + 4);
  *(_OWORD *)(v39 + 104) = *((_OWORD *)v2 + 5);
  long long v41 = *((_OWORD *)v2 + 7);
  *(_OWORD *)(v39 + 120) = *((_OWORD *)v2 + 6);
  *(_OWORD *)(v39 + 136) = v41;
  *(_OWORD *)(v39 + 152) = *((_OWORD *)v2 + 8);
  long long v42 = *(_OWORD *)v2;
  *(_OWORD *)(v39 + 40) = *((_OWORD *)v2 + 1);
  long long v43 = *((_OWORD *)v2 + 3);
  *(_OWORD *)(v39 + 56) = *((_OWORD *)v2 + 2);
  *(_OWORD *)(v39 + 72) = v43;
  *(_OWORD *)(v39 + 88) = v40;
  *(void *)(v39 + 16) = v38;
  *(_OWORD *)(v39 + 24) = v42;
  sub_41160((uint64_t)v2);
  long long v44 = v59;
  sub_4B250();
  uint64_t v45 = sub_4B240();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 0, 1, v45);
  sub_4B4D0();
  uint64_t v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v47 = swift_allocObject();
  long long v48 = *((_OWORD *)v2 + 4);
  *(_OWORD *)(v47 + 104) = *((_OWORD *)v2 + 5);
  long long v49 = *((_OWORD *)v2 + 7);
  *(_OWORD *)(v47 + 120) = *((_OWORD *)v2 + 6);
  *(_OWORD *)(v47 + 136) = v49;
  *(_OWORD *)(v47 + 152) = *((_OWORD *)v2 + 8);
  long long v50 = *(_OWORD *)v2;
  *(_OWORD *)(v47 + 40) = *((_OWORD *)v2 + 1);
  long long v51 = *((_OWORD *)v2 + 3);
  *(_OWORD *)(v47 + 56) = *((_OWORD *)v2 + 2);
  *(_OWORD *)(v47 + 72) = v51;
  *(_OWORD *)(v47 + 88) = v48;
  *(void *)(v47 + 16) = v46;
  *(_OWORD *)(v47 + 24) = v50;
  sub_41160((uint64_t)v2);
  long long v52 = v65;
  sub_4B230();
  uint64_t v53 = sub_4B220();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v53 - 8) + 56))(v52, 0, 1, v53);
  sub_4B4C0();
  long long v54 = v66;
  v30(v66, v20, v28);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v29 + 56))(v54, 0, 1, v28);
  sub_4B560();
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v31 setContentHorizontalAlignment:4];
  [v31 setSelected:v67 & 1];
  [v31 setTag:*v2];
  (*(void (**)(char *, uint64_t))(v29 + 8))(v20, v28);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v60, v62);
  return v31;
}

uint64_t sub_3EAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3F10C(a1, a2, a3, (uint64_t *)&unk_7DB00);
}

uint64_t sub_3EB08(uint64_t a1, uint64_t a2)
{
  return sub_3F170(a1, a2, (uint64_t *)&unk_7DB00);
}

void sub_3EB14()
{
}

void sub_3EB3C()
{
}

uint64_t sub_3EB58(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_33ABC((uint64_t *)&unk_7DCB0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t v10 = sub_4B530();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4B550();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_4B520();
    sub_41BA8((uint64_t)v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
  }
  if (([a1 isHighlighted] & 1) != 0 || objc_msgSend(a1, "isSelected"))
  {
    id v14 = *(id *)(a2 + 72);
    sub_4B4B0();
    uint64_t v15 = self;
    uint64_t v16 = &selRef_systemWhiteColor;
  }
  else
  {
    uint64_t v15 = self;
    id v17 = [v15 systemWhiteColor];
    sub_4B4B0();
    uint64_t v16 = &selRef_clearColor;
  }
  id v18 = [v15 *v16];
  sub_4B4A0();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v13, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
  sub_4B560();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_3EDF0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_3EE58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_4B1C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  if (!Strong) {
    return v11(a3, a1, v6);
  }
  uint64_t v12 = (void *)Strong;
  v11((uint64_t)v9, a1, v6);
  uint64_t KeyPath = swift_getKeyPath();
  *(&v18 - 2) = (id)__chkstk_darwin(KeyPath);
  swift_getKeyPath();
  id v14 = self;
  if (qword_7DE90 != -1) {
    swift_once();
  }
  id v18 = [v14 systemFontOfSize:*(double *)&qword_7DE98];
  sub_41068();
  sub_4B1A0();
  uint64_t v15 = swift_getKeyPath();
  *(&v18 - 2) = (id)__chkstk_darwin(v15);
  swift_getKeyPath();
  if ([v12 isSelected]) {
    id v16 = *(id *)(a2 + 72);
  }
  else {
    id v16 = [self systemWhiteColor];
  }
  id v18 = v16;
  sub_41B48();
  sub_4B1A0();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a3, v9, v6);
}

uint64_t sub_3F100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3F10C(a1, a2, a3, &qword_7DAF8);
}

uint64_t sub_3F10C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  return sub_4B2C0() & 1;
}

uint64_t sub_3F164(uint64_t a1, uint64_t a2)
{
  return sub_3F170(a1, a2, &qword_7DAF8);
}

uint64_t sub_3F170(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_4B2B0();
}

void sub_3F1B4()
{
}

void sub_3F1DC()
{
}

void *sub_3F1F8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_3F208(void *a1@<X8>)
{
  *a1 = *v1;
}

void *sub_3F214(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_33ABC((uint64_t *)&unk_7DB20);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 1;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = &_swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage + 4;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4]) {
          memmove(v13, a4 + 4, 32 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_41C08(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_3F324(uint64_t a1)
{
  uint64_t v2 = sub_4B730();

  return sub_3F3AC(a1, v2);
}

unint64_t sub_3F368(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_4B3F0(*(void *)(v2 + 40));

  return sub_3F448(a1, v4);
}

unint64_t sub_3F3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_3F448(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_42194(0, &qword_7DAE8);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_4B400();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_4B400();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

uint64_t sub_3F564(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_3F368(a1);
    char v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      Swift::Int v9 = *v2;
      Swift::Int v17 = *v2;
      *uint64_t v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_4054C();
        Swift::Int v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  id v6 = (id)a1;
  uint64_t v7 = sub_4B660();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  uint64_t v8 = sub_4B650();
  Swift::Int v9 = sub_3F768(v5, v8);
  swift_retain();
  a1 = sub_3F368((uint64_t)v6);
  char v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  uint64_t v15 = *(void *)(*(void *)(v9 + 56) + 8 * a1);
  sub_3FF44(a1, v9);
  *uint64_t v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_3F6B4(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    uint64_t result = sub_4B650();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int *v3 = sub_3F768(v7, result + 1);
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  Swift::Int v10 = *v3;
  Swift::Int *v3 = 0x8000000000000000;
  sub_40234(a1, a2, isUniquelyReferenced_nonNull_native);
  Swift::Int *v3 = v10;

  return swift_bridgeObjectRelease();
}

Swift::Int sub_3F768(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_33ABC((uint64_t *)&unk_7DD60);
    uint64_t v2 = sub_4B6D0();
    uint64_t v18 = v2;
    sub_4B640();
    uint64_t v3 = sub_4B670();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_42194(0, &qword_7DAE8);
      do
      {
        swift_dynamicCast();
        sub_42194(0, &qword_7D918);
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_3FC70(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = sub_4B3F0(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = sub_4B670();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

uint64_t sub_3F9BC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_33ABC(&qword_7DB18);
  uint64_t result = sub_4B6C0();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v9 = (uint64_t *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v32 = -1 << v10;
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    long long v34 = v3;
    int64_t v35 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v8 << 6);
      }
      else
      {
        int64_t v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v21 >= v35) {
          goto LABEL_33;
        }
        unint64_t v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          int64_t v8 = v21 + 1;
          if (v21 + 1 >= v35) {
            goto LABEL_33;
          }
          unint64_t v22 = v9[v8];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v34;
                goto LABEL_40;
              }
              if (v33 >= 64) {
                bzero((void *)(v5 + 64), 8 * v35);
              }
              else {
                uint64_t *v9 = v32;
              }
              uint64_t v3 = v34;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v8 = v23 + 1;
                if (__OFADD__(v23, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v35) {
                  goto LABEL_33;
                }
                unint64_t v22 = v9[v8];
                ++v23;
                if (v22) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v23;
          }
        }
LABEL_30:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      uint64_t v28 = 8 * v20;
      uint64_t v29 = *(void *)(*(void *)(v5 + 48) + v28);
      long long v30 = *(void **)(*(void *)(v5 + 56) + v28);
      if ((a2 & 1) == 0) {
        id v31 = v30;
      }
      uint64_t result = sub_4B730();
      uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t v18 = 8 * v17;
      *(void *)(*(void *)(v7 + 48) + v18) = v29;
      *(void *)(*(void *)(v7 + 56) + v18) = v30;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_3FC70(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_33ABC((uint64_t *)&unk_7DD60);
  uint64_t v6 = sub_4B6C0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  long long v36 = v2;
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    int64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v37 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v36;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v37 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    id v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      id v34 = v32;
    }
    uint64_t result = sub_4B3F0(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v36;
  int64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void sub_3FF44(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_4B5C0();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(a2 + 40);
        id v11 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v12 = sub_4B3F0(v10);

        Swift::Int v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v3 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(a2 + 48);
            unint64_t v17 = (void *)(v16 + 8 * v3);
            unint64_t v18 = (void *)(v16 + 8 * v6);
            if (v3 != v6 || v17 >= v18 + 1) {
              *unint64_t v17 = *v18;
            }
            uint64_t v19 = *(void *)(a2 + 56);
            unint64_t v20 = (void *)(v19 + 8 * v3);
            unint64_t v21 = (void *)(v19 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v20 >= v21 + 1))
            {
              *unint64_t v20 = *v21;
              int64_t v3 = v6;
            }
          }
        }
        else if (v13 >= v9 || v3 >= v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    int64_t v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v23 = *v22;
    uint64_t v24 = (-1 << v3) - 1;
  }
  else
  {
    int64_t v22 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v24 = *v22;
    uint64_t v23 = (-1 << a1) - 1;
  }
  *int64_t v22 = v24 & v23;
  uint64_t v25 = *(void *)(a2 + 16);
  BOOL v26 = __OFSUB__(v25, 1);
  uint64_t v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
}

void sub_400F8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_3F324(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_403A8();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];

      *(void *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    uint64_t v20 = 8 * v10;
    *(void *)(v16[6] + v20) = a2;
    *(void *)(v16[7] + v20) = a1;
    uint64_t v21 = v16[2];
    BOOL v22 = __OFADD__(v21, 1);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      return;
    }
    goto LABEL_14;
  }
  sub_3F9BC(v13, a3 & 1);
  unint64_t v18 = sub_3F324(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    unint64_t v10 = v18;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  sub_4B720();
  __break(1u);
}

void sub_40234(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_3F368((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_4054C();
LABEL_7:
    uint64_t v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7];

      *(void *)(v16 + 8 * v9) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_3FC70(v12, a3 & 1);
  unint64_t v17 = sub_3F368((uint64_t)a2);
  if ((v13 & 1) != (v18 & 1))
  {
LABEL_17:
    sub_42194(0, &qword_7DAE8);
    sub_4B720();
    __break(1u);
    return;
  }
  unint64_t v9 = v17;
  uint64_t v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  uint64_t v19 = 8 * v9;
  *(void *)(v15[6] + v19) = a2;
  *(void *)(v15[7] + v19) = a1;
  uint64_t v20 = v15[2];
  BOOL v21 = __OFADD__(v20, 1);
  uint64_t v22 = v20 + 1;
  if (v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v15[2] = v22;

  id v23 = a2;
}

id sub_403A8()
{
  uint64_t v1 = v0;
  sub_33ABC(&qword_7DB18);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_4B6B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_4054C()
{
  uint64_t v1 = v0;
  sub_33ABC((uint64_t *)&unk_7DD60);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_4B6B0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    int64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_406F4(void *a1)
{
  return sub_3F214(0, a1[2], 0, a1);
}

unint64_t sub_40708(unint64_t result)
{
  if (result >= 4) {
    return 4;
  }
  return result;
}

uint64_t type metadata accessor for VideoEffectsView()
{
  return self;
}

BOOL sub_4073C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2 || !sub_44E34(a1[1], a2[1]) || ((a1[2] ^ a2[2]) & 1) != 0 || ((a1[3] ^ a2[3]) & 1) != 0) {
    return 0;
  }
  if (*((void *)a1 + 1) != *((void *)a2 + 1) || *((void *)a1 + 2) != *((void *)a2 + 2))
  {
    char v5 = sub_4B710();
    BOOL result = 0;
    if ((v5 & 1) == 0) {
      return result;
    }
  }
  uint64_t v6 = *((void *)a1 + 4);
  uint64_t v7 = *((void *)a2 + 4);
  if (!v6)
  {
    if (v7) {
      return 0;
    }
LABEL_17:
    if (*((void *)a1 + 5) == *((void *)a2 + 5) && *((void *)a1 + 6) == *((void *)a2 + 6)
      || (char v9 = sub_4B710(), result = 0, (v9 & 1) != 0))
    {
      if (*((void *)a1 + 7) == *((void *)a2 + 7) && *((void *)a1 + 8) == *((void *)a2 + 8)
        || (char v10 = sub_4B710(), result = 0, (v10 & 1) != 0))
      {
        sub_42194(0, &qword_7DB30);
        if ((sub_4B400() & 1) == 0) {
          return 0;
        }
        if (*((void *)a1 + 10) == *((void *)a2 + 10) && *((void *)a1 + 11) == *((void *)a2 + 11)
          || (char v11 = sub_4B710(), result = 0, (v11 & 1) != 0))
        {
          if (*((void *)a1 + 12) == *((void *)a2 + 12) && *((void *)a1 + 13) == *((void *)a2 + 13)
            || (char v12 = sub_4B710(), result = 0, (v12 & 1) != 0))
          {
            if (*((double *)a1 + 14) == *((double *)a2 + 14) && *((double *)a1 + 15) == *((double *)a2 + 15))
            {
              uint64_t v13 = *((void *)a1 + 17);
              uint64_t v14 = *((void *)a2 + 17);
              if (v13) {
                return v14 && (*((void *)a1 + 16) == *((void *)a2 + 16) && v13 == v14 || (sub_4B710() & 1) != 0);
              }
              if (!v14) {
                return 1;
              }
            }
            return 0;
          }
        }
      }
    }
    return result;
  }
  if (!v7) {
    return 0;
  }
  if (*((void *)a1 + 3) == *((void *)a2 + 3) && v6 == v7) {
    goto LABEL_17;
  }
  char v8 = sub_4B710();
  BOOL result = 0;
  if (v8) {
    goto LABEL_17;
  }
  return result;
}

void *sub_4095C(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v6 = (id)sub_4B5E0();
LABEL_9:
        uint64_t v7 = v6;
        unint64_t v8 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_15;
        }
        id v9 = [v6 tag];
        if (v9 == [a2 tag])
        {
        }
        else
        {
          sub_4B600();
          sub_4B620();
          uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
          sub_4B630();
          sub_4B610();
        }
        ++v4;
        if (v8 == v3) {
          return &_swiftEmptyArrayStorage;
        }
      }
      if (v4 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v3 = sub_4B6A0();
      if (!v3) {
        return &_swiftEmptyArrayStorage;
      }
    }
    id v6 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return &_swiftEmptyArrayStorage;
}

unint64_t sub_40AC8(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_33ABC(&qword_7DB18);
  uint64_t v3 = (void *)sub_4B6E0();
  uint64_t v4 = a1[4];
  uint64_t v5 = (void *)a1[5];
  unint64_t result = sub_3F324(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    id v17 = v5;
    return (unint64_t)v3;
  }
  unint64_t v8 = (void **)(a1 + 7);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v4;
    *(void *)(v3[7] + v9) = v5;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v13 = v8 + 2;
    uint64_t v4 = (uint64_t)*(v8 - 1);
    uint64_t v14 = *v8;
    id v15 = v5;
    unint64_t result = sub_3F324(v4);
    unint64_t v8 = v13;
    uint64_t v5 = v14;
    if (v16) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_40BC0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void *sub_40BF8(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_4B6A0())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (char *)sub_4B5E0() : (char *)*(id *)(a1 + 8 * v5);
      char v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = [*(id *)&v6[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph] tag];
      if (v9 == [a2 tag])
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_40D38(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_4B6A0())
  {
    uint64_t v5 = 4;
    while (1)
    {
      id v6 = (a1 & 0xC000000000000001) != 0 ? (id)sub_4B5E0() : *(id *)(a1 + 8 * v5);
      char v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1)) {
        break;
      }
      id v9 = [v6 tag];
      if (v9 == [a2 tag])
      {
        swift_bridgeObjectRelease();
        return v7;
      }

      ++v5;
      if (v8 == v4) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_40E6C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_40EAC()
{
  unint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_4B6A0();
    uint64_t v3 = result;
    if (!result) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t result = swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_13;
    }
  }
  uint64_t v5 = *(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v2));
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v1 & 0xC000000000000001) != 0) {
      id v7 = (id)sub_4B5E0();
    }
    else {
      id v7 = *(id *)(v1 + 8 * i + 32);
    }
    uint64_t v8 = v7;
    if (v5()) {
      double v9 = 0.0;
    }
    else {
      double v9 = 1.0;
    }
    [v8 setAlpha:v9];
  }
LABEL_13:

  return swift_bridgeObjectRelease();
}

uint64_t sub_40FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_41000()
{
  return swift_release();
}

uint64_t type metadata accessor for VideoEffectsViewController()
{
  return self;
}

double sub_4102C()
{
  return 0.0;
}

void type metadata accessor for RPCCMTVisualStyleCategory(uint64_t a1)
{
}

uint64_t sub_41054(uint64_t a1, uint64_t a2)
{
  return initializeWithCopy for VideoEffectsViewController.EffectType(a2, a1);
}

unint64_t sub_41068()
{
  unint64_t result = qword_7D940;
  if (!qword_7D940)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_7D940);
  }
  return result;
}

uint64_t sub_410BC()
{
  return 8;
}

uint64_t sub_410C8()
{
  return swift_release();
}

uint64_t sub_410D0(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_410DC(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_410E8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 160, 7);
}

uint64_t sub_41158(void *a1)
{
  return sub_3EB58(a1, v1 + 16);
}

uint64_t sub_41160(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_411F0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_4122C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_3EE58(a1, v2 + 24, a2);
}

uint64_t sub_4123C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 168, 7);
}

id sub_412B4()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    if ([Strong isSelected])
    {

      id v3 = *(void **)(v0 + 96);
      return v3;
    }
    else
    {
      id v6 = [self systemWhiteColor];

      return v6;
    }
  }
  else
  {
    id v5 = [self labelColor];
    return v5;
  }
}

unint64_t sub_413A8()
{
  unint64_t result = qword_7D950;
  if (!qword_7D950)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_7D950);
  }
  return result;
}

unint64_t sub_41400()
{
  unint64_t result = qword_7D958;
  if (!qword_7D958)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_7D958);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for VideoEffect(unsigned char *result, unsigned char *a2)
{
  void *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for VideoEffect(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for VideoEffect(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    void *result = a2 + 3;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x415C0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_415E8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_415F0(unsigned char *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VideoEffect()
{
  return &type metadata for VideoEffect;
}

uint64_t initializeBufferWithCopyOfBuffer for VideoEffectsViewController.EffectType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for VideoEffectsViewController.EffectType(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for VideoEffectsViewController.EffectType(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  int v8 = *(void **)(a2 + 72);
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = v8;
  *(void *)(a1 + 80) = v7;
  uint64_t v9 = *(void *)(a2 + 96);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = v9;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v11 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for VideoEffectsViewController.EffectType(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(unsigned char *)(a1 + 1) = *(unsigned char *)(a2 + 1);
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 72);
  uint64_t v5 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v4;
  id v6 = v4;

  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for VideoEffectsViewController.EffectType(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  long long v2 = *(_OWORD *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  long long v6 = *(_OWORD *)(a2 + 96);
  long long v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for VideoEffectsViewController.EffectType(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(unsigned char *)(a1 + 2) = *(unsigned char *)(a2 + 2);
  *(unsigned char *)(a1 + 3) = *(unsigned char *)(a2 + 3);
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  long long v7 = *(void **)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);

  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VideoEffectsViewController.EffectType(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 144)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VideoEffectsViewController.EffectType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 144) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 144) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for VideoEffectsViewController.EffectType()
{
  return &type metadata for VideoEffectsViewController.EffectType;
}

__n128 sub_41A70(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_41A7C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_41A9C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 sub_41ADC(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_41AE8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_41B08(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

unint64_t sub_41B48()
{
  unint64_t result = qword_7DAF0;
  if (!qword_7DAF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_7DAF0);
  }
  return result;
}

uint64_t sub_41B9C()
{
  return 8;
}

uint64_t sub_41BA8(uint64_t a1)
{
  uint64_t v2 = sub_33ABC((uint64_t *)&unk_7DCB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_41C08(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 32 * a1 + 32);
    size_t v6 = 32 * v4;
    long long v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  unint64_t result = (char *)sub_4B6F0();
  __break(1u);
  return result;
}

void sub_41CF4()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    unint64_t v2 = (*(uint64_t (**)(void))((char *)&stru_158.reloff + (swift_isaMask & *Strong)))();
    unint64_t v3 = v2;
    if (v2 >> 62) {
      goto LABEL_28;
    }
    for (uint64_t i = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8)); i; uint64_t i = sub_4B6A0())
    {
      uint64_t v35 = *(uint64_t (**)(void))&stru_1A8.segname[(swift_isaMask & *v1) + 16];
      if (i < 1)
      {
        __break(1u);
        return;
      }
      uint64_t v5 = 0;
      unint64_t v6 = 0;
      uint64_t v33 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_containerView;
      uint64_t v34 = i;
      unint64_t v36 = v3 & 0xC000000000000001;
      unint64_t v32 = v3;
      while (1)
      {
        if (v36) {
          uint64_t v12 = (void *)sub_4B5E0();
        }
        else {
          uint64_t v12 = *(id *)(v3 + 8 * v6 + 32);
        }
        uint64_t v13 = v12;
        uint64_t v14 = *(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v12));
        if (v14())
        {
          (*(void (**)(void))&stru_1A8.segname[(swift_isaMask & *v1) - 8])();
          double v16 = v15;
          double v18 = v17;
          goto LABEL_17;
        }
        uint64_t v19 = (*(uint64_t (**)(void))((char *)&stru_158.flags + (swift_isaMask & *v1)))();
        if (v6 >= *(void *)(v19 + 16)) {
          break;
        }
        double v16 = *(double *)(v19 + v5 + 40);
        double v18 = *(double *)(v19 + v5 + 56);
        swift_bridgeObjectRelease();
LABEL_17:
        id v20 = objc_msgSend(v13, "tag", v32);
        uint64_t v21 = v35();
        if (*(void *)(v21 + 16) && (unint64_t v22 = sub_3F324((uint64_t)v20), (v23 & 1) != 0))
        {
          id v24 = *(id *)(*(void *)(v21 + 56) + 8 * v22);
          swift_bridgeObjectRelease();
          id v25 = [v13 tag];
          uint64_t v26 = (*(uint64_t (**)(void))((char *)&stru_1A8.reloff + (swift_isaMask & *v1)))();
          if (*(void *)(v26 + 16) && (unint64_t v27 = sub_3F324((uint64_t)v25), (v28 & 1) != 0))
          {
            id v29 = *(id *)(*(void *)(v26 + 56) + 8 * v27);
            swift_bridgeObjectRelease();
            [v24 constant];
            unint64_t v3 = v32;
            if (v30 != v16) {
              [v24 setConstant:v16];
            }
            [v29 constant];
            if (v31 != v18) {
              [v29 setConstant:v18];
            }
          }
          else
          {
            swift_bridgeObjectRelease();

            unint64_t v3 = v32;
          }
        }
        else
        {
          uint64_t v7 = swift_bridgeObjectRelease();
        }
        ++v6;
        char v8 = ((uint64_t (*)(uint64_t))v14)(v7);
        uint64_t v9 = &selRef_bringSubviewToFront_;
        if ((v8 & 1) == 0) {
          uint64_t v9 = &selRef_sendSubviewToBack_;
        }
        uint64_t v10 = *v9;
        id v11 = *(id *)((char *)v1 + v33);
        objc_msgSend(v11, v10, v13);

        v5 += 32;
        if (v34 == v6) {
          goto LABEL_29;
        }
      }
      __break(1u);
LABEL_28:
      ;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    [*(id *)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_containerView) layoutIfNeeded];
  }
}

uint64_t *sub_42130(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_42194(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_421E4(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_4222C()
{
}

uint64_t sub_42278()
{
  uint64_t v0 = sub_4B210();
  sub_42130(v0, qword_7E1F8);
  sub_40BC0(v0, (uint64_t)qword_7E1F8);
  return sub_4B200();
}

void *sub_422F8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_videoView);
  swift_beginAccess();
  unint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_42348(void *a1)
{
}

uint64_t (*sub_42354())()
{
  return j_j__swift_endAccess;
}

void *sub_423B0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_frameReceiver);
  swift_beginAccess();
  unint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_42400(void *a1)
{
}

uint64_t (*sub_4240C())()
{
  return j__swift_endAccess;
}

id sub_42468()
{
  id v0 = objc_allocWithZone((Class)type metadata accessor for CaptureFrameReceiverObserver());

  return [v0 init];
}

uint64_t type metadata accessor for CaptureFrameReceiverObserver()
{
  return self;
}

id sub_424C0()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_captureFrameReceiverObserver));
}

char *sub_424D0()
{
  *(void *)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_videoView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_frameReceiver] = 0;
  uint64_t v1 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_captureFrameReceiverObserver;
  id v2 = objc_allocWithZone((Class)type metadata accessor for CaptureFrameReceiverObserver());
  id v3 = v0;
  *(void *)&v0[v1] = [v2 init];

  v20.receiver = v3;
  v20.super_class = (Class)type metadata accessor for VideoEffectsPreview();
  id v4 = objc_msgSendSuper2(&v20, "init");
  uint64_t v5 = qword_7E1F0;
  unint64_t v6 = (char *)v4;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_4B210();
  sub_40BC0(v7, (uint64_t)qword_7E1F8);
  char v8 = sub_4B1F0();
  os_log_type_t v9 = sub_4B3B0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v19[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    sub_33464(0xD00000000000007FLL, 0x8000000000060570, v19);
    sub_4B580();
    *(_WORD *)(v10 + 12) = 2080;
    sub_33464(0x292874696E69, 0xE600000000000000, v19);
    sub_4B580();
    _os_log_impl(&dword_0, v8, v9, "%s%s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v11 = (void **)&v6[OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_videoView];
  swift_beginAccess();
  uint64_t v12 = *v11;
  *id v11 = 0;

  uint64_t v13 = (void **)&v6[OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_frameReceiver];
  swift_beginAccess();
  uint64_t v14 = *v13;
  void *v13 = 0;

  uint64_t v15 = *(void *)&v6[OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_captureFrameReceiverObserver];
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  double v17 = (void (**)())(v15
                    + OBJC_IVAR____TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver_captureFrameReceiverDidChange);
  swift_beginAccess();
  *double v17 = sub_44504;
  v17[1] = (void (*)())v16;
  swift_release();
  return v6;
}

void sub_427D8()
{
  sub_42194(0, &qword_7DB60);
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  NSString v2 = sub_4B2D0();
  [ObjCClassFromMetadata addObserver:v0 forKeyPath:v2 options:0 context:0];
}

void sub_42870()
{
  uint64_t v1 = v0;
  if (qword_7E1F0 != -1) {
    goto LABEL_50;
  }
LABEL_2:
  uint64_t v2 = sub_4B210();
  sub_40BC0(v2, (uint64_t)qword_7E1F8);
  id v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B3B0();
  long long v40 = v1;
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_33464(0xD000000000000014, 0x8000000000060650, aBlock);
    sub_4B580();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v6 = [self availableFrameSenderEndpointsByPID];
  sub_42194(0, &qword_7DAE8);
  sub_33ABC(&qword_7DB68);
  sub_44858();
  uint64_t v7 = sub_4B2A0();

  uint64_t v8 = v7 + 64;
  uint64_t v9 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v10 = -1;
  if (v9 < 64) {
    uint64_t v10 = ~(-1 << v9);
  }
  unint64_t v11 = v10 & *(void *)(v7 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain();
  uint64_t v1 = 0;
  int64_t v13 = 0;
  while (1)
  {
    while (1)
    {
      if (v11)
      {
        unint64_t v14 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v15 = v14 | (v13 << 6);
      }
      else
      {
        int64_t v16 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
          __break(1u);
LABEL_50:
          swift_once();
          goto LABEL_2;
        }
        if (v16 >= v12) {
          goto LABEL_42;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        ++v13;
        if (!v17)
        {
          int64_t v13 = v16 + 1;
          if (v16 + 1 >= v12) {
            goto LABEL_42;
          }
          unint64_t v17 = *(void *)(v8 + 8 * v13);
          if (!v17)
          {
            int64_t v13 = v16 + 2;
            if (v16 + 2 >= v12) {
              goto LABEL_42;
            }
            unint64_t v17 = *(void *)(v8 + 8 * v13);
            if (!v17)
            {
              int64_t v13 = v16 + 3;
              if (v16 + 3 >= v12) {
                goto LABEL_42;
              }
              unint64_t v17 = *(void *)(v8 + 8 * v13);
              if (!v17)
              {
                int64_t v13 = v16 + 4;
                if (v16 + 4 >= v12) {
                  goto LABEL_42;
                }
                unint64_t v17 = *(void *)(v8 + 8 * v13);
                if (!v17)
                {
                  int64_t v18 = v16 + 5;
                  if (v18 >= v12)
                  {
LABEL_42:
                    swift_release();
                    swift_bridgeObjectRelease();
                    if (v1)
                    {
                      uint64_t v21 = v1;
                      id v29 = sub_4B1F0();
                      os_log_type_t v30 = sub_4B3B0();
                      if (os_log_type_enabled(v29, v30))
                      {
                        double v31 = (uint8_t *)swift_slowAlloc();
                        unint64_t v32 = (void *)swift_slowAlloc();
                        *(_DWORD *)double v31 = 138412290;
                        aBlock[0] = (uint64_t)v21;
                        uint64_t v33 = v21;
                        sub_4B580();
                        *unint64_t v32 = v1;

                        _os_log_impl(&dword_0, v29, v30, "Creating frame receiver for endpoint=%@", v31, 0xCu);
                        sub_33ABC(&qword_7D910);
                        swift_arrayDestroy();
                        swift_slowDealloc();
                        swift_slowDealloc();
                      }
                      else
                      {

                        id v29 = v21;
                      }

                      uint64_t v36 = swift_allocObject();
                      swift_unknownObjectWeakInit();
                      id v37 = objc_allocWithZone((Class)CMCaptureFrameReceiver);
                      aBlock[4] = (uint64_t)sub_448C0;
                      aBlock[5] = v36;
                      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
                      aBlock[1] = 1107296256;
                      aBlock[2] = (uint64_t)sub_43FFC;
                      aBlock[3] = (uint64_t)&unk_69D38;
                      uint64_t v38 = _Block_copy(aBlock);
                      swift_retain();
                      id v39 = [v37 initWithFrameSenderServerEndpoint:v21 frameReceiverHandler:v38];
                      _Block_release(v38);
                      swift_release();
                      swift_release();
                      (*(void (**)(id))&stru_68.segname[(swift_isaMask & *v40) + 16])(v39);
                    }
                    else
                    {
                      uint64_t v21 = sub_4B1F0();
                      uint64_t v34 = sub_4B3B0();
                      if (os_log_type_enabled(v21, (os_log_type_t)v34))
                      {
                        uint64_t v35 = (uint8_t *)swift_slowAlloc();
                        *(_WORD *)uint64_t v35 = 0;
                        _os_log_impl(&dword_0, v21, (os_log_type_t)v34, "first endpoint not found", v35, 2u);
                        swift_slowDealloc();
                      }
                    }
                    goto LABEL_41;
                  }
                  unint64_t v17 = *(void *)(v8 + 8 * v18);
                  if (!v17)
                  {
                    while (1)
                    {
                      int64_t v13 = v18 + 1;
                      if (__OFADD__(v18, 1)) {
                        goto LABEL_52;
                      }
                      if (v13 >= v12) {
                        goto LABEL_42;
                      }
                      unint64_t v17 = *(void *)(v8 + 8 * v13);
                      ++v18;
                      if (v17) {
                        goto LABEL_26;
                      }
                    }
                  }
                  int64_t v13 = v18;
                }
              }
            }
          }
        }
LABEL_26:
        unint64_t v11 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v13 << 6);
      }
      uint64_t v19 = *(void *)(v7 + 16);
      objc_super v20 = *(id *)(*(void *)(v7 + 48) + 8 * v15);
      uint64_t v21 = v20;
      if (!v19)
      {
        swift_release();
LABEL_40:

        swift_bridgeObjectRelease();
LABEL_41:

        return;
      }
      unint64_t v22 = v20;
      unint64_t v23 = sub_3F368((uint64_t)v22);
      if ((v24 & 1) == 0)
      {
        swift_release();

        goto LABEL_40;
      }
      unint64_t v25 = *(void *)(*(void *)(v7 + 56) + 8 * v23);
      swift_bridgeObjectRetain();

      if (!(v25 >> 62)) {
        break;
      }
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_4B6A0();
      swift_bridgeObjectRelease();
      if (v26) {
        goto LABEL_33;
      }
LABEL_31:
      swift_bridgeObjectRelease();
    }
    if (!*(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_31;
    }
LABEL_33:
    if ((v25 & 0xC000000000000001) == 0) {
      break;
    }
    unint64_t v27 = (void *)sub_4B5E0();
LABEL_36:
    char v28 = v27;
    swift_bridgeObjectRelease();

    uint64_t v1 = v28;
  }
  if (*(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFFF8)))
  {
    unint64_t v27 = *(id *)(v25 + 32);
    goto LABEL_36;
  }
  __break(1u);
LABEL_52:
  __break(1u);
}

uint64_t sub_42F44()
{
  uint64_t v1 = v0;
  if (qword_7E1F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_4B210();
  sub_40BC0(v2, (uint64_t)qword_7E1F8);
  id v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B3B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_33464(0xD000000000000013, 0x8000000000060670, &v10);
    sub_4B580();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v6 = *(void *)((char *)v1
                 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_captureFrameReceiverObserver);
  sub_42194(0, &qword_7DB60);
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  NSString v8 = sub_4B2D0();
  [ObjCClassFromMetadata removeObserver:v6 forKeyPath:v8];

  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v1) + 16])(0);
}

void sub_43160()
{
  sub_42194(0, &qword_7DB60);
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  NSString v2 = sub_4B2D0();
  [ObjCClassFromMetadata removeObserver:v0 forKeyPath:v2];
}

void sub_431E8()
{
  uint64_t v1 = v0;
  if (qword_7E1F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_4B210();
  sub_40BC0(v2, (uint64_t)qword_7E1F8);
  id v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B3B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_33464(0xD000000000000015, 0x8000000000060690, &v12);
    sub_4B580();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t))&stru_68.sectname[swift_isaMask & *v1])(v6);
  if (!v7)
  {
    id v8 = [objc_allocWithZone((Class)RPCCUIVideoView) init];
    (*(void (**)(id))&stru_68.segname[(swift_isaMask & *v1) - 8])(v8);
  }
  uint64_t v9 = *(void *)((char *)v1
                 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_captureFrameReceiverObserver);
  sub_42194(0, &qword_7DB60);
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  NSString v11 = sub_4B2D0();
  [ObjCClassFromMetadata addObserver:v9 forKeyPath:v11 options:0 context:0];
}

void sub_4345C()
{
  sub_42194(0, &qword_7DB60);
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  NSString v2 = sub_4B2D0();
  [ObjCClassFromMetadata addObserver:v0 forKeyPath:v2 options:0 context:0];
}

uint64_t sub_434EC()
{
  uint64_t v1 = v0;
  if (qword_7E1F0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_4B210();
  sub_40BC0(v2, (uint64_t)qword_7E1F8);
  id v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B3B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    sub_33464(0xD000000000000012, 0x80000000000606B0, &v9);
    sub_4B580();
    _os_log_impl(&dword_0, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v7 = (void *)(*(uint64_t (**)(uint64_t))&stru_68.sectname[swift_isaMask & *v1])(v6);
  [v7 flushVideoView];

  return (*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v1) - 8])(0);
}

void *sub_436EC(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4B270();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_4B290();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))&stru_68.sectname[swift_isaMask & *v1])(v10);
  if (result)
  {
    unint64_t v14 = result;
    uint64_t v23 = v8;
    uint64_t v24 = v5;
    id v15 = [result layer];
    self;
    int64_t v16 = (void *)swift_dynamicCastObjCClass();
    if (v16)
    {
      unint64_t v17 = v16;
      if ([v16 status] == (char *)&dword_0 + 2) {
        [v17 flush];
      }
    }

    sub_42194(0, &qword_7DB80);
    int64_t v18 = (void *)sub_4B3C0();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v2;
    *(void *)(v19 + 24) = a1;
    aBlock[4] = sub_449C0;
    aBlock[5] = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_38B58;
    aBlock[3] = &unk_69D88;
    objc_super v20 = _Block_copy(aBlock);
    id v21 = v2;
    id v22 = a1;
    swift_release();
    sub_4B280();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_44A48(&qword_7DB88, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_33ABC(&qword_7DB90);
    sub_44A90();
    sub_4B5B0();
    sub_4B3D0();
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v4);
    return (void *)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v23);
  }
  return result;
}

id sub_43A58()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VideoEffectsPreview();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_43AE8@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for VideoEffectsPreview();
  uint64_t result = sub_4B260();
  *a1 = result;
  return result;
}

uint64_t (*sub_43B24())()
{
  return nullsub_3;
}

uint64_t sub_43B40()
{
  uint64_t v1 = (uint64_t *)(v0
                 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver_captureFrameReceiverDidChange);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_retain();
  return v2;
}

uint64_t sub_43B98(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver_captureFrameReceiverDidChange);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_release();
}

uint64_t (*sub_43BF8())()
{
  return j_j__swift_endAccess;
}

unint64_t sub_43C54()
{
  return 0xD000000000000022;
}

uint64_t sub_43C70()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver_keyPath);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_43CAC()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = &v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver_captureFrameReceiverDidChange];
  *(void *)uint64_t v2 = nullsub_3;
  *((void *)v2 + 1) = 0;
  id v3 = &v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver_keyPath];
  *(void *)id v3 = 0xD000000000000022;
  *((void *)v3 + 1) = 0x80000000000606D0;
  v9.receiver = v0;
  v9.super_class = ObjectType;
  id v4 = objc_msgSendSuper2(&v9, "init");
  sub_42194(0, &qword_7DB60);
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v6 = v4;
  swift_bridgeObjectRetain();
  NSString v7 = sub_4B2D0();
  swift_bridgeObjectRelease();
  [ObjCClassFromMetadata addObserver:v6 forKeyPath:v7 options:0 context:0];

  return v6;
}

uint64_t sub_43DE4()
{
  uint64_t v1 = (void (**)(uint64_t))(v0
                                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver_captureFrameReceiverDidChange);
  swift_beginAccess();
  uint64_t v2 = *v1;
  uint64_t v3 = swift_retain();
  v2(v3);
  return swift_release();
}

void sub_43FFC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  swift_retain();
  id v6 = a2;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_44074(uint64_t a1, uint64_t a2)
{
  return sub_4416C(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_4408C()
{
  sub_4B300();
  sub_4B320();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_440E0()
{
  sub_4B300();
  sub_4B740();
  sub_4B320();
  Swift::Int v0 = sub_4B760();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_44154(uint64_t a1, uint64_t a2)
{
  return sub_4416C(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_4416C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_4B300();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_441B0(uint64_t a1, id *a2)
{
  uint64_t result = sub_4B2E0();
  *a2 = 0;
  return result;
}

uint64_t sub_44228(uint64_t a1, id *a2)
{
  char v3 = sub_4B2F0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_442A8@<X0>(void *a1@<X8>)
{
  sub_4B300();
  NSString v2 = sub_4B2D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_442EC()
{
  uint64_t v0 = sub_4B300();
  uint64_t v2 = v1;
  if (v0 == sub_4B300() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_4B710();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_44378@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_4B2D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_443C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_4B300();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_443EC(uint64_t a1)
{
  uint64_t v2 = sub_44A48(&qword_7DC00, type metadata accessor for NSKeyValueChangeKey);
  uint64_t v3 = sub_44A48(&qword_7DC28, type metadata accessor for NSKeyValueChangeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t type metadata accessor for VideoEffectsPreview()
{
  return self;
}

uint64_t sub_444CC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_44504()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    if (qword_7E1F0 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_4B210();
    sub_40BC0(v3, (uint64_t)qword_7E1F8);
    uint64_t v1 = sub_4B1F0();
    os_log_type_t v4 = sub_4B3B0();
    if (os_log_type_enabled(v1, v4))
    {
      char v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)char v5 = 136315138;
      sub_33464(0x292874696E69, 0xE600000000000000, &v10);
      sub_4B580();
      _os_log_impl(&dword_0, v1, v4, "%s captureFrameReceiverDidChange nil", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    goto LABEL_8;
  }
  uint64_t v1 = Strong;
  uint64_t v2 = (void *)(*(uint64_t (**)(void))&stru_68.sectname[swift_isaMask & (uint64_t)Strong->isa])();

  if (v2)
  {
    (*(void (**)(void))((char *)&stru_68.reloff + (swift_isaMask & (uint64_t)v1->isa)))();
LABEL_8:

    return;
  }
  if (qword_7E1F0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_4B210();
  sub_40BC0(v6, (uint64_t)qword_7E1F8);
  NSString v7 = sub_4B1F0();
  os_log_type_t v8 = sub_4B3B0();
  if (os_log_type_enabled(v7, v8))
  {
    objc_super v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)objc_super v9 = 136315138;
    sub_33464(0x292874696E69, 0xE600000000000000, &v10);
    sub_4B580();
    _os_log_impl(&dword_0, v7, v8, "%s captureFrameReceiverDidChange no videoView, skipping start", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
}

unint64_t sub_44858()
{
  unint64_t result = qword_7DB70;
  if (!qword_7DB70)
  {
    sub_42194(255, &qword_7DAE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_7DB70);
  }
  return result;
}

void sub_448C0(void *a1, char a2)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    char v5 = Strong;
    if (a1)
    {
      if (a2)
      {
        uint64_t v6 = *(void (**)(void))&stru_B8.segname[(swift_isaMask & *Strong) - 8];
        id v7 = a1;
        v6();
      }
    }
  }
}

uint64_t sub_44968(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_44978()
{
  return swift_release();
}

uint64_t sub_44980()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_449C0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  id v2 = (id)(*(uint64_t (**)(void))&stru_68.sectname[swift_isaMask & **(void **)(v0 + 16)])();
  [v2 enqueueSampleBuffer:v1];
}

uint64_t sub_44A48(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_44A90()
{
  unint64_t result = qword_7DB98;
  if (!qword_7DB98)
  {
    sub_44AEC(&qword_7DB90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_7DB98);
  }
  return result;
}

uint64_t sub_44AEC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_44B34()
{
  return &protocol witness table for ObservableObjectPublisher;
}

void type metadata accessor for CMSampleBuffer(uint64_t a1)
{
}

uint64_t sub_44B54(uint64_t a1)
{
  uint64_t v2 = sub_33ABC(&qword_7DBF8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
}

uint64_t sub_44BC8()
{
  return sub_44A48(&qword_7DC10, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_44C10()
{
  return sub_44A48(&qword_7DC18, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_44C58()
{
  return sub_44A48(&qword_7DC20, type metadata accessor for NSKeyValueChangeKey);
}

uint64_t sub_44CAC()
{
  uint64_t v0 = sub_4B210();
  sub_42130(v0, qword_7E598);
  sub_40BC0(v0, (uint64_t)qword_7E598);
  return sub_4B200();
}

void sub_44D30()
{
  qword_7E970 = 0x6554746365666665;
  *(void *)algn_7E978 = 0xEA00000000007478;
}

uint64_t *sub_44D58()
{
  if (qword_7E5B0 != -1) {
    swift_once();
  }
  return &qword_7E970;
}

void sub_44DA4()
{
  qword_7E980 = 0x6C47746365666665;
  *(void *)algn_7E988 = 0xEB00000000687079;
}

uint64_t *sub_44DD0()
{
  if (qword_7E5B8 != -1) {
    swift_once();
  }
  return &qword_7E980;
}

void *sub_44E1C()
{
  return &unk_69E08;
}

void *sub_44E28()
{
  return &unk_69E18;
}

BOOL sub_44E34(char a1, char a2)
{
  return a1 == a2;
}

void sub_44E44(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_44E6C(unsigned __int8 a1)
{
  return sub_4B760();
}

void sub_44EB4()
{
  qword_7E990 = 0x402A000000000000;
}

uint64_t *sub_44EC4()
{
  if (qword_7E5C0 != -1) {
    swift_once();
  }
  return &qword_7E990;
}

double sub_44F10()
{
  return sub_45408(&qword_7E5C0, (uint64_t)&qword_7E990);
}

void sub_44F34()
{
  qword_7E998 = 0x4034000000000000;
}

uint64_t *sub_44F44()
{
  if (qword_7E5C8 != -1) {
    swift_once();
  }
  return &qword_7E998;
}

double sub_44F90()
{
  return sub_45408(&qword_7E5C8, (uint64_t)&qword_7E998);
}

void sub_44FB4()
{
  qword_7E9A0 = 0x4020000000000000;
}

uint64_t *sub_44FC4()
{
  if (qword_7E5D0 != -1) {
    swift_once();
  }
  return &qword_7E9A0;
}

double sub_45010()
{
  return sub_45408(&qword_7E5D0, (uint64_t)&qword_7E9A0);
}

void *sub_45034()
{
  return &unk_559F0;
}

double sub_45040()
{
  return 40.0;
}

void *sub_4504C()
{
  return &unk_69E28;
}

unint64_t sub_45058()
{
  return 0xD000000000000018;
}

void *sub_45074()
{
  return &unk_559F8;
}

double sub_45080()
{
  return 0.3;
}

void *sub_45090()
{
  return &unk_55A00;
}

double sub_4509C()
{
  return 26.0;
}

void *sub_450A4()
{
  return &unk_55A08;
}

double sub_450B0()
{
  return 1.57079633;
}

void *sub_450BC()
{
  return &unk_55A10;
}

double sub_450C8()
{
  double result = 8.0;
  xmmword_7E9B0 = xmmword_559B0;
  *(_OWORD *)&qword_7E9C0 = xmmword_559C0;
  return result;
}

long long *sub_450E8()
{
  if (qword_7E5D8 != -1) {
    swift_once();
  }
  return &xmmword_7E9B0;
}

double sub_45134()
{
  if (qword_7E5D8 != -1) {
    swift_once();
  }
  return *(double *)&xmmword_7E9B0;
}

void *sub_45188()
{
  return &unk_55A18;
}

double sub_45194()
{
  return 8.0;
}

void *sub_4519C()
{
  return &unk_55A20;
}

double sub_451A8()
{
  return 1.5;
}

double sub_451B0()
{
  if (qword_7E5D8 != -1) {
    swift_once();
  }
  double result = *((double *)&xmmword_7E9B0 + 1) + -2.0;
  *(double *)&qword_7E9D0 = *((double *)&xmmword_7E9B0 + 1) + -2.0;
  return result;
}

uint64_t *sub_4520C()
{
  if (qword_7E5E0 != -1) {
    swift_once();
  }
  return &qword_7E9D0;
}

double sub_45258()
{
  return sub_45408(&qword_7E5E0, (uint64_t)&qword_7E9D0);
}

void *sub_4527C()
{
  return &unk_55A28;
}

void sub_45288()
{
  qword_7E9D8 = 0x402E000000000000;
}

uint64_t *sub_45298()
{
  if (qword_7E5E8 != -1) {
    swift_once();
  }
  return &qword_7E9D8;
}

double sub_452E4()
{
  return sub_45408(&qword_7E5E8, (uint64_t)&qword_7E9D8);
}

void sub_45308()
{
  qword_7E9E0 = 0x4024000000000000;
}

uint64_t *sub_45318()
{
  if (qword_7E5F0 != -1) {
    swift_once();
  }
  return &qword_7E9E0;
}

double sub_45364()
{
  return sub_45408(&qword_7E5F0, (uint64_t)&qword_7E9E0);
}

void sub_45388()
{
  qword_7E9E8 = 0x402A000000000000;
}

uint64_t *sub_45398()
{
  if (qword_7E5F8 != -1) {
    swift_once();
  }
  return &qword_7E9E8;
}

double sub_453E4()
{
  return sub_45408(qword_7E5F8, (uint64_t)&qword_7E9E8);
}

double sub_45408(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  return *(double *)a2;
}

void *sub_45444()
{
  return &unk_55A30;
}

double sub_45450()
{
  return 23.0;
}

void *sub_45458()
{
  return &unk_55A38;
}

double sub_45464()
{
  return 18.0;
}

void *sub_4546C()
{
  return &unk_55A40;
}

double sub_45478()
{
  return 0.9;
}

void *sub_45484()
{
  return &unk_55A48;
}

id sub_45494()
{
  uint64_t v0 = sub_4B450();
  uint64_t v1 = *(void *)(v0 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_4B530();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  os_log_type_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  NSString v11 = sub_4B2D0();
  id v12 = [self _systemImageNamed:v11];

  sub_4B500();
  id v13 = v12;
  sub_4B4F0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for UIButton.Configuration.TitleAlignment.leading(_:), v0);
  sub_4B470();
  sub_4B490();
  sub_4B460();
  if (qword_7E5C8 != -1) {
    swift_once();
  }
  sub_4B480();
  if (qword_7E5D0 != -1) {
    swift_once();
  }
  sub_4B440();
  if (qword_7E5C0 != -1) {
    swift_once();
  }
  id v14 = [self configurationWithPointSize:*(double *)&qword_7E990];
  sub_4B410();
  sub_42194(0, (unint64_t *)&unk_7DD70);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  id v15 = (id)sub_4B540();
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v16) = 1144750080;
  [v15 setContentHuggingPriority:0 forAxis:v16];
  [v15 setContentHorizontalAlignment:1];
  unint64_t v17 = self;
  id v18 = v15;
  id v19 = [v17 clearColor];
  [v18 setBackgroundColor:v19];

  [v18 setContentMode:7];
  [v18 setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
  id v20 = [v18 imageView];

  if (v20)
  {
    [v20 setMaximumContentSizeCategory:UIContentSizeCategoryMedium];

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  return v18;
}

id sub_458FC()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph);
}

void sub_45910()
{
  uint64_t v0 = sub_4B530();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v22 - v5;
  NSString v7 = sub_4B2D0();
  id v8 = [self _systemImageNamed:v7];

  if (v8)
  {
    id v9 = [v8 imageWithRenderingMode:2];

    id v10 = v9;
    sub_4B500();
    sub_4B4F0();
    sub_42194(0, (unint64_t *)&unk_7DD70);
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
    id v11 = (id)sub_4B540();
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1144750080;
    [v11 setContentHuggingPriority:0 forAxis:v12];
    id v13 = [self systemLightGrayColor];
    [v11 setTintColor:v13];

    [v11 setHidden:1];
    [v11 setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
    id v14 = [v11 imageView];
    if (v14)
    {
      id v15 = v14;
      [v14 setMaximumContentSizeCategory:UIContentSizeCategoryMedium];
    }
    unsigned int v16 = [v11 _shouldReverseLayoutDirection];
    double v17 = -1.57079633;
    if (v16) {
      double v17 = 1.57079633;
    }
    long long v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v25.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v25.c = v18;
    *(_OWORD *)&v25.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformRotate(&v24, &v25, v17);
    long long v22 = *(_OWORD *)&v24.c;
    long long v23 = *(_OWORD *)&v24.a;
    tdouble x = v24.tx;
    CGFloat ty = v24.ty;
    id v21 = [v11 layer];

    *(_OWORD *)&v25.a = v23;
    *(_OWORD *)&v25.c = v22;
    v25.tdouble x = tx;
    v25.CGFloat ty = ty;
    [v21 setAffineTransform:&v25];

    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  }
  else
  {
    __break(1u);
  }
}

id sub_45C5C()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron);
}

id sub_45C70()
{
  id v0 = [objc_allocWithZone((Class)UILabel) init];
  NSString v1 = sub_4B2D0();
  [v0 setText:v1];

  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setHidden:1];
  LODWORD(v2) = 1144750080;
  [v0 setContentHuggingPriority:1 forAxis:v2];
  uint64_t v3 = self;
  if (qword_7E5F0 != -1) {
    swift_once();
  }
  id v4 = [v3 systemFontOfSize:*(double *)&qword_7E9E0];
  [v0 setFont:v4];

  return v0;
}

id sub_45DA8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow);
}

id sub_45DBC()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)UISlider), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setHidden:1];
  [v0 _setSliderStyle:110];
  id v1 = [objc_allocWithZone((Class)_UISliderFluidConfiguration) init];
  if (qword_7E5E0 != -1) {
    swift_once();
  }
  [v1 setStretchLimit:*(double *)&qword_7E9D0];
  [v1 setExpansionFactor:1.5];
  [v0 _setSliderConfiguration:v1];

  return v0;
}

id sub_45ED0()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider);
}

id sub_45EE4()
{
  id v0 = [objc_allocWithZone((Class)UILabel) init];
  NSString v1 = sub_4B2D0();
  [v0 setText:v1];

  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v0 setHidden:1];
  LODWORD(v2) = 1144750080;
  [v0 setContentHuggingPriority:1 forAxis:v2];
  [v0 setNumberOfLines:0];
  [v0 setLineBreakMode:0];
  uint64_t v3 = self;
  if (qword_7E5F8 != -1) {
    swift_once();
  }
  id v4 = [v3 systemFontOfSize:*(double *)&qword_7E9E8];
  [v0 setFont:v4];

  return v0;
}

id sub_46048()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel);
}

uint64_t sub_46058()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType);
}

id sub_46068()
{
  id result = [self materialViewWithRecipe:4];
  if (!result) {
    __break(1u);
  }
  return result;
}

id sub_460A8()
{
  return *(id *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView);
}

uint64_t sub_460B8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_46104(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_categoriesToVisualStylingProviders);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_46158())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_461B4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_46200(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_requiredVisualStyleCategories);
  swift_beginAccess();
  void *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_46254())()
{
  return j_j__swift_endAccess;
}

id sub_462B0()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider));
}

id sub_462C0()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider));
}

id sub_462D0()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_sliderStylingProvider));
}

uint64_t sub_462E0()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_isExpanded);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_46328(char a1)
{
  uint64_t v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_isExpanded);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_46374())()
{
  return j__swift_endAccess;
}

uint64_t sub_463D0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonTitle);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_46428(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonTitle);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_46488())()
{
  return j_j__swift_endAccess;
}

id sub_464E4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_effectImageView);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_4653C(void *a1)
{
}

uint64_t (*sub_46548())()
{
  return j_j__swift_endAccess;
}

id sub_465A4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_effectTitleLabel);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_465FC(void *a1)
{
}

uint64_t (*sub_46608())()
{
  return j_j__swift_endAccess;
}

void sub_46664(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v18 = objc_allocWithZone(v9);
  sub_46700(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void sub_46700(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  v64[2] = a8;
  Class v71 = a7;
  v64[1] = a5;
  uint64_t v69 = a3;
  uint64_t v70 = a4;
  int v67 = a2;
  int v68 = a1;
  uint64_t v11 = sub_33ABC((uint64_t *)&unk_7DCB0);
  __chkstk_darwin(v11 - 8);
  long long v66 = (char *)v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph;
  id v14 = v9;
  id v15 = sub_45494();
  v64[3] = v13;
  long long v65 = v9;
  *(void *)&v9[v13] = v15;
  uint64_t v16 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron;
  sub_45910();
  *(void *)&v14[v16] = v17;
  uint64_t v18 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow;
  id v19 = sub_45C70();
  *(void *)&v14[v18] = v19;
  uint64_t v20 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider;
  id v21 = sub_45DBC();
  *(void *)&v14[v20] = v21;
  uint64_t v22 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel;
  *(void *)&v14[v22] = sub_45EE4();
  id v23 = [self materialViewWithRecipe:4];
  if (!v23)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  *(void *)&v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView] = v23;
  uint64_t v24 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_categoriesToVisualStylingProviders;
  *(void *)&v14[v24] = sub_35D3C((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v25 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_requiredVisualStyleCategories;
  sub_33ABC(&qword_7D8C0);
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_553C0;
  *(void *)(v26 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:2];
  *(void *)(v26 + 40) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  uint64_t v73 = v26;
  sub_4B370();
  *(void *)&v14[v25] = v73;
  v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_isExpanded] = 0;
  v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType] = v68;
  unint64_t v27 = &v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonTitle];
  uint64_t v28 = v70;
  id v29 = v71;
  *(void *)unint64_t v27 = v69;
  *((void *)v27 + 1) = v28;
  [v21 setMaximumValueImage:v29];
  id v30 = v19;
  if (a6)
  {
    NSString v31 = sub_4B2D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v31 = 0;
  }
  [v19 setText:v31];

  unint64_t v32 = *(void **)&v14[v22];
  id v33 = v32;
  if (a9)
  {
    NSString v34 = sub_4B2D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v34 = 0;
  }
  [v32 setText:v34];

  uint64_t v35 = self;
  NSString v36 = sub_4B2D0();
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v38 = self;
  id v39 = [v38 bundleForClass:ObjCClassFromMetadata];
  id v40 = [v35 _visualStylingProviderForStyleSetNamed:v36 inBundle:v39];

  if (!v40) {
    goto LABEL_17;
  }
  *(void *)&v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider] = v40;
  NSString v41 = sub_4B2D0();
  id v42 = [v38 bundleForClass:ObjCClassFromMetadata];
  id v43 = [v35 _visualStylingProviderForStyleSetNamed:v41 inBundle:v42];

  if (!v43)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  *(void *)&v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider] = v43;
  id v44 = [v35 _visualStylingProviderForRecipe:101 andCategory:1];
  uint64_t v45 = v67;
  if (!v44)
  {
LABEL_19:
    __break(1u);
    return;
  }
  uint64_t v46 = v29;
  *(void *)&v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_sliderStylingProvider] = v44;
  id v47 = [objc_allocWithZone((Class)UIImageView) initWithImage:v45];
  long long v48 = (id *)&v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_effectImageView];
  *(void *)&v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_effectImageView] = v47;
  id v49 = v47;
  uint64_t v50 = (uint64_t)v66;
  sub_4B550();
  uint64_t v51 = sub_4B530();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 48))(v50, 1, v51)
    || (uint64_t v53 = sub_4B4E0()) == 0)
  {
    sub_41BA8(v50);
    id v52 = 0;
  }
  else
  {
    long long v54 = (void *)v53;
    sub_41BA8(v50);
    id v52 = [v54 symbolConfiguration];
  }
  [v49 setSymbolConfiguration:v52];

  swift_beginAccess();
  [*v48 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v55 = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v56 = (id *)&v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_effectTitleLabel];
  *(void *)&v14[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_effectTitleLabel] = v55;
  [v55 setTranslatesAutoresizingMaskIntoConstraints:0];
  swift_beginAccess();
  id v57 = *v56;
  [v57 setLineBreakMode:4];

  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  uint64_t v61 = (objc_class *)type metadata accessor for EffectControl();
  v72.receiver = v14;
  v72.super_class = v61;
  id v62 = objc_msgSendSuper2(&v72, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  id v63 = [v62 layer];
  [v63 setMasksToBounds:1];

  sub_46E70();
  sub_474A0();
  sub_46F80();
}

uint64_t type metadata accessor for EffectControl()
{
  return self;
}

id sub_46D8C()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for EffectControl();
  objc_msgSendSuper2(&v3, "layoutSubviews");
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView];
  [v0 _continuousCornerRadius];
  return objc_msgSend(v1, "_setContinuousCornerRadius:");
}

id sub_46E70()
{
  if (v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType] != 2)
  {
    uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView];
    id v2 = [v1 layer];
    [v2 setShadowPathIsBounds:1];

    id v3 = [v1 layer];
    LODWORD(v4) = 1036831949;
    [v3 setShadowOpacity:v4];

    id v5 = [v1 layer];
    [v5 setShadowRadius:15.0];
  }
  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView];
  [v0 _continuousCornerRadius];

  return objc_msgSend(v6, "_setContinuousCornerRadius:");
}

void sub_46F80()
{
  uint64_t v1 = *(void **)((char *)v0
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
  [v1 automaticallyUpdateView:*(void *)((char *)v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron) withStyle:2];
  if (*((unsigned char *)v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType) == 2) {
    uint64_t v2 = 3;
  }
  else {
    uint64_t v2 = 5;
  }
  [*(id *)((char *)v0+ OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:*(void *)((char *)v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView) withStyle:v2];
  [v1 automaticallyUpdateView:*(void *)((char *)v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow) withStyle:0];
  id v3 = [v1 automaticallyUpdateView:*(void *)((char *)v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel) withStyle:0];
  double v4 = (void *)(*(uint64_t (**)(id))((char *)&stru_108.flags + (swift_isaMask & *v0)))(v3);
  [v1 automaticallyUpdateView:v4 withStyle:0];

  id v5 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v0)))();
  [v1 automaticallyUpdateView:v5 withStyle:0];

  sub_4711C();
}

void sub_4711C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider);
  [v2 _setDrawsAsBackdropOverlayWithBlendMode:2];
  id v3 = [*(id *)(v0 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_sliderStylingProvider) _colorForStyle:1];
  id v4 = [self quaternaryLabelColor];
  if (qword_7E590 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_4B210();
  sub_40BC0(v5, (uint64_t)qword_7E598);
  id v6 = v3;
  id v7 = v4;
  id v8 = v6;
  id v9 = v7;
  id v10 = sub_4B1F0();
  os_log_type_t v11 = sub_4B390();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v21 = v1;
    uint64_t v22 = v2;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412546;
    if (v8)
    {
      id v14 = v8;
      sub_4B580();
    }
    else
    {
      sub_4B580();
      id v3 = 0;
    }
    void *v13 = v3;

    *(_WORD *)(v12 + 12) = 2112;
    id v23 = v9;
    id v15 = v9;
    sub_4B580();
    v13[1] = v9;

    _os_log_impl(&dword_0, v10, v11, "min color = %@, max color = %@", (uint8_t *)v12, 0x16u);
    sub_33ABC(&qword_7D910);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v1 = v21;
  }
  else
  {
  }
  objc_msgSend(v2, "setMinimumTrackTintColor:", v8, v21, v22, v23);
  [v2 setMaximumTrackTintColor:v9];
  id v16 = [v2 _maxValueView];
  if (!v16)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v17 = v16;
  if ([*(id *)(v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView) isHighlighted])uint64_t v18 = 2; {
  else
  }
    uint64_t v18 = 1;
  [v17 _setDrawsAsBackdropOverlayWithBlendMode:v18];

  id v19 = [v2 _maxValueView];
  if (!v19) {
LABEL_16:
  }
    __break(1u);
  uint64_t v20 = v19;
  [v19 setTintColor:v8];
}

uint64_t sub_474A0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_33ABC((uint64_t *)&unk_7DCB0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  id v29 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v6 = (char *)&v27 - v5;
  uint64_t v30 = sub_4B530();
  uint64_t v7 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v28 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_4B1C0();
  __chkstk_darwin(v9 - 8);
  uint64_t v10 = sub_4B180();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  id v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v27 - v16;
  uint64_t v18 = (*(uint64_t (**)(uint64_t))((char *)&stru_158.reloff + (swift_isaMask & *v0)))(v15);
  (*(void (**)(uint64_t))&stru_108.segname[swift_isaMask & *v0])(v18);
  sub_4B1B0();
  sub_4B190();
  uint64_t KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  id v19 = self;
  if (qword_7E5E8 != -1) {
    swift_once();
  }
  id v32 = [v19 systemFontOfSize:*(double *)&qword_7E9D8];
  sub_41068();
  uint64_t v20 = sub_4B170();
  uint64_t v21 = (void *)(*(uint64_t (**)(uint64_t))((char *)&stru_108.flags + (swift_isaMask & *v0)))(v20);
  sub_42194(0, (unint64_t *)&unk_7DD50);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v17, v10);
  uint64_t v22 = (void *)sub_4B3E0();
  [v21 setAttributedText:v22];

  if (*((unsigned char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType) == 1) {
    [*(id *)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron) setHidden:0];
  }
  sub_4B550();
  uint64_t v23 = v30;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v6, 1, v30) == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v10);
    return sub_41BA8((uint64_t)v6);
  }
  else
  {
    uint64_t v25 = v28;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v28, v6, v23);
    sub_4B4F0();
    uint64_t v26 = v29;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v29, v25, v23);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v26, 0, 1, v23);
    sub_4B560();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v25, v23);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v17, v10);
  }
}

void sub_479F8(void *a1, char a2)
{
  double v4 = 0.0;
  double v5 = 0.0;
  if (a2)
  {
    if (qword_7E5D8 != -1) {
      swift_once();
    }
    double v5 = *((double *)&xmmword_7E9B0 + 1);
    double v4 = *(double *)&qword_7E9C8;
  }
  id v6 = self;
  sub_33ABC(&qword_7D8C0);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_553C0;
  id v8 = [a1 leadingAnchor];
  id v9 = [v2 leadingAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9 constant:v5];

  *(void *)(v7 + 32) = v10;
  id v11 = [a1 trailingAnchor];
  id v12 = [v2 trailingAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12 constant:-v4];

  *(void *)(v7 + 40) = v13;
  sub_4B370();
  sub_42194(0, &qword_7DB10);
  Class isa = sub_4B340().super.isa;
  swift_bridgeObjectRelease();
  [v6 activateConstraints:isa];
}

void sub_47BF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView];
  [v0 addSubview:v2];
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph];
  id v4 = [v0 addSubview:v3];
  long long v58 = *(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *(void *)v0));
  double v5 = (void *)((uint64_t (*)(id))v58)(v4);
  [v0 addSubview:v5];

  long long v59 = *(uint64_t (**)(void))((char *)&stru_108.flags + (swift_isaMask & *(void *)v0));
  id v6 = (void *)v59();
  [v0 addSubview:v6];

  id v61 = *(id *)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron];
  objc_msgSend(v0, "addSubview:");
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  (*(void (**)(void *, void))((char *)&stru_158.offset + (swift_isaMask & *(void *)v0)))(v2, 0);
  uint64_t v7 = self;
  sub_33ABC(&qword_7D8C0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_553C0;
  id v9 = [v2 topAnchor];
  id v10 = [v1 topAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];

  *(void *)(v8 + 32) = v11;
  id v12 = [v2 bottomAnchor];
  id v13 = [v1 bottomAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13];

  *(void *)(v8 + 40) = v14;
  sub_4B370();
  sub_42194(0, &qword_7DB10);
  Class isa = sub_4B340().super.isa;
  swift_bridgeObjectRelease();
  long long v60 = v7;
  [v7 activateConstraints:isa];

  LODWORD(v12) = v1[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType];
  id v16 = [v3 trailingAnchor];
  if (v12 == 1) {
    id v17 = [v61 leadingAnchor];
  }
  else {
    id v17 = [v1 trailingAnchor];
  }
  id v18 = v17;
  id v19 = [v16 constraintEqualToAnchor:v18];

  uint64_t v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_559D0;
  id v21 = [v3 topAnchor];
  id v22 = [v1 topAnchor];
  id v23 = [v21 constraintEqualToAnchor:v22];

  *(void *)(v20 + 32) = v23;
  id v24 = [v3 leadingAnchor];
  id v25 = [v1 leadingAnchor];
  id v26 = [v24 constraintEqualToAnchor:v25];

  *(void *)(v20 + 40) = v26;
  id v27 = [v3 heightAnchor];
  id v28 = [v27 constraintEqualToConstant:40.0];

  *(void *)(v20 + 48) = v28;
  *(void *)(v20 + 56) = v19;
  id v57 = v19;
  id v29 = (void *)v58();
  id v30 = [v29 centerXAnchor];

  id v31 = [v1 leadingAnchor];
  id v32 = [v30 constraintEqualToAnchor:v31 constant:23.0];

  *(void *)(v20 + 64) = v32;
  id v33 = (void *)v58();
  id v34 = [v33 centerYAnchor];

  id v35 = [v3 centerYAnchor];
  id v36 = [v34 constraintEqualToAnchor:v35];

  *(void *)(v20 + 72) = v36;
  id v37 = (void *)v59();
  id v38 = [v37 leadingAnchor];

  id v39 = (void *)v58();
  id v40 = [v39 centerXAnchor];

  id v41 = [v38 constraintEqualToAnchor:v40 constant:18.0];
  *(void *)(v20 + 80) = v41;
  id v42 = (void *)v59();
  id v43 = [v42 centerYAnchor];

  id v44 = [v3 centerYAnchor];
  id v45 = [v43 constraintEqualToAnchor:v44];

  *(void *)(v20 + 88) = v45;
  id v46 = [v61 centerYAnchor];
  id v47 = [v3 centerYAnchor];
  id v48 = [v46 constraintEqualToAnchor:v47];

  *(void *)(v20 + 96) = v48;
  id v49 = [v61 trailingAnchor];
  id v50 = [v1 trailingAnchor];
  if (qword_7E5D8 != -1) {
    swift_once();
  }
  id v51 = [v49 constraintEqualToAnchor:v50 constant:-*(double *)&qword_7E9C8];

  *(void *)(v20 + 104) = v51;
  id v52 = [v61 widthAnchor];
  id v53 = [v52 constraintEqualToConstant:26.0];

  *(void *)(v20 + 112) = v53;
  id v54 = [v61 heightAnchor];
  id v55 = [v61 widthAnchor];
  id v56 = [v54 constraintEqualToAnchor:v55];

  *(void *)(v20 + 120) = v56;
  sub_4B370();
  Class v62 = sub_4B340().super.isa;
  swift_bridgeObjectRelease();
  [v60 activateConstraints:v62];
}

id sub_48494()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow];
  [v0 addSubview:v2];
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider];
  objc_msgSend(v0, "addSubview:");
  id v23 = *(void **)&v0[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel];
  objc_msgSend(v0, "addSubview:");
  id v22 = *(void (**)(void *, uint64_t))((char *)&stru_158.offset + (swift_isaMask & *(void *)v0));
  v22(v2, 1);
  id v4 = self;
  sub_33ABC(&qword_7D8C0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_559E0;
  id v6 = [v2 topAnchor];
  id v7 = [*(id *)&v1[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph] bottomAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];

  *(void *)(v5 + 32) = v8;
  sub_4B370();
  sub_42194(0, &qword_7DB10);
  Class isa = sub_4B340().super.isa;
  swift_bridgeObjectRelease();
  [v4 activateConstraints:isa];

  v22(v3, 1);
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_559E0;
  id v11 = [v3 topAnchor];
  id v12 = [v2 bottomAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];

  id v14 = v4;
  *(void *)(v10 + 32) = v13;
  sub_4B370();
  Class v15 = sub_4B340().super.isa;
  swift_bridgeObjectRelease();
  [v4 activateConstraints:v15];

  v22(v23, 1);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_559E0;
  id v17 = [v23 topAnchor];
  id v18 = [v3 bottomAnchor];
  if (qword_7E5D8 != -1) {
    swift_once();
  }
  id v19 = [v17 constraintEqualToAnchor:v18 constant:*(double *)&xmmword_7E9B0];

  *(void *)(v16 + 32) = v19;
  sub_4B370();
  Class v20 = sub_4B340().super.isa;
  swift_bridgeObjectRelease();
  [v14 activateConstraints:v20];

  [v1 setNeedsLayout];

  return [v1 layoutIfNeeded];
}

void sub_488BC()
{
  uint64_t v1 = v0;
  if (qword_7E590 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_4B210();
  sub_40BC0(v2, (uint64_t)qword_7E598);
  uint64_t v3 = sub_4B1F0();
  os_log_type_t v4 = sub_4B390();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, v4, "Chevron Tapped", v5, 2u);
    swift_slowDealloc();
  }

  id v6 = (uint64_t (*)(void *, void))(*(uint64_t (**)(void *))&stru_108.segname[(swift_isaMask & *v1) - 8])(v13);
  BOOL *v7 = !*v7;
  uint64_t v8 = v6(v13, 0);
  if ((*(uint64_t (**)(uint64_t))((char *)&stru_B8.reserved2 + (swift_isaMask & *v1)))(v8)) {
    sub_48494();
  }
  id v9 = self;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v1;
  void v13[4] = sub_49890;
  v13[5] = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_38B58;
  void v13[3] = &unk_69E60;
  id v11 = _Block_copy(v13);
  id v12 = v1;
  swift_release();
  [v9 animateWithDuration:v11 animations:0.3];
  _Block_release(v11);
}

id sub_48B1C(char a1, int a2, char a3)
{
  if (qword_7E590 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_4B210();
  sub_40BC0(v7, (uint64_t)qword_7E598);
  uint64_t v8 = v3;
  id v9 = sub_4B1F0();
  os_log_type_t v10 = sub_4B390();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    uint64_t v38 = v37;
    *(_DWORD *)uint64_t v11 = 136316162;
    sub_33464(0xD000000000000041, 0x8000000000060880, &v38);
    uint64_t v12 = sub_4B580();
    *(_WORD *)(v11 + 12) = 2080;
    uint64_t v13 = (*(uint64_t (**)(uint64_t))&stru_108.segname[swift_isaMask & *v8])(v12);
    sub_33464(v13, v14, &v38);
    sub_4B580();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 22) = 1024;
    sub_4B580();
    *(_WORD *)(v11 + 28) = 1024;
    sub_4B580();
    *(_WORD *)(v11 + 34) = 1024;
    sub_4B580();
    _os_log_impl(&dword_0, v9, v10, "%s setting %s highlighted=%{BOOL}d, isAlternateHighlight=%{BOOL}d, isSupported=%{BOOL}d", (uint8_t *)v11, 0x28u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  Class v15 = *(void **)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView);
  objc_msgSend(v15, "setHighlighted:", a1 & 1, v37);
  if (a3)
  {
    if (a1)
    {
      BOOL v16 = *((unsigned __int8 *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType) == 2;
      id v17 = *(void **)((char *)v8
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
      [v17 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron) withStyle:3];
      if ((v16 & a2) != 0) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = 4;
      }
      id v19 = [*(id *)((char *)v8+ OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:v15 withStyle:v18];
      Class v20 = *(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v8));
      id v21 = (void *)((uint64_t (*)(id))v20)(v19);
      id v22 = v21;
      if (v16 & a2)
      {
        [v17 automaticallyUpdateView:v21 withStyle:0];
        uint64_t v23 = 0;
      }
      else
      {
        objc_msgSend(v21, "rpccmt_removeAllVisualStyling");

        id v34 = (void *)v20();
        id v22 = [self systemBlueColor];
        [v34 setTintColor:v22];

        uint64_t v23 = 1;
      }

      id v35 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.flags + (swift_isaMask & *v8)))();
      [v17 automaticallyUpdateView:v35 withStyle:v23];

      [v17 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow) withStyle:1];
      [v17 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel) withStyle:1];
    }
    else
    {
      id v29 = *(void **)((char *)v8
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
      [v29 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron) withStyle:2];
      if (*((unsigned char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType) == 2) {
        uint64_t v30 = 3;
      }
      else {
        uint64_t v30 = 0;
      }
      id v31 = [*(id *)((char *)v8+ OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:v15 withStyle:v30];
      id v32 = (void *)(*(uint64_t (**)(id))((char *)&stru_108.flags + (swift_isaMask & *v8)))(v31);
      [v29 automaticallyUpdateView:v32 withStyle:0];

      id v33 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v8)))();
      [v29 automaticallyUpdateView:v33 withStyle:0];

      [v29 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow) withStyle:0];
      [v29 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel) withStyle:0];
    }
  }
  else
  {
    id v24 = *(void **)((char *)v8
                   + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
    [v24 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron) withStyle:5];
    if (*((unsigned char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType) == 2) {
      uint64_t v25 = 3;
    }
    else {
      uint64_t v25 = 5;
    }
    id v26 = [*(id *)((char *)v8+ OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:v15 withStyle:v25];
    id v27 = (void *)(*(uint64_t (**)(id))((char *)&stru_108.flags + (swift_isaMask & *v8)))(v26);
    [v24 automaticallyUpdateView:v27 withStyle:5];

    id v28 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v8)))();
    [v24 automaticallyUpdateView:v28 withStyle:5];

    [v24 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow) withStyle:5];
    [v24 automaticallyUpdateView:*(void *)((char *)v8 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel) withStyle:5];
  }
  sub_4711C();
  return [v8 setNeedsDisplay];
}

void sub_49294()
{
}

id sub_492F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EffectControl();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_49438(char a1)
{
  uint64_t v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(unsigned char *)(v4 + 24) = a1;
  void v7[4] = sub_49B0C;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_38B58;
  _OWORD v7[3] = &unk_69EB0;
  uint64_t v5 = _Block_copy(v7);
  id v6 = v1;
  swift_release();
  [v3 animateWithDuration:v5 animations:0.3];
  _Block_release(v5);
}

void sub_49530()
{
  uint64_t v1 = self;
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v0;
  void v5[4] = sub_49CA0;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_38B58;
  _OWORD v5[3] = &unk_69F00;
  uint64_t v3 = _Block_copy(v5);
  id v4 = v0;
  swift_release();
  [v1 animateWithDuration:v3 animations:0.3];
  _Block_release(v3);
}

id sub_49620(void *a1)
{
  if ([*(id *)(v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView) isHighlighted])uint64_t v3 = 2; {
  else
  }
    uint64_t v3 = 1;

  return [a1 _setDrawsAsBackdropOverlayWithBlendMode:v3];
}

void *sub_49680()
{
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider);
  id v2 = v1;
  return v1;
}

void sub_496C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_buttonGlyph;
  *(void *)&v1[v2] = sub_45494();
  uint64_t v3 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron;
  sub_45910();
  *(void *)&v1[v3] = v4;
  uint64_t v5 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow;
  *(void *)&v1[v5] = sub_45C70();
  uint64_t v6 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider;
  *(void *)&v1[v6] = sub_45DBC();
  uint64_t v7 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel;
  *(void *)&v1[v7] = sub_45EE4();
  id v8 = [self materialViewWithRecipe:4];
  if (!v8) {
    __break(1u);
  }
  *(void *)&v1[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView] = v8;
  uint64_t v9 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_categoriesToVisualStylingProviders;
  *(void *)&v1[v9] = sub_35D3C((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v10 = OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_requiredVisualStyleCategories;
  sub_33ABC(&qword_7D8C0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_553C0;
  *(void *)(v11 + 32) = [objc_allocWithZone((Class)NSNumber) initWithInteger:2];
  *(void *)(v11 + 40) = [objc_allocWithZone((Class)NSNumber) initWithInteger:1];
  sub_4B370();
  *(void *)&v1[v10] = v11;
  v1[OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_isExpanded] = 0;

  sub_4B690();
  __break(1u);
}

uint64_t sub_49858()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_49890()
{
  uint64_t v1 = *(void **)(v0 + 16);
  uint64_t v2 = *(uint64_t (**)(void))((char *)&stru_B8.reserved2 + (swift_isaMask & *v1));
  char v3 = v2();
  uint64_t v4 = *(void **)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow);
  if (v3)
  {
    [*(id *)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow) setHidden:0];
    [*(id *)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider) setHidden:0];
    id v5 = [*(id *)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel) setHidden:0];
  }
  else
  {
    [*(id *)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_intensityRow) setHidden:1];
    uint64_t v6 = *(void **)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_continuousSlider);
    [v6 setHidden:1];
    uint64_t v7 = *(void **)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_descriptionLabel);
    [v7 setHidden:1];
    [v4 removeFromSuperview];
    [v6 removeFromSuperview];
    id v5 = [v7 removeFromSuperview];
  }
  if (((uint64_t (*)(id))v2)(v5)) {
    double v8 = 0.0;
  }
  else {
    double v8 = -1.57079633;
  }
  unsigned int v9 = [v1 _shouldReverseLayoutDirection];
  double v10 = -v8;
  if (!v9) {
    double v10 = v8;
  }
  long long v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v19.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v19.c = v11;
  *(_OWORD *)&v19.tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGAffineTransformRotate(&v18, &v19, v10);
  long long v16 = *(_OWORD *)&v18.c;
  long long v17 = *(_OWORD *)&v18.a;
  tdouble x = v18.tx;
  CGFloat ty = v18.ty;
  id v14 = [*(id *)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_expandChevron) layer];
  *(_OWORD *)&v19.a = v17;
  *(_OWORD *)&v19.c = v16;
  v19.tdouble x = tx;
  v19.CGFloat ty = ty;
  [v14 setAffineTransform:&v19];

  sub_48B1C((char)[v1 isSelected], 0, 1);
  return [v1 layoutIfNeeded];
}

uint64_t sub_49ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_49ACC()
{
  return swift_release();
}

uint64_t sub_49AD4()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_49B0C()
{
  uint64_t v1 = *(void **)(v0 + 16);
  int v2 = *(unsigned __int8 *)(v0 + 24);
  CGAffineTransformMakeScale(&v8, 0.9, 0.9);
  [v1 setTransform:&v8];
  if (v2 == 1)
  {
    char v3 = *(void **)((char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_backgroundView);
    id v4 = [v3 isHighlighted];
    if ((v4 & 1) == 0)
    {
      if (*((unsigned char *)v1 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_controlType) == 2) {
        id v4 = [*(id *)((char *)v1+ OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider) automaticallyUpdateView:v3 withStyle:2];
      }
      id v5 = (void *)(*(uint64_t (**)(id))((char *)&stru_108.flags + (swift_isaMask & *v1)))(v4);
      uint64_t v6 = *(void **)((char *)v1
                    + OBJC_IVAR____TtC34VideoConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider);
      [v6 automaticallyUpdateView:v5 withStyle:0];

      uint64_t v7 = (void *)(*(uint64_t (**)(void))((char *)&stru_108.size + (swift_isaMask & *v1)))();
      [v6 automaticallyUpdateView:v7 withStyle:0];
    }
  }
}

id sub_49CA0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  CGAffineTransformMakeScale(&v3, 1.0, 1.0);
  return [v1 setTransform:&v3];
}

unint64_t sub_49D00()
{
  unint64_t result = qword_7DCC0;
  if (!qword_7DCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_7DCC0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EffectControl.ControlType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for EffectControl.ControlType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    void *result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x49EB0);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          void *result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EffectControl.ControlType()
{
  return &type metadata for EffectControl.ControlType;
}

ValueMetadata *type metadata accessor for EffectControl.Constants()
{
  return &type metadata for EffectControl.Constants;
}

uint64_t sub_49EFC()
{
  return 8;
}

uint64_t sub_49F08()
{
  return swift_release();
}

uint64_t sub_49F10(void *a1, void *a2)
{
  *a2 = *a1;
  return swift_retain();
}

void *sub_49F1C(void *result, void *a2)
{
  *a2 = *result;
  return result;
}

void sub_49F3C()
{
  sub_C518();
  sub_C52C(&dword_0, &_os_log_default, v0, " [ERROR] %{public}s:%d bundleIdentifier nil", v1, v2, v3, v4, v5);
}

void sub_49FBC()
{
  sub_C518();
  sub_C52C(&dword_0, &_os_log_default, v0, " [ERROR] %{public}s:%d bundleIdentifier nil", v1, v2, v3, v4, v5);
}

void sub_4A03C()
{
  sub_C518();
  sub_C52C(&dword_0, &_os_log_default, v0, " [ERROR] %{public}s:%d bundleIdentifier nil", v1, v2, v3, v4, v5);
}

void sub_4A0BC(uint64_t a1)
{
  uint64_t v1 = +[NSNumber numberWithUnsignedInt:a1];
  int v2 = 136446722;
  uint64_t v3 = "-[VideoEffectsManager setState:forEffect:]";
  __int16 v4 = 1024;
  int v5 = 195;
  __int16 v6 = 2112;
  BOOL v7 = v1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Unhandled effect %@", (uint8_t *)&v2, 0x1Cu);
}

void sub_4A184()
{
  sub_C518();
  sub_C52C(&dword_0, &_os_log_default, v0, " [ERROR] %{public}s:%d bundleIdentifier nil", v1, v2, v3, v4, v5);
}

void sub_4A204(int a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[VideoEffectsManager setIntensity:forEffect:]";
  __int16 v3 = 1024;
  int v4 = 219;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d cannot set intensity for unsupported effect=%d", (uint8_t *)&v1, 0x18u);
}

void sub_4A2A4()
{
  sub_C518();
  sub_C52C(&dword_0, &_os_log_default, v0, " [ERROR] %{public}s:%d bundle id nil", v1, v2, v3, v4, v5);
}

void sub_4A324()
{
  sub_11358();
  sub_11340(v2, v3);
  uint64_t v4 = [(id)sub_11328() description];
  uint64_t v11 = objc_opt_class();
  +[NSString stringWithFormat:@"%@: %p"];
  objc_claimAutoreleasedReturnValue();
  sub_112A8();
  sub_11230();
  sub_11288(&dword_0, v5, v6, "[%{public}@] Notifying observer of active activity change: observer: %{public}@; active activity: %{public}@",
    v7,
    v8,
    v9,
    v10,
    v11,
    (uint64_t)v1,
    v12);
}

void sub_4A3F0(uint64_t a1, void *a2, uint64_t a3)
{
  sub_112D0(a1, a2);
  int v5 = [(id)sub_11334() description];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = a3;
  int v6 = +[NSString stringWithFormat:@"%@: %p"];
  sub_11250();
  sub_11268(&dword_0, v7, v8, "[%{public}@] [Deprecated] Notifying observer of active mode change: %{public}@", v9, v10, v11, v12, v13, v14, v15);
}

void sub_4A4B4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 description];
  sub_112E8(&dword_0, v5, v6, "[%{public}@] unknown activity identifier provided", v7, v8, v9, v10, 2u);
}

void sub_4A54C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 description];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Activating a nil activity isn't permitted – ignoring", (uint8_t *)&v5, 0xCu);
}

void sub_4A5F4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 description];
  sub_112E8(&dword_0, v5, v6, "[%{public}@] application bundle id is not set yet", v7, v8, v9, v10, 2u);
}

void sub_4A68C(uint64_t a1, void *a2, uint64_t a3)
{
  sub_112D0(a1, a2);
  uint64_t v5 = [(id)sub_11334() description];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = a3;
  uint64_t v6 = +[NSString stringWithFormat:@"%@: %p"];
  sub_11250();
  sub_11268(&dword_0, v7, v8, "[%{public}@] Notifying observer of available activities change: %{public}@", v9, v10, v11, v12, v13, v14, v15);
}

void sub_4A750(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 description];
  sub_112B8();
  sub_11308(&dword_0, v5, v6, "[%{public}@] Encountered error deactivating all activites: %{public}@", v7, v8, v9, v10, v11);
}

void sub_4A7F0()
{
  sub_11358();
  sub_11340(v2, v3);
  uint64_t v4 = [(id)sub_11328() description];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = v1;
  uint64_t v5 = +[NSString stringWithFormat:@"%@: %p"];
  sub_11230();
  sub_11288(&dword_0, v6, v7, "[%{public}@] Notifying observer of lifetime descriptions change for activity: observer: %{public}@; activity: %{public}@",
    v8,
    v9,
    v10,
    v11,
    v12,
    v13,
    v14);
}

void sub_4A8C0(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 description];
  sub_112B8();
  sub_11308(&dword_0, v5, v6, "[%{public}@] Failed to find activity for suggestion: %{public}@", v7, v8, v9, v10, v11);
}

void sub_4A960(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to launch URL %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_4A9EC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Activity control menu action triggered: activityView: %{public}@; menuAction: %{public}@",
    (uint8_t *)&v3,
    0x16u);
}

void sub_4AA74(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Activity control options action triggered: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_4AAEC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Activity control tapped: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_4AB64()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "RPCCUIActivityPickerViewController viewDidLoad", v2, v3, v4, v5, v6);
}

void sub_4AB98()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "RPCCUIActivityListView setHeaderView", v2, v3, v4, v5, v6);
}

void sub_4ABCC()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "RPCCUIActivityListView intrinsicContentSize", v2, v3, v4, v5, v6);
}

void sub_4AC00()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "RPCCUIActivityListView setNeedsLayout", v2, v3, v4, v5, v6);
}

void sub_4AC34()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "RPCCUIActivityListView setFrame", v2, v3, v4, v5, v6);
}

void sub_4AC68()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "RPCCUIActivityPickerViewController viewWillLayoutSubviews", v2, v3, v4, v5, v6);
}

void sub_4AC9C()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "RPCCUIActivityListView layoutSubviews", v2, v3, v4, v5, v6);
}

void sub_4ACD0(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9 = a1;
  v17.origin.double x = a2;
  v17.origin.double y = a3;
  v17.size.double width = a4;
  v17.size.double height = a5;
  uint64_t v10 = NSStringFromCGRect(v17);
  sub_1EBE0(&dword_0, v11, v12, "RPCCUIActivityListView recalculateContentSize contentViewFrame=%@", v13, v14, v15, v16, 2u);
}

void sub_4AD90()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "RPCCUIActivityListView recalculateContentSize", v2, v3, v4, v5, v6);
}

void sub_4ADC4(void *a1, CGFloat a2, CGFloat a3)
{
  id v5 = a1;
  v13.double width = a2;
  v13.double height = a3;
  uint8_t v6 = NSStringFromCGSize(v13);
  sub_1EBE0(&dword_0, v7, v8, "FCUIActivityListContentView activityListView sizeThatFits %@", v9, v10, v11, v12, 2u);
}

void sub_4AE6C()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "FCUIActivityListContentView activityListView intrinsicContentSize", v2, v3, v4, v5, v6);
}

void sub_4AEA0()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "FCUIActivityListContentView activityListView layoutSubviews app view", v2, v3, v4, v5, v6);
}

void sub_4AED4()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "FCUIActivityListContentView activityListView layoutSubviews footer", v2, v3, v4, v5, v6);
}

void sub_4AF08()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "FCUIActivityListContentView activityListView layoutSubviews header invalid", v2, v3, v4, v5, v6);
}

void sub_4AF3C()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "FCUIActivityListContentView activityListView layoutSubviews header", v2, v3, v4, v5, v6);
}

void sub_4AF70(void *a1, void *a2)
{
  uint64_t v3 = a1;
  int v4 = 134217984;
  id v5 = [a2 count];
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "FCUIActivityListContentView layoutSubviews frame count %lu", (uint8_t *)&v4, 0xCu);
}

void sub_4B00C()
{
  sub_1EBD4();
  sub_1EBB8(&dword_0, v0, v1, "FCUIActivityListContentView sizeThatFits", v2, v3, v4, v5, v6);
}

void sub_4B040(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 16);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "updating descriptionLabel=%@ state=%d", (uint8_t *)&v4, 0x12u);
}

void sub_4B0D8()
{
}

void sub_4B100()
{
  uint64_t v0 = abort_report_np();
  sub_4B128(v0);
}

void sub_4B128()
{
}

uint64_t sub_4B150()
{
  return AttributeScopes.UIKitAttributes.foregroundColor.getter();
}

uint64_t sub_4B160()
{
  return AttributeScopes.UIKitAttributes.font.getter();
}

uint64_t sub_4B170()
{
  return AttributedString.subscript.setter();
}

uint64_t sub_4B180()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_4B190()
{
  return AttributedString.init(_:attributes:)();
}

uint64_t sub_4B1A0()
{
  return AttributeContainer.subscript.setter();
}

uint64_t sub_4B1B0()
{
  return AttributeContainer.init()();
}

uint64_t sub_4B1C0()
{
  return type metadata accessor for AttributeContainer();
}

uint64_t sub_4B1D0()
{
  return AttributeDynamicLookup.subscript.getter();
}

uint64_t sub_4B1E0()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_4B1F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_4B200()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_4B210()
{
  return type metadata accessor for Logger();
}

uint64_t sub_4B220()
{
  return type metadata accessor for UIConfigurationColorTransformer();
}

uint64_t sub_4B230()
{
  return UIConfigurationColorTransformer.init(_:)();
}

uint64_t sub_4B240()
{
  return type metadata accessor for UIConfigurationTextAttributesTransformer();
}

uint64_t sub_4B250()
{
  return UIConfigurationTextAttributesTransformer.init(_:)();
}

uint64_t sub_4B260()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_4B270()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_4B280()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_4B290()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_4B2A0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_4B2B0()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t sub_4B2C0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_4B2D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_4B2E0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_4B2F0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_4B300()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_4B310()
{
  return String.init<A>(describing:)();
}

uint64_t sub_4B320()
{
  return String.hash(into:)();
}

Swift::Int sub_4B330()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_4B340()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_4B350()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_4B360()
{
  return Array.description.getter();
}

uint64_t sub_4B370()
{
  return specialized Array._endMutation()();
}

uint64_t sub_4B380()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_4B390()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_4B3A0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_4B3B0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_4B3C0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_4B3D0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_4B3E0()
{
  return NSAttributedString.init(_:)();
}

Swift::Int sub_4B3F0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_4B400()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_4B410()
{
  return UIButton.Configuration.preferredSymbolConfigurationForImage.setter();
}

uint64_t sub_4B420()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t sub_4B430()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t sub_4B440()
{
  return UIButton.Configuration.imagePadding.setter();
}

uint64_t sub_4B450()
{
  return type metadata accessor for UIButton.Configuration.TitleAlignment();
}

uint64_t sub_4B460()
{
  return UIButton.Configuration.imagePlacement.setter();
}

uint64_t sub_4B470()
{
  return UIButton.Configuration.titleAlignment.setter();
}

uint64_t sub_4B480()
{
  return UIButton.Configuration.imageReservation.setter();
}

uint64_t sub_4B490()
{
  return UIButton.Configuration.titleLineBreakMode.setter();
}

uint64_t sub_4B4A0()
{
  return UIButton.Configuration.baseBackgroundColor.setter();
}

uint64_t sub_4B4B0()
{
  return UIButton.Configuration.baseForegroundColor.setter();
}

uint64_t sub_4B4C0()
{
  return UIButton.Configuration.imageColorTransformer.setter();
}

uint64_t sub_4B4D0()
{
  return UIButton.Configuration.titleTextAttributesTransformer.setter();
}

uint64_t sub_4B4E0()
{
  return UIButton.Configuration.image.getter();
}

uint64_t sub_4B4F0()
{
  return UIButton.Configuration.image.setter();
}

uint64_t sub_4B500()
{
  return static UIButton.Configuration.plain()();
}

uint64_t sub_4B510()
{
  return UIButton.Configuration.title.setter();
}

uint64_t sub_4B520()
{
  return static UIButton.Configuration.filled()();
}

uint64_t sub_4B530()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_4B540()
{
  return UIButton.init(configuration:primaryAction:)();
}

uint64_t sub_4B550()
{
  return UIButton.configuration.getter();
}

uint64_t sub_4B560()
{
  return UIButton.configuration.setter();
}

uint64_t sub_4B570()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_4B580()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_4B590()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_4B5A0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_4B5B0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_4B5C0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_4B5D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_4B5E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_4B5F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_4B600()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_4B610()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_4B620()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_4B630()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_4B640()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t sub_4B650()
{
  return __CocoaDictionary.count.getter();
}

uint64_t sub_4B660()
{
  return __CocoaDictionary.lookup(_:)();
}

uint64_t sub_4B670()
{
  return __CocoaDictionary.Iterator.next()();
}

uint64_t sub_4B680()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_4B690()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_4B6A0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_4B6B0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_4B6C0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_4B6D0()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t sub_4B6E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_4B6F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_4B710()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_4B720()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_4B730()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_4B740()
{
  return Hasher.init(_seed:)();
}

void sub_4B750(Swift::UInt a1)
{
}

Swift::Int sub_4B760()
{
  return Hasher._finalize()();
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID()
{
  return _AVControlCenterVideoEffectsModuleGetEffectControlModeForBundleID();
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectIntensityDefaultValueForBundleID()
{
  return _AVControlCenterVideoEffectsModuleGetEffectIntensityDefaultValueForBundleID();
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectIntensityForBundleID()
{
  return _AVControlCenterVideoEffectsModuleGetEffectIntensityForBundleID();
}

uint64_t AVControlCenterVideoEffectsModuleGetEffectIntensityRangeForBundleID()
{
  return _AVControlCenterVideoEffectsModuleGetEffectIntensityRangeForBundleID();
}

uint64_t AVControlCenterVideoEffectsModuleGetUnavailableReasons()
{
  return _AVControlCenterVideoEffectsModuleGetUnavailableReasons();
}

uint64_t AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID()
{
  return _AVControlCenterVideoEffectsModuleIsEffectEnabledForBundleID();
}

uint64_t AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID()
{
  return _AVControlCenterVideoEffectsModuleIsEffectSupportedForBundleID();
}

uint64_t AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID()
{
  return _AVControlCenterVideoEffectsModuleSetEffectEnabledForBundleID();
}

uint64_t AVControlCenterVideoEffectsModuleSetEffectIntensityForBundleID()
{
  return _AVControlCenterVideoEffectsModuleSetEffectIntensityForBundleID();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return _BSDispatchQueueCreateSerialWithQoS();
}

uint64_t BSEqualArrays()
{
  return _BSEqualArrays();
}

uint64_t BSEqualObjects()
{
  return _BSEqualObjects();
}

uint64_t BSEqualStrings()
{
  return _BSEqualStrings();
}

uint64_t BSRectWithSize()
{
  return _BSRectWithSize();
}

uint64_t CCUICompactModuleContinuousCornerRadius()
{
  return _CCUICompactModuleContinuousCornerRadius();
}

uint64_t CCUIDefaultExpandedContentModuleWidth()
{
  return _CCUIDefaultExpandedContentModuleWidth();
}

uint64_t CCUIExpandedModuleContinuousCornerRadius()
{
  return _CCUIExpandedModuleContinuousCornerRadius();
}

uint64_t CCUIIsPortrait()
{
  return _CCUIIsPortrait();
}

uint64_t CCUIReferenceScreenBounds()
{
  return _CCUIReferenceScreenBounds();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

uint64_t CGFloatIsValid()
{
  return _CGFloatIsValid();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
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

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

CFDictionaryRef CMCopyDictionaryOfAttachments(CFAllocatorRef allocator, CMAttachmentBearerRef target, CMAttachmentMode attachmentMode)
{
  return _CMCopyDictionaryOfAttachments(allocator, target, attachmentMode);
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return _CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return _UIContentSizeCategoryCompareToCategory(lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

uint64_t UIRectCenteredIntegralRect()
{
  return _UIRectCenteredIntegralRect();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

uint64_t UIRectCenteredXInRect()
{
  return _UIRectCenteredXInRect();
}

uint64_t UIRectCenteredXInRectScale()
{
  return _UIRectCenteredXInRectScale();
}

uint64_t UIRectCenteredYInRect()
{
  return _UIRectCenteredYInRect();
}

uint64_t UIRectCenteredYInRectScale()
{
  return _UIRectCenteredYInRectScale();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

uint64_t UIRoundToScale()
{
  return _UIRoundToScale();
}

uint64_t UISizeRoundToScale()
{
  return _UISizeRoundToScale();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

id objc_msgSend_CCUIMenuModuleViewHeight(void *a1, const char *a2, ...)
{
  return _[a1 CCUIMenuModuleViewHeight];
}

id objc_msgSend_CCUIMenuModuleViewWidth(void *a1, const char *a2, ...)
{
  return _[a1 CCUIMenuModuleViewWidth];
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__accessoryImage(void *a1, const char *a2, ...)
{
  return _[a1 _accessoryImage];
}

id objc_msgSend__accessoryImageFrameForBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessoryImageFrameForBounds:");
}

id objc_msgSend__activationDescription(void *a1, const char *a2, ...)
{
  return _[a1 _activationDescription];
}

id objc_msgSend__activationDetails(void *a1, const char *a2, ...)
{
  return _[a1 _activationDetails];
}

id objc_msgSend__activeActivity(void *a1, const char *a2, ...)
{
  return _[a1 _activeActivity];
}

id objc_msgSend__activityDetailText(void *a1, const char *a2, ...)
{
  return _[a1 _activityDetailText];
}

id objc_msgSend__activityForATXActivityOrSuggestion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activityForATXActivityOrSuggestion:");
}

id objc_msgSend__activityForUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activityForUniqueIdentifier:");
}

id objc_msgSend__activityIconTintColorForSelectedAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activityIconTintColorForSelectedAppearance:");
}

id objc_msgSend__activityListView(void *a1, const char *a2, ...)
{
  return _[a1 _activityListView];
}

id objc_msgSend__activityManager(void *a1, const char *a2, ...)
{
  return _[a1 _activityManager];
}

id objc_msgSend__activityManagerQueue(void *a1, const char *a2, ...)
{
  return _[a1 _activityManagerQueue];
}

id objc_msgSend__activityPickerExpandedFrameForBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activityPickerExpandedFrameForBounds:");
}

id objc_msgSend__activityViewForRepresentedActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activityViewForRepresentedActivity:");
}

id objc_msgSend__addViewRequiringUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addViewRequiringUpdate:");
}

id objc_msgSend__cameraIndicatorImage(void *a1, const char *a2, ...)
{
  return _[a1 _cameraIndicatorImage];
}

id objc_msgSend__cameraOffIndicatorImage(void *a1, const char *a2, ...)
{
  return _[a1 _cameraOffIndicatorImage];
}

id objc_msgSend__checkCenterStageAvailability(void *a1, const char *a2, ...)
{
  return _[a1 _checkCenterStageAvailability];
}

id objc_msgSend__checkmarkImage(void *a1, const char *a2, ...)
{
  return _[a1 _checkmarkImage];
}

id objc_msgSend__configureAccessoryImageViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureAccessoryImageViewIfNecessary];
}

id objc_msgSend__configureActivationDescriptionLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureActivationDescriptionLabelIfNecessary];
}

id objc_msgSend__configureActivationDetailsLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureActivationDetailsLabelIfNecessary];
}

id objc_msgSend__configureActiveEffectLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureActiveEffectLabelIfNecessary];
}

id objc_msgSend__configureActivityIconImageViewIfNecessaryForReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureActivityIconImageViewIfNecessaryForReference:");
}

id objc_msgSend__configureActivityListViewWithAvailableActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureActivityListViewWithAvailableActivities:");
}

id objc_msgSend__configureActivityTitleLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureActivityTitleLabelIfNecessary];
}

id objc_msgSend__configureActivityTitleLabelIfNecessaryWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureActivityTitleLabelIfNecessaryWithTitle:");
}

id objc_msgSend__configureActivityView_withLifetimesDescriptionsForActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureActivityView:withLifetimesDescriptionsForActivity:");
}

id objc_msgSend__configureAddActivityControlIfNecessaryWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAddActivityControlIfNecessaryWithAction:");
}

id objc_msgSend__configureAlternativeDescriptionLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureAlternativeDescriptionLabelIfNecessary];
}

id objc_msgSend__configureBackgroundMaterialViewIfNecesssary(void *a1, const char *a2, ...)
{
  return _[a1 _configureBackgroundMaterialViewIfNecesssary];
}

id objc_msgSend__configureBackgroundViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureBackgroundViewIfNecessary];
}

id objc_msgSend__configureBackgroundViewIfNecesssary(void *a1, const char *a2, ...)
{
  return _[a1 _configureBackgroundViewIfNecesssary];
}

id objc_msgSend__configureBodyLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureBodyLabelIfNecessary];
}

id objc_msgSend__configureContentViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureContentViewIfNecessary];
}

id objc_msgSend__configureDetailLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureDetailLabelIfNecessary];
}

id objc_msgSend__configureDismissControlIfNecessaryWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureDismissControlIfNecessaryWithAction:");
}

id objc_msgSend__configureEducationCardIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureEducationCardIfNecessary];
}

id objc_msgSend__configureFooterLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureFooterLabelIfNecessary];
}

id objc_msgSend__configureFooterViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureFooterViewIfNecessary];
}

id objc_msgSend__configureGlyphImageViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureGlyphImageViewIfNecessary];
}

id objc_msgSend__configureGlyphViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureGlyphViewIfNecessary];
}

id objc_msgSend__configureGlyphVisualStylingProviderIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureGlyphVisualStylingProviderIfNecessary];
}

id objc_msgSend__configureHeadlineLabelIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureHeadlineLabelIfNecessary];
}

id objc_msgSend__configureHighlightViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureHighlightViewIfNecessary];
}

id objc_msgSend__configureHightlightViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureHightlightViewIfNecessary];
}

id objc_msgSend__configureMenuViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureMenuViewIfNecessary];
}

id objc_msgSend__configureOptionsButtonIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureOptionsButtonIfNecessary];
}

id objc_msgSend__configureSliderIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureSliderIfNecessary];
}

id objc_msgSend__configureTextVisualStylingProviderIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _configureTextVisualStylingProviderIfNecessary];
}

id objc_msgSend__contentSizeCategoryAdjustingViews(void *a1, const char *a2, ...)
{
  return _[a1 _contentSizeCategoryAdjustingViews];
}

id objc_msgSend__contentSizeForBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentSizeForBounds:");
}

id objc_msgSend__contentViewFrameForContentSize_inBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentViewFrameForContentSize:inBounds:");
}

id objc_msgSend__continuousCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 _continuousCornerRadius];
}

id objc_msgSend__cornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 _cornerRadius];
}

id objc_msgSend__cornerRadiusForControlFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cornerRadiusForControlFrame:");
}

id objc_msgSend__detailLabelVisualStyleForHighlightState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_detailLabelVisualStyleForHighlightState:");
}

id objc_msgSend__didPerformUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _didPerformUpdate];
}

id objc_msgSend__dismissHeader(void *a1, const char *a2, ...)
{
  return _[a1 _dismissHeader];
}

id objc_msgSend__effect(void *a1, const char *a2, ...)
{
  return _[a1 _effect];
}

id objc_msgSend__effectiveGlyphPointSize(void *a1, const char *a2, ...)
{
  return _[a1 _effectiveGlyphPointSize];
}

id objc_msgSend__effectiveTitle(void *a1, const char *a2, ...)
{
  return _[a1 _effectiveTitle];
}

id objc_msgSend__enumerateObserversRespondingToSelector_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateObserversRespondingToSelector:usingBlock:");
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flatImageWithColor:");
}

id objc_msgSend__fontForTitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 _fontForTitleLabel];
}

id objc_msgSend__glyphFrameForLayoutFrame_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_glyphFrameForLayoutFrame:sizeThatFits:");
}

id objc_msgSend__glyphImageNameForCurrentStateWithControlType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_glyphImageNameForCurrentStateWithControlType:");
}

id objc_msgSend__glyphViewVisualStyleForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 _glyphViewVisualStyleForCurrentState];
}

id objc_msgSend__highlightingBackgroundView(void *a1, const char *a2, ...)
{
  return _[a1 _highlightingBackgroundView];
}

id objc_msgSend__iconLayoutFrameForControlFrame_isRTL_controlSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iconLayoutFrameForControlFrame:isRTL:controlSize:");
}

id objc_msgSend__imageSymbolConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 _imageSymbolConfiguration];
}

id objc_msgSend__imageViewFrameWithBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageViewFrameWithBounds:");
}

id objc_msgSend__initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithIdentifier:");
}

id objc_msgSend__inscribedRectInBoundingPathByInsettingRect_onEdges_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inscribedRectInBoundingPathByInsettingRect:onEdges:withOptions:");
}

id objc_msgSend__invalidateAndAnimateViewLayoutIfAppropriate(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateAndAnimateViewLayoutIfAppropriate];
}

id objc_msgSend__invalidateContentSize(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateContentSize];
}

id objc_msgSend__invalidatePreferredExpandedContentSize(void *a1, const char *a2, ...)
{
  return _[a1 _invalidatePreferredExpandedContentSize];
}

id objc_msgSend__isBackgroundViewHighlighted(void *a1, const char *a2, ...)
{
  return _[a1 _isBackgroundViewHighlighted];
}

id objc_msgSend__isCheckmarkEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isCheckmarkEnabled];
}

id objc_msgSend__isDrawingSelectedAppearance(void *a1, const char *a2, ...)
{
  return _[a1 _isDrawingSelectedAppearance];
}

id objc_msgSend__isInAnimationBlockWithAnimationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isInAnimationBlockWithAnimationsEnabled];
}

id objc_msgSend__isRequestingInitialUseView(void *a1, const char *a2, ...)
{
  return _[a1 _isRequestingInitialUseView];
}

id objc_msgSend__isVideoModuleEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isVideoModuleEnabled];
}

id objc_msgSend__layoutSubviewInBounds_measuringOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutSubviewInBounds:measuringOnly:");
}

id objc_msgSend__layoutSubviewsInBounds_measuringOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutSubviewsInBounds:measuringOnly:");
}

id objc_msgSend__lifetimeForLifetimeDetailsIdentifier_ofActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lifetimeForLifetimeDetailsIdentifier:ofActivity:");
}

id objc_msgSend__markOnboardingEncountered(void *a1, const char *a2, ...)
{
  return _[a1 _markOnboardingEncountered];
}

id objc_msgSend__name(void *a1, const char *a2, ...)
{
  return _[a1 _name];
}

id objc_msgSend__needsTextAttributesUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _needsTextAttributesUpdate];
}

id objc_msgSend__newLabel(void *a1, const char *a2, ...)
{
  return _[a1 _newLabel];
}

id objc_msgSend__newMenuItemView(void *a1, const char *a2, ...)
{
  return _[a1 _newMenuItemView];
}

id objc_msgSend__newSlider(void *a1, const char *a2, ...)
{
  return _[a1 _newSlider];
}

id objc_msgSend__newTitleLabelForOnState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newTitleLabelForOnState:");
}

id objc_msgSend__openSetupUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openSetupUI:");
}

id objc_msgSend__openURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openURL:");
}

id objc_msgSend__optionsButtonLayoutFrameForControlFrame_isRTL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_optionsButtonLayoutFrameForControlFrame:isRTL:");
}

id objc_msgSend__optionsControlTypeForControlStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_optionsControlTypeForControlStyle:");
}

id objc_msgSend__orderedSubviewsIncludingHeader_andFooter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_orderedSubviewsIncludingHeader:andFooter:");
}

id objc_msgSend__preferredExpandedContentSize(void *a1, const char *a2, ...)
{
  return _[a1 _preferredExpandedContentSize];
}

id objc_msgSend__preferredFont_textStyle_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFont:textStyle:weight:");
}

id objc_msgSend__preferredFont_textStyle_weight_additionalTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFont:textStyle:weight:additionalTraits:");
}

id objc_msgSend__preferredFontDescriptorWithTextStyle_addingSymbolicTraits_design_weight_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontDescriptorWithTextStyle:addingSymbolicTraits:design:weight:compatibleWithTraitCollection:");
}

id objc_msgSend__recalculateContentSize(void *a1, const char *a2, ...)
{
  return _[a1 _recalculateContentSize];
}

id objc_msgSend__recipe(void *a1, const char *a2, ...)
{
  return _[a1 _recipe];
}

id objc_msgSend__rpLocalizedStringFromFrameworkBundleWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rpLocalizedStringFromFrameworkBundleWithKey:");
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__separatorHeight(void *a1, const char *a2, ...)
{
  return _[a1 _separatorHeight];
}

id objc_msgSend__setAccessoryImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAccessoryImage:");
}

id objc_msgSend__setActivationDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActivationDescription:");
}

id objc_msgSend__setActivationDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActivationDetails:");
}

id objc_msgSend__setActiveActivity_withLifetime_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActiveActivity:withLifetime:reason:");
}

id objc_msgSend__setActiveEffectLabelVibrancy(void *a1, const char *a2, ...)
{
  return _[a1 _setActiveEffectLabelVibrancy];
}

id objc_msgSend__setActivityLifetimeDescriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActivityLifetimeDescriptions:");
}

id objc_msgSend__setActivityLifetimesAlternativeDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActivityLifetimesAlternativeDescription:");
}

id objc_msgSend__setAnimator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAnimator:");
}

id objc_msgSend__setBackgroundViewHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBackgroundViewHighlighted:");
}

id objc_msgSend__setConfiguringEducationCard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setConfiguringEducationCard:");
}

id objc_msgSend__setContainerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContainerView:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setContractedFrame_viaResizeWithRepresentedActivity_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContractedFrame:viaResizeWithRepresentedActivity:transitionCoordinator:");
}

id objc_msgSend__setContractedFrame_viaScaleWithRepresentedActivity_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContractedFrame:viaScaleWithRepresentedActivity:transitionCoordinator:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__setEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setEffect:");
}

id objc_msgSend__setExpandedFrame_initialFrame_representedActivity_anchorActivityView_collapsedSizeBlock_preludeBlock_activityViewAnimationBlock_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setExpandedFrame:initialFrame:representedActivity:anchorActivityView:collapsedSizeBlock:preludeBlock:activityViewAnimationBlock:transitionCoordinator:");
}

id objc_msgSend__setExpandedFrame_initialFrame_viaResizeWithRepresentedActivity_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setExpandedFrame:initialFrame:viaResizeWithRepresentedActivity:transitionCoordinator:");
}

id objc_msgSend__setExpandedFrame_initialFrame_viaScaleWithRepresentedActivity_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setExpandedFrame:initialFrame:viaScaleWithRepresentedActivity:transitionCoordinator:");
}

id objc_msgSend__setHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHyphenationFactor:");
}

id objc_msgSend__setKeepTouchesOnContinuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setKeepTouchesOnContinuation:");
}

id objc_msgSend__setLifetimeForActiveActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLifetimeForActiveActivity:");
}

id objc_msgSend__setNeedsTextAttributesUpdate(void *a1, const char *a2, ...)
{
  return _[a1 _setNeedsTextAttributesUpdate];
}

id objc_msgSend__setRequestingInitialUseView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRequestingInitialUseView:");
}

id objc_msgSend__setSelectedIfNeccessary(void *a1, const char *a2, ...)
{
  return _[a1 _setSelectedIfNeccessary];
}

id objc_msgSend__setSliderAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSliderAction:");
}

id objc_msgSend__setSubtitleLabelText(void *a1, const char *a2, ...)
{
  return _[a1 _setSubtitleLabelText];
}

id objc_msgSend__setTextAlignmentFollowsWritingDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTextAlignmentFollowsWritingDirection:");
}

id objc_msgSend__setTextLayoutDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTextLayoutDisabled:");
}

id objc_msgSend__setupModuleImageView(void *a1, const char *a2, ...)
{
  return _[a1 _setupModuleImageView];
}

id objc_msgSend__setupVideoImageTint(void *a1, const char *a2, ...)
{
  return _[a1 _setupVideoImageTint];
}

id objc_msgSend__shouldReverseLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 _shouldReverseLayoutDirection];
}

id objc_msgSend__sizeThatFits_collapsedToPill_includingFooter_forceMeasurement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sizeThatFits:collapsedToPill:includingFooter:forceMeasurement:");
}

id objc_msgSend__sizeThatFits_withControlSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sizeThatFits:withControlSize:");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__textFrameForBounds_accessoryImageFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textFrameForBounds:accessoryImageFrame:");
}

id objc_msgSend__textFrameForControlFrame_iconLayoutFrame_isRTL_controlSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textFrameForControlFrame:iconLayoutFrame:isRTL:controlSize:");
}

id objc_msgSend__textFrameInBounds_isRTL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_textFrameInBounds:isRTL:");
}

id objc_msgSend__titleLabelVisualStyleForHighlightState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleLabelVisualStyleForHighlightState:");
}

id objc_msgSend__toggleHighlightForMenuElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toggleHighlightForMenuElement:");
}

id objc_msgSend__transitionCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 _transitionCoordinator];
}

id objc_msgSend__unexpandedSubtitleFont(void *a1, const char *a2, ...)
{
  return _[a1 _unexpandedSubtitleFont];
}

id objc_msgSend__unexpandedTitleFont(void *a1, const char *a2, ...)
{
  return _[a1 _unexpandedTitleFont];
}

id objc_msgSend__updateAccessibilityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _updateAccessibilityIdentifier];
}

id objc_msgSend__updateActiveActivities(void *a1, const char *a2, ...)
{
  return _[a1 _updateActiveActivities];
}

id objc_msgSend__updateActiveActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActiveActivity:");
}

id objc_msgSend__updateActiveModeAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _updateActiveModeAssertionIfNecessary];
}

id objc_msgSend__updateActivityDetail(void *a1, const char *a2, ...)
{
  return _[a1 _updateActivityDetail];
}

id objc_msgSend__updateActivityIcon(void *a1, const char *a2, ...)
{
  return _[a1 _updateActivityIcon];
}

id objc_msgSend__updateActivityTitle(void *a1, const char *a2, ...)
{
  return _[a1 _updateActivityTitle];
}

id objc_msgSend__updateAppNameView(void *a1, const char *a2, ...)
{
  return _[a1 _updateAppNameView];
}

id objc_msgSend__updateCameraState(void *a1, const char *a2, ...)
{
  return _[a1 _updateCameraState];
}

id objc_msgSend__updateDrawingSelectedAppearance(void *a1, const char *a2, ...)
{
  return _[a1 _updateDrawingSelectedAppearance];
}

id objc_msgSend__updateHeaderOrFooterIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _updateHeaderOrFooterIfNecessary];
}

id objc_msgSend__updateLifetimeForActiveActivity(void *a1, const char *a2, ...)
{
  return _[a1 _updateLifetimeForActiveActivity];
}

id objc_msgSend__updateLifetimeForActiveActivityIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _updateLifetimeForActiveActivityIfNecessary];
}

id objc_msgSend__updateLifetimesAlternativeDescriptionForActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLifetimesAlternativeDescriptionForActivity:");
}

id objc_msgSend__updateModuleImageView(void *a1, const char *a2, ...)
{
  return _[a1 _updateModuleImageView];
}

id objc_msgSend__updatePreferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 _updatePreferredContentSize];
}

id objc_msgSend__updatePreviouslyActiveActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePreviouslyActiveActivity:");
}

id objc_msgSend__updateSelectedStateOfActivityControl_activeActivity_lifetimeOfActiveActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSelectedStateOfActivityControl:activeActivity:lifetimeOfActiveActivity:");
}

id objc_msgSend__updateSelectedStateOfActivityViews(void *a1, const char *a2, ...)
{
  return _[a1 _updateSelectedStateOfActivityViews];
}

id objc_msgSend__updateTextAttributesForActivationDescriptionLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesForActivationDescriptionLabel];
}

id objc_msgSend__updateTextAttributesForActivationDetailsLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesForActivationDetailsLabel];
}

id objc_msgSend__updateTextAttributesForActivityItemImageView(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesForActivityItemImageView];
}

id objc_msgSend__updateTextAttributesForActivityTitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesForActivityTitleLabel];
}

id objc_msgSend__updateTextAttributesForAlternativeDescriptionLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesForAlternativeDescriptionLabel];
}

id objc_msgSend__updateTextAttributesForDetailLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesForDetailLabel];
}

id objc_msgSend__updateTextAttributesForFooterLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesForFooterLabel];
}

id objc_msgSend__updateTextAttributesForHeadlineLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesForHeadlineLabel];
}

id objc_msgSend__updateTextAttributesForTitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesForTitleLabel];
}

id objc_msgSend__updateTextAttributesForTitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTextAttributesForTitleLabel:");
}

id objc_msgSend__updateTextAttributesIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextAttributesIfNecessary];
}

id objc_msgSend__updateTitle_on_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateTitle:on:");
}

id objc_msgSend__updateVideoImageViewWithCameraOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVideoImageViewWithCameraOn:");
}

id objc_msgSend__updateVisualStylingOfView_style_visualStylingProvider_outgoingProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:");
}

id objc_msgSend__updateVisualStylingOfView_style_visualStylingProvider_outgoingProvider_observerBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:observerBlock:");
}

id objc_msgSend__visualStylingForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualStylingForStyle:");
}

id objc_msgSend__visualStylingForStyleNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualStylingForStyleNamed:");
}

id objc_msgSend__visualStylingProvider_didChangeForCategory_outgoingProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualStylingProvider:didChangeForCategory:outgoingProvider:");
}

id objc_msgSend__visualStylingProviderDidChange_forCategory_outgoingProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualStylingProviderDidChange:forCategory:outgoingProvider:");
}

id objc_msgSend__visualStylingProviderForRecipe_andCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualStylingProviderForRecipe:andCategory:");
}

id objc_msgSend__visualStylingProviderForStyleSetNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visualStylingProviderForStyleSetNamed:inBundle:");
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithHandler:");
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:image:identifier:handler:");
}

id objc_msgSend_activeActivities(void *a1, const char *a2, ...)
{
  return _[a1 activeActivities];
}

id objc_msgSend_activeActivity(void *a1, const char *a2, ...)
{
  return _[a1 activeActivity];
}

id objc_msgSend_activeActivityDidChangeForManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeActivityDidChangeForManager:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 activeInterfaceOrientation];
}

id objc_msgSend_activeModeDidChangeForManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeModeDidChangeForManager:");
}

id objc_msgSend_activityColorName(void *a1, const char *a2, ...)
{
  return _[a1 activityColorName];
}

id objc_msgSend_activityDetailText(void *a1, const char *a2, ...)
{
  return _[a1 activityDetailText];
}

id objc_msgSend_activityDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 activityDisplayName];
}

id objc_msgSend_activityIcon(void *a1, const char *a2, ...)
{
  return _[a1 activityIcon];
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activityIdentifier];
}

id objc_msgSend_activityLifetimeDescriptions(void *a1, const char *a2, ...)
{
  return _[a1 activityLifetimeDescriptions];
}

id objc_msgSend_activityLifetimesAlternativeDescription(void *a1, const char *a2, ...)
{
  return _[a1 activityLifetimesAlternativeDescription];
}

id objc_msgSend_activityManager_lifetimeDescriptionsDidChangeForActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityManager:lifetimeDescriptionsDidChangeForActivity:");
}

id objc_msgSend_activityManager_suggestedActivityDidChangeForLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityManager:suggestedActivityDidChangeForLocation:");
}

id objc_msgSend_activitySettingsURL(void *a1, const char *a2, ...)
{
  return _[a1 activitySettingsURL];
}

id objc_msgSend_activitySetupURL(void *a1, const char *a2, ...)
{
  return _[a1 activitySetupURL];
}

id objc_msgSend_activitySymbolImageName(void *a1, const char *a2, ...)
{
  return _[a1 activitySymbolImageName];
}

id objc_msgSend_activityUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 activityUniqueIdentifier];
}

id objc_msgSend_activityViews(void *a1, const char *a2, ...)
{
  return _[a1 activityViews];
}

id objc_msgSend_activityWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityWithIdentifier:");
}

id objc_msgSend_addAction_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:forControlEvents:");
}

id objc_msgSend_addAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimations:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInteraction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addVideoView(void *a1, const char *a2, ...)
{
  return _[a1 addVideoView];
}

id objc_msgSend_adjustForContentSizeCategoryChange(void *a1, const char *a2, ...)
{
  return _[a1 adjustForContentSizeCategoryChange];
}

id objc_msgSend_adjustsFontForContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 adjustsFontForContentSizeCategory];
}

id objc_msgSend_affineTransform(void *a1, const char *a2, ...)
{
  return _[a1 affineTransform];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_alternativeDescription(void *a1, const char *a2, ...)
{
  return _[a1 alternativeDescription];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateTransition:");
}

id objc_msgSend_appNameView(void *a1, const char *a2, ...)
{
  return _[a1 appNameView];
}

id objc_msgSend_applyTransformForExternalCamera(void *a1, const char *a2, ...)
{
  return _[a1 applyTransformForExternalCamera];
}

id objc_msgSend_applyTransformWithOrientation(void *a1, const char *a2, ...)
{
  return _[a1 applyTransformWithOrientation];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_automaticallyUpdateView_withStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automaticallyUpdateView:withStyle:");
}

id objc_msgSend_automaticallyUpdateView_withStyle_andObserverBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automaticallyUpdateView:withStyle:andObserverBlock:");
}

id objc_msgSend_availableActivities(void *a1, const char *a2, ...)
{
  return _[a1 availableActivities];
}

id objc_msgSend_availableActivitiesDidChangeForManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableActivitiesDidChangeForManager:");
}

id objc_msgSend_availableFrameSenderEndpointsByPID(void *a1, const char *a2, ...)
{
  return _[a1 availableFrameSenderEndpointsByPID];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginAppearanceTransition_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAppearanceTransition:animated:");
}

id objc_msgSend_bezierPathWithOvalInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithOvalInRect:");
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:cornerRadius:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_firstObjectPassingTest:");
}

id objc_msgSend_bs_isAppearingOrAppeared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_isAppearingOrAppeared");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return _[a1 button];
}

id objc_msgSend_buttonView(void *a1, const char *a2, ...)
{
  return _[a1 buttonView];
}

id objc_msgSend_checkLockStatus(void *a1, const char *a2, ...)
{
  return _[a1 checkLockStatus];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_compactContinuousCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 compactContinuousCornerRadius];
}

id objc_msgSend_completeDescriptionWithReferencePointSize_maximumPointSize_referenceDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeDescriptionWithReferencePointSize:maximumPointSize:referenceDimension:");
}

id objc_msgSend_configurationWithFont_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithFont:scale:");
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithHierarchicalColor:");
}

id objc_msgSend_configurationWithPointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:");
}

id objc_msgSend_configurationWithTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithTextStyle:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_controlCenterApplyPrimaryContentShadow(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterApplyPrimaryContentShadow];
}

id objc_msgSend_controlCenterKeyLineOnLightVibrancyEffect(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterKeyLineOnLightVibrancyEffect];
}

id objc_msgSend_controlCenterModuleBackgroundMaterial(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterModuleBackgroundMaterial];
}

id objc_msgSend_controlCenterPrimaryVibrancyEffect(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterPrimaryVibrancyEffect];
}

id objc_msgSend_controlCenterSecondaryVibrancyEffect(void *a1, const char *a2, ...)
{
  return _[a1 controlCenterSecondaryVibrancyEffect];
}

id objc_msgSend_controlMode(void *a1, const char *a2, ...)
{
  return _[a1 controlMode];
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:toView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_cornerCurve(void *a1, const char *a2, ...)
{
  return _[a1 cornerCurve];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultAction(void *a1, const char *a2, ...)
{
  return _[a1 defaultAction];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultEducationCardViewWithDismissAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultEducationCardViewWithDismissAction:");
}

id objc_msgSend_defaultFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultFontDescriptorWithTextStyle:");
}

id objc_msgSend_defaultFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_defaultTintColorName(void *a1, const char *a2, ...)
{
  return _[a1 defaultTintColorName];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_detailText(void *a1, const char *a2, ...)
{
  return _[a1 detailText];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_discoverabilityTitle(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilityTitle];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_dnd_defaultSetupURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dnd_defaultSetupURL");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_effectIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 effectIdentifier];
}

id objc_msgSend_effectWithPreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectWithPreview:");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endAppearanceTransition(void *a1, const char *a2, ...)
{
  return _[a1 endAppearanceTransition];
}

id objc_msgSend_enqueueSampleBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueSampleBuffer:");
}

id objc_msgSend_enumerateEventHandlers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateEventHandlers:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_externalCameraDidChangeForManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalCameraDidChangeForManager:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_flushAndRemoveImage(void *a1, const char *a2, ...)
{
  return _[a1 flushAndRemoveImage];
}

id objc_msgSend_flushVideoView(void *a1, const char *a2, ...)
{
  return _[a1 flushVideoView];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_footerAction(void *a1, const char *a2, ...)
{
  return _[a1 footerAction];
}

id objc_msgSend_footerView(void *a1, const char *a2, ...)
{
  return _[a1 footerView];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_gestureRecognizerForExclusionRelationships(void *a1, const char *a2, ...)
{
  return _[a1 gestureRecognizerForExclusionRelationships];
}

id objc_msgSend_getAppNameString(void *a1, const char *a2, ...)
{
  return _[a1 getAppNameString];
}

id objc_msgSend_getUnavailableString(void *a1, const char *a2, ...)
{
  return _[a1 getUnavailableString];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashTableWithOptions:");
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _[a1 headerView];
}

id objc_msgSend_hideVideoConferenceButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideVideoConferenceButtons:");
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hitTest:withEvent:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAction:");
}

id objc_msgSend_initWithActivityDescription_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityDescription:style:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBaubleDescription_shadowAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBaubleDescription:shadowAttributes:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfiguration_coordinateSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:coordinateSpace:");
}

id objc_msgSend_initWithControlStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithControlStyle:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDuration_timingParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:timingParameters:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrameSenderServerEndpoint_frameReceiverHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrameSenderServerEndpoint:frameReceiverHandler:");
}

id objc_msgSend_initWithGlyphImage_highlightColor_useLightStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGlyphImage:highlightColor:useLightStyle:");
}

id objc_msgSend_initWithHeadlineText_bodyText_dismissAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHeadlineText:bodyText:dismissAction:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithMass_stiffness_damping_initialVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMass:stiffness:damping:initialVelocity:");
}

id objc_msgSend_initWithMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMode:");
}

id objc_msgSend_initWithName_effectIdentifier_symbolImageName_tintColorName_intensityName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:effectIdentifier:symbolImageName:tintColorName:intensityName:");
}

id objc_msgSend_initWithName_effectIdentifier_symbolImageName_tintColorName_intensityName_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:effectIdentifier:symbolImageName:tintColorName:intensityName:identifier:");
}

id objc_msgSend_initWithName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:object:userInfo:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithRecipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecipe:");
}

id objc_msgSend_initWithReferencePointSize_maximumPointSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReferencePointSize:maximumPointSize:");
}

id objc_msgSend_initWithStyle_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:inBundle:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithSystemImageName_tintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSystemImageName:tintColor:");
}

id objc_msgSend_initWithSystemImageName_tintColor_referencePointSize_maximumPointSize_referenceDimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSystemImageName:tintColor:referencePointSize:maximumPointSize:referenceDimension:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithVideoEffectsModule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVideoEffectsModule:");
}

id objc_msgSend_initWithView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithView:");
}

id objc_msgSend_initWithView_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithView:parameters:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertString:atIndex:");
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:aboveSubview:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intensityName(void *a1, const char *a2, ...)
{
  return _[a1 intensityName];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isContracted(void *a1, const char *a2, ...)
{
  return _[a1 isContracted];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return _[a1 isExpanded];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return _[a1 isHighlighted];
}

id objc_msgSend_isMenuElement(void *a1, const char *a2, ...)
{
  return _[a1 isMenuElement];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 isPlaceholder];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isSelectionHidden(void *a1, const char *a2, ...)
{
  return _[a1 isSelectionHidden];
}

id objc_msgSend_isVideoModuleEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isVideoModuleEnabled];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutVideoConferenceSubviews(void *a1, const char *a2, ...)
{
  return _[a1 layoutVideoConferenceSubviews];
}

id objc_msgSend_leading(void *a1, const char *a2, ...)
{
  return _[a1 leading];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lifetimeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 lifetimeIdentifier];
}

id objc_msgSend_lifetimeOfActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lifetimeOfActivity:");
}

id objc_msgSend_lightConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 lightConfiguration];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _[a1 lineHeight];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 loadViewIfNeeded];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedTerminationDescriptionForActiveActivity(void *a1, const char *a2, ...)
{
  return _[a1 localizedTerminationDescriptionForActiveActivity];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_materialViewWithRecipe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "materialViewWithRecipe:");
}

id objc_msgSend_maximumPointSize(void *a1, const char *a2, ...)
{
  return _[a1 maximumPointSize];
}

id objc_msgSend_menuAlternativeDescription(void *a1, const char *a2, ...)
{
  return _[a1 menuAlternativeDescription];
}

id objc_msgSend_menuItemActions(void *a1, const char *a2, ...)
{
  return _[a1 menuItemActions];
}

id objc_msgSend_menuItemElements(void *a1, const char *a2, ...)
{
  return _[a1 menuItemElements];
}

id objc_msgSend_menuView(void *a1, const char *a2, ...)
{
  return _[a1 menuView];
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsForTextStyle:");
}

id objc_msgSend_mt_removeAllVisualStyling(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_removeAllVisualStyling");
}

id objc_msgSend_mt_replaceVisualStyling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_replaceVisualStyling:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_numberOfLineFragments(void *a1, const char *a2, ...)
{
  return _[a1 numberOfLineFragments];
}

id objc_msgSend_numberOfTapsRequired(void *a1, const char *a2, ...)
{
  return _[a1 numberOfTapsRequired];
}

id objc_msgSend_numberOfTouchesRequired(void *a1, const char *a2, ...)
{
  return _[a1 numberOfTouchesRequired];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_optionsAction(void *a1, const char *a2, ...)
{
  return _[a1 optionsAction];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 panGestureRecognizer];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_performAction(void *a1, const char *a2, ...)
{
  return _[a1 performAction];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotification:");
}

id objc_msgSend_postNotificationWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationWithBundleID:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredExpandedContentHeight(void *a1, const char *a2, ...)
{
  return _[a1 preferredExpandedContentHeight];
}

id objc_msgSend_preferredExpandedContentWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredExpandedContentWidth];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:compatibleWithTraitCollection:");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rect(void *a1, const char *a2, ...)
{
  return _[a1 rect];
}

id objc_msgSend_referenceDimension(void *a1, const char *a2, ...)
{
  return _[a1 referenceDimension];
}

id objc_msgSend_referencePointSize(void *a1, const char *a2, ...)
{
  return _[a1 referencePointSize];
}

id objc_msgSend_refreshSensorActivityData(void *a1, const char *a2, ...)
{
  return _[a1 refreshSensorActivityData];
}

id objc_msgSend_regionWithRect_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regionWithRect:identifier:");
}

id objc_msgSend_registerForTraitChanges_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTraitChanges:withHandler:");
}

id objc_msgSend_removeAction_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAction:forControlEvents:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeGestureRecognizer:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeVideoPreview(void *a1, const char *a2, ...)
{
  return _[a1 removeVideoPreview];
}

id objc_msgSend_removeVideoView(void *a1, const char *a2, ...)
{
  return _[a1 removeVideoView];
}

id objc_msgSend_representedObjectIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 representedObjectIdentifier];
}

id objc_msgSend_requireGestureRecognizerToFail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requireGestureRecognizerToFail:");
}

id objc_msgSend_requiredVisualStyleCategories(void *a1, const char *a2, ...)
{
  return _[a1 requiredVisualStyleCategories];
}

id objc_msgSend_rpccui_animateWithAnimationType_actions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_animateWithAnimationType:actions:completion:");
}

id objc_msgSend_rpccui_animateWithDefaultParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_animateWithDefaultParameters:completion:");
}

id objc_msgSend_rpccui_animateWithSelectionParameters_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_animateWithSelectionParameters:completion:");
}

id objc_msgSend_rpccui_colorForActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_colorForActivity:");
}

id objc_msgSend_rpccui_containsExcessiveLineHeightCharacters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_containsExcessiveLineHeightCharacters");
}

id objc_msgSend_rpccui_drawingHeightForText_withNumberOfLines_additionalPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_drawingHeightForText:withNumberOfLines:additionalPadding:");
}

id objc_msgSend_rpccui_drawingHeightWithNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_drawingHeightWithNumberOfLines:");
}

id objc_msgSend_rpccui_effectiveLineHeightForText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_effectiveLineHeightForText:");
}

id objc_msgSend_rpccui_effectiveScaledValueForValue_hasExuberatedLineHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_effectiveScaledValueForValue:hasExuberatedLineHeight:");
}

id objc_msgSend_rpccui_excessiveLineHeightChars(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_excessiveLineHeightChars");
}

id objc_msgSend_rpccui_exuberatedValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_exuberatedValueForValue:");
}

id objc_msgSend_rpccui_hasExuberatedLineHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_hasExuberatedLineHeight");
}

id objc_msgSend_rpccui_hasExuberatedLineHeightForText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_hasExuberatedLineHeightForText:");
}

id objc_msgSend_rpccui_isEqualToAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_isEqualToAction:");
}

id objc_msgSend_rpccui_isEqualToActionArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_isEqualToActionArray:");
}

id objc_msgSend_rpccui_layoutPrimaryLabel_secondaryLabel_inTextFrame_primaryLabelFrame_secondaryLabelFrame_drawingContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_layoutPrimaryLabel:secondaryLabel:inTextFrame:primaryLabelFrame:secondaryLabelFrame:drawingContext:");
}

id objc_msgSend_rpccui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_layoutViewIfNeededAndAppearingOrAppearedWithSelectionAnimation");
}

id objc_msgSend_rpccui_measuringHeightForText_withNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_measuringHeightForText:withNumberOfLines:");
}

id objc_msgSend_rpccui_measuringHeightWithNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_measuringHeightWithNumberOfLines:");
}

id objc_msgSend_rpccui_numberOfLinesForText_inFrame_maximum_drawingContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_numberOfLinesForText:inFrame:maximum:drawingContext:");
}

id objc_msgSend_rpccui_numberOfLinesInFrame_maximum_drawingContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rpccui_numberOfLinesInFrame:maximum:drawingContext:");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValueForValue:");
}

id objc_msgSend_scaledValueForValue_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValueForValue:compatibleWithTraitCollection:");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_selectionChanged(void *a1, const char *a2, ...)
{
  return _[a1 selectionChanged];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return _[a1 semanticContentAttribute];
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return _[a1 sender];
}

id objc_msgSend_sensorActivityDataForActiveSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sensorActivityDataForActiveSensorType:");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setActiveActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveActivities:");
}

id objc_msgSend_setActivity_active_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivity:active:reason:");
}

id objc_msgSend_setActivityDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityDescription:");
}

id objc_msgSend_setActivityIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityIcon:");
}

id objc_msgSend_setActivityViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityViews:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlternativeDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternativeDescription:");
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceVertical:");
}

id objc_msgSend_setAppNameView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppNameView:");
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizesSubviews:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCancelsTouchesInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelsTouchesInView:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setCinematicFrameButtonSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCinematicFrameButtonSubtitle:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCollapsedSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollapsedSize:");
}

id objc_msgSend_setCompactActivityView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompactActivityView:");
}

id objc_msgSend_setCompactContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompactContinuousCornerRadius:");
}

id objc_msgSend_setContentDetached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentDetached:");
}

id objc_msgSend_setContentEdgeInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentEdgeInsets:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setContentModuleContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentModuleContext:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setContracted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContracted:");
}

id objc_msgSend_setContractedFrame_representedActivity_presentationStyle_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContractedFrame:representedActivity:presentationStyle:transitionCoordinator:");
}

id objc_msgSend_setControlType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlType:");
}

id objc_msgSend_setDefaultAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultAction:");
}

id objc_msgSend_setDelaysTouchesEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelaysTouchesEnded:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetailText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailText:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDiscoverabilityTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoverabilityTitle:");
}

id objc_msgSend_setEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEffect:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExpanded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpanded:");
}

id objc_msgSend_setExpanded_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpanded:withTransitionCoordinator:");
}

id objc_msgSend_setExpandedFrame_initialFrame_representedActivity_presentationStyle_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpandedFrame:initialFrame:representedActivity:presentationStyle:transitionCoordinator:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFooterAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterAction:");
}

id objc_msgSend_setFooterPinnedToBottom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterPinnedToBottom:");
}

id objc_msgSend_setFooterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFooterView:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGestureButtonSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGestureButtonSubtitle:");
}

id objc_msgSend_setGlyphImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlyphImage:");
}

id objc_msgSend_setHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderView:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHitTestInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHitTestInsets:");
}

id objc_msgSend_setHomeGestureDismissalAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHomeGestureDismissalAllowed:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setInoperative_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInoperative:");
}

id objc_msgSend_setIntensity_forActivityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntensity:forActivityIdentifier:");
}

id objc_msgSend_setIntensity_withBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntensity:withBundleID:");
}

id objc_msgSend_setLabelsVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabelsVisible:");
}

id objc_msgSend_setLifetimeDescriptionsUpdatingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLifetimeDescriptionsUpdatingEnabled:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setMaskedCorners_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaskedCorners:");
}

id objc_msgSend_setMaximumValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumValue:");
}

id objc_msgSend_setMaximumValueImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumValueImage:");
}

id objc_msgSend_setMenuAlternativeDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuAlternativeDescription:");
}

id objc_msgSend_setMenuItemActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMenuItemActions:");
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumPressDuration:");
}

id objc_msgSend_setMinimumValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValue:");
}

id objc_msgSend_setMinimumValueImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValueImage:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptionsAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptionsAction:");
}

id objc_msgSend_setParentControlHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentControlHighlighted:");
}

id objc_msgSend_setParentControlSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentControlSelected:");
}

id objc_msgSend_setPortraitBlurButtonSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPortraitBlurButtonSubtitle:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setPreferredSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredSymbolConfiguration:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSeparatorVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorVisible:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOffset:");
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowOpacity:");
}

id objc_msgSend_setShadowPathIsBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowPathIsBounds:");
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowRadius:");
}

id objc_msgSend_setShouldCreateVideoPreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldCreateVideoPreview:");
}

id objc_msgSend_setShouldLoadFromSensor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldLoadFromSensor:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setSlider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSlider:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:animated:");
}

id objc_msgSend_setState_forActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:forActivity:");
}

id objc_msgSend_setState_withBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:withBundleID:");
}

id objc_msgSend_setStudioLightButtonSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStudioLightButtonSubtitle:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSuggestedActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedActivity:");
}

id objc_msgSend_setSymbolImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSymbolImageName:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setVideoGravity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoGravity:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setVisiblePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisiblePath:");
}

id objc_msgSend_setVisualStylingProvider_forCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualStylingProvider:forCategory:");
}

id objc_msgSend_setWantsNumberOfLineFragments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsNumberOfLineFragments:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupCameraEffectsInitialState(void *a1, const char *a2, ...)
{
  return _[a1 setupCameraEffectsInitialState];
}

id objc_msgSend_setupCameraEffectsNotifications(void *a1, const char *a2, ...)
{
  return _[a1 setupCameraEffectsNotifications];
}

id objc_msgSend_setupInitialApplicationBundleID(void *a1, const char *a2, ...)
{
  return _[a1 setupInitialApplicationBundleID];
}

id objc_msgSend_setupInitialModuleState(void *a1, const char *a2, ...)
{
  return _[a1 setupInitialModuleState];
}

id objc_msgSend_setupInitialStateAndNotifications(void *a1, const char *a2, ...)
{
  return _[a1 setupInitialStateAndNotifications];
}

id objc_msgSend_setupModuleButtons(void *a1, const char *a2, ...)
{
  return _[a1 setupModuleButtons];
}

id objc_msgSend_setupModuleImageView(void *a1, const char *a2, ...)
{
  return _[a1 setupModuleImageView];
}

id objc_msgSend_setupTitleLabelViews(void *a1, const char *a2, ...)
{
  return _[a1 setupTitleLabelViews];
}

id objc_msgSend_setupUnavailableLabel(void *a1, const char *a2, ...)
{
  return _[a1 setupUnavailableLabel];
}

id objc_msgSend_sharedActivityManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedActivityManager];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeThatFitsCollapsedToPill_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFitsCollapsedToPill:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_startAnimationAfterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimationAfterDelay:");
}

id objc_msgSend_startFrameReceiver(void *a1, const char *a2, ...)
{
  return _[a1 startFrameReceiver];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stopAutomaticallyUpdatingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAutomaticallyUpdatingView:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_styleWithEffect_shape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "styleWithEffect:shape:");
}

id objc_msgSend_subviewFramesInBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviewFramesInBounds:");
}

id objc_msgSend_suggestedActivity(void *a1, const char *a2, ...)
{
  return _[a1 suggestedActivity];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_symbolImageName(void *a1, const char *a2, ...)
{
  return _[a1 symbolImageName];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlackColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGreenColor];
}

id objc_msgSend_systemImageName(void *a1, const char *a2, ...)
{
  return _[a1 systemImageName];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:compatibleWithTraitCollection:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_tertiarySystemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiarySystemFillColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_tintColorName(void *a1, const char *a2, ...)
{
  return _[a1 tintColorName];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_toggleExpandedActivityView_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleExpandedActivityView:withTransitionCoordinator:");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithPreferredContentSizeCategory:");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 transitionCoordinator];
}

id objc_msgSend_transitionDuration(void *a1, const char *a2, ...)
{
  return _[a1 transitionDuration];
}

id objc_msgSend_unavailableStringForReason_appName_forVideoEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unavailableStringForReason:appName:forVideoEffect:");
}

id objc_msgSend_unregisterForTraitChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterForTraitChanges:");
}

id objc_msgSend_updateActivteActivityText(void *a1, const char *a2, ...)
{
  return _[a1 updateActivteActivityText];
}

id objc_msgSend_updateAvailabilityWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAvailabilityWithBundleID:");
}

id objc_msgSend_updateBackgroundViewControllerAvailableLabel(void *a1, const char *a2, ...)
{
  return _[a1 updateBackgroundViewControllerAvailableLabel];
}

id objc_msgSend_updateControlModeWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateControlModeWithBundleID:");
}

id objc_msgSend_updateEnabledWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEnabledWithBundleID:");
}

id objc_msgSend_updateIntensityWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateIntensityWithBundleID:");
}

id objc_msgSend_updateItemViewWithState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateItemViewWithState:");
}

id objc_msgSend_updateMenuItemViewWithState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMenuItemViewWithState:");
}

id objc_msgSend_updateModuleImageView(void *a1, const char *a2, ...)
{
  return _[a1 updateModuleImageView];
}

id objc_msgSend_updateModuleSubtitle(void *a1, const char *a2, ...)
{
  return _[a1 updateModuleSubtitle];
}

id objc_msgSend_updateSupportedLabelConstraints(void *a1, const char *a2, ...)
{
  return _[a1 updateSupportedLabelConstraints];
}

id objc_msgSend_updateSupportedLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 updateSupportedLabelFont];
}

id objc_msgSend_updateVideoButtonConstraints(void *a1, const char *a2, ...)
{
  return _[a1 updateVideoButtonConstraints];
}

id objc_msgSend_updateVideoEffectStatesWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVideoEffectStatesWithBundleID:");
}

id objc_msgSend_updateVideoEffectsStates(void *a1, const char *a2, ...)
{
  return _[a1 updateVideoEffectsStates];
}

id objc_msgSend_updateVideoImageViewWithCameraOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateVideoImageViewWithCameraOn:");
}

id objc_msgSend_updateVisuals(void *a1, const char *a2, ...)
{
  return _[a1 updateVisuals];
}

id objc_msgSend_usedRecently(void *a1, const char *a2, ...)
{
  return _[a1 usedRecently];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLayoutDirectionForSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceLayoutDirectionForSemanticContentAttribute:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_verifyCenterStageAvailability(void *a1, const char *a2, ...)
{
  return _[a1 verifyCenterStageAvailability];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _[a1 viewIfLoaded];
}

id objc_msgSend_visualStylingProviderForCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visualStylingProviderForCategory:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_willPresent_withTargetContainerBounds_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willPresent:withTargetContainerBounds:transitionCoordinator:");
}