@interface _IKDOMNodeEventListener
- (BOOL)isEnabled;
- (JSManagedValue)managedValue;
- (_IKDOMNodeEventListener)initWithListener:(id)a3 forNode:(id)a4;
- (id)value;
- (void)setEnabled:(BOOL)a3;
- (void)setManagedValue:(id)a3;
@end

@implementation _IKDOMNodeEventListener

- (_IKDOMNodeEventListener)initWithListener:(id)a3 forNode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_IKDOMNodeEventListener;
  v8 = [(_IKDOMNodeEventListener *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_enabled = 1;
    uint64_t v10 = [MEMORY[0x1E4F30928] managedValueWithValue:v6];
    managedValue = v9->_managedValue;
    v9->_managedValue = (JSManagedValue *)v10;

    v12 = [v6 context];
    v13 = [v12 virtualMachine];
    [v13 addManagedReference:v9->_managedValue withOwner:v7];
  }
  return v9;
}

- (id)value
{
  v2 = [(_IKDOMNodeEventListener *)self managedValue];
  v3 = [v2 value];

  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (JSManagedValue)managedValue
{
  return self->_managedValue;
}

- (void)setManagedValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end