@interface _HDHealthServiceWriteOperation
@end

@implementation _HDHealthServiceWriteOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end