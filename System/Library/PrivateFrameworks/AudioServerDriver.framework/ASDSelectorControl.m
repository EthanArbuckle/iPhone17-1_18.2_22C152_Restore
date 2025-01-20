@interface ASDSelectorControl
- (ASDSelectorControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5;
- (ASDSelectorControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6;
- (ASDSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6;
- (ASDSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6 andObjectClassID:(unsigned int)a7;
- (ASDSelectorControl)initWithIsSettable:(BOOL)a3 withPlugin:(id)a4;
- (BOOL)changeValue:(unsigned int)a3;
- (BOOL)changeValues:(const unsigned int *)a3 withCount:(unint64_t)a4;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasKindProperty;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isSettable;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (BOOL)setSelectedValues:(const unsigned int *)a3 withCount:(unint64_t)a4;
- (BOOL)setSelectedValues:(id)a3;
- (NSArray)selectedValues;
- (id)_findValue:(unsigned int)a3;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (id)nameForValue:(unsigned int)a3;
- (id)values;
- (unint64_t)_indexOfValue:(unsigned int)a3;
- (unsigned)baseClass;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)kindForValue:(unsigned int)a3;
- (unsigned)minDataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)selectedValue;
- (void)_updateSelectedValue;
- (void)addValue:(id)a3;
- (void)removeValue:(id)a3;
- (void)setHasKindProperty:(BOOL)a3;
- (void)setSelectedValue:(unsigned int)a3;
@end

@implementation ASDSelectorControl

- (ASDSelectorControl)initWithIsSettable:(BOOL)a3 withPlugin:(id)a4
{
  return [(ASDSelectorControl *)self initWithIsSettable:a3 forElement:0 inScope:1735159650 withPlugin:a4];
}

- (ASDSelectorControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5
{
  return [(ASDSelectorControl *)self initWithIsSettable:0 forElement:*(void *)&a3 inScope:*(void *)&a4 withPlugin:a5];
}

- (ASDSelectorControl)initWithElement:(unsigned int)a3 inScope:(unsigned int)a4 withPlugin:(id)a5 andObjectClassID:(unsigned int)a6
{
  return [(ASDSelectorControl *)self initWithIsSettable:0 forElement:*(void *)&a3 inScope:*(void *)&a4 withPlugin:a5 andObjectClassID:*(void *)&a6];
}

- (ASDSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6
{
  return [(ASDSelectorControl *)self initWithIsSettable:a3 forElement:*(void *)&a4 inScope:*(void *)&a5 withPlugin:a6 andObjectClassID:1936483188];
}

- (ASDSelectorControl)initWithIsSettable:(BOOL)a3 forElement:(unsigned int)a4 inScope:(unsigned int)a5 withPlugin:(id)a6 andObjectClassID:(unsigned int)a7
{
  v21.receiver = self;
  v21.super_class = (Class)ASDSelectorControl;
  v8 = [(ASDControl *)&v21 initWithElement:*(void *)&a4 inScope:*(void *)&a5 withPlugin:a6 andObjectClassID:*(void *)&a7];
  v9 = v8;
  if (v8)
  {
    v8->_settable = a3;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    values = v9->_values;
    v9->_values = v10;

    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 bundleIdentifier];
    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    id v17 = [v14 stringWithFormat:@"%@.%@.%p", v13, v16, v9];
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    valueQueue = v9->_valueQueue;
    v9->_valueQueue = (OS_dispatch_queue *)v18;
  }
  return v9;
}

- (unsigned)baseClass
{
  return 1936483188;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  BOOL result = 1;
  if ((int)a3->mSelector > 1935893352)
  {
    if (mSelector != 1935893353 && mSelector != 1935894894)
    {
LABEL_11:
      v7.receiver = self;
      v7.super_class = (Class)ASDSelectorControl;
      return -[ASDControl hasProperty:](&v7, sel_hasProperty_);
    }
  }
  else
  {
    if (mSelector != 1668049771)
    {
      if (mSelector == 1935892841) {
        return result;
      }
      goto LABEL_11;
    }
    return self->_hasKindProperty;
  }
  return result;
}

- (unsigned)minDataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1935893353) {
    return 4;
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDSelectorControl;
  return -[ASDObject minDataSizeForProperty:withQualifierSize:andQualifierData:](&v6, sel_minDataSizeForProperty_withQualifierSize_andQualifierData_);
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if ((int)a3->mSelector > 1935893352)
  {
    if (mSelector != 1935894894)
    {
      if (mSelector == 1935893353)
      {
        uint64_t v17 = 0;
        dispatch_queue_t v18 = &v17;
        uint64_t v19 = 0x2020000000;
        uint64_t v20 = 0;
        uint64_t v13 = 0;
        v14 = &v13;
        uint64_t v15 = 0x2020000000;
        valueQueue = self->_valueQueue;
        uint64_t v16 = 0;
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __77__ASDSelectorControl_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
        v12[3] = &unk_264773510;
        v12[4] = self;
        v12[5] = &v17;
        v12[6] = &v13;
        dispatch_sync(valueQueue, v12);
        if (v14[3]) {
          unsigned int v7 = 4 * *((_DWORD *)v18 + 6);
        }
        else {
          unsigned int v7 = 4;
        }
        _Block_object_dispose(&v13, 8);
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    return 8;
  }
  else
  {
    if (mSelector != 1668049771)
    {
      if (mSelector == 1935892841)
      {
        uint64_t v17 = 0;
        dispatch_queue_t v18 = &v17;
        uint64_t v19 = 0x2020000000;
        uint64_t v20 = 0;
        objc_super v6 = self->_valueQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __77__ASDSelectorControl_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
        block[3] = &unk_264773158;
        block[4] = self;
        block[5] = &v17;
        dispatch_sync(v6, block);
        unsigned int v7 = 4 * *((_DWORD *)v18 + 6);
LABEL_16:
        _Block_object_dispose(&v17, 8);
        return v7;
      }
LABEL_13:
      v10.receiver = self;
      v10.super_class = (Class)ASDSelectorControl;
      return -[ASDControl dataSizeForProperty:withQualifierSize:andQualifierData:](&v10, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
    }
    return 4 * self->_hasKindProperty;
  }
}

uint64_t __77__ASDSelectorControl_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 96);
  uint64_t result = [*(id *)(a1[4] + 88) count];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __77__ASDSelectorControl_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_indexOfValue:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_values;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7 + v6;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "value", (void)v13) == a3)
        {
          unint64_t v11 = v7 + v9;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  unint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v11;
}

- (id)_findValue:(unsigned int)a3
{
  unint64_t v4 = [(ASDSelectorControl *)self _indexOfValue:*(void *)&a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [(NSMutableArray *)self->_values objectAtIndex:v4];
  }
  return v5;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  if (a3 && a6 && a7)
  {
    AudioObjectPropertySelector mSelector = a3->mSelector;
    if ((int)a3->mSelector > 1935893352)
    {
      if (mSelector != 1935894894)
      {
        if (mSelector == 1935893353)
        {
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x2020000000;
          uint64_t v30 = 0;
          valueQueue = self->_valueQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
          block[3] = &unk_264773180;
          void block[6] = a7;
          block[7] = a6;
          block[4] = self;
          block[5] = &v27;
          unint64_t v11 = block;
          goto LABEL_11;
        }
LABEL_22:
        v20.receiver = self;
        v20.super_class = (Class)ASDSelectorControl;
        unsigned __int8 v17 = -[ASDControl getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v20, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
        *((unsigned char *)v32 + 24) = v17;
        goto LABEL_23;
      }
      if (a4 >= 4 && a5 && *a6 >= 8)
      {
        int v15 = *(_DWORD *)a5;
        long long v16 = self->_valueQueue;
        v23[0] = MEMORY[0x263EF8330];
        v23[1] = 3221225472;
        v23[2] = __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
        v23[3] = &unk_264773538;
        int v24 = v15;
        v23[4] = self;
        v23[5] = &v31;
        v23[6] = a7;
        dispatch_sync(v16, v23);
        unsigned int v14 = 8;
        goto LABEL_21;
      }
    }
    else
    {
      if (mSelector != 1668049771)
      {
        if (mSelector == 1935892841)
        {
          uint64_t v27 = 0;
          v28 = &v27;
          uint64_t v29 = 0x2020000000;
          uint64_t v30 = 0;
          valueQueue = self->_valueQueue;
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
          v25[3] = &unk_264773180;
          v25[6] = a6;
          v25[7] = a7;
          v25[4] = self;
          v25[5] = &v27;
          unint64_t v11 = v25;
LABEL_11:
          dispatch_sync(valueQueue, v11);
          *a6 = 4 * *((_DWORD *)v28 + 6);
          *((unsigned char *)v32 + 24) = 1;
          _Block_object_dispose(&v27, 8);
          goto LABEL_23;
        }
        goto LABEL_22;
      }
      if (self->_hasKindProperty && a4 >= 4 && a5 && *a6 >= 4)
      {
        int v12 = *(_DWORD *)a5;
        long long v13 = self->_valueQueue;
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4;
        v21[3] = &unk_264773538;
        int v22 = v12;
        v21[4] = self;
        v21[5] = &v31;
        v21[6] = a7;
        dispatch_sync(v13, v21);
        unsigned int v14 = 4;
LABEL_21:
        *a6 = v14;
      }
    }
  }
LABEL_23:
  char v18 = *((unsigned char *)v32 + 24);
  _Block_object_dispose(&v31, 8);
  return v18;
}

void __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  if ([*(id *)(*(void *)(a1 + 32) + 88) count])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    unint64_t v4 = **(unsigned int **)(a1 + 56);
    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 96) >= v4 >> 2) {
      unint64_t v6 = v4 >> 2;
    }
    else {
      unint64_t v6 = *(void *)(v5 + 96);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = *(id *)(v5 + 88);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "selected", (void)v16))
          {
            if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= v6) {
              goto LABEL_15;
            }
            int v13 = [v12 value];
            uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v15 = *(void *)(v14 + 24);
            *(void *)(v14 + 24) = v15 + 1;
            *(_DWORD *)(v3 + 4 * v15) = v13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
