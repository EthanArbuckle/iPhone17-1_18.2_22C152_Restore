@interface BWSemanticStyleSetFencedAnimationInfo
+ (id)fencedAnimationInfoWithSemanticStyleSet:(id)a3 fencePortSendRight:(id)a4;
- (FigCaptureSemanticStyleSet)semanticStyleSet;
- (id)description;
- (void)dealloc;
@end

@implementation BWSemanticStyleSetFencedAnimationInfo

+ (id)fencedAnimationInfoWithSemanticStyleSet:(id)a3 fencePortSendRight:(id)a4
{
  v6 = [BWSemanticStyleSetFencedAnimationInfo alloc];
  if (v6)
  {
    v9.receiver = v6;
    v9.super_class = (Class)BWSemanticStyleSetFencedAnimationInfo;
    v7 = objc_msgSendSuper2(&v9, sel_initWithFencePortSendRight_, a4);
    if (v7) {
      v7[3] = [a3 copy];
    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSemanticStyleSetFencedAnimationInfo;
  [(BWFencedAnimationInfo *)&v3 dealloc];
}

- (id)description
{
  semanticStyleSet = self->_semanticStyleSet;
  v4.receiver = self;
  v4.super_class = (Class)BWSemanticStyleSetFencedAnimationInfo;
  return (id)[NSString stringWithFormat:@"BWSemanticStyleSetFencedAnimationInfo: { %@, %@ }", semanticStyleSet, -[BWFencedAnimationInfo description](&v4, sel_description)];
}

- (FigCaptureSemanticStyleSet)semanticStyleSet
{
  return self->_semanticStyleSet;
}

@end