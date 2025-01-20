@interface IKJSDataObservable
+ (id)_proxyHandlerForValue:(id)a3 boxed:(BOOL)a4 context:(id)a5;
+ (id)jsExportedProperties;
+ (id)toDataObservable:(id)a3;
+ (id)toDataObservable:(id)a3 proxy:(id *)a4;
- (BOOL)isBoxed;
- (BOOL)isPlaceholder;
- (BOOL)observersEnabled;
- (IKJSDataObservable)init;
- (IKJSDataObservable)initWithTargetValue:(id)a3;
- (IKJSDataObservable)parent;
- (JSValue)targetValue;
- (NSArray)parentAccessorSequence;
- (id)_initWithTargetValue:(id)a3 boxed:(BOOL)a4;
- (id)dataDictionaryObject;
- (id)exportValue;
- (id)extraInfoForChangeInPathWithAccessorSequence:(id)a3 extraInfo:(id)a4;
- (id)getPropertyPath:(id)a3;
- (id)valueForAccessorSequence:(id)a3 closestParent:(id *)a4 accessorSequenceFromClosestParent:(id *)a5;
- (id)valueForPropertyPath:(id)a3 boxed:(BOOL)a4;
- (void)_updateValueAtPropertyPath:(id)a3 touch:(BOOL)a4 withBlock:(id)a5;
- (void)addObserver:(id)a3 forPropertyPathWithString:(id)a4;
- (void)removeObserver:(id)a3;
- (void)resetValueForPropertyPath:(id)a3;
- (void)setObserversEnabled:(BOOL)a3;
- (void)setParent:(id)a3 accessorSequence:(id)a4;
- (void)setPropertyPath:(id)a3 :(id)a4;
- (void)setTargetValue:(id)a3;
- (void)setValue:(id)a3 forPropertyPath:(id)a4;
- (void)touchPathWithAccessorSequence:(id)a3 extraInfo:(id)a4;
- (void)touchPropertyPath:(id)a3;
@end

@implementation IKJSDataObservable

+ (id)toDataObservable:(id)a3
{
  return (id)[a1 toDataObservable:a3 proxy:0];
}

+ (id)toDataObservable:(id)a3 proxy:(id *)a4
{
  id v6 = a3;
  if (!objc_msgSend(v6, "ikdt_isObject"))
  {
    v10 = 0;
    goto LABEL_12;
  }
  v7 = +[IKAppContext currentAppContext];
  v8 = [v7 jsWeakMap];
  v9 = [v8 valueForWeakKey:v6];
  v10 = [v9 toObjectOfClass:objc_opt_class()];

  if (!v10)
  {
    if (!a4)
    {
      v10 = 0;
      goto LABEL_11;
    }
    if ((id)objc_opt_class() == a1)
    {
      objc_msgSend(v6, "ikdt_isArray");
      a1 = (id)objc_opt_class();
    }
    v10 = (void *)[objc_alloc((Class)a1) _initWithTargetValue:v6 boxed:1];
    id v11 = [v10 exportValue];
    goto LABEL_10;
  }
  if (a4)
  {
    id v11 = v6;
LABEL_10:
    *a4 = v11;
  }
LABEL_11:

LABEL_12:
  return v10;
}

- (IKJSDataObservable)init
{
  v3 = +[IKAppContext currentAppContext];
  v6.receiver = self;
  v6.super_class = (Class)IKJSDataObservable;
  v4 = [(IKJSObject *)&v6 initWithAppContext:v3];

  return v4;
}

- (JSValue)targetValue
{
  return [(JSManagedValue *)self->_managedTargetValue value];
}

- (BOOL)isPlaceholder
{
  return self->_managedTargetValue == 0;
}

- (void)setValue:(id)a3 forPropertyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 accessorSequence];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__IKJSDataObservable_setValue_forPropertyPath___block_invoke;
    v10[3] = &unk_1E6DE44A0;
    id v11 = v6;
    [(IKJSDataObservable *)self _updateValueAtPropertyPath:v7 touch:1 withBlock:v10];
  }
}

