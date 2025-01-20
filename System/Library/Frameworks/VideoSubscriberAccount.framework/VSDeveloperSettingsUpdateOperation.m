@interface VSDeveloperSettingsUpdateOperation
- (VSDeveloperServiceConnection)connection;
- (VSDeveloperSettings)settings;
- (VSDeveloperSettingsUpdateOperation)init;
- (VSDeveloperSettingsUpdateOperation)initWithSettings:(id)a3;
- (VSOptional)result;
- (void)executionDidBegin;
- (void)setConnection:(id)a3;
- (void)setResult:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation VSDeveloperSettingsUpdateOperation

- (VSDeveloperSettingsUpdateOperation)initWithSettings:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VSDeveloperSettingsUpdateOperation;
  v6 = [(VSDeveloperSettingsUpdateOperation *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v8 = objc_alloc_init(VSOptional);
    v9 = v7->_result;
    v7->_result = v8;
  }
  return v7;
}

- (VSDeveloperSettingsUpdateOperation)init
{
  return [(VSDeveloperSettingsUpdateOperation *)self initWithSettings:0];
}

- (VSDeveloperServiceConnection)connection
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_connection;
  if (!v3)
  {
    v3 = objc_alloc_init(VSDeveloperServiceConnection);
    objc_storeStrong((id *)&v2->_connection, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (void)executionDidBegin
{
  v3 = [(VSDeveloperSettingsUpdateOperation *)self settings];
  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Developer settings operation invoked with nil settings."];
  }
  v4 = [(VSDeveloperSettingsUpdateOperation *)self connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__VSDeveloperSettingsUpdateOperation_executionDidBegin__block_invoke;
  v7[3] = &unk_1E6BD28B0;
  v7[4] = self;
  id v5 = [v4 serviceWithErrorHandler:v7];

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The settingsOrNil parameter must not be nil."];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__VSDeveloperSettingsUpdateOperation_executionDidBegin__block_invoke_2;
  v6[3] = &unk_1E6BD28D8;
  v6[4] = self;
  [v5 updateDeveloperSettings:v3 completionHandler:v6];
}

uint64_t __55__VSDeveloperSettingsUpdateOperation_executionDidBegin__block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = +[VSFailable failableWithError:a2];
  id v5 = +[VSOptional optionalWithObject:v4];
  [v3 setResult:v5];

  v6 = *(void **)(a1 + 32);

  return [v6 finishExecutionIfPossible];
}

uint64_t __55__VSDeveloperSettingsUpdateOperation_executionDidBegin__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = +[VSOptional optionalWithObject:a2];
  [v3 setResult:v4];

  id v5 = *(void **)(a1 + 32);

  return [v5 finishExecutionIfPossible];
}

- (VSDeveloperSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (VSOptional)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end