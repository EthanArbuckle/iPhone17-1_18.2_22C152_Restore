@interface CBSoftWakeAABCDelegate
+ (BOOL)isSupported;
- (BOOL)isActive;
- (CBSoftWakeAABCDelegate)init;
- (CustomCurve)curve;
- (int64_t)action:(int64_t)a3;
@end

@implementation CBSoftWakeAABCDelegate

- (BOOL)isActive
{
  return self->_state == 1;
}

+ (BOOL)isSupported
{
  return CBU_IsSoftWakeSupported();
}

- (CBSoftWakeAABCDelegate)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CBSoftWakeAABCDelegate;
  v6 = [(CBSoftWakeAABCDelegate *)&v4 init];
  if (v6)
  {
    long long v8 = xmmword_1BA60AEE0;
    long long v7 = xmmword_1BA60AEF0;
    createCustomCurve((const float *)&v8, (const float *)&v7, 4u, v3);
    memcpy(&v6->_curve, v3, sizeof(v6->_curve));
    v6->_state = 0;
  }
  return v6;
}

- (int64_t)action:(int64_t)a3
{
  if ((canTransition(self->_state, a3) & 1) == 0) {
    return 1;
  }
  self->_state = a3;
  return 0;
}

- (CustomCurve)curve
{
  return (CustomCurve *)memcpy(retstr, &self->_curve, sizeof(CustomCurve));
}

@end