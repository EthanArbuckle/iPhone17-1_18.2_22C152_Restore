@interface AMDOnDeviceTester
+ (BOOL)initEnv:(id)a3 withDomain:(id)a4 userId:(id)a5 andStoreFrontId:(id)a6;
+ (id)deleteEvents:(id *)a3;
+ (id)fetchEvents:(id *)a3;
+ (id)fetchModelUrls:(id *)a3;
+ (id)fetchTasteProfile:(id *)a3;
+ (id)getAppSegments:(id *)a3;
+ (id)getEnvironments;
+ (void)initPersistentContainer;
+ (void)refreshOnDeviceTasteProfile:(id)a3 withUserId:(id)a4 andStoreFrontId:(unsigned int)a5 error:(id *)a6;
+ (void)saveDescriptors:(id)a3 forDomain:(int64_t)a4 error:(id *)a5;
+ (void)saveEvent:(id)a3 error:(id *)a4;
- (AMDCoreDataPersistentContainer)container;
- (AMDOnDeviceTester)init;
- (void)setContainer:(id)a3;
- (void)testAddEvent:(id *)a3;
- (void)testAggregation:(id *)a3;
- (void)testClient:(id *)a3;
- (void)testFeatureDescriptor:(id *)a3;
- (void)testOnDeviceTasteProfile:(id)a3 error:(id *)a4;
- (void)testRunInference:(id *)a3;
- (void)testSaveConfigAndDownloadModel:(id *)a3;
@end

@implementation AMDOnDeviceTester

- (AMDOnDeviceTester)init
{
  SEL v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)AMDOnDeviceTester;
  v7 = [(AMDOnDeviceTester *)&v5 init];
  objc_storeStrong((id *)&v7, v7);
  id v3 = +[AMDCoreDataPersistentContainer sharedContainer];
  -[AMDOnDeviceTester setContainer:](v7, "setContainer:");

  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

+ (id)getEnvironments
{
  return &unk_26BEC3528;
}

+ (BOOL)initEnv:(id)a3 withDomain:(id)a4 userId:(id)a5 andStoreFrontId:(id)a6
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = 0;
  objc_storeStrong(&v12, a5);
  id v11 = 0;
  objc_storeStrong(&v11, a6);
  NSLog(&cfstr_Amddemosupport.isa);
  id v6 = +[AMDCoreDataPersistentContainer sharedContainer];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return 1;
}

+ (void)initPersistentContainer
{
  id v2 = +[AMDCoreDataPersistentContainer sharedContainer];

  id v3 = v2;
}

- (void)testAddEvent:(id *)a3
{
  NSLog(&cfstr_RunningAddEven.isa);
  id v3 = +[AMDTestDataCommon getSampleEvent];
  +[AMDAppEvent saveEvent:error:](AMDAppEvent, "saveEvent:error:");

  if (*a3) {
    __assert_rtn("-[AMDOnDeviceTester testAddEvent:]", "AMDOnDeviceTester.m", 81, "!*error");
  }
}

- (void)testFeatureDescriptor:(id *)a3
{
  v9 = self;
  SEL v8 = a2;
  v7 = a3;
  NSLog(&cfstr_RunningNonAggF.isa);
  id v3 = objc_alloc_init(AMDFeatureDescriptor);
  id v4 = +[AMDTestDataCommon getNonAggregationDescriptor];
  id v6 = -[AMDFeatureDescriptor initWithDictionary:withUserId:featureName:](v3, "initWithDictionary:withUserId:featureName:");

  id location = (id)[v6 getFeature:v7];
  if (*v7) {
    __assert_rtn("-[AMDOnDeviceTester testFeatureDescriptor:]", "AMDOnDeviceTester.m", 91, "!*error");
  }
  if (!location) {
    __assert_rtn("-[AMDOnDeviceTester testFeatureDescriptor:]", "AMDOnDeviceTester.m", 92, "f");
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v6, 0);
}

