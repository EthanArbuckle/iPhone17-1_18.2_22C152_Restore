@interface _GCDevicePhysicalInputTransaction
+ (uint64_t)transactionWithImplementation:(uint64_t)a3 configuration:(uint64_t)a4 state:;
- (BOOL)allowsWeakReference;
- (BOOL)isSnapshot;
- (BOOL)updateContextIsValidForElementAtIndex:(BOOL)result;
- (_GCDevicePhysicalInputChangedElementsEnumerator)changedElements;
- (double)lastEventTimestamp;
- (id)description;
- (id)physicalInput;
- (uint64_t)invalidateAllUpdateContexts;
- (uint64_t)mutableUpdateContextForElementAtIndex:(uint64_t)a3 withHandler:;
- (uint64_t)setLastEventTimestamp:(uint64_t)result;
- (uint64_t)updateContextForElementAtIndex:(void *)a3 size:(int)a4 onlyIfChanged:;
- (void)dealloc;
- (void)detach;
@end

@implementation _GCDevicePhysicalInputTransaction

+ (uint64_t)transactionWithImplementation:(uint64_t)a3 configuration:(uint64_t)a4 state:
{
  v7 = (objc_class *)self;
  v8 = [_GCDevicePhysicalInputInitializationContext alloc];
  uint64_t v9 = -[_GCDevicePhysicalInputBase viewProperties]((uint64_t)a2);
  v10 = -[_GCDevicePhysicalInputInitializationContext initWithViewConfiguration:viewProperties:viewState:](v8, a3, v9, a4);
  v11 = (void *)-[_GCDevicePhysicalInputBase elements]((uint64_t)a2);
  v12 = (char *)malloc_type_calloc([v11 count], 8uLL, 0x100004000313F17uLL);
  if ([v11 count])
  {
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    v15 = v12 + 7;
    while (1)
    {
      [v11 objectAtIndexedSubscript:v13];
      uint64_t result = [(id)objc_opt_class() updateContextSize];
      if (result >= 8)
      {
        *v15 |= 0x80u;
        *(_DWORD *)(v15 - 7) = v14;
        v14 += result;
        if (HIDWORD(v14)) {
          break;
        }
      }
      ++v13;
      v15 += 8;
      if (v13 >= [v11 count]) {
        goto LABEL_8;
      }
    }
    __break(1u);
  }
  else
  {
    unint64_t v14 = 0;
LABEL_8:
    id Instance = class_createInstance(v7, v14 + 8 * [v11 count]);
    uint64_t v18 = -[_GCDevicePhysicalInputBase facade]((uint64_t)a2);
    v19 = (_GCDevicePhysicalInputTransaction *)[Instance _initWithFacadeTemplate:v18 elementsTemplates:v11 attributes:-[_GCDevicePhysicalInputBase attributes]((uint64_t)a2) context:v10];
    [(_GCDevicePhysicalInputBase *)v19 setDevice:[(_GCDevicePhysicalInputBase *)a2 device]];
    v19->_physicalInput = a2;
    [(_GCDevicePhysicalInput *)a2 lastEventTimestamp];
    v19->_lastEventTimestamp = v20;
    v21 = [_GCDevicePhysicalInputChangedElementsEnumerator alloc];
    v19->_changedElements = v21;
    v21->_implementation = v19;
    IndexedIvars = object_getIndexedIvars(v19);
    memcpy(IndexedIvars, v12, 8 * [v11 count]);
    free(v12);

    return (uint64_t)v19;
  }
  return result;
}

- (void)dealloc
{
  __assert_rtn("-[_GCDevicePhysicalInputTransaction dealloc]", "_GCDevicePhysicalInputTransaction.m", 114, "_objc_rootRetainCount(_changedElements) == 1");
}

- (BOOL)allowsWeakReference
{
  return 0;
}

- (id)physicalInput
{
  objc_sync_enter(self);
  v3 = self->_physicalInput;
  objc_sync_exit(self);
  return v3;
}

- (void)detach
{
  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    v1[14] = 0;
    return objc_sync_exit(v1);
  }
  return result;
}

- (id)description
{
  if ((unint64_t)[(_GCDevicePhysicalInputTransaction *)self retainCount] <= 1) {
    v3 = &stru_26D27BBB8;
  }
  else {
    v3 = @" (captured)";
  }
  if (self->_physicalInput) {
    v4 = &stru_26D27BBB8;
  }
  else {
    v4 = @" (detached)";
  }
  v5 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<%@ %p;%@%@>",
           NSStringFromClass(v5),
           self,
           v3,
           v4);
}

- (BOOL)isSnapshot
{
  return 1;
}

