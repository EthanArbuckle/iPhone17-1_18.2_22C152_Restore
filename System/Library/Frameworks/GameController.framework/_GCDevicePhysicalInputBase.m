@interface _GCDevicePhysicalInputBase
+ (id)debugDescription;
+ (id)description;
- (BOOL)isSnapshot;
- (BOOL)view:(id)a3 testAndSetObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6;
- (BOOL)view:(id)a3 testAndSetPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5;
- (GCDevice)device;
- (NSString)debugDescription;
- (NSString)description;
- (_GCDevicePhysicalInput)physicalInput;
- (_GCDevicePhysicalInputBase)init;
- (_GCDevicePhysicalInputDataSource)dataSource;
- (double)lastEventLatency;
- (double)lastEventTimestamp;
- (id)_initWithFacadeTemplate:(id)a3 elementsTemplates:(id)a4 attributes:(id)a5 context:(id)a6;
- (id)_stateTableForSlot:(SlotID)a3;
- (id)elementsForProtocol:(id *)result;
- (id)view:(id)a3 objectValueForSlot:(unint64_t *)a4;
- (id)view:(id)a3 viewForSlot:(unint64_t *)a4;
- (id)viewConfiguration;
- (id)viewState;
- (uint64_t)_elementAtIndex:(uint64_t)result;
- (uint64_t)_elementCount;
- (uint64_t)_elementForAlias:(uint64_t)a1;
- (uint64_t)attributes;
- (uint64_t)elements;
- (uint64_t)facade;
- (uint64_t)viewProperties;
- (unint64_t)view:(id)a3 primitiveValueForSlot:(unint64_t *)a4;
- (void)dealloc;
- (void)setDataSource:(id)a3;
- (void)setDevice:(id)a3;
- (void)setViewConfiguration:(void *)a1;
- (void)setViewState:(void *)a1;
- (void)view:(id)a3 setObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6;
- (void)view:(id)a3 setPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5;
@end

@implementation _GCDevicePhysicalInputBase

- (id)_initWithFacadeTemplate:(id)a3 elementsTemplates:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v6 = a6;
  if (a3)
  {
    if (a6) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputBase.m", 273, @"Invalid parameter not satisfying: %s", "facadeTemplate != nil");
    if (v6) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputBase.m", 274, @"Invalid parameter not satisfying: %s", "context != nil");
LABEL_3:
  id v32 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_GCDevicePhysicalInputBase;
  v11 = [(_GCDevicePhysicalInputBase *)&v46 init];
  uint64_t v12 = [a5 copy];
  if (!v12) {
    uint64_t v12 = objc_opt_new();
  }
  v11->_attributes = (NSSet *)v12;
  *((void *)v6 + 1) = v11;
  v11->_viewConfiguration = (_GCDevicePhysicalInputStateTable *)*((void *)v6 + 3);
  v11->_viewProperties = (_GCDevicePhysicalInputStateTable *)*((void *)v6 + 4);
  v11->_viewState = (_GCDevicePhysicalInputStateTable *)*((void *)v6 + 5);
  v13 = (void *)[a4 mutableCopy];
  [v13 sortUsingComparator:&__block_literal_global_2];
  v11->_elementCount = [v13 count];
  v11->_indexedElements = (id *)malloc_type_calloc([v13 count], 8uLL, 0x80040B8603338uLL);
  v14 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v13;
  uint64_t v37 = [v13 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v37)
  {
    uint64_t v15 = 0;
    uint64_t v35 = *(void *)v43;
    id v36 = v6;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v11->_indexedElements[v15] = (id)[(id)objc_opt_class() withTemplate:v17 context:v6];
        if (!v11->_indexedElements[v15])
        {
          v24 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
          v25 = (objc_class *)objc_opt_class();
          [v24 handleFailureInMethod:a2, v11, @"_GCDevicePhysicalInputBase.m", 302, @"%@ failed to initialize copy.", NSStringFromClass(v25) object file lineNumber description];
        }
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v18 = (void *)[v17 aliases];
        uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v47 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v39;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v39 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 8 * j);
              if ([v14 objectForKey:v23]) {
                objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, @"_GCDevicePhysicalInputBase.m", 305, @"Duplicate elements with alias: %@", v23);
              }
              objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](&off_26D2B68C8, "numberWithUnsignedInteger:", v15), v23);
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v47 count:16];
          }
          while (v20);
        }
        ++v15;
        id v6 = v36;
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v37);
  }
  v11->_elementIndexByAlias = (NSDictionary *)[v14 copy];

  v11->_additionalViews = CFArrayCreateCopy(kCFAllocatorDefault, *((CFArrayRef *)v6 + 2));
  v26 = [_GCDevicePhysicalInputElementsArray alloc];
  v11->_indexedElementViews = v26;
  v26->_implementation = v11;
  v27 = [_GCDevicePhysicalInputElementsCollection alloc];
  v11->_elementCollection = v27;
  v27->_implementation = v11;
  uint64_t v28 = [(id)objc_opt_class() withTemplate:v32 context:v6];
  v11->_facade = (_GCDevicePhysicalInputFacade *)v28;
  if (!v28)
  {
    v30 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    v31 = (objc_class *)objc_opt_class();
    [v30 handleFailureInMethod:a2, v11, @"_GCDevicePhysicalInputBase.m", 327, @"%@ failed to initialize copy.", NSStringFromClass(v31) object file lineNumber description];
  }
  v11->_viewConfiguration = (_GCDevicePhysicalInputStateTable *)[*((id *)v6 + 3) copy];
  v11->_viewProperties = (_GCDevicePhysicalInputStateTable *)[*((id *)v6 + 4) copy];
  v11->_viewState = (_GCDevicePhysicalInputStateTable *)[*((id *)v6 + 5) copy];
  return v11;
}

