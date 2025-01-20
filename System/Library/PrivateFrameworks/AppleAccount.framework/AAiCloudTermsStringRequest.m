@interface AAiCloudTermsStringRequest
+ (Class)responseClass;
- (AAiCloudTermsStringRequest)initWithAccount:(id)a3;
- (AAiCloudTermsStringRequest)initWithAccount:(id)a3 preferPassword:(BOOL)a4;
- (AAiCloudTermsStringRequest)initWithAccount:(id)a3 termsEntries:(id)a4 preferPassword:(BOOL)a5;
@end

@implementation AAiCloudTermsStringRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (AAiCloudTermsStringRequest)initWithAccount:(id)a3
{
  return [(AAiCloudTermsStringRequest *)self initWithAccount:a3 preferPassword:1];
}

- (AAiCloudTermsStringRequest)initWithAccount:(id)a3 preferPassword:(BOOL)a4
{
  BOOL v4 = a4;
  v17[1] = *MEMORY[0x1E4F143B8];
  v16 = @"name";
  v17[0] = @"iCloud";
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  v8 = [v6 dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v14[0] = @"terms";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v8];
  v14[1] = @"format";
  v15[0] = v9;
  v15[1] = @"plist/text";
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  v13.receiver = self;
  v13.super_class = (Class)AAiCloudTermsStringRequest;
  v11 = [(AAGenericTermsUIRequest *)&v13 initWithAccount:v7 parameters:v10 preferPassword:v4];

  return v11;
}

- (AAiCloudTermsStringRequest)initWithAccount:(id)a3 termsEntries:(id)a4 preferPassword:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(AAGenericTermsUIRequest *)self _requestParamsForTermsEntries:a4];
  v10 = (void *)[v9 mutableCopy];

  [v10 setObject:@"plist/text" forKeyedSubscript:@"format"];
  v11 = (void *)[v10 copy];
  v14.receiver = self;
  v14.super_class = (Class)AAiCloudTermsStringRequest;
  v12 = [(AAGenericTermsUIRequest *)&v14 initWithAccount:v8 parameters:v11 preferPassword:v5];

  return v12;
}

@end