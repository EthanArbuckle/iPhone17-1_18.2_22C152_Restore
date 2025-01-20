@interface CSUVisualGenerationTextEncoderV1Input
- (BOOL)shouldReturnMask;
- (NSString)string;
- (void)setShouldReturnMask:(BOOL)a3;
- (void)setString:(id)a3;
@end

@implementation CSUVisualGenerationTextEncoderV1Input

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (BOOL)shouldReturnMask
{
  return self->_shouldReturnMask;
}

- (void)setShouldReturnMask:(BOOL)a3
{
  self->_shouldReturnMask = a3;
}

- (void).cxx_destruct
{
}

@end