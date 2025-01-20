@interface AUParameterNode
- (AUParameterGroup)parentNode;
- (AUParameterNode)initWithID:(id)a3 name:(id)a4;
- (AUParameterObserverToken)tokenByAddingParameterAutomationObserver:(AUParameterAutomationObserver)observer;
- (AUParameterObserverToken)tokenByAddingParameterObserver:(AUParameterObserver)observer;
- (AUParameterObserverToken)tokenByAddingParameterRecordingObserver:(AUParameterRecordingObserver)observer;
- (BOOL)isGroup;
- (NSString)displayName;
- (NSString)displayNameWithLength:(NSInteger)maximumLength;
- (NSString)identifier;
- (NSString)keyPath;
- (id)_rootParent;
- (id)copyNodeWithOffset:(unint64_t)a3;
- (id)description;
- (id)impl_implementorDisplayNameWithLengthCallback;
- (id)impl_implementorStringFromValueCallback;
- (id)impl_implementorValueFromStringCallback;
- (id)impl_implementorValueObserver;
- (id)impl_implementorValueProvider;
- (unint64_t)indexInGroup;
- (void)_addRecObserver:(id)a3 autoObserver:(id)a4;
- (void)_walkTree:(int)a3 callback:(id)a4;
- (void)dealloc;
- (void)observerList;
- (void)removeParameterObserver:(AUParameterObserverToken)token;
- (void)setImpl_implementorDisplayNameWithLengthCallback:(id)a3;
- (void)setImpl_implementorStringFromValueCallback:(id)a3;
- (void)setImpl_implementorValueFromStringCallback:(id)a3;
- (void)setImpl_implementorValueObserver:(id)a3;
- (void)setImpl_implementorValueProvider:(id)a3;
- (void)setIndexInGroup:(unint64_t)a3;
- (void)setObserverList:(void *)a3;
- (void)setParentNode:(id)a3;
@end

@implementation AUParameterNode

- (void).cxx_destruct
{
  objc_storeStrong(&self->_impl_implementorDisplayNameWithLengthCallback, 0);
  objc_storeStrong(&self->_impl_implementorValueFromStringCallback, 0);
  objc_storeStrong(&self->_impl_implementorStringFromValueCallback, 0);
  objc_storeStrong(&self->_impl_implementorValueProvider, 0);
  objc_storeStrong(&self->_impl_implementorValueObserver, 0);
  objc_destroyWeak((id *)&self->_parentNode);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setImpl_implementorDisplayNameWithLengthCallback:(id)a3
{
}

- (id)impl_implementorDisplayNameWithLengthCallback
{
  return self->_impl_implementorDisplayNameWithLengthCallback;
}

- (void)setImpl_implementorValueFromStringCallback:(id)a3
{
}

- (id)impl_implementorValueFromStringCallback
{
  return self->_impl_implementorValueFromStringCallback;
}

- (void)setImpl_implementorStringFromValueCallback:(id)a3
{
}

- (id)impl_implementorStringFromValueCallback
{
  return self->_impl_implementorStringFromValueCallback;
}

- (void)setImpl_implementorValueProvider:(id)a3
{
}

- (id)impl_implementorValueProvider
{
  return self->_impl_implementorValueProvider;
}

- (void)setImpl_implementorValueObserver:(id)a3
{
}

- (id)impl_implementorValueObserver
{
  return self->_impl_implementorValueObserver;
}

- (void)setObserverList:(void *)a3
{
  self->_observerList = a3;
}

- (void)observerList
{
  return self->_observerList;
}

- (void)setParentNode:(id)a3
{
}

- (AUParameterGroup)parentNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);
  return (AUParameterGroup *)WeakRetained;
}

- (void)setIndexInGroup:(unint64_t)a3
{
  self->_indexInGroup = a3;
}

- (unint64_t)indexInGroup
{
  return self->_indexInGroup;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayNameWithLength:(NSInteger)maximumLength
{
  v4 = self;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    while (1)
    {
      uint64_t v7 = [v6 implementorDisplayNameWithLengthCallback];
      v8 = (void *)v7;
      if (v7) {
        break;
      }
      uint64_t v9 = [v6 parentNode];

      v6 = (void *)v9;
      if (!v9) {
        goto LABEL_5;
      }
    }
    v10 = (*(void (**)(uint64_t, AUParameterNode *, NSInteger))(v7 + 16))(v7, v5, maximumLength);
  }
  else
  {
LABEL_5:
    v10 = [(AUParameterNode *)v5 displayName];
  }
  return (NSString *)v10;
}

- (void)removeParameterObserver:(AUParameterObserverToken)token
{
  if (token)
  {
    v5 = [(AUParameterNode *)self _rootParent];
    v6 = v5;
    if (v5)
    {
      char v7 = *((unsigned char *)token + 8);
      v8 = [v5 observationQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__AUParameterNode_removeParameterObserver___block_invoke;
      block[3] = &unk_1E5687B10;
      block[4] = self;
      block[5] = token;
      char v10 = v7;
      dispatch_sync(v8, block);
    }
  }
}

uint64_t __43__AUParameterNode_removeParameterObserver___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 40);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(result + 40);
    v4 = *(void **)(v1 + 8);
    v5 = *(void **)v1;
    if (*(void **)v1 != v4)
    {
      while (*v5 != v3)
      {
        if (++v5 == v4)
        {
          v5 = *(void **)(v1 + 8);
          break;
        }
      }
    }
    v6 = v5 + 1;
    if (v5 != v4 && v6 != v4)
    {
      do
      {
        if (*v6 != v3) {
          *v5++ = *v6;
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = *(void **)(v1 + 8);
    }
    if (v4 != v5) {
      *(void *)(v1 + 8) = v5;
    }
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
    v8 = *(void **)(v2 + 32);
    uint64_t v9 = *(unsigned __int8 *)(v2 + 48);
    return [v8 _observersChanged:v9 deltaCount:0xFFFFFFFFLL];
  }
  return result;
}

