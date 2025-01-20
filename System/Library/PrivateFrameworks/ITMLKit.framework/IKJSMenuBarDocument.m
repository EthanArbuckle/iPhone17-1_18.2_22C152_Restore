@interface IKJSMenuBarDocument
- (IKJSMenuBarDocumentAppBridge)appBridge;
- (id)_entityUniqueIdentifierForObject:(id)a3;
- (id)getDocument:(id)a3;
- (id)getSelectedItem;
- (void)setAppBridge:(id)a3;
- (void)setDocument:(id)a3 :(id)a4 :(id)a5;
- (void)setSelectedItem:(id)a3 :(id)a4;
@end

@implementation IKJSMenuBarDocument

- (id)getDocument:(id)a3
{
  v4 = [(IKJSMenuBarDocument *)self _entityUniqueIdentifierForObject:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
  v6 = [WeakRetained jsMenuBarDocument:self documentForEntityUniqueIdentifier:v4];

  v7 = [v6 jsDocument];

  return v7;
}

- (void)setDocument:(id)a3 :(id)a4 :(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = [(IKJSObject *)self appContext];
  v11 = [[IKAppDocument alloc] initWithAppContext:v10 document:v9 owner:self];

  if (v11)
  {
    v12 = [(IKJSMenuBarDocument *)self _entityUniqueIdentifierForObject:v14];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
    [WeakRetained jsMenuBarDocument:self setDocument:v11 forEntityUniqueIdentifier:v12 withOptions:v8];
  }
}

- (id)getSelectedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
  v4 = [WeakRetained selectedItemForJsMenuBarDocument:self];

  return v4;
}

- (void)setSelectedItem:(id)a3 :(id)a4
{
  id v6 = a4;
  id v8 = [(IKJSMenuBarDocument *)self _entityUniqueIdentifierForObject:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
  [WeakRetained jsMenuBarDocument:self setSelectedEntityUniqueIdentifier:v8 withOptions:v6];
}

- (id)_entityUniqueIdentifierForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 getAttribute:@"itmlID"];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v3 entityValueProvider];
      v4 = [v5 entityUniqueIdentifier];
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (IKJSMenuBarDocumentAppBridge)appBridge
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appBridge);
  return (IKJSMenuBarDocumentAppBridge *)WeakRetained;
}

- (void)setAppBridge:(id)a3
{
}

- (void).cxx_destruct
{
}

@end