LABEL_15:
  }
  else if (**(_DWORD **)(a1 + 56) >= 4u)
  {
    **(_DWORD **)(a1 + 48) = *(_DWORD *)(*(void *)(a1 + 32) + 80);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  unint64_t v3 = **(unsigned int **)(a1 + 48);
  if ([*(id *)(*(void *)(a1 + 32) + 88) count] <= v3 >> 2) {
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 88) count];
  }
  else {
    unint64_t v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  }
  uint64_t v5 = *(void *)(a1 + 56);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
LABEL_6:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v12 != v9) {
        objc_enumerationMutation(v6);
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == v4) {
        break;
      }
      *(_DWORD *)(v5 + 4 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++) = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "value", (void)v11);
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v8) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

void __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A63EEF0]();
  unint64_t v3 = [*(id *)(a1 + 32) _findValue:*(unsigned int *)(a1 + 56)];
  unint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 name];
    **(void **)(a1 + 48) = v5;

    id v6 = **(const void ***)(a1 + 48);
    if (v6) {
      CFRetain(v6);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __93__ASDSelectorControl_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A63EEF0]();
  unint64_t v3 = [*(id *)(a1 + 32) _findValue:*(unsigned int *)(a1 + 56)];
  unint64_t v4 = v3;
  if (v3)
  {
    **(_DWORD **)(a1 + 48) = [v3 kind];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  if (a3->mSelector == 1935893353)
  {
    return [(ASDSelectorControl *)self isSettable];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASDSelectorControl;
    return -[ASDObject isPropertySettable:](&v4, sel_isPropertySettable_);
  }
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  if (a3)
  {
    uint64_t v8 = *(void *)&a8;
    uint64_t v10 = *(void *)&a6;
    uint64_t v12 = *(void *)&a4;
    BOOL v15 = -[ASDSelectorControl hasProperty:](self, "hasProperty:");
    if (v15)
    {
      BOOL v15 = [(ASDSelectorControl *)self isPropertySettable:a3];
      if (v15)
      {
        if (a3->mSelector == 1935893353)
        {
          if (v10 == 4)
          {
            uint64_t v16 = *(unsigned int *)a7;
            LOBYTE(v15) = [(ASDSelectorControl *)self changeValue:v16];
          }
          else
          {
            LOBYTE(v15) = [(ASDSelectorControl *)self changeValues:a7 withCount:v10 >> 2];
          }
        }
        else
        {
          v18.receiver = self;
          v18.super_class = (Class)ASDSelectorControl;
          LOBYTE(v15) = [(ASDObject *)&v18 setProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:a7 forClient:v8];
        }
      }
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }
  return v15;
}

- (void)_updateSelectedValue
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  self->_selectedValue = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v3 = self->_values;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "selected", (void)v9))
        {
          self->_selectedValue = [v8 value];
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)addValue:(id)a3
{
  id v4 = a3;
  valueQueue = self->_valueQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __31__ASDSelectorControl_addValue___block_invoke;
  v7[3] = &unk_2647731F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(valueQueue, v7);
}