- (_GCDevicePhysicalInputBase)init
{
  return 0;
}

- (void)dealloc
{
  __assert_rtn("-[_GCDevicePhysicalInputBase dealloc]", "_GCDevicePhysicalInputBase.m", 342, "_objc_rootRetainCount(_facade) == 1");
}

- (GCDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (GCDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (_GCDevicePhysicalInputDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (_GCDevicePhysicalInputDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (_GCDevicePhysicalInput)physicalInput
{
  return 0;
}

- (uint64_t)_elementCount
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)_elementAtIndex:(uint64_t)result
{
  if (result)
  {
    unint64_t v2 = *(void *)(result + 24);
    if (v2 <= a2) {
      objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](&off_26D2B7178, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"*** %s: index %lu beyond bounds [0 .. %lu]", "-[_GCDevicePhysicalInputBase _elementAtIndex:]", a2, v2), 0));
    }
    return *(void *)(*(void *)(result + 32) + 8 * a2);
  }
  return result;
}

- (uint64_t)_elementForAlias:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v3 = (void *)[*(id *)(a1 + 40) objectForKey:a2];
  if (!v3) {
    return 0;
  }
  unint64_t v4 = [v3 unsignedIntegerValue];

  return -[_GCDevicePhysicalInputBase _elementAtIndex:](a1, v4);
}

- (uint64_t)elements
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (id)elementsForProtocol:(id *)result
{
  if (result)
  {
    if (a2)
    {
      unint64_t v2 = -[_GCPhysicalInputFilteredElementCollection initWithCollection:filter:]((id *)[_GCPhysicalInputFilteredElementCollection alloc], result[8], a2);
      return v2;
    }
    else
    {
      return (id *)result[8];
    }
  }
  return result;
}

- (BOOL)isSnapshot
{
  return 1;
}

- (double)lastEventTimestamp
{
  return 0.0;
}

- (double)lastEventLatency
{
  if (!dword_267F28C8C) {
    mach_timebase_info((mach_timebase_info_t)&lastEventLatency_sTimebaseInfo);
  }
  [(_GCDevicePhysicalInputBase *)self lastEventTimestamp];
  return (double)(mach_absolute_time() * lastEventLatency_sTimebaseInfo / dword_267F28C8C)
       / 1000000000.0
       - v3;
}

- (id)_stateTableForSlot:(SlotID)a3
{
  if (*((unsigned __int8 *)&a3.var1 + 4) == 3)
  {
    if (self)
    {
      ptrdiff_t v7 = 88;
LABEL_10:
      Property = objc_getProperty(self, a2, v7, 1);
      goto LABEL_11;
    }
  }
  else
  {
    if (*((unsigned __int8 *)&a3.var1 + 4) == 2)
    {
      if ((a3.var0 & 0xFF0000000000) != 0x20000000000) {
        -[_GCDevicePhysicalInputBase _stateTableForSlot:]((uint64_t)a2, (uint64_t)self);
      }
      if (self)
      {
        Property = self->_viewProperties;
        goto LABEL_11;
      }
      goto LABEL_15;
    }
    if (self)
    {
      ptrdiff_t v7 = 72;
      goto LABEL_10;
    }
  }
LABEL_15:
  Property = 0;
LABEL_11:
  if (HIWORD(a3.var0) != [Property magic]) {
    objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_GCDevicePhysicalInputBase.m", 485, @"Bad magic");
  }
  return Property;
}

- (id)viewConfiguration
{
  if (result) {
    return objc_getProperty(result, a2, 72, 1);
  }
  return result;
}

