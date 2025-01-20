@interface _ANEStorageHelper
+ (BOOL)_markPurgeablePath:(id)a3 error:(id *)a4;
+ (BOOL)enableApfsPurging;
+ (BOOL)garbageCollectDanglingModelsAtPath:(id)a3;
+ (BOOL)markPathAndDirectParentPurgeable:(id)a3 error:(id *)a4;
+ (BOOL)removeDirectoryAtPath:(id)a3;
+ (BOOL)removeShapesDirectoryAtPath:(id)a3;
+ (BOOL)setAccessTime:(id)a3 forModelFilePath:(id)a4;
+ (BOOL)updateAccessTimeForFilePath:(id)a3;
+ (id)createModelCacheDictionary;
+ (id)getAccessTimeForFilePath:(id)a3;
+ (id)memoryMapModelAtPath:(id)a3 isPrecompiled:(BOOL)a4 modelAttributes:(id *)a5;
+ (id)memoryMapModelAtPath:(id)a3 modelAttributes:(id *)a4;
+ (id)memoryMapWeightAtPath:(id)a3;
+ (id)mergeModelCacheStorageInformation:(id)a3 with:(id)a4;
+ (id)sizeOfDirectoryAtPath:(id)a3 recursionLevel:(unint64_t)a4;
+ (id)sizeOfModelCacheAtPath:(id)a3 purgeSubdirectories:(BOOL)a4;
+ (id)uniqueFirstLevelSubdirectories:(id)a3;
+ (void)addSubdirectoryDetails:(id)a3 directoryPath:(id)a4 size:(unint64_t)a5;
+ (void)initialize;
+ (void)removeFilePath:(id)a3 ifDate:(id)a4 olderThanSecond:(id)a5;
@end

@implementation _ANEStorageHelper

+ (void)initialize
{
  if (qword_100057F98 != -1) {
    dispatch_once(&qword_100057F98, &stru_10004D0E8);
  }
}

+ (BOOL)removeDirectoryAtPath:(id)a3
{
  id v4 = a3;
  v5 = +[NSFileManager defaultManager];
  id v12 = 0;
  unsigned __int8 v6 = [v5 removeItemAtPath:v4 error:&v12];
  id v7 = v12;

  if ((v6 & 1) == 0)
  {
    v8 = (void *)qword_100057FA8;
    if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      __int16 v15 = 2112;
      id v16 = v4;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: directoryPath=%@ : err=%@", buf, 0x20u);
    }
  }

  return v6;
}

+ (BOOL)removeShapesDirectoryAtPath:(id)a3
{
  id v4 = a3;
  char v18 = 1;
  v5 = +[NSFileManager defaultManager];
  unsigned int v6 = [v5 fileExistsAtPath:v4 isDirectory:&v18];

  if (v6)
  {
    id v7 = (void *)qword_100057FA8;
    if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v20 = v9;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: Removing compiled JIT models associated with =%@ :", buf, 0x16u);
    }
    v10 = +[NSFileManager defaultManager];
    id v17 = 0;
    unsigned __int8 v11 = [v10 removeItemAtPath:v4 error:&v17];
    id v12 = v17;

    if ((v11 & 1) == 0)
    {
      v13 = (void *)qword_100057FA8;
      if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_INFO))
      {
        v14 = v13;
        __int16 v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v20 = v15;
        __int16 v21 = 2112;
        id v22 = v4;
        __int16 v23 = 2112;
        id v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: directoryPath=%@ : err=%@", buf, 0x20u);
      }
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

+ (id)memoryMapModelAtPath:(id)a3 modelAttributes:(id *)a4
{
  return [a1 memoryMapModelAtPath:a3 isPrecompiled:0 modelAttributes:a4];
}

