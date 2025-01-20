int main(int argc, const char **argv, const char **envp)
{
  id v3;
  void *v4;
  int result;
  void v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100001468;
  v6[3] = &unk_100010388;
  v6[4] = (id)objc_opt_new();
  +[BSServiceConnectionListener listenerWithConfigurator:v6];
  [(id)objc_claimAutoreleasedReturnValue() activate];
  v3 = +[BSServicesConfiguration activateXPCService];
  sub_100001468((uint64_t)v3, v4);
  return result;
}

void sub_100001468(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"XPCService"];
  [v3 setService:@"DisplayArchive"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

NSString *__cdecl sub_10000160C(id a1, DASContextInfo *a2)
{
  return +[NSString stringWithFormat:@"%x", [(DASContextInfo *)a2 identifier]];
}

uint64_t sub_100001964(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 32) + 8);
}

uint64_t sub_100001970(uint64_t a1)
{
  return *(int *)(*(void *)(a1 + 32) + 12);
}

void sub_100001BD4(uint64_t a1)
{
  v2 = +[NSMutableDictionary dictionary];
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100001D0C;
  v10[3] = &unk_100010468;
  id v4 = v2;
  id v11 = v4;
  objc_msgSend(v3, "bs_each:", v10);
  v5 = *(void **)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100001DD8;
  v7[3] = &unk_1000104B0;
  id v8 = v4;
  id v9 = v5;
  id v6 = v4;
  [v9 appendBodySectionWithName:@"contextsByPID" multilinePrefix:0 block:v7];
}

void sub_100001D0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 pid]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (v6)
  {
    v7 = v6;
    [v6 addObject:v5];
  }
  else
  {
    v7 = +[NSMutableSet setWithObject:v5];

    [*(id *)(a1 + 32) setObject:v7 forKey:v8];
  }
}

void sub_100001DD8(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v2 = [*(id *)(a1 + 32) allKeys];
  id v3 = objc_msgSend(v2, "sortedArrayUsingSelector:");

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v16 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        id v9 = [*(id *)(a1 + 32) objectForKey:v7];
        v10 = [v9 allObjects];
        id v11 = [v10 sortedArrayUsingSelector:"compare:"];
        v12 = objc_msgSend(v11, "bs_map:", &stru_100010488);
        v13 = [v12 componentsJoinedByString:@", "];
        v14 = [v7 description];
        [v8 appendString:v13 withName:v14];
      }
      id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

NSString *__cdecl sub_100001F98(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:@"%x", [(NSNumber *)a2 unsignedIntValue]];
}

void sub_100002490(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v24])
  {
    id v9 = +[NSString stringWithFormat:@"duplicate entry for %@ in %@", v24, *(void *)(a1 + 40)];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
      id v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      uint64_t v13 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      v26 = v10;
      __int16 v27 = 2114;
      v28 = v12;
      __int16 v29 = 2048;
      uint64_t v30 = v13;
      __int16 v31 = 2114;
      CFStringRef v32 = @"DASParsing.m";
      __int16 v33 = 1024;
      int v34 = 157;
      __int16 v35 = 2114;
      v36 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v9 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000026A8);
  }
  id v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v24 identifier]);
  v7 = [*(id *)(a1 + 56) objectForKey:v6];

  if (v7)
  {
    v14 = +[NSString stringWithFormat:@"duplicate entry for contextIDNumber %@ in %@", v6, *(void *)(a1 + 40)];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(*(SEL *)(a1 + 72));
      uint64_t v16 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v16);
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      v26 = v15;
      __int16 v27 = 2114;
      v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      __int16 v31 = 2114;
      CFStringRef v32 = @"DASParsing.m";
      __int16 v33 = 1024;
      int v34 = 160;
      __int16 v35 = 2114;
      v36 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000027A0);
  }
  id v8 = [*(id *)(a1 + 64) objectForKey:v6];

  if (v8)
  {
    long long v19 = +[NSString stringWithFormat:@"duplicate entry for contextIDNumber %@ in %@", v6, *(void *)(a1 + 40)];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      long long v20 = NSStringFromSelector(*(SEL *)(a1 + 72));
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      uint64_t v23 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138544642;
      v26 = v20;
      __int16 v27 = 2114;
      v28 = v22;
      __int16 v29 = 2048;
      uint64_t v30 = v23;
      __int16 v31 = 2114;
      CFStringRef v32 = @"DASParsing.m";
      __int16 v33 = 1024;
      int v34 = 161;
      __int16 v35 = 2114;
      v36 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100002898);
  }
  [*(id *)(a1 + 56) setObject:v24 forKey:v6];
  [*(id *)(a1 + 64) setObject:v5 forKey:v6];
  [*(id *)(a1 + 32) addObject:v24];
}

void sub_1000034F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x240], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000355C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000356C(uint64_t a1)
{
}

void sub_100003574(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v2)
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");

      if (v3)
      {
        v7 = +[NSString stringWithFormat:@"cannot be more than one %@ group", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v8 = NSStringFromSelector(*(SEL *)(a1 + 80));
          id v9 = (objc_class *)objc_opt_class();
          v10 = NSStringFromClass(v9);
          uint64_t v11 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138544642;
          long long v19 = v8;
          __int16 v20 = 2114;
          v21 = v10;
          __int16 v22 = 2048;
          uint64_t v23 = v11;
          __int16 v24 = 2114;
          CFStringRef v25 = @"DASParsing.m";
          __int16 v26 = 1024;
          int v27 = 406;
          __int16 v28 = 2114;
          __int16 v29 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v7 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1000037B0);
      }
      [*(id *)(a1 + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      id v4 = *(void **)(a1 + 32);
      id v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
      objc_msgSend(v4, "setObject:forKey:");
    }
    else
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
      {
        v12 = +[NSString stringWithFormat:@"cannot be more than one unattached group"];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 80));
          v14 = (objc_class *)objc_opt_class();
          v15 = NSStringFromClass(v14);
          uint64_t v16 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138544642;
          long long v19 = v13;
          __int16 v20 = 2114;
          v21 = v15;
          __int16 v22 = 2048;
          uint64_t v23 = v16;
          __int16 v24 = 2114;
          CFStringRef v25 = @"DASParsing.m";
          __int16 v26 = 1024;
          int v27 = 410;
          __int16 v28 = 2114;
          __int16 v29 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
        }
        [v12 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1000038A0);
      }
      id v5 = [v2 copy];
      uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
      id v17 = *(id *)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
}

