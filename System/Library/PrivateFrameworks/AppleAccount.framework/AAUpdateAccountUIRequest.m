@interface AAUpdateAccountUIRequest
- (AAUpdateAccountUIRequest)initWithAccount:(id)a3 termsEntries:(id)a4 deviceOSVersion:(id)a5;
- (id)urlString;
@end

@implementation AAUpdateAccountUIRequest

- (AAUpdateAccountUIRequest)initWithAccount:(id)a3 termsEntries:(id)a4 deviceOSVersion:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    id v19 = v10;
    v20 = @"iOS";
    v18 = @"version";
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v21[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  }
  else
  {
    v13 = 0;
  }
  v14 = [(AAGenericTermsUIRequest *)self _requestParamsForTermsEntries:v9 additionalInfo:v13];
  v17.receiver = self;
  v17.super_class = (Class)AAUpdateAccountUIRequest;
  v15 = [(AAGenericTermsUIRequest *)&v17 initWithAccount:v8 parameters:v14];

  return v15;
}

- (id)urlString
{
  v2 = +[AAURLConfiguration urlConfiguration];
  v3 = [v2 updateAccountUIURL];

  return v3;
}

@end