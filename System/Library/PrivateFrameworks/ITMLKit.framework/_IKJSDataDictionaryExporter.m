@interface _IKJSDataDictionaryExporter
+ (id)_dataDictionaryObjectFromObject:(id)a3 forAccessorSequence:(id)a4;
+ (id)_dataDictionaryObjectFromValue:(id)a3 inContext:(id)a4;
+ (id)_dataDictionaryObjectFromValueRef:(OpaqueJSValue *)a3 inContextRef:(OpaqueJSContext *)a4;
+ (id)_updatedDataDictionaryObject:(id)a3 fromValue:(id)a4 forPropertyPaths:(id)a5 inContext:(id)a6;
- (IKJSDataObservable)dataObservable;
- (_IKJSDataDictionaryExporter)initWithAppContext:(id)a3 dataObservable:(id)a4;
- (id)dataDictionaryObject;
- (void)touchPropertyPath:(id)a3;
@end

@implementation _IKJSDataDictionaryExporter

- (_IKJSDataDictionaryExporter)initWithAppContext:(id)a3 dataObservable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)_IKJSDataDictionaryExporter;
  v8 = [(IKJSObject *)&v33 initWithAppContext:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataObservable, v7);
    v10 = [(_IKJSDataDictionaryExporter *)v9 dataObservable];
    v11 = [v10 parent];

    if (v11)
    {
      objc_initWeak(location, v9);
      v12 = [IKWeakHandle alloc];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __65___IKJSDataDictionaryExporter_initWithAppContext_dataObservable___block_invoke;
      v30[3] = &unk_1E6DE3B10;
      objc_copyWeak(&v31, location);
      uint64_t v13 = [(IKWeakHandle *)v12 initWithGetter:v30];
      dataDictionaryHandle = v9->_dataDictionaryHandle;
      v9->_dataDictionaryHandle = (IKHandle *)v13;

      objc_destroyWeak(&v31);
      objc_destroyWeak(location);
    }
    else
    {
      v15 = ITMLKitGetLogObject(3);
      v16 = ITMLKitGetLogObject(3);
      os_signpost_id_t v17 = os_signpost_id_make_with_pointer(v16, &stru_1F3E09950);

      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(location[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1E2ACE000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "DataParsing", (const char *)&unk_1E2B9A9C2, (uint8_t *)location, 2u);
      }

      v18 = [v6 jsContext];
      v19 = [(_IKJSDataDictionaryExporter *)v9 dataObservable];
      v20 = [v19 targetValue];

      v21 = [(id)objc_opt_class() _dataDictionaryObjectFromValue:v20 inContext:v18];
      v22 = [[IKStrongHandle alloc] initWithObject:v21];
      v23 = v9->_dataDictionaryHandle;
      v9->_dataDictionaryHandle = &v22->super;

      uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
      touchedPropertyPaths = v9->_touchedPropertyPaths;
      v9->_touchedPropertyPaths = (NSMutableArray *)v24;

      v26 = ITMLKitGetLogObject(3);
      v27 = ITMLKitGetLogObject(3);
      os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v27, &stru_1F3E09950);

      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        LOWORD(location[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1E2ACE000, v26, OS_SIGNPOST_INTERVAL_END, v28, "DataParsing", (const char *)&unk_1E2B9A9C2, (uint8_t *)location, 2u);
      }
    }
  }

  return v9;
}

- (id)dataDictionaryObject
{
  if ([(NSMutableArray *)self->_touchedPropertyPaths count])
  {
    v3 = [(_IKJSDataDictionaryExporter *)self dataObservable];
    v4 = [v3 appContext];
    v5 = [v4 jsContext];

    id v6 = [(_IKJSDataDictionaryExporter *)self dataObservable];
    id v7 = [v6 targetValue];

    v8 = objc_opt_class();
    v9 = [(IKHandle *)self->_dataDictionaryHandle object];
    v10 = [v8 _updatedDataDictionaryObject:v9 fromValue:v7 forPropertyPaths:self->_touchedPropertyPaths inContext:v5];

    v11 = [[IKStrongHandle alloc] initWithObject:v10];
    dataDictionaryHandle = self->_dataDictionaryHandle;
    self->_dataDictionaryHandle = &v11->super;

    [(NSMutableArray *)self->_touchedPropertyPaths removeAllObjects];
  }
  uint64_t v13 = self->_dataDictionaryHandle;
  return [(IKHandle *)v13 object];
}

- (void)touchPropertyPath:(id)a3
{
}

+ (id)_dataDictionaryObjectFromValue:(id)a3 inContext:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 JSValueRef];
  uint64_t v8 = [v6 JSGlobalContextRef];

  return (id)[a1 _dataDictionaryObjectFromValueRef:v7 inContextRef:v8];
}