void sub_1000038A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  if ((unint64_t)[v4 count] >= 2)
  {
    v40 = +[NSString stringWithFormat:@"we can't match more than one display entry per line"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v41 = NSStringFromSelector(*(SEL *)(a1 + 104));
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      uint64_t v44 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544642;
      *(void *)v82 = v41;
      *(_WORD *)&v82[8] = 2114;
      *(void *)v83 = v43;
      *(_WORD *)&v83[8] = 2048;
      *(void *)v84 = v44;
      *(_WORD *)&v84[8] = 2114;
      *(void *)&v84[10] = @"DASParsing.m";
      __int16 v85 = 1024;
      int v86 = 417;
      __int16 v87 = 2114;
      v88 = v40;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v40 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100003EB4);
  }
  id v5 = [v4 firstObject];
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    id v6 = [v5 rangeWithName:@"displayName"];
    id v8 = objc_msgSend(v3, "substringWithRange:", v6, v7);
    id v9 = [v8 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

    v10 = sub_100005E28();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v82 = v9;
      *(_WORD *)&v82[8] = 2112;
      *(void *)v83 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "matched display '%@' in '%@'", buf, 0x16u);
    }

    if (![v9 length])
    {
      v50 = +[NSString stringWithFormat:@"must have a valid displayName"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v51 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v52 = (objc_class *)objc_opt_class();
        v53 = NSStringFromClass(v52);
        uint64_t v54 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v82 = v51;
        *(_WORD *)&v82[8] = 2114;
        *(void *)v83 = v53;
        *(_WORD *)&v83[8] = 2048;
        *(void *)v84 = v54;
        *(_WORD *)&v84[8] = 2114;
        *(void *)&v84[10] = @"DASParsing.m";
        __int16 v85 = 1024;
        int v86 = 425;
        __int16 v87 = 2114;
        v88 = v50;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v50 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100004094);
    }
    unsigned int v11 = [v9 isEqualToString:@"Unattached"];
    v12 = (id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    if (v11)
    {
      id v13 = *v12;
      id *v12 = 0;
    }
    else
    {
      objc_storeStrong(v12, v9);
      [*(id *)(a1 + 48) setObject:v3 forKey:v9];
    }
    uint64_t v14 = +[NSMutableOrderedSet orderedSet];
    uint64_t v15 = *(void *)(*(void *)(a1 + 96) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  id v17 = objc_msgSend(*(id *)(a1 + 56), "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  if ((unint64_t)[v17 count] >= 2)
  {
    v45 = +[NSString stringWithFormat:@"we can't match more than one contextMatches entry per line"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v46 = NSStringFromSelector(*(SEL *)(a1 + 104));
      v47 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v47);
      uint64_t v49 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138544642;
      *(void *)v82 = v46;
      *(_WORD *)&v82[8] = 2114;
      *(void *)v83 = v48;
      *(_WORD *)&v83[8] = 2048;
      *(void *)v84 = v49;
      *(_WORD *)&v84[8] = 2114;
      *(void *)&v84[10] = @"DASParsing.m";
      __int16 v85 = 1024;
      int v86 = 436;
      __int16 v87 = 2114;
      v88 = v45;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v45 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100003FA4);
  }
  uint64_t v18 = [v17 firstObject];
  long long v19 = v18;
  if (v18)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
    {
      v55 = +[NSString stringWithFormat:@"context matches must be preceeded by a display match :\n%@", *(void *)(*(void *)(a1 + 40) + 48)];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v56 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v57 = (objc_class *)objc_opt_class();
        v58 = NSStringFromClass(v57);
        uint64_t v59 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v82 = v56;
        *(_WORD *)&v82[8] = 2114;
        *(void *)v83 = v58;
        *(_WORD *)&v83[8] = 2048;
        *(void *)v84 = v59;
        *(_WORD *)&v84[8] = 2114;
        *(void *)&v84[10] = @"DASParsing.m";
        __int16 v85 = 1024;
        int v86 = 439;
        __int16 v87 = 2114;
        v88 = v55;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v55 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100004190);
    }
    id v20 = [v18 rangeWithName:@"contextID"];
    __int16 v22 = objc_msgSend(v3, "substringWithRange:", v20, v21);
    if (![v22 length])
    {
      v60 = +[NSString stringWithFormat:@"must have a valid contextID : %@ from '%@'", v22, v3];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v61 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v62 = (objc_class *)objc_opt_class();
        v63 = NSStringFromClass(v62);
        uint64_t v64 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v82 = v61;
        *(_WORD *)&v82[8] = 2114;
        *(void *)v83 = v63;
        *(_WORD *)&v83[8] = 2048;
        *(void *)v84 = v64;
        *(_WORD *)&v84[8] = 2114;
        *(void *)&v84[10] = @"DASParsing.m";
        __int16 v85 = 1024;
        int v86 = 442;
        __int16 v87 = 2114;
        v88 = v60;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v60 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100004284);
    }
    id v23 = v22;
    if (![v23 length])
    {
      v65 = +[NSString stringWithFormat:@"must have a valid hex string -> %@", v23];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v66 = +[NSString stringWithUTF8String:"NSNumber * _Nonnull uint32NumberFromHexString(NSString *__strong _Nonnull)"];
        *(_DWORD *)buf = 138544130;
        *(void *)v82 = v66;
        *(_WORD *)&v82[8] = 2114;
        *(void *)v83 = @"DASParsing.m";
        *(_WORD *)&v83[8] = 1024;
        *(_DWORD *)v84 = 340;
        *(_WORD *)&v84[4] = 2114;
        *(void *)&v84[6] = v65;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v65 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100004350);
    }
    __int16 v24 = [v23 lowercaseString];
    uint64_t v25 = 0;
    if ([v24 length])
    {
      unint64_t v26 = 0;
      do
      {
        id v27 = [v24 characterAtIndex:v26];
        if ((v27 - 48) >= 0xA)
        {
          if ((v27 - 97) >= 6)
          {
            v79 = +[NSString stringWithFormat:@"unknown character %c", v27];
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              v80 = +[NSString stringWithUTF8String:"NSNumber * _Nonnull uint32NumberFromHexString(NSString *__strong _Nonnull)"];
              *(_DWORD *)buf = 138544130;
              *(void *)v82 = v80;
              *(_WORD *)&v82[8] = 2114;
              *(void *)v83 = @"DASParsing.m";
              *(_WORD *)&v83[8] = 1024;
              *(_DWORD *)v84 = 351;
              *(_WORD *)&v84[4] = 2114;
              *(void *)&v84[6] = v79;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
            }
            [v79 UTF8String];
            _bs_set_crash_log_message();
            __break(0);
            JUMPOUT(0x1000046D4);
          }
          int v28 = -87;
        }
        else
        {
          int v28 = -48;
        }
        uint64_t v25 = (v28 + v27 + 16 * v25);
        ++v26;
      }
      while (v26 < (unint64_t)[v24 length]);
    }
    __int16 v29 = +[NSNumber numberWithUnsignedInt:v25];
    uint64_t v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%x", [v29 unsignedIntValue]);
    if (([v30 isEqualToString:v23] & 1) == 0)
    {
      v67 = +[NSString stringWithFormat:@"parsed is not equivalent to original : parsed=%@ original=%@", v30, v23];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v68 = +[NSString stringWithUTF8String:"NSNumber * _Nonnull uint32NumberFromHexString(NSString *__strong _Nonnull)"];
        *(_DWORD *)buf = 138544130;
        *(void *)v82 = v68;
        *(_WORD *)&v82[8] = 2114;
        *(void *)v83 = @"DASParsing.m";
        *(_WORD *)&v83[8] = 1024;
        *(_DWORD *)v84 = 356;
        *(_WORD *)&v84[4] = 2114;
        *(void *)&v84[6] = v67;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
      }
      [v67 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10000441CLL);
    }

    if (!v29)
    {
      v69 = +[NSString stringWithFormat:@"failed to parse contextID %@ from '%@'", v23, v3];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v70 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v71 = (objc_class *)objc_opt_class();
        v72 = NSStringFromClass(v71);
        uint64_t v73 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v82 = v70;
        *(_WORD *)&v82[8] = 2114;
        *(void *)v83 = v72;
        *(_WORD *)&v83[8] = 2048;
        *(void *)v84 = v73;
        *(_WORD *)&v84[8] = 2114;
        *(void *)&v84[10] = @"DASParsing.m";
        __int16 v85 = 1024;
        int v86 = 444;
        __int16 v87 = 2114;
        v88 = v69;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v69 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100004510);
    }
    id v31 = [v19 rangeWithName:@"pid"];
    __int16 v33 = objc_msgSend(v3, "substringWithRange:", v31, v32);
    id v34 = [v33 intValue];

    if ((int)v34 <= 0)
    {
      v74 = +[NSString stringWithFormat:@"must have a valid pid : %i from '%@'", v34, v3];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v75 = NSStringFromSelector(*(SEL *)(a1 + 104));
        v76 = (objc_class *)objc_opt_class();
        v77 = NSStringFromClass(v76);
        uint64_t v78 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138544642;
        *(void *)v82 = v75;
        *(_WORD *)&v82[8] = 2114;
        *(void *)v83 = v77;
        *(_WORD *)&v83[8] = 2048;
        *(void *)v84 = v78;
        *(_WORD *)&v84[8] = 2114;
        *(void *)&v84[10] = @"DASParsing.m";
        __int16 v85 = 1024;
        int v86 = 448;
        __int16 v87 = 2114;
        v88 = v74;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v74 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x100004604);
    }
    __int16 v35 = sub_100005E28();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v39 = [v29 unsignedIntValue];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v82 = v39;
      *(_WORD *)&v82[4] = 1024;
      *(_DWORD *)&v82[6] = v34;
      *(_WORD *)v83 = 2112;
      *(void *)&v83[2] = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "matched context %x for pid %i from '%@'", buf, 0x18u);
    }

    [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) addObject:v29];
    id v36 = -[DASContextInfo _initWithIdentifier:pid:raw:]([DASContextInfo alloc], "_initWithIdentifier:pid:raw:", [v29 unsignedIntValue], v34, v3);
    [*(id *)(a1 + 64) setObject:v36 forKey:v29];

LABEL_28:
    goto LABEL_30;
  }
  if (!v5 && [v3 length])
  {
    v37 = sub_100005E28();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v82 = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "failed to find any match in '%@'", buf, 0xCu);
    }

    v38 = *(void **)(a1 + 72);
    id v23 = +[NSString stringWithFormat:@"failed to find any match in '%@'", v3];
    [v38 addObject:v23];
    goto LABEL_28;
  }
