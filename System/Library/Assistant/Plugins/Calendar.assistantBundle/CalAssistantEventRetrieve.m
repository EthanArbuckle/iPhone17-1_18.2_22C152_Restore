@interface CalAssistantEventRetrieve
- (void)performWithCompletion:(id)a3;
@end

@implementation CalAssistantEventRetrieve

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  sub_234902DF4();
  v5 = (void *)qword_2687CDEB0;
  if (os_log_type_enabled((os_log_t)qword_2687CDEB0, OS_LOG_TYPE_DEBUG)) {
    sub_234905F3C(v5);
  }
  v6 = (void *)*MEMORY[0x263F28388];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28388], OS_LOG_TYPE_DEBUG)) {
    sub_234905E80(v6);
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v8 = (void *)MEMORY[0x263F04B98];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_234901C54;
  v13[3] = &unk_264BFA260;
  v13[4] = self;
  id v14 = v7;
  id v15 = v4;
  id v9 = v4;
  id v10 = v7;
  objc_msgSend__ca_performBlock_(v8, v11, (uint64_t)v13, v12);
}

@end