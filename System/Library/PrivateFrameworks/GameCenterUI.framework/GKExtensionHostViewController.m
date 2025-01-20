@interface GKExtensionHostViewController
- (GKExtensionHostViewControllerDelegate)delegate;
- (GKSocialGamingHostInterface)hostViewController;
- (NSMapTable)targetForSelector;
- (id)methodSignatureForProtocol:(id)a3 selector:(SEL)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)addTarget:(id)a3 forProtocol:(id)a4 toLookup:(id)a5;
- (void)buildLookupForHost:(id)a3;
- (void)extensionWillFinish;
- (void)finishExtension;
- (void)forwardInvocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setTargetForSelector:(id)a3;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation GKExtensionHostViewController

- (void)finishExtension
{
  id v2 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v2 finishExtension];
}

- (void)extensionWillFinish
{
  id v2 = [(GKExtensionHostViewController *)self hostViewController];
  [v2 extensionWillFinish];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v8 = a3;
  v4 = [(GKExtensionHostViewController *)self delegate];
  [v4 extensionDidTerminateWithError:v8];

  v5 = [(GKExtensionHostViewController *)self hostViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(GKExtensionHostViewController *)self hostViewController];
    [v7 extensionDidTerminateWithError:v8];
  }
}

- (void)addTarget:(id)a3 forProtocol:(id)a4 toLookup:(id)a5
{
  id v7 = a3;
  id v8 = (Protocol *)a4;
  id v9 = a5;
  if (v7)
  {
    unsigned int outCount = 0;
    v10 = protocol_copyMethodDescriptionList(v8, 1, 1, &outCount);
    v11 = v10;
    if (outCount)
    {
      unsigned int v12 = 0;
      p_name = &v10->name;
      do
      {
        v14 = NSStringFromSelector(*p_name);
        v15 = [v9 objectForKey:v14];

        if (!v15) {
          [v9 setObject:v7 forKey:v14];
        }

        ++v12;
        p_name += 2;
      }
      while (v12 < outCount);
    }
    free(v11);
    v16 = protocol_copyMethodDescriptionList(v8, 0, 1, &outCount);
    v17 = v16;
    if (outCount)
    {
      unsigned int v18 = 0;
      v19 = &v16->name;
      do
      {
        v20 = NSStringFromSelector(*v19);
        v21 = [v9 objectForKey:v20];

        if (!v21) {
          [v9 setObject:v7 forKey:v20];
        }

        ++v18;
        v19 += 2;
      }
      while (v18 < outCount);
    }
    free(v17);
  }
}

- (void)buildLookupForHost:(id)a3
{
  id v4 = a3;
  [(GKExtensionHostViewController *)self setHostViewController:v4];
  id v11 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  [(GKExtensionHostViewController *)self addTarget:v4 forProtocol:&unk_1F088A298 toLookup:v11];
  v5 = [(id)objc_opt_class() exportedInterface];
  char v6 = [v5 protocol];
  [(GKExtensionHostViewController *)self addTarget:v4 forProtocol:v6 toLookup:v11];

  id v7 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [(GKExtensionHostViewController *)self addTarget:v7 forProtocol:&unk_1F088A308 toLookup:v11];

  id v8 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  id v9 = [(id)objc_opt_class() serviceViewControllerInterface];
  v10 = [v9 protocol];
  [(GKExtensionHostViewController *)self addTarget:v8 forProtocol:v10 toLookup:v11];

  [(GKExtensionHostViewController *)self setTargetForSelector:v11];
}

- (id)methodSignatureForProtocol:(id)a3 selector:(SEL)a4
{
  v5 = (Protocol *)a3;
  objc_method_description MethodDescription = protocol_getMethodDescription(v5, a4, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name || (objc_method_description v8 = protocol_getMethodDescription(v5, a4, 0, 1), types = v8.types, v8.name))
  {
    id v9 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)GKExtensionHostViewController;
  v5 = -[GKExtensionHostViewController methodSignatureForSelector:](&v15, sel_methodSignatureForSelector_);
  if (!v5)
  {
    char v6 = NSStringFromSelector(a3);
    id v7 = [(GKExtensionHostViewController *)self targetForSelector];
    objc_method_description v8 = [v7 objectForKey:v6];

    id v9 = [(GKExtensionHostViewController *)self hostViewController];

    if (v8 == v9)
    {
      id v11 = [(id)objc_opt_class() exportedInterface];
    }
    else
    {
      v10 = [(_UIRemoteViewController *)self serviceViewControllerProxy];

      if (v8 != v10)
      {
        v5 = 0;
LABEL_8:

        goto LABEL_9;
      }
      id v11 = [(id)objc_opt_class() serviceViewControllerInterface];
    }
    unsigned int v12 = v11;
    v13 = [v11 protocol];
    v5 = [(GKExtensionHostViewController *)self methodSignatureForProtocol:v13 selector:a3];

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector((SEL)[v4 selector]);
  char v6 = [(GKExtensionHostViewController *)self targetForSelector];
  id v7 = [v6 objectForKey:v5];

  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:v7];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)GKExtensionHostViewController;
    [(GKExtensionHostViewController *)&v8 forwardInvocation:v4];
  }
}

- (GKExtensionHostViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKExtensionHostViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GKSocialGamingHostInterface)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (GKSocialGamingHostInterface *)WeakRetained;
}

- (void)setHostViewController:(id)a3
{
}

- (NSMapTable)targetForSelector
{
  return self->_targetForSelector;
}

- (void)setTargetForSelector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetForSelector, 0);
  objc_destroyWeak((id *)&self->_hostViewController);

  objc_destroyWeak((id *)&self->_delegate);
}

@end