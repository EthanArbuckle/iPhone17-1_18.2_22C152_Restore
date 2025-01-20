@interface _GCKeyboardAndMouseEventSubject
- (NSArray)buttonEventObservers;
- (NSArray)digitizerEventObservers;
- (NSArray)keyboardEventObservers;
- (NSArray)pointerEventObservers;
- (NSArray)scrollEventObservers;
- (_GCKeyboardAndMouseEventSubject)init;
- (id)observeButtonEvents:(id)a3;
- (id)observeDigitizerEvents:(id)a3;
- (id)observeKeyboardEvents:(id)a3;
- (id)observePointerEvents:(id)a3;
- (id)observeScrollEvents:(id)a3;
- (void)addMaskAndPublishButtonEvent:(uint64_t)a3 atTimestamp:;
- (void)publishButtonEvent:(void *)a1;
- (void)publishDigitizerEvent:(void *)a1;
- (void)publishKeyboardEvent:(void *)a1;
- (void)publishPointerEvent:(void *)a1;
- (void)publishScrollEvent:(void *)a1;
- (void)removeMaskAndPublishButtonEvent:(uint64_t)a3 atTimestamp:;
- (void)setButtonEventObservers:(id)a3;
- (void)setDigitizerEventObservers:(id)a3;
- (void)setKeyboardEventObservers:(id)a3;
- (void)setPointerEventObservers:(id)a3;
- (void)setScrollEventObservers:(id)a3;
@end

@implementation _GCKeyboardAndMouseEventSubject

- (_GCKeyboardAndMouseEventSubject)init
{
  v14.receiver = self;
  v14.super_class = (Class)_GCKeyboardAndMouseEventSubject;
  v2 = [(_GCKeyboardAndMouseEventSubject *)&v14 init];
  uint64_t v3 = objc_opt_new();
  buttonEventObservers = v2->_buttonEventObservers;
  v2->_buttonEventObservers = (NSArray *)v3;

  uint64_t v5 = objc_opt_new();
  keyboardEventObservers = v2->_keyboardEventObservers;
  v2->_keyboardEventObservers = (NSArray *)v5;

  uint64_t v7 = objc_opt_new();
  scrollEventObservers = v2->_scrollEventObservers;
  v2->_scrollEventObservers = (NSArray *)v7;

  uint64_t v9 = objc_opt_new();
  digitizerEventObservers = v2->_digitizerEventObservers;
  v2->_digitizerEventObservers = (NSArray *)v9;

  uint64_t v11 = objc_opt_new();
  pointerEventObservers = v2->_pointerEventObservers;
  v2->_pointerEventObservers = (NSArray *)v11;

  return v2;
}

- (NSArray)buttonEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setButtonEventObservers:(id)a3
{
}

- (NSArray)keyboardEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeyboardEventObservers:(id)a3
{
}

- (NSArray)scrollEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScrollEventObservers:(id)a3
{
}

- (NSArray)digitizerEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDigitizerEventObservers:(id)a3
{
}

- (NSArray)pointerEventObservers
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPointerEventObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerEventObservers, 0);
  objc_storeStrong((id *)&self->_digitizerEventObservers, 0);
  objc_storeStrong((id *)&self->_scrollEventObservers, 0);
  objc_storeStrong((id *)&self->_keyboardEventObservers, 0);

  objc_storeStrong((id *)&self->_buttonEventObservers, 0);
}

- (void)publishButtonEvent:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    a1[1] = [v3 mask];
    uint64_t v5 = objc_getProperty(a1, sel_buttonEventObservers, 16, 1);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9++) + 16))();
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)addMaskAndPublishButtonEvent:(uint64_t)a3 atTimestamp:
{
  if (a1)
  {
    id v6 = (id)objc_opt_new();
    [v6 setTimestamp:a3];
    [v6 setMask:a1[1] | a2];
    -[_GCKeyboardAndMouseEventSubject publishButtonEvent:](a1, v6);
  }
}

- (void)removeMaskAndPublishButtonEvent:(uint64_t)a3 atTimestamp:
{
  if (a1)
  {
    id v6 = (id)objc_opt_new();
    [v6 setTimestamp:a3];
    [v6 setMask:a1[1] & ~a2];
    -[_GCKeyboardAndMouseEventSubject publishButtonEvent:](a1, v6);
  }
}

- (id)observeButtonEvents:(id)a3
{
  v4 = (void *)[a3 copy];
  uint64_t v5 = [(_GCKeyboardAndMouseEventSubject *)self buttonEventObservers];
  id v6 = (void *)MEMORY[0x223C6E420](v4);
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    do
    {
      uint64_t v8 = [(_GCKeyboardAndMouseEventSubject *)self buttonEventObservers];
      uint64_t v9 = (void *)[v8 mutableCopy];

      long long v10 = (void *)MEMORY[0x223C6E420](v4);
      [v9 addObject:v10];

      [(_GCKeyboardAndMouseEventSubject *)self setButtonEventObservers:v9];
      long long v11 = [(_GCKeyboardAndMouseEventSubject *)self buttonEventObservers];
      long long v12 = (void *)MEMORY[0x223C6E420](v4);
      int v13 = [v11 containsObject:v12];
    }
    while (!v13);
  }
  objc_super v14 = [_GCObservation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __63___GCKeyboardAndMouseEventSubject_Button__observeButtonEvents___block_invoke;
  v18[3] = &unk_26D22A870;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  v16 = [(_GCObservation *)v14 initWithCleanupHandler:v18];

  return v16;
}

- (void)publishKeyboardEvent:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = objc_getProperty(a1, sel_keyboardEventObservers, 24, 1);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)observeKeyboardEvents:(id)a3
{
  v4 = (void *)[a3 copy];
  uint64_t v5 = [(_GCKeyboardAndMouseEventSubject *)self keyboardEventObservers];
  uint64_t v6 = (void *)MEMORY[0x223C6E420](v4);
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    do
    {
      uint64_t v8 = [(_GCKeyboardAndMouseEventSubject *)self keyboardEventObservers];
      long long v9 = (void *)[v8 mutableCopy];

      long long v10 = (void *)MEMORY[0x223C6E420](v4);
      [v9 addObject:v10];

      [(_GCKeyboardAndMouseEventSubject *)self setKeyboardEventObservers:v9];
      long long v11 = [(_GCKeyboardAndMouseEventSubject *)self keyboardEventObservers];
      long long v12 = (void *)MEMORY[0x223C6E420](v4);
      int v13 = [v11 containsObject:v12];
    }
    while (!v13);
  }
  objc_super v14 = [_GCObservation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __67___GCKeyboardAndMouseEventSubject_Keyboard__observeKeyboardEvents___block_invoke;
  v18[3] = &unk_26D22A870;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  v16 = [(_GCObservation *)v14 initWithCleanupHandler:v18];

  return v16;
}

- (void)publishScrollEvent:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = objc_getProperty(a1, sel_scrollEventObservers, 32, 1);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)observeScrollEvents:(id)a3
{
  v4 = (void *)[a3 copy];
  uint64_t v5 = [(_GCKeyboardAndMouseEventSubject *)self scrollEventObservers];
  uint64_t v6 = (void *)MEMORY[0x223C6E420](v4);
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    do
    {
      uint64_t v8 = [(_GCKeyboardAndMouseEventSubject *)self scrollEventObservers];
      long long v9 = (void *)[v8 mutableCopy];

      long long v10 = (void *)MEMORY[0x223C6E420](v4);
      [v9 addObject:v10];

      [(_GCKeyboardAndMouseEventSubject *)self setScrollEventObservers:v9];
      long long v11 = [(_GCKeyboardAndMouseEventSubject *)self scrollEventObservers];
      long long v12 = (void *)MEMORY[0x223C6E420](v4);
      int v13 = [v11 containsObject:v12];
    }
    while (!v13);
  }
  objc_super v14 = [_GCObservation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __63___GCKeyboardAndMouseEventSubject_Scroll__observeScrollEvents___block_invoke;
  v18[3] = &unk_26D22A870;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  v16 = [(_GCObservation *)v14 initWithCleanupHandler:v18];

  return v16;
}

- (void)publishDigitizerEvent:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = objc_getProperty(a1, sel_digitizerEventObservers, 40, 1);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)observeDigitizerEvents:(id)a3
{
  v4 = (void *)[a3 copy];
  uint64_t v5 = [(_GCKeyboardAndMouseEventSubject *)self digitizerEventObservers];
  uint64_t v6 = (void *)MEMORY[0x223C6E420](v4);
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    do
    {
      uint64_t v8 = [(_GCKeyboardAndMouseEventSubject *)self digitizerEventObservers];
      long long v9 = (void *)[v8 mutableCopy];

      long long v10 = (void *)MEMORY[0x223C6E420](v4);
      [v9 addObject:v10];

      [(_GCKeyboardAndMouseEventSubject *)self setDigitizerEventObservers:v9];
      long long v11 = [(_GCKeyboardAndMouseEventSubject *)self digitizerEventObservers];
      long long v12 = (void *)MEMORY[0x223C6E420](v4);
      int v13 = [v11 containsObject:v12];
    }
    while (!v13);
  }
  objc_super v14 = [_GCObservation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __69___GCKeyboardAndMouseEventSubject_Digitizer__observeDigitizerEvents___block_invoke;
  v18[3] = &unk_26D22A870;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  v16 = [(_GCObservation *)v14 initWithCleanupHandler:v18];

  return v16;
}

- (void)publishPointerEvent:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = objc_getProperty(a1, sel_pointerEventObservers, 48, 1);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8++) + 16))();
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)observePointerEvents:(id)a3
{
  v4 = (void *)[a3 copy];
  uint64_t v5 = [(_GCKeyboardAndMouseEventSubject *)self pointerEventObservers];
  uint64_t v6 = (void *)MEMORY[0x223C6E420](v4);
  char v7 = [v5 containsObject:v6];

  if ((v7 & 1) == 0)
  {
    do
    {
      uint64_t v8 = [(_GCKeyboardAndMouseEventSubject *)self pointerEventObservers];
      long long v9 = (void *)[v8 mutableCopy];

      long long v10 = (void *)MEMORY[0x223C6E420](v4);
      [v9 addObject:v10];

      [(_GCKeyboardAndMouseEventSubject *)self setPointerEventObservers:v9];
      long long v11 = [(_GCKeyboardAndMouseEventSubject *)self pointerEventObservers];
      long long v12 = (void *)MEMORY[0x223C6E420](v4);
      int v13 = [v11 containsObject:v12];
    }
    while (!v13);
  }
  objc_super v14 = [_GCObservation alloc];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __65___GCKeyboardAndMouseEventSubject_Pointer__observePointerEvents___block_invoke;
  v18[3] = &unk_26D22A870;
  v18[4] = self;
  id v19 = v4;
  id v15 = v4;
  v16 = [(_GCObservation *)v14 initWithCleanupHandler:v18];

  return v16;
}

@end