+ (id)memoryMapModelAtPath:(id)a3 isPrecompiled:(BOOL)a4 modelAttributes:(id *)a5
{
  id v8 = a3;
  v9 = (void *)qword_100057FA8;
  if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_DEBUG)) {
    sub_10003241C(v9, a2);
  }
  id v10 = v8;
  unsigned __int8 v11 = (const char *)[v10 UTF8String];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  int v44 = 0;
  int v44 = open(v11, 256);
  if (*((_DWORD *)v42 + 6) == -1)
  {
    v20 = (id)qword_100057FA8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      dev_t v22 = *__error();
      __int16 v23 = __error();
      id v24 = strerror(*v23);
      v55.st_dev = 138413058;
      *(void *)&v55.st_mode = v21;
      WORD2(v55.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v55.st_ino + 6) = (__darwin_ino64_t)v11;
      HIWORD(v55.st_gid) = 1024;
      v55.st_rdev = v22;
      *((_WORD *)&v55.st_rdev + 2) = 2080;
      *(void *)((char *)&v55.st_rdev + 6) = v24;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@: open(%s, (O_RDONLY|O_NOFOLLOW)) failed. errno=%d : %s", (uint8_t *)&v55, 0x26u);
    }
    goto LABEL_22;
  }
  memset(&v55, 0, sizeof(v55));
  if (fstat(*((_DWORD *)v42 + 6), &v55) == -1)
  {
    v25 = (id)qword_100057FA8;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      int v30 = *__error();
      v31 = __error();
      v32 = strerror(*v31);
      *(_DWORD *)buf = 138413058;
      id v46 = v29;
      __int16 v47 = 2080;
      v48 = v11;
      __int16 v49 = 1024;
      *(_DWORD *)v50 = v30;
      *(_WORD *)&v50[4] = 2080;
      *(void *)&v50[6] = v32;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@: stat(%s) failed. errno=%d : %s", buf, 0x26u);
    }
    goto LABEL_21;
  }
  id v12 = mmap(0, v55.st_size, 1, 1, *((_DWORD *)v42 + 6), 0);
  if (v12 == (void *)-1)
  {
    v25 = (id)qword_100057FA8;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      off_t st_size = v55.st_size;
      int v35 = *((_DWORD *)v42 + 6);
      int v36 = *__error();
      v37 = __error();
      v38 = strerror(*v37);
      *(_DWORD *)buf = 138413570;
      id v46 = v33;
      __int16 v47 = 2080;
      v48 = v11;
      __int16 v49 = 2048;
      *(void *)v50 = st_size;
      *(_WORD *)&v50[8] = 1024;
      *(_DWORD *)&v50[10] = v35;
      __int16 v51 = 1024;
      int v52 = v36;
      __int16 v53 = 2080;
      v54 = v38;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@: mmap(%s) failed. sbuf.st_size=%lld : fd=%d errno=%d : %s", buf, 0x36u);
    }
LABEL_21:

    close(*((_DWORD *)v42 + 6));
LABEL_22:
    __int16 v15 = 0;
    goto LABEL_27;
  }
  id v13 = objc_alloc((Class)NSData);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000242BC;
  v40[3] = &unk_10004D108;
  v40[4] = a2;
  v40[5] = v11;
  id v14 = [v13 initWithBytesNoCopy:v12 length:v55.st_size deallocator:v40];
  __int16 v15 = v14;
  if (v14)
  {
    id v16 = v14;
    [v16 bytes];
    [v16 length];
    *a5 = (id)ANECCreateModelDictionary();
    if (!a4 && ([(id)objc_opt_class() updateAccessTimeForFilePath:v10] & 1) == 0)
    {
      id v17 = (id)qword_100057FA8;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        char v18 = NSStringFromSelector(a2);
        sub_1000323B4(v18, (uint64_t)v10, buf, v17);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000243FC;
    block[3] = &unk_10004D130;
    block[4] = &v41;
    dispatch_async((dispatch_queue_t)qword_100057FA0, block);
    id v19 = v16;
  }
  else
  {
    v26 = (id)qword_100057FA8;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v46 = v27;
      __int16 v47 = 2080;
      v48 = v11;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@: nil modelData for %s", buf, 0x16u);
    }
    close(*((_DWORD *)v42 + 6));
  }

LABEL_27:
  _Block_object_dispose(&v41, 8);

  return v15;
}

+ (id)memoryMapWeightAtPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)qword_100057FA8;
  if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_DEBUG)) {
    sub_1000324C8(v5, a2);
  }
  id v6 = v4;
  id v7 = (const char *)[v6 UTF8String];
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int v36 = 0;
  int v36 = open(v7, 256);
  if (*((_DWORD *)v34 + 6) == -1)
  {
    id v12 = (id)qword_100057FA8;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      dev_t v14 = *__error();
      __int16 v15 = __error();
      id v16 = strerror(*v15);
      v47.st_dev = 138413058;
      *(void *)&v47.st_mode = v13;
      WORD2(v47.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v47.st_ino + 6) = (__darwin_ino64_t)v7;
      HIWORD(v47.st_gid) = 1024;
      v47.st_rdev = v14;
      *((_WORD *)&v47.st_rdev + 2) = 2080;
      *(void *)((char *)&v47.st_rdev + 6) = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@: open(%s, (O_RDONLY|O_NOFOLLOW)) failed. errno=%d : %s", (uint8_t *)&v47, 0x26u);
    }
    goto LABEL_17;
  }
  memset(&v47, 0, sizeof(v47));
  if (fstat(*((_DWORD *)v34 + 6), &v47) == -1)
  {
    id v17 = (id)qword_100057FA8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      int v22 = *__error();
      __int16 v23 = __error();
      id v24 = strerror(*v23);
      *(_DWORD *)buf = 138413058;
      id v38 = v21;
      __int16 v39 = 2080;
      v40 = v7;
      __int16 v41 = 1024;
      *(_DWORD *)v42 = v22;
      *(_WORD *)&v42[4] = 2080;
      *(void *)&v42[6] = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@: stat(%s) failed. errno=%d : %s", buf, 0x26u);
    }
    goto LABEL_16;
  }
  id v8 = mmap(0, v47.st_size, 1, 1, *((_DWORD *)v34 + 6), 0);
  if (v8 == (void *)-1)
  {
    id v17 = (id)qword_100057FA8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      off_t st_size = v47.st_size;
      int v27 = *((_DWORD *)v34 + 6);
      int v28 = *__error();
      id v29 = __error();
      int v30 = strerror(*v29);
      *(_DWORD *)buf = 138413570;
      id v38 = v25;
      __int16 v39 = 2080;
      v40 = v7;
      __int16 v41 = 2048;
      *(void *)v42 = st_size;
      *(_WORD *)&v42[8] = 1024;
      *(_DWORD *)&v42[10] = v27;
      __int16 v43 = 1024;
      int v44 = v28;
      __int16 v45 = 2080;
      id v46 = v30;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@: mmap(%s) failed. sbuf.st_size=%lld : fd=%d errno=%d : %s", buf, 0x36u);
    }
