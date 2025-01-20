@interface BETextDocumentRequest
- (CGRect)_documentRect;
- (NSCopying)inputElementIdentifier;
- (UIWKDocumentRequest)backingDocumentRequest;
- (id)_initWithUIKitDocumentRequest:(id)a3;
- (id)_uikitDocumentRequest;
- (int64_t)granularityCount;
- (int64_t)options;
- (int64_t)surroundingGranularity;
- (void)setGranularityCount:(int64_t)a3;
- (void)setInputElementIdentifier:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setSurroundingGranularity:(int64_t)a3;
- (void)set_documentRect:(CGRect)a3;
@end

@implementation BETextDocumentRequest

- (id)_initWithUIKitDocumentRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BETextDocumentRequest;
  v6 = [(BETextDocumentRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backingDocumentRequest, a3);
  }

  return v7;
}

- (id)_uikitDocumentRequest
{
  return self->_backingDocumentRequest;
}

- (CGRect)_documentRect
{
  [(UIWKDocumentRequest *)self->_backingDocumentRequest documentRect];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)set_documentRect:(CGRect)a3
{
}

- (int64_t)options
{
  double v2 = [(BETextDocumentRequest *)self backingDocumentRequest];
  int64_t v3 = [v2 flags];

  return v3;
}

- (void)setOptions:(int64_t)a3
{
}

- (int64_t)surroundingGranularity
{
  return [(UIWKDocumentRequest *)self->_backingDocumentRequest surroundingGranularity];
}

- (void)setSurroundingGranularity:(int64_t)a3
{
}

- (int64_t)granularityCount
{
  return [(UIWKDocumentRequest *)self->_backingDocumentRequest granularityCount];
}

- (void)setGranularityCount:(int64_t)a3
{
}

- (NSCopying)inputElementIdentifier
{
  return (NSCopying *)[(UIWKDocumentRequest *)self->_backingDocumentRequest inputElementIdentifier];
}

- (void)setInputElementIdentifier:(id)a3
{
}

- (UIWKDocumentRequest)backingDocumentRequest
{
  return self->_backingDocumentRequest;
}

- (void).cxx_destruct
{
}

@end