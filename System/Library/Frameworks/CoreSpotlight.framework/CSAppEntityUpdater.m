@interface CSAppEntityUpdater
+ (void)initialize;
- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5;
- (BOOL)isAcceptingJournals;
- (BOOL)shouldHandleJournalItem:(id)a3;
- (BOOL)supportsCSIndexType:(int)a3;
- (id)appEntitySearchableItemsFromDonation:(id)a3;
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
- (void)completeDonationForBundleID:(id)a3 serialNumber:(unint64_t)a4 items:(id)a5 error:(id)a6 canceled:(BOOL)a7 completionHandler:(id)a8;
- (void)handleCascadeDonationForBundleID:(id)a3 indexType:(int)a4 serialNumber:(unint64_t)a5 items:(id)a6 completionHandler:(id)a7;
- (void)startCascadeDonation:(id)a3 bundleID:(id)a4 serialNumber:(unint64_t)a5 items:(id)a6 completionHandler:(id)a7;
@end

@implementation CSAppEntityUpdater

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(CSAppEntityUpdater *)self taskName];
  id v6 = [v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (id)taskName
{
  return @"appentity";
}

- (int)eventType
{
  return 3;
}

- (BOOL)shouldHandleJournalItem:(id)a3
{
  id v3 = a3;
  if ((sub_10000F9BC((uint64_t)v3) & 0x20) == 0) {
    goto LABEL_11;
  }
  if (sub_10000F9BC((uint64_t)v3)) {
    goto LABEL_11;
  }
  sub_100010024((uint64_t)v3, (uint64_t)v12);
  if (_MDPlistGetPlistObjectType() != 241) {
    goto LABEL_11;
  }
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  sub_100010024((uint64_t)v3, (uint64_t)v9);
  if (!_MDPlistDictionaryGetPlistObjectForKey()) {
    goto LABEL_11;
  }
  long long v7 = v10;
  uint64_t v8 = v11;
  if (_MDPlistGetPlistObjectType() != 244)
  {
    long long v7 = v10;
    uint64_t v8 = v11;
    if (_MDPlistGetPlistObjectType() != 245) {
      goto LABEL_11;
    }
  }
  sub_100010024((uint64_t)v3, (uint64_t)v6);
  if (_MDPlistDictionaryGetPlistObjectForKey()
    && ((long long v7 = v10, v8 = v11, _MDPlistGetPlistObjectType() == 244)
     || (long long v7 = v10, v8 = v11, _MDPlistGetPlistObjectType() == 245)))
  {
    BOOL v4 = 1;
  }
  else
  {
LABEL_11:
    BOOL v4 = 0;
  }

  return v4;
}

+ (void)initialize
{
  objc_opt_class();

  objc_opt_class();
}

- (BOOL)isAcceptingJournals
{
  return 1;
}

- (BOOL)supportsCSIndexType:(int)a3
{
  return !a3 || a3 == 3;
}

- (unint64_t)eventFlags
{
  return 8;
}

- (id)includeBundleIDs
{
  return 0;
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

- (id)appEntitySearchableItemsFromDonation:(id)a3
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1000126E4;
  v13 = sub_100012590;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006F954;
  v6[3] = &unk_1000DBBC8;
  v6[4] = self;
  id v3 = a3;
  id v7 = v3;
  uint64_t v8 = &v9;
  sub_100012034((uint64_t)v3, v6);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)completeDonationForBundleID:(id)a3 serialNumber:(unint64_t)a4 items:(id)a5 error:(id)a6 canceled:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  v46 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v17 = [v14 count];
  if (v17)
  {
    v40 = (void (**)(void, void))v16;
    v42 = v13;
    id v43 = v15;
    v45 = +[NSMutableArray arrayWithCapacity:v17];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v41 = v14;
    id obj = v14;
    id v18 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v52;
      if (v15) {
        int v21 = 1;
      }
      else {
        int v21 = v9;
      }
      int v44 = v21;
      p_cache = &OBJC_METACLASS___SKGEmbedding.cache;
      do
      {
        v23 = 0;
        id v47 = v19;
        do
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v51 + 1) + 8 * (void)v23);
          v25 = [v24 attributeSet];
          v26 = [v25 attributeForKey:p_cache[213]];
          uint64_t v27 = [v25 attributeForKey:off_1000F86B0];
          v28 = (void *)v27;
          if (v26) {
            BOOL v29 = v27 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          if (!v29)
          {
            uint64_t v30 = v20;
            v31 = p_cache;
            v32 = objc_opt_new();
            [v32 setAttribute:v46 forKey:off_1000F8698];
            if (v44) {
              [v25 setAttribute:kCFNull forKey:off_1000F86A0];
            }
            id v33 = objc_alloc((Class)CSSearchableItem);
            v34 = [v24 uniqueIdentifier];
            id v35 = [v33 initWithUniqueIdentifier:v34 domainIdentifier:0 attributeSet:v32];

            [v35 setIsUpdate:1];
            [v45 addObject:v35];

            p_cache = v31;
            uint64_t v20 = v30;
            id v19 = v47;
          }

          v23 = (char *)v23 + 1;
        }
        while (v19 != v23);
        id v19 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v19);
    }

    id v13 = v42;
    if ([v45 count]
      && ((id v36 = v42,
           !+[CSEventListenerTasksManager turboMode])
        ? (uint64_t v37 = 0)
        : (uint64_t v37 = 32),
          id v38 = [objc_alloc((Class)CSSearchableIndex) _initWithName:@"AppEntities" protectionClass:NSFileProtectionCompleteUntilFirstUserAuthentication bundleIdentifier:v36 options:v37], v36, v38))
    {
      id v39 = [objc_alloc((Class)NSError) initWithDomain:@"CSEmbeddingsUpdaterTimeout" code:-1 userInfo:0];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10006FFF4;
      v49[3] = &unk_1000DBBF0;
      id v16 = v40;
      v50 = v40;
      [v38 indexSearchableItems:v45 timeout:v39 timeoutError:v49 completion:3.0e11];

      id v14 = v41;
      id v15 = v43;
    }
    else
    {
      id v16 = v40;
      id v15 = v43;
      ((void (**)(void, id))v40)[2](v40, v43);
      id v14 = v41;
    }
  }
  else
  {
    (*((void (**)(id, id))v16 + 2))(v16, v15);
  }
}