- (uint64_t)viewProperties
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (id)viewState
{
  if (result) {
    return objc_getProperty(result, a2, 88, 1);
  }
  return result;
}

- (unint64_t)view:(id)a3 primitiveValueForSlot:(unint64_t *)a4
{
  unint64_t v5 = *a4;
  if ((*a4 & 0xFF0000000000) != 0x10000000000)
  {
    v10 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    v11 = (objc_class *)objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"_GCDevicePhysicalInputBase.m", 492, @"Slot [id: %#.8llx] of view <%@ %p> does not hold a primitive.", v5, NSStringFromClass(v11), a3 object file lineNumber description];
  }
  if ((v5 & 0xFF00000000) == 0x300000000) {
    [(_GCDevicePhysicalInputBase *)self updateViewStateIfNeeded];
  }
  id v6 = [(_GCDevicePhysicalInputBase *)self _stateTableForSlot:v5];

  return [v6 primitiveValueAtIndex:v5];
}

- (void)view:(id)a3 setPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5
{
  unint64_t v7 = *a5;
  if ((*a5 & 0xFF0000000000) != 0x10000000000)
  {
    v11 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    uint64_t v12 = (objc_class *)objc_opt_class();
    [v11 handleFailureInMethod:a2, self, @"_GCDevicePhysicalInputBase.m", 505, @"Slot [id: %#.8llx] of view <%@ %p> does not hold a primitive", v7, NSStringFromClass(v12), a3 object file lineNumber description];
  }
  id v8 = [(_GCDevicePhysicalInputBase *)self _stateTableForSlot:v7];

  [v8 setPrimitiveValue:a4 atIndex:v7];
}

- (BOOL)view:(id)a3 testAndSetPrimitiveValue:(unint64_t)a4 forSlot:(unint64_t *)a5
{
  unint64_t v7 = *a5;
  if ((*a5 & 0xFF0000000000) != 0x10000000000)
  {
    uint64_t v12 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    v13 = (objc_class *)objc_opt_class();
    [v12 handleFailureInMethod:a2, self, @"_GCDevicePhysicalInputBase.m", 514, @"Slot [id: %#.8llx] of view <%@ %p> does not hold a primitive", v7, NSStringFromClass(v13), a3 object file lineNumber description];
  }
  id v8 = [(_GCDevicePhysicalInputBase *)self _stateTableForSlot:v7];

  return [v8 testAndSetPrimitiveValue:a4 atIndex:v7 previous:0];
}

- (id)view:(id)a3 objectValueForSlot:(unint64_t *)a4
{
  unint64_t v5 = *a4;
  if ((*a4 & 0xFF0000000000) != 0x20000000000)
  {
    v10 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    v11 = (objc_class *)objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"_GCDevicePhysicalInputBase.m", 523, @"Slot [id: %#.8llx] of view <%@ %p> does not hold an object", v5, NSStringFromClass(v11), a3 object file lineNumber description];
  }
  if ((v5 & 0xFF00000000) == 0x300000000) {
    [(_GCDevicePhysicalInputBase *)self updateViewStateIfNeeded];
  }
  id v6 = [(_GCDevicePhysicalInputBase *)self _stateTableForSlot:v5];

  return (id)[v6 objectValueAtIndex:v5];
}

- (void)view:(id)a3 setObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6
{
  unint64_t v10 = *a5;
  if ((*a5 & 0xFF00000000) == 0x200000000)
  {
    -[_GCDevicePhysicalInputBase view:testAndSetObjectValue:forSlot:policy:](self, "view:testAndSetObjectValue:forSlot:policy:");
  }
  else
  {
    if ((v10 & 0xFF0000000000) != 0x20000000000)
    {
      v13 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      v14 = (objc_class *)objc_opt_class();
      [v13 handleFailureInMethod:a2, self, @"_GCDevicePhysicalInputBase.m", 540, @"Slot [id: %#.8llx] of view <%@ %p> does not hold an object", v10, NSStringFromClass(v14), a3 object file lineNumber description];
    }
    id v11 = [(_GCDevicePhysicalInputBase *)self _stateTableForSlot:v10];
    [v11 setObjectValue:a4 atIndex:v10 policy:a6];
  }
}

- (BOOL)view:(id)a3 testAndSetObjectValue:(id)a4 forSlot:(unint64_t *)a5 policy:(unint64_t)a6
{
  unint64_t v9 = *a5;
  if ((*a5 & 0xFF0000000000) != 0x20000000000)
  {
    v14 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    uint64_t v15 = (objc_class *)objc_opt_class();
    [v14 handleFailureInMethod:a2, self, @"_GCDevicePhysicalInputBase.m", 549, @"Slot [id: %#.8llx] of view <%@ %p> does not hold an object", v9, NSStringFromClass(v15), a3 object file lineNumber description];
  }
  id v10 = [(_GCDevicePhysicalInputBase *)self _stateTableForSlot:v9];

  return [v10 testAndSetObjectValue:a4 atIndex:v9 policy:a6 compareObjects:1 previous:0];
}