void __31__ASDSelectorControl_addValue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_indexOfValue:", objc_msgSend(*(id *)(a1 + 40), "value"));
  id v4 = *(void **)(*(void *)(a1 + 32) + 88);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 addObject:*(void *)(a1 + 40)];
    if (![*(id *)(a1 + 40) selected]) {
      goto LABEL_14;
    }
    ++*(void *)(*(void *)(a1 + 32) + 96);
    uint64_t v5 = *(void **)(a1 + 32);
    if (v5[12] != 1) {
      goto LABEL_14;
    }
LABEL_13:
    [v5 _updateSelectedValue];
    goto LABEL_14;
  }
  id v6 = [v4 objectAtIndex:v3];
  if ([v6 selected] && (objc_msgSend(*(id *)(a1 + 40), "selected") & 1) == 0)
  {
    --*(void *)(*(void *)(a1 + 32) + 96);
    int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 80);
    int v8 = [v6 value];
    [*(id *)(*(void *)(a1 + 32) + 88) removeObjectAtIndex:v3];
    [*(id *)(*(void *)(a1 + 32) + 88) insertObject:*(void *)(a1 + 40) atIndex:v3];

    if (v7 != v8) {
      goto LABEL_14;
    }
    uint64_t v5 = *(void **)(a1 + 32);
    goto LABEL_13;
  }
  if (([v6 selected] & 1) == 0 && objc_msgSend(*(id *)(a1 + 40), "selected")) {
    ++*(void *)(*(void *)(a1 + 32) + 96);
  }
  [*(id *)(*(void *)(a1 + 32) + 88) removeObjectAtIndex:v3];
  [*(id *)(*(void *)(a1 + 32) + 88) insertObject:*(void *)(a1 + 40) atIndex:v3];