- (void)startCascadeDonation:(id)a3 bundleID:(id)a4 serialNumber:(unint64_t)a5 items:(id)a6 completionHandler:(id)a7
{
  id v11 = a3;
  id v46 = a4;
  id v12 = a6;
  id v47 = a7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v50 = 0;
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v50 = isKindOfClass ^ 1;
  }
  long long v54 = v11;
  unint64_t v49 = a5;
  long long v51 = +[NSNumber numberWithUnsignedLongLong:a5];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v12;
  id v56 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
  id v13 = 0;
  if (!v56) {
    goto LABEL_34;
  }
  uint64_t v55 = *(void *)v72;
  while (2)
  {
    for (i = 0; i != v56; i = (char *)i + 1)
    {
      if (*(void *)v72 != v55) {
        objc_enumerationMutation(obj);
      }
      id v15 = [*(id *)(*((void *)&v71 + 1) + 8 * i) attributeSet];
      uint64_t v16 = [v15 attributeForKey:off_1000F86A8];
      uint64_t v17 = [v15 attributeForKey:off_1000F86B0];
      uint64_t v18 = [v15 title];
      uint64_t v19 = [v15 subtitle];
      v60 = (void *)v18;
      if (v18 | v19)
      {
        id v20 = objc_alloc((Class)CCAppEntityDisplayRepresentation);
        uint64_t v70 = 0;
        id v21 = [v20 initWithTitle:v18 subtitle:v19 synonyms:&__NSArray0__struct error:&v70];
      }
      else
      {
        id v21 = 0;
      }
      v59 = (void *)v19;
      v22 = [v15 attributeForKey:off_1000F86B8];
      if (v22)
      {
        v23 = [v15 attributeForKey:off_1000F86C0];
        id v24 = objc_alloc((Class)CCAppEntityTypeDisplayRepresentation);
        uint64_t v69 = 0;
        id v25 = [v24 initWithName:v22 synonyms:v23 error:&v69];
      }
      else
      {
        id v25 = 0;
      }
      id v26 = objc_alloc((Class)CCAppIntentsIndexedEntityContent);
      uint64_t v68 = 0;
      v58 = v21;
      id v27 = [v26 initWithTypeIdentifier:v17 displayRepresentation:v21 typeDisplayRepresentation:v25 error:&v68];
      v61 = (void *)v17;
      v62 = (void *)v16;
      v28 = +[NSString stringWithFormat:@"%@/%@", v17, v16];
      id v29 = objc_alloc((Class)CCAppIntentsIndexedEntityMetaContent);
      uint64_t v30 = +[NSNumber numberWithInt:0];
      uint64_t v67 = 0;
      id v31 = [v29 initWithSourceItemIdentifier:v28 rank:v30 error:&v67];

      id v32 = objc_alloc((Class)CCItemInstance);
      id v66 = v13;
      id v33 = [v32 initWithContent:v27 metaContent:v31 error:&v66];
      id v34 = v66;

      v57 = v25;
      if (v33)
      {
        if (isKindOfClass)
        {
          id v64 = v34;
          unsigned __int8 v35 = [v54 registerItem:v33 error:&v64];
          id v36 = v64;

          if (v35)
          {
            id v34 = v36;
            id v37 = 0;
LABEL_21:
            [v15 setAttribute:v51 forKey:off_1000F86A0];
            int v38 = 0;
            goto LABEL_28;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v76 = v33;
            __int16 v77 = 2112;
            id v78 = v36;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "### Failed to register item instance %@ with donation error %@", buf, 0x16u);
          }

          id v34 = 0;
          id v37 = 0;
          int v38 = 2;
          char v50 = 1;
        }
        else
        {
          id v65 = 0;
          unsigned __int8 v39 = [v54 addOrUpdateItem:v33 error:&v65];
          id v37 = v65;
          if (v39) {
            goto LABEL_21;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v76 = v33;
            __int16 v77 = 2112;
            id v78 = v37;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "### Failed to add/update item instance %@ with donation error %@", buf, 0x16u);
          }
          id v37 = v37;

          int v38 = 2;
          char v50 = 1;
          id v34 = v37;
        }
      }
      else
      {
        id v37 = 0;
        int v38 = 3;
      }
