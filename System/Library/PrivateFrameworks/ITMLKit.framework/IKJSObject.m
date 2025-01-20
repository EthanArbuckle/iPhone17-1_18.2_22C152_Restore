@interface IKJSObject
- (IKAppContext)appContext;
- (IKJSObject)init;
- (IKJSObject)initWithAppContext:(id)a3;
- (NSMutableDictionary)managedProperties;
- (id)invokeMethod:(id)a3 withArguments:(id)a4;
- (id)jsValueForProperty:(id)a3;
- (void)setJSValue:(id)a3 forProperty:(id)a4;
- (void)setManagedProperties:(id)a3;
@end

@implementation IKJSObject

- (IKJSObject)init
{
  return 0;
}

- (IKJSObject)initWithAppContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKJSObject;
  v5 = [(IKJSObject *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_appContext, v4);
  }

  return v6;
}

- (void)setJSValue:(id)a3 forProperty:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  v7 = [(IKJSObject *)self managedProperties];
  objc_super v8 = [v7 objectForKey:v6];

  if (v8)
  {
    v9 = [(IKJSObject *)self appContext];
    v10 = [v9 jsContext];
    v11 = [v10 virtualMachine];
    [v11 removeManagedReference:v8 withOwner:self];

    v12 = [(IKJSObject *)self managedProperties];
    [v12 removeObjectForKey:v6];
  }
  if (v20)
  {
    v13 = [(IKJSObject *)self managedProperties];

    if (!v13)
    {
      v14 = [MEMORY[0x1E4F1CA60] dictionary];
      [(IKJSObject *)self setManagedProperties:v14];
    }
    v15 = [MEMORY[0x1E4F30928] managedValueWithValue:v20];
    v16 = [(IKJSObject *)self appContext];
    v17 = [v16 jsContext];
    v18 = [v17 virtualMachine];
    [v18 addManagedReference:v15 withOwner:self];

    v19 = [(IKJSObject *)self managedProperties];
    [v19 setObject:v15 forKey:v6];
  }
}

- (id)jsValueForProperty:(id)a3
{
  id v4 = a3;
  v5 = [(IKJSObject *)self managedProperties];
  id v6 = [v5 objectForKey:v4];

  v7 = [v6 value];

  return v7;
}

- (id)invokeMethod:(id)a3 withArguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (void *)MEMORY[0x1E4F30938];
  v9 = [(IKJSObject *)self appContext];
  v10 = [v9 jsContext];
  v11 = [v8 valueWithObject:self inContext:v10];

  if ([v11 hasProperty:v6])
  {
    v12 = [v11 invokeMethod:v6 withArguments:v7];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F30938];
    v14 = [NSString stringWithFormat:@"invokeMethod: failed - Method [%@] not defined in [%@]", v6, objc_opt_class()];
    v15 = [(IKJSObject *)self appContext];
    v16 = [v15 jsContext];
    v12 = [v13 valueWithNewErrorFromMessage:v14 inContext:v16];
  }
  return v12;
}

- (IKAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (IKAppContext *)WeakRetained;
}

- (NSMutableDictionary)managedProperties
{
  return self->_managedProperties;
}

- (void)setManagedProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedProperties, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

@end