LABEL_14:
}

- (void)removeValue:(id)a3
{
  id v4 = a3;
  valueQueue = self->_valueQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__ASDSelectorControl_removeValue___block_invoke;
  v7[3] = &unk_2647731F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(valueQueue, v7);
}

void __34__ASDSelectorControl_removeValue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 88) indexOfObject:*(void *)(a1 + 40)];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = v3;
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 88) objectAtIndex:v3];
    if ([v5 selected]) {
      --*(void *)(*(void *)(a1 + 32) + 96);
    }
    [*(id *)(*(void *)(a1 + 32) + 88) removeObjectAtIndex:v4];
    int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 80);
    if (v6 == [v5 value]) {
      [*(id *)(a1 + 32) _updateSelectedValue];
    }
  }
}

- (id)values
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__5;
  long long v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__ASDSelectorControl_values__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __28__ASDSelectorControl_values__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 88) copy];
  return MEMORY[0x270F9A758]();
}

- (id)nameForValue:(unsigned int)a3
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__5;
  valueQueue = self->_valueQueue;
  long long v12 = __Block_byref_object_dispose__5;
  id v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ASDSelectorControl_nameForValue___block_invoke;
  block[3] = &unk_264773560;
  unsigned int v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(valueQueue, block);
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __35__ASDSelectorControl_nameForValue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A63EEF0]();
  id v3 = [*(id *)(a1 + 32) _findValue:*(unsigned int *)(a1 + 48)];
  uint64_t v4 = [v3 name];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (unsigned)kindForValue:(unsigned int)a3
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  valueQueue = self->_valueQueue;
  int v11 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__ASDSelectorControl_kindForValue___block_invoke;
  block[3] = &unk_264773560;
  unsigned int v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(valueQueue, block);
  unsigned int v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __35__ASDSelectorControl_kindForValue___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A63EEF0]();
  id v3 = [*(id *)(a1 + 32) _findValue:*(unsigned int *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 kind];
}

