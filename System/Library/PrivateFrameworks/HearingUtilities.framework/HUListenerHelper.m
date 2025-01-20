@interface HUListenerHelper
+ (id)listenerHelperWithListener:(id)a3 andDelegate:(id)a4;
- (HUListenerHelper)initWithListener:(id)a3 andDelegate:(id)a4;
- (void)dealloc;
@end

@implementation HUListenerHelper

+ (id)listenerHelperWithListener:(id)a3 andDelegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_getAssociatedObject(v5, &HUListenerHelperKey);
  v7 = (HUListenerHelper *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = [[HUListenerHelper alloc] initWithListener:v5 andDelegate:v6];
    objc_setAssociatedObject(v5, &HUListenerHelperKey, v7, (void *)1);
  }

  return v7;
}

- (HUListenerHelper)initWithListener:(id)a3 andDelegate:(id)a4
{
  objc_initWeak(&location, a3);
  objc_initWeak(&v11, a4);
  v10.receiver = self;
  v10.super_class = (Class)HUListenerHelper;
  id v6 = [(HUListenerHelper *)&v10 init];
  if (v6)
  {
    id v7 = objc_loadWeakRetained(&location);
    v6->_listenerAddress = v7;

    id v8 = objc_loadWeakRetained(&v11);
    objc_storeWeak((id *)&v6->_delegate, v8);
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v6;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained removeListener:self->_listenerAddress];

  v4.receiver = self;
  v4.super_class = (Class)HUListenerHelper;
  [(HUListenerHelper *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end