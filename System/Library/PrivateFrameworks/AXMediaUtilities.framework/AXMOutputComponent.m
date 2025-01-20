@interface AXMOutputComponent
+ (BOOL)isSupported;
- (AXMOutputComponent)init;
- (BOOL)canHandleRequest:(id)a3;
- (id)description;
- (int64_t)componentState;
- (void)setComponentState:(int64_t)a3;
- (void)transitionToState:(int64_t)a3 completion:(id)a4;
@end

@implementation AXMOutputComponent

+ (BOOL)isSupported
{
  return 1;
}

- (AXMOutputComponent)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXMOutputComponent;
  result = [(AXMOutputComponent *)&v3 init];
  if (result) {
    result->_componentState = 0;
  }
  return result;
}

- (id)description
{
  unint64_t componentState = self->_componentState;
  if (componentState > 2) {
    v4 = &stru_1F0E72D10;
  }
  else {
    v4 = off_1E61176F0[componentState];
  }
  v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"%@<%p>: state:'%@'", v7, self, v4];

  return v8;
}

- (void)transitionToState:(int64_t)a3 completion:(id)a4
{
  v6 = (void (**)(void))a4;
  [(AXMOutputComponent *)self setComponentState:a3];
  v6[2]();
}

- (BOOL)canHandleRequest:(id)a3
{
  return 0;
}

- (int64_t)componentState
{
  return self->_componentState;
}

- (void)setComponentState:(int64_t)a3
{
  self->_unint64_t componentState = a3;
}

@end