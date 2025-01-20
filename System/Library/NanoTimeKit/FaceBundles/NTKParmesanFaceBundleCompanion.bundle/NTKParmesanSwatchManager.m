@interface NTKParmesanSwatchManager
- (NSMapTable)swatchRefreshHandlers;
- (NTKParmesanSwatchManager)init;
- (void)executeAllHandlers;
- (void)removeWithoutExecutingAllHandlers;
- (void)setHandler:(id)a3 forKey:(id)a4;
- (void)setSwatchRefreshHandlers:(id)a3;
@end

@implementation NTKParmesanSwatchManager

- (NTKParmesanSwatchManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)NTKParmesanSwatchManager;
  v5 = [(NTKParmesanSwatchManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_strongToStrongObjectsMapTable(MEMORY[0x263F08968], v2, v3, v4);
    swatchRefreshHandlers = v5->_swatchRefreshHandlers;
    v5->_swatchRefreshHandlers = (NSMapTable *)v6;
  }
  return v5;
}

- (void)setHandler:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    swatchRefreshHandlers = self->_swatchRefreshHandlers;
    id v6 = a4;
    id v12 = (id)objc_msgSend_copy(a3, v7, v8, v9);
    v10 = _Block_copy(v12);
    objc_msgSend_setObject_forKey_(swatchRefreshHandlers, v11, (uint64_t)v10, (uint64_t)v6);
  }
}

- (void)executeAllHandlers
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend_objectEnumerator(self->_swatchRefreshHandlers, a2, v2, v3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v10++) + 16))();
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v8);
  }

  objc_msgSend_removeAllObjects(self->_swatchRefreshHandlers, v12, v13, v14);
}

- (void)removeWithoutExecutingAllHandlers
{
  objc_msgSend_removeAllObjects(self->_swatchRefreshHandlers, a2, v2, v3);
}

- (NSMapTable)swatchRefreshHandlers
{
  return self->_swatchRefreshHandlers;
}

- (void)setSwatchRefreshHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end