@interface ExpensiveNetworkEvaluator
@end

@implementation ExpensiveNetworkEvaluator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end