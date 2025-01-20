@interface RestoreBatchContext
@end

@implementation RestoreBatchContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetItems, 0);
  objc_storeStrong((id *)&self->_successfulItems, 0);
  objc_storeStrong((id *)&self->_softFailures, 0);
  objc_storeStrong((id *)&self->_remainingItemIDs, 0);
  objc_storeStrong((id *)&self->_itemMap, 0);
  objc_storeStrong((id *)&self->_hardFailures, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end