id __47__IKJSDataObservable_setValue_forPropertyPath___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)valueForPropertyPath:(id)a3 boxed:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 accessorSequence];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__6;
    v20 = __Block_byref_object_dispose__6;
    id v21 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__IKJSDataObservable_valueForPropertyPath_boxed___block_invoke;
    v14[3] = &unk_1E6DE44C8;
    v14[4] = &v16;
    BOOL v15 = a4;
    [(IKJSDataObservable *)self _updateValueAtPropertyPath:v6 touch:0 withBlock:v14];
    id v9 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F30938];
    id v11 = [(IKJSObject *)self appContext];
    v12 = [v11 jsContext];
    id v9 = [v10 valueWithUndefinedInContext:v12];
  }
  return v9;
}

id __49__IKJSDataObservable_valueForPropertyPath_boxed___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "ikdt_isObject")
    && *(unsigned char *)(a1 + 40))
  {
    id obj = 0;
    id v5 = +[IKJSDataObservable toDataObservable:v4 proxy:&obj];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  }
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return v6;
}

- (void)resetValueForPropertyPath:(id)a3
{
  id v6 = a3;
  id v4 = [v6 accessorSequence];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(IKJSDataObservable *)self _updateValueAtPropertyPath:v6 touch:0 withBlock:&__block_literal_global_3];
  }
}

uint64_t __48__IKJSDataObservable_resetValueForPropertyPath___block_invoke()
{
  return 0;
}

- (void)addObserver:(id)a3 forPropertyPathWithString:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [[_IKJSDataObserverRecord alloc] initWithObserver:v12 pathString:v6];
  uint64_t v8 = self;
  objc_sync_enter(v8);
  observerRecords = v8->_observerRecords;
  if (!observerRecords)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    id v11 = v8->_observerRecords;
    v8->_observerRecords = (NSMutableArray *)v10;

    observerRecords = v8->_observerRecords;
  }
  [(NSMutableArray *)observerRecords addObject:v7];
  objc_sync_exit(v8);
}

- (void)removeObserver:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v4 = +[_IKJSDataObserverRecord hashForObserver:](_IKJSDataObserverRecord, "hashForObserver:");
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5->_observerRecords;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 observerHash];
        char v13 = [v12 isEqualToString:v4];

        if ((v13 & 1) == 0) {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v6 count]) {
    v14 = v6;
  }
  else {
    v14 = 0;
  }
  objc_storeStrong((id *)&v5->_observerRecords, v14);

  objc_sync_exit(v5);
}

- (void)setPropertyPath:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[IKDataBindingPropertyPath alloc] initWithString:v7];

  [(IKJSDataObservable *)self setValue:v6 forPropertyPath:v8];
}

- (id)getPropertyPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[IKDataBindingPropertyPath alloc] initWithString:v4];

  id v6 = [(IKJSDataObservable *)self valueForPropertyPath:v5 boxed:0];

  return v6;
}

- (void)touchPropertyPath:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [[IKDataBindingPropertyPath alloc] initWithString:v4];
    id v6 = [(IKDataBindingPropertyPath *)v5 accessorSequence];
    id v10 = 0;
    id v11 = 0;
    id v7 = [(IKJSDataObservable *)self valueForAccessorSequence:v6 closestParent:&v11 accessorSequenceFromClosestParent:&v10];
    id v8 = v11;
    id v9 = v10;
    [v8 touchPathWithAccessorSequence:v9 extraInfo:0];
  }
}

- (IKJSDataObservable)initWithTargetValue:(id)a3
{
  return (IKJSDataObservable *)[(IKJSDataObservable *)self _initWithTargetValue:a3 boxed:0];
}

- (void)setTargetValue:(id)a3
{
  id v4 = [MEMORY[0x1E4F30928] managedValueWithValue:a3 andOwner:self];
  managedTargetValue = self->_managedTargetValue;
  self->_managedTargetValue = v4;
  MEMORY[0x1F41817F8](v4, managedTargetValue);
}