+ (id)_dataDictionaryObjectFromValueRef:(OpaqueJSValue *)a3 inContextRef:(OpaqueJSContext *)a4
{
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __78___IKJSDataDictionaryExporter__dataDictionaryObjectFromValueRef_inContextRef___block_invoke;
  v30[3] = &__block_descriptor_40_e40___OpaqueJSValue__16__0__OpaqueJSValue__8l;
  void v30[4] = a4;
  uint64_t v7 = (uint64_t (**)(void, void))MEMORY[0x1E4E65800](v30, a2);
  if (JSValueIsString(a4, a3))
  {
    uint64_t v8 = JSValueToStringCopy(a4, a3, 0);
    v9 = (__CFString *)JSStringCopyCFString(0, v8);
    JSStringRelease(v8);
    goto LABEL_8;
  }
  if (JSValueIsNumber(a4, a3))
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithDouble:", JSValueToNumber(a4, a3, 0));
LABEL_7:
    v9 = (__CFString *)v10;
    goto LABEL_8;
  }
  if (JSValueIsBoolean(a4, a3))
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", JSValueToBoolean(a4, a3));
    goto LABEL_7;
  }
  if (JSValueIsObject(a4, a3))
  {
    v12 = (OpaqueJSValue *)((uint64_t (**)(void, OpaqueJSValue *))v7)[2](v7, a3);
    Prototype = JSObjectGetPrototype(a4, v12);
    if (JSValueIsArray(a4, Prototype))
    {
      v14 = JSStringCreateWithCFString(@"length");
      Property = JSObjectGetProperty(a4, v12, v14, 0);
      JSStringRelease(v14);
      uint64_t v16 = 0;
      if (JSValueIsNumber(a4, Property)) {
        uint64_t v16 = (uint64_t)JSValueToNumber(a4, Property, 0);
      }
      os_signpost_id_t v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
      if (v16 >= 1)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          v19 = objc_msgSend(a1, "_dataDictionaryObjectFromValueRef:inContextRef:", JSObjectGetPropertyAtIndex(a4, v12, i, 0), a4);
          [v17 addObject:v19];
        }
      }
      v9 = (__CFString *)[v17 copy];
    }
    else
    {
      v29 = v7;
      v20 = JSObjectCopyPropertyNames(a4, v12);
      int64_t Count = JSPropertyNameArrayGetCount(v20);
      v22 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:Count];
      if (Count >= 1)
      {
        for (size_t j = 0; j != Count; ++j)
        {
          NameAtIndex = JSPropertyNameArrayGetNameAtIndex(v20, j);
          JSValueRef v25 = JSObjectGetProperty(a4, v12, NameAtIndex, 0);
          v26 = (__CFString *)JSStringCopyCFString(0, NameAtIndex);
          v27 = [(__CFString *)v26 ik_sharedInstanceForDomain:1];

          os_signpost_id_t v28 = [a1 _dataDictionaryObjectFromValueRef:v25 inContextRef:a4];
          [v22 setObject:v28 forKeyedSubscript:v27];
        }
      }
      JSPropertyNameArrayRelease(v20);
      v9 = (__CFString *)[v22 copy];

      uint64_t v7 = v29;
    }
  }
  else
  {
    v9 = (__CFString *)MEMORY[0x1E4F1CC08];
  }
LABEL_8:

  return v9;
}

+ (id)_dataDictionaryObjectFromObject:(id)a3 forAccessorSequence:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  v9 = v7;
  uint64_t v26 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v26)
  {
    p_cache = IKChangeSet.cache;
    uint64_t v11 = *(void *)v28;
    unint64_t v12 = 0x1E4F1C000uLL;
    uint64_t v13 = IKChangeSet.cache;
    unint64_t v14 = 0x1E4F1C000uLL;
    v9 = v7;
    id v25 = v7;
    while (2)
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          os_signpost_id_t v17 = [v16 property];
          [v9 objectForKey:v17];
          id v18 = v8;
          v19 = p_cache;
          v20 = v13;
          unint64_t v21 = v14;
          v23 = unint64_t v22 = v12;

          v9 = (void *)v23;
          unint64_t v12 = v22;
          unint64_t v14 = v21;
          uint64_t v13 = v20;
          p_cache = v19;
          id v8 = v18;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

            v9 = 0;
            id v7 = v25;
            goto LABEL_16;
          }
          objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v16, "subscriptIndex"));
          v9 = os_signpost_id_t v17 = v9;
        }
      }
      id v7 = v25;
      uint64_t v26 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v9;
}