LABEL_16:

    close(*((_DWORD *)v34 + 6));
LABEL_17:
    id v10 = 0;
    goto LABEL_22;
  }
  id v9 = objc_alloc((Class)NSData);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100024938;
  v32[3] = &unk_10004D108;
  v32[4] = a2;
  v32[5] = v7;
  id v10 = [v9 initWithBytesNoCopy:v8 length:v47.st_size deallocator:v32];
  if (v10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024A78;
    block[3] = &unk_10004D130;
    block[4] = &v33;
    dispatch_async((dispatch_queue_t)qword_100057FA0, block);
    id v11 = v10;
  }
  else
  {
    char v18 = (id)qword_100057FA8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v38 = v19;
      __int16 v39 = 2080;
      v40 = v7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@: nil modelData for %s", buf, 0x16u);
    }
    close(*((_DWORD *)v34 + 6));
  }

LABEL_22:
  _Block_object_dispose(&v33, 8);

  return v10;
}

+ (BOOL)setAccessTime:(id)a3 forModelFilePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    [v6 timeIntervalSince1970];
  }
  else {
    uint64_t v8 = 0x7FEFFFFFFFFFFFFFLL;
  }
  uint64_t value = v8;
  id v9 = v7;
  int v10 = setxattr((const char *)[v9 UTF8String], (const char *)objc_msgSend(@"kANEAccessSeconds", "UTF8String"), &value, 8uLL, 0, 1);
  if (v10 < 0)
  {
    id v11 = (void *)qword_100057FA8;
    if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
    {
      id v13 = v11;
      dev_t v14 = NSStringFromSelector(a2);
      int v15 = *__error();
      *(_DWORD *)buf = 138413570;
      char v18 = v14;
      __int16 v19 = 2112;
      id v20 = v9;
      __int16 v21 = 2112;
      CFStringRef v22 = @"kANEAccessSeconds";
      __int16 v23 = 2048;
      p_uint64_t value = &value;
      __int16 v25 = 2048;
      uint64_t v26 = 8;
      __int16 v27 = 1024;
      int v28 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@: setxattr(%@, %@, %p, %lu) failed  : errno=%d", buf, 0x3Au);
    }
  }

  return v10 >= 0;
}

