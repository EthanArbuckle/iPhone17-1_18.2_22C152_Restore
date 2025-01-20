@interface CLKAssertionBlockSentinel
- (BOOL)isCalled;
- (BOOL)shouldBeFatal;
- (NSString)message;
- (id)fallbackBlock;
- (void)dealloc;
- (void)markCalled;
- (void)setCalled:(BOOL)a3;
- (void)setFallbackBlock:(id)a3;
- (void)setFatal:(BOOL)a3;
- (void)setMessage:(id)a3;
@end

@implementation CLKAssertionBlockSentinel

- (void)markCalled
{
  [*(id *)(a1 + 16) UTF8String];
  OUTLINED_FUNCTION_0(&dword_21C599000, v1, v2, "Calling completion handler more than once in %s.", v3, v4, v5, v6, 2u);
}

- (void)dealloc
{
  [*(id *)(a1 + 16) UTF8String];
  OUTLINED_FUNCTION_0(&dword_21C599000, v1, v2, "Failed to call completion handler in %s.", v3, v4, v5, v6, 2u);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (BOOL)isCalled
{
  return self->_called;
}

- (void)setCalled:(BOOL)a3
{
  self->_called = a3;
}

- (BOOL)shouldBeFatal
{
  return self->_fatal;
}

- (void)setFatal:(BOOL)a3
{
  self->_fatal = a3;
}

- (id)fallbackBlock
{
  return self->_fallbackBlock;
}

- (void)setFallbackBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackBlock, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end