- (id)exportValue
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v3 = [(IKJSObject *)self appContext];
  id v4 = [(IKJSDataObservable *)self targetValue];
  BOOL v5 = [(IKJSDataObservable *)self isBoxed];
  id v6 = objc_opt_class();
  id v7 = [(IKJSObject *)self appContext];
  id v8 = [v7 jsContext];
  id v9 = [v6 _proxyHandlerForValue:v4 boxed:v5 context:v8];

  id v10 = [(IKJSObject *)self appContext];
  id v11 = [v10 jsContext];
  id v12 = [v11 objectForKeyedSubscript:@"Proxy"];
  if (v5) {
    char v13 = v4;
  }
  else {
    char v13 = self;
  }
  v22[0] = v13;
  v22[1] = v9;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  id v15 = [v12 constructWithArguments:v14];

  long long v16 = [(IKJSObject *)self appContext];
  long long v17 = [v16 jsWeakMap];
  long long v18 = (void *)MEMORY[0x1E4F30938];
  long long v19 = [v3 jsContext];
  v20 = [v18 valueWithObject:self inContext:v19];
  [v17 setValue:v20 forWeakKey:v15];

  return v15;
}

- (id)dataDictionaryObject
{
  exporter = self->_exporter;
  if (!exporter)
  {
    id v4 = [_IKJSDataDictionaryExporter alloc];
    BOOL v5 = [(IKJSObject *)self appContext];
    id v6 = [(_IKJSDataDictionaryExporter *)v4 initWithAppContext:v5 dataObservable:self];
    id v7 = self->_exporter;
    self->_exporter = v6;

    exporter = self->_exporter;
  }
  return [(_IKJSDataDictionaryExporter *)exporter dataDictionaryObject];
}

- (void)setParent:(id)a3 accessorSequence:(id)a4
{
  p_parent = &self->_parent;
  id v7 = a4;
  objc_storeWeak((id *)p_parent, a3);
  id v8 = (NSArray *)[v7 copy];

  parentAccessorSequence = self->_parentAccessorSequence;
  self->_parentAccessorSequence = v8;

  exporter = self->_exporter;
  self->_exporter = 0;
}

- (void)touchPathWithAccessorSequence:(id)a3 extraInfo:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = a4;
  exporter = self->_exporter;
  v31 = v6;
  id v8 = [[IKDataBindingPropertyPath alloc] initWithAccessorSequence:v6];
  [(_IKJSDataDictionaryExporter *)exporter touchPropertyPath:v8];

  v30 = self;
  if (-[IKJSDataObservable observersEnabled](self, "observersEnabled") && [v31 count])
  {
    id v9 = self;
    objc_sync_enter(v9);
    id v10 = (void *)[(NSMutableArray *)v9->_observerRecords copy];
    objc_sync_exit(v9);
    v34 = v9;

    v36 = +[IKDataBindingPropertyPath pathStringForAccessorSequence:v31];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v10;
    uint64_t v37 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v37)
    {
      uint64_t v35 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v40 != v35) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v38 = 0;
          int v13 = [v12 isAffectedByPropertyPathWithString:v36 subpathString:&v38];
          id v14 = v38;
          if (v13)
          {
            id v15 = v32;
            if ([v14 length])
            {
              long long v16 = [IKDataBindingPropertyPath alloc];
              long long v17 = [v12 pathString];
              long long v18 = [(IKDataBindingPropertyPath *)v16 initWithString:v17];

              long long v19 = [(IKDataBindingPropertyPath *)v18 accessorSequence];
              v20 = [(IKJSDataObservable *)v34 valueForAccessorSequence:v19 closestParent:0 accessorSequenceFromClosestParent:0];

              uint64_t v21 = +[IKJSDataObservable toDataObservable:v20];
              v22 = [[IKDataBindingPropertyPath alloc] initWithString:v14];
              v23 = [(IKDataBindingPropertyPath *)v22 accessorSequence];
              uint64_t v24 = [v21 extraInfoForChangeInPathWithAccessorSequence:v23 extraInfo:v15];

              id v15 = (id)v24;
            }
            v25 = [v12 observer];
            v26 = [v12 pathString];
            [v25 dataObservable:v34 didChangePropertyPathWithString:v26 extraInfo:v15];
          }
        }
        uint64_t v37 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v37);
    }
  }
  v27 = [(IKJSDataObservable *)v30 parent];
  v28 = [(IKJSDataObservable *)v30 parentAccessorSequence];
  v29 = [v28 arrayByAddingObjectsFromArray:v31];
  [v27 touchPathWithAccessorSequence:v29 extraInfo:v32];
}

