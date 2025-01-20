@interface MSSendEmail
+ (id)sendEmail:(id)a3 playSound:(BOOL)a4 completionBlock:(id)a5;
+ (id)sendEmail:(id)a3 playSound:(BOOL)a4 timeout:(double)a5 error:(id *)a6;
+ (id)sendMessageData:(id)a3 autosaveIdentifier:(id)a4 isHMEMessage:(BOOL)a5 sendLaterDate:(id)a6 completionBlock:(id)a7;
- (void)_sendEmail:(id)a3 playSound:(BOOL)a4 completionBlock:(id)a5;
- (void)_sendMessageData:(id)a3 autosaveIdentifier:(id)a4 isHMEMessage:(BOOL)a5 sendLaterDate:(id)a6 completionBlock:(id)a7;
- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5;
@end

@implementation MSSendEmail

+ (id)sendMessageData:(id)a3 autosaveIdentifier:(id)a4 isHMEMessage:(BOOL)a5 sendLaterDate:(id)a6 completionBlock:(id)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v15 = objc_alloc_init(MSSendEmail);
  [(MSSendEmail *)v15 _sendMessageData:v11 autosaveIdentifier:v12 isHMEMessage:v9 sendLaterDate:v13 completionBlock:v14];

  return v15;
}

+ (id)sendEmail:(id)a3 playSound:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = objc_alloc_init(MSSendEmail);
  [(MSSendEmail *)v9 _sendEmail:v7 playSound:v6 completionBlock:v8];

  return v9;
}

+ (id)sendEmail:(id)a3 playSound:(BOOL)a4 timeout:(double)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(MSSendEmail);
  id v11 = [MEMORY[0x263F3B398] promise];
  id v12 = [v11 completionHandlerAdapter];
  [(MSSendEmail *)v10 _sendEmail:v9 playSound:v8 completionBlock:v12];

  id v13 = [v11 future];
  id v14 = [v13 resultWithTimeout:a6 error:a5];

  if (!v14 && objc_msgSend(*a6, "ef_isTimeoutError"))
  {
    [(MSService *)v10 cancel];
    *a6 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"MailServices" code:1505 userInfo:0];
  }

  return v14;
}

- (void)_sendEmail:(id)a3 playSound:(BOOL)a4 completionBlock:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x2166BBAE0]();
  uint64_t v10 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  id v11 = (void *)v10;
  if (v10)
  {
    v16[0] = @"email";
    v16[1] = @"playSound";
    v17[0] = v10;
    v17[1] = MEMORY[0x263EFFA88];
    id v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__MSSendEmail__sendEmail_playSound_completionBlock___block_invoke;
    v14[3] = &unk_264242E08;
    id v15 = v8;
    [(MSService *)self _callServicesMethod:@"SendEmail" arguments:v12 callback:v14];
  }
  else
  {
    id v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = [0 length];
      _os_log_impl(&dword_215471000, v13, OS_LOG_TYPE_DEFAULT, "#Warning Unable to unarchive model data with length %lu", buf, 0xCu);
    }

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v12);
  }
}

void __52__MSSendEmail__sendEmail_playSound_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    BOOL v6 = [v7 objectForKey:@"messageid"];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_sendMessageData:(id)a3 autosaveIdentifier:(id)a4 isHMEMessage:(BOOL)a5 sendLaterDate:(id)a6 completionBlock:(id)a7
{
  BOOL v9 = a5;
  v27[2] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  if (!v13)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"MSSendEmail.m", 94, @"Invalid parameter not satisfying: %@", @"messageData" object file lineNumber description];
  }
  v17 = (void *)MEMORY[0x2166BBAE0]();
  id v18 = objc_alloc(MEMORY[0x263EFF9A0]);
  v26[0] = @"RFC822Data";
  v26[1] = @"HideMyEmailMessage";
  v27[0] = v13;
  uint64_t v19 = [NSNumber numberWithBool:v9];
  v27[1] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
  v21 = (void *)[v18 initWithDictionary:v20];

  objc_msgSend(v21, "ef_setOptionalObject:forKey:", v15, @"SendLaterDate");
  objc_msgSend(v21, "ef_setOptionalObject:forKey:", v14, @"autosaveIdentifier");
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __94__MSSendEmail__sendMessageData_autosaveIdentifier_isHMEMessage_sendLaterDate_completionBlock___block_invoke;
  v24[3] = &unk_264242E08;
  id v22 = v16;
  id v25 = v22;
  [(MSService *)self _callServicesMethod:@"MailSendMessage" arguments:v21 callback:v24];
}

void __94__MSSendEmail__sendMessageData_autosaveIdentifier_isHMEMessage_sendLaterDate_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v8)
  {
    BOOL v6 = [v8 objectForKey:@"success"];
    [v6 BOOLValue];

    id v7 = [v8 objectForKey:@"inAirplaneMode"];
    [v7 BOOLValue];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_simulateServicesMethod:(id)a3 arguments:(id)a4 callback:(id)a5
{
  v14[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, void))a5;
  if ([v8 isEqualToString:@"MailSendMessage"])
  {
    v13[0] = @"success";
    v13[1] = @"inAirplaneMode";
    v14[0] = &unk_26C6037F8;
    v14[1] = &unk_26C603810;
    id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    v10[2](v10, v11, 0);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)MSSendEmail;
    [(MSService *)&v12 _simulateServicesMethod:v8 arguments:v9 callback:v10];
  }
}

@end