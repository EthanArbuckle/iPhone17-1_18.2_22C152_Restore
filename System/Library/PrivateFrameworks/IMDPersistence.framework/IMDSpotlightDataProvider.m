@interface IMDSpotlightDataProvider
+ (id)_createDataProviders;
+ (id)_dataProviders;
+ (id)dataProviderForIdentifier:(id)a3;
- (id)dataForGUID:(id)a3 error:(id *)a4;
- (id)typeIdentifier;
@end

@implementation IMDSpotlightDataProvider

+ (id)_createDataProviders
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(IMDSpotlightLinkDataProvider);
  v6[0] = v2;
  v3 = objc_alloc_init(IMDSpotlightTextDataProvider);
  v6[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)_dataProviders
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1AFC295D8;
  block[3] = &unk_1E5F8E728;
  block[4] = a1;
  if (qword_1E9AF8310 != -1) {
    dispatch_once(&qword_1E9AF8310, block);
  }
  v2 = (void *)qword_1E9AF8308;
  return v2;
}

+ (id)dataProviderForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [a1 _dataProviders];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)typeIdentifier
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Not yet implemented" userInfo:0];
  objc_exception_throw(v2);
}

- (id)dataForGUID:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Not yet implemented" userInfo:0];
  objc_exception_throw(v5);
}

@end