@interface BEKeyEntry
- (BOOL)isKeyRepeating;
- (UIKey)backingUIKey;
- (UIKey)key;
- (UIKeyEvent)backingKeyEvent;
- (double)timestamp;
- (id)_initWithUIKitKeyEvent:(id)a3;
- (id)_uikitKeyEvent;
- (int64_t)state;
- (int64_t)type;
@end

@implementation BEKeyEntry

- (id)_initWithUIKitKeyEvent:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BEKeyEntry;
  v6 = [(BEKeyEntry *)&v15 init];
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingKeyEvent, a3);
    id v8 = objc_alloc_init(MEMORY[0x263F82888]);
    id v9 = p_isa[2];
    p_isa[2] = v8;

    objc_msgSend(p_isa[2], "_setKeyCode:", objc_msgSend(v5, "keyCode"));
    id v10 = p_isa[2];
    v11 = [v5 characters];
    [v10 _setModifiedInput:v11];

    id v12 = p_isa[2];
    v13 = [v5 charactersIgnoringModifiers];
    [v12 _setUnmodifiedInput:v13];

    objc_msgSend(p_isa[2], "_setModifierFlags:", objc_msgSend(v5, "modifierFlags"));
  }

  return p_isa;
}

- (UIKey)key
{
  return self->_backingUIKey;
}

- (int64_t)type
{
  return [(UIKeyEvent *)self->_backingKeyEvent type];
}

- (int64_t)state
{
  return [(UIKeyEvent *)self->_backingKeyEvent type];
}

- (id)_uikitKeyEvent
{
  return self->_backingKeyEvent;
}

- (BOOL)isKeyRepeating
{
  return [(UIKeyEvent *)self->_backingKeyEvent isKeyRepeating];
}

- (double)timestamp
{
  [(UIKeyEvent *)self->_backingKeyEvent timestamp];
  return result;
}

- (UIKeyEvent)backingKeyEvent
{
  return self->_backingKeyEvent;
}

- (UIKey)backingUIKey
{
  return self->_backingUIKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingUIKey, 0);

  objc_storeStrong((id *)&self->_backingKeyEvent, 0);
}

@end