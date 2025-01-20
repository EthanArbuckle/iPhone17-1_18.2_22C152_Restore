@interface GAXPathContext
- (CGPath)lastSeenCGPath;
- (GAXPathContext)initWithLastSeenCGPath:(CGPath *)a3;
- (void)dealloc;
- (void)linePointsContexts;
- (void)linePointsIndicesPerElementIndices;
@end

@implementation GAXPathContext

- (GAXPathContext)initWithLastSeenCGPath:(CGPath *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GAXPathContext;
  v4 = [(GAXPathContext *)&v6 init];
  if (v4)
  {
    if (a3)
    {
      v4->_lastSeenCGPath = CGPathRetain(a3);
      v4->_linePointsContexts = (void *)AXCArrayCreate();
      v4->_linePointsIndicesPerElementIndices = (void *)AXCArrayCreate();
    }
    if (!v4->_lastSeenCGPath || !v4->_linePointsContexts || !v4->_linePointsIndicesPerElementIndices)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  lastSeenCGPath = self->_lastSeenCGPath;
  if (lastSeenCGPath) {
    CGPathRelease(lastSeenCGPath);
  }
  linePointsContexts = self->_linePointsContexts;
  if (linePointsContexts) {
    CFRelease(linePointsContexts);
  }
  linePointsIndicesPerElementIndices = self->_linePointsIndicesPerElementIndices;
  if (linePointsIndicesPerElementIndices) {
    CFRelease(linePointsIndicesPerElementIndices);
  }
  v6.receiver = self;
  v6.super_class = (Class)GAXPathContext;
  [(GAXPathContext *)&v6 dealloc];
}

- (CGPath)lastSeenCGPath
{
  return self->_lastSeenCGPath;
}

- (void)linePointsContexts
{
  return self->_linePointsContexts;
}

- (void)linePointsIndicesPerElementIndices
{
  return self->_linePointsIndicesPerElementIndices;
}

@end