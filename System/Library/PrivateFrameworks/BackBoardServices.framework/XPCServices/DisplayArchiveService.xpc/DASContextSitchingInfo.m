@interface DASContextSitchingInfo
+ (id)infoWithContextInfoToArchive:(id)a3;
- (NSSet)contexts;
- (id)_initWithContextInfoToArchiveMap:(id)a3;
- (id)archiveOfContext:(id)a3;
- (id)contextWithIdentifier:(unsigned int)a3;
- (id)description;
@end

@implementation DASContextSitchingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_contextInfoToArchiveMap, 0);
  objc_storeStrong((id *)&self->_contextIDNumberToContextMap, 0);
}

- (id)description
{
  +[BSDescriptionBuilder builderWithObject:self];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_100001BD4;
  v10 = &unk_1000104B0;
  v11 = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v12;
  id v4 = [v3 modifyBody:&v7];
  v5 = objc_msgSend(v3, "build", v7, v8, v9, v10, v11);

  return v5;
}

- (id)archiveOfContext:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v8 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"contextInfo"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[DASContextSitchingInfo archiveOfContext:]");
      *(_DWORD *)buf = 138544130;
      v11 = v9;
      __int16 v12 = 2114;
      CFStringRef v13 = @"DASParsing.m";
      __int16 v14 = 1024;
      int v15 = 186;
      __int16 v16 = 2114;
      v17 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v8 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100002138);
  }
  v5 = v4;
  v6 = [(NSDictionary *)self->_contextInfoToArchiveMap objectForKey:v4];

  return v6;
}

- (id)contextWithIdentifier:(unsigned int)a3
{
  contextIDNumberToContextMap = self->_contextIDNumberToContextMap;
  id v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSDictionary *)contextIDNumberToContextMap objectForKey:v4];

  return v5;
}

- (NSSet)contexts
{
  return self->_contexts;
}

- (id)_initWithContextInfoToArchiveMap:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v23 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"contextInfoToArchive"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v24 = NSStringFromSelector(a2);
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138544642;
      v36 = v24;
      __int16 v37 = 2114;
      v38 = v26;
      __int16 v39 = 2048;
      v40 = self;
      __int16 v41 = 2114;
      CFStringRef v42 = @"DASParsing.m";
      __int16 v43 = 1024;
      int v44 = 151;
      __int16 v45 = 2114;
      v46 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v23 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100002488);
  }
  v6 = v5;
  id v7 = [v5 count];
  uint64_t v8 = +[NSMutableDictionary dictionaryWithCapacity:v7];
  v9 = +[NSMutableDictionary dictionaryWithCapacity:v7];
  +[NSMutableSet set];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100002490;
  v28[3] = &unk_100010440;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v29 = v10;
  id v11 = v6;
  id v30 = v11;
  SEL v34 = a2;
  __int16 v12 = self;
  v31 = v12;
  id v13 = v8;
  id v32 = v13;
  id v14 = v9;
  id v33 = v14;
  [v11 enumerateKeysAndObjectsUsingBlock:v28];
  v27.receiver = v12;
  v27.super_class = (Class)DASContextSitchingInfo;
  int v15 = [(DASContextSitchingInfo *)&v27 init];
  if (v15)
  {
    __int16 v16 = (NSDictionary *)[v13 copy];
    contextIDNumberToContextMap = v15->_contextIDNumberToContextMap;
    v15->_contextIDNumberToContextMap = v16;

    v18 = (NSDictionary *)[v11 copy];
    contextInfoToArchiveMap = v15->_contextInfoToArchiveMap;
    v15->_contextInfoToArchiveMap = v18;

    v20 = (NSSet *)[v10 copy];
    contexts = v15->_contexts;
    v15->_contexts = v20;
  }
  return v15;
}

+ (id)infoWithContextInfoToArchive:(id)a3
{
  id v3 = a3;
  id v4 = [[DASContextSitchingInfo alloc] _initWithContextInfoToArchiveMap:v3];

  return v4;
}

@end