@interface _GCDevicePhysicalInputView
+ (id)withParameters:(id)a3;
+ (id)withTemplate:(id)a3 context:(id)a4;
+ (unsigned)updateContextSize;
- (BOOL)allowsWeakReference;
- (BOOL)isSnapshot;
- (BOOL)retainWeakReference;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (BOOL)view:(id)a3 testAndSetObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6;
- (BOOL)view:(id)a3 testAndSetPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5;
- (_GCDevicePhysicalInputBase)implementation;
- (_GCDevicePhysicalInputView)init;
- (_GCDevicePhysicalInputView)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputView)initWithTemplate:(id)a3 context:(id)a4;
- (_GCDevicePhysicalInputView)retain;
- (id)view:(id)a3 objectValueForSlot:(unint64_t *)a4;
- (id)view:(id)a3 viewForSlot:(unint64_t *)a4;
- (uint64_t)_objectValueForSlot:(uint64_t)result;
- (uint64_t)_primitiveValueForSlot:(uint64_t)result;
- (uint64_t)_setObjectValue:(uint64_t)a3 forSlot:(uint64_t)a4 policy:;
- (uint64_t)_setPrimitiveValue:(uint64_t)a3 forSlot:;
- (uint64_t)_testAndSetObjectValue:(uint64_t)a3 forSlot:(uint64_t)a4 policy:;
- (uint64_t)_testAndSetPrimitiveValue:(uint64_t)a3 forSlot:;
- (uint64_t)dataSource;
- (uint64_t)physicalInput;
- (unint64_t)retainCount;
- (unint64_t)view:(id)a3 allocateObjectSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6;
- (unint64_t)view:(id)a3 allocatePrimitiveSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6;
- (unint64_t)view:(id)a3 makeReferenceToView:(id)a4;
- (unint64_t)view:(id)a3 primitiveValueForSlot:(unint64_t *)a4;
- (void)_didChangeValueForKey:(void *)a1;
- (void)_willChangeValueForKey:(void *)a1;
- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6;
- (void)dealloc;
- (void)release;
- (void)view:(id)a3 setObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6;
- (void)view:(id)a3 setPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5;
@end

@implementation _GCDevicePhysicalInputView

+ (id)withTemplate:(id)a3 context:(id)a4
{
  id v6 = objc_alloc((Class)a1);

  return (id)[v6 initWithTemplate:a3 context:a4];
}

+ (id)withParameters:(id)a3
{
  id v4 = objc_alloc((Class)a1);

  return (id)[v4 initWithParameters:a3];
}

- (_GCDevicePhysicalInputView)initWithTemplate:(id)a3 context:(id)a4
{
  if (!a4) {
    objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler", a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputView.m", 39, @"Invalid parameter not satisfying: %s", "context != nil");
  }
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputView;
  v7 = [(_GCDevicePhysicalInputView *)&v11 init];
  uint64_t v8 = [a4 viewDataSource:v7];
  v7->_dataSource = (_GCDevicePhysicalInputViewDataSource *)v8;
  if (!v8) {
    objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"_GCDevicePhysicalInputView.m", 43, @"Context must provide a data source!");
  }
  v9 = (void *)[a4 implementation];
  if (v9)
  {
    v7->_isPartOfPhysicalInput = 1;
    v7->_isSnapshot = [v9 isSnapshot];
  }
  return v7;
}

- (_GCDevicePhysicalInputView)initWithParameters:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputView;
  result = [(_GCDevicePhysicalInputView *)&v4 init];
  result->_dataSource = (_GCDevicePhysicalInputViewDataSource *)result;
  return result;
}

- (_GCDevicePhysicalInputView)init
{
  return [(_GCDevicePhysicalInputView *)self initWithParameters:0];
}

- (void)dealloc
{
  self->_dataSource = 0;
  v2.receiver = self;
  v2.super_class = (Class)_GCDevicePhysicalInputView;
  [(_GCDevicePhysicalInputView *)&v2 dealloc];
}

- (uint64_t)physicalInput
{
  if (result)
  {
    if (*(unsigned char *)(result + 16)) {
      return *(void *)(result + 8);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (BOOL)isSnapshot
{
  if (result) {
    return *(unsigned char *)(result + 17) != 0;
  }
  return result;
}

+ (unsigned)updateContextSize
{
  return 0;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  return 0;
}

- (uint64_t)_primitiveValueForSlot:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 8) view:result primitiveValueForSlot:a2];
  }
  return result;
}

- (uint64_t)_setPrimitiveValue:(uint64_t)a3 forSlot:
{
  if (result) {
    return [*(id *)(result + 8) view:result setPrimitiveValue:a2 forSlot:a3];
  }
  return result;
}

- (uint64_t)_testAndSetPrimitiveValue:(uint64_t)a3 forSlot:
{
  if (result) {
    return [*(id *)(result + 8) view:result testAndSetPrimitiveValue:a2 forSlot:a3];
  }
  return result;
}

