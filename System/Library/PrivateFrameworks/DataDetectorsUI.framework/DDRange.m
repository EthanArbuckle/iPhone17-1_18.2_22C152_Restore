@interface DDRange
+ (id)rangeWithDOMRange:(id)a3;
- (DDRange)initWithDOMRange:(id)a3;
- (DOMNode)node;
- (id)description;
- (int64_t)endOffset;
- (int64_t)startOffset;
- (void)dealloc;
- (void)setEndOffset:(int64_t)a3;
- (void)setNode:(id)a3;
- (void)setStartOffset:(int64_t)a3;
@end

@implementation DDRange

- (DDRange)initWithDOMRange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DDRange;
  v5 = [(DDRange *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 startContainer];
    node = v5->_node;
    v5->_node = (DOMNode *)v6;

    v5->_startOffset = (int)[v4 startOffset];
    v5->_endOffset = (int)[v4 endOffset];
  }

  return v5;
}

+ (id)rangeWithDOMRange:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDOMRange:v4];

  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)DDRange;
  [(DDRange *)&v2 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<DDRange: %@ [%ld - %ld]>", self->_node, self->_startOffset, self->_endOffset];
}

- (DOMNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (int64_t)startOffset
{
  return self->_startOffset;
}

- (void)setStartOffset:(int64_t)a3
{
  self->_startOffset = a3;
}

- (int64_t)endOffset
{
  return self->_endOffset;
}

- (void)setEndOffset:(int64_t)a3
{
  self->_endOffset = a3;
}

- (void).cxx_destruct
{
}

@end