+ (id)getAccessTimeForFilePath:(id)a3
{
  double value = 1.79769313e308;
  id v4 = a3;
  if ((getxattr((const char *)[v4 UTF8String], (const char *)objc_msgSend(@"kANEAccessSeconds", "UTF8String"), &value, 8uLL, 0, 1) & 0x8000000000000000) == 0)
  {
    v5 = +[NSDate dateWithTimeIntervalSince1970:value];
    goto LABEL_8;
  }
  int v6 = *__error();
  id v7 = (void *)qword_100057FA8;
  if (v6 == 93)
  {
    if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = v7;
      id v9 = NSStringFromSelector(a2);
      int v10 = *__error();
      *(_DWORD *)buf = 138413570;
      int v15 = v9;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      CFStringRef v19 = @"kANEAccessSeconds";
      __int16 v20 = 2048;
      p_double value = &value;
      __int16 v22 = 2048;
      uint64_t v23 = 8;
      __int16 v24 = 1024;
      int v25 = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@: getxattr(%@, %@, %p, %lu) missing attribute  : errno=%d", buf, 0x3Au);
LABEL_12:
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v12 = *__error();
    *(_DWORD *)buf = 138413570;
    int v15 = v9;
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2112;
    CFStringRef v19 = @"kANEAccessSeconds";
    __int16 v20 = 2048;
    p_double value = &value;
    __int16 v22 = 2048;
    uint64_t v23 = 8;
    __int16 v24 = 1024;
    int v25 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: getxattr(%@, %@, %p, %lu) failed  : errno=%d", buf, 0x3Au);
    goto LABEL_12;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

+ (BOOL)updateAccessTimeForFilePath:(id)a3
{
  id v4 = a3;
  v5 = (void *)qword_100057FA8;
  if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_DEBUG)) {
    sub_1000326C4(v5, a2);
  }
  int v6 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  id v7 = [(id)objc_opt_class() getAccessTimeForFilePath:v4];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 timeIntervalSince1970];
    double v10 = v9;
    [v6 timeIntervalSince1970];
    if (v11 - v10 <= 86400.0)
    {
      dev_t v14 = (void *)qword_100057FA8;
      if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_DEBUG)) {
        sub_10003261C(v14, a2);
      }
      goto LABEL_11;
    }
  }
  if ([(id)objc_opt_class() setAccessTime:v6 forModelFilePath:v4])
  {
LABEL_11:
    BOOL v13 = 1;
    goto LABEL_12;
  }
  int v12 = (void *)qword_100057FA8;
  if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR)) {
    sub_100032574(v12, a2);
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

+ (void)removeFilePath:(id)a3 ifDate:(id)a4 olderThanSecond:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 compare:v8];
  id v11 = [v9 compare:v8];

  if (v10 == (id)-1 || !v11)
  {
    int v12 = +[NSFileManager defaultManager];
    id v16 = 0;
    unsigned __int8 v13 = [v12 removeItemAtPath:v7 error:&v16];
    id v14 = v16;

    if ((v13 & 1) == 0)
    {
      int v15 = qword_100057FA8;
      if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR)) {
        sub_10003276C((uint64_t)v7, (uint64_t)v14, v15);
      }
    }
  }
}

