@interface IMChatTranscriptLayoutEngine
- (CGSize)contentSize;
- (IMChatTranscriptLayoutEngine)init;
- (IMChatTranscriptLayoutEngineDataSource)dataSource;
- (IMChatTranscriptLayoutSpecification)layoutSpecification;
- (NSArray)layoutAttributes;
- (double)_spaceForVerticalSpaceDescriptor:(int64_t)a3;
- (id)_cachedDrawableAtIndexOrNil:(unint64_t)a3;
- (id)_cachedDrawableForTranscriptItem:(id)a3 atIndex:(unint64_t)a4;
- (id)_makeDrawableForTranscriptItem:(id)a3;
- (id)drawableAtIndex:(unint64_t)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (unint64_t)_numberOfTranscriptItems;
- (void)_buildLayoutAttributesIfNeeded;
- (void)_invalidateCachedItemData;
- (void)_updateContentSize;
- (void)_updateFrames;
- (void)invalidateLayout;
- (void)reloadData;
- (void)removeItemsAtIndexPaths:(id)a3 insertItemsAtIndexPaths:(id)a4;
- (void)setContentSize:(CGSize)a3;
- (void)setDataSource:(id)a3;
- (void)setLayoutAttributes:(id)a3;
- (void)setLayoutSpecification:(id)a3;
@end

@implementation IMChatTranscriptLayoutEngine

- (IMChatTranscriptLayoutEngine)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMChatTranscriptLayoutEngine;
  v2 = [(IMChatTranscriptLayoutEngine *)&v8 init];
  v5 = v2;
  if (v2)
  {
    objc_msgSend__invalidateCachedItemData(v2, v3, v4);
    v6 = v5;
  }

  return v5;
}

- (void)setLayoutSpecification:(id)a3
{
  uint64_t v4 = (const char *)a3;
  uint64_t layoutSpecification = (uint64_t)self->_layoutSpecification;
  if ((const char *)layoutSpecification != v4)
  {
    v11 = (char *)v4;
    uint64_t layoutSpecification = objc_msgSend_isEqual_((void *)layoutSpecification, v4, (uint64_t)v4);
    uint64_t v4 = v11;
    if ((layoutSpecification & 1) == 0)
    {
      v7 = (IMChatTranscriptLayoutSpecification *)objc_msgSend_copy(v11, v11, v6);
      objc_super v8 = self->_layoutSpecification;
      self->_uint64_t layoutSpecification = v7;

      uint64_t layoutSpecification = objc_msgSend_invalidateLayout(self, v9, v10);
      uint64_t v4 = v11;
    }
  }
  MEMORY[0x270F9A758](layoutSpecification, v4);
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    objc_msgSend_reloadData(self, v6, v7);
    v5 = obj;
  }
}

- (void)reloadData
{
  objc_msgSend__invalidateCachedItemData(self, a2, v2);
  objc_msgSend_invalidateLayout(self, v4, v5);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_layoutAttributes(self, v5, v6);
  unint64_t v10 = objc_msgSend_item(v4, v8, v9);

  if (v10 >= objc_msgSend_count(v7, v11, v12))
  {
    objc_msgSend_count(v7, v13, v14);
    _IMWarn();
    v15 = 0;
  }
  else
  {
    v15 = objc_msgSend_objectAtIndexedSubscript_(v7, v13, v10);
  }

  return v15;
}

- (CGSize)contentSize
{
  if (!self->_layoutAttributes) {
    id v4 = (id)objc_msgSend_layoutAttributes(self, a2, v2);
  }
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_buildLayoutAttributesIfNeeded
{
  if (!self->_layoutAttributes)
  {
    p_dataSource = &self->_dataSource;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      uint64_t layoutSpecification = self->_layoutSpecification;

      if (layoutSpecification)
      {
        objc_msgSend_layoutBoundsSize(self->_layoutSpecification, v6, v7);
        double v9 = v8;
        objc_msgSend_maximumBubbleWidth(self->_layoutSpecification, v10, v11);
        double v13 = v12;
        uint64_t v16 = objc_msgSend__numberOfTranscriptItems(self, v14, v15);
        id v17 = objc_alloc(MEMORY[0x263EFF980]);
        v20 = (NSArray *)objc_msgSend_initWithCapacity_(v17, v18, v16);
        if (v16)
        {
          uint64_t v21 = 0;
          v22 = 0;
          do
          {
            v23 = objc_msgSend_indexPathForItem_inSection_(MEMORY[0x263F088C8], v19, v21, 0);
            id v24 = objc_loadWeakRetained((id *)p_dataSource);
            v26 = objc_msgSend_layoutEngine_transcriptItemAtIndex_(v24, v25, (uint64_t)self, v21);

            v28 = objc_msgSend__cachedDrawableForTranscriptItem_atIndex_(self, v27, (uint64_t)v26, v21);
            objc_msgSend_sizeConstrainedToWidth_(v28, v29, v30, v13);
            double v32 = v31;
            double v34 = fmin(v33, v9);
            v35 = objc_alloc_init(IMChatTranscriptItemExtendedLayoutAttributes);
            uint64_t v38 = objc_msgSend_layoutOrientation(v28, v36, v37);
            objc_msgSend_setLayoutOrientation_(v35, v39, v38);
            objc_msgSend_setIndexPath_(v35, v40, (uint64_t)v23);
            objc_msgSend_setDrawableSize_(v35, v41, v42, v34, v32);
            if (v22)
            {
              uint64_t v45 = objc_msgSend_layoutClassification(v22, v43, v44);
              uint64_t v47 = objc_msgSend_verticalSpaceToPrecedingItemOfClassification_(v28, v46, v45);
              objc_msgSend__spaceForVerticalSpaceDescriptor_(self, v48, v47);
              objc_msgSend_setTopMargin_(v35, v49, v50);
            }
            objc_msgSend_addObject_(v20, v43, (uint64_t)v35);

            ++v21;
            v22 = v28;
          }
          while (v16 != v21);
        }
        layoutAttributes = self->_layoutAttributes;
        self->_layoutAttributes = v20;

        objc_msgSend__updateFrames(self, v52, v53);
        MEMORY[0x270F9A6D0](self, sel__updateContentSize, v54);
      }
    }
  }
}

