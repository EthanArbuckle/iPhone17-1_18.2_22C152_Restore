@interface _GCCControllerManagerDescription
- (_GCCControllerManagerDescription)init;
- (_GCCControllerManagerDescription)initWithControllerManager:(id)a3;
- (id)materializeWithContext:(id)a3;
@end

@implementation _GCCControllerManagerDescription

- (_GCCControllerManagerDescription)initWithControllerManager:(id)a3
{
  v4 = [a3 identifier];
  v5 = [(_GCImplicitIPCObjectDescription *)self initWithIdentifier:v4];

  return v5;
}

- (_GCCControllerManagerDescription)init
{
  v3 = +[_GCControllerManager sharedInstance];
  v4 = [(_GCCControllerManagerDescription *)self initWithControllerManager:v3];

  return v4;
}

- (id)materializeWithContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_GCCControllerManagerDescription;
  v3 = [(_GCImplicitIPCObjectDescription *)&v5 materializeWithContext:a3];

  return v3;
}

@end