LABEL_30:
}

void sub_1000047A8(int8x16_t *a1)
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004964;
  v13[3] = &unk_1000104B0;
  int8x16_t v7 = a1[2];
  int8x16_t v14 = vextq_s8(v7, v7, 8uLL);
  [(id)v7.i64[0] appendBodySectionWithName:@"displays" multilinePrefix:0 block:v13];
  v2 = +[NSMutableDictionary dictionary];
  id v3 = *(void **)(a1[2].i64[1] + 24);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004AE4;
  v11[3] = &unk_100010468;
  id v4 = v2;
  id v12 = v4;
  objc_msgSend(v3, "bs_each:", v11);
  id v5 = (void *)a1[2].i64[0];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004BB0;
  v8[3] = &unk_1000104B0;
  id v9 = v4;
  id v10 = v5;
  id v6 = v4;
  [v10 appendBodySectionWithName:@"contextsByPID" multilinePrefix:0 block:v8];
  [(id)a1[2].i64[0] appendArraySection:*(void *)(a1[2].i64[1] + 40) withName:@"parseErrors" skipIfEmpty:1];
}

void sub_100004964(uint64_t a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 16);
  id v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v15;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int8x16_t v7 = *(void **)(a1 + 40);
        id v8 = [v6 attachedContexts];
        id v9 = [v8 array];
        id v10 = objc_msgSend(v9, "bs_map:", &stru_1000104D0);
        unsigned int v11 = [v10 componentsJoinedByString:@", "];
        id v12 = [v6 name];
        [v7 appendString:v11 withName:v12];
      }
      id v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }
}

void sub_100004AE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 pid]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (v6)
  {
    int8x16_t v7 = v6;
    [v6 addObject:v5];
  }
  else
  {
    int8x16_t v7 = +[NSMutableSet setWithObject:v5];

    [*(id *)(a1 + 32) setObject:v7 forKey:v8];
  }
}

void sub_100004BB0(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [*(id *)(a1 + 32) allKeys];
  id v3 = objc_msgSend(v2, "sortedArrayUsingSelector:");

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v16 = *(void *)v18;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        int8x16_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        id v9 = [*(id *)(a1 + 32) objectForKey:v7];
        id v10 = [v9 allObjects];
        unsigned int v11 = [v10 sortedArrayUsingSelector:"compare:"];
        id v12 = objc_msgSend(v11, "bs_map:", &stru_1000104F0);
        id v13 = [v12 componentsJoinedByString:@", "];
        long long v14 = [v7 description];
        [v8 appendString:v13 withName:v14];
      }
      id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

NSString *__cdecl sub_100004D70(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:@"%x", [(NSNumber *)a2 unsignedIntValue]];
}

NSString *__cdecl sub_100004DB8(id a1, DASContextInfo *a2)
{
  return +[NSString stringWithFormat:@"%x", [(DASContextInfo *)a2 identifier]];
}

void sub_100005308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100005328(uint64_t a1)
{
  id v2 = sub_100005378();
  result = dlsym(v2, "CARenderServerGetClientPort");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000153E0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100005378()
{
  v4[0] = 0;
  if (!qword_1000153D0)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_10000551C;
    v4[4] = &unk_100010900;
    v4[5] = v4;
    long long v5 = off_100010560;
    uint64_t v6 = 0;
    qword_1000153D0 = _sl_dlopen();
  }
  v0 = (void *)qword_1000153D0;
  if (!qword_1000153D0)
  {
    v0 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"void *QuartzCoreLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASParsing.m", 24, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_1000054CC(uint64_t a1)
{
  id v2 = sub_100005378();
  id v3 = (uint64_t (*)())dlsym(v2, "CARenderClientGetArchivedLayerTree");
  off_100015290 = v3;
  return ((uint64_t (*)(uint64_t))v3)(a1);
}

uint64_t sub_10000551C()
{
  uint64_t result = _sl_dlopen();
  qword_1000153D0 = result;
  return result;
}

void sub_100005DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100005DD8(uint64_t a1)
{
  id v2 = sub_100005378();
  uint64_t result = dlsym(v2, "CARenderServerGetInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000153D8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_100005E28()
{
  if (qword_1000153F0 != -1) {
    dispatch_once(&qword_1000153F0, &stru_100010578);
  }
  v0 = (void *)qword_1000153E8;
  return v0;
}

void sub_100005E7C(id a1)
{
  qword_1000153E8 = (uint64_t)os_log_create("com.apple.BackBoard", "DisplayArchive");
  _objc_release_x1();
}

void sub_100005EE8(id a1)
{
  v2[0] = *(objc_property_attribute_t *)off_1000105D8;
  v2[1] = *(objc_property_attribute_t *)&off_1000105E8;
  v1 = (objc_class *)sub_100005F64();
  class_addProperty(v1, "UICALayerRenderID", v2, 2u);
}

id sub_100005F64()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100015408;
  uint64_t v7 = qword_100015408;
  if (!qword_100015408)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100006048;
    v3[3] = &unk_100010928;
    v3[4] = &v4;
    sub_100006048((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100006030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006048(uint64_t a1)
{
  sub_100006110();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CALayer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100015408 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getCALayerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 26, @"Unable to find class %s", "CALayer");

    __break(1u);
  }
}

void *sub_100006110()
{
  v4[0] = 0;
  if (!qword_100015400)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = (void *)3221225472;
    v4[3] = sub_100006264;
    v4[4] = &unk_100010900;
    v4[5] = v4;
    long long v5 = off_1000108E8;
    uint64_t v6 = 0;
    qword_100015400 = _sl_dlopen();
  }
  v0 = (void *)qword_100015400;
  if (!qword_100015400)
  {
    v0 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"void *QuartzCoreLibrary(void)"];
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 24, @"%s", v4[0]);

    __break(1u);
    goto LABEL_7;
  }
  id v1 = v4[0];
  if (v4[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100006264()
{
  uint64_t result = _sl_dlopen();
  qword_100015400 = result;
  return result;
}

void sub_10000651C(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 name];
  long long v5 = [v3 attachedContexts];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000662C;
  v8[3] = &unk_100010710;
  id v6 = a1[4];
  id v9 = a1[5];
  id v10 = v3;
  id v11 = a1[4];
  id v12 = a1[6];
  id v7 = v3;
  sub_100006F0C(v4, v5, v6, 0, v8);
}

void sub_10000662C(uint64_t a1, void *a2, void *a3)
{
  id v60 = a2;
  id v4 = a3;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v77 objects:v90 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v78;
    id v65 = v4;
    do
    {
      id v8 = 0;
      id v67 = v6;
      do
      {
        if (*(void *)v78 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v77 + 1) + 8 * (void)v8);
        id v10 = [v4 objectForKey:v9];
        if ((unint64_t)[v10 count] >= 2)
        {
          id v11 = [v10 count];
          id v12 = sub_100005E28();
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
          if (v11 == (id)2)
          {
            if (v13)
            {
              unsigned int v14 = [v9 unsignedIntValue];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v82 = v14;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "skipped context %x because it was already processed", buf, 8u);
            }

            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"skipped context %x because it was already processed", [v9 unsignedIntValue], v59);
          }
          else
          {
            if (v13)
            {
              unsigned int v15 = [v9 unsignedIntValue];
              uint64_t v16 = (char *)[v10 count];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v82 = v15;
              *(_WORD *)&v82[4] = 2048;
              *(void *)&v82[6] = v16 - 1;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "skipped context %x because it was already processed (%lux)", buf, 0x12u);
            }

            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"skipped context %x because it was already processed (%lux)", [v9 unsignedIntValue], (char *)objc_msgSend(v10, "count") - 1);
          long long v17 = };
          [*(id *)(a1 + 32) addObject:v17];
          long long v18 = sub_100005E28();
          BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

          if (v19)
          {
            long long v20 = [v10 objectAtIndex:0];
            uint64_t v21 = sub_100008E98(v20);
            sub_100008F90(v21, &stru_100010800);

            if ((unint64_t)[v10 count] >= 2)
            {
              unint64_t v22 = 1;
              do
              {
                id v23 = [v10 objectAtIndex:v22];
                __int16 v24 = sub_100008E98(v23);
                v76[0] = _NSConcreteStackBlock;
                v76[1] = 3221225472;
                v76[2] = sub_10000915C;
                v76[3] = &unk_100010660;
                v76[4] = v22;
                sub_100008F90(v24, v76);

                ++v22;
              }
              while (v22 < (unint64_t)[v10 count]);
            }
          }

          id v4 = v65;
          id v6 = v67;
        }

        id v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [v4 countByEnumeratingWithState:&v77 objects:v90 count:16];
    }
    while (v6);
  }
  uint64_t v25 = sub_100005E28();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);

  if (v26)
  {
    id v27 = sub_100005E28();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v57 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412290;
      *(void *)v82 = v57;
      _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "final layer tree for %@", buf, 0xCu);
    }
    sub_100009228(v60, &stru_100010820);
  }
  [sub_1000074E0() begin];
  int v28 = +[NSMutableDictionary dictionary];
  __int16 v29 = [*(id *)(a1 + 48) contexts];
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100009464;
  v73[3] = &unk_1000106A8;
  id v61 = v4;
  id v74 = v61;
  id v30 = v28;
  id v75 = v30;
  objc_msgSend(v29, "bs_each:", v73);

  +[NSMutableArray array];
  v68 = v66 = v30;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v31 = [v30 allKeys];
  uint64_t v32 = [v31 sortedArrayUsingSelector:"compare:"];

  id obj = v32;
  id v33 = [v32 countByEnumeratingWithState:&v69 objects:v89 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v70;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v70 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = *(void *)(*((void *)&v69 + 1) + 8 * i);
        v87[0] = @"pid";
        v87[1] = @"contextIDs";
        v88[0] = v37;
        v38 = objc_msgSend(v30, "objectForKey:");
        unsigned int v39 = [v38 allObjects];
        v40 = [v39 sortedArrayUsingSelector:"compare:"];
        v41 = objc_msgSend(v40, "bs_map:", &stru_100010840);
        v88[1] = v41;
        v42 = +[NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:2];
        [v68 addObject:v42];
      }
      id v34 = [obj countByEnumeratingWithState:&v69 objects:v89 count:16];
    }
    while (v34);
  }

  v85[0] = @"Display";
  v83[0] = @"name";
  obja = [*(id *)(a1 + 40) name];
  v83[1] = @"attachedContexts";
  v84[0] = obja;
  v43 = [*(id *)(a1 + 40) attachedContexts];
  uint64_t v44 = [v43 array];
  v45 = objc_msgSend(v44, "bs_map:", &stru_100010880);
  v46 = [v45 sortedArrayUsingSelector:"compare:"];
  v47 = objc_msgSend(v46, "bs_map:", &stru_1000108A0);
  v84[1] = v47;
  v48 = +[NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:2];
  v86[0] = v48;
  v85[1] = @"ContextIDsByPID";
  id v49 = [v68 copy];
  v86[1] = v49;
  v85[2] = @"ParseErrors";
  id v50 = [*(id *)(a1 + 32) copy];
  v86[2] = v50;
  v51 = +[NSDictionary dictionaryWithObjects:v86 forKeys:v85 count:3];

  off_100015360(1);
  off_100015368(1);
  v52 = (void *)off_100015358(v60, (uint64_t)v51);
  v53 = sub_100005E28();
  uint64_t v54 = v53;
  if (v52)
  {
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      v56 = [*(id *)(a1 + 40) name];
      *(_DWORD *)buf = 138412546;
      *(void *)v82 = v56;
      *(_WORD *)&v82[8] = 2112;
      *(void *)&unsigned char v82[10] = v51;
      _os_log_debug_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "archived display '%@' with info:\n%@", buf, 0x16u);
    }
    v55 = *(void **)(a1 + 56);
    uint64_t v54 = [*(id *)(a1 + 40) name];
    [v55 setObject:v52 forKey:v54];
  }
  else if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    v58 = [*(id *)(a1 + 40) name];
    *(_DWORD *)buf = 138412290;
    *(void *)v82 = v58;
    _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "failed to create archive of display '%@'", buf, 0xCu);
  }
  [sub_1000074E0() commit];
}