- (NSArray)layoutAttributes
{
  objc_msgSend__buildLayoutAttributesIfNeeded(self, a2, v2);
  layoutAttributes = self->_layoutAttributes;
  if (layoutAttributes) {
    uint64_t v5 = layoutAttributes;
  }
  else {
    uint64_t v5 = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v5;
}

- (void)_updateFrames
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  objc_msgSend_layoutBoundsSize(self->_layoutSpecification, a2, v2);
  double v5 = v4;
  objc_msgSend_topMargin(self->_layoutSpecification, v6, v7);
  double v9 = v8;
  objc_msgSend_leadingMargin(self->_layoutSpecification, v10, v11);
  double v13 = v12;
  objc_msgSend_trailingMargin(self->_layoutSpecification, v14, v15);
  double v17 = v16;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v18 = self->_layoutAttributes;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v45, v49, 16);
  if (v20)
  {
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)v46;
    double v25 = *MEMORY[0x263F001A8];
    double v26 = v5 - v17;
    double v27 = v5 - (v13 + v17);
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v46 != v24) {
          objc_enumerationMutation(v18);
        }
        v29 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        objc_msgSend_topMargin(v29, v21, v22, (void)v45);
        double v31 = v30;
        objc_msgSend_drawableSize(v29, v32, v33);
        double v35 = v34;
        double v37 = v36;
        uint64_t v40 = objc_msgSend_layoutOrientation(v29, v38, v39);
        if (v40 == 2)
        {
          double v43 = v26 - v35;
        }
        else if (v40 == 1)
        {
          double v43 = v13 + round((v27 - v35) * 0.5);
        }
        else if (v40)
        {
          double v43 = v25;
        }
        else
        {
          double v43 = v13;
        }
        double v44 = v9 + v31;
        objc_msgSend_setFrame_(v29, v41, v42, v43, v44, v35, v37);
        double v9 = v44 + v37;
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v45, v49, 16);
    }
    while (v23);
  }
}

- (double)_spaceForVerticalSpaceDescriptor:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      MEMORY[0x270F9A6D0](self->_layoutSpecification, sel_zeroVerticalItemSpacing, a3);
      break;
    case 1:
      MEMORY[0x270F9A6D0](self->_layoutSpecification, sel_smallVerticalItemSpacing, a3);
      break;
    case 2:
      MEMORY[0x270F9A6D0](self->_layoutSpecification, sel_mediumVerticalItemSpacing, a3);
      break;
    case 3:
      MEMORY[0x270F9A6D0](self->_layoutSpecification, sel_largeVerticalItemSpacing, a3);
      break;
    default:
      return result;
  }
  return result;
}

- (void)invalidateLayout
{
}

- (id)drawableAtIndex:(unint64_t)a3
{
  objc_msgSend__buildLayoutAttributesIfNeeded(self, a2, a3);
  cachedDrawables = self->_cachedDrawables;
  return (id)objc_msgSend_objectAtIndex_(cachedDrawables, v5, a3);
}

