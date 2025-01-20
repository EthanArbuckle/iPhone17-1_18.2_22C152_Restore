@interface CXSetAllowUplinkAudioInjectionAction
+ (BOOL)supportsSecureCoding;
- (BOOL)willInject;
- (CXSetAllowUplinkAudioInjectionAction)initWithCallUUID:(id)a3 willInject:(BOOL)a4;
- (CXSetAllowUplinkAudioInjectionAction)initWithCoder:(id)a3;
- (id)customDescription;
- (id)sanitizedCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInject:(BOOL)a3;
- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4;
@end

@implementation CXSetAllowUplinkAudioInjectionAction

- (CXSetAllowUplinkAudioInjectionAction)initWithCallUUID:(id)a3 willInject:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  result = [(CXCallAction *)&v6 initWithCallUUID:a3];
  if (result) {
    result->_inject = a4;
  }
  return result;
}

- (id)customDescription
{
  v5.receiver = self;
  v5.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  v3 = [(CXCallAction *)&v5 customDescription];
  objc_msgSend(v3, "appendFormat:", @" willInject=%d", -[CXSetAllowUplinkAudioInjectionAction willInject](self, "willInject"));

  return v3;
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  id v6 = a3;
  [(CXAction *)&v7 updateCopy:v6 withZone:a4];
  objc_msgSend(v6, "setInject:", -[CXSetAllowUplinkAudioInjectionAction willInject](self, "willInject", v7.receiver, v7.super_class));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSetAllowUplinkAudioInjectionAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  objc_super v5 = [(CXCallAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = NSStringFromSelector(sel_willInject);
    v5->_inject = [v4 decodeBoolForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CXSetAllowUplinkAudioInjectionAction;
  id v4 = a3;
  [(CXCallAction *)&v7 encodeWithCoder:v4];
  BOOL v5 = [(CXSetAllowUplinkAudioInjectionAction *)self willInject];
  id v6 = NSStringFromSelector(sel_willInject);
  [v4 encodeBool:v5 forKey:v6];
}

- (BOOL)willInject
{
  return self->_inject;
}

- (void)setInject:(BOOL)a3
{
  self->_inject = a3;
}

@end