- (BOOL)changeValue:(unsigned int)a3
{
  unsigned int v4 = a3;
  return [(ASDSelectorControl *)self changeValues:&v4 withCount:1];
}

- (BOOL)changeValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  return 0;
}

- (BOOL)setSelectedValues:(const unsigned int *)a3 withCount:(unint64_t)a4
{
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__5;
  objc_super v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  valueQueue = self->_valueQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__ASDSelectorControl_setSelectedValues_withCount___block_invoke;
  block[3] = &unk_264773588;
  block[7] = a4;
  void block[8] = a3;
  block[4] = self;
  block[5] = &v12;
  void block[6] = &v16;
  dispatch_sync(valueQueue, block);
  if (*((unsigned char *)v13 + 24))
  {
    [(ASDSelectorControl *)self selectionDidChange:v17[5]];
    int v10 = 0;
    uint64_t v9 = 0x676C6F6273636369;
    uint64_t v6 = [(ASDObject *)self propertyChangedDelegate];
    [v6 changedProperty:&v9 forObject:self];

    BOOL v7 = *((unsigned char *)v13 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v7;
}

void __50__ASDSelectorControl_setSelectedValues_withCount___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    LODWORD(v3) = **(_DWORD **)(a1 + 64);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v4 + 80) != v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *(_DWORD *)(*(void *)(a1 + 32) + 80) = v3;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  if ([*(id *)(v4 + 88) count])
  {
    v25 = v2;
    *(void *)(*(void *)(a1 + 32) + 96) = 0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 88);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "setPrevSelected:", objc_msgSend(v10, "selected"));
          [v10 setSelected:0];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    if (*(void *)(a1 + 56))
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = [*(id *)(a1 + 32) _findValue:*(unsigned int *)(*(void *)(a1 + 64) + 4 * v11)];
        id v13 = v12;
        if (v12)
        {
          ++*(void *)(*(void *)(a1 + 32) + 96);
          [v12 setSelected:1];
        }

        ++v11;
      }
      while (v11 < *(void *)(a1 + 56));
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = *(id *)(*(void *)(a1 + 32) + 88);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          int v20 = [v19 prevSelected];
          if (v20 != [v19 selected])
          {
            id v21 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            if (!v21)
            {
              uint64_t v22 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "count"));
              uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
              int v24 = *(void **)(v23 + 40);
              *(void *)(v23 + 40) = v22;

              id v21 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            }
            [v21 addObject:v19];
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v16);
    }

    v2 = v25;
  }
}

