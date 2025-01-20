@interface HSTCopyEvent
+ (const)hsClassName;
- (HIDEvent)matching;
- (HIDEvent)result;
- (HSTCopyEvent)initWithType:(unsigned int)a3 matching:(id)a4;
- (unsigned)type;
- (void)setMatching:(id)a3;
- (void)setResult:(id)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation HSTCopyEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)67,(char)111,(char)112,(char)121,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (HSTCopyEvent)initWithType:(unsigned int)a3 matching:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HSTCopyEvent;
  v8 = [(HSTEvent *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_matching, a4);
    v10 = v9;
  }

  return v9;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (HIDEvent)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
}

- (HIDEvent)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);

  objc_storeStrong((id *)&self->_matching, 0);
}

@end