LABEL_28:

      if (v38 != 3 && v38)
      {
        id v13 = v34;
        goto LABEL_34;
      }
      id v13 = v34;
    }
    id v56 = [obj countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (v56) {
      continue;
    }
    break;
  }
LABEL_34:

  if (v50)
  {
    id v40 = v13;
    id v41 = v54;
    v42 = v46;
    unint64_t v43 = v49;
    goto LABEL_41;
  }
  id v63 = v13;
  id v41 = v54;
  unsigned __int8 v44 = [v54 finish:&v63];
  id v40 = v63;

  unint64_t v43 = v49;
  if (v44)
  {
    uint64_t v45 = 0;
    v42 = v46;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A2DB4();
    }
    v42 = v46;
LABEL_41:
    [v41 cancel];
    uint64_t v45 = 1;
  }
  [(CSAppEntityUpdater *)self completeDonationForBundleID:v42 serialNumber:v43 items:obj error:v40 canceled:v45 completionHandler:v47];
}

- (void)handleCascadeDonationForBundleID:(id)a3 indexType:(int)a4 serialNumber:(unint64_t)a5 items:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  id v27 = 0;
  id v15 = +[CCSetDescriptor sourceIdentifierWithValue:v12 error:&v27];
  id v16 = v27;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000A2E38();
    }
    [(CSAppEntityUpdater *)self completeDonationForBundleID:v12 serialNumber:a5 items:v13 error:v16 canceled:1 completionHandler:v14];
  }
  else
  {
    v28 = v15;
    uint64_t v17 = +[NSArray arrayWithObjects:&v28 count:1];
    uint64_t v18 = +[NSNumber numberWithUnsignedInt:v10];
    uint64_t v19 = +[NSString stringWithFormat:@"%@", v18];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100070884;
    v20[3] = &unk_1000DBC18;
    unint64_t v26 = a5;
    id v21 = v15;
    v22 = self;
    id v23 = v12;
    id v24 = v13;
    id v25 = v14;
    +[CCSetDonation incrementalSetDonationWithItemType:47341 forAccount:0 descriptors:v17 version:a5 validity:v19 completion:v20];
  }
}

- (BOOL)handleDonation:(id)a3 completionHandler:(id)a4 cancelBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(CSAppEntityUpdater *)self appEntitySearchableItemsFromDonation:v7];
  id v10 = [v9 count];
  if (v10)
  {
    id v11 = +[NSString stringWithFormat:@"%u", sub_10000F9BC((uint64_t)v7)];
    id v12 = +[NSString stringWithUTF8String:sub_10001E910((uint64_t)v7)];
    uint64_t v13 = sub_10001E904((uint64_t)v7);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100070AC8;
    v15[3] = &unk_1000DBBF0;
    id v16 = v8;
    +[LNSpotlightCascadeBridge donateItems:v9 bundleIdentifier:v12 version:v13 validity:v11 completionHandler:v15];
  }
  return v10 != 0;
}

@end