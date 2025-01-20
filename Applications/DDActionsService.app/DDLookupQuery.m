@interface DDLookupQuery
+ (id)dictionarySectionForString:(id)a3 queryId:(unint64_t)a4;
+ (id)footerSectionForString:(id)a3 queryId:(unint64_t)a4;
+ (id)queryWithQuery:(id)a3;
+ (id)queryWithoutNetwork;
- (BOOL)parsecEnabled;
- (DDLookupQuery)initWithSession:(id)a3;
- (id)_rankFeedbackWithLocalSections:(id)a3 remoteSections:(id)a4 footerSection:(id)a5;
- (id)bag;
- (id)feedbackListener;
- (void)sectionsForResult:(__DDResult *)a3 useNetwork:(BOOL)a4 clientId:(id)a5 queryId:(unint64_t)a6 scale:(double)a7 proxy:(id)a8 handler:(id)a9;
- (void)sectionsForString:(id)a3 useNetwork:(BOOL)a4 clientId:(id)a5 queryId:(unint64_t)a6 selectionType:(int64_t)a7 domain:(id)a8 range:(_NSRange)a9 scale:(double)a10 proxy:(id)a11 handler:(id)a12;
- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5;
@end

@implementation DDLookupQuery

- (id)feedbackListener
{
  return self->_session;
}

+ (id)queryWithQuery:(id)a3
{
  id v22 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  id v19 = 0;
  if (location[0])
  {
    v5 = (NSString *)[location[0] userAgent];
    v6 = v20;
    v20 = v5;

    id v7 = [location[0] identifier];
    id v8 = v19;
    id v19 = v7;
  }
  else
  {
    v16 = +[NSBundle bundleForClass:v22];
    id v18 = [(NSBundle *)v16 objectForInfoDictionaryKey:kCFBundleVersionKey];

    if (![v18 length]) {
      objc_storeStrong(&v18, @"1.0");
    }
    v3 = +[NSString stringWithFormat:@"%@/%@", kPARLookupClient, v18];
    v4 = v20;
    v20 = v3;

    objc_storeStrong(&v19, @"com.apple.lookup");
    objc_storeStrong(&v18, 0);
  }
  id v9 = objc_alloc((Class)PARSessionConfiguration);
  id v17 = [v9 initWithId:v19 userAgent:v20];
  id v11 = v17;
  id v12 = +[PARSession sharedSession];
  [v12 setConfiguration:v11];

  v13 = [DDLookupQuery alloc];
  v14 = +[PARSession sessionWithConfiguration:v17];
  v15 = -[DDLookupQuery initWithSession:](v13, "initWithSession:");

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(location, 0);

  return v15;
}

+ (id)queryWithoutNetwork
{
  v2 = [[DDLookupQuery alloc] initWithSession:0];

  return v2;
}

- (DDLookupQuery)initWithSession:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)DDLookupQuery;
  v14 = [(DDLookupQuery *)&v12 init];
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    if (location[0])
    {
      dispatch_queue_t v4 = dispatch_queue_create("DDLookupQuery.bag", 0);
      bagQueue = v14->_bagQueue;
      v14->_bagQueue = (OS_dispatch_queue *)v4;

      v6 = (PARBag *)[location[0] bag];
      bag = v14->_bag;
      v14->_bag = v6;

      if (v14->_bag)
      {
        v14->_bagFetchingOver = 1;
      }
      else
      {
        dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
        bagSem = v14->_bagSem;
        v14->_bagSem = (OS_dispatch_semaphore *)v8;
      }
      objc_storeStrong((id *)&v14->_session, location[0]);
      [location[0] setDelegate:v14];
    }
    else
    {
      objc_storeStrong((id *)&v14->_bag, 0);
      v14->_bagFetchingOver = 1;
    }
  }
  id v11 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v11;
}

