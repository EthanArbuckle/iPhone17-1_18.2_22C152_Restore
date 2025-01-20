@interface HFCharacteristicValueTransaction
- (BOOL)loggerIsExternal;
- (HFCharacteristicValueTransaction)init;
- (HFMutableAggregatedCharacteristicReadPolicy)readPolicy;
- (HFUpdateLogger)logger;
- (NAFuture)commitFuture;
- (NSDictionary)actionSetErrorsKeyedByUUID;
- (NSError)actionsError;
- (NSError)overallReadError;
- (NSError)overallWriteError;
- (NSMutableArray)clientReasonsStack;
- (NSMutableDictionary)readFuturesKeyedByCharacteristicIdentifier;
- (NSMutableDictionary)writeFuturesKeyedByCharacteristicIdentifier;
- (NSMutableSet)actionSetsToExecute;
- (NSMutableSet)actionsToExecute;
- (NSMutableSet)characteristicsToRead;
- (NSMutableSet)writeCharacteristicRequests;
- (OS_dispatch_group)onFinishGroup;
- (id)executionErrorForActionSet:(id)a3;
- (void)setActionSetErrorsKeyedByUUID:(id)a3;
- (void)setActionSetsToExecute:(id)a3;
- (void)setActionsError:(id)a3;
- (void)setActionsToExecute:(id)a3;
- (void)setCharacteristicsToRead:(id)a3;
- (void)setClientReasonsStack:(id)a3;
- (void)setCommitFuture:(id)a3;
- (void)setLogger:(id)a3;
- (void)setLoggerIsExternal:(BOOL)a3;
- (void)setOnFinishGroup:(id)a3;
- (void)setOverallReadError:(id)a3;
- (void)setOverallWriteError:(id)a3;
- (void)setReadFuturesKeyedByCharacteristicIdentifier:(id)a3;
- (void)setReadPolicy:(id)a3;
- (void)setWriteCharacteristicRequests:(id)a3;
- (void)setWriteFuturesKeyedByCharacteristicIdentifier:(id)a3;
@end

@implementation HFCharacteristicValueTransaction

- (NSMutableSet)characteristicsToRead
{
  return self->_characteristicsToRead;
}

- (HFUpdateLogger)logger
{
  return self->_logger;
}

- (NSMutableDictionary)readFuturesKeyedByCharacteristicIdentifier
{
  return self->_readFuturesKeyedByCharacteristicIdentifier;
}

- (HFMutableAggregatedCharacteristicReadPolicy)readPolicy
{
  return self->_readPolicy;
}

- (NAFuture)commitFuture
{
  return self->_commitFuture;
}

- (NSMutableSet)writeCharacteristicRequests
{
  return self->_writeCharacteristicRequests;
}

- (NSMutableSet)actionsToExecute
{
  return self->_actionsToExecute;
}

- (NSMutableSet)actionSetsToExecute
{
  return self->_actionSetsToExecute;
}

- (OS_dispatch_group)onFinishGroup
{
  return self->_onFinishGroup;
}

- (void)setLoggerIsExternal:(BOOL)a3
{
  self->_loggerIsExternal = a3;
}

- (void)setLogger:(id)a3
{
}