- (_GCDevicePhysicalInputChangedElementsEnumerator)changedElements
{
  if (result)
  {
    v1 = result;
    if (LOBYTE(result[5]._currentIndex))
    {
      if (_objc_rootRetainCount() == 1)
      {
        v1[5]._implementation->super._dataSource = 0;
        return (_GCDevicePhysicalInputChangedElementsEnumerator *)v1[5]._implementation;
      }
      else
      {
        v2 = [_GCDevicePhysicalInputChangedElementsEnumerator alloc];
        v2->_implementation = (_GCDevicePhysicalInputTransaction *)v1;
        return v2;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)updateContextForElementAtIndex:(void *)a3 size:(int)a4 onlyIfChanged:
{
  if (!a1) {
    return 0;
  }
  if ([(id)-[_GCDevicePhysicalInputBase elements]((uint64_t)a1) count] <= a2)
  {
    v12 = +[NSException exceptionWithName:reason:userInfo:](&off_26D2B7178, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"*** %s: index %lu beyond bounds [0 .. %lu]", "-[_GCDevicePhysicalInputTransaction updateContextForElementAtIndex:size:onlyIfChanged:]", a2, [(id)-[_GCDevicePhysicalInputBase elements]((uint64_t)a1) count]), 0);
    objc_exception_throw(v12);
  }
  IndexedIvars = (char *)object_getIndexedIvars(a1);
  uint64_t v9 = &IndexedIvars[8 * a2];
  if (a4)
  {
    if ((v9[7] & 0x40) == 0) {
      return 0;
    }
  }
  if (v9[7] < 0)
  {
    uint64_t v10 = [(id)-[_GCDevicePhysicalInputBase elements]((uint64_t)a1) count];
    if (a3) {
      *a3 = *((unsigned __int16 *)v9 + 2);
    }
    return (uint64_t)&IndexedIvars[8 * v10 + *(unsigned int *)v9];
  }
  else if (a3)
  {
    *a3 = 7;
  }
  return (uint64_t)v9;
}

- (uint64_t)mutableUpdateContextForElementAtIndex:(uint64_t)a3 withHandler:
{
  if (result)
  {
    v5 = (unsigned char *)result;
    if ([(id)-[_GCDevicePhysicalInputBase elements](result) count] <= a2)
    {
      unint64_t v14 = +[NSException exceptionWithName:reason:userInfo:](&off_26D2B7178, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"*** %s: index %lu beyond bounds [0 .. %lu]", "-[_GCDevicePhysicalInputTransaction mutableUpdateContextForElementAtIndex:withHandler:]", a2, [(id)-[_GCDevicePhysicalInputBase elements]((uint64_t)v5) count]), 0);
      objc_exception_throw(v14);
    }
    IndexedIvars = (char *)object_getIndexedIvars(v5);
    v7 = &IndexedIvars[8 * a2];
    v8 = v7 + 7;
    if (v7[7] < 0)
    {
      v11 = IndexedIvars;
      uint64_t v12 = [(id)-[_GCDevicePhysicalInputBase elements]((uint64_t)v5) count];
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, void))(a3 + 16))(a3, &v11[8 * v12 + *(unsigned int *)v7], *((unsigned __int16 *)v7 + 2));
      if (result) {
        char v13 = 64;
      }
      else {
        char v13 = 0;
      }
      char v10 = *v8 & 0xBF | v13;
    }
    else
    {
      *(_DWORD *)((char *)v15 + 3) = 0;
      v15[0] = 0;
      uint64_t result = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t))(a3 + 16))(a3, v15, 7);
      if (result)
      {
        int v9 = v15[0];
        *(_DWORD *)(v7 + 3) = *(_DWORD *)((char *)v15 + 3);
        *(_DWORD *)v7 = v9;
        char v10 = *v8 | 0x40;
      }
      else
      {
        *(_DWORD *)(v7 + 3) = 0;
        *(_DWORD *)v7 = 0;
        char v10 = *v8 & 0xBF;
      }
    }
    unsigned char *v8 = v10;
    v5[136] = 1;
  }
  return result;
}

- (BOOL)updateContextIsValidForElementAtIndex:(BOOL)result
{
  if (result) {
    return *(unsigned char *)(result + 136) != 0;
  }
  return result;
}

- (uint64_t)invalidateAllUpdateContexts
{
  if (result) {
    *(unsigned char *)(result + 136) = 0;
  }
  return result;
}

- (double)lastEventTimestamp
{
  return self->_lastEventTimestamp;
}

- (uint64_t)setLastEventTimestamp:(uint64_t)result
{
  if (result) {
    *(double *)(result + 120) = a2;
  }
  return result;
}

@end