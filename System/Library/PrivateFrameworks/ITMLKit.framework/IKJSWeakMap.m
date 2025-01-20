@interface IKJSWeakMap
- (IKJSWeakMap)initWithAppContext:(id)a3;
- (JSManagedValue)managedWeakMap;
- (OpaqueJSValue)valueRefForWeakKeyRef:(OpaqueJSValue *)a3;
- (id)_jsWeakMap;
- (id)valueForWeakKey:(id)a3;
- (void)setValue:(id)a3 forWeakKey:(id)a4;
@end

@implementation IKJSWeakMap

- (IKJSWeakMap)initWithAppContext:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IKJSWeakMap;
  v5 = [(IKJSObject *)&v14 initWithAppContext:v4];
  if (v5)
  {
    v6 = [v4 jsContext];
    v7 = [v6 objectForKeyedSubscript:@"WeakMap"];
    v8 = [v7 constructWithArguments:MEMORY[0x1E4F1CBF0]];

    v9 = (void *)MEMORY[0x1E4F30928];
    v10 = [v4 jsApp];
    uint64_t v11 = [v9 managedValueWithValue:v8 andOwner:v10];
    managedWeakMap = v5->_managedWeakMap;
    v5->_managedWeakMap = (JSManagedValue *)v11;
  }
  return v5;
}

- (void)setValue:(id)a3 forWeakKey:(id)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [(IKJSWeakMap *)self _jsWeakMap];
  v11[0] = v6;
  v11[1] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  id v10 = (id)[v8 invokeMethod:@"set" withArguments:v9];
}

- (id)valueForWeakKey:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(IKJSWeakMap *)self _jsWeakMap];
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  id v7 = [v5 invokeMethod:@"get" withArguments:v6];

  return v7;
}

- (OpaqueJSValue)valueRefForWeakKeyRef:(OpaqueJSValue *)a3
{
  v15[1] = *(JSValueRef *)MEMORY[0x1E4F143B8];
  v5 = [(IKJSObject *)self appContext];
  id v6 = [v5 jsContext];

  id v7 = (const OpaqueJSContext *)[v6 JSGlobalContextRef];
  v8 = [(IKJSWeakMap *)self _jsWeakMap];
  v9 = JSValueToObject(v7, (JSValueRef)[v8 JSValueRef], 0);

  id v10 = JSStringCreateWithCFString(@"get");
  Property = JSObjectGetProperty(v7, v9, v10, 0);
  v12 = JSValueToObject(v7, Property, 0);
  JSStringRelease(v10);
  v15[0] = a3;
  v13 = JSObjectCallAsFunction(v7, v12, v9, 1uLL, v15, 0);

  return v13;
}

- (id)_jsWeakMap
{
  v2 = [(IKJSWeakMap *)self managedWeakMap];
  v3 = [v2 value];

  return v3;
}

- (JSManagedValue)managedWeakMap
{
  return self->_managedWeakMap;
}

- (void).cxx_destruct
{
}

@end