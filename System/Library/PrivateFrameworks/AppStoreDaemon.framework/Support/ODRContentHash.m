@interface ODRContentHash
@end

@implementation ODRContentHash

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_hashValue, 0);
}

@end