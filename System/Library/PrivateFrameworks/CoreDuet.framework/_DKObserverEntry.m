@interface _DKObserverEntry
@end

@implementation _DKObserverEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end