+ (BOOL)garbageCollectDanglingModelsAtPath:(id)a3
{
  id v4 = a3;
  v5 = &OBJC_IVAR____ANEDeviceController__device;
  int v6 = (void *)qword_100057FA8;
  if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_INFO))
  {
    id v7 = v6;
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v84 = (uint64_t)v8;
    __int16 v85 = 2112;
    id v86 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@: START - pathURL=%@", buf, 0x16u);
  }
  id v9 = +[NSFileManager defaultManager];
  NSURLResourceKey v92 = NSURLIsRegularFileKey;
  id v10 = +[NSArray arrayWithObjects:&v92 count:1];
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472;
  v82[2] = sub_100025A14;
  v82[3] = &unk_10004D0C8;
  v82[4] = a2;
  v69 = v9;
  v67 = v4;
  id v11 = [v9 enumeratorAtURL:v4 includingPropertiesForKeys:v10 options:0 errorHandler:v82];

  kdebug_trace();
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v12 = v11;
  id v13 = [v12 countByEnumeratingWithState:&v78 objects:v91 count:16];
  aSelector = a2;
  if (!v13)
  {
    CFStringRef v71 = 0;
    uint64_t v72 = 0;
    goto LABEL_46;
  }
  id v14 = v13;
  CFStringRef v71 = 0;
  uint64_t v72 = 0;
  uint64_t v74 = *(void *)v79;
  int v15 = v69;
  id v68 = v12;
  do
  {
    id v16 = 0;
    id v73 = v14;
    do
    {
      if (*(void *)v79 != v74) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v78 + 1) + 8 * (void)v16);
      __int16 v18 = *((void *)v5 + 501);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        stat v47 = v18;
        v48 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412546;
        uint64_t v84 = (uint64_t)v48;
        __int16 v85 = 2112;
        id v86 = v17;
        _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%@: ---> url=%@", buf, 0x16u);
      }
      CFStringRef v19 = [v17 lastPathComponent];
      __int16 v20 = +[_ANEStrings modelBinaryName];
      unsigned int v21 = [v19 isEqualToString:v20];

      if (v21)
      {
        __int16 v22 = [v17 URLByDeletingLastPathComponent];
        uint64_t v23 = +[_ANEStrings modelSourceStoreName];
        __int16 v24 = [v22 URLByAppendingPathComponent:v23];

        id v77 = 0;
        int v25 = +[NSString stringWithContentsOfURL:v24 encoding:4 error:&v77];
        uint64_t v26 = (__CFString *)v77;
        __int16 v27 = *((void *)v5 + 501);
        if (v25)
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v59 = v27;
            v60 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            uint64_t v84 = (uint64_t)v60;
            __int16 v85 = 2112;
            id v86 = v25;
            _os_log_debug_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "%@: --->> sourcePathname=%@", buf, 0x16u);

            v5 = &OBJC_IVAR____ANEDeviceController__device;
          }
          unsigned __int8 v76 = 0;
          if ([v15 fileExistsAtPath:v25 isDirectory:&v76]) {
            goto LABEL_18;
          }
          int v28 = *((void *)v5 + 501);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            id v29 = v28;
            int v30 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412802;
            uint64_t v84 = (uint64_t)v30;
            __int16 v85 = 2112;
            id v86 = v25;
            __int16 v87 = 1024;
            LODWORD(v88) = v76;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%@: Missing sourcePathname=%@ : isDirectory=%d", buf, 0x1Cu);
          }
          v31 = +[_ANEStrings modelCacheRetainName];
          v32 = [v22 URLByAppendingPathComponent:v31];
          uint64_t v33 = [v32 path];

          v34 = qword_100057FA8;
          if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v84 = (uint64_t)v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "modelCacheRetainPath=%@", buf, 0xCu);
          }
          unsigned int v35 = [v15 fileExistsAtPath:v33 isDirectory:&v76];
          int v36 = qword_100057FA8;
          if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v84) = v35;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "modelRetainFileExists=%d", buf, 8u);
          }
          if (v35)
          {
            v37 = +[_ANEStrings modelBinaryName];
            id v38 = [v22 URLByAppendingPathComponent:v37];
            __int16 v39 = [v38 path];

            v40 = [(id)objc_opt_class() getAccessTimeForFilePath:v39];
            if (v40)
            {
              __int16 v41 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
              [v40 timeIntervalSince1970];
              double v43 = v42;
              [v41 timeIntervalSince1970];
              BOOL v45 = v44 - v43 <= 604800.0;
            }
            else
            {
              BOOL v45 = 0;
            }

            int v46 = v45;
          }
          else
          {
            LOBYTE(v45) = 0;
            int v46 = 1;
          }
          v5 = &OBJC_IVAR____ANEDeviceController__device;
          __int16 v49 = qword_100057FA8;
          if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v84) = v46;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "retainModelCache=%d", buf, 8u);
          }
          if (v45)
          {
            int v15 = v69;
            CFStringRef v50 = v71;
            uint64_t v51 = v72;
          }
          else
          {
            v75 = v26;
            int v15 = v69;
            unsigned int v52 = [v69 removeItemAtURL:v22 error:&v75];
            CFStringRef v53 = v75;

            v54 = (void *)qword_100057FA8;
            if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_INFO))
            {
              stat v55 = v54;
              uint64_t v56 = NSStringFromSelector(aSelector);
              v57 = (void *)v56;
              *(_DWORD *)buf = 138412802;
              CFStringRef v58 = @"Success!";
              if (!v52) {
                CFStringRef v58 = v53;
              }
              uint64_t v84 = v56;
              __int16 v85 = 2112;
              id v86 = v22;
              __int16 v87 = 2112;
              CFStringRef v88 = v58;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "%@: Remove modelDirURL=%@ : %@", buf, 0x20u);

              int v15 = v69;
            }
            CFStringRef v50 = (const __CFString *)((char *)&v71->isa + 1);
            uint64_t v51 = v72 + v52;
            uint64_t v26 = (__CFString *)v53;
            v5 = &OBJC_IVAR____ANEDeviceController__device;
          }
          CFStringRef v71 = v50;
          uint64_t v72 = v51;
          kdebug_trace();

          id v12 = v68;
        }
        else
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v61 = v27;
            v62 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412802;
            uint64_t v84 = (uint64_t)v62;
            __int16 v85 = 2112;
            id v86 = v24;
            __int16 v87 = 2112;
            CFStringRef v88 = v26;
            _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "%@: Nil sourcePathname! : srcStoreURL=%@ : lErr=%@", buf, 0x20u);

            v5 = &OBJC_IVAR____ANEDeviceController__device;
          }
LABEL_18:
          kdebug_trace();
        }

        id v14 = v73;
      }
      id v16 = (char *)v16 + 1;
    }
    while (v14 != v16);
    id v14 = [v12 countByEnumeratingWithState:&v78 objects:v91 count:16];
  }
  while (v14);
LABEL_46:

  kdebug_trace();
  v63 = *((void *)v5 + 501);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    v64 = v63;
    v65 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138413058;
    uint64_t v84 = (uint64_t)v65;
    __int16 v85 = 2112;
    id v86 = v67;
    __int16 v87 = 2048;
    CFStringRef v88 = v71;
    __int16 v89 = 2048;
    uint64_t v90 = v72;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "%@: END - pathURL=%@ : attemptedCount=%lu : removedCount=%lu", buf, 0x2Au);
  }
  return 1;
}

+ (id)uniqueFirstLevelSubdirectories:(id)a3
{
  id v3 = a3;
  v5 = +[NSMutableSet set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "pathComponents", (void)v15);
        id v12 = [v11 firstObject];
        [v5 addObject:v12];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v13 = [v5 copy];

  return v13;
}