void sub_100006F0C(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v38 = a1;
  id v9 = a2;
  id v39 = a3;
  id v40 = a4;
  uint64_t v37 = a5;
  if (!v9)
  {
    id v33 = +[NSAssertionHandler currentHandler];
    id v34 = +[NSString stringWithUTF8String:"void processRootContexts(NSString *__strong, NSOrderedSet<DASContextInfo *> *__strong, __strong id<DASContextArchiveProvider>, __strong DASContextLayerProcessor, void (^__strong)(CALayer *__strong, NSMapTable<NSNumber *,NSMutableArray<CALayer *> *> *__strong))"];
    [v33 handleFailureInFunction:v34, @"DASProcessor.m", 206, @"Invalid parameter not satisfying: %@", @"rootContexts" file lineNumber description];
  }
  [sub_1000074E0() begin];
  id v10 = [sub_100005F64() layer];
  *(void *)buf = 0;
  *(void *)&long long v58 = buf;
  *((void *)&v58 + 1) = 0x2050000000;
  id v11 = (void *)qword_100015420;
  uint64_t v59 = qword_100015420;
  if (!qword_100015420)
  {
    v46 = _NSConcreteStackBlock;
    uint64_t v47 = 3221225472;
    uint64_t v48 = (uint64_t)sub_1000075C4;
    id v49 = (id (*)(uint64_t, uint64_t))&unk_100010928;
    id v50 = buf;
    sub_1000075C4((uint64_t)&v46);
    id v11 = *(void **)(v58 + 24);
  }
  id v12 = v11;
  _Block_object_dispose(buf, 8);
  id v36 = [v12 localContext];
  [v36 setLayer:v10];
  BOOL v13 = +[NSMapTable strongToStrongObjectsMapTable];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v9;
  id v14 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  if (v14)
  {
    uint64_t v17 = *(void *)v53;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v53 != v17) {
          objc_enumerationMutation(obj);
        }
        BOOL v19 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        long long v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v19 identifier]);
        uint64_t v21 = [v13 objectForKey:v20];

        if (v21)
        {
          [v21 addObject:v10];
        }
        else
        {
          uint64_t v21 = +[NSMutableArray arrayWithObject:v10];
          unint64_t v22 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v19 identifier]);
          [v13 setObject:v21 forKey:v22];

          v46 = 0;
          uint64_t v47 = (uint64_t)&v46;
          uint64_t v48 = 0x3032000000;
          id v49 = sub_10000768C;
          id v50 = (uint8_t *)sub_1000076B8;
          id v51 = 0;
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_1000076C0;
          v42[3] = &unk_100010950;
          id v43 = v13;
          id v23 = v40;
          id v44 = v23;
          v45 = &v46;
          __int16 v24 = objc_retainBlock(v42);
          uint64_t v25 = objc_retainBlock(v24);
          BOOL v26 = *(void **)(v47 + 40);
          *(void *)(v47 + 40) = v25;

          id v27 = sub_1000082B0(v19, v39, v23, *(void **)(v47 + 40));
          int v28 = *(void **)(v47 + 40);
          *(void *)(v47 + 40) = 0;

          if (v27)
          {
            [v10 addSublayer:v27];
            [v27 frame];
            if (width < v29) {
              double width = v29;
            }
            if (height < v30) {
              double height = v30;
            }
          }
          else
          {
            id v31 = sub_100005E28();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              unsigned int v32 = [v19 identifier];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v32;
              LOWORD(v58) = 2112;
              *(void *)((char *)&v58 + 2) = v38;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "no root layer found in context %x while processing for %@", buf, 0x12u);
            }
          }
          _Block_object_dispose(&v46, 8);
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    }
    while (v14);
  }

  objc_msgSend(v10, "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, width, height);
  if (v37) {
    v37[2](v37, v10, v13);
  }

  [sub_1000074E0() commit];
}

void sub_1000074AC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id sub_1000074E0()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100015418;
  uint64_t v7 = qword_100015418;
  if (!qword_100015418)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100008DD0;
    v3[3] = &unk_100010928;
    v3[4] = &v4;
    sub_100008DD0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000075AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000075C4(uint64_t a1)
{
  sub_100006110();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CAContext");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100015420 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getCAContextClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 25, @"Unable to find class %s", "CAContext");

    __break(1u);
  }
}

