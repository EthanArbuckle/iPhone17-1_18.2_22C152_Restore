@interface MDMRequestUserListCommand
+ (id)request;
+ (id)requestType;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMRequestUserListCommand

+ (id)requestType
{
  return @"UserList";
}

+ (unint64_t)requiredAccessRights
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestUserListCommand;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_requiredAccessRights);
}

+ (id)request
{
  v2 = objc_opt_new();
  return v2;
}

- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5
{
  return 1;
}

- (id)serializeWithType:(signed __int16)a3
{
  objc_super v3 = objc_opt_new();
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MDMRequestUserListCommand;
  return [(RMModelPayloadBase *)&v4 copyWithZone:a3];
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  objc_super v4 = (void (**)(id, void *))a4;
  v5 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
  v6 = [MEMORY[0x263F841B0] sharedManager];
  v7 = [v6 allUsers];
  v8 = v7;
  if (v7)
  {
    v31 = v5;
    v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v30 = v6;
    v34 = [v6 currentUser];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v29 = v8;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v33 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          v13 = v9;
          if (*(void *)v36 != v33) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v39[0] = @"UserName";
          v15 = [v14 username];
          v40[0] = v15;
          v39[1] = @"HasDataToSync";
          v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "hasDataToSync"));
          v40[1] = v16;
          v39[2] = @"IsLoggedIn";
          v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v14, "isEqualToUser:", v34));
          v40[2] = v17;
          v18 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:3];
          v19 = (void *)[v18 mutableCopy];

          uint64_t v20 = [v14 dataQuota];
          uint64_t v21 = [v14 dataUsed];
          if (v20)
          {
            v22 = [NSNumber numberWithUnsignedLongLong:v20];
            [v19 setObject:v22 forKeyedSubscript:@"DataQuota"];
          }
          if (v21)
          {
            v23 = [NSNumber numberWithUnsignedLongLong:v21];
            [v19 setObject:v23 forKeyedSubscript:@"DataUsed"];
          }
          v9 = v13;
          [v13 addObject:v19];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v11);
    }

    v24 = v31;
    [v31 setObject:v9 forKey:@"Users"];
    v4[2](v4, v31);

    v8 = v29;
    v6 = v30;
  }
  else
  {
    v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F38B10];
    v27 = DMCErrorArray();
    v9 = objc_msgSend(v25, "DMCErrorWithDomain:code:descriptionArray:errorType:", v26, 12070, v27, *MEMORY[0x263F38A40], 0);

    v28 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v9;
      _os_log_impl(&dword_230A49000, v28, OS_LOG_TYPE_ERROR, "Failed to retrieve user list with error %{public}@", buf, 0xCu);
    }
    v24 = +[MDMAbstractTunnelParser responseWithError:v9];

    v4[2](v4, v24);
  }
}

@end