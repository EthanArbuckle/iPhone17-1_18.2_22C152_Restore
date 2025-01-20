@interface HKJSONVisitor
+ (id)visitorWithJSONObject:(id)a3 delegate:(id)a4 error:(id *)a5;
- (NSArray)allKeyPathComponents;
- (NSString)currentKeyPath;
- (NSString)lastKeyPathComponent;
- (id)valueForKeyPath:(id)a3;
- (int64_t)_traverseJSONObject:(id)a3;
- (int64_t)_visitArray:(id)a3;
- (int64_t)_visitDictionary:(id)a3;
- (int64_t)_visitPrimitive:(id)a3;
- (int64_t)currentIndex;
- (void)traverseJSONObject;
@end

@implementation HKJSONVisitor

+ (id)visitorWithJSONObject:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (id *)objc_alloc_init((Class)a1);
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v9])
  {
    objc_storeStrong(v11 + 2, a3);
    objc_storeWeak(v11 + 1, v10);
    v11[5] = (id)0x7FFFFFFFFFFFFFFFLL;
    uint64_t v12 = [NSString string];
    id v13 = v11[3];
    v11[3] = (id)v12;

    id v14 = v11[4];
    v11[4] = (id)MEMORY[0x1E4F1CBF0];

    v15 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"JSONObject is not valid JSON");
    v15 = 0;
  }

  return v15;
}

- (void)traverseJSONObject
{
}

- (NSString)lastKeyPathComponent
{
  v2 = [(NSString *)self->_currentKeyPath componentsSeparatedByString:@"."];
  v3 = [v2 lastObject];

  return (NSString *)v3;
}

- (id)valueForKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 length];
  id JSONObject = self->_JSONObject;
  if (v5)
  {
    id v7 = [JSONObject valueForKeyPath:v4];
  }
  else
  {
    id v7 = JSONObject;
  }
  v8 = v7;

  return v8;
}

- (int64_t)_traverseJSONObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HKJSONVisitor.m", 71, @"Invalid parameter not satisfying: %@", @"object != nil" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v6 = [(HKJSONVisitor *)self _visitDictionary:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int64_t v6 = [(HKJSONVisitor *)self _visitArray:v5];
    }
    else {
      int64_t v6 = [(HKJSONVisitor *)self _visitPrimitive:v5];
    }
  }
  int64_t v7 = v6;

  return v7;
}

- (int64_t)_visitDictionary:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"HKJSONVisitor.m", 84, @"Invalid parameter not satisfying: %@", @"[dictionary isKindOfClass:[NSDictionary class]]" object file lineNumber description];
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v9 = [v8 performSelector:sel_visitor_willVisitDictionary_ withObject:self withObject:v5];

    if (!v9) {
      goto LABEL_28;
    }
    if (v9 == 2)
    {
      int64_t v9 = 1;
      goto LABEL_28;
    }
  }
  else
  {
  }
  p_currentKeyPath = &self->_currentKeyPath;
  v11 = (void *)[(NSString *)self->_currentKeyPath copy];
  uint64_t v12 = (void *)[(NSArray *)self->_allKeyPathComponents copy];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = [v5 allKeys];
  id v14 = [v13 sortedArrayUsingSelector:sel_compare_];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x19F395970]();
        objc_msgSend(v11, "hk_stringByAppendingKeyPathComponent:", v19);
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        currentKeyPath = self->_currentKeyPath;
        self->_currentKeyPath = v21;

        v23 = [v12 arrayByAddingObject:v19];
        allKeyPathComponents = self->_allKeyPathComponents;
        self->_allKeyPathComponents = v23;

        v25 = [v5 objectForKeyedSubscript:v19];
        int64_t v26 = [(HKJSONVisitor *)self _traverseJSONObject:v25];
        if (v26 == 2)
        {

          p_currentKeyPath = &self->_currentKeyPath;
          p_delegate = &self->_delegate;
          goto LABEL_19;
        }
        if (!v26)
        {

          int64_t v9 = 0;
          goto LABEL_27;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
      p_currentKeyPath = &self->_currentKeyPath;
      p_delegate = &self->_delegate;
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  objc_storeStrong((id *)p_currentKeyPath, v11);
  objc_storeStrong((id *)&self->_allKeyPathComponents, v12);
  id v27 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v28 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v29 = [v28 performSelector:sel_visitor_didVisitDictionary_ withObject:self withObject:v5];

    uint64_t v30 = 1;
    if (v29 == 2) {
      uint64_t v30 = 2;
    }
    if (v29) {
      int64_t v9 = v30;
    }
    else {
      int64_t v9 = 0;
    }
  }
  else
  {

    int64_t v9 = 1;
  }
LABEL_27:

LABEL_28:
  return v9;
}

- (int64_t)_visitArray:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HKJSONVisitor.m", 122, @"Invalid parameter not satisfying: %@", @"[array isKindOfClass:[NSArray class]]" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v8 = [v7 performSelector:sel_visitor_willVisitArray_ withObject:self withObject:v5];

    if (!v8) {
      goto LABEL_28;
    }
    if (v8 == 2)
    {
      int64_t v8 = 1;
      goto LABEL_28;
    }
  }
  else
  {
  }
  location = (id *)&self->_delegate;
  p_allKeyPathComponents = &self->_allKeyPathComponents;
  id obj = (id)[(NSArray *)self->_allKeyPathComponents copy];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v33;
    id v29 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v17 = (void *)MEMORY[0x19F395970]();
        self->_currentIndex = v13 + i;
        v18 = [NSNumber numberWithInteger:v13 + i];
        uint64_t v19 = [v18 description];
        v20 = [obj arrayByAddingObject:v19];
        allKeyPathComponents = self->_allKeyPathComponents;
        self->_allKeyPathComponents = v20;

        int64_t v22 = [(HKJSONVisitor *)self _traverseJSONObject:v16];
        if (v22 == 2)
        {
          p_allKeyPathComponents = &self->_allKeyPathComponents;
          id v5 = v29;
          goto LABEL_19;
        }
        if (!v22)
        {

          int64_t v8 = 0;
          id v5 = v29;
          goto LABEL_27;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      v13 += i;
      p_allKeyPathComponents = &self->_allKeyPathComponents;
      id v5 = v29;
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  self->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  objc_storeStrong((id *)p_allKeyPathComponents, obj);
  id v23 = objc_loadWeakRetained(location);
  if (objc_opt_respondsToSelector())
  {
    id v24 = objc_loadWeakRetained(location);
    uint64_t v25 = [v24 performSelector:sel_visitor_didVisitArray_ withObject:self withObject:v10];

    uint64_t v26 = 1;
    if (v25 == 2) {
      uint64_t v26 = 2;
    }
    if (v25) {
      int64_t v8 = v26;
    }
    else {
      int64_t v8 = 0;
    }
  }
  else
  {

    int64_t v8 = 1;
  }
LABEL_27:

LABEL_28:
  return v8;
}

- (int64_t)_visitPrimitive:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2, self, @"HKJSONVisitor.m", 163, @"Invalid parameter not satisfying: %@", @"[object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSNull class]]" object file lineNumber description];
      }
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    int64_t v8 = [v7 performSelector:sel_visitor_visitPrimitive_ withObject:self withObject:v5];
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (NSString)currentKeyPath
{
  return self->_currentKeyPath;
}

- (NSArray)allKeyPathComponents
{
  return self->_allKeyPathComponents;
}

- (int64_t)currentIndex
{
  return self->_currentIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allKeyPathComponents, 0);
  objc_storeStrong((id *)&self->_currentKeyPath, 0);
  objc_storeStrong(&self->_JSONObject, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end