id sub_10000768C(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000076B8(uint64_t a1)
{
}

void sub_1000076C0(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  __int16 v87 = v4;
  v84 = v5;
  if (v4)
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v77 = +[NSAssertionHandler currentHandler];
    long long v78 = +[NSString stringWithUTF8String:"void processRootContexts(NSString *__strong, NSOrderedSet<DASContextInfo *> *__strong, __strong id<DASContextArchiveProvider>, __strong DASContextLayerProcessor, void (^__strong)(CALayer *__strong, NSMapTable<NSNumber *,NSMutableArray<CALayer *> *> *__strong))_block_invoke"];
    [v77 handleFailureInFunction:v78, @"DASProcessor.m", 228, @"Invalid parameter not satisfying: %@", @"layer" file lineNumber description];

    if (v84) {
      goto LABEL_3;
    }
  }
  long long v79 = +[NSAssertionHandler currentHandler];
  long long v80 = +[NSString stringWithUTF8String:"void processRootContexts(NSString *__strong, NSOrderedSet<DASContextInfo *> *__strong, __strong id<DASContextArchiveProvider>, __strong DASContextLayerProcessor, void (^__strong)(CALayer *__strong, NSMapTable<NSNumber *,NSMutableArray<CALayer *> *> *__strong))_block_invoke"];
  [v79 handleFailureInFunction:v80, @"DASProcessor.m", 229, @"Invalid parameter not satisfying: %@", @"contextArchiveProvider" file lineNumber description];

LABEL_3:
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2050000000;
  uint64_t v6 = (void *)qword_100015428;
  uint64_t v111 = qword_100015428;
  if (!qword_100015428)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v118 = 3221225472;
    v119 = sub_100008948;
    v120 = &unk_100010928;
    v121 = &v108;
    sub_100008948((uint64_t)buf);
    uint64_t v6 = (void *)v109[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v108, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v4 contextId];
    id v9 = *(void **)(a1 + 32);
    id v10 = +[NSNumber numberWithUnsignedInt:v8];
    id obj = [v9 objectForKey:v10];

    if (obj)
    {
      [obj addObject:v4];
    }
    else
    {
      id obj = +[NSMutableArray arrayWithObject:v4];
      v57 = *(void **)(a1 + 32);
      long long v58 = +[NSNumber numberWithUnsignedInt:v8];
      [v57 setObject:obj forKey:v58];

      uint64_t v59 = objc_msgSend(v84, "contextWithIdentifier:", objc_msgSend(v4, "contextId"));
      id v60 = v59;
      if (v59)
      {
        id v61 = sub_1000082B0(v59, v84, *(void **)(a1 + 40), *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
        if (v61)
        {
          [v4 addSublayer:v61];
        }
        else
        {
          v76 = sub_100005E28();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_ERROR, "no hosted layers found for %x", buf, 8u);
          }

          id v61 = 0;
        }
      }
      else
      {
        id v61 = sub_100005E28();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "server didn't know about hosted layers for %x", buf, 8u);
        }
      }
    }
    goto LABEL_88;
  }
  uint64_t v108 = 0;
  v109 = &v108;
  uint64_t v110 = 0x2050000000;
  id v11 = (void *)qword_100015440;
  uint64_t v111 = qword_100015440;
  if (!qword_100015440)
  {
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v118 = 3221225472;
    v119 = sub_100008A10;
    v120 = &unk_100010928;
    v121 = &v108;
    sub_100008A10((uint64_t)buf);
    id v11 = (void *)v109[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v108, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v13 = [v4 sourceLayer];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      id v62 = [v87 sourceContextId];
      id v63 = [v87 sourceLayerRenderId];
      if (v62)
      {
        uint64_t v64 = v63;
        if (v63)
        {
          id v65 = [v87 context];
          BOOL v66 = v62 == [v65 contextId];

          if (!v66)
          {
            id v67 = [v84 contextWithIdentifier:v62];
            if (v67)
            {
              v68 = *(void **)(a1 + 32);
              long long v69 = +[NSNumber numberWithUnsignedInt:v62];
              long long v70 = [v68 objectForKey:v69];

              long long v106 = 0u;
              long long v107 = 0u;
              long long v104 = 0u;
              long long v105 = 0u;
              id v71 = v70;
              id v72 = [v71 countByEnumeratingWithState:&v104 objects:v116 count:16];
              uint64_t v73 = v71;
              if (v72)
              {
                uint64_t v74 = *(void *)v105;
                while (2)
                {
                  for (i = 0; i != v72; i = (char *)i + 1)
                  {
                    if (*(void *)v105 != v74) {
                      objc_enumerationMutation(v71);
                    }
                    uint64_t v73 = sub_100008AD8(*(void **)(*((void *)&v104 + 1) + 8 * i), v64);
                    if (v73)
                    {

                      [v87 setSourceLayer:v73];
                      goto LABEL_90;
                    }
                  }
                  id v72 = [v71 countByEnumeratingWithState:&v104 objects:v116 count:16];
                  if (v72) {
                    continue;
                  }
                  break;
                }
                uint64_t v73 = v71;
              }
LABEL_90:
            }
          }
        }
      }
    }
  }
  [v87 animationKeys];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v86 = [obj countByEnumeratingWithState:&v100 objects:v115 count:16];
  if (v86)
  {
    uint64_t v85 = *(void *)v101;
    do
    {
      for (j = 0; j != v86; j = (char *)j + 1)
      {
        if (*(void *)v101 != v85) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v100 + 1) + 8 * (void)j);
        uint64_t v17 = [v87 animationForKey:v16];
        uint64_t v108 = 0;
        v109 = &v108;
        uint64_t v110 = 0x2050000000;
        long long v18 = (void *)qword_100015448;
        uint64_t v111 = qword_100015448;
        if (!qword_100015448)
        {
          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v118 = 3221225472;
          v119 = sub_100008C40;
          v120 = &unk_100010928;
          v121 = &v108;
          sub_100008C40((uint64_t)buf);
          long long v18 = (void *)v109[3];
        }
        id v19 = v18;
        _Block_object_dispose(&v108, 8);
        if (objc_opt_isKindOfClass())
        {
          id v20 = v17;
          uint64_t v21 = [v20 sourceLayer];
          BOOL v22 = v21 == 0;

          if (!v22) {
            goto LABEL_54;
          }
          id v23 = [v20 sourceContextId];
          id v24 = [v20 sourceLayerRenderId];
          if (!v23) {
            goto LABEL_54;
          }
          uint64_t v25 = v24;
          if (!v24) {
            goto LABEL_54;
          }
          BOOL v26 = [v87 context];
          BOOL v27 = v23 == [v26 contextId];

          if (v27) {
            goto LABEL_54;
          }
          uint64_t v81 = [v84 contextWithIdentifier:v23];
          int v28 = (void *)v81;
          if (!v81) {
            goto LABEL_53;
          }
          double v29 = *(void **)(a1 + 32);
          double v30 = +[NSNumber numberWithUnsignedInt:v23];
          id v31 = [v29 objectForKey:v30];

          long long v98 = 0u;
          long long v99 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          id v32 = v31;
          id v33 = [v32 countByEnumeratingWithState:&v96 objects:v114 count:16];
          if (v33)
          {
            uint64_t v34 = *(void *)v97;
LABEL_27:
            uint64_t v35 = 0;
            while (1)
            {
              if (*(void *)v97 != v34) {
                objc_enumerationMutation(v32);
              }
              id v36 = sub_100008AD8(*(void **)(*((void *)&v96 + 1) + 8 * v35), v25);
              if (v36) {
                goto LABEL_51;
              }
              if (v33 == (id)++v35)
              {
                id v33 = [v32 countByEnumeratingWithState:&v96 objects:v114 count:16];
                if (v33) {
                  goto LABEL_27;
                }
                goto LABEL_50;
              }
            }
          }
          goto LABEL_50;
        }
        uint64_t v108 = 0;
        v109 = &v108;
        uint64_t v110 = 0x2050000000;
        uint64_t v37 = (void *)qword_100015450;
        uint64_t v111 = qword_100015450;
        if (!qword_100015450)
        {
          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v118 = 3221225472;
          v119 = sub_100008D08;
          v120 = &unk_100010928;
          v121 = &v108;
          sub_100008D08((uint64_t)buf);
          uint64_t v37 = (void *)v109[3];
        }
        id v38 = v37;
        _Block_object_dispose(&v108, 8);
        if (objc_opt_isKindOfClass())
        {
          id v20 = v17;
          id v39 = [v20 sourceLayer];
          BOOL v40 = v39 == 0;

          if (!v40) {
            goto LABEL_54;
          }
          id v41 = [v20 sourceContextId];
          id v42 = [v20 sourceLayerRenderId];
          if (!v41) {
            goto LABEL_54;
          }
          id v43 = v42;
          if (!v42) {
            goto LABEL_54;
          }
          id v44 = [v87 context];
          BOOL v45 = v41 == [v44 contextId];

          if (v45) {
            goto LABEL_54;
          }
          uint64_t v81 = [v84 contextWithIdentifier:v41];
          int v28 = (void *)v81;
          if (!v81) {
            goto LABEL_53;
          }
          v46 = *(void **)(a1 + 32);
          uint64_t v47 = +[NSNumber numberWithUnsignedInt:v41];
          uint64_t v48 = [v46 objectForKey:v47];

          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          id v32 = v48;
          id v49 = [v32 countByEnumeratingWithState:&v92 objects:v113 count:16];
          if (v49)
          {
            uint64_t v50 = *(void *)v93;
LABEL_44:
            uint64_t v51 = 0;
            while (1)
            {
              if (*(void *)v93 != v50) {
                objc_enumerationMutation(v32);
              }
              id v36 = sub_100008AD8(*(void **)(*((void *)&v92 + 1) + 8 * v51), v43);
              if (v36) {
                break;
              }
              if (v49 == (id)++v51)
              {
                id v49 = [v32 countByEnumeratingWithState:&v92 objects:v113 count:16];
                if (v49) {
                  goto LABEL_44;
                }
                goto LABEL_50;
              }
            }
LABEL_51:

            id v52 = [v20 copy];
            [v52 setSourceLayer:v36];
            [v87 addAnimation:v52 forKey:v16];
LABEL_52:

            id v20 = v52;
            int v28 = (void *)v81;
LABEL_53:

LABEL_54:
            goto LABEL_55;
          }
LABEL_50:
          id v36 = v32;
          id v52 = v20;
          goto LABEL_52;
        }
LABEL_55:
      }
      id v86 = [obj countByEnumeratingWithState:&v100 objects:v115 count:16];
    }
    while (v86);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v53 = [v87 sublayers];
    long long v54 = (char *)[v53 countByEnumeratingWithState:&v88 objects:v112 count:16];
    if (v54)
    {
      uint64_t v55 = *(void *)v89;
      do
      {
        for (k = 0; k != v54; ++k)
        {
          if (*(void *)v89 != v55) {
            objc_enumerationMutation(v53);
          }
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
        }
        long long v54 = (char *)[v53 countByEnumeratingWithState:&v88 objects:v112 count:16];
      }
      while (v54);
    }
  }
