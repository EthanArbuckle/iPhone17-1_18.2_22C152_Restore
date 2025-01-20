@interface PHASETapInterfaceImpl
+ (PHASETapInterfaceImpl)new;
- (PHASETapInterfaceImpl)init;
- (PHASETapInterfaceImpl)initWithTapRegistry:(id)a3;
- (PHASETapRegistry)tapRegistry;
@end

@implementation PHASETapInterfaceImpl

- (PHASETapInterfaceImpl)init
{
  return 0;
}

+ (PHASETapInterfaceImpl)new
{
  return 0;
}

- (PHASETapInterfaceImpl)initWithTapRegistry:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHASETapInterfaceImpl;
  v5 = [(PHASETapInterfaceImpl *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_tapRegistry, v4);
  }

  return v6;
}

- (PHASETapRegistry)tapRegistry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tapRegistry);

  return (PHASETapRegistry *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end