- (void)testAggregation:(id *)a3
{
  v10 = self;
  SEL v9 = a2;
  SEL v8 = a3;
  NSLog(&cfstr_RunningAggrega.isa);
  id v7 = objc_alloc_init(AMDFeatureDescriptor);
  id v3 = v7;
  id v4 = +[AMDTestDataCommon getAggregationDescriptorDict];
  id v5 = (id)objc_msgSend(v3, "initWithDictionary:withUserId:featureName:");
  if (!v5) {
    __assert_rtn("-[AMDOnDeviceTester testAggregation:]", "AMDOnDeviceTester.m", 100, "[fd initWithDictionary:[AMDTestDataCommon getAggregationDescriptorDict] withUserId:@\"111111111\" featureName:@\"foo\"]");
  }

  id location = (id)[v7 getFeature:v8];
  if (*v8) {
    __assert_rtn("-[AMDOnDeviceTester testAggregation:]", "AMDOnDeviceTester.m", 103, "!*error");
  }
  if (!location) {
    __assert_rtn("-[AMDOnDeviceTester testAggregation:]", "AMDOnDeviceTester.m", 104, "f");
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v7, 0);
}

+ (void)saveDescriptors:(id)a3 forDomain:(int64_t)a4 error:(id *)a5
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = +[AMDDescriptor refreshDescriptors:location[0] forDomain:a4 error:a5];
  objc_storeStrong(location, 0);
}

+ (void)refreshOnDeviceTasteProfile:(id)a3 withUserId:(id)a4 andStoreFrontId:(unsigned int)a5 error:(id *)a6
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v6 = +[AMDTasteProfile refreshAggregationTasteProfileForDomain:location[0] forUser:v10 andStoreFrontId:a5 error:a6];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

+ (id)deleteEvents:(id *)a3
{
  return +[AMDAppEvent deleteAllEvents:a3];
}

+ (id)fetchEvents:(id *)a3
{
  return +[AMDAppEvent fetchEvents:a3];
}

+ (void)saveEvent:(id)a3 error:(id *)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  +[AMDAppEvent saveEvent:location[0] error:a4];
  objc_storeStrong(location, 0);
}

+ (id)fetchTasteProfile:(id *)a3
{
  return +[AMDTasteProfile fetchTasteProfile:a3];
}

+ (id)getAppSegments:(id *)a3
{
  return +[AMDAppSegment getSegmentsDictForAllTreatments:a3];
}

+ (id)fetchModelUrls:(id *)a3
{
  return +[AMDModel fetchAll:a3];
}

- (void)testOnDeviceTasteProfile:(id)a3 error:(id *)a4
{
  v9[1] = *MEMORY[0x263EF8340];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  NSLog(&cfstr_RunningOnDevic.isa);
  uint64_t v8 = 0x26BEB96D8;
  id v6 = +[AMDTestDataCommon getAggregationDescriptorDict];
  v9[0] = v6;
  id v5 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, &v8);
  +[AMDOnDeviceTester saveDescriptors:forDomain:error:](AMDOnDeviceTester, "saveDescriptors:forDomain:error:");

  if (*a4) {
    __assert_rtn("-[AMDOnDeviceTester testOnDeviceTasteProfile:error:]", "AMDOnDeviceTester.m", 159, "!*error");
  }
  +[AMDOnDeviceTester refreshOnDeviceTasteProfile:@"apps" withUserId:location[0] andStoreFrontId:143441 error:a4];
  if (*a4) {
    __assert_rtn("-[AMDOnDeviceTester testOnDeviceTasteProfile:error:]", "AMDOnDeviceTester.m", 166, "!*error");
  }
  objc_storeStrong(location, 0);
}