- (id)bag
{
  v39 = self;
  v38[1] = (id)a2;
  uint64_t v32 = 0;
  v33 = &v32;
  int v34 = 838860800;
  int v35 = 48;
  v36 = sub_10000536C;
  v37 = sub_1000053C4;
  v38[0] = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  int v29 = 0x20000000;
  int v30 = 32;
  char v31 = 0;
  queue = self->_bagQueue;
  v21 = _NSConcreteStackBlock;
  int v22 = -1073741824;
  int v23 = 0;
  v24 = sub_1000053F4;
  v25 = &unk_1000205C0;
  v26[1] = &v32;
  v26[0] = self;
  v26[2] = &v27;
  dispatch_sync(queue, &v21);
  if ((v28[3] & 1) == 0)
  {
    BOOL v20 = 0;
    dsema = v39->_bagSem;
    dispatch_time_t v2 = dispatch_time(0, 2000000000);
    BOOL v20 = dispatch_semaphore_wait(dsema, v2) == 0;
    if (!v20)
    {
      os_log_t oslog = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v7 = type;
        sub_100005458(v17);
        _os_log_error_impl((void *)&_mh_execute_header, log, v7, "Time out waiting for the bag, network calls will be disabled", v17, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    bagQueue = v39->_bagQueue;
    v10 = _NSConcreteStackBlock;
    int v11 = -1073741824;
    int v12 = 0;
    v13 = sub_100005474;
    v14 = &unk_100020628;
    v15[1] = &v32;
    v15[0] = v39;
    BOOL v16 = v20;
    dispatch_sync(bagQueue, &v10);
    objc_storeStrong(v15, 0);
  }
  id v4 = (id)v33[5];
  objc_storeStrong(v26, 0);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);
  objc_storeStrong(v38, 0);

  return v4;
}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  BOOL v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  id v16 = v20->_bagSem;
  if (v16)
  {
    queue = v20->_bagQueue;
    dispatch_semaphore_t v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    int v11 = sub_100005798;
    int v12 = &unk_100020650;
    v13 = v20;
    id v14 = v18;
    id v15 = v16;
    dispatch_async(queue, &v8);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)parsecEnabled
{
  int v23 = self;
  v22[1] = (id)a2;
  if (self->_session)
  {
    v22[0] = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.spotlightui"];
    id v9 = [v22[0] objectForKey:@"SBSearchDisabledDomains"];
    unsigned int v10 = [v9 containsObject:@"DOMAIN_PARSEC"] ^ 1;

    char v21 = v10 & 1;
    if (v10)
    {
      id v20 = [(DDLookupQuery *)v23 bag];
      char v21 = [v20 isEnabled] & 1;
      if (!v21)
      {
        if (v20)
        {
          id location = &_os_log_default;
          os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
          {
            log = location;
            os_log_type_t type = v18;
            sub_100005458(v17);
            _os_log_impl((void *)&_mh_execute_header, log, type, "Parsec disabled from parsec bag, network calls will be disabled", v17, 2u);
          }
          objc_storeStrong(&location, 0);
        }
        else
        {
          id v16 = &_os_log_default;
          os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
          {
            v5 = v16;
            os_log_type_t v6 = v15;
            sub_100005458(v14);
            _os_log_impl((void *)&_mh_execute_header, v5, v6, "Parsec disabled because the bag couldn't be fetched, network calls will be disabled", v14, 2u);
          }
          objc_storeStrong(&v16, 0);
        }
      }
      objc_storeStrong(&v20, 0);
    }
    else
    {
      id v13 = &_os_log_default;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        v3 = v13;
        os_log_type_t v4 = v12;
        sub_100005458(v11);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Parsec disabled from system setting, network calls will be disabled", v11, 2u);
      }
      objc_storeStrong(&v13, 0);
    }
    char v24 = v21 & 1;
    objc_storeStrong(v22, 0);
  }
  else
  {
    char v24 = 0;
  }
  return v24 & 1;
}

