@interface BLItemImageCollection
- (BLItemImageCollection)initWithImageCollection:(id)a3;
- (BLItemImageCollection)initWithItemImages:(id)a3;
- (NSArray)itemImages;
- (id)_imagesForSize:(CGSize)a3 scale:(double)a4;
- (id)_newImagesForDictionary:(id)a3;
- (id)bestImageForSize:(CGSize)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imagesForKind:(id)a3;
- (id)imagesForSize:(CGSize)a3;
@end

@implementation BLItemImageCollection

- (BLItemImageCollection)initWithImageCollection:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v7 = objc_msgSend_arrayWithObject_(MEMORY[0x263EFF8C0], v5, (uint64_t)v3, v6);

      id v3 = (id)v7;
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v3;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v35, (uint64_t)v40, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v36;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v35 + 1) + 8 * v13);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v17 = objc_msgSend__newImagesForDictionary_(self, v15, v14, v16);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v18 = v17;
          uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v31, (uint64_t)v39, 16);
          if (v20)
          {
            uint64_t v23 = v20;
            uint64_t v24 = *(void *)v32;
            do
            {
              uint64_t v25 = 0;
              do
              {
                if (*(void *)v32 != v24) {
                  objc_enumerationMutation(v18);
                }
                objc_msgSend_addObject_(v4, v21, *(void *)(*((void *)&v31 + 1) + 8 * v25++), v22);
              }
              while (v23 != v25);
              uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v31, (uint64_t)v39, 16);
            }
            while (v23);
          }
        }
        ++v13;
      }
      while (v13 != v11);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v15, (uint64_t)&v35, (uint64_t)v40, 16);
    }
    while (v11);
  }

  v28 = (BLItemImageCollection *)objc_msgSend_initWithItemImages_(self, v26, (uint64_t)v4, v27);
  return v28;
}

- (BLItemImageCollection)initWithItemImages:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLItemImageCollection;
  id v8 = [(BLItemImageCollection *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    itemImages = v8->_itemImages;
    v8->_itemImages = (NSArray *)v9;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  id v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v11 = objc_msgSend_copyWithZone_(self->_itemImages, v9, (uint64_t)a3, v10);
  objc_super v12 = (void *)v8[1];
  v8[1] = v11;

  return v8;
}

- (id)bestImageForSize:(CGSize)a3
{
  v5 = objc_msgSend_imagesForSize_(self, a2, v3, v4, a3.width, a3.height);
  if (objc_msgSend_count(v5, v6, v7, v8))
  {
    objc_super v12 = objc_msgSend_lastObject(v5, v9, v10, v11);
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (id)imagesForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  GSMainScreenScaleFactor();
  uint64_t v11 = objc_msgSend__imagesForSize_scale_(self, v8, v9, v10, width, height, v7);
  objc_msgSend_addObjectsFromArray_(v6, v12, (uint64_t)v11, v13);

  if (!objc_msgSend_count(v6, v14, v15, v16))
  {
    uint64_t v20 = objc_msgSend__imagesForSize_scale_(self, v17, v18, v19, width, height, 0.0);
    objc_msgSend_addObjectsFromArray_(v6, v21, (uint64_t)v20, v22);
  }
  uint64_t v23 = objc_msgSend_allObjects(v6, v17, v18, v19);
  uint64_t v25 = objc_msgSend_sortedArrayUsingFunction_context_(v23, v24, (uint64_t)sub_21E012B00, 0);

  return v25;
}

- (id)imagesForKind:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6, v7);
  objc_super v12 = objc_msgSend_array(MEMORY[0x263EFF980], v9, v10, v11);
  GSMainScreenScaleFactor();
  float v14 = v13;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v15 = self->_itemImages;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v17)
  {
    uint64_t v21 = v17;
    double v22 = v14;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v15);
        }
        uint64_t v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        v26 = objc_msgSend_imageKind(v25, v18, v19, v20, (void)v39);
        int isEqualToString = objc_msgSend_isEqualToString_(v26, v27, (uint64_t)v4, v28);

        if (isEqualToString)
        {
          objc_msgSend_imageScale(v25, v18, v19, v20);
          if (v32 == v22) {
            objc_msgSend_addObject_(v12, v30, (uint64_t)v25, v31);
          }
          objc_msgSend_addObject_(v8, v30, (uint64_t)v25, v31);
        }
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v21);
  }

  if (objc_msgSend_count(v12, v33, v34, v35)) {
    objc_msgSend_sortedArrayUsingFunction_context_(v12, v36, (uint64_t)sub_21E012B00, 0, (void)v39);
  }
  else {
  long long v37 = objc_msgSend_sortedArrayUsingFunction_context_(v8, v36, (uint64_t)sub_21E012B00, 0, (void)v39);
  }

  return v37;
}