- (AUParameterObserverToken)tokenByAddingParameterAutomationObserver:(AUParameterAutomationObserver)observer
{
  return [(AUParameterNode *)self _addRecObserver:0 autoObserver:observer];
}

- (AUParameterObserverToken)tokenByAddingParameterRecordingObserver:(AUParameterRecordingObserver)observer
{
  return [(AUParameterNode *)self _addRecObserver:observer autoObserver:0];
}

- (void)_addRecObserver:(id)a3 autoObserver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v8 = [(AUParameterNode *)self _rootParent];
  uint64_t v9 = v8;
  if (v8)
  {
    char v10 = [v8 observationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AUParameterNode__addRecObserver_autoObserver___block_invoke;
    block[3] = &unk_1E5687AE8;
    block[4] = self;
    id v14 = v9;
    id v15 = v6;
    v17 = &v18;
    id v16 = v7;
    dispatch_sync(v10, block);
  }
  v11 = (void *)v19[3];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __48__AUParameterNode__addRecObserver_autoObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[5]) {
    operator new();
  }
  [v2 _observersChanged:1 deltaCount:1];
  uint64_t v3 = *(void **)(a1 + 48);
  if (v3)
  {
    id v4 = v3;
    operator new();
  }
  id v5 = *(id *)(a1 + 56);
  operator new();
}

- (AUParameterObserverToken)tokenByAddingParameterObserver:(AUParameterObserver)observer
{
  AUParameterObserver v4 = observer;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  id v5 = [(AUParameterNode *)self _rootParent];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 observationQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__AUParameterNode_tokenByAddingParameterObserver___block_invoke;
    v10[3] = &unk_1E5687AC0;
    v10[4] = self;
    id v11 = v6;
    v13 = &v14;
    id v12 = v4;
    dispatch_sync(v7, v10);
  }
  v8 = (void *)v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __50__AUParameterNode_tokenByAddingParameterObserver___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[5]) {
    operator new();
  }
  [v2 _observersChanged:0 deltaCount:1];
  id v3 = *(id *)(a1 + 48);
  operator new();
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(AUParameterNode *)self identifier];
  id v6 = [(AUParameterNode *)self displayName];
  id v7 = [v3 stringWithFormat:@"<%@: %p, \"%@\", \"%@\">", v4, self, v5, v6];

  return v7;
}

- (id)_rootParent
{
  uint64_t v3 = [(AUParameterNode *)self parentNode];
  if (v3)
  {
    uint64_t v4 = (AUParameterNode *)v3;
    for (i = 0; ; uint64_t v4 = i)
    {
      id v6 = [(AUParameterNode *)v4 parentNode];

      if (!v6) {
        break;
      }
      i = v6;
    }
  }
  else
  {
    uint64_t v4 = self;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v4 = 0;
  }
  return v4;
}

- (NSString)keyPath
{
  uint64_t v3 = [(AUParameterNode *)self identifier];
  uint64_t v4 = [(AUParameterNode *)self parentNode];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 keyPath];
    if ([v6 length])
    {
      id v7 = [(AUParameterNode *)self parentNode];
      v8 = [v7 keyPath];
      id v9 = [v8 stringByAppendingFormat:@".%@", v3];

      goto LABEL_6;
    }
  }
  id v9 = v3;
LABEL_6:

  return (NSString *)v9;
}

- (void)_walkTree:(int)a3 callback:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, AUParameterNode *))a4;
  v6[2](v6, v4, self);
  if ([(AUParameterNode *)self isGroup])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = [(AUParameterNode *)self children];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      uint64_t v10 = (v4 + 1);
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) _walkTree:v10 callback:v6];
        }
        while (v8 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (id)copyNodeWithOffset:(unint64_t)a3
{
  return 0;
}

- (BOOL)isGroup
{
  return 0;
}

- (void)dealloc
{
  observerList = self->_observerList;
  if (observerList)
  {
    uint64_t v4 = (void *)*observerList;
    id v5 = (void *)observerList[1];
    if ((void *)*observerList != v5)
    {
      do
      {
        if (*v4) {
          (*(void (**)(void, SEL))(*(void *)*v4 + 8))(*v4, a2);
        }
        ++v4;
      }
      while (v4 != v5);
      uint64_t v4 = (void *)*observerList;
    }
    if (v4)
    {
      observerList[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x192FC8940](observerList, 0x80C40D6874129);
  }

  v6.receiver = self;
  v6.super_class = (Class)AUParameterNode;
  [(AUParameterNode *)&v6 dealloc];
}

- (AUParameterNode)initWithID:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 containsString:@"."])
  {
    long long v12 = (void *)MEMORY[0x1E4F1CA00];
    long long v13 = [NSString stringWithFormat:@"Identifier '%@' contains '.', which is reserved as a delimiter", v7];
    id v14 = [v12 exceptionWithName:@"AUInvalidNodeInfoException" reason:v13 userInfo:0];

    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AUParameterNode;
  uint64_t v9 = [(AUParameterNode *)&v15 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

@end