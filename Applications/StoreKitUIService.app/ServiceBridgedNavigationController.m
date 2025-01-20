@interface ServiceBridgedNavigationController
+ (id)sharedController;
- (NSMutableArray)containerViewControllers;
- (ServiceBridgedNavigationController)init;
- (ServiceBridgedNavigationControllerProxy)proxyHandler;
- (ServiceBridgedNavigationItem)bridgedNavigationItem;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)topViewController;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)removeAllContainerViewControllers;
- (void)setContainerViewControllers:(id)a3;
- (void)setProxyHandler:(id)a3;
- (void)setupWithContainerViewController:(id)a3;
- (void)synchonrizeContinainerViewControllers;
@end

@implementation ServiceBridgedNavigationController

+ (id)sharedController
{
  if (qword_1000673A8 != -1) {
    dispatch_once(&qword_1000673A8, &stru_10004DB38);
  }
  v2 = (void *)qword_1000673A0;

  return v2;
}

- (ServiceBridgedNavigationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)ServiceBridgedNavigationController;
  v2 = [(ServiceBridgedNavigationController *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    containerViewControllers = v2->_containerViewControllers;
    v2->_containerViewControllers = v3;

    v5 = objc_alloc_init(ServiceBridgedNavigationItem);
    bridgedNavigationItem = v2->_bridgedNavigationItem;
    v2->_bridgedNavigationItem = v5;
  }
  return v2;
}

- (void)setupWithContainerViewController:(id)a3
{
  id v4 = a3;
  [(ServiceBridgedNavigationController *)self removeAllContainerViewControllers];
  id v5 = [(ServiceBridgedNavigationController *)self containerViewControllers];
  [v5 addObject:v4];
}

- (void)synchonrizeContinainerViewControllers
{
  v3 = [(ServiceBridgedNavigationController *)self containerViewControllers];
  id v4 = [v3 copy];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = [v10 parentViewController];

        if (!v11)
        {
          v12 = [(ServiceBridgedNavigationController *)self containerViewControllers];
          [v12 removeObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)removeAllContainerViewControllers
{
  id v2 = [(ServiceBridgedNavigationController *)self containerViewControllers];
  [v2 removeAllObjects];
}

- (id)topViewController
{
  id v2 = [(ServiceBridgedNavigationController *)self containerViewControllers];
  v3 = [v2 lastObject];

  return v3;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(ServiceBridgedNavigationController *)self containerViewControllers];
    [v6 addObject:v8];

    id v7 = [(ServiceBridgedNavigationController *)self proxyHandler];
    [v7 pushBridgedViewController:v8 animated:v4];
  }
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  if (v5
    && ([(ServiceBridgedNavigationController *)self containerViewControllers],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = (uint64_t)[v6 indexOfObject:v5],
        v6,
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    id v8 = [(ServiceBridgedNavigationController *)self containerViewControllers];
    v9 = (char *)[v8 count] - v7 - 1;

    v10 = [(ServiceBridgedNavigationController *)self containerViewControllers];
    [v10 removeObjectsInRange:v7 + 1, v9];
  }
  else
  {
    [(ServiceBridgedNavigationController *)self removeAllContainerViewControllers];
    uint64_t v7 = -1;
  }
  v11 = [(ServiceBridgedNavigationController *)self proxyHandler];
  [v11 popBridgedViewControllersToIndex:v7];

  return 0;
}

- (ServiceBridgedNavigationControllerProxy)proxyHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyHandler);

  return (ServiceBridgedNavigationControllerProxy *)WeakRetained;
}

- (void)setProxyHandler:(id)a3
{
}

- (ServiceBridgedNavigationItem)bridgedNavigationItem
{
  return self->_bridgedNavigationItem;
}

- (NSMutableArray)containerViewControllers
{
  return self->_containerViewControllers;
}

- (void)setContainerViewControllers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewControllers, 0);
  objc_storeStrong((id *)&self->_bridgedNavigationItem, 0);

  objc_destroyWeak((id *)&self->_proxyHandler);
}

@end