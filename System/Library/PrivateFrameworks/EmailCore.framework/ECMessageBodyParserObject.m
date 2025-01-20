@interface ECMessageBodyParserObject
- (BOOL)shouldProceedParsing;
- (double)timeoutInterval;
- (void)abortParsing;
- (void)messageBodyParserWillBeginParsing:(id)a3;
- (void)setTimeoutInterval:(double)a3;
@end

@implementation ECMessageBodyParserObject

- (void)messageBodyParserWillBeginParsing:(id)a3
{
  [(ECMessageBodyParserObject *)self timeoutInterval];
  double v5 = v4;
  double v6 = 0.0;
  if (v5 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", 0.0);
    double v6 = v5 + v7;
  }
  self->_timeoutTime = v6;
}

- (void)abortParsing
{
  self->_shouldAbort = 1;
}

- (BOOL)shouldProceedParsing
{
  if (self->_timeoutTime > 0.0 && !self->_didTimeout)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    if (v3 > self->_timeoutTime) {
      self->_didTimeout = 1;
    }
  }
  return !self->_shouldAbort && !self->_didTimeout;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

@end