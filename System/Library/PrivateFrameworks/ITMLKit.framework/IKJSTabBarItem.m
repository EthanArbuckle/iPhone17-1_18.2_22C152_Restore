@interface IKJSTabBarItem
- (IKAppNavigationController)navigationControllerDelegate;
- (IKJSNavigationDocument)navigationDocument;
- (IKJSTabBar)owner;
- (IKJSTabBarItem)initWithAppContext:(id)a3 identifier:(id)a4 navigationController:(id)a5 owner:(id)a6;
- (JSManagedValue)managedNavigationDocument;
- (JSManagedValue)managedSelf;
- (NSString)identifier;
- (id)asPrivateIKJSTabBarItem;
- (void)dealloc;
- (void)setManagedNavigationDocument:(id)a3;
- (void)setManagedSelf:(id)a3;
- (void)setOwner:(id)a3;
@end

@implementation IKJSTabBarItem

- (id)asPrivateIKJSTabBarItem
{
  if ([(IKJSTabBarItem *)self conformsToProtocol:&unk_1F3E53070]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (IKJSTabBarItem)initWithAppContext:(id)a3 identifier:(id)a4 navigationController:(id)a5 owner:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)IKJSTabBarItem;
  v14 = [(IKJSObject *)&v32 initWithAppContext:v10];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_navigationControllerDelegate, v12);
    v16 = [[IKJSNavigationDocument alloc] initWithAppContext:v10 navigationController:v12];
    navigationDocument = v15->_navigationDocument;
    v15->_navigationDocument = v16;

    objc_storeStrong((id *)&v15->_identifier, a4);
    objc_storeWeak((id *)&v15->_owner, v13);
    v18 = [v10 jsContext];
    v19 = (void *)MEMORY[0x1E4F30928];
    v20 = [MEMORY[0x1E4F30938] valueWithObject:v15 inContext:v18];
    uint64_t v21 = [v19 managedValueWithValue:v20];
    managedSelf = v15->_managedSelf;
    v15->_managedSelf = (JSManagedValue *)v21;

    v23 = [v18 virtualMachine];
    managedNavigationDocument = v15->_managedNavigationDocument;
    id WeakRetained = objc_loadWeakRetained((id *)&v15->_owner);
    [v23 addManagedReference:managedNavigationDocument withOwner:WeakRetained];

    v26 = (void *)MEMORY[0x1E4F30928];
    v27 = [MEMORY[0x1E4F30938] valueWithObject:v15->_navigationDocument inContext:v18];
    uint64_t v28 = [v26 managedValueWithValue:v27];
    v29 = v15->_managedNavigationDocument;
    v15->_managedNavigationDocument = (JSManagedValue *)v28;

    v30 = [v18 virtualMachine];
    [v30 addManagedReference:v15->_managedNavigationDocument withOwner:v15];
  }
  return v15;
}

- (void)dealloc
{
  v3 = [(IKJSObject *)self appContext];
  v4 = [v3 jsContext];
  v5 = [v4 virtualMachine];

  v6 = [(IKJSTabBarItem *)self managedNavigationDocument];
  [v5 removeManagedReference:v6 withOwner:self];

  v7 = [(IKJSTabBarItem *)self managedSelf];
  v8 = [(IKJSTabBarItem *)self owner];
  [v5 removeManagedReference:v7 withOwner:v8];

  v9.receiver = self;
  v9.super_class = (Class)IKJSTabBarItem;
  [(IKJSTabBarItem *)&v9 dealloc];
}

- (IKAppNavigationController)navigationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationControllerDelegate);
  return (IKAppNavigationController *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (IKJSNavigationDocument)navigationDocument
{
  return self->_navigationDocument;
}

- (JSManagedValue)managedNavigationDocument
{
  return self->_managedNavigationDocument;
}

- (void)setManagedNavigationDocument:(id)a3
{
}

- (JSManagedValue)managedSelf
{
  return self->_managedSelf;
}

- (void)setManagedSelf:(id)a3
{
}

- (IKJSTabBar)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (IKJSTabBar *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_managedSelf, 0);
  objc_storeStrong((id *)&self->_managedNavigationDocument, 0);
  objc_storeStrong((id *)&self->_navigationDocument, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_navigationControllerDelegate);
}

@end