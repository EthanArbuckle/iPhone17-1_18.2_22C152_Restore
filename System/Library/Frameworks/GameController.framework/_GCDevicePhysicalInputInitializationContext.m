@interface _GCDevicePhysicalInputInitializationContext
- (_GCDevicePhysicalInputBase)implementation;
- (_GCDevicePhysicalInputInitializationContext)init;
- (id)viewDataSource:(id)a3;
- (uint64_t)_stateMagic:(uint64_t)result;
- (uint64_t)viewConfiguration;
- (uint64_t)viewProperties;
- (uint64_t)viewState;
- (unint64_t)view:(id)a3 allocateObjectSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6;
- (unint64_t)view:(id)a3 allocatePrimitiveSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6;
- (unint64_t)view:(id)a3 makeReferenceToView:(id)a4;
- (void)dealloc;
- (void)initWithViewConfiguration:(uint64_t)a3 viewProperties:(uint64_t)a4 viewState:;
@end

@implementation _GCDevicePhysicalInputInitializationContext

- (void)initWithViewConfiguration:(uint64_t)a3 viewProperties:(uint64_t)a4 viewState:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)_GCDevicePhysicalInputInitializationContext;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  memset(&callBacks, 0, sizeof(callBacks));
  v7[2] = CFArrayCreateMutable(kCFAllocatorDefault, 0, &callBacks);
  if (a2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithViewConfiguration_viewProperties_viewState_, v7, @"_GCDevicePhysicalInputBase.m", 91, @"Invalid parameter not satisfying: %s", "viewConfiguration == nil || [viewConfiguration isKindOfClass:_GCDevicePhysicalInputStateTable.class]");
    if (!a3) {
      goto LABEL_7;
    }
  }
  else if (!a3)
  {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithViewConfiguration_viewProperties_viewState_, v7, @"_GCDevicePhysicalInputBase.m", 92, @"Invalid parameter not satisfying: %s", "viewProperties == nil || [viewProperties isKindOfClass:_GCDevicePhysicalInputStateTable.class]");
  }
LABEL_7:
  if (a4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithViewConfiguration_viewProperties_viewState_, v7, @"_GCDevicePhysicalInputBase.m", 93, @"Invalid parameter not satisfying: %s", "viewState == nil || [viewState isKindOfClass:_GCDevicePhysicalInputStateTable.class]");
      if (a2) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  if (!a2) {
LABEL_10:
  }
    a2 = objc_opt_new();
LABEL_11:
  v7[3] = a2;
  if (!a3) {
    a3 = objc_opt_new();
  }
  v7[4] = a3;
  if (!a4) {
    a4 = objc_opt_new();
  }
  v7[5] = a4;
  return v7;
}

- (_GCDevicePhysicalInputInitializationContext)init
{
  return (_GCDevicePhysicalInputInitializationContext *)-[_GCDevicePhysicalInputInitializationContext initWithViewConfiguration:viewProperties:viewState:](self, 0, 0, 0);
}

- (void)dealloc
{
  CFRelease(self->_views);
  self->_views = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {

  }
  self->_viewConfiguration = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {

  }
  self->_viewProperties = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {

  }
  self->_viewState = 0;
  self->_implementation = 0;
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputInitializationContext;
  [(_GCDevicePhysicalInputInitializationContext *)&v3 dealloc];
}

- (uint64_t)viewConfiguration
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)viewProperties
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)viewState
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)_stateMagic:(uint64_t)result
{
  if (result)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    return [a2 magic];
  }
  return result;
}

- (id)viewDataSource:(id)a3
{
  return self->_implementation;
}

- (unint64_t)view:(id)a3 makeReferenceToView:(id)a4
{
  v5 = (const void *)[(id)objc_opt_class() withTemplate:a4 context:self];
  unsigned int Count = CFArrayGetCount(self->_views);
  CFArrayAppendValue(self->_views, v5);
  return Count | 0x30000000000;
}

- (unint64_t)view:(id)a3 allocatePrimitiveSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6
{
  unint64_t v6 = a6;
  uint64_t v8 = a4;
  unint64_t v18 = a6;
  v12 = (void *)*((void *)&self->_viewConfiguration + (a4 - 1));
  uint64_t v13 = -[_GCDevicePhysicalInputInitializationContext _stateMagic:]((uint64_t)self, v12);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (HIWORD(v6) != v13)
    {
      v14 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      v15 = (objc_class *)objc_opt_class();
      [v14 handleFailureInMethod:a2, self, @"_GCDevicePhysicalInputBase.m", 193, @"<%@ %p> is allocating a new slot with a copy of the value from %@, in a slot that is not part of the existing state table.", NSStringFromClass(v15), a3, a5, v18 object file lineNumber description];
    }
  }
  else
  {
    v16 = -[_GCDevicePhysicalInputMutableStateTable allocatePrimitiveSlot]((id *)v12);
    objc_msgSend(v12, "setPrimitiveValue:atIndex:", objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource]((uint64_t)a5), "view:primitiveValueForSlot:", a5, &v18), v16);
    return (v13 << 48) | (v8 << 32) | v16 | 0x10000000000;
  }
  return v6;
}

- (unint64_t)view:(id)a3 allocateObjectSlot:(unsigned __int8)a4 withCopyOfValueFromView:(id)a5 slot:(unint64_t)a6
{
  unint64_t v6 = a6;
  uint64_t v8 = a4;
  unint64_t v18 = a6;
  v12 = (void *)*((void *)&self->_viewConfiguration + (a4 - 1));
  uint64_t v13 = -[_GCDevicePhysicalInputInitializationContext _stateMagic:]((uint64_t)self, v12);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (HIWORD(v6) != v13)
    {
      v14 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      v15 = (objc_class *)objc_opt_class();
      [v14 handleFailureInMethod:a2, self, @"_GCDevicePhysicalInputBase.m", 233, @"<%@ %p> is allocating a new slot with a copy of the value from %@, in a slot that is not part of the existing state table.", NSStringFromClass(v15), a3, a5, v18 object file lineNumber description];
    }
  }
  else
  {
    uint64_t v16 = -[_GCDevicePhysicalInputMutableStateTable allocateObjectSlot]((id *)v12);
    objc_msgSend(v12, "setObjectValue:atIndex:policy:", objc_msgSend((id)-[_GCDevicePhysicalInputView dataSource]((uint64_t)a5), "view:objectValueForSlot:", a5, &v18), v16, 769);
    return (v13 << 48) | (v8 << 32) | v16 | 0x20000000000;
  }
  return v6;
}

- (_GCDevicePhysicalInputBase)implementation
{
  return self->_implementation;
}

@end