@interface CPLOutputToVoid
- (BOOL)isATTY;
- (BOOL)supportsEscapeSequences;
- (BOOL)usesColor;
- (char)printHeader;
- (int)outputFd;
- (int)remainingSpace;
- (void)setPrintHeader:(char)a3;
@end

@implementation CPLOutputToVoid

- (int)outputFd
{
  return -1;
}

- (BOOL)isATTY
{
  return 0;
}

- (BOOL)supportsEscapeSequences
{
  return 0;
}

- (BOOL)usesColor
{
  return 0;
}

- (int)remainingSpace
{
  return 0;
}

- (char)printHeader
{
  return self->_printHeader;
}

- (void)setPrintHeader:(char)a3
{
  self->_printHeader = a3;
}

@end