- (BOOL)setSelectedValues:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  uint64_t v6 = v5;
  if (!v5)
  {
LABEL_16:
    id v16 = (id) v5;
    BOOL v17 = -[ASDSelectorControl setSelectedValues:withCount:](self, "setSelectedValues:withCount:", [v16 bytes], v6);

    goto LABEL_23;
  }
  uint64_t v7 = [MEMORY[0x263EFF990] dataWithLength:4 * v5];
  if (v7)
  {
    id v19 = v7;
    uint64_t v20 = [v19 mutableBytes];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v22;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v8);
        }
        if (!(v11 - v6 + v13)) {
          break;
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v15 = [v14 unsignedIntValue];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[ASDSelectorControl setSelectedValues:]();
            }

            BOOL v17 = 0;
            goto LABEL_23;
          }
          int v15 = [v14 value];
        }
        *(_DWORD *)(v20 + 4 * v11 + 4 * v13++) = v15;
        if (v10 == v13)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
          v11 += v13;
          if (v10) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    uint64_t v5 = (uint64_t)v19;
    goto LABEL_16;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[ASDSelectorControl setSelectedValues:]();
  }
  BOOL v17 = 0;
LABEL_23:

  return v17;
}

- (void)setSelectedValue:(unsigned int)a3
{
  unsigned int v3 = a3;
  [(ASDSelectorControl *)self setSelectedValues:&v3 withCount:1];
}

- (unsigned)selectedValue
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1;
  valueQueue = self->_valueQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__ASDSelectorControl_selectedValue__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(valueQueue, v5);
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__ASDSelectorControl_selectedValue__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 80);
  return result;
}

- (NSArray)selectedValues
{
  unsigned int v3 = [MEMORY[0x263EFF980] arrayWithCapacity:self->_numSelected];
  valueQueue = self->_valueQueue;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __36__ASDSelectorControl_selectedValues__block_invoke;
  uint64_t v11 = &unk_2647731F8;
  uint64_t v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(valueQueue, &v8);
  uint64_t v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSArray *)v6;
}

void __36__ASDSelectorControl_selectedValues__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "selected", (void)v9)) {
          [*(id *)(a1 + 40) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDSelectorControl;
  uint64_t v7 = [(ASDControl *)&v21 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  BOOL v8 = [(ASDSelectorControl *)self isSettable];
  long long v9 = @"NO";
  if (v8) {
    long long v9 = @"YES";
  }
  [v7 appendFormat:@"%@|    Is Settable: %@\n", v6, v9];
  [v7 appendFormat:@"%@|    Current Item: %u\n", v6, -[ASDSelectorControl selectedValue](self, "selectedValue")];
  [v7 appendFormat:@"%@|    Available Items:\n", v6];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = [(ASDSelectorControl *)self values];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v10);
        }
        [v7 appendFormat:@"%@|        %u: %@\n", v6, v13 + i, *(void *)(*((void *)&v17 + 1) + 8 * i)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      uint64_t v13 = (v13 + i);
    }
    while (v12);
  }

  return v7;
}

- (id)driverClassName
{
  int v2 = [(ASDControl *)self objectClass];
  id v3 = @"AudioSelectorControl";
  BOOL v4 = @"AudioDataSourceControl";
  if (v2 != 1685287523) {
    BOOL v4 = @"AudioSelectorControl";
  }
  if (v2 == 1751740518) {
    uint64_t v5 = @"AudioHighPassFilterControl";
  }
  else {
    uint64_t v5 = v4;
  }
  if (v2 == 1852601964) {
    id v6 = @"AudioLineLevelControl";
  }
  else {
    id v6 = v5;
  }
  if (v2 == 1684370292) {
    id v3 = @"AudioDataDestinationControl";
  }
  if (v2 == 1668047723) {
    id v3 = @"AudioClockSourceControl";
  }
  if (v2 <= 1685287522) {
    return v3;
  }
  else {
    return v6;
  }
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (BOOL)hasKindProperty
{
  return self->_hasKindProperty;
}

- (void)setHasKindProperty:(BOOL)a3
{
  self->_hasKindProperty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueQueue, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (void)setSelectedValues:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  int v0 = 136315138;
  v1 = "-[ASDSelectorControl setSelectedValues:]";
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Memory allocation error.", (uint8_t *)&v0, 0xCu);
}

- (void)setSelectedValues:.cold.2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  int v2 = 136315394;
  id v3 = "-[ASDSelectorControl setSelectedValues:]";
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Bad input object: %@", (uint8_t *)&v2, 0x16u);
}

@end