@interface GCKeyboardInput
- (BOOL)hasButton:(int64_t)a3;
- (BOOL)isAnyKeyPressed;
- (GCControllerButtonInput)buttonForKeyCode:(GCKeyCode)code;
- (GCKeyboardInput)initWithIdentifier:(id)a3;
- (GCKeyboardValueChangedHandler)keyChangedHandler;
- (id)keyChangedHandlerPrivate;
- (id)name;
- (void)_handleKeyboardEvent:(_DWORD *)a1;
- (void)handleKeyboardEvent:(id)a3;
- (void)setKeyChangedHandler:(GCKeyboardValueChangedHandler)keyChangedHandler;
- (void)setKeyChangedHandlerPrivate:(id)a3;
- (void)setKeyboardEventSource:(id)a3;
@end

@implementation GCKeyboardInput

- (GCKeyboardInput)initWithIdentifier:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)GCKeyboardInput;
  v3 = [(GCPhysicalInputProfile *)&v25 initWithIdentifier:a3];
  if (v3)
  {
    v4 = ::allCodes();
    uint64_t v5 = +[NSSet setWithArray:v4];
    allCodes = v3->_allCodes;
    v3->_allCodes = (NSSet *)v5;

    uint64_t v7 = 231;
    v8 = +[NSMutableArray arrayWithCapacity:231];
    do
    {
      v9 = +[NSNull null];
      [(NSArray *)v8 addObject:v9];

      --v7;
    }
    while (v7);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v21 + 1) + 8 * v14) longValue];
          memset(v19, 0, sizeof(v19));
          uint64_t v20 = 0;
          *(void *)&v19[0] = nameForKeyCode(v15);
          WORD4(v19[0]) = 257;
          v16 = [(GCPhysicalInputProfile *)v3 _keyboardButtonWithInfo:v19];
          [v16 setKeyCode:v15];
          [(NSArray *)v8 setObject:v16 atIndexedSubscript:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    keys = v3->_keys;
    v3->_keys = v8;

    v3->_numberOfKeysPressed = 0;
  }
  return v3;
}

- (id)name
{
  return @"Keyboard";
}

- (BOOL)hasButton:(int64_t)a3
{
  allCodes = self->_allCodes;
  v4 = +[NSNumber numberWithLong:a3];
  LOBYTE(allCodes) = [(NSSet *)allCodes containsObject:v4];

  return (char)allCodes;
}

- (BOOL)isAnyKeyPressed
{
  return self->_numberOfKeysPressed > 0;
}

- (GCControllerButtonInput)buttonForKeyCode:(GCKeyCode)code
{
  if (-[GCKeyboardInput hasButton:](self, "hasButton:"))
  {
    uint64_t v5 = [(NSArray *)self->_keys objectAtIndexedSubscript:code];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (GCControllerButtonInput *)v5;
}

- (GCKeyboardValueChangedHandler)keyChangedHandler
{
  return self->_keyChangedHandler;
}

- (void)setKeyChangedHandler:(GCKeyboardValueChangedHandler)keyChangedHandler
{
}

- (id)keyChangedHandlerPrivate
{
  return self->_keyChangedHandlerPrivate;
}

- (void)setKeyChangedHandlerPrivate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyChangedHandlerPrivate, 0);
  objc_storeStrong(&self->_keyChangedHandler, 0);
  objc_storeStrong(&self->_keyboardEventObservation, 0);
  objc_storeStrong((id *)&self->_allCodes, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)_handleKeyboardEvent:(_DWORD *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 usage];
    uint64_t v6 = [v4 down];
    if ([v4 usagePage] == 7
      && (v5 & 0x8000000000000000) == 0
      && [a1 hasButton:v5])
    {
      [a1 _receivedEvent];
      uint64_t v7 = [a1 buttonForKeyCode:v5];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = [a1 handlerQueue];
        *(float *)&double v9 = (float)v6;
        if ([v7 _setValue:v8 queue:v9])
        {
          int v10 = a1[168];
          if (v6) {
            int v11 = v10 + 1;
          }
          else {
            int v11 = v10 - 1;
          }
          a1[168] = v11 & ~(v11 >> 31);
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = __48__GCKeyboardInput_PubSub___handleKeyboardEvent___block_invoke;
          v12[3] = &unk_26D22CD18;
          v12[4] = a1;
          id v13 = v7;
          uint64_t v14 = v5;
          uint64_t v15 = v6;
          dispatch_async(v8, v12);
        }
      }
    }
  }
}

void __48__GCKeyboardInput_PubSub___handleKeyboardEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) valueDidChangeHandler];
  id v7 = (id)v2;
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
  }
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[86];
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    id v3 = *(void **)(a1 + 32);
  }
  uint64_t v5 = [v3 keyChangedHandlerPrivate];

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) keyChangedHandlerPrivate];
    ((void (**)(void, void, void, void, BOOL))v6)[2](v6, *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56) != 0);
  }
}

- (void)setKeyboardEventSource:(id)a3
{
  id keyboardEventObservation = self->_keyboardEventObservation;
  self->_id keyboardEventObservation = 0;
  id v5 = a3;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __50__GCKeyboardInput_PubSub__setKeyboardEventSource___block_invoke;
  v8[3] = &__block_descriptor_40_e28_v16__0____GCKeyboardEvent__8lu32l8;
  v8[4] = self;
  uint64_t v6 = [v5 observeKeyboardEvents:v8];

  id v7 = self->_keyboardEventObservation;
  self->_id keyboardEventObservation = v6;
}

void __50__GCKeyboardInput_PubSub__setKeyboardEventSource___block_invoke(uint64_t a1, void *a2)
{
}

- (void)handleKeyboardEvent:(id)a3
{
}

@end