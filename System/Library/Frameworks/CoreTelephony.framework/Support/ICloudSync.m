@interface ICloudSync
- (ICloudSync)initWithCallback:(id)a3 queue:(dispatch_queue_s *)a4 registry:(void *)a5;
- (id).cxx_construct;
- (void)accountAvailabilityChanged:(id)a3;
- (void)dealloc;
- (void)dumpState;
- (void)forceCleanUp;
- (void)forceCompleteReverseUpdate;
- (void)invokeCallbackWithDict:(id)a3 changedKeys:(id)a4;
- (void)storeDidChange:(id)a3;
- (void)updateICloudComplete;
- (void)updateICloudKey:(id)a3 withValue:(id)a4;
@end

@implementation ICloudSync

- (void)invokeCallbackWithDict:(id)a3 changedKeys:(id)a4
{
  v7 = (const void *)*((void *)self + 6);
  if (v7) {
    v8 = _Block_copy(v7);
  }
  else {
    v8 = 0;
  }
  id v15 = a3;
  if (a3) {
    CFRetain(a3);
  }
  id v14 = a4;
  if (a4) {
    CFRetain(a4);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100BA38E4;
  block[3] = &unk_101A42A98;
  if (v8) {
    v9 = _Block_copy(v8);
  }
  else {
    v9 = 0;
  }
  aBlock = v9;
  id v12 = a3;
  if (a3) {
    CFRetain(a3);
  }
  id v13 = a4;
  if (a4) {
    CFRetain(a4);
  }
  dispatch_async(*((dispatch_queue_t *)self + 5), block);
  sub_100044D00((const void **)&v13);
  sub_100057D78((const void **)&v12);
  if (aBlock) {
    _Block_release(aBlock);
  }
  sub_100044D00((const void **)&v14);
  sub_100057D78((const void **)&v15);
  if (v8) {
    _Block_release(v8);
  }
}

- (ICloudSync)initWithCallback:(id)a3 queue:(dispatch_queue_s *)a4 registry:(void *)a5
{
  v16.receiver = self;
  v16.super_class = (Class)ICloudSync;
  id v7 = [(ICloudSync *)&v16 init];
  v8 = v7;
  if (v7)
  {
    uint64_t v10 = *(void *)a5;
    uint64_t v9 = *((void *)a5 + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    v11 = (std::__shared_weak_count *)*((void *)v7 + 2);
    v8[1] = v10;
    v8[2] = v9;
    if (v11) {
      sub_10004D2C8(v11);
    }
    if (a4) {
      dispatch_retain((dispatch_object_t)a4);
    }
    id v12 = v8[5];
    v8[5] = a4;
    if (v12) {
      dispatch_release(v12);
    }
    operator new();
  }
  id v13 = *MEMORY[0x18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x18], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#I ICloudSync created", v15, 2u);
  }
  return 0;
}

- (void)dealloc
{
  v3 = **((void **)self + 3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#I ICloudSync dealloc", buf, 2u);
  }
  [+[NSNotificationCenter defaultCenter] removeObserver:self];

  *((void *)self + 4) = 0;
  v4.receiver = self;
  v4.super_class = (Class)ICloudSync;
  [(ICloudSync *)&v4 dealloc];
}

- (void)forceCompleteReverseUpdate
{
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  objc_super v4 = dispatch_queue_create("ICloudSync: forceCompleteReverseUpdate queue", v3);
  id v5 = *((id *)self + 4);
  v6 = *((void *)self + 5);
  if (v6) {
    dispatch_retain(*((dispatch_object_t *)self + 5));
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100BA3D40;
  block[3] = &unk_101A42AD0;
  void block[4] = v5;
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  block[5] = self;
  dispatch_async(v4, block);
  if (object) {
    dispatch_release(object);
  }
  if (v6) {
    dispatch_release(v6);
  }
  if (v4) {
    dispatch_release(v4);
  }
}

- (void)storeDidChange:(id)a3
{
  id v6 = [*((id *)self + 4) dictionaryRepresentation];
  id v7 = **((void **)self + 3);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#I '%@'", (uint8_t *)&v18, 0xCu);
  }
  id v8 = [a3 userInfo];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = [v8 objectForKey:NSUbiquitousKeyValueStoreChangeReasonKey];
    if (v10)
    {
      id v11 = [v10 integerValue];
      id v12 = **((void **)self + 3);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 67109120;
        LODWORD(v19) = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I reason for change: %d", (uint8_t *)&v18, 8u);
      }
      if ((unint64_t)v11 < 2)
      {
        -[ICloudSync invokeCallbackWithDict:changedKeys:](self, "invokeCallbackWithDict:changedKeys:", v6, [v9 objectForKey:NSUbiquitousKeyValueStoreChangedKeysKey]);
      }
      else if (v11 == (id)2)
      {
        id v13 = **((void **)self + 3);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          id v14 = "#I NSUbiquitousKeyValueStoreQuotaViolationChange, not implemented";
          goto LABEL_19;
        }
      }
      else
      {
        if (v11 != (id)3)
        {
          v17 = **((void **)self + 3);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          int v18 = 67109120;
          LODWORD(v19) = v11;
          id v14 = "#I unknown reason for change %d - skip update";
          id v15 = v17;
          uint32_t v16 = 8;
          goto LABEL_20;
        }
        id v13 = **((void **)self + 3);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          id v14 = "#I NSUbiquitousKeyValueStoreAccountChange, not implemented";
LABEL_19:
          id v15 = v13;
          uint32_t v16 = 2;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v16);
        }
      }
    }
    else
    {
      id v13 = **((void **)self + 3);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        id v14 = "#I reason could not be determined - skip update";
        goto LABEL_19;
      }
    }
  }
  else
  {
    id v13 = **((void **)self + 3);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      id v14 = "#I empty userInfo dictionary - skip update";
      goto LABEL_19;
    }
  }
