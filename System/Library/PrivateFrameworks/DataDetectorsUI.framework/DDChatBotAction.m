@interface DDChatBotAction
+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4;
- (id)commitURL;
- (id)menuActions;
- (id)sheetActions;
@end

@implementation DDChatBotAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  id v5 = a3;
  if (!v5)
  {
    if (_DDResultIsURL((uint64_t)a4))
    {
      _DDURLFromResult((uint64_t)a4);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
  }
  v6 = objc_msgSend(v5, "dd_emailFromMailtoScheme");
  char IsChatBot = dd_handleIsChatBot(v6);

  if (IsChatBot)
  {
    BOOL v8 = 1;
  }
  else
  {
    id v12 = 0;
    id v9 = (id)objc_msgSend(v5, "dd_phoneNumberFromTelSchemeAndExtractBody:serviceID:suggestions:", 0, &v12, 0);
    id v10 = v12;
    BOOL v8 = v10 != 0;
  }
  return v8;
}

- (id)menuActions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(DDAction *)self url];
  if (v3
    || [(DDAction *)self result]
    && (_DDURLFromResult((uint64_t)[(DDAction *)self result]),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    id v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 3, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (void *)[objc_alloc(*(Class *)(*((void *)&v13 + 1) + 8 * i)) initWithURL:v3 result:self->super.super._result context:self->super.super._context];
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v7);
    }

    v11 = +[DDActionGroup groupWithActions:]((uint64_t)DDActionGroup, v4);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)sheetActions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(DDAction *)self url];
  if (v3
    || [(DDAction *)self result]
    && (_DDURLFromResult((uint64_t)[(DDAction *)self result]),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    id v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v16, 3, 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (void *)[objc_alloc(*(Class *)(*((void *)&v12 + 1) + 8 * i)) initWithURL:v3 result:self->super.super._result context:self->super.super._context];
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)commitURL
{
  v3 = self->super.super._url;
  if (!v3)
  {
    v4 = self->super.super._result;
    if (v4)
    {
      _DDURLFromResult((uint64_t)v4);
      v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  id v5 = [[DDTextMessageAction alloc] initWithURL:v3 result:self->super.super._result context:self->super.super._context];
  uint64_t v6 = [(DDTextMessageAction *)v5 notificationURL];

  return v6;
}

@end