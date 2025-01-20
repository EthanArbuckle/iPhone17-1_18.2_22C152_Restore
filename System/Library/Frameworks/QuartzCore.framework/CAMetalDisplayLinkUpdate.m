@interface CAMetalDisplayLinkUpdate
+ (CAMetalDisplayLinkUpdate)updateWithDrawable:(id)a3 targetTimestamp:(double)a4 targetPresentationTimestamp:(double)a5;
- (CFTimeInterval)targetPresentationTimestamp;
- (CFTimeInterval)targetTimestamp;
- (id)drawable;
- (void)dealloc;
@end

@implementation CAMetalDisplayLinkUpdate

- (CFTimeInterval)targetPresentationTimestamp
{
  return self->_targetPresentationTimestamp;
}

- (CFTimeInterval)targetTimestamp
{
  return self->_targetTimestamp;
}

- (id)drawable
{
  return self->_drawable;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)CAMetalDisplayLinkUpdate;
  [(CAMetalDisplayLinkUpdate *)&v3 dealloc];
}

+ (CAMetalDisplayLinkUpdate)updateWithDrawable:(id)a3 targetTimestamp:(double)a4 targetPresentationTimestamp:(double)a5
{
  v8 = objc_alloc_init(CAMetalDisplayLinkUpdate);
  if (v8)
  {
    v8->_drawable = (CAMetalDrawable *)a3;
    v8->_targetTimestamp = a4;
    v8->_targetPresentationTimestamp = a5;
  }

  return v8;
}

@end