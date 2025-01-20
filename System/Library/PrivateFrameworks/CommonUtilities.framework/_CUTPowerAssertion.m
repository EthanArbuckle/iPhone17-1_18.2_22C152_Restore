@interface _CUTPowerAssertion
@end

@implementation _CUTPowerAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end