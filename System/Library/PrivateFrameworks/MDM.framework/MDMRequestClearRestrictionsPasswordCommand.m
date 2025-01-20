@interface MDMRequestClearRestrictionsPasswordCommand
+ (id)request;
+ (id)requestType;
+ (unint64_t)requiredAccessRights;
- (BOOL)loadFromDictionary:(id)a3 serializationType:(signed __int16)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serializeWithType:(signed __int16)a3;
- (void)processRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MDMRequestClearRestrictionsPasswordCommand

+ (id)requestType
{
  return @"ClearRestrictionsPassword";
}

+ (unint64_t)requiredAccessRights
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MDMRequestClearRestrictionsPasswordCommand;
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
  v4.super_class = (Class)MDMRequestClearRestrictionsPasswordCommand;
  return [(RMModelPayloadBase *)&v4 copyWithZone:a3];
}

- (void)processRequest:(id)a3 completionHandler:(id)a4
{
  objc_super v4 = (void (**)(id, uint64_t))a4;
  v5 = objc_opt_new();
  v6 = v5;
  if (!v5)
  {
    id v8 = 0;
    goto LABEL_5;
  }
  id v11 = 0;
  char v7 = [v5 clearRestrictionsPasscodeWithError:&v11];
  id v8 = v11;
  if (v7)
  {
LABEL_5:
    uint64_t v9 = +[MDMAbstractTunnelParser responseWithStatus:@"Acknowledged"];
    goto LABEL_6;
  }
  uint64_t v9 = +[MDMAbstractTunnelParser responseWithError:v8];
LABEL_6:
  v10 = (void *)v9;
  v4[2](v4, v9);
}

@end