- (HFCharacteristicValueTransaction)init
{
  v18[1] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)HFCharacteristicValueTransaction;
  v2 = [(HFCharacteristicValueTransaction *)&v17 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9C0] set];
    [(HFCharacteristicValueTransaction *)v2 setCharacteristicsToRead:v3];

    v4 = [MEMORY[0x263EFF9C0] set];
    [(HFCharacteristicValueTransaction *)v2 setWriteCharacteristicRequests:v4];

    v5 = [MEMORY[0x263EFF9C0] set];
    [(HFCharacteristicValueTransaction *)v2 setActionSetsToExecute:v5];

    v6 = [MEMORY[0x263EFF9C0] set];
    [(HFCharacteristicValueTransaction *)v2 setActionsToExecute:v6];

    v7 = [MEMORY[0x263EFF980] array];
    [(HFCharacteristicValueTransaction *)v2 setClientReasonsStack:v7];

    v8 = [MEMORY[0x263EFF9A0] dictionary];
    [(HFCharacteristicValueTransaction *)v2 setReadFuturesKeyedByCharacteristicIdentifier:v8];

    v9 = [MEMORY[0x263EFF9A0] dictionary];
    [(HFCharacteristicValueTransaction *)v2 setWriteFuturesKeyedByCharacteristicIdentifier:v9];

    id v10 = objc_alloc_init(MEMORY[0x263F58190]);
    [(HFCharacteristicValueTransaction *)v2 setCommitFuture:v10];

    dispatch_group_t v11 = dispatch_group_create();
    [(HFCharacteristicValueTransaction *)v2 setOnFinishGroup:v11];

    v12 = [HFMutableAggregatedCharacteristicReadPolicy alloc];
    v13 = objc_alloc_init(HFNotSupportedReadPolicy);
    v18[0] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    v15 = [(HFAggregatedCharacteristicReadPolicy *)v12 initWithPolicies:v14];
    [(HFCharacteristicValueTransaction *)v2 setReadPolicy:v15];
  }
  return v2;
}

- (void)setCharacteristicsToRead:(id)a3
{
}

- (void)setWriteFuturesKeyedByCharacteristicIdentifier:(id)a3
{
}

- (void)setWriteCharacteristicRequests:(id)a3
{
}

- (void)setReadPolicy:(id)a3
{
}

- (void)setReadFuturesKeyedByCharacteristicIdentifier:(id)a3
{
}

- (void)setOnFinishGroup:(id)a3
{
}

- (void)setCommitFuture:(id)a3
{
}

- (void)setClientReasonsStack:(id)a3
{
}

- (void)setActionsToExecute:(id)a3
{
}

- (void)setActionSetsToExecute:(id)a3
{
}

- (NSMutableArray)clientReasonsStack
{
  return self->_clientReasonsStack;
}

- (BOOL)loggerIsExternal
{
  return self->_loggerIsExternal;
}

- (void)setOverallReadError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_clientReasonsStack, 0);
  objc_storeStrong((id *)&self->_onFinishGroup, 0);
  objc_storeStrong((id *)&self->_commitFuture, 0);
  objc_storeStrong((id *)&self->_writeFuturesKeyedByCharacteristicIdentifier, 0);
  objc_storeStrong((id *)&self->_readFuturesKeyedByCharacteristicIdentifier, 0);
  objc_storeStrong((id *)&self->_overallWriteError, 0);
  objc_storeStrong((id *)&self->_overallReadError, 0);
  objc_storeStrong((id *)&self->_actionsError, 0);
  objc_storeStrong((id *)&self->_actionSetErrorsKeyedByUUID, 0);
  objc_storeStrong((id *)&self->_actionsToExecute, 0);
  objc_storeStrong((id *)&self->_actionSetsToExecute, 0);
  objc_storeStrong((id *)&self->_writeCharacteristicRequests, 0);
  objc_storeStrong((id *)&self->_characteristicsToRead, 0);
  objc_storeStrong((id *)&self->_readPolicy, 0);
}

- (id)executionErrorForActionSet:(id)a3
{
  v4 = [a3 uniqueIdentifier];
  if (v4)
  {
    v5 = [(HFCharacteristicValueTransaction *)self actionSetErrorsKeyedByUUID];
    v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)actionSetErrorsKeyedByUUID
{
  return self->_actionSetErrorsKeyedByUUID;
}

- (void)setActionSetErrorsKeyedByUUID:(id)a3
{
}

- (NSError)actionsError
{
  return self->_actionsError;
}

- (void)setActionsError:(id)a3
{
}

- (NSError)overallReadError
{
  return self->_overallReadError;
}

- (NSError)overallWriteError
{
  return self->_overallWriteError;
}

- (void)setOverallWriteError:(id)a3
{
}

- (NSMutableDictionary)writeFuturesKeyedByCharacteristicIdentifier
{
  return self->_writeFuturesKeyedByCharacteristicIdentifier;
}

@end