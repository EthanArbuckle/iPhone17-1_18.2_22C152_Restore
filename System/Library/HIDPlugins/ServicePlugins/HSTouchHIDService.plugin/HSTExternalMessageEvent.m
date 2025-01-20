@interface HSTExternalMessageEvent
+ (const)hsClassName;
- (HSTExternalMessageEvent)initWithMessage:(id)a3;
- (NSData)message;
- (void)setMessage:(id)a3;
@end

@implementation HSTExternalMessageEvent

+ (const)hsClassName
{
  return (const CoderKey *)HSUtil::CoderKey::Literal<(char)72,(char)83,(char)84,(char)69,(char)120,(char)116,(char)101,(char)114,(char)110,(char)97,(char)108,(char)77,(char)101,(char)115,(char)115,(char)97,(char)103,(char)101,(char)69,(char)118,(char)101,(char)110,(char)116>::Key;
}

- (HSTExternalMessageEvent)initWithMessage:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HSTExternalMessageEvent;
  v6 = [(HSTEvent *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_message, a3);
    v8 = v7;
  }

  return v7;
}

- (NSData)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end