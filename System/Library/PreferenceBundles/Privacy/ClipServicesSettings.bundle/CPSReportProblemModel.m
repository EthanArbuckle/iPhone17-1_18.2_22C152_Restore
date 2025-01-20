@interface CPSReportProblemModel
+ (id)sharedAMSBag;
+ (id)testModel;
+ (id)test_problemTypes;
- (CPSReportProblemModel)init;
- (CPSReportProblemModel)initWithBundleIdentifier:(id)a3 itemIdentifier:(unint64_t)a4;
- (NSArray)problemTypes;
- (NSURL)developerSupportURL;
- (void)fetchAMSDataWithCompletion:(id)a3;
- (void)obtainBagValuesWithCompletion:(id)a3;
- (void)obtainSupportURLWithCompletion:(id)a3;
- (void)submitResponseForProblemType:(id)a3 userNote:(id)a4 completion:(id)a5;
@end

@implementation CPSReportProblemModel

- (CPSReportProblemModel)initWithBundleIdentifier:(id)a3 itemIdentifier:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPSReportProblemModel;
  v7 = [(CPSReportProblemModel *)&v12 init];
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = v8;

    v7->_itemIdentifier = a4;
    v10 = v7;
  }

  return v7;
}

- (CPSReportProblemModel)init
{
  id v2 = +[NSException exceptionWithName:NSGenericException reason:@"-init: is not available." userInfo:0];
  objc_exception_throw(v2);
}

+ (id)sharedAMSBag
{
  if (qword_1A200 != -1) {
    dispatch_once(&qword_1A200, &stru_14588);
  }
  id v2 = (void *)qword_1A1F8;

  return v2;
}

- (void)fetchAMSDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (OS_dispatch_group *)dispatch_group_create();
  amsFetchGroup = self->_amsFetchGroup;
  self->_amsFetchGroup = v5;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_521C;
  v14[4] = sub_522C;
  id v15 = 0;
  dispatch_group_enter((dispatch_group_t)self->_amsFetchGroup);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_5234;
  v13[3] = &unk_145D8;
  v13[4] = self;
  v13[5] = v14;
  [(CPSReportProblemModel *)self obtainBagValuesWithCompletion:v13];
  dispatch_group_enter((dispatch_group_t)self->_amsFetchGroup);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5384;
  v12[3] = &unk_14628;
  v12[4] = self;
  [(CPSReportProblemModel *)self obtainSupportURLWithCompletion:v12];
  v7 = self->_amsFetchGroup;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5438;
  block[3] = &unk_14650;
  id v10 = v4;
  v11 = v14;
  id v8 = v4;
  dispatch_group_notify((dispatch_group_t)v7, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v14, 8);
}

- (void)obtainSupportURLWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_8C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "RAP: Obtaining developer support URL", buf, 2u);
  }
  id v6 = objc_alloc((Class)AMSMediaTask);
  v7 = [(id)objc_opt_class() sharedAMSBag];
  id v8 = [v6 initWithType:0 clientIdentifier:@"com.apple.ClipServices.clipserviced" clientVersion:@"1" bag:v7];

  v9 = +[NSNumber numberWithUnsignedLongLong:self->_itemIdentifier];
  id v10 = [v9 stringValue];
  v20 = v10;
  v11 = +[NSArray arrayWithObjects:&v20 count:1];
  [v8 setItemIdentifiers:v11];

  CFStringRef v18 = @"extend";
  CFStringRef v19 = @"supportURLForLanguage";
  objc_super v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  [v8 setAdditionalQueryParams:v12];

  v13 = [v8 perform];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5674;
  v15[3] = &unk_14678;
  id v16 = v4;
  id v14 = v4;
  [v13 addFinishBlock:v15];
}

- (void)obtainBagValuesWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  v5 = [(id)objc_opt_class() sharedAMSBag];
  id v6 = [v5 dictionaryForKey:@"app-clips-report-problem"];

  v7 = sub_8C68();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "RAP: Obtaining problem types", buf, 2u);
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5A14;
  v10[3] = &unk_146A0;
  id v11 = v4;
  id v12 = v3;
  id v8 = v4;
  id v9 = v3;
  [v6 valueWithCompletion:v10];
}

- (void)submitResponseForProblemType:(id)a3 userNote:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[CPSWebClipStore sharedStore];
  bundleIdentifier = self->_bundleIdentifier;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_5ED4;
  v16[3] = &unk_14740;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v11 getWebClipsBackedbyAppClipIdentifier:bundleIdentifier completion:v16];
}

+ (id)testModel
{
  id v2 = objc_alloc_init((Class)a1);
  uint64_t v3 = +[CPSReportProblemModel test_problemTypes];
  id v4 = (void *)v2[6];
  v2[6] = v3;

  uint64_t v5 = +[NSURL URLWithString:@"https://apple.com"];
  id v6 = (void *)v2[5];
  v2[5] = v5;

  return v2;
}

+ (id)test_problemTypes
{
  id v2 = [[CPSReportProblemProblemType alloc] initWithLocalizedTitle:@"Not working as expected" localizedUpperCaseTitle:@"NOT WORKING AS EXPECTED" label:@"NOT_WORKING" identifier:&off_15808 offerDeveloperWebsite:1];
  uint64_t v3 = [[CPSReportProblemProblemType alloc] initWithLocalizedTitle:@"Offensive or illegal" localizedUpperCaseTitle:@"OFFENSIVE OR ILLEGAL" label:@"OFFENSIVE_OR_ILLEGAL" identifier:&off_15820 offerDeveloperWebsite:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (NSURL)developerSupportURL
{
  return self->_developerSupportURL;
}

- (NSArray)problemTypes
{
  return self->_problemTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problemTypes, 0);
  objc_storeStrong((id *)&self->_developerSupportURL, 0);
  objc_storeStrong((id *)&self->_amsFetchGroup, 0);
  objc_storeStrong((id *)&self->_postURLForFormSubmission, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end