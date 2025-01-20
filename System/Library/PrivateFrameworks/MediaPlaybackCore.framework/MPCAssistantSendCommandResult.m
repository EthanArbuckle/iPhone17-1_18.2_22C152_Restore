@interface MPCAssistantSendCommandResult
- (MPCAssistantSendCommandResult)initWithCommandResult:(id)a3 error:(id)a4;
- (MPCAssistantSendCommandResult)initWithReturnStatuses:(id)a3 error:(id)a4;
- (MRCommandResult)commandResult;
- (NSArray)returnStatuses;
- (NSError)error;
- (NSNumber)devicesControlled;
- (void)setDevicesControlled:(id)a3;
@end

@implementation MPCAssistantSendCommandResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesControlled, 0);
  objc_storeStrong((id *)&self->_commandResult, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_returnStatuses, 0);
}

- (void)setDevicesControlled:(id)a3
{
}

- (NSNumber)devicesControlled
{
  return self->_devicesControlled;
}

- (MRCommandResult)commandResult
{
  return self->_commandResult;
}

- (NSError)error
{
  return self->_error;
}

- (NSArray)returnStatuses
{
  return self->_returnStatuses;
}

- (MPCAssistantSendCommandResult)initWithCommandResult:(id)a3 error:(id)a4
{
  NSArray *returnStatuses;
  uint64_t v12;
  MRCommandResult *commandResult;
  NSError *v14;
  void *error;
  void *v16;
  uint64_t v17;
  NSArray *v18;
  void *v20;
  uint64_t v21;
  NSError *v22;
  objc_super v23;

  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MPCAssistantSendCommandResult;
  v8 = [(MPCAssistantSendCommandResult *)&v23 init];
  if (!v8) {
    goto LABEL_11;
  }
  v9 = [v6 handlerReturnStatuses];
  uint64_t v10 = [v9 copy];
  returnStatuses = v8->_returnStatuses;
  v8->_returnStatuses = (NSArray *)v10;

  v12 = [v6 copy];
  commandResult = v8->_commandResult;
  v8->_commandResult = (MRCommandResult *)v12;

  if (v7)
  {
    v14 = (NSError *)v7;
LABEL_6:
    error = v8->_error;
    v8->_error = v14;
    goto LABEL_7;
  }
  if ([v6 sendError])
  {
    MPCAssistantCreateSendCommandError([v6 sendError]);
    v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v20 = [v6 error];

  if (!v20) {
    goto LABEL_8;
  }
  error = [v6 error];
  v21 = MPCAssistantWrapError(error);
  v22 = v8->_error;
  v8->_error = (NSError *)v21;

LABEL_7:
LABEL_8:
  v16 = [(NSArray *)v8->_returnStatuses msv_firstWhere:&__block_literal_global_18848];

  if (v8->_error && !v16)
  {
    v17 = [(NSArray *)v8->_returnStatuses arrayByAddingObject:&unk_26CC19020];
    v18 = v8->_returnStatuses;
    v8->_returnStatuses = (NSArray *)v17;
  }
LABEL_11:

  return v8;
}

BOOL __61__MPCAssistantSendCommandResult_initWithCommandResult_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 intValue] != 0;
}

- (MPCAssistantSendCommandResult)initWithReturnStatuses:(id)a3 error:(id)a4
{
  NSArray *returnStatuses;
  objc_super v12;

  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCAssistantSendCommandResult;
  v8 = [(MPCAssistantSendCommandResult *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    returnStatuses = v8->_returnStatuses;
    v8->_returnStatuses = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v8;
}

@end