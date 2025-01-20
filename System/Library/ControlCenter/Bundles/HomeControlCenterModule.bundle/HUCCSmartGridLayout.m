@interface HUCCSmartGridLayout
+ (double)cellSpacing;
+ (id)layoutGeometry;
+ (id)layoutGeometryIsPortrait:(BOOL)a3;
+ (id)layoutOptionsForViewSize:(CGSize)a3 andMosaicSize:(unint64_t)a4;
+ (unint64_t)mosaicType;
@end

@implementation HUCCSmartGridLayout

+ (id)layoutGeometry
{
  uint64_t v3 = CCUIIsPortrait();

  return (id)objc_msgSend_layoutGeometryIsPortrait_(HUCCSmartGridLayout, v2, v3);
}

+ (id)layoutGeometryIsPortrait:(BOOL)a3
{
  id v6 = objc_alloc_init(MEMORY[0x263F49B70]);
  if (a3)
  {
    BOOL v7 = 1;
    objc_msgSend_setGridSize_(v6, v4, 2, 4);
  }
  else
  {
    v9 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], v4, v5);
    uint64_t v12 = objc_msgSend_userInterfaceIdiom(v9, v10, v11);

    BOOL v7 = v12 == 1;
    if (v12 == 1) {
      uint64_t v14 = 4;
    }
    else {
      uint64_t v14 = 2;
    }
    if (v12 == 1) {
      objc_msgSend_setGridSize_(v6, v13, 2, v14);
    }
    else {
      objc_msgSend_setGridSize_(v6, v13, 3, v14);
    }
  }
  objc_msgSend_setIsPortrait_(v6, v8, v7);
  objc_msgSend_cellSize(HUCCSmartGridLayout, v15, v16);
  objc_msgSend_setCellSize_(v6, v17, v18);
  objc_msgSend_cellSpacing(HUCCSmartGridLayout, v19, v20);
  objc_msgSend_setCellSpacing_(v6, v21, v22);

  return v6;
}

+ (unint64_t)mosaicType
{
  uint64_t v3 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a2, v2);
  uint64_t v6 = objc_msgSend_userInterfaceIdiom(v3, v4, v5);

  if (v6 == 1) {
    return 0;
  }
  else {
    return CCUIIsPortrait() ^ 1;
  }
}

+ (double)cellSpacing
{
  MEMORY[0x270F18870](a1, a2);
  return result;
}

+ (id)layoutOptionsForViewSize:(CGSize)a3 andMosaicSize:(unint64_t)a4
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_defaultOptionsForViewSize_(MEMORY[0x263F49B50], a2, a4, a3.width, a3.height);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v8 = objc_msgSend_serviceCellOptions(v5, v6, v7, 0);
  v63[0] = v8;
  uint64_t v11 = objc_msgSend_sceneCellOptions(v5, v9, v10);
  v63[1] = v11;
  v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, (uint64_t)v63, 2);

  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v59, v64, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v60 != v19) {
          objc_enumerationMutation(v13);
        }
        v21 = objc_msgSend_backgroundDisplayOptions(*(void **)(*((void *)&v59 + 1) + 8 * i), v16, v17);
        objc_msgSend_setDisplayStyle_(v21, v22, 3);
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v59, v64, 16);
    }
    while (v18);
  }

  v25 = objc_msgSend_sceneCellOptions(v5, v23, v24);
  v28 = objc_msgSend_font(v25, v26, v27);
  objc_msgSend_setDescriptionFont_(v25, v29, (uint64_t)v28);

  objc_msgSend_setSceneCellOptions_(v5, v30, (uint64_t)v25);
  v33 = objc_msgSend_serviceCellOptions(v5, v31, v32);
  v36 = v33;
  if (a4 == 1)
  {
    v37 = objc_msgSend_font(v33, v34, v35);
    v40 = objc_msgSend_fontWithSize_(v37, v38, v39, 11.0);
    objc_msgSend_setFont_(v36, v41, (uint64_t)v40);

    HUDefaultSizeForIconSize();
    objc_msgSend_setIconSize_(v36, v42, v43, v44);
    objc_msgSend_setLineSpacing_(v36, v45, v46, 0.0);
    objc_msgSend_setShowDescription_(v36, v47, 0);
    objc_msgSend_setIconToTitleSpacing_(v36, v48, v49, 4.0);
  }
  else
  {
    HUDefaultSizeForIconSize();
    objc_msgSend_setIconSize_(v36, v51, v52, v53);
    objc_msgSend_setCellInnerMargin_(v36, v54, v55, 16.0);
    objc_msgSend_setIconToTitleSpacing_(v36, v56, v57, 12.0);
  }
  objc_msgSend_setServiceCellOptions_(v5, v50, (uint64_t)v36);

  return v5;
}

@end