+ (id)sizeOfDirectoryAtPath:(id)a3 recursionLevel:(unint64_t)a4
{
  id v4 = a3;
  v71[0] = kANEDModelDirectorySizeKey;
  id v6 = +[NSNumber numberWithUnsignedInteger:0];
  v71[1] = kANEDModelCacheDetailsKey;
  v72[0] = v6;
  v72[1] = &__NSDictionary0__struct;
  id v7 = +[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:2];
  id v8 = (char *)[v7 mutableCopy];

  uint64_t v9 = +[NSFileManager defaultManager];
  id v63 = 0;
  v57 = v4;
  id v10 = [v9 attributesOfItemAtPath:v4 error:&v63];
  id v11 = v63;
  if (v10)
  {
    id v12 = [v10 fileSize];
    id v13 = +[NSNumber numberWithUnsignedInteger:v12];
    [v8 setObject:v13 forKeyedSubscript:kANEDModelDirectorySizeKey];

    id v14 = [v8 objectForKeyedSubscript:kANEDModelCacheDetailsKey];
    id v15 = [v14 mutableCopy];

    long long v16 = v15;
    if (v15) {
      [a1 addSubdirectoryDetails:v15 directoryPath:v57 size:v12];
    }
    if (a4)
    {
      id v62 = v11;
      long long v17 = [v9 subpathsOfDirectoryAtPath:v57 error:&v62];
      id v18 = v62;

      if (v17)
      {
        id v44 = v18;
        BOOL v45 = v17;
        int v46 = v16;
        stat v47 = v10;
        v48 = v9;
        __int16 v49 = v5;
        aSelectora = v8;
        CFStringRef v19 = [a1 uniqueFirstLevelSubdirectories:v17];
        id v50 = [&__NSDictionary0__struct mutableCopy];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id obj = v19;
        id v20 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
        unsigned int v21 = &OBJC_IVAR____ANEDeviceController__device;
        __int16 v22 = &OBJC_IVAR____ANEDeviceController__device;
        if (v20)
        {
          id v23 = v20;
          unint64_t v55 = a4 - 1;
          uint64_t v24 = *(void *)v59;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v59 != v24) {
                objc_enumerationMutation(obj);
              }
              uint64_t v26 = [v57 stringByAppendingPathComponent:*(void *)(*((void *)&v58 + 1) + 8 * i)];
              __int16 v27 = [a1 sizeOfDirectoryAtPath:v26 recursionLevel:v55];
              int v28 = [v27 objectForKeyedSubscript:*((void *)v21 + 394)];
              id v29 = (char *)[v28 unsignedIntegerValue];

              if (v29)
              {
                int v30 = [aSelectora objectForKeyedSubscript:*((void *)v21 + 394)];
                v31 = v21;
                id v32 = [v30 unsignedIntegerValue];

                uint64_t v33 = +[NSNumber numberWithUnsignedInteger:&v29[(void)v32]];
                __int16 v22 = &OBJC_IVAR____ANEDeviceController__device;
                [aSelectora setObject:v33 forKeyedSubscript:*((void *)v31 + 394)];

                v34 = [v27 objectForKeyedSubscript:kANEDModelCacheDetailsKey];
                if (v34) {
                  [v50 addEntriesFromDictionary:v34];
                }

                unsigned int v21 = &OBJC_IVAR____ANEDeviceController__device;
              }
            }
            id v23 = [obj countByEnumeratingWithState:&v58 objects:v64 count:16];
          }
          while (v23);
        }

        id v35 = [v50 copy];
        id v8 = aSelectora;
        [aSelectora setObject:v35 forKeyedSubscript:*((void *)v22 + 395)];

        id v36 = [aSelectora copy];
        uint64_t v9 = v48;
        v5 = v49;
        long long v16 = v46;
        id v10 = v47;
        id v18 = v44;
        long long v17 = v45;
      }
      else
      {
        if (v18)
        {
          id v38 = (void *)qword_100057FA8;
          if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
          {
            double v42 = v38;
            double v43 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412802;
            v66 = v43;
            __int16 v67 = 2112;
            id v68 = v57;
            __int16 v69 = 2112;
            id v70 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%@: subpathsOfDirectoryAtPath:error: failed. directoryPath=%@ : err=%@", buf, 0x20u);
          }
        }
        id v36 = [v8 copy];
      }

      id v11 = v18;
    }
    else
    {
      id v36 = [v8 copy];
    }
  }
  else
  {
    v37 = (void *)qword_100057FA8;
    if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
    {
      v40 = v37;
      __int16 v41 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v66 = v41;
      __int16 v67 = 2112;
      id v68 = v57;
      __int16 v69 = 2112;
      id v70 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@: attributesOfItemAtPath:error: failed. directoryPath=%@ : err=%@", buf, 0x20u);
    }
    id v36 = [v8 copy];
  }

  return v36;
}

