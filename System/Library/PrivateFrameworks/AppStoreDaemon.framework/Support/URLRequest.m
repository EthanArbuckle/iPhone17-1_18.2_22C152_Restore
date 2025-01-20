@interface URLRequest
@end

@implementation URLRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestProperties, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end