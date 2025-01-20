@interface CalDAVPostAuditFailureTask
+ (id)_stringForReason:(unint64_t)a3;
- (CalDAVPostAuditFailureTask)initWithResourceURL:(id)a3 reason:(unint64_t)a4;
@end

@implementation CalDAVPostAuditFailureTask

- (CalDAVPostAuditFailureTask)initWithResourceURL:(id)a3 reason:(unint64_t)a4
{
  v6 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:1];
  v7 = [v6 queryItems];
  v8 = (void *)[v7 mutableCopy];
  v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  v11 = v10;

  v12 = [MEMORY[0x263F08BD0] queryItemWithName:@"action" value:@"audit-failure"];
  [v11 addObject:v12];

  v13 = (void *)MEMORY[0x263F08BD0];
  v14 = [(id)objc_opt_class() _stringForReason:a4];
  v15 = [v13 queryItemWithName:@"reason" value:v14];
  [v11 addObject:v15];

  [v6 setQueryItems:v11];
  v16 = [v6 URL];
  v19.receiver = self;
  v19.super_class = (Class)CalDAVPostAuditFailureTask;
  v17 = [(CoreDAVPostOrPutTask *)&v19 initWithURL:v16];

  return v17;
}

+ (id)_stringForReason:(unint64_t)a3
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x263EFF940], "exceptionWithName:reason:userInfo:", *MEMORY[0x263EFF4A0], @"Unexpected value for \"reason\" argument.", 0, v3, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return @"junk";
}

@end