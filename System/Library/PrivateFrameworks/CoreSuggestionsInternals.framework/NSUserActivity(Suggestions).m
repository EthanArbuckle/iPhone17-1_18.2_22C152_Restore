@interface NSUserActivity(Suggestions)
+ (id)sg_userActivityWithRequiredString:()Suggestions;
- (id)sg_serialize;
@end

@implementation NSUserActivity(Suggestions)

- (id)sg_serialize
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__30271;
  v13 = __Block_byref_object_dispose__30272;
  id v14 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__NSUserActivity_Suggestions__sg_serialize__block_invoke;
  v6[3] = &unk_1E65BB7B0;
  v8 = &v9;
  v6[4] = a1;
  v3 = v2;
  v7 = v3;
  [a1 _createUserActivityStringsWithOptions:0 completionHandler:v6];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v3];
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (id)sg_userActivityWithRequiredString:()Suggestions
{
  v3 = (objc_class *)MEMORY[0x1E4F22488];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] _initWithUserActivityStrings:v4 secondaryString:0 optionalData:0];

  return v5;
}

@end