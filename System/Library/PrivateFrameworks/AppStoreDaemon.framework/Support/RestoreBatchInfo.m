@interface RestoreBatchInfo
@end

@implementation RestoreBatchInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenFailures, 0);
  objc_storeStrong((id *)&self->_successes, 0);
  objc_storeStrong((id *)&self->_softFailures, 0);
  objc_storeStrong((id *)&self->_hardFailures, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end