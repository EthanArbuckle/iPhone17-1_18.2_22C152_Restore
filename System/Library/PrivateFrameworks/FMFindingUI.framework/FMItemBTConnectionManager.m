@interface FMItemBTConnectionManager
- (void)applicationDidEnterBackground;
- (void)applicationWillEnterForeground;
- (void)dealloc;
@end

@implementation FMItemBTConnectionManager

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_name_object_, v4, *MEMORY[0x263F833B8], 0);

  id v6 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_name_object_, v4, *MEMORY[0x263F83330], 0);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for FMItemBTConnectionManager();
  [(FMConnectionManager *)&v7 dealloc];
}

- (void).cxx_destruct
{
}

- (void)applicationWillEnterForeground
{
}

- (void)applicationDidEnterBackground
{
}

@end