- (id)valueForAccessorSequence:(id)a3 closestParent:(id *)a4 accessorSequenceFromClosestParent:(id *)a5
{
  v28 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = [(IKJSDataObservable *)v7 targetValue];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v31 = *(void *)v33;
    id v12 = off_1E6DE3000;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v31) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v15 = v12;
        long long v16 = -[__objc2_class toDataObservable:](v12[18], "toDataObservable:", v9, v28);
        uint64_t v17 = [v16 targetValue];
        long long v18 = (void *)v17;
        if (v17) {
          long long v19 = (void *)v17;
        }
        else {
          long long v19 = v9;
        }
        id v20 = v19;

        [v8 addObject:v14];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v21 = [v14 property];
          v22 = [v20 objectForKeyedSubscript:v21];
        }
        else if (objc_msgSend(v20, "ikdt_isArray"))
        {
          v22 = objc_msgSend(v20, "valueAtIndex:", objc_msgSend(v14, "subscriptIndex"));
        }
        else
        {
          v22 = 0;
        }
        id v12 = v15;
        v23 = [(__objc2_class *)v15[18] toDataObservable:v22];
        if (v23)
        {
          uint64_t v24 = (void *)[v8 copy];
          [v23 setParent:v7 accessorSequence:v24];

          v25 = v23;
          [v8 removeAllObjects];
          id v7 = v25;
        }
        id v9 = v22;

        if (!v9 || [v9 isNull])
        {

          goto LABEL_23;
        }
        char v26 = [v9 isUndefined];

        if (v26) {
          goto LABEL_23;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  if (v28) {
    id *v28 = v7;
  }
  if (a5) {
    *a5 = (id)[v8 copy];
  }

  return v9;
}

+ (id)jsExportedProperties
{
  return &unk_1F3E3DA70;
}

- (id)extraInfoForChangeInPathWithAccessorSequence:(id)a3 extraInfo:(id)a4
{
  return 0;
}

+ (id)_proxyHandlerForValue:(id)a3 boxed:(BOOL)a4 context:(id)a5
{
  BOOL v6 = a4;
  v18[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F30938] valueWithObject:MEMORY[0x1E4F1CC08] inContext:v9];
  }
  else
  {
    if (_proxyHandlerForValue_boxed_context__onceToken != -1) {
      dispatch_once(&_proxyHandlerForValue_boxed_context__onceToken, &__block_literal_global_104);
    }
    uint64_t v11 = [v9 objectForKeyedSubscript:@"Function"];
    v18[0] = @"object";
    v18[1] = @"exportedProperties";
    v18[2] = _proxyHandlerForValue_boxed_context__sHandlerScript;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    int v13 = [v11 constructWithArguments:v12];

    v17[0] = v9;
    v17[1] = v8;
    id v14 = [a1 jsExportedProperties];
    v17[2] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    uint64_t v10 = [v13 invokeMethod:@"call" withArguments:v15];
  }
  return v10;
}

