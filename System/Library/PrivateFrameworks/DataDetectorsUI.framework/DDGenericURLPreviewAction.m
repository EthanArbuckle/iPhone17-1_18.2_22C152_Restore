@interface DDGenericURLPreviewAction
+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4;
- (id)commitURL;
- (id)menuActions;
@end

@implementation DDGenericURLPreviewAction

+ (BOOL)handlesUrl:(id)a3 result:(__DDResult *)a4
{
  id v5 = a3;
  if (v5
    || _DDResultIsURL((uint64_t)a4)
    && (_DDURLFromResult((uint64_t)a4), (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = [v5 scheme];
    v7 = [v6 lowercaseString];
    if ([v7 isEqualToString:@"upi"]) {
      LOBYTE(v8) = 0;
    }
    else {
      int v8 = dd_urlLooksSuspicious(v5) ^ 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)menuActions
{
  v3 = [(DDAction *)self url];
  if (v3
    || [(DDAction *)self result]
    && (_DDURLFromResult((uint64_t)[(DDAction *)self result]),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    p_result = &self->super.super._result;
    p_context = &self->super.super._context;
    if (+[DDTextMessageAction isShowMessageURL:v3])
    {
      v7 = [[DDTextMessageAction alloc] initWithURL:v3 result:self->super.super._result context:self->super.super._context];
      int v8 = off_1E5A84DA0;
    }
    else
    {
      v10 = +[DDAction actionsWithURL:v3 result:self->super.super._result context:self->super.super._context];
      [v4 addObjectsFromArray:v10];

      v7 = [[DDCopyAction alloc] initWithURL:v3 result:*p_result context:*p_context];
      int v8 = off_1E5A84E00;
    }
    [v4 addObject:v7];

    v11 = (void *)[objc_alloc(*v8) initWithURL:v3 result:*p_result context:*p_context];
    [v4 addObject:v11];

    v9 = +[DDActionGroup groupWithActions:]((uint64_t)DDActionGroup, v4);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)commitURL
{
  v3 = self->super.super._url;
  if (!v3)
  {
    v3 = (NSURL *)self->super.super._result;
    if (v3)
    {
      _DDURLFromResult((uint64_t)v3);
      v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

@end