- (void)testClient:(id *)a3
{
  v16[3] = self;
  v16[2] = (id)a2;
  v16[1] = a3;
  NSLog(&cfstr_RunningClientA.isa);
  v16[0] = -[AMDClientRequestEvent initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:]([AMDClientRequestEvent alloc], "initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:", @"testFeatureList", 0, 0, @"apps", 0);
  if (!v16[0]) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 177, "requestEvent");
  }
  id v12 = [AMDClient alloc];
  id v15 = [(AMDClient *)v12 getFeatureStub:v16[0]];

  if (!v15) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 179, "response");
  }
  id v14 = (id)[v15 objectForKey:@"status"];
  if (!v14) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 182, "status");
  }
  if (([v14 isEqual:@"OK"] ^ 1)) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 183, "[status isEqual:AMD_CLIENT_STATUS_OK]");
  }
  id location = (id)[v15 objectForKey:@"data"];
  if (!location) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 186, "data");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() ^ 1)) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 187, "[data isKindOfClass:NSArray.class]");
  }
  id v3 = -[AMDClientRequestEvent initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:]([AMDClientRequestEvent alloc], "initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:", @"testFeatureDict", 0, 0, @"apps", 0);
  id v4 = v16[0];
  v16[0] = v3;

  if (!v16[0]) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 195, "requestEvent");
  }
  id v11 = [AMDClient alloc];
  id v5 = [(AMDClient *)v11 getFeatureStub:v16[0]];
  id v6 = v15;
  id v15 = v5;

  if (!v15) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 197, "response");
  }
  id v7 = (id)[v15 objectForKey:@"status"];
  id v8 = v14;
  id v14 = v7;

  if (!v14) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 200, "status");
  }
  if (([v14 isEqual:@"OK"] ^ 1)) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 201, "[status isEqual:AMD_CLIENT_STATUS_OK]");
  }
  id v9 = (id)[v15 objectForKey:@"data"];
  id v10 = location;
  id location = v9;

  if (!location) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 204, "data");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() ^ 1)) {
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 205, "[data isKindOfClass:NSDictionary.class]");
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

- (void)testSaveConfigAndDownloadModel:(id *)a3
{
  id v7 = self;
  SEL v6 = a2;
  id v5 = a3;
  NSLog(&cfstr_RunningSaveCon.isa);
  id location = +[AMDTestDataCommon getSaveConfigDownloadModelPayload];
  if (!location) {
    __assert_rtn("-[AMDOnDeviceTester testSaveConfigAndDownloadModel:]", "AMDOnDeviceTester.m", 211, "payload");
  }
  id v3 = +[AMDJSRequestHandler handlePayload:location error:v5];
  if (*v5) {
    __assert_rtn("-[AMDOnDeviceTester testSaveConfigAndDownloadModel:]", "AMDOnDeviceTester.m", 213, "!*error");
  }
  objc_storeStrong(&location, 0);
}

- (void)testRunInference:(id *)a3
{
  v16 = self;
  SEL v15 = a2;
  id v14 = a3;
  NSLog(&cfstr_RunningInferen.isa);
  NSLog(&cfstr_InferenceGetCo.isa);
  id v11 = +[AMDTestDataCommon getSaveConfigDownloadModelPayload];
  id v3 = +[AMDJSRequestHandler handlePayload:error:](AMDJSRequestHandler, "handlePayload:error:");

  if (*v14) {
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 220, "!*error");
  }
  NSLog(&cfstr_InferenceRefre.isa);
  id v10 = +[AMDTestDataCommon getRefreshServerTasteProfilePayload];
  id v4 = +[AMDJSRequestHandler handlePayload:error:](AMDJSRequestHandler, "handlePayload:error:");

  if (*v14) {
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 224, "!*error");
  }
  NSLog(&cfstr_InferenceCompu.isa);
  id v9 = +[AMDTestDataCommon getInferencePayload];
  id v13 = +[AMDJSRequestHandler handlePayload:error:](AMDJSRequestHandler, "handlePayload:error:");

  if (*v14) {
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 228, "!*error");
  }
  NSLog(&cfstr_InferenceVerif.isa);
  if (!v13) {
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 231, "inferenceResults");
  }
  id v7 = (id)[v13 objectForKey:@"response"];
  id location = (id)[v7 objectForKey:@"mgyml"];

  id v8 = (id)[location objectForKey:@"contentIds"];
  if ([v8 count] != 64) {
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 233, "[[inferenceResponse objectForKey:@\"contentIds\"] count] == 64");
  }

  id v6 = (id)[location objectForKey:@"scores"];
  if ([v6 count] != 64) {
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 234, "[[inferenceResponse objectForKey:@\"scores\"] count] == 64");
  }

  id v5 = (id)[location objectForKey:@"metrics"];
  if ([v5 count] != 3) {
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 235, "[[inferenceResponse objectForKey:@\"metrics\"] count] == 3");
  }

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
}

- (AMDCoreDataPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end