@interface RequestThrottle
@end

@implementation RequestThrottle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_clock, 0);
}

@end