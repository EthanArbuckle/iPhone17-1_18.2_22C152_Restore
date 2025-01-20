@interface _CNUIUserActionDialRequestOpener
+ (id)errorForUnableToCastDialRequest:(id)a3;
+ (id)errorForUnableToOpenDialRequest:(id)a3 withUnderlyingError:(id)a4;
- (TUCallCenter)callCenter;
- (_CNUIUserActionDialRequestOpener)init;
- (_CNUIUserActionDialRequestOpener)initWithCallCenter:(id)a3;
- (id)openDialRequest:(id)a3 withScheduler:(id)a4;
@end

@implementation _CNUIUserActionDialRequestOpener

- (_CNUIUserActionDialRequestOpener)init
{
  v3 = [(objc_class *)getTUCallCenterClass() sharedInstance];
  v4 = [(_CNUIUserActionDialRequestOpener *)self initWithCallCenter:v3];

  return v4;
}

- (_CNUIUserActionDialRequestOpener)initWithCallCenter:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNUIUserActionDialRequestOpener;
  v6 = [(_CNUIUserActionDialRequestOpener *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callCenter, a3);
    v8 = v7;
  }

  return v7;
}

- (id)openDialRequest:(id)a3 withScheduler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  getTUDialRequestClass();
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F33630]);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke;
    v19[3] = &unk_2640173A8;
    v19[4] = self;
    id v12 = v10;
    id v20 = v12;
    id v21 = v11;
    id v13 = v11;
    [v7 performBlock:v19];
    v14 = [v13 future];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __66___CNUIUserActionDialRequestOpener_openDialRequest_withScheduler___block_invoke_2;
    v17[3] = &unk_2640173D0;
    v17[4] = self;
    id v18 = v12;
    v15 = [v14 recover:v17];

    [v15 addFailureBlock:&__block_literal_global_2];
  }
  else
  {
    id v13 = [(id)objc_opt_class() errorForUnableToCastDialRequest:v8];
    v15 = [MEMORY[0x263F335E0] futureWithError:v13];
  }

  return v15;
}

+ (id)errorForUnableToCastDialRequest:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F335A8];
  id v4 = a3;
  id v5 = [v3 descriptionBuilderWithObject:v4];
  id v6 = [v4 handle];
  id v7 = (id)[v5 appendName:@"handle" object:v6];

  id v8 = [v4 contactIdentifier];
  id v9 = (id)[v5 appendName:@"contactIdentifier" object:v8];

  uint64_t v10 = [v4 isVideo];
  id v11 = (id)[v5 appendName:@"video" BOOLValue:v10];
  v16 = @"dial request";
  id v12 = [v5 build];
  v17[0] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];

  v14 = [MEMORY[0x263F087E8] errorWithDomain:@"CNContactsUIErrorDomain" code:206 userInfo:v13];

  return v14;
}

+ (id)errorForUnableToOpenDialRequest:(id)a3 withUnderlyingError:(id)a4
{
  v28[2] = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263F335A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 descriptionBuilderWithObject:v7];
  id v9 = [v7 handle];
  id v10 = (id)[v8 appendName:@"handle" object:v9];

  id v11 = [v7 contactIdentifier];
  id v12 = (id)[v8 appendName:@"contactIdentifier" object:v11];

  id v13 = (id)objc_msgSend(v8, "appendName:BOOLValue:", @"video", objc_msgSend(v7, "isVideo"));
  v14 = [v7 provider];
  v15 = [v14 identifier];
  id v16 = (id)[v8 appendName:@"provider.identifier" object:v15];

  v17 = [v7 provider];
  id v18 = [v17 localizedName];
  id v19 = (id)[v8 appendName:@"provider.localizedName" object:v18];

  id v20 = [v7 provider];

  id v21 = [v20 bundleIdentifier];
  id v22 = (id)[v8 appendName:@"provider.bundleIdentifier" object:v21];

  v27[0] = @"dial request";
  v23 = [v8 build];
  v27[1] = *MEMORY[0x263F08608];
  v28[0] = v23;
  v28[1] = v6;
  v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  v25 = [MEMORY[0x263F087E8] errorWithDomain:@"CNContactsUIErrorDomain" code:207 userInfo:v24];

  return v25;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void).cxx_destruct
{
}

@end