+ (void)addSubdirectoryDetails:(id)a3 directoryPath:(id)a4 size:(unint64_t)a5
{
  id v7 = a3;
  id v8 = [a4 lastPathComponent];
  id v11 = v8;
  uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:a5];
  id v12 = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  [v7 addEntriesFromDictionary:v10];
}

+ (id)createModelCacheDictionary
{
  v5[0] = kANEDModelDirectorySizeKey;
  v5[1] = kANEDModelCacheDetailsKey;
  v6[0] = &off_100050520;
  v6[1] = &__NSDictionary0__struct;
  v2 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  id v3 = [v2 mutableCopy];

  return v3;
}

+ (id)sizeOfModelCacheAtPath:(id)a3 purgeSubdirectories:(BOOL)a4
{
  BOOL v51 = a4;
  id v5 = a3;
  id v7 = [(id)objc_opt_class() createModelCacheDictionary];
  id v8 = +[NSFileManager defaultManager];
  id v59 = 0;
  uint64_t v9 = [v8 attributesOfItemAtPath:v5 error:&v59];
  id v10 = v59;
  if (v9)
  {
    id v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v9 fileSize]);
    [v7 setObject:v11 forKeyedSubscript:kANEDModelDirectorySizeKey];

    id v58 = v10;
    id v12 = [v8 subpathsOfDirectoryAtPath:v5 error:&v58];
    id v13 = v58;

    if (v12)
    {
      id v43 = v13;
      id v44 = v12;
      BOOL v45 = v9;
      int v46 = v8;
      id v50 = v7;
      stat v47 = v6;
      id v14 = [a1 uniqueFirstLevelSubdirectories:v12];
      id v49 = [&__NSDictionary0__struct mutableCopy];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id obj = v14;
      id v15 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
      BOOL v16 = v51;
      if (v15)
      {
        id v17 = v15;
        uint64_t v18 = *(void *)v55;
        id v52 = v5;
        do
        {
          CFStringRef v19 = 0;
          do
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(obj);
            }
            id v20 = [v5 stringByAppendingPathComponent:*(void *)(*((void *)&v54 + 1) + 8 * (void)v19)];
            unsigned int v21 = [a1 sizeOfDirectoryAtPath:v20 recursionLevel:3];
            __int16 v22 = [v21 objectForKeyedSubscript:kANEDModelDirectorySizeKey];
            id v23 = (char *)[v22 unsignedIntegerValue];

            if (!v16) {
              goto LABEL_12;
            }
            uint64_t v24 = (void *)qword_100057FA8;
            if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_DEBUG))
            {
              int v30 = v24;
              v31 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              id v62 = v31;
              __int16 v63 = 2112;
              id v64 = v20;
              _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%@: removing %@", buf, 0x16u);

              id v5 = v52;
            }
            if (!+[_ANEStorageHelper removeDirectoryAtPath:v20])
            {
              id v29 = (void *)qword_100057FA8;
              if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
              {
                id v32 = v29;
                uint64_t v33 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                id v62 = v33;
                __int16 v63 = 2112;
                id v64 = v20;
                _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%@: FAILED to remove %@", buf, 0x16u);

                id v5 = v52;
              }
            }
            else
            {
LABEL_12:
              if (v23)
              {
                int v25 = [v50 objectForKeyedSubscript:kANEDModelDirectorySizeKey];
                id v26 = [v25 unsignedIntegerValue];

                __int16 v27 = &v23[(void)v26];
                id v5 = v52;
                int v28 = +[NSNumber numberWithUnsignedInteger:v27];
                BOOL v16 = v51;
                [v50 setObject:v28 forKeyedSubscript:kANEDModelDirectorySizeKey];

                [a1 addSubdirectoryDetails:v49 directoryPath:v20 size:v23];
              }
            }

            CFStringRef v19 = (char *)v19 + 1;
          }
          while (v17 != v19);
          id v17 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
        }
        while (v17);
      }

      id v34 = [v49 copy];
      id v7 = v50;
      [v50 setObject:v34 forKeyedSubscript:kANEDModelCacheDetailsKey];

      id v35 = [v50 copy];
      id v8 = v46;
      id v6 = v47;
      id v12 = v44;
      uint64_t v9 = v45;
      id v13 = v43;
    }
    else
    {
      if (v13)
      {
        v37 = (void *)qword_100057FA8;
        if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
        {
          __int16 v41 = v37;
          double v42 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412802;
          id v62 = v42;
          __int16 v63 = 2112;
          id v64 = v5;
          __int16 v65 = 2112;
          id v66 = v13;
          _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@: subpathsOfDirectoryAtPath:error: failed. modelDirectoryPath=%@ : err=%@", buf, 0x20u);
        }
      }
      id v35 = [v7 copy];
    }

    id v10 = v13;
  }
  else
  {
    id v36 = (void *)qword_100057FA8;
    if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
    {
      __int16 v39 = v36;
      v40 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      id v62 = v40;
      __int16 v63 = 2112;
      id v64 = v5;
      __int16 v65 = 2112;
      id v66 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@: attributesOfItemAtPath:error: failed. modelDirectoryPath=%@ : err=%@", buf, 0x20u);
    }
    id v35 = [v7 copy];
  }

  return v35;
}

