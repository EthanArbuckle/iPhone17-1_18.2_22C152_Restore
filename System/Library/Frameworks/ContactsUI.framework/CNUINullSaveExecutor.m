@interface CNUINullSaveExecutor
- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4;
@end

@implementation CNUINullSaveExecutor

- (id)executeSaveWithConfiguration:(id)a3 saveDelegate:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = CNUILogContactCard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134349056;
    v12 = self;
    _os_log_impl(&dword_18B625000, v6, OS_LOG_TYPE_DEFAULT, "[CNUINullSaveExecutor] %{public}p will execute save…", (uint8_t *)&v11, 0xCu);
  }

  v7 = [CNUIContactSaveResult alloc];
  v8 = [v5 mutableContact];

  v9 = [(CNUIContactSaveResult *)v7 initWithSuccess:1 contact:v8 identifiersOfIssuedSaveRequests:MEMORY[0x1E4F1CBF0]];

  return v9;
}

@end