@interface VSBindingInfo
- (NSDictionary)options;
- (NSString)keyPath;
- (NSValueTransformer)valueTransformer;
- (VSBindingInfo)init;
- (VSBindingInfo)initWithObservedObject:(id)a3 keyPath:(id)a4 options:(id)a5;
- (id)unsafeObservedObject;
- (id)value;
- (id)weakObservedObject;
- (void)requireExpectedConcurrency;
- (void)setValue:(id)a3;
- (void)setValueTransformer:(id)a3;
@end

@implementation VSBindingInfo

- (VSBindingInfo)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VSBindingInfo)initWithObservedObject:(id)a3 keyPath:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_11:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The keyPath parameter must not be nil."];
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The observedObject parameter must not be nil."];
  if (!v9) {
    goto LABEL_11;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_12:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The options parameter must not be nil."];
LABEL_4:
  v35.receiver = self;
  v35.super_class = (Class)VSBindingInfo;
  v11 = [(VSBindingInfo *)&v35 init];
  v12 = v11;
  if (v11)
  {
    v11->_unsafeObservedObject = v8;
    objc_storeWeak(&v11->_weakObservedObject, v8);
    uint64_t v13 = [v9 copy];
    keyPath = v12->_keyPath;
    v12->_keyPath = (NSString *)v13;

    v15 = [v10 objectForKey:@"VSValueTransformerBindingOption"];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v18 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v19 = *MEMORY[0x1E4F1C3C8];
          v20 = (objc_class *)objc_opt_class();
          v21 = NSStringFromClass(v20);
          [v18 raise:v19, @"Unexpectedly, transformerOption was %@, instead of NSValueTransformer.", v21 format];
        }
        v22 = (NSValueTransformer *)v17;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v23 = (void *)MEMORY[0x1E4F29248];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v24 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v25 = *MEMORY[0x1E4F1C3C8];
            v26 = (objc_class *)objc_opt_class();
            v27 = NSStringFromClass(v26);
            [v24 raise:v25, @"Unexpectedly, transformerOption was %@, instead of NSString.", v27 format];
          }
          v28 = [v23 valueTransformerForName:v17];
          v22 = v28;
          if (v28) {
            v29 = v28;
          }
          else {
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"There is no value transformer named '%@'.", v17 format];
          }
        }
        else
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid value transformer option %@", v17 format];
          v22 = 0;
        }
      }
    }
    else
    {
      v22 = 0;
    }
    uint64_t v30 = [v10 copy];
    options = v12->_options;
    v12->_options = (NSDictionary *)v30;

    valueTransformer = v12->_valueTransformer;
    v12->_valueTransformer = v22;
    v33 = v22;
  }
  return v12;
}

- (void)setValue:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(VSBindingInfo *)self valueTransformer];
  v5 = v4;
  v6 = v9;
  if (v4)
  {
    v6 = [v4 reverseTransformedValue:v9];
  }
  v7 = [(VSBindingInfo *)self weakObservedObject];
  id v8 = [(VSBindingInfo *)self keyPath];
  [v7 setValue:v6 forKeyPath:v8];
}

- (id)value
{
  v3 = [(VSBindingInfo *)self weakObservedObject];
  uint64_t v4 = [(VSBindingInfo *)self keyPath];
  v5 = [v3 valueForKeyPath:v4];

  v6 = [(VSBindingInfo *)self valueTransformer];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 transformedValue:v5];

    v5 = (void *)v8;
  }

  return v5;
}

- (void)requireExpectedConcurrency
{
  id v18 = [(VSBindingInfo *)self weakObservedObject];
  v3 = [(VSBindingInfo *)self options];
  uint64_t v4 = [v3 objectForKey:@"VSRequiredThreadBindingOption"];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F29060] currentThread];
    if (([v5 isEqual:v4] & 1) == 0)
    {
      v6 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v7 = *MEMORY[0x1E4F1C3B8];
      uint64_t v8 = [(VSBindingInfo *)self keyPath];
      [v6 raise:v7, @"Binding observing keyPath %@ on object %@ used on thread %@ instead of required thread %@", v8, v18, v5, v4 format];
    }
  }
  id v9 = [(VSBindingInfo *)self options];
  id v10 = [v9 objectForKey:@"VSRequiredOperationQueueBindingOption"];

  if (v10)
  {
    id v11 = v10;
    v12 = [MEMORY[0x1E4F28F08] currentQueue];
    if (([v12 isEqual:v11] & 1) == 0)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3B8];
      v15 = [(VSBindingInfo *)self keyPath];
      [v13 raise:v14, @"Binding observing keyPath %@ on object %@ used on operation queue %@ instead of required operation queue %@", v15, v18, v12, v11 format];
    }
  }
  v16 = [(VSBindingInfo *)self options];
  id v17 = [v16 objectForKey:@"VSRequiredDispatchQueueBindingOption"];

  if (v17) {
    dispatch_assert_queue_V2(v17);
  }
}

- (id)unsafeObservedObject
{
  return self->_unsafeObservedObject;
}

- (id)weakObservedObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakObservedObject);

  return WeakRetained;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSValueTransformer)valueTransformer
{
  return self->_valueTransformer;
}

- (void)setValueTransformer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueTransformer, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_destroyWeak(&self->_weakObservedObject);
}

@end