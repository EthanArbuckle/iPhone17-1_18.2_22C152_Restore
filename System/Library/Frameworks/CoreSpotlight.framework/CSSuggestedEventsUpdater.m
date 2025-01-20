@interface CSSuggestedEventsUpdater
+ (BOOL)journalItemHasIntValue:(id)a3 forKey:(const char *)a4;
+ (BOOL)journalItemHasSuggestedEventsSN:(id)a3;
+ (BOOL)journalItemNeedsSuggestedEvents:(id)a3;
+ (id)getAggregatedAttributeSet:(id)a3;
- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5;
- (BOOL)isAcceptingJournals;
- (BOOL)shouldHandleJournalItem:(id)a3;
- (BOOL)supportsCSIndexType:(int)a3;
- (id)description;
- (id)excludeBundleIDs;
- (id)excludeContentTypes;
- (id)includeBundleIDs;
- (id)includeContentTypes;
- (id)optionalAttribures;
- (id)requiredAttributes;
- (id)taskName;
- (int)eventType;
- (unint64_t)eventFlags;
@end

@implementation CSSuggestedEventsUpdater

- (BOOL)isAcceptingJournals
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(CSSuggestedEventsUpdater *)self taskName];
  id v6 = [v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (BOOL)supportsCSIndexType:(int)a3
{
  return 1;
}

- (id)taskName
{
  return @"suggestedevents";
}

- (unint64_t)eventFlags
{
  return 16;
}

- (int)eventType
{
  return 6;
}

- (id)includeBundleIDs
{
  v2 = +[SKGProcessorContext sharedContext];
  id v3 = [v2 suggestedEventsIncludeBundles];

  return v3;
}

- (id)excludeBundleIDs
{
  return 0;
}

- (id)includeContentTypes
{
  return 0;
}

- (id)excludeContentTypes
{
  return 0;
}

- (id)requiredAttributes
{
  return 0;
}

- (id)optionalAttribures
{
  return 0;
}

+ (BOOL)journalItemHasIntValue:(id)a3 forKey:(const char *)a4
{
  long long v9 = 0uLL;
  uint64_t v10 = 0;
  sub_100010024((uint64_t)a3, (uint64_t)v8);
  strlen(a4);
  int PlistObjectForKey = _MDPlistDictionaryGetPlistObjectForKey();
  if (PlistObjectForKey)
  {
    int PlistObjectType = _MDPlistGetPlistObjectType();
    LOBYTE(PlistObjectForKey) = ((PlistObjectType - 226) < 2
                              || PlistObjectType == 51
                              || PlistObjectType == 35)
                             && _MDPlistNumberGetIntValue();
  }
  return PlistObjectForKey;
}

+ (BOOL)journalItemNeedsSuggestedEvents:(id)a3
{
  return +[CSSuggestedEventsUpdater journalItemHasIntValue:a3 forKey:"_kMDItemNeedsSuggestedEvents"];
}

+ (BOOL)journalItemHasSuggestedEventsSN:(id)a3
{
  return +[CSSuggestedEventsUpdater journalItemHasIntValue:a3 forKey:"_kMDItemSuggestedEventsSN"];
}

- (BOOL)shouldHandleJournalItem:(id)a3
{
  id v3 = a3;
  if ((([v3 hasTextContent] & 1) != 0 || objc_msgSend(v3, "hasHTMLContent"))
    && +[CSSuggestedEventsUpdater journalItemNeedsSuggestedEvents:v3])
  {
    unsigned int v4 = !+[CSSuggestedEventsUpdater journalItemHasSuggestedEventsSN:v3];
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5
{
  v7 = (unsigned int *)a3;
  id v8 = a4;
  id v53 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = sub_10001E910((uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "**** handleDonation for %@ / %s", buf, 0x16u);
  }
  long long v9 = sub_100050730();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = sub_100050730();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CSSuggestedEventsUpdaterHandleDonation", (const char *)&unk_1000C2652, buf, 2u);
  }

  v13 = objc_alloc_init(CSEventFeedback);
  [(CSEventFeedback *)v13 setIndexType:sub_10000F9BC((uint64_t)v7)];
  [(CSEventFeedback *)v13 start];
  v14 = +[SKGProcessorContext sharedContext];
  v15 = [v14 suggestedEventsFetchAttributes];

  id v16 = objc_alloc((Class)NSString);
  v17 = +[NSString stringWithUTF8String:sub_10001E910((uint64_t)v7)];
  id v18 = [v16 initWithString:v17];

  [(CSEventFeedback *)v13 setBundleID:v18];
  id v19 = objc_alloc((Class)NSString);
  v20 = sub_1000592B4(v7);
  id v55 = [v19 initWithString:v20];

  v21 = +[NSNumber numberWithUnsignedLongLong:sub_10001E904((uint64_t)v7)];
  os_signpost_id_t v48 = v10;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v83 = sub_100012614;
  v84 = sub_100012528;
  id v85 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v73[3] = 0;
  dispatch_group_t v22 = dispatch_group_create();
  v63[0] = _NSConcreteStackBlock;
  v63[1] = 3221225472;
  v63[2] = sub_10001FA84;
  v63[3] = &unk_1000D99B8;
  v63[4] = self;
  v23 = (uint64_t (**)(void))v53;
  id v70 = v23;
  v24 = v7;
  v64 = v24;
  v71 = v73;
  id v49 = v15;
  id v65 = v49;
  id v54 = v18;
  id v66 = v54;
  v25 = v13;
  v67 = v25;
  v51 = v22;
  v68 = v51;
  id v50 = v21;
  id v69 = v50;
  v72 = buf;
  sub_100012034((uint64_t)v24, v63);
  int v26 = v23[2](v23);
  if (v26)
  {
    id v27 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = [(CSSuggestedEventsUpdater *)self taskName];
      v29 = (CSSuggestedEventsUpdater *)[v28 UTF8String];
      v30 = sub_1000592E8((char *)v24);
      uint64_t v31 = sub_10001E904((uint64_t)v24);
      *(_DWORD *)v74 = 136315650;
      v75 = v29;
      __int16 v76 = 2080;
      v77 = v30;
      __int16 v78 = 2048;
      uint64_t v79 = v31;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### cancelling %s due to expiration request while processing type='%s' sn:'%llu'", v74, 0x20u);
    }
    [(CSEventFeedback *)v25 end];
    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
LABEL_25:
    char v44 = 0;
    goto LABEL_26;
  }
  v32 = *(void **)(*(void *)&buf[8] + 40);
  if (v32) {
    id v33 = [v32 count];
  }
  else {
    id v33 = 0;
  }
  id v34 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v35 = sub_1000592E8((char *)v24);
    uint64_t v36 = sub_10001E904((uint64_t)v24);
    *(_DWORD *)v74 = 138413058;
    v75 = self;
    __int16 v76 = 2080;
    v77 = v35;
    __int16 v78 = 2048;
    uint64_t v79 = v36;
    __int16 v80 = 2048;
    id v81 = v33;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "### donation %@ %s sn:%llu found %lu items", v74, 0x2Au);
  }

  if (!v33
    || (id v37 = [objc_alloc((Class)CSSearchableIndex) _initWithName:@"SuggestedEventsUpdate" protectionClass:v55 bundleIdentifier:v54 options:32]) == 0)
  {
    v45 = sub_100050730();
    v46 = v45;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
    {
      *(_WORD *)v74 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_INTERVAL_END, v10, "CSSuggestedEventsUpdaterHandleDonation", (const char *)&unk_1000C2652, v74, 2u);
    }

    [(CSEventFeedback *)v25 end];
    goto LABEL_25;
  }
  v38 = sub_100050730();
  os_signpost_id_t v39 = os_signpost_id_generate(v38);

  v40 = sub_100050730();
  v41 = v40;
  if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)v74 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, v39, "CSSuggestedEventsUpdaterIndexItems", (const char *)&unk_1000C2652, v74, 2u);
  }

  id v42 = [objc_alloc((Class)NSError) initWithDomain:@"CSSuggestedEventsUpdaterTimeout" code:-1 userInfo:0];
  uint64_t v43 = *(void *)(*(void *)&buf[8] + 40);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_1000200E4;
  v57[3] = &unk_1000D99E0;
  v58 = v25;
  os_signpost_id_t v60 = v39;
  os_signpost_id_t v61 = v48;
  id v59 = v8;
  id v62 = v33;
  [v37 indexSearchableItems:v43 timeout:v42 timeoutError:v57 completion:3.0e11];

  char v44 = 1;
LABEL_26:

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(buf, 8);

  return v26 | v44;
}

+ (id)getAggregatedAttributeSet:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unsigned int v4 = [v3 objectAtIndexedSubscript:0];
    v5 = [v4 attributeDictionary];
    id v6 = +[SKGProcessorContext sharedContext];
    v7 = [v6 suggestedEventsAllowListAttributes];
    uint64_t v8 = sub_100061328(v5, v7);

    v21 = (void *)v8;
    id v9 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v8];
    id v10 = objc_alloc_init((Class)NSMutableSet);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v3;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) attributeDictionary];
          v17 = [v16 objectForKey:@"kMDItemEventType"];

          if (v17) {
            [v10 addObject:v17];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    id v18 = [v10 allObjects];
    [v9 setObject:v18 forKey:@"kMDItemDetectedEventTypes"];

    id v19 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithMutableDictionary:v9];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

@end