+ (id)mergeModelCacheStorageInformation:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [(id)objc_opt_class() createModelCacheDictionary];
  id v8 = [v5 objectForKeyedSubscript:kANEDModelDirectorySizeKey];
  uint64_t v9 = (char *)[v8 unsignedLongLongValue];

  id v10 = [v6 objectForKeyedSubscript:kANEDModelDirectorySizeKey];
  id v11 = &v9[(void)[v10 unsignedLongLongValue]];

  id v12 = +[NSNumber numberWithUnsignedLongLong:v11];
  id v35 = v7;
  [v7 setObject:v12 forKeyedSubscript:kANEDModelDirectorySizeKey];

  v37 = v5;
  id v13 = [v5 objectForKeyedSubscript:kANEDModelCacheDetailsKey];
  id v36 = v6;
  id v14 = [v6 objectForKeyedSubscript:kANEDModelCacheDetailsKey];
  id v15 = [v13 allKeys];
  BOOL v16 = +[NSSet setWithArray:v15];

  id v17 = [v14 allKeys];
  id v34 = v16;
  uint64_t v18 = [v16 setByAddingObjectsFromArray:v17];

  id v19 = [&__NSDictionary0__struct mutableCopy];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v20 = v18;
  id v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v26 = [v13 objectForKeyedSubscript:v25];
        __int16 v27 = (char *)[v26 unsignedIntegerValue];

        int v28 = [v14 objectForKeyedSubscript:v25];
        id v29 = &v27[(void)[v28 unsignedIntegerValue]];

        int v30 = +[NSNumber numberWithUnsignedInteger:v29];
        [v19 setObject:v30 forKeyedSubscript:v25];
      }
      id v22 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v22);
  }

  id v31 = [v19 copy];
  [v35 setObject:v31 forKeyedSubscript:kANEDModelCacheDetailsKey];

  id v32 = [v35 copy];
  return v32;
}

+ (BOOL)_markPurgeablePath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (const char *)[v5 UTF8String];
  int v7 = open(v6, 0);
  if (v7 < 0)
  {
    BOOL v16 = (void *)qword_100057FA8;
    if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR)) {
      sub_1000327F4((uint64_t)v6, v16);
    }
    uint64_t v17 = *__error();
    NSErrorUserInfoKey v33 = NSFilePathErrorKey;
    id v34 = v5;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v17 userInfo:v18];

    BOOL v10 = 0;
    if (a4) {
      goto LABEL_14;
    }
  }
  else
  {
    int v8 = v7;
    uint64_t v22 = 67589;
    int v9 = ffsctl(v7, 0xC0084A44uLL, &v22, 0);
    BOOL v10 = v9 == 0;
    id v11 = qword_100057FA8;
    if (v9)
    {
      int v12 = v9;
      if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_ERROR))
      {
        id v20 = v11;
        int v21 = *__error();
        *(_DWORD *)buf = 136315906;
        id v26 = v6;
        __int16 v27 = 1024;
        int v28 = v12;
        __int16 v29 = 1024;
        int v30 = v21;
        __int16 v31 = 2048;
        uint64_t v32 = v22;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Fail to mark %s as purgeable (err %d) (%{darwin.errno}d) (flags 0x%llx)", buf, 0x22u);
      }
      uint64_t v13 = *__error();
      NSErrorUserInfoKey v23 = NSFilePathErrorKey;
      id v24 = v5;
      id v14 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v15 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v13 userInfo:v14];
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057FA8, OS_LOG_TYPE_DEBUG)) {
        sub_10003289C((uint64_t)v6, &v22, v11);
      }
      id v15 = 0;
    }
    close(v8);
    if (a4) {
LABEL_14:
    }
      *a4 = v15;
  }

  return v10;
}

+ (BOOL)markPathAndDirectParentPurgeable:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([(id)objc_opt_class() _markPurgeablePath:v5 error:a4])
  {
    id v6 = [v5 stringByDeletingLastPathComponent];
    unsigned __int8 v7 = [(id)objc_opt_class() _markPurgeablePath:v6 error:a4];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

+ (BOOL)enableApfsPurging
{
  return 1;
}

@end