LABEL_88:
}

void sub_100008284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

id sub_1000082B0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    int v28 = +[NSAssertionHandler currentHandler];
    double v29 = +[NSString stringWithUTF8String:"CALayer *layersForContextUsingArchiveProvider(DASContextInfo *__strong, __strong id<DASContextArchiveProvider>, __strong DASContextLayerProcessor, __strong DASLayerWalker)"];
    [v28 handleFailureInFunction:v29, @"DASProcessor.m", 163, @"Invalid parameter not satisfying: %@", @"contextInfo" file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  double v30 = +[NSAssertionHandler currentHandler];
  id v31 = +[NSString stringWithUTF8String:"CALayer *layersForContextUsingArchiveProvider(DASContextInfo *__strong, __strong id<DASContextArchiveProvider>, __strong DASContextLayerProcessor, __strong DASLayerWalker)"];
  [v30 handleFailureInFunction:v31, @"DASProcessor.m", 164, @"Invalid parameter not satisfying: %@", @"contextArchiveProvider" file lineNumber description];

LABEL_3:
  id v11 = [v8 archiveOfContext:v7];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
    id v36 = v7;
    if (!v7)
    {
      id v32 = +[NSAssertionHandler currentHandler];
      id v33 = +[NSString stringWithUTF8String:"CALayer *layersFromArchiveOfContextInfo(NSData *__strong, DASContextInfo *__strong)"];
      [v32 handleFailureInFunction:v33, @"DASProcessor.m", 150, @"Invalid parameter not satisfying: %@", @"contextInfo" file lineNumber description];
    }
    id v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2050000000;
    id v14 = (id)qword_100015430;
    uint64_t v41 = qword_100015430;
    if (!qword_100015430)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&long long v43 = 3221225472;
      *((void *)&v43 + 1) = sub_100008830;
      id v44 = &unk_100010928;
      BOOL v45 = &v38;
      sub_100008830((uint64_t)buf);
      id v14 = v39[3];
    }
    id v15 = v14;
    _Block_object_dispose(&v38, 8);
    id v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v16 = (void **)qword_100015438;
    uint64_t v41 = qword_100015438;
    if (!qword_100015438)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&long long v43 = 3221225472;
      *((void *)&v43 + 1) = sub_1000088F8;
      id v44 = &unk_100010928;
      BOOL v45 = &v38;
      uint64_t v17 = sub_100006110();
      long long v18 = dlsym(v17, "kCAPackageTypeArchive");
      *((void *)v45[1] + 3) = v18;
      qword_100015438 = *((void *)v45[1] + 3);
      uint64_t v16 = (void **)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v16)
    {
      uint64_t v34 = +[NSAssertionHandler currentHandler];
      uint64_t v35 = +[NSString stringWithUTF8String:"CAPackageType getkCAPackageTypeArchive(void)"];
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"DASProcessor.m", 34, @"%s", dlerror());

      __break(1u);
    }
    id v19 = *v16;
    id v38 = 0;
    id v20 = v19;
    uint64_t v21 = [v15 packageWithData:v13 type:v20 options:0 error:&v38];
    id v22 = v38;

    if (v22)
    {
      id v23 = sub_100005E28();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        unsigned int v27 = [v36 identifier];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v27;
        LOWORD(v43) = 2112;
        *(void *)((char *)&v43 + 2) = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "failed to create package from context %x with error=%@", buf, 0x12u);
      }
    }
    id v24 = [v21 rootLayer];

    if (v24)
    {
      if (v9) {
        v9[2](v9, v36, v24);
      }
      if (v10) {
        v10[2](v10, v24, v8);
      }
    }
  }
  else
  {
    uint64_t v25 = sub_100005E28();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v7 identifier];
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "could not retrieve archive of context %x", buf, 8u);
    }

    id v24 = 0;
  }

  return v24;
}

void sub_10000880C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008830(uint64_t a1)
{
  sub_100006110();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CAPackage");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100015430 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getCAPackageClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 30, @"Unable to find class %s", "CAPackage");

    __break(1u);
  }
}

void *sub_1000088F8(uint64_t a1)
{
  id v2 = sub_100006110();
  id result = dlsym(v2, "kCAPackageTypeArchive");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100015438 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100008948(uint64_t a1)
{
  sub_100006110();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CALayerHost");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100015428 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getCALayerHostClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 27, @"Unable to find class %s", "CALayerHost");

    __break(1u);
  }
}

void sub_100008A10(uint64_t a1)
{
  sub_100006110();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CAPortalLayer");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100015440 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getCAPortalLayerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 31, @"Unable to find class %s", "CAPortalLayer");

    __break(1u);
  }
}

id sub_100008AD8(void *a1, id a2)
{
  id v3 = a1;
  id v4 = [v3 valueForKey:@"UICALayerRenderID"];
  id v5 = [v4 unsignedLongValue];

  if (v5 == a2)
  {
    id v6 = v3;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = objc_msgSend(v3, "sublayers", 0);
    id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = sub_100008AD8(*(void *)(*((void *)&v14 + 1) + 8 * i), a2);
          if (v12)
          {
            id v6 = (id)v12;
            goto LABEL_13;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v6 = 0;
LABEL_13:
  }
  return v6;
}

void sub_100008C40(uint64_t a1)
{
  sub_100006110();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CAMatchMoveAnimation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100015448 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getCAMatchMoveAnimationClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 28, @"Unable to find class %s", "CAMatchMoveAnimation");

    __break(1u);
  }
}

void sub_100008D08(uint64_t a1)
{
  sub_100006110();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CAMatchPropertyAnimation");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100015450 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getCAMatchPropertyAnimationClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 29, @"Unable to find class %s", "CAMatchPropertyAnimation");

    __break(1u);
  }
}

void sub_100008DD0(uint64_t a1)
{
  sub_100006110();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CATransaction");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100015418 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"Class getCATransactionClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 32, @"Unable to find class %s", "CATransaction");

    __break(1u);
  }
}

id sub_100008E98(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    id v6 = +[NSString stringWithUTF8String:"NSMutableArray<CALayer *> *ancestoryOfLayer(CALayer *__strong, BOOL)"];
    [v5 handleFailureInFunction:v6, @"DASProcessor.m", 135, @"Invalid parameter not satisfying: %@", @"layer" file lineNumber description];
  }
  id v2 = +[NSMutableArray array];
  if (v1)
  {
    do
    {
      [v2 insertObject:v1 atIndex:0];
      uint64_t v3 = [v1 superlayer];

      id v1 = (id)v3;
    }
    while (v3);
  }
  return v2;
}