- (void)sectionsForResult:(__DDResult *)a3 useNetwork:(BOOL)a4 clientId:(id)a5 queryId:(unint64_t)a6 scale:(double)a7 proxy:(id)a8 handler:(id)a9
{
  char v31 = self;
  SEL v30 = a2;
  int v29 = a3;
  BOOL v28 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  unint64_t v26 = a6;
  double v25 = a7;
  id v24 = 0;
  objc_storeStrong(&v24, a8);
  id v23 = 0;
  objc_storeStrong(&v23, a9);
  if (v23 && v29 && (DDResultHasType() & 1) != 0)
  {
    id v21 = (id)DDResultGetMatchedString();
    id v20 = (id)DDResultGetParsecRawDomain();
    os_log_type_t v15 = v31;
    id v10 = v21;
    BOOL v11 = v28;
    id v12 = location;
    unint64_t v13 = v26;
    id v14 = v20;
    id v9 = [v21 length];
    uint64_t v33 = 0;
    id v32 = v9;
    uint64_t v34 = 0;
    id v35 = v9;
    -[DDLookupQuery sectionsForString:useNetwork:clientId:queryId:selectionType:domain:range:scale:proxy:handler:](v15, "sectionsForString:useNetwork:clientId:queryId:selectionType:domain:range:scale:proxy:handler:", v10, v11, v12, v13, 2, v14, v25, 0, v9, v24, v23);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
    int v22 = 0;
  }
  else
  {
    if (v23) {
      (*((void (**)(id, void))v23 + 2))(v23, 0);
    }
    int v22 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
}

- (id)_rankFeedbackWithLocalSections:(id)a3 remoteSections:(id)a4 footerSection:(id)a5
{
  v64 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v62 = 0;
  objc_storeStrong(&v62, a4);
  id v61 = 0;
  objc_storeStrong(&v61, a5);
  id v60 = 0;
  id v59 = +[NSDate date];
  double v58 = 0.0;
  char v56 = 0;
  char v54 = 0;
  char v52 = 0;
  BOOL v40 = 0;
  if ([v62 count])
  {
    id v57 = [v62 firstObject];
    char v56 = 1;
    id v55 = [v57 results];
    char v54 = 1;
    id v53 = [v55 firstObject];
    char v52 = 1;
    BOOL v40 = [v53 placement] == 1;
  }
  if (v52) {

  }
  if (v54) {
  if (v56)
  }

  if (v40)
  {
    id v37 = [v62 firstObject];
    id v71 = v37;
    v5 = +[NSArray arrayWithObjects:&v71 count:1];
    id v6 = v60;
    id v60 = v5;

    if ([v62 count] == (id)1)
    {
      objc_storeStrong(&v62, 0);
    }
    else
    {
      id v36 = v62;
      os_log_type_t v7 = (char *)[v62 count];
      uint64_t v66 = 1;
      v65 = v7 - 1;
      uint64_t v67 = 1;
      v68 = v7 - 1;
      v51[1] = (id)1;
      v51[2] = v7 - 1;
      id v8 = [v36 subarrayWithRange:1, v7 - 1];
      id v9 = v62;
      id v62 = v8;
    }
  }
  else
  {
    objc_storeStrong(&v60, &__NSArray0__struct);
  }
  if ([location[0] count])
  {
    id v10 = [v60 arrayByAddingObjectsFromArray:location[0]];
    id v11 = v60;
    id v60 = v10;
  }
  if ([v62 count])
  {
    id v12 = [v60 arrayByAddingObjectsFromArray:v62];
    id v13 = v60;
    id v60 = v12;
  }
  if (v61)
  {
    if (![v60 count])
    {
      id v35 = (id)DDLocalizedString();
      [v61 setTitle:];
    }
    id v14 = [v60 arrayByAddingObject:v61];
    id v15 = v60;
    id v60 = v14;
  }
  [v59 timeIntervalSinceNow];
  double v58 = -v16;
  v51[0] = +[NSMutableArray array];
  uint64_t v50 = 0;
  memset(__b, 0, sizeof(__b));
  id v33 = v60;
  id v34 = [v33 countByEnumeratingWithState:__b objects:v70 count:16];
  if (v34)
  {
    uint64_t v30 = *(void *)__b[2];
    uint64_t v31 = 0;
    id v32 = v34;
    while (1)
    {
      uint64_t v29 = v31;
      if (*(void *)__b[2] != v30) {
        objc_enumerationMutation(v33);
      }
      id v49 = *(id *)(__b[1] + 8 * v31);
      id v47 = +[NSMutableArray array];
      uint64_t v46 = 0;
      memset(v44, 0, sizeof(v44));
      id v27 = [v49 results];
      id v28 = [v27 countByEnumeratingWithState:v44 objects:v69 count:16];
      if (v28)
      {
        uint64_t v24 = *(void *)v44[2];
        uint64_t v25 = 0;
        id v26 = v28;
        while (1)
        {
          uint64_t v23 = v25;
          if (*(void *)v44[2] != v24) {
            objc_enumerationMutation(v27);
          }
          uint64_t v45 = *(void *)(v44[1] + 8 * v25);
          id v17 = objc_alloc((Class)SFResultRankingFeedback);
          id v43 = [v17 initWithResult:v45 hiddenResults:0 duplicateResults:0 localResultPosition:v46++];
          [v47 addObject:v43];
          objc_storeStrong(&v43, 0);
          ++v25;
          if (v23 + 1 >= (unint64_t)v26)
          {
            uint64_t v25 = 0;
            id v26 = [v27 countByEnumeratingWithState:v44 objects:v69 count:16];
            if (!v26) {
              break;
            }
          }
        }
      }

      id v18 = objc_alloc((Class)SFSectionRankingFeedback);
      id v42 = [v18 initWithResults:v47 section:v49 localSectionPosition:v50 personalizationScore:0.0];
      [v51[0] addObject:v42];
      ++v50;
      objc_storeStrong(&v42, 0);
      objc_storeStrong(&v47, 0);
      ++v31;
      if (v29 + 1 >= (unint64_t)v32)
      {
        uint64_t v31 = 0;
        id v32 = [v33 countByEnumeratingWithState:__b objects:v70 count:16];
        if (!v32) {
          break;
        }
      }
    }
  }

  id v19 = objc_alloc((Class)SFRankingFeedback);
  id v41 = [v19 initWithSections:v51[0] blendingDuration:v58];
  id v21 = [(DDLookupQuery *)v64 feedbackListener];
  [v21 didRankSections:v41];

  id v22 = v60;
  objc_storeStrong(&v41, 0);
  objc_storeStrong(v51, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);

  return v22;
}

- (void)sectionsForString:(id)a3 useNetwork:(BOOL)a4 clientId:(id)a5 queryId:(unint64_t)a6 selectionType:(int64_t)a7 domain:(id)a8 range:(_NSRange)a9 scale:(double)a10 proxy:(id)a11 handler:(id)a12
{
  _NSRange v154 = a9;
  v153 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v151 = a4;
  id v150 = 0;
  objc_storeStrong(&v150, a5);
  v149 = (void *)a6;
  int64_t v148 = a7;
  id v147 = 0;
  objc_storeStrong(&v147, a8);
  double v146 = a10;
  id v145 = 0;
  objc_storeStrong(&v145, a11);
  id v144 = 0;
  objc_storeStrong(&v144, a12);
  id v143 = [location[0] substringWithRange:v154.location, v154.length];
  uint64_t v136 = 0;
  v137 = &v136;
  int v138 = 838860800;
  int v139 = 48;
  v140 = sub_10000536C;
  v141 = sub_1000053C4;
  id v142 = v143;
  if ([(id)v137[5] containsString:@"\""])
  {
    id v135 = 0;
    id v133 = 0;
    uint64_t v50 = +[NSRegularExpression regularExpressionWithPattern:@"[\\p{Letter}&&\\p{script=hebrew}](\")[\\p{Letter}&&\\p{script=hebrew}]" options:0 error:&v133];
    objc_storeStrong(&v135, v133);
    id v134 = v50;
    v51 = (void *)v137[5];
    id v52 = [v51 length];
    uint64_t v162 = 0;
    id v161 = v52;
    uint64_t v163 = 0;
    id v164 = v52;
    uint64_t v131 = 0;
    id v132 = v52;
    v125 = _NSConcreteStackBlock;
    int v126 = -1073741824;
    int v127 = 0;
    v128 = sub_100007868;
    v129 = &unk_100020678;
    v130 = &v136;
    [(NSRegularExpression *)v50 enumerateMatchesInString:v51 options:0 range:0 usingBlock:v52];
    objc_storeStrong(&v134, 0);
    objc_storeStrong(&v135, 0);
  }
  id v12 = [(id)v137[5] stringByReplacingOccurrencesOfString:@"׳" withString:@"'"];
  id v13 = (void *)v137[5];
  v137[5] = (uint64_t)v12;

  if (([(id)v137[5] hasSuffix:@","] & 1) != 0
    && (unint64_t)[(id)v137[5] length] > 1)
  {
    id v14 = [v137[5] substringToIndex:[v137[5] length] - 1];
    id v15 = (void *)v137[5];
    v137[5] = (uint64_t)v14;
  }
  if ([(id)v137[5] hasSuffix:@"."])
  {
    v124 = 0;
    v124 = (char *)[(id)v137[5] length];
    if (v124 == (char *)2
      || v124 == (char *)3
      || (unint64_t)v124 > 3 && (unsigned __int16)[(id)v137[5] characterAtIndex:v124 - 3] != 46)
    {
      id v16 = [(id)v137[5] substringToIndex:v124 - 1];
      id v17 = (void *)v137[5];
      v137[5] = (uint64_t)v16;
    }
  }
  if ((unint64_t)[(id)v137[5] length] > 2
    && (unsigned __int16)[(id)v137[5] characterAtIndex:0] == 8220
    && (unsigned __int16)objc_msgSend((id)v137[5], "characterAtIndex:", (char *)objc_msgSend((id)v137[5], "length") - 1) == 8221)
  {
    v48 = (void *)v137[5];
    id v49 = (char *)[v48 length];
    uint64_t v158 = 1;
    v157 = v49 - 2;
    uint64_t v159 = 1;
    v160 = v49 - 2;
    uint64_t v122 = 1;
    v123 = v49 - 2;
    id v18 = [v48 substringWithRange:1, v49 - 2];
    id v19 = (void *)v137[5];
    v137[5] = (uint64_t)v18;
  }
  if ((unint64_t)[(id)v137[5] length] > 2
    && ([(id)v137[5] hasSuffix:@"'s"] & 1) != 0)
  {
    id v20 = [v137[5] substringToIndex:[v137[5] length] - 2];
    id v21 = (void *)v137[5];
    v137[5] = (uint64_t)v20;
  }
  objc_storeStrong(&v143, (id)v137[5]);
  if ([v143 length])
  {
    v156 = (dispatch_once_t *)&unk_100028738;
    id v155 = 0;
    objc_storeStrong(&v155, &stru_100020698);
    if (*v156 != -1) {
      dispatch_once(v156, v155);
    }
    objc_storeStrong(&v155, 0);
    if (v151)
    {
      id v120 = v147;
      id v119 = dispatch_group_create();
      v113[0] = 0;
      v113[1] = v113;
      int v114 = 838860800;
      int v115 = 48;
      v116 = sub_10000536C;
      v117 = sub_1000053C4;
      id v118 = 0;
      v109[0] = 0;
      v109[1] = v109;
      int v110 = 0x20000000;
      int v111 = 32;
      char v112 = 0;
      if (v148 != 2)
      {
        group = v119;
        queue = qword_100028730;
        v102 = _NSConcreteStackBlock;
        int v103 = -1073741824;
        int v104 = 0;
        v105 = sub_1000079A4;
        v106 = &unk_1000206C0;
        id v107 = v143;
        v108[2] = v149;
        v108[1] = v113;
        v108[0] = v153;
        dispatch_group_async(group, queue, &v102);
        objc_storeStrong(v108, 0);
        objc_storeStrong(&v107, 0);
      }
      id v45 = [(DDLookupQuery *)v153 bag];
      id v43 = [v45 searchRenderTimeout];
      [v43 floatValue];
      float v44 = v22;

      float v101 = v44;
      double v23 = v44;
      if (v44 > 0.0)
      {
        dispatch_time_t when = dispatch_time(0, (uint64_t)(float)(v101 * 1000000.0));
        id v42 = dispatch_get_global_queue(17, 0);
        v92 = _NSConcreteStackBlock;
        int v93 = -1073741824;
        int v94 = 0;
        v95 = sub_100007BA8;
        v96 = &unk_100020710;
        id v97 = v119;
        v100[1] = v109;
        v100[2] = v113;
        v98 = v153;
        id v99 = v143;
        v100[3] = v149;
        v100[0] = v144;
        dispatch_after(when, v42, &v92);

        objc_storeStrong(v100, 0);
        objc_storeStrong(&v99, 0);
        objc_storeStrong((id *)&v98, 0);
        objc_storeStrong(&v97, 0);
      }
      if (v145)
      {
        id v38 = v145;
        id v39 = v143;
        BOOL v40 = v149;
        id v37 = [(PARSession *)v153->_session configuration];
        id v36 = [v37 identifier];
        id v35 = [(PARSession *)v153->_session configuration];
        id v34 = [v35 userAgent];
        v83 = _NSConcreteStackBlock;
        int v84 = -1073741824;
        int v85 = 0;
        v86 = sub_100007FC8;
        v87 = &unk_100020760;
        v88 = v153;
        id v89 = v119;
        v91[1] = v109;
        v91[2] = v113;
        id v90 = v143;
        v91[3] = v149;
        v91[0] = v144;
        [v38 performClientTextQueryWithTerm:v39 queryId:v40 sessionId:v36 userAgent:v34 reply:&v83];

        objc_storeStrong(v91, 0);
        objc_storeStrong(&v90, 0);
        objc_storeStrong(&v89, 0);
        objc_storeStrong((id *)&v88, 0);
      }
      else
      {
        id v30 = v143;
        id v31 = location[0];
        id v32 = v120;
        int64_t v33 = v148;
        char v80 = 0;
        char v78 = 0;
        if (v150)
        {
          id v29 = v150;
        }
        else
        {
          id v81 = +[NSBundle mainBundle];
          char v80 = 1;
          id v79 = [v81 bundleIdentifier];
          char v78 = 1;
          id v29 = v79;
        }
        id v82 = +[PARRequest lookupRequestWithString:queryContext:domain:lookupSelectionType:appBundleId:queryId:](PARRequest, "lookupRequestWithString:queryContext:domain:lookupSelectionType:appBundleId:queryId:", v30, v31, v32, v33, v29, v149, v23);
        if (v78) {

        }
        if (v80) {
        char v76 = 0;
        }
        if (v146 <= 0.0)
        {
          id v77 = +[UIScreen mainScreen];
          char v76 = 1;
          [v77 scale];
          double v28 = v24;
        }
        else
        {
          double v28 = v146;
        }
        [v82 setScale:v28];
        if (v76) {

        }
        session = v153->_session;
        id v26 = v82;
        uint64_t v66 = _NSConcreteStackBlock;
        int v67 = -1073741824;
        int v68 = 0;
        v69 = sub_100008384;
        v70 = &unk_100020788;
        id v71 = v153;
        id v72 = v119;
        v74[1] = v109;
        v74[2] = v113;
        id v73 = v143;
        v74[3] = v149;
        v74[0] = v144;
        id v75 = [(PARSession *)session taskWithRequest:v26 completion:&v66];
        [v75 resume];
        objc_storeStrong(&v75, 0);
        objc_storeStrong(v74, 0);
        objc_storeStrong(&v73, 0);
        objc_storeStrong(&v72, 0);
        objc_storeStrong((id *)&v71, 0);
        objc_storeStrong(&v82, 0);
      }
      _Block_object_dispose(v109, 8);
      _Block_object_dispose(v113, 8);
      objc_storeStrong(&v118, 0);
      objc_storeStrong(&v119, 0);
      objc_storeStrong(&v120, 0);
    }
    else
    {
      uint64_t v25 = qword_100028730;
      id v59 = _NSConcreteStackBlock;
      int v60 = -1073741824;
      int v61 = 0;
      id v62 = sub_10000877C;
      v63 = &unk_1000207D8;
      id v64 = v143;
      v65[1] = v149;
      v65[0] = v144;
      dispatch_async(v25, &v59);
      objc_storeStrong(v65, 0);
      objc_storeStrong(&v64, 0);
    }
    int v121 = 0;
  }
  else
  {
    (*((void (**)(id, void))v144 + 2))(v144, 0);
    int v121 = 1;
  }
  _Block_object_dispose(&v136, 8);
  objc_storeStrong(&v142, 0);
  objc_storeStrong(&v143, 0);
  objc_storeStrong(&v144, 0);
  objc_storeStrong(&v145, 0);
  objc_storeStrong(&v147, 0);
  objc_storeStrong(&v150, 0);
  objc_storeStrong(location, 0);
}

+ (id)dictionarySectionForString:(id)a3 queryId:(unint64_t)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v11 = a4;
  if ([location[0] length])
  {
    os_log_type_t v4 = [DDSearchResultDictionarySection alloc];
    id v10 = [(DDSearchResultDictionarySection *)v4 initWithSearchString:location[0] queryId:v11];
    id v8 = [v10 results];
    if ([v8 count]) {
      id v5 = v10;
    }
    else {
      id v5 = 0;
    }
    id v13 = v5;

    objc_storeStrong(&v10, 0);
  }
  else
  {
    id v13 = 0;
  }
  objc_storeStrong(location, 0);
  id v6 = v13;

  return v6;
}

+ (id)footerSectionForString:(id)a3 queryId:(unint64_t)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] length])
  {
    os_log_type_t v4 = [DDSearchResultFooterSection alloc];
    id v9 = [(DDSearchResultFooterSection *)v4 initWithQuery:location[0] queryId:a4];
  }
  else
  {
    id v9 = 0;
  }
  objc_storeStrong(location, 0);
  id v5 = v9;

  return v5;
}

- (void).cxx_destruct
{
}

@end