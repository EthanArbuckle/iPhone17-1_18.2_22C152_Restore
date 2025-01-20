@interface ASOOverlayTransitionContext
+ (BOOL)supportsSecureCoding;
- (ASOOverlayTransitionContext)initWithCoder:(id)a3;
- (ASOOverlayTransitionContext)initWithStartFrame:(CGRect)a3 endFrame:(CGRect)a4;
- (CGRect)endFrame;
- (CGRect)endFrameInternal;
- (CGRect)startFrame;
- (CGRect)startFrameInternal;
- (NSMutableArray)animationBlocks;
- (void)addAnimationBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimationBlocks:(id)a3;
- (void)setEndFrame:(CGRect)a3;
- (void)setEndFrameInternal:(CGRect)a3;
- (void)setStartFrame:(CGRect)a3;
- (void)setStartFrameInternal:(CGRect)a3;
@end

@implementation ASOOverlayTransitionContext

- (ASOOverlayTransitionContext)initWithStartFrame:(CGRect)a3 endFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)ASOOverlayTransitionContext;
  v12 = [(ASOOverlayTransitionContext *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_startFrame.origin.CGFloat x = v11;
    v12->_startFrame.origin.CGFloat y = v10;
    v12->_startFrame.size.CGFloat width = v9;
    v12->_startFrame.size.CGFloat height = v8;
    v12->_endFrame.origin.CGFloat x = x;
    v12->_endFrame.origin.CGFloat y = y;
    v12->_endFrame.size.CGFloat width = width;
    v12->_endFrame.size.CGFloat height = height;
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    animationBlocks = v13->_animationBlocks;
    v13->_animationBlocks = v14;
  }
  return v13;
}

- (ASOOverlayTransitionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASOOverlayTransitionContext;
  v5 = [(ASOOverlayTransitionContext *)&v19 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ASOStoreOverlayPresentationStartFrameKey"];
    [v6 CGRectValue];
    v5->_startFrame.origin.CGFloat x = v7;
    v5->_startFrame.origin.CGFloat y = v8;
    v5->_startFrame.size.CGFloat width = v9;
    v5->_startFrame.size.CGFloat height = v10;

    CGFloat v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ASOStoreOverlayPresentationEndFrameKey"];
    [v11 CGRectValue];
    v5->_endFrame.origin.CGFloat x = v12;
    v5->_endFrame.origin.CGFloat y = v13;
    v5->_endFrame.size.CGFloat width = v14;
    v5->_endFrame.size.CGFloat height = v15;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    animationBlocks = v5->_animationBlocks;
    v5->_animationBlocks = v16;
  }
  return v5;
}

- (void)addAnimationBlock:(id)a3
{
  id v4 = a3;
  id v6 = [(ASOOverlayTransitionContext *)self animationBlocks];
  v5 = (void *)MEMORY[0x21D468EB0](v4);

  [v6 addObject:v5];
}

- (CGRect)startFrameInternal
{
  double x = self->_startFrame.origin.x;
  double y = self->_startFrame.origin.y;
  double width = self->_startFrame.size.width;
  double height = self->_startFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStartFrameInternal:(CGRect)a3
{
  self->_startFrame = a3;
}

- (CGRect)endFrameInternal
{
  double x = self->_endFrame.origin.x;
  double y = self->_endFrame.origin.y;
  double width = self->_endFrame.size.width;
  double height = self->_endFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEndFrameInternal:(CGRect)a3
{
  self->_endFrame = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08D40];
  double x = self->_startFrame.origin.x;
  double y = self->_startFrame.origin.y;
  double width = self->_startFrame.size.width;
  double height = self->_startFrame.size.height;
  id v9 = a3;
  CGFloat v10 = objc_msgSend(v4, "valueWithCGRect:", x, y, width, height);
  [v9 encodeObject:v10 forKey:@"ASOStoreOverlayPresentationStartFrameKey"];

  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", self->_endFrame.origin.x, self->_endFrame.origin.y, self->_endFrame.size.width, self->_endFrame.size.height);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v11 forKey:@"ASOStoreOverlayPresentationEndFrameKey"];
}

- (CGRect)startFrame
{
  double x = self->_startFrame.origin.x;
  double y = self->_startFrame.origin.y;
  double width = self->_startFrame.size.width;
  double height = self->_startFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStartFrame:(CGRect)a3
{
  self->_startFrame = a3;
}

- (CGRect)endFrame
{
  double x = self->_endFrame.origin.x;
  double y = self->_endFrame.origin.y;
  double width = self->_endFrame.size.width;
  double height = self->_endFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEndFrame:(CGRect)a3
{
  self->_endFrame = a3;
}

- (NSMutableArray)animationBlocks
{
  return self->_animationBlocks;
}

- (void)setAnimationBlocks:(id)a3
{
}

- (void).cxx_destruct
{
}

@end