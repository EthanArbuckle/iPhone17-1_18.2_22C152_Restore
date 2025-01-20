@interface CNUIDefaultUserActionRecorder
- (CNUIDefaultUserActionRecorder)init;
- (CNUIDefaultUserActionRecorder)initWithRecentsLibrary:(id)a3 eventFactory:(id)a4;
- (CNUIDefaultUserActionRecorderEventFactory)eventFactory;
- (CRRecentContactsLibrary)library;
- (void)recordUserAction:(id)a3;
@end

@implementation CNUIDefaultUserActionRecorder

- (CNUIDefaultUserActionRecorder)init
{
  v3 = [MEMORY[0x263F37DB0] defaultInstance];
  v4 = objc_alloc_init(_CNUIDefaultUserActionRecorderEventFactory);
  v5 = [(CNUIDefaultUserActionRecorder *)self initWithRecentsLibrary:v3 eventFactory:v4];

  return v5;
}

- (CNUIDefaultUserActionRecorder)initWithRecentsLibrary:(id)a3 eventFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUIDefaultUserActionRecorder;
  v9 = [(CNUIDefaultUserActionRecorder *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeStrong((id *)&v10->_eventFactory, a4);
    v11 = v10;
  }

  return v10;
}

- (void)recordUserAction:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[CNUICoreLogProvider actions_os_log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v4;
    _os_log_impl(&dword_20B704000, v5, OS_LOG_TYPE_INFO, "[Default Action] Recording default action: %@", buf, 0xCu);
  }

  v6 = [v4 contactProperty];
  id v7 = [v6 contact];
  char v8 = [v7 hasBeenPersisted];

  if (v8)
  {
    v9 = [v4 associatedRecentContactMetadata];
    if (v9)
    {
      v10 = [v4 associatedRecentContactMetadata];
      v11 = [v10 mutableCopy];
    }
    else
    {
      v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    }

    v12 = [v4 type];
    objc_super v13 = [v11 objectForKeyedSubscript:v12];
    if (v13)
    {
      v14 = [v4 type];
      v15 = [v11 objectForKeyedSubscript:v14];
      v16 = (void *)[v15 mutableCopy];
    }
    else
    {
      v16 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    }

    v35[0] = @"date";
    v17 = NSNumber;
    v18 = [MEMORY[0x263EFF910] date];
    [v18 timeIntervalSinceReferenceDate];
    v19 = objc_msgSend(v17, "numberWithDouble:");
    v36[0] = v19;
    v35[1] = @"bundleIdentifier";
    uint64_t v20 = [v4 bundleIdentifier];
    v21 = (void *)v20;
    v22 = &stru_26BFC7668;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    v36[1] = v22;
    v23 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    v24 = [v4 contactProperty];
    v25 = [v24 identifier];
    [v16 setObject:v23 forKeyedSubscript:v25];

    v26 = [v4 type];
    [v11 setObject:v16 forKeyedSubscript:v26];

    v27 = [v4 contactProperty];
    v28 = CNUIUserActionRecentsAddressKindForContactProperty();

    v29 = [(CNUIDefaultUserActionRecorder *)self eventFactory];
    v30 = [v4 sanitizedTargetHandle];
    v31 = [v29 recentEventForAddress:v30 kind:v28 metadata:v11];

    v32 = [(CNUIDefaultUserActionRecorder *)self library];
    v34 = v31;
    v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
    [v32 recordContactEvents:v33 recentsDomain:@"CNUICRRecentsDomainContactDefaultAction" sendingAddress:0 completion:&__block_literal_global_40];
  }
  else
  {
    v11 = +[CNUICoreLogProvider actions_os_log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CNUIDefaultUserActionRecorder recordUserAction:](v4, v11);
    }
  }
}

void __50__CNUIDefaultUserActionRecorder_recordUserAction___block_invoke()
{
  id v0 = [MEMORY[0x263F087C8] defaultCenter];
  [v0 postNotificationName:@"com.apple.contacts.ContactsUICore.CNUIUserActionRecentsChangedNotification" object:0];
}

- (CRRecentContactsLibrary)library
{
  return self->_library;
}

- (CNUIDefaultUserActionRecorderEventFactory)eventFactory
{
  return self->_eventFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventFactory, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (void)recordUserAction:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = [a1 contactProperty];
  id v4 = [v3 contact];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_20B704000, a2, OS_LOG_TYPE_DEBUG, "[Default Action] Scratch that, contact has not been persisted %@", (uint8_t *)&v5, 0xCu);
}

@end