+ (id)_updatedDataDictionaryObject:(id)a3 fromValue:(id)a4 forPropertyPaths:(id)a5 inContext:(id)a6
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!objc_msgSend(v10, "ikdt_isArray")
    || !objc_msgSend(v10, "ikdt_isObject")
    || objc_msgSend(v10, "ikdt_isArray") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v10, "ikdt_isObject") && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v16 = [a1 _dataDictionaryObjectFromValue:v10 inContext:v12];
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "ikdt_isArray"))
  {
    uint64_t v13 = [v10 valueForProperty:@"length"];
    if ([v13 isNumber])
    {
      unint64_t v14 = [v13 toNumber];
      uint64_t v15 = [v14 integerValue];
    }
    else
    {
      uint64_t v15 = 0;
    }
    if (v15 != [v9 count])
    {
      uint64_t v16 = [a1 _dataDictionaryObjectFromValue:v10 inContext:v12];

      goto LABEL_11;
    }
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v77 objects:v84 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v78;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v78 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = [*(id *)(*((void *)&v77 + 1) + 8 * i) accessorSequence];
        uint64_t v24 = [v23 count];

        if (!v24)
        {
          uint64_t v16 = [a1 _dataDictionaryObjectFromValue:v10 inContext:v12];

          goto LABEL_11;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v77 objects:v84 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  id v61 = v12;
  v62 = v10;
  id v57 = v11;

  id v25 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v26 = v18;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v73 objects:v83 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v74 != v29) {
          objc_enumerationMutation(v26);
        }
        id v31 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        uint64_t v32 = [v31 accessorSequence];
        objc_super v33 = [v32 firstObject];

        v34 = [v25 objectForKeyedSubscript:v33];
        if (!v34)
        {
          v34 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
          [v25 setObject:v34 forKeyedSubscript:v33];
        }
        v35 = [v31 propertyPathByRemovingFirstAccessor];
        [v34 addObject:v35];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v73 objects:v83 count:16];
    }
    while (v28);
  }

  id v10 = v62;
  if (!objc_msgSend(v62, "ikdt_isArray"))
  {
    if (!objc_msgSend(v62, "ikdt_isObject"))
    {
      uint64_t v16 = 0;
      goto LABEL_63;
    }
    v56 = v9;
    id v59 = v9;
    v60 = (void *)[v59 mutableCopy];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    obuint64_t j = [v25 allKeys];
    uint64_t v46 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v66;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v66 != v48) {
            objc_enumerationMutation(obj);
          }
          v50 = *(void **)(*((void *)&v65 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v51 = [v50 property];
            v52 = [v62 valueForProperty:v51];
            v53 = [v59 objectForKeyedSubscript:v51];
            v54 = [v25 objectForKeyedSubscript:v50];
            v55 = [a1 _updatedDataDictionaryObject:v53 fromValue:v52 forPropertyPaths:v54 inContext:v61];

            if (v55) {
              [v60 setObject:v55 forKeyedSubscript:v51];
            }
            else {
              [v60 removeObjectForKey:v51];
            }
          }
        }
        uint64_t v47 = [obj countByEnumeratingWithState:&v65 objects:v81 count:16];
      }
      while (v47);
    }
    goto LABEL_60;
  }
  v56 = v9;
  id v58 = v9;
  v60 = (void *)[v58 mutableCopy];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obuint64_t j = [v25 allKeys];
  uint64_t v36 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v70;
    do
    {
      for (uint64_t m = 0; m != v37; ++m)
      {
        if (*(void *)v70 != v38) {
          objc_enumerationMutation(obj);
        }
        v40 = *(void **)(*((void *)&v69 + 1) + 8 * m);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v41 = [v40 subscriptIndex];
          v42 = [v62 valueAtIndex:v41];
          v43 = [v58 objectAtIndexedSubscript:v41];
          v44 = [v25 objectForKeyedSubscript:v40];
          v45 = [a1 _updatedDataDictionaryObject:v43 fromValue:v42 forPropertyPaths:v44 inContext:v61];

          [v60 setObject:v45 atIndexedSubscript:v41];
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v69 objects:v82 count:16];
    }
    while (v37);
LABEL_60:
    id v10 = v62;
  }

  uint64_t v16 = (void *)[v60 copy];
  id v9 = v56;

LABEL_63:
  id v12 = v61;

  id v11 = v57;
LABEL_11:

  return v16;
}

- (IKJSDataObservable)dataObservable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataObservable);
  return (IKJSDataObservable *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataObservable);
  objc_storeStrong((id *)&self->_touchedPropertyPaths, 0);
  objc_storeStrong((id *)&self->_dataDictionaryHandle, 0);
}

@end