- (id)view:(id)a3 viewForSlot:(unint64_t *)a4
{
  unint64_t v5 = *a4;
  if ((*a4 & 0xFF0000000000) != 0x30000000000)
  {
    id v10 = (void *)unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    id v11 = (objc_class *)objc_opt_class();
    [v10 handleFailureInMethod:a2, self, @"_GCDevicePhysicalInputBase.m", 558, @"Slot [id: %#.8llx] of view <%@ %p> does not hold a view-ref", v5, NSStringFromClass(v11), a3 object file lineNumber description];
  }
  id result = self->_additionalViews;
  if (result)
  {
    if (v5 >= CFArrayGetCount((CFArrayRef)result))
    {
      uint64_t v12 = +[NSException exceptionWithName:reason:userInfo:](&off_26D2B7178, "exceptionWithName:reason:userInfo:", NSRangeException, +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"*** %s: index %u beyond bounds [0 .. %lu]", "-[_GCDevicePhysicalInputBase view:viewForSlot:]", v5, CFArrayGetCount(self->_additionalViews)), 0);
      objc_exception_throw(v12);
    }
    additionalViews = self->_additionalViews;
    return (id)CFArrayGetValueAtIndex(additionalViews, v5);
  }
  return result;
}

+ (id)description
{
  return @"Physical Input";
}

+ (id)debugDescription
{
  unint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSString)description
{
  if (self)
  {
    if ([(NSSet *)self->_attributes count])
    {
      attributes = self->_attributes;
LABEL_4:
      unint64_t v4 = [(NSArray *)[(NSSet *)attributes allObjects] componentsJoinedByString:@", "];
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = [0 count];
    attributes = 0;
    if (v5) {
      goto LABEL_4;
    }
  }
  unint64_t v4 = @"default";
LABEL_7:
  uint64_t v6 = objc_opt_class();
  BOOL v7 = [(_GCDevicePhysicalInputBase *)self isSnapshot];
  if (self) {
    indexedElementViews = self->_indexedElementViews;
  }
  else {
    indexedElementViews = 0;
  }
  if (v7) {
    unint64_t v9 = @" Snapshot";
  }
  else {
    unint64_t v9 = &stru_26D27BBB8;
  }
  return +[NSString stringWithFormat:@"%@%@ '%@' (%zi elements)", v6, v9, v4, [(_GCDevicePhysicalInputElementsArray *)indexedElementViews count]];
}

- (uint64_t)attributes
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (NSString)debugDescription
{
  unint64_t v2 = self;
  if (self)
  {
    if ([(NSSet *)self->_attributes count])
    {
      attributes = v2->_attributes;
LABEL_4:
      unint64_t v4 = [(NSArray *)[(NSSet *)attributes allObjects] componentsJoinedByString:@", "];
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = [0 count];
    attributes = 0;
    if (v5) {
      goto LABEL_4;
    }
  }
  unint64_t v4 = @"default";
LABEL_7:
  uint64_t v6 = (objc_class *)objc_opt_class();
  BOOL v7 = +[NSMutableString stringWithFormat:@"<%@ %p> '%@' {", NSStringFromClass(v6), v2, v4];
  if (v2)
  {
    -[NSMutableString appendFormat:](v7, "appendFormat:", @"\n\t%@", objc_msgSend((id)-[_GCDevicePhysicalInputFacade debugDescription](v2->_facade, "debugDescription"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @"\n\t"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    unint64_t v2 = (_GCDevicePhysicalInputBase *)v2->_indexedElementViews;
  }
  else
  {
    -[NSMutableString appendFormat:](v7, "appendFormat:", @"\n\t%@", objc_msgSend((id)objc_msgSend(0, "debugDescription"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @"\n\t"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
  }
  uint64_t v8 = [(_GCDevicePhysicalInputBase *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v2);
        }
        -[NSMutableString appendFormat:](v7, "appendFormat:", @"\n\t%@", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "debugDescription"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @"\n\t"));
      }
      uint64_t v9 = [(_GCDevicePhysicalInputBase *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  [(NSMutableString *)v7 appendString:@"\n}"];
  return &v7->super;
}

- (uint64_t)facade
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (void)setViewConfiguration:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 72);
  }
}

- (void)setViewState:(void *)a1
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 88);
  }
}

- (void)_stateTableForSlot:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
}

@end