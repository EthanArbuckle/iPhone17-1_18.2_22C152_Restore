@interface IKJSDataDictionaryExporter
@end

@implementation IKJSDataDictionaryExporter

id __65___IKJSDataDictionaryExporter_initWithAppContext_dataObservable___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_opt_class();
    v3 = [WeakRetained dataObservable];
    v4 = [v3 parent];
    v5 = [v4 dataDictionaryObject];
    v6 = [WeakRetained dataObservable];
    v7 = [v6 parentAccessorSequence];
    v8 = [v2 _dataDictionaryObjectFromObject:v5 forAccessorSequence:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

JSObjectRef __78___IKJSDataDictionaryExporter__dataDictionaryObjectFromValueRef_inContextRef___block_invoke(uint64_t a1, const OpaqueJSValue *a2)
{
  JSObjectRef v3 = JSValueToObject(*(JSContextRef *)(a1 + 32), a2, 0);
  v4 = +[IKAppContext currentAppContext];
  v5 = [v4 jsWeakMap];
  v6 = (const OpaqueJSValue *)[v5 valueRefForWeakKeyRef:v3];

  if (!JSValueIsObject(*(JSContextRef *)(a1 + 32), v6)) {
    return v3;
  }
  v7 = (void *)MEMORY[0x1E4F30938];
  v8 = +[IKAppContext currentAppContext];
  v9 = [v8 jsContext];
  v10 = [v7 valueWithJSValueRef:v6 inContext:v9];
  v11 = [v10 toObject];

  v12 = *(const OpaqueJSContext **)(a1 + 32);
  v13 = [v11 targetValue];
  JSObjectRef v14 = JSValueToObject(v12, (JSValueRef)[v13 JSValueRef], 0);

  return v14;
}

@end