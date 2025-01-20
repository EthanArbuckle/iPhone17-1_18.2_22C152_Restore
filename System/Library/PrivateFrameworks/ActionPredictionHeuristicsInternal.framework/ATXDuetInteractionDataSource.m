@interface ATXDuetInteractionDataSource
- (ATXDuetInteractionDataSource)initWithDevice:(id)a3;
- (void)duetInteractionCountForHandles:(id)a3 sinceDate:(id)a4 callback:(id)a5;
@end

@implementation ATXDuetInteractionDataSource

- (ATXDuetInteractionDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXDuetInteractionDataSource;
  v6 = [(ATXDuetInteractionDataSource *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = v7;
  }

  return v7;
}

- (void)duetInteractionCountForHandles:(id)a3 sinceDate:(id)a4 callback:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void, id))a5;
  if (ATXHeuristicCanLearnFromApp(&unk_1F2727398))
  {
    objc_super v10 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    v11 = [MEMORY[0x1E4F5B400] storeWithDirectory:v10 readOnly:1];
    if (v11)
    {
      if (v8) {
        [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate > %@ AND ANY recipients.identifier IN %@", v8, v7];
      }
      else {
      v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.identifier IN %@", v7, v22];
      }
      v14 = NSNumber;
      id v23 = 0;
      uint64_t v15 = [v11 countInteractionsUsingPredicate:v13 error:&v23];
      id v16 = v23;
      v17 = [v14 numberWithUnsignedInteger:v15];
      v18 = __atxlog_handle_heuristic();
      v19 = v18;
      if (v16)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[ATXDuetInteractionDataSource duetInteractionCountForHandles:sinceDate:callback:]((uint64_t)v16, v19);
        }

        v9[2](v9, 0, v16);
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v17 unsignedIntegerValue];
          uint64_t v21 = [v7 count];
          *(_DWORD *)buf = 134218498;
          uint64_t v25 = v20;
          __int16 v26 = 2048;
          uint64_t v27 = v21;
          __int16 v28 = 2114;
          id v29 = v8;
          _os_log_impl(&dword_1D0F43000, v19, OS_LOG_TYPE_DEFAULT, "Got %tu interactions (direct and group interactions) from _CDInteractionStore for contact interaction with %tu handles. Since date: %{public}@", buf, 0x20u);
        }

        ((void (**)(id, void *, id))v9)[2](v9, v17, 0);
      }
    }
    else
    {
      v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:256 userInfo:0];
      v9[2](v9, 0, v13);
    }
  }
  else
  {
    v12 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v12, OS_LOG_TYPE_DEFAULT, "Learn from app turned off for Phone, Messages or Mail", buf, 2u);
    }

    v9[2](v9, 0, 0);
  }
}

- (void).cxx_destruct
{
}

- (void)duetInteractionCountForHandles:(uint64_t)a1 sinceDate:(NSObject *)a2 callback:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_ERROR, "Error querying _CDInteractionStore for count of interactions with contact. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end