- (uint64_t)_objectValueForSlot:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 8) view:result objectValueForSlot:a2];
  }
  return result;
}

- (uint64_t)_setObjectValue:(uint64_t)a3 forSlot:(uint64_t)a4 policy:
{
  if (result) {
    return [*(id *)(result + 8) view:result setObjectValue:a2 forSlot:a3 policy:a4];
  }
  return result;
}

- (uint64_t)_testAndSetObjectValue:(uint64_t)a3 forSlot:(uint64_t)a4 policy:
{
  if (result) {
    return [*(id *)(result + 8) view:result testAndSetObjectValue:a2 forSlot:a3 policy:a4];
  }
  return result;
}

- (void)_willChangeValueForKey:(void *)a1
{
  if (a1)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)a1 + 18);
    if (v2) {
      return (void *)[a1 willChangeValueForKey:a2];
    }
  }
  return a1;
}

- (void)_didChangeValueForKey:(void *)a1
{
  if (a1)
  {
    unsigned __int8 v2 = atomic_load((unsigned __int8 *)a1 + 18);
    if (v2) {
      return (void *)[a1 didChangeValueForKey:a2];
    }
  }
  return a1;
}

- (void)addObserver:(id)a3 forKeyPath:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  atomic_store(1u, (unsigned __int8 *)&self->_isObserved);
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputView;
  [(_GCDevicePhysicalInputView *)&v6 addObserver:a3 forKeyPath:a4 options:a5 context:a6];
}

- (_GCDevicePhysicalInputView)retain
{
  unsigned __int8 v2 = self;
  dataSource = self->_dataSource;
  if (dataSource) {
    BOOL v4 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)_GCDevicePhysicalInputView;
    return [(_GCDevicePhysicalInputView *)&v7 retain];
  }
  else
  {
    v5 = dataSource;
  }
  return v2;
}

- (void)release
{
  dataSource = self->_dataSource;
  if (dataSource) {
    BOOL v3 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)_GCDevicePhysicalInputView;
    [(_GCDevicePhysicalInputView *)&v4 release];
  }
  else
  {
  }
}

- (unint64_t)retainCount
{
  dataSource = self->_dataSource;
  if (dataSource) {
    BOOL v4 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)_GCDevicePhysicalInputView;
    return [(_GCDevicePhysicalInputView *)&v6 retainCount];
  }
  else
  {
    return [(_GCDevicePhysicalInputViewDataSource *)dataSource retainCount];
  }
}

- (BOOL)retainWeakReference
{
  dataSource = self->_dataSource;
  if (dataSource) {
    BOOL v4 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)_GCDevicePhysicalInputView;
    return [(_GCDevicePhysicalInputView *)&v6 retainWeakReference];
  }
  else
  {
    return [(_GCDevicePhysicalInputViewDataSource *)dataSource retainWeakReference];
  }
}

- (BOOL)allowsWeakReference
{
  dataSource = self->_dataSource;
  if (dataSource) {
    BOOL v3 = dataSource == (_GCDevicePhysicalInputViewDataSource *)self;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInputView;
  return [(_GCDevicePhysicalInputView *)&v5 allowsWeakReference];
}

- (uint64_t)dataSource
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (unint64_t)view:(id)a3 primitiveValueForSlot:(unint64_t *)a4
{
  return *a4;
}

- (void)view:(id)a3 setPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5
{
  *a5 = a4;
}

- (BOOL)view:(id)a3 testAndSetPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5
{
  return 1;
}

- (id)view:(id)a3 objectValueForSlot:(unint64_t *)a4
{
  return (id)*a4;
}

- (void)view:(id)a3 setObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6
{
  if (*a5)
  {
    objc_setAssociatedObject(a3, (const void *)*a5, 0, (void *)0x301);
    *a5 = 0;
  }
  if (a6 == 3)
  {
    a4 = (id)[a4 copy];
    id v10 = a3;
    id v11 = a4;
    id v12 = a4;
    uint64_t v13 = 1;
  }
  else
  {
    if (a6 != 771)
    {
      objc_setAssociatedObject(a3, a4, a4, (void *)a6);
      goto LABEL_9;
    }
    a4 = (id)[a4 copy];
    id v10 = a3;
    id v11 = a4;
    id v12 = a4;
    uint64_t v13 = 769;
  }
  objc_setAssociatedObject(v10, v11, v12, (void *)v13);

LABEL_9:
  *a5 = (unint64_t)a4;
}

- (BOOL)view:(id)a3 testAndSetObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6
{
  return 1;
}

- (id)view:(id)a3 viewForSlot:(unint64_t *)a4
{
  return (id)*a4;
}

- (_GCDevicePhysicalInputBase)implementation
{
  return 0;
}

- (unint64_t)view:(id)a3 makeReferenceToView:(id)a4
{
  return (unint64_t)a4;
}

- (unint64_t)view:(id)a3 allocatePrimitiveSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6
{
  return 0;
}

- (unint64_t)view:(id)a3 allocateObjectSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6
{
  return 0;
}

@end