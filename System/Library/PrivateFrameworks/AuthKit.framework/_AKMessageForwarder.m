@interface _AKMessageForwarder
- (_AKMessageForwarder)initWithReceiver:(id)a3 strong:(BOOL)a4;
- (_AKMessageForwarder)initWithStrongReceiver:(id)a3;
- (_AKMessageForwarder)initWithWeakReceiver:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)activate;
@end

@implementation _AKMessageForwarder

- (_AKMessageForwarder)initWithReceiver:(id)a3 strong:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_AKMessageForwarder;
  v8 = [(_AKMessageForwarder *)&v11 init];
  v9 = v8;
  if (v8)
  {
    if (v4) {
      objc_storeStrong(&v8->_strongReceiver, a3);
    }
    else {
      objc_storeWeak(&v8->_weakReceiver, v7);
    }
  }

  return v9;
}

- (_AKMessageForwarder)initWithWeakReceiver:(id)a3
{
  return [(_AKMessageForwarder *)self initWithReceiver:a3 strong:0];
}

- (_AKMessageForwarder)initWithStrongReceiver:(id)a3
{
  return [(_AKMessageForwarder *)self initWithReceiver:a3 strong:1];
}

- (void)activate
{
  id v2 = [MEMORY[0x1E4F29268] currentConnection];
  [v2 setShouldHandleInvalidation:1];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  [(_AKMessageForwarder *)self activate];
  id WeakRetained = objc_loadWeakRetained(&self->_weakReceiver);
  v5 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = self->_strongReceiver;
  }
  id v6 = WeakRetained;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongReceiver, 0);

  objc_destroyWeak(&self->_weakReceiver);
}

@end