@interface NSObject(FMAdditions)
- (_FMKeyValueObserverProxy)fm_addNotificationBlockObserverForObject:()FMAdditions keyPath:options:usingBlock:;
- (_FMNotificationObserverProxy)fm_addNotificationBlockObserverForName:()FMAdditions object:queue:usingBlock:;
- (id)fm_associatedObjectForDescriptor:()FMAdditions;
- (void)_fm_addNotificationObserverProxy:()FMAdditions;
- (void)_fm_removeNotificationObserverProxy:()FMAdditions;
- (void)fm_setAssociatedObject:()FMAdditions assocatedObjectDescriptor:;
@end

@implementation NSObject(FMAdditions)

- (_FMNotificationObserverProxy)fm_addNotificationBlockObserverForName:()FMAdditions object:queue:usingBlock:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, a1);
  v14 = [_FMNotificationObserverProxy alloc];
  id v15 = objc_loadWeakRetained(&location);
  v16 = [(_FMNotificationObserverProxy *)v14 initWithWeakObserver:v15 notificationName:v10 observerQueue:v12 observerBlock:v13];

  objc_msgSend(a1, "_fm_addNotificationObserverProxy:", v16);
  objc_destroyWeak(&location);

  return v16;
}

- (_FMKeyValueObserverProxy)fm_addNotificationBlockObserverForObject:()FMAdditions keyPath:options:usingBlock:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, a1);
  id v13 = [_FMKeyValueObserverProxy alloc];
  id v14 = objc_loadWeakRetained(&location);
  id v15 = [(_FMKeyValueObserverProxy *)v13 initWithWeakObserver:v14 observedObject:v10 keyPath:v11 options:a5 observerBlock:v12];

  objc_msgSend(a1, "_fm_addNotificationObserverProxy:", v15);
  objc_destroyWeak(&location);

  return v15;
}

- (void)fm_setAssociatedObject:()FMAdditions assocatedObjectDescriptor:
{
}

- (id)fm_associatedObjectForDescriptor:()FMAdditions
{
  return objc_getAssociatedObject(a1, *a3);
}

- (void)_fm_addNotificationObserverProxy:()FMAdditions
{
  id v6 = a3;
  v4 = objc_msgSend(a1, "fm_associatedObjectForDescriptor:", &sObserverProxiesAssociatedObject);
  v5 = (void *)[v4 mutableCopy];

  if (!v5)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
  }
  [v5 addObject:v6];
  objc_msgSend(a1, "fm_setAssociatedObject:assocatedObjectDescriptor:", v5, &sObserverProxiesAssociatedObject);
}

- (void)_fm_removeNotificationObserverProxy:()FMAdditions
{
  if (a3)
  {
    id v4 = a3;
    [v4 invalidate];
    v5 = objc_msgSend(a1, "fm_associatedObjectForDescriptor:", &sObserverProxiesAssociatedObject);
    id v6 = (id)[v5 mutableCopy];

    [v6 removeObject:v4];
    objc_msgSend(a1, "fm_setAssociatedObject:assocatedObjectDescriptor:", v6, &sObserverProxiesAssociatedObject);
  }
}

@end