- (void)removeItemsAtIndexPaths:(id)a3 insertItemsAtIndexPaths:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v10 = objc_msgSend_indexSet(MEMORY[0x263F089C8], v8, v9);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v11 = v6;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v56, v61, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v57;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v57 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = objc_msgSend_item(*(void **)(*((void *)&v56 + 1) + 8 * v18), v14, v15);
        objc_msgSend_addIndex_(v10, v20, v19);
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v56, v61, 16);
    }
    while (v16);
  }

  objc_msgSend_removeObjectsAtIndexes_(self->_cachedDrawables, v21, (uint64_t)v10);
  uint64_t v24 = objc_msgSend_indexSet(MEMORY[0x263F089C8], v22, v23);
  double v25 = (void *)MEMORY[0x263EFF980];
  uint64_t v28 = objc_msgSend_count(v7, v26, v27);
  double v30 = objc_msgSend_arrayWithCapacity_(v25, v29, v28);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v31 = v7;
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v52, v60, 16);
  if (v33)
  {
    uint64_t v36 = v33;
    uint64_t v37 = *(void *)v53;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v53 != v37) {
          objc_enumerationMutation(v31);
        }
        uint64_t v39 = objc_msgSend_item(*(void **)(*((void *)&v52 + 1) + 8 * v38), v34, v35);
        objc_msgSend_addIndex_(v24, v40, v39);
        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v52, v60, 16);
    }
    while (v36);
  }

  uint64_t v46 = MEMORY[0x263EF8330];
  uint64_t v47 = 3221225472;
  long long v48 = sub_2180F6A68;
  v49 = &unk_264300908;
  uint64_t v50 = self;
  id v51 = v30;
  id v41 = v30;
  objc_msgSend_enumerateIndexesUsingBlock_(v24, v42, (uint64_t)&v46);
  objc_msgSend_insertObjects_atIndexes_(self->_cachedDrawables, v43, (uint64_t)v41, v24, v46, v47, v48, v49, v50);
  objc_msgSend_invalidateLayout(self, v44, v45);
}

- (id)_cachedDrawableForTranscriptItem:(id)a3 atIndex:(unint64_t)a4
{
  id v8 = a3;
  cachedDrawables = self->_cachedDrawables;
  if (!cachedDrawables)
  {
    objc_msgSend_array(MEMORY[0x263EFF980], v6, v7);
    unint64_t v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    id v11 = self->_cachedDrawables;
    self->_cachedDrawables = v10;

    cachedDrawables = self->_cachedDrawables;
  }
  unint64_t v12 = objc_msgSend_count(cachedDrawables, v6, v7);
  if (v12 >= a4)
  {
    if (v12 > a4)
    {
      uint64_t v15 = objc_msgSend__cachedDrawableAtIndexOrNil_(self, v13, a4);
      if (v15)
      {
        uint64_t v16 = v15;
        objc_msgSend_setChatTranscriptItem_(v15, v13, (uint64_t)v8);
        goto LABEL_12;
      }
    }
    uint64_t v17 = objc_msgSend__makeDrawableForTranscriptItem_(self, v13, (uint64_t)v8);
    if (v17)
    {
      uint64_t v16 = (void *)v17;
      objc_msgSend_setObject_atIndexedSubscript_(self->_cachedDrawables, v18, v17, a4);
      goto LABEL_12;
    }
    uint64_t v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v18, v19);
    objc_msgSend_setObject_atIndexedSubscript_(self->_cachedDrawables, v21, (uint64_t)v20, a4);

    uint64_t v22 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v22);
    _IMWarn();
  }
  else
  {
    objc_msgSend_count(self->_cachedDrawables, v13, v14);
    _IMWarn();
  }
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

- (id)_cachedDrawableAtIndexOrNil:(unint64_t)a3
{
  v3 = objc_msgSend_objectAtIndexedSubscript_(self->_cachedDrawables, a2, a3);
  id v6 = objc_msgSend_null(MEMORY[0x263EFF9D0], v4, v5);
  if (objc_msgSend_isEqual_(v3, v7, (uint64_t)v6)) {
    id v8 = 0;
  }
  else {
    id v8 = v3;
  }
  id v9 = v8;

  return v9;
}

- (id)_makeDrawableForTranscriptItem:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](a3, sel_contentDrawable, a3);
}

- (unint64_t)_numberOfTranscriptItems
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unint64_t v5 = objc_msgSend_numberOfTranscriptItemsForLayoutEngine_(WeakRetained, v4, (uint64_t)self);

  return v5;
}

- (void)_invalidateCachedItemData
{
  self->_cachedDrawables = 0;
  MEMORY[0x270F9A758]();
}

- (void)_updateContentSize
{
  double v4 = objc_msgSend_lastObject(self->_layoutAttributes, a2, v2);
  id v17 = v4;
  if (v4)
  {
    objc_msgSend_frame(v4, v5, v6);
    double MaxY = CGRectGetMaxY(v19);
    objc_msgSend_layoutBoundsSize(self->_layoutSpecification, v8, v9);
    double v11 = v10;
    objc_msgSend_bottomMargin(self->_layoutSpecification, v12, v13);
    objc_msgSend_setContentSize_(self, v15, v16, v11, MaxY + v14);
  }
  else
  {
    objc_msgSend_setContentSize_(self, v5, v6, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  }
}

- (IMChatTranscriptLayoutEngineDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (IMChatTranscriptLayoutEngineDataSource *)WeakRetained;
}

- (IMChatTranscriptLayoutSpecification)layoutSpecification
{
  return self->_layoutSpecification;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void)setLayoutAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutSpecification, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cachedDrawables, 0);
}

@end