LABEL_21:
}

- (void)accountAvailabilityChanged:(id)a3
{
  objc_super v4 = **((void **)self + 3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I nft:'%@'", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateICloudKey:(id)a3 withValue:(id)a4
{
  id v8 = **((void **)self + 3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = [a3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I add:'%s'", (uint8_t *)&v10, 0xCu);
  }
  uint64_t v9 = (void *)*((void *)self + 4);
  if (a4) {
    [v9 setObject:a4 forKey:a3];
  }
  else {
    [v9 removeObjectForKey:a3];
  }
}

- (void)updateICloudComplete
{
  unsigned int v4 = [*((id *)self + 4) synchronize];
  int v5 = **((void **)self + 3);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "failed";
    if (v4) {
      id v6 = "succeed";
    }
    int v7 = 136315138;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#I synchronize result:%s", (uint8_t *)&v7, 0xCu);
  }
}

- (void)forceCleanUp
{
  id v4 = [*((id *)self + 4) dictionaryRepresentation];
  if (v4)
  {
    int v5 = v4;
    if ([v4 count])
    {
      -[ICloudSync invokeCallbackWithDict:changedKeys:](self, "invokeCallbackWithDict:changedKeys:", 0, [v5 allKeys]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v6)
      {
        id v8 = v6;
        uint64_t v9 = *(void *)v18;
        *(void *)&long long v7 = 136315138;
        long long v16 = v7;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v18 != v9) {
              objc_enumerationMutation(v5);
            }
            id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            id v12 = **((void **)self + 3);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v13 = [v11 UTF8String];
              *(_DWORD *)buf = v16;
              id v22 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#I remove from icloud %s", buf, 0xCu);
            }
            objc_msgSend(*((id *)self + 4), "removeObjectForKey:", v11, v16);
          }
          id v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
        }
        while (v8);
      }
      unsigned int v14 = [*((id *)self + 4) synchronize];
      id v15 = **((void **)self + 3);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#I forceCleanUp complete (%d)", buf, 8u);
      }
    }
  }
}

- (void)dumpState
{
  id v3 = [*((id *)self + 4) dictionaryRepresentation];
  id v4 = **((void **)self + 3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#I | iCloud KVS store has:", buf, 2u);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v3);
        }
        int v10 = **((void **)self + 3);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) UTF8String];
          *(_DWORD *)buf = 67109378;
          int v18 = v7 + i;
          __int16 v19 = 2080;
          id v20 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#I | %2d %s", buf, 0x12u);
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
      v7 += (int)i;
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  id v3 = (const void *)*((void *)self + 6);
  if (v3) {
    _Block_release(v3);
  }
  id v4 = *((void *)self + 5);
  if (v4) {
    dispatch_release(v4);
  }
  sub_100119D1C((ctu::OsLogLogger **)self + 3, 0);
  id v5 = (std::__shared_weak_count *)*((void *)self + 2);
  if (v5)
  {
    sub_10004D2C8(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end