void sub_100008F90(void *a1, void *a2)
{
  id v13 = a1;
  uint64_t v3 = a2;
  id v4 = v13;
  if (v13)
  {
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    id v9 = +[NSAssertionHandler currentHandler];
    uint64_t v10 = +[NSString stringWithUTF8String:"void layerPathDescription(NSArray<CALayer *> *__strong, __strong DASLoggerBlock)"];
    [v9 handleFailureInFunction:v10, @"DASProcessor.m", 118, @"Invalid parameter not satisfying: %@", @"path" file lineNumber description];

    id v4 = 0;
    if (v3) {
      goto LABEL_3;
    }
  }
  id v11 = +[NSAssertionHandler currentHandler];
  uint64_t v12 = +[NSString stringWithUTF8String:"void layerPathDescription(NSArray<CALayer *> *__strong, __strong DASLoggerBlock)"];
  [v11 handleFailureInFunction:v12, @"DASProcessor.m", 119, @"Invalid parameter not satisfying: %@", @"logger" file lineNumber description];

  id v4 = v13;
LABEL_3:
  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      id v7 = +[NSMutableString string];
      id v8 = [v13 objectAtIndex:v5];
      sub_1000098C8(v8, v7, v5);

      v3[2](v3, v7);
      ++v5;
    }
    while ((unint64_t)[v13 count] > v5);
  }
}

void sub_10000915C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005E28();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "skp%lu: %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100009228(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (!v3)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    id v13 = +[NSString stringWithUTF8String:"void recursiveLayerDescription(CALayer *__strong, __strong DASLoggerBlock)"];
    [v12 handleFailureInFunction:v13, @"DASProcessor.m", 95, @"Invalid parameter not satisfying: %@", @"layer" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    long long v14 = +[NSAssertionHandler currentHandler];
    long long v15 = +[NSString stringWithUTF8String:"void recursiveLayerDescription(CALayer *__strong, __strong DASLoggerBlock)"];
    [v14 handleFailureInFunction:v15, @"DASProcessor.m", 96, @"Invalid parameter not satisfying: %@", @"logger" file lineNumber description];

    goto LABEL_3;
  }
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10000768C;
  id v23 = sub_1000076B8;
  id v24 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100009754;
  v16[3] = &unk_100010978;
  id v7 = v5;
  id v17 = v7;
  long long v18 = &v19;
  __int16 v8 = objc_retainBlock(v16);
  id v9 = objc_retainBlock(v8);
  uint64_t v10 = (void *)v20[5];
  v20[5] = (uint64_t)v9;

  ((void (*)(void *, id, void))v8[2])(v8, v3, 0);
  id v11 = (void *)v20[5];
  v20[5] = 0;

  _Block_object_dispose(&v19, 8);
}

void sub_10000944C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009464(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v8 identifier]);
  id v4 = [*(id *)(a1 + 32) objectForKey:v3];

  if (v4)
  {
    uint64_t v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 pid]);
    int v6 = [*(id *)(a1 + 40) objectForKey:v5];
    if (v6)
    {
      id v7 = v6;
      [v6 addObject:v3];
    }
    else
    {
      id v7 = +[NSMutableSet setWithObject:v3];
      [*(id *)(a1 + 40) setObject:v7 forKey:v5];
    }
  }
}

uint64_t sub_100009564(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = sub_100006110();
  off_100015358 = (uint64_t (*)())dlsym(v4, "CAEncodeLayerTreeWithInfo");
  uint64_t v5 = ((uint64_t (*)(id, uint64_t))off_100015358)(v3, a2);

  return v5;
}

unsigned char *sub_1000095C0(char a1)
{
  id v2 = sub_100006110();
  id result = dlsym(v2, "CALayerEncodeAllAnimations");
  qword_100015460 = (uint64_t)result;
  off_100015368 = (uint64_t (*)())sub_100009610;
  unsigned char *result = a1;
  return result;
}

uint64_t sub_100009610(uint64_t result)
{
  *(unsigned char *)qword_100015460 = result;
  return result;
}

unsigned char *sub_100009620(char a1)
{
  id v2 = sub_100006110();
  id result = dlsym(v2, "CAEncodeBackingStores");
  qword_100015458 = (uint64_t)result;
  off_100015360 = (uint64_t (*)())sub_100009670;
  unsigned char *result = a1;
  return result;
}

uint64_t sub_100009670(uint64_t result)
{
  *(unsigned char *)qword_100015458 = result;
  return result;
}

NSString *__cdecl sub_100009680(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:@"%x", [(NSNumber *)a2 unsignedIntValue]];
}

NSNumber *__cdecl sub_1000096C8(id a1, DASContextInfo *a2)
{
  uint64_t v2 = [(DASContextInfo *)a2 identifier];
  return +[NSNumber numberWithUnsignedInt:v2];
}

NSString *__cdecl sub_10000970C(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:@"%x", [(NSNumber *)a2 unsignedIntValue]];
}

void sub_100009754(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v7 = +[NSMutableString string];
  sub_1000098C8(v5, v7, a3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = objc_msgSend(v5, "sublayers", 0);
  id v9 = (char *)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
      }
      uint64_t v10 = (char *)[v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

void sub_1000098C8(void *a1, void *a2, int a3)
{
  id v14 = a1;
  id v5 = a2;
  if (v14)
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = +[NSAssertionHandler currentHandler];
    uint64_t v11 = +[NSString stringWithUTF8String:"void appendLevelDescription(CALayer *__strong, NSMutableString *__strong, int)"];
    [v10 handleFailureInFunction:v11, @"DASProcessor.m", 79, @"Invalid parameter not satisfying: %@", @"layer" file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = +[NSAssertionHandler currentHandler];
  long long v13 = +[NSString stringWithUTF8String:"void appendLevelDescription(CALayer *__strong, NSMutableString *__strong, int)"];
  [v12 handleFailureInFunction:v13, @"DASProcessor.m", 80, @"Invalid parameter not satisfying: %@", @"info" file lineNumber description];

LABEL_3:
  if ([v5 length]) {
    [v5 appendString:@"\n"];
  }
  if (a3)
  {
    unint64_t v6 = 1;
    do
    {
      [v5 appendString:@"\t| "];
      ++v6;
    }
    while (v6 <= a3);
  }
  uint64_t v7 = [v14 debugDescription];
  id v8 = (void *)v7;
  if (v7) {
    CFStringRef v9 = (const __CFString *)v7;
  }
  else {
    CFStringRef v9 = @"-desc was nil!-";
  }
  [v5 appendString:v9];
}

void sub_100009A74(id a1, NSString *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100005E28();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "final: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100009B24(id a1, NSString *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_100005E28();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "prsd: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100009D98(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a2 pid]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void sub_100009E04(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)RBSAssertion);
  id v5 = +[NSString stringWithFormat:@"DumpDisplay: naming %@", v3];
  unint64_t v6 = +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", [v3 unsignedIntValue]);
  uint64_t v7 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.displayarchive" name:@"RenderClientProcessing"];
  long long v15 = v7;
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = [v4 initWithExplanation:v5 target:v6 attributes:v8];

  id v12 = 0;
  [v9 acquireWithError:&v12];
  id v10 = v12;
  if (v10)
  {
    uint64_t v11 = sub_100005E28();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "error acquiring assertion to name pid %@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 32) addObject:v9];
}

void sub_100009FC4(id a1, RBSAssertion *a2)
{
}

void sub_100009FCC(id a1, NSNumber *a2)
{
  id v2 = +[NSString stringWithFormat:@"NameLayerTree-%i", [(NSNumber *)a2 unsignedIntValue]];
  notify_post((const char *)[v2 UTF8String]);
}

id sub_10000A6E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_10000A6F0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_10000A6FC(uint64_t a1, void *a2, void *a3)
{
  id v57 = a2;
  id v4 = a3;
  id v60 = +[NSMutableArray array];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v74 objects:v87 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v75;
    uint64_t v62 = *(void *)v75;
    id v64 = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v75 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v74 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKey:v10];
        if ((unint64_t)[v11 count] >= 2)
        {
          id v12 = [v11 count];
          long long v13 = sub_100005E28();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          if (v12 == (id)2)
          {
            if (v14)
            {
              unsigned int v15 = [v10 unsignedIntValue];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)long long v79 = v15;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "skipped context %x because it was already processed", buf, 8u);
            }

            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"skipped context %x because it was already processed", [v10 unsignedIntValue], v56);
          }
          else
          {
            if (v14)
            {
              unsigned int v16 = [v10 unsignedIntValue];
              id v17 = (char *)[v11 count];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)long long v79 = v16;
              *(_WORD *)&v79[4] = 2048;
              *(void *)&v79[6] = v17 - 1;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "skipped context %x because it was already processed (%lux)", buf, 0x12u);
            }

            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"skipped context %x because it was already processed (%lux)", [v10 unsignedIntValue], (char *)objc_msgSend(v11, "count") - 1);
          long long v18 = };
          [v60 addObject:v18];
          uint64_t v19 = sub_100005E28();
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

          if (v20)
          {
            uint64_t v21 = [v11 objectAtIndex:0];
            id v22 = sub_100008E98(v21);
            sub_100008F90(v22, &stru_100010640);

            if ((unint64_t)[v11 count] >= 2)
            {
              unint64_t v23 = 1;
              do
              {
                id v24 = [v11 objectAtIndex:v23];
                uint64_t v25 = sub_100008E98(v24);
                v73[0] = _NSConcreteStackBlock;
                v73[1] = 3221225472;
                v73[2] = sub_10000AF80;
                v73[3] = &unk_100010660;
                void v73[4] = v23;
                sub_100008F90(v25, v73);

                ++v23;
              }
              while (v23 < (unint64_t)[v11 count]);
            }
          }

          uint64_t v8 = v62;
          id v5 = v64;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v74 objects:v87 count:16];
    }
    while (v7);
  }

  BOOL v26 = sub_100005E28();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG);

  if (v27)
  {
    int v28 = sub_100005E28();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v54 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)long long v79 = v54;
      _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "final layer tree for %@", buf, 0xCu);
    }

    sub_100009228(v57, &stru_100010680);
  }
  [sub_1000074E0() begin];
  double v29 = +[NSMutableDictionary dictionary];
  double v30 = [*(id *)(a1 + 40) contexts];
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_10000B04C;
  v70[3] = &unk_1000106A8;
  id v59 = v5;
  id v71 = v59;
  id v31 = v29;
  id v72 = v31;
  objc_msgSend(v30, "bs_each:", v70);

  +[NSMutableArray array];
  id v65 = v63 = v31;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v32 = [v31 allKeys];
  id v33 = [v32 sortedArrayUsingSelector:"compare:"];

  id obj = v33;
  id v34 = [v33 countByEnumeratingWithState:&v66 objects:v86 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v67;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v67 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = *(void *)(*((void *)&v66 + 1) + 8 * (void)j);
        v84[0] = @"pid";
        v84[1] = @"contextIDs";
        v85[0] = v38;
        id v39 = objc_msgSend(v31, "objectForKey:");
        uint64_t v40 = [v39 allObjects];
        uint64_t v41 = [v40 sortedArrayUsingSelector:"compare:"];
        id v42 = objc_msgSend(v41, "bs_map:", &stru_1000106E8);
        v85[1] = v42;
        long long v43 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
        [v65 addObject:v43];
      }
      id v35 = [obj countByEnumeratingWithState:&v66 objects:v86 count:16];
    }
    while (v35);
  }

  v82[0] = @"Root";
  v80[0] = @"pid";
  id v44 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 32) pid]);
  v80[1] = @"contextID";
  v81[0] = v44;
  BOOL v45 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) identifier]);
  v81[1] = v45;
  v46 = +[NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
  v83[0] = v46;
  v82[1] = @"ContextIDsByPID";
  id v47 = [v65 copy];
  v83[1] = v47;
  v82[2] = @"ParseErrors";
  id v48 = [v60 copy];
  void v83[2] = v48;
  id v49 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:3];

  off_100015360(1);
  off_100015368(1);
  uint64_t v50 = (void *)off_100015358(v57, (uint64_t)v49);
  uint64_t v51 = sub_100005E28();
  id v52 = v51;
  if (v50)
  {
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v53 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(void *)long long v79 = v53;
      *(_WORD *)&v79[8] = 2112;
      *(void *)&v79[10] = v49;
      _os_log_debug_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "archived '%@' with info:\n%@", buf, 0x16u);
    }

    [*(id *)(a1 + 48) setObject:v50 forKey:*(void *)(a1 + 56)];
  }
  else
  {
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      uint64_t v55 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)long long v79 = v55;
      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "failed to create archive of '%@'", buf, 0xCu);
    }
  }
  [sub_1000074E0() commit];
}

void sub_10000AF80(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100005E28();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "skp%lu: %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10000B04C(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v8 identifier]);
  id v4 = [*(id *)(a1 + 32) objectForKey:v3];

  if (v4)
  {
    uint64_t v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 pid]);
    int v6 = [*(id *)(a1 + 40) objectForKey:v5];
    if (v6)
    {
      uint64_t v7 = v6;
      [v6 addObject:v3];
    }
    else
    {
      uint64_t v7 = +[NSMutableSet setWithObject:v3];
      [*(id *)(a1 + 40) setObject:v7 forKey:v5];
    }
  }
}

NSString *__cdecl sub_10000B14C(id a1, NSNumber *a2)
{
  return +[NSString stringWithFormat:@"%x", [(NSNumber *)a2 unsignedIntValue]];
}

void sub_10000B194(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = sub_100005E28();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "final: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000B244(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = sub_100005E28();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "prsd: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000B420()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void (*)(void))off_100015410;
  uint64_t v7 = off_100015410;
  if (!off_100015410)
  {
    id v1 = sub_100006110();
    v5[3] = (uint64_t)dlsym(v1, "CARenderServerGetServerPort");
    off_100015410 = (_UNKNOWN *)v5[3];
    v0 = (void (*)(void))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (v0)
  {
    v0(0);
  }
  else
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v3 = +[NSString stringWithUTF8String:"mach_port_t soft_CARenderServerGetServerPort(const char *)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DASProcessor.m", 33, @"%s", dlerror());

    __break(1u);
  }
}

void sub_10000B564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_10000B57C(uint64_t a1)
{
  id v2 = sub_100006110();
  id result = dlsym(v2, "CARenderServerGetServerPort");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100015410 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t BSDispatchQueueCreateWithFixedPriority()
{
  return _BSDispatchQueueCreateWithFixedPriority();
}

uint64_t BSMachPortIsType()
{
  return _BSMachPortIsType();
}

uint64_t BSMachSendRightRelease()
{
  return _BSMachSendRightRelease();
}

uint64_t BSMachSendRightRetain()
{
  return _BSMachSendRightRetain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _bs_set_crash_log_message()
{
  return __bs_set_crash_log_message();
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

BOOL class_addProperty(Class cls, const char *name, const objc_property_attribute_t *attributes, unsigned int attributeCount)
{
  return _class_addProperty(cls, name, attributes, attributeCount);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__parseRaw(void *a1, const char *a2, ...)
{
  return [a1 _parseRaw];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activateXPCService(void *a1, const char *a2, ...)
{
  return [a1 activateXPCService];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_animationKeys(void *a1, const char *a2, ...)
{
  return [a1 animationKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachedContexts(void *a1, const char *a2, ...)
{
  return [a1 attachedContexts];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_builder(void *a1, const char *a2, ...)
{
  return [a1 builder];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextId(void *a1, const char *a2, ...)
{
  return [a1 contextId];
}

id objc_msgSend_contexts(void *a1, const char *a2, ...)
{
  return [a1 contexts];
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

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displays(void *a1, const char *a2, ...)
{
  return [a1 displays];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isEqual(void *a1, const char *a2, ...)
{
  return [a1 isEqual];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localContext(void *a1, const char *a2, ...)
{
  return [a1 localContext];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_parseErrors(void *a1, const char *a2, ...)
{
  return [a1 parseErrors];
}

id objc_msgSend_pattern(void *a1, const char *a2, ...)
{
  return [a1 pattern];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_raw(void *a1, const char *a2, ...)
{
  return [a1 raw];
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return [a1 remoteProcess];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return [a1 rootLayer];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sourceContextId(void *a1, const char *a2, ...)
{
  return [a1 sourceContextId];
}

id objc_msgSend_sourceLayer(void *a1, const char *a2, ...)
{
  return [a1 sourceLayer];
}

id objc_msgSend_sourceLayerRenderId(void *a1, const char *a2, ...)
{
  return [a1 sourceLayerRenderId];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return [a1 superlayer];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}