@interface AVEventManagerSelectorAction
- (AVEventManagerSelectorAction)initWithTarget:(id)a3 selector:(SEL)a4 event:(id)a5;
- (BOOL)hasMatchingTarget:(id)a3 withSelector:(SEL)a4 forEvent:(id)a5;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)sendAction:(id)a3;
@end

@implementation AVEventManagerSelectorAction

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AVEventManagerSelectorAction *)a3;
  if (v4 == self)
  {
    BOOL isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v12.receiver = self;
      v12.super_class = (Class)AVEventManagerSelectorAction;
      if ([(AVEventManagerAction *)&v12 isEqual:v5])
      {
        id WeakRetained = objc_loadWeakRetained(&self->_target);
        id v7 = objc_loadWeakRetained(&v5->_target);
        if (WeakRetained == v7)
        {
          if (self->_selector) {
            selector = self->_selector;
          }
          else {
            selector = 0;
          }
          if (v5->_selector) {
            v10 = v5->_selector;
          }
          else {
            v10 = 0;
          }
          BOOL isEqual = sel_isEqual(selector, v10);
        }
        else
        {
          BOOL isEqual = 0;
        }
      }
      else
      {
        BOOL isEqual = 0;
      }
    }
    else
    {
      BOOL isEqual = 0;
    }
  }

  return isEqual;
}

- (AVEventManagerSelectorAction)initWithTarget:(id)a3 selector:(SEL)a4 event:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AVEventManagerSelectorAction;
  v10 = [(AVEventManagerAction *)&v16 initWithEvent:v9];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(&v10->_target, v8);
    p_selector = &v11->_selector;
    if (a4)
    {
      SEL *p_selector = a4;
      SEL v13 = a4;
    }
    else
    {
      SEL v13 = 0;
      SEL *p_selector = 0;
    }
    v14 = [v8 methodSignatureForSelector:v13];
    v11->_parameterCount = [v14 numberOfArguments] - 2;
  }
  return v11;
}

- (unint64_t)hash
{
  if (self->_selector) {
    selector = self->_selector;
  }
  else {
    selector = 0;
  }
  v4 = NSStringFromSelector(selector);
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  uint64_t v6 = [WeakRetained hash];
  uint64_t v7 = [v4 hash];
  v10.receiver = self;
  v10.super_class = (Class)AVEventManagerSelectorAction;
  unint64_t v8 = v7 & [(AVEventManagerSelectorAction *)&v10 hash] & v6;

  return v8;
}

- (BOOL)hasMatchingTarget:(id)a3 withSelector:(SEL)a4 forEvent:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained == v8)
  {
    if (self->_selector) {
      selector = self->_selector;
    }
    else {
      selector = 0;
    }
    BOOL isEqual = sel_isEqual(selector, a4);
  }
  else
  {
    BOOL isEqual = 0;
  }

  return isEqual;
}

- (void)sendAction:(id)a3
{
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  v5 = WeakRetained;
  if (self->_selector) {
    SEL selector = self->_selector;
  }
  else {
    SEL selector = 0;
  }
  uint64_t v7 = (void (*)(void *, SEL, id))[WeakRetained methodForSelector:selector];
  unint64_t parameterCount = self->_parameterCount;
  if (parameterCount == 1)
  {
    if (v10 && v5) {
      v7(v5, selector, v10);
    }
  }
  else
  {
    if (parameterCount) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v5 == 0;
    }
    if (!v9) {
      ((void (*)(void *, SEL))v7)(v5, selector);
    }
  }
}

@end