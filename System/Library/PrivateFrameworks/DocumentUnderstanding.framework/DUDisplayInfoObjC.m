@interface DUDisplayInfoObjC
- (BOOL)isOnScreen;
- (CGPoint)absoluteOriginOnScreen;
- (CGRect)frameInWindow;
- (DUDisplayInfoObjC)init;
- (void)setAbsoluteOriginOnScreen:(CGPoint)a3;
- (void)setFrameInWindow:(CGRect)a3;
- (void)setIsOnScreen:(BOOL)a3;
@end

@implementation DUDisplayInfoObjC

- (void).cxx_destruct
{
}

- (void)setIsOnScreen:(BOOL)a3
{
  objc_msgSend_setIsOnScreen_(self->_underlying, a2, a3, v3, v4);
}

- (BOOL)isOnScreen
{
  return objc_msgSend_isOnScreen(self->_underlying, a2, v2, v3, v4);
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
  objc_msgSend_setAbsoluteOriginOnScreen_(self->_underlying, a2, v3, v4, v5, a3.x, a3.y);
}

- (CGPoint)absoluteOriginOnScreen
{
  objc_msgSend_absoluteOriginOnScreen(self->_underlying, a2, v2, v3, v4);
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  objc_msgSend_setFrameInWindow_(self->_underlying, a2, v3, v4, v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)frameInWindow
{
  objc_msgSend_frameInWindow(self->_underlying, a2, v2, v3, v4);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (DUDisplayInfoObjC)init
{
  v7.receiver = self;
  v7.super_class = (Class)DUDisplayInfoObjC;
  uint64_t v2 = [(DUDisplayInfoObjC *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(_TtC21DocumentUnderstanding13DUDisplayInfo);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    double v5 = v2;
  }

  return v2;
}

@end