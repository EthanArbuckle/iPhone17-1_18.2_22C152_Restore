@interface ACSCardService
+ (BOOL)supportsSecureCoding;
- (ACSCardService)initWithCoder:(id)a3;
- (BOOL)canSatisfyCardRequest:(id)a3;
- (NSString)serviceIdentifier;
- (unint64_t)servicePriorityForRequest:(id)a3;
- (void)requestCard:(id)a3 reply:(id)a4;
@end

@implementation ACSCardService

- (BOOL)canSatisfyCardRequest:(id)a3
{
  id v3 = a3;
  if ([v3 format] == 1)
  {
    v4 = [v3 content];
    if (objc_opt_respondsToSelector())
    {
      v5 = [v3 content];
      v6 = [v5 underlyingInteraction];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)requestCard:(id)a3 reply:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  if (v7)
  {
    if ([(ACSCardService *)self canSatisfyCardRequest:v6])
    {
      v8 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v6;
        _os_log_impl(&dword_22165B000, v8, OS_LOG_TYPE_INFO, "Assistant Card Service attempting to satisfy request: %@", buf, 0xCu);
      }
      v9 = [v6 content];
      if (objc_opt_respondsToSelector())
      {
        v10 = [v9 underlyingInteraction];
      }
      else
      {
        v10 = 0;
      }
      v14 = [v10 intent];
      v13 = v14;
      if (v14)
      {
        [v14 requestCard:v6 reply:v7];
      }
      else
      {
        v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = *MEMORY[0x263F31628];
        uint64_t v20 = *MEMORY[0x263F07F80];
        v17 = [NSString stringWithFormat:@"No intent available for card request %@", v6];
        v21 = v17;
        v18 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
        v19 = [v15 errorWithDomain:v16 code:400 userInfo:v18];
        v7[2](v7, 0, v19);
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = *MEMORY[0x263F31628];
      uint64_t v24 = *MEMORY[0x263F07F80];
      v9 = [NSString stringWithFormat:@"Card service %@ is unable to satisfy card request %@", self, v6];
      v25[0] = v9;
      v10 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      v13 = [v11 errorWithDomain:v12 code:400 userInfo:v10];
      v7[2](v7, 0, v13);
    }
  }
}

- (unint64_t)servicePriorityForRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 content];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v3 content];
    id v6 = [v5 underlyingInteraction];
    BOOL v7 = [v6 intent];

    if (!v7)
    {
      unint64_t v8 = 0;
      goto LABEL_7;
    }
    unint64_t v8 = [v7 servicePriorityForCardRequest:v3];
    v4 = v7;
  }
  else
  {
    unint64_t v8 = 0;
  }

LABEL_7:
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACSCardService)initWithCoder:(id)a3
{
  return 0;
}

- (NSString)serviceIdentifier
{
  return (NSString *)@"com.apple.AssistantCardService";
}

@end