- (id)_imagesForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v80 = *MEMORY[0x263EF8340];
  uint64_t v10 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v4, v5);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v11 = self->_itemImages;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v73, (uint64_t)v79, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v74 != v18) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        objc_msgSend_imageSize(v20, v14, v15, v16);
        if (width == v22 && height == v21)
        {
          if (a4 < 0.00000011920929 || (objc_msgSend_imageScale(v20, v14, v15, v16), v24 == a4)) {
            objc_msgSend_addObject_(v10, v14, (uint64_t)v20, v16);
          }
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v73, (uint64_t)v79, 16);
    }
    while (v17);
  }

  if (!objc_msgSend_count(v10, v25, v26, v27))
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v31 = self->_itemImages;
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v69, (uint64_t)v78, 16);
    if (v33)
    {
      uint64_t v37 = v33;
      uint64_t v38 = *(void *)v70;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v70 != v38) {
            objc_enumerationMutation(v31);
          }
          long long v40 = *(void **)(*((void *)&v69 + 1) + 8 * j);
          objc_msgSend_imageSize(v40, v34, v35, v36);
          if (BLItemImageSizeEqualToSize(width, height, v41, v42))
          {
            if (a4 < 0.00000011920929 || (objc_msgSend_imageScale(v40, v34, v35, v36), v43 == a4)) {
              objc_msgSend_addObject_(v10, v34, (uint64_t)v40, v36);
            }
          }
        }
        uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v69, (uint64_t)v78, 16);
      }
      while (v37);
    }
  }
  if (!objc_msgSend_count(v10, v28, v29, v30))
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v44 = self->_itemImages;
    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v65, (uint64_t)v77, 16);
    if (!v46)
    {
      v51 = v44;
      goto LABEL_44;
    }
    uint64_t v50 = v46;
    v51 = 0;
    uint64_t v52 = *(void *)v66;
    double v53 = 1.79769313e308;
    double v54 = width / height;
    do
    {
      for (uint64_t k = 0; k != v50; ++k)
      {
        if (*(void *)v66 != v52) {
          objc_enumerationMutation(v44);
        }
        v56 = *(void **)(*((void *)&v65 + 1) + 8 * k);
        if (a4 >= 0.00000011920929)
        {
          objc_msgSend_imageScale(*(void **)(*((void *)&v65 + 1) + 8 * k), v47, v48, v49, (void)v65);
          if (v57 != a4) {
            continue;
          }
        }
        objc_msgSend_imageSize(v56, v47, v48, v49, (void)v65);
        double v60 = vabdd_f64(v54, v58 / v59);
        if (v60 < v53)
        {
          v61 = v56;

          double v53 = v60;
          v51 = v61;
        }
      }
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v65, (uint64_t)v77, 16);
    }
    while (v50);

    if (v51)
    {
      objc_msgSend_addObject_(v10, v62, (uint64_t)v51, v63);
LABEL_44:
    }
  }

  return v10;
}

- (id)_newImagesForDictionary:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v39 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"image-type", v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v7 = v3;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v9)
    {
      uint64_t v12 = v9;
      uint64_t v13 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v7);
          }
          uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend_objectForKey_(v7, v10, v15, v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [BLItemArtworkImage alloc];
            uint64_t v20 = objc_msgSend_initWithArtworkDictionary_(v17, v18, (uint64_t)v16, v19);
            double v24 = objc_msgSend_URLString(v20, v21, v22, v23);

            if (v24)
            {
              objc_msgSend_setImageKindWithTypeName_variantName_(v20, v25, (uint64_t)v6, v15);
              objc_msgSend_addObject_(v39, v26, (uint64_t)v20, v27);
            }
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v40, (uint64_t)v44, 16);
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v28 = [BLItemArtworkImage alloc];
    uint64_t v31 = objc_msgSend_initWithArtworkDictionary_(v28, v29, (uint64_t)v3, v30);
    uint64_t v35 = objc_msgSend_URLString(v31, v32, v33, v34);

    if (v35) {
      objc_msgSend_addObject_(v39, v36, (uint64_t)v31, v37);
    }
  }
  return v39;
}

- (NSArray)itemImages
{
  return self->_itemImages;
}

- (void).cxx_destruct
{
}

@end