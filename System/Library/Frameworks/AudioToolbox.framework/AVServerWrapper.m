@interface AVServerWrapper
- (AVHapticServerInstance)serverInstance;
- (AVServerWrapper)initWithServerInstance:(id)a3;
- (BOOL)contains:(id)a3;
@end

@implementation AVServerWrapper

- (void).cxx_destruct
{
}

- (AVHapticServerInstance)serverInstance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverInstance);

  return (AVHapticServerInstance *)WeakRetained;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  id v5 = [(AVServerWrapper *)self serverInstance];
  LOBYTE(self) = v5 == v4;

  return (char)self;
}

- (AVServerWrapper)initWithServerInstance:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVServerWrapper;
  id v5 = [(AVServerWrapper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_serverInstance, v4);
  }

  return v6;
}

@end