void __58__IKJSDataObservable__proxyHandlerForValue_boxed_context___block_invoke()
{
  v0 = (void *)_proxyHandlerForValue_boxed_context__sHandlerScript;
  _proxyHandlerForValue_boxed_context__sHandlerScript = @"let handler = {   get: function(target, prop) {       if (this.exportedProperties.indexOf(prop) >= 0) {           let value = Reflect.get(target, prop);           if (Object.getPrototypeOf(value) == Function.prototype) {               value = value.bind(target);           }           return value;       }       else       {           return Reflect.get(this.object, prop);       }   },   set: function(target, prop, value) {       return Reflect.set(this.object, prop, value);   }};handler.object = object;handler.exportedProperties = exportedProperties;return handler;";
}

- (id)_initWithTargetValue:(id)a3 boxed:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(IKJSDataObservable *)self init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F30928] managedValueWithValue:v6 andOwner:v7];
    managedTargetValue = v7->_managedTargetValue;
    v7->_managedTargetValue = (JSManagedValue *)v8;

    v7->_isBoxed = a4;
    v7->_observersEnabled = 1;
  }

  return v7;
}

- (void)_updateValueAtPropertyPath:(id)a3 touch:(BOOL)a4 withBlock:(id)a5
{
  BOOL v5 = a4;
  uint64_t v8 = (void (**)(id, void *))a5;
  id v9 = [a3 accessorSequence];
  uint64_t v10 = [v9 count] - 1;
  uint64_t v11 = [v9 lastObject];
  id v12 = objc_msgSend(v9, "subarrayWithRange:", 0, v10);
  id v29 = 0;
  id v30 = 0;
  int v13 = [(IKJSDataObservable *)self valueForAccessorSequence:v12 closestParent:&v30 accessorSequenceFromClosestParent:&v29];
  id v14 = v30;
  id v15 = v29;

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = [v11 property];
      uint64_t v17 = [v13 objectForKeyedSubscript:v16];
    }
    else if (objc_msgSend(v13, "ikdt_isArray"))
    {
      uint64_t v17 = objc_msgSend(v13, "valueAtIndex:", objc_msgSend(v11, "subscriptIndex"));
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (([v17 isNull] & 1) != 0 || objc_msgSend(v17, "isUndefined"))
    {

      uint64_t v17 = 0;
    }
    long long v18 = v8[2](v8, v17);
    if (v18)
    {
      v28 = v15;
      id v19 = v14;
      id v20 = +[IKJSDataObservable toDataObservable:v18];
      if (v20)
      {
        [v28 arrayByAddingObject:v11];
        uint64_t v21 = v8;
        v23 = BOOL v22 = v5;
        [v20 setParent:v19 accessorSequence:v23];

        BOOL v5 = v22;
        uint64_t v8 = v21;
      }
      if (v17 != v18)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 property];
          uint64_t v24 = v8;
          char v26 = v25 = v5;
          [v13 setObject:v18 forKeyedSubscript:v26];

          BOOL v5 = v25;
          uint64_t v8 = v24;
        }
        else if (objc_msgSend(v13, "ikdt_isArray"))
        {
          objc_msgSend(v13, "setValue:atIndex:", v18, objc_msgSend(v11, "subscriptIndex"));
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:

        goto LABEL_22;
      }
      v28 = v15;
      id v19 = v14;
      id v20 = [v11 property];
      [v13 deleteProperty:v20];
    }

    id v14 = v19;
    id v15 = v28;
    goto LABEL_21;
  }
LABEL_22:
  if (v5)
  {
    v27 = [v15 arrayByAddingObject:v11];
    [v14 touchPathWithAccessorSequence:v27 extraInfo:0];
  }
}

- (IKJSDataObservable)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (IKJSDataObservable *)WeakRetained;
}

- (BOOL)isBoxed
{
  return self->_isBoxed;
}

- (BOOL)observersEnabled
{
  return self->_observersEnabled;
}

- (void)setObserversEnabled:(BOOL)a3
{
  self->_observersEnabled = a3;
}

- (NSArray)parentAccessorSequence
{
  return self->_parentAccessorSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAccessorSequence, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_exporter, 0);
  objc_storeStrong((id *)&self->_observerRecords, 0);
  objc_storeStrong((id *)&self->_managedTargetValue, 0);
}

@end