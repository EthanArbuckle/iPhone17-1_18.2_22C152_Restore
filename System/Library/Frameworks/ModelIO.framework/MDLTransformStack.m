@interface MDLTransformStack
+ (__n128)globalTransformWithObject:(uint64_t)a3 atTime:(void *)a4;
+ (__n128)localTransformWithObject:(const char *)a3 atTime:(void *)a4;
- (BOOL)isScaleRotateTransformOrder;
- (BOOL)resetsTransform;
- (CAAnimation)transformAnimation;
- (MDLAnimatedValue)animatedValueWithName:(NSString *)name;
- (MDLTransformMatrixOp)addMatrixOp:(NSString *)animatedValueName inverse:(BOOL)inverse;
- (MDLTransformOrientOp)addOrientOp:(NSString *)animatedValueName inverse:(BOOL)inverse;
- (MDLTransformRotateOp)addRotateOp:(NSString *)animatedValueName order:(MDLTransformOpRotationOrder)order inverse:(BOOL)inverse;
- (MDLTransformRotateXOp)addRotateXOp:(NSString *)animatedValueName inverse:(BOOL)inverse;
- (MDLTransformRotateYOp)addRotateYOp:(NSString *)animatedValueName inverse:(BOOL)inverse;
- (MDLTransformRotateZOp)addRotateZOp:(NSString *)animatedValueName inverse:(BOOL)inverse;
- (MDLTransformScaleOp)addScaleOp:(NSString *)animatedValueName inverse:(BOOL)inverse;
- (MDLTransformTranslateOp)addTranslateOp:(NSString *)animatedValueName inverse:(BOOL)inverse;
- (NSArray)keyTimes;
- (NSArray)transformOps;
- (NSMutableDictionary)animatedValues;
- (NSUInteger)count;
- (double)maximumTime;
- (double)minimumTime;
- (id)animatedMatrix4x4WithName:(id)a3 shouldCreateIfMissing:(BOOL)a4;
- (id)animatedQuaternionWithName:(id)a3 shouldCreateIfMissing:(BOOL)a4;
- (id)animatedScalarWithName:(id)a3 shouldCreateIfMissing:(BOOL)a4;
- (id)animatedVector3WithName:(id)a3 shouldCreateIfMissing:(BOOL)a4;
- (id)animatedVector4WithName:(id)a3 shouldCreateIfMissing:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decomposedTransformAnimation;
- (id)init;
- (matrix_float4x4)float4x4AtTime:(NSTimeInterval)time;
- (uint64_t)matrix;
- (uint64_t)setMatrix:(uint64_t)a3;
- (unint64_t)double4x4AtTime:(uint64_t)a3@<X2>;
- (void)clearTransformStack;
- (void)setAnimatedValues:(id)a3;
- (void)setLocalTransform:(uint64_t)a1 forTime:(const char *)a2;
- (void)setLocalTransform:(uint64_t)a3;
- (void)setResetsTransform:(BOOL)a3;
- (void)setTransformOps:(id)a3;
@end

@implementation MDLTransformStack

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  *(unsigned char *)(v10 + 8) = self->_resetsTransform;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  v11 = self->_animatedValues;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v97, v102, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v98;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v98 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v97 + 1) + 8 * i);
        v18 = objc_msgSend_objectForKeyedSubscript_(self->_animatedValues, v13, v17);
        v21 = objc_msgSend_copy(v18, v19, v20);
        objc_msgSend_setObject_forKeyedSubscript_(*(void **)(v10 + 24), v22, (uint64_t)v21, v17);
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v13, (uint64_t)&v97, v102, 16);
    }
    while (v14);
  }

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v23 = self->_transformOps;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v93, v101, 16);
  if (v25)
  {
    uint64_t v26 = *(void *)v94;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v94 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v93 + 1) + 8 * v27);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_name(v28, v29, v30);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v34 = objc_msgSend_inverse(v28, v32, v33);
          id v36 = (id)objc_msgSend_addRotateXOp_inverse_((void *)v10, v35, (uint64_t)v31, v34);
LABEL_29:

          goto LABEL_30;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_name(v28, v37, v38);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v41 = objc_msgSend_inverse(v28, v39, v40);
          id v43 = (id)objc_msgSend_addRotateYOp_inverse_((void *)v10, v42, (uint64_t)v31, v41);
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_name(v28, v44, v45);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v48 = objc_msgSend_inverse(v28, v46, v47);
          id v50 = (id)objc_msgSend_addRotateZOp_inverse_((void *)v10, v49, (uint64_t)v31, v48);
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v31 = v28;
          v53 = objc_msgSend_name(v31, v51, v52);
          uint64_t v56 = objc_msgSend_order(v31, v54, v55);
          uint64_t v59 = objc_msgSend_inverse(v31, v57, v58);
          id v61 = (id)objc_msgSend_addRotateOp_order_inverse_((void *)v10, v60, (uint64_t)v53, v56, v59);

          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_name(v28, v62, v63);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v66 = objc_msgSend_inverse(v28, v64, v65);
          id v68 = (id)objc_msgSend_addTranslateOp_inverse_((void *)v10, v67, (uint64_t)v31, v66);
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_name(v28, v69, v70);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v73 = objc_msgSend_inverse(v28, v71, v72);
          id v75 = (id)objc_msgSend_addScaleOp_inverse_((void *)v10, v74, (uint64_t)v31, v73);
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_name(v28, v76, v77);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v80 = objc_msgSend_inverse(v28, v78, v79);
          id v82 = (id)objc_msgSend_addOrientOp_inverse_((void *)v10, v81, (uint64_t)v31, v80);
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_name(v28, v83, v84);
          id v31 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v87 = objc_msgSend_inverse(v28, v85, v86);
          id v89 = (id)objc_msgSend_addMatrixOp_inverse_((void *)v10, v88, (uint64_t)v31, v87);
          goto LABEL_29;
        }
        NSLog(&cfstr_InternalErrorS.isa, (void)v93);
LABEL_30:
        ++v27;
      }
      while (v25 != v27);
      uint64_t v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v90, (uint64_t)&v93, v101, 16);
      uint64_t v25 = v91;
    }
    while (v91);
  }

  return (id)v10;
}

- (double)minimumTime
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!objc_msgSend_count(self->_transformOps, a2, v2)) {
    return 0.0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_animatedValues;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, v20, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    double v9 = 1000000000.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = objc_msgSend_objectForKey_(self->_animatedValues, v6, *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        objc_msgSend_minimumTime(v11, v12, v13);
        if (v14 < v9) {
          double v9 = v14;
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    double v9 = 1000000000.0;
  }

  return v9;
}

- (double)maximumTime
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!objc_msgSend_count(self->_transformOps, a2, v2)) {
    return 0.0;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_animatedValues;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, v20, 16);
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    double v9 = -1000000000.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = objc_msgSend_objectForKey_(self->_animatedValues, v6, *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        objc_msgSend_maximumTime(v11, v12, v13);
        if (v14 > v9) {
          double v9 = v14;
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    double v9 = -1000000000.0;
  }

  return v9;
}

- (NSArray)keyTimes
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (objc_msgSend_count(self->_transformOps, v4, v5))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v6 = self->_animatedValues;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, v31, 16);
    if (v9)
    {
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = objc_msgSend_objectForKey_(self->_animatedValues, v8, *(void *)(*((void *)&v26 + 1) + 8 * i), (void)v26);
          uint64_t v15 = objc_msgSend_keyTimes(v12, v13, v14);
          objc_msgSend_addObjectsFromArray_(v3, v16, (uint64_t)v15);
        }
        uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v26, v31, 16);
      }
      while (v9);
    }

    long long v18 = objc_msgSend_orderedSetWithArray_(MEMORY[0x263EFF9D8], v17, (uint64_t)v3);
    uint64_t v20 = objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x263F08B30], v19, @"self", 1);
    uint64_t v30 = v20;
    v22 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v21, (uint64_t)&v30, 1);
    objc_msgSend_sortedArrayUsingDescriptors_(v18, v23, (uint64_t)v22);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v24 = v3;
  }

  return (NSArray *)v24;
}

- (id)init
{
  v9.receiver = self;
  v9.super_class = (Class)MDLTransformStack;
  uint64_t v2 = [(MDLTransformStack *)&v9 init];
  if (v2)
  {
    id v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    transformOps = v2->_transformOps;
    v2->_transformOps = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    animatedValues = v2->_animatedValues;
    v2->_animatedValues = v5;

    uint64_t v7 = v2;
  }

  return v2;
}

- (id)animatedVector3WithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v9 = objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    v11 = objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);

    if (v11)
    {
      objc_super v9 = 0;
    }
    else
    {
      objc_super v9 = objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
  }
  else
  {
    NSLog(&cfstr_WarningIsNotOf.isa, v6);
    id v13 = 0;
  }

  return v13;
}

- (id)animatedVector4WithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v9 = objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    v11 = objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);

    if (v11)
    {
      objc_super v9 = 0;
    }
    else
    {
      objc_super v9 = objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
  }
  else
  {
    NSLog(&cfstr_WarningIsNotOf_0.isa, v6);
    id v13 = 0;
  }

  return v13;
}

- (id)animatedQuaternionWithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v9 = objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    v11 = objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);

    if (v11)
    {
      objc_super v9 = 0;
    }
    else
    {
      objc_super v9 = objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
  }
  else
  {
    NSLog(&cfstr_WarningIsNotOf_1.isa, v6);
    id v13 = 0;
  }

  return v13;
}

- (id)animatedMatrix4x4WithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v9 = objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    v11 = objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);

    if (v11)
    {
      objc_super v9 = 0;
    }
    else
    {
      objc_super v9 = objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
  }
  else
  {
    NSLog(&cfstr_WarningIsNotOf_2.isa, v6);
    id v13 = 0;
  }

  return v13;
}

- (id)animatedScalarWithName:(id)a3 shouldCreateIfMissing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v9 = objc_msgSend_objectForKey_(self->_animatedValues, v7, (uint64_t)v6);
  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = !v4;
  }
  if (!v10)
  {
    v11 = objc_msgSend_objectForKey_(self->_animatedValues, v8, (uint64_t)v6);

    if (v11)
    {
      objc_super v9 = 0;
    }
    else
    {
      objc_super v9 = objc_opt_new();
      objc_msgSend_setObject_forKey_(self->_animatedValues, v12, (uint64_t)v9, v6);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
  }
  else
  {
    NSLog(&cfstr_WarningIsNotOf_2.isa, v6);
    id v13 = 0;
  }

  return v13;
}

- (MDLTransformTranslateOp)addTranslateOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  BOOL v4 = inverse;
  id v6 = animatedValueName;
  uint64_t v8 = objc_msgSend_animatedVector3WithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  if (v8)
  {
    objc_super v9 = [MDLTransformTranslateOp alloc];
    v11 = objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformTranslateOp *)v11;
}

- (MDLTransformRotateXOp)addRotateXOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  BOOL v4 = inverse;
  id v6 = animatedValueName;
  uint64_t v8 = objc_msgSend_animatedScalarWithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  if (v8)
  {
    objc_super v9 = [MDLTransformRotateXOp alloc];
    v11 = objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformRotateXOp *)v11;
}

- (MDLTransformRotateYOp)addRotateYOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  BOOL v4 = inverse;
  id v6 = animatedValueName;
  uint64_t v8 = objc_msgSend_animatedScalarWithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  if (v8)
  {
    objc_super v9 = [MDLTransformRotateYOp alloc];
    v11 = objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformRotateYOp *)v11;
}

- (MDLTransformRotateZOp)addRotateZOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  BOOL v4 = inverse;
  id v6 = animatedValueName;
  uint64_t v8 = objc_msgSend_animatedScalarWithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  if (v8)
  {
    objc_super v9 = [MDLTransformRotateZOp alloc];
    v11 = objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformRotateZOp *)v11;
}

- (MDLTransformRotateOp)addRotateOp:(NSString *)animatedValueName order:(MDLTransformOpRotationOrder)order inverse:(BOOL)inverse
{
  BOOL v5 = inverse;
  uint64_t v8 = animatedValueName;
  BOOL v10 = objc_msgSend_animatedVector3WithName_shouldCreateIfMissing_(self, v9, (uint64_t)v8, 1);
  if (v10)
  {
    v11 = [MDLTransformRotateOp alloc];
    id v13 = objc_msgSend_initWithName_inverse_order_data_(v11, v12, (uint64_t)v8, v5, order, v10);
    objc_msgSend_addObject_(self->_transformOps, v14, (uint64_t)v13);
  }
  else
  {
    id v13 = 0;
  }

  return (MDLTransformRotateOp *)v13;
}

- (MDLTransformScaleOp)addScaleOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  BOOL v4 = inverse;
  id v6 = animatedValueName;
  uint64_t v8 = objc_msgSend_animatedVector3WithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  if (v8)
  {
    objc_super v9 = [MDLTransformScaleOp alloc];
    v11 = objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformScaleOp *)v11;
}

- (MDLTransformMatrixOp)addMatrixOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  BOOL v4 = inverse;
  id v6 = animatedValueName;
  uint64_t v8 = objc_msgSend_animatedMatrix4x4WithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  if (v8)
  {
    objc_super v9 = [MDLTransformMatrixOp alloc];
    v11 = objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformMatrixOp *)v11;
}

- (MDLTransformOrientOp)addOrientOp:(NSString *)animatedValueName inverse:(BOOL)inverse
{
  BOOL v4 = inverse;
  id v6 = animatedValueName;
  uint64_t v8 = objc_msgSend_animatedQuaternionWithName_shouldCreateIfMissing_(self, v7, (uint64_t)v6, 1);
  if (v8)
  {
    objc_super v9 = [MDLTransformOrientOp alloc];
    v11 = objc_msgSend_initWithName_inverse_data_(v9, v10, (uint64_t)v6, v4, v8);
    objc_msgSend_addObject_(self->_transformOps, v12, (uint64_t)v11);
  }
  else
  {
    v11 = 0;
  }

  return (MDLTransformOrientOp *)v11;
}

- (MDLAnimatedValue)animatedValueWithName:(NSString *)name
{
  id v3 = objc_msgSend_objectForKey_(self->_animatedValues, a2, (uint64_t)name);

  return (MDLAnimatedValue *)v3;
}

- (NSUInteger)count
{
  return objc_msgSend_count(self->_transformOps, a2, v2);
}

- (matrix_float4x4)float4x4AtTime:(NSTimeInterval)time
{
  simd_float4 v26 = *(simd_float4 *)(MEMORY[0x263EF89A8] + 16);
  simd_float4 v28 = *(simd_float4 *)MEMORY[0x263EF89A8];
  simd_float4 v22 = *(simd_float4 *)(MEMORY[0x263EF89A8] + 48);
  simd_float4 v24 = *(simd_float4 *)(MEMORY[0x263EF89A8] + 32);
  if (objc_msgSend_count(self->_transformOps, a2, v3))
  {
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_transformOps, v6, v7, *(_OWORD *)&v22, *(_OWORD *)&v24, *(_OWORD *)&v26, *(_OWORD *)&v28, v30, v31, v32, v33);
      objc_msgSend_float4x4AtTime_(v8, v9, v10, time);
      uint64_t v11 = 0;
      long long v30 = v12;
      long long v31 = v13;
      long long v32 = v14;
      long long v33 = v15;
      simd_float4 v34 = 0u;
      simd_float4 v35 = 0u;
      simd_float4 v36 = 0u;
      simd_float4 v37 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v34 + v11) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(long long *)((char *)&v30 + v11))), v27, *(float32x2_t *)((char *)&v30 + v11), 1), v25, *(float32x4_t *)((char *)&v30 + v11), 2), v23, *(float32x4_t *)((char *)&v30 + v11), 3);
        v11 += 16;
      }
      while (v11 != 64);
      simd_float4 v26 = v35;
      simd_float4 v28 = v34;
      simd_float4 v22 = v37;
      simd_float4 v24 = v36;

      ++v7;
    }
    while (objc_msgSend_count(self->_transformOps, v16, v17) > v7);
  }
  simd_float4 v19 = v26;
  simd_float4 v18 = v28;
  simd_float4 v21 = v22;
  simd_float4 v20 = v24;
  result.columns[3] = v21;
  result.columns[2] = v20;
  result.columns[1] = v19;
  result.columns[0] = v18;
  return result;
}

- (unint64_t)double4x4AtTime:(uint64_t)a3@<X2>
{
  simd_float4 v36 = (float64x2_t *)MEMORY[0x263EF8990];
  float64x2_t v37 = *(float64x2_t *)(MEMORY[0x263EF8990] + 80);
  a4[4] = *(float64x2_t *)(MEMORY[0x263EF8990] + 64);
  a4[5] = v37;
  float64x2_t v38 = v36[7];
  a4[6] = v36[6];
  a4[7] = v38;
  float64x2_t v39 = v36[1];
  *a4 = *v36;
  a4[1] = v39;
  float64x2_t v40 = v36[3];
  a4[2] = v36[2];
  a4[3] = v40;
  unint64_t result = objc_msgSend_count(*(void **)(a1 + 16), a2, a3);
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      v44 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 16), v42, i, *(_OWORD *)&v65);
      uint64_t v47 = v44;
      if (v44) {
        objc_msgSend_double4x4AtTime_(v44, v45, v46, a5);
      }
      uint64_t v48 = 0;
      float64x2_t v50 = *a4;
      float64x2_t v49 = a4[1];
      float64x2_t v52 = a4[2];
      float64x2_t v51 = a4[3];
      float64x2_t v54 = a4[4];
      float64x2_t v53 = a4[5];
      float64x2_t v56 = a4[6];
      float64x2_t v55 = a4[7];
      a30 = 0u;
      a31 = 0u;
      a32 = 0u;
      a33 = 0u;
      a26 = 0u;
      a27 = 0u;
      a28 = 0u;
      a29 = 0u;
      float64x2_t v69 = 0u;
      float64x2_t vars0 = 0u;
      float64x2_t v67 = 0u;
      float64x2_t v68 = 0u;
      float64x2_t v65 = 0u;
      float64x2_t v66 = 0u;
      do
      {
        float64x2_t v58 = *(float64x2_t *)((char *)&a26 + v48);
        float64x2_t v57 = *(float64x2_t *)((char *)&a26 + v48 + 16);
        uint64_t v59 = (float64x2_t *)((char *)&v65 + v48);
        *uint64_t v59 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v50, v58.f64[0]), v52, v58, 1), v54, v57.f64[0]), v56, v57, 1);
        v59[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v49, v58.f64[0]), v51, v58, 1), v53, v57.f64[0]), v55, v57, 1);
        v48 += 32;
      }
      while (v48 != 128);
      float64x2_t v60 = vars0;
      a4[4] = v69;
      a4[5] = v60;
      a4[6] = 0u;
      a4[7] = 0u;
      float64x2_t v61 = v66;
      *a4 = v65;
      a4[1] = v61;
      float64x2_t v62 = v68;
      a4[2] = v67;
      a4[3] = v62;

      unint64_t result = objc_msgSend_count(*(void **)(a1 + 16), v63, v64);
    }
  }
  return result;
}

- (uint64_t)matrix
{
  return objc_msgSend_localTransformAtTime_(a1, a2, a3, 0.0);
}

- (uint64_t)setMatrix:(uint64_t)a3
{
  return MEMORY[0x270F9A6D0](a1, sel_setLocalTransform_, a3);
}

- (void)setLocalTransform:(uint64_t)a1 forTime:(const char *)a2
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  BOOL v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = NSStringFromSelector(a2);
  objc_msgSend_raise_format_(v3, v6, @"ModelIOException", @"[%@ %@]:set local transform forTime not yet supported", v7, v5);
}

- (void)setLocalTransform:(uint64_t)a3
{
  objc_msgSend_clearTransformStack(a1, a2, a3);
  uint64_t v17 = objc_msgSend_animatedMatrix4x4WithName_shouldCreateIfMissing_(a1, v8, @"transform", 1);
  objc_msgSend_setFloat4x4_atTime_(v17, v9, v10, a4, a5, a6, a7, 0.0);
  id v12 = (id)objc_msgSend_addMatrixOp_inverse_(a1, v11, @"transform", 0);
}

+ (__n128)localTransformWithObject:(const char *)a3 atTime:(void *)a4
{
  BOOL v5 = objc_msgSend_componentConformingToProtocol_(a4, a3, (uint64_t)&unk_26BF61AF8);
  uint64_t v8 = v5;
  if (v5)
  {
    objc_msgSend_localTransformAtTime_(v5, v6, v7, a1);
    long long v11 = v9;
  }
  else
  {
    long long v11 = *MEMORY[0x263EF89A8];
  }

  return (__n128)v11;
}

+ (__n128)globalTransformWithObject:(uint64_t)a3 atTime:(void *)a4
{
  id v5 = a4;
  long long v9 = objc_msgSend_parent(v5, v6, v7);
  if (v9)
  {
    do
    {
      uint64_t v10 = objc_msgSend_componentConformingToProtocol_(v9, v8, (uint64_t)&unk_26BF61AF8);

      if (v10) {
        break;
      }
      uint64_t v12 = objc_msgSend_parent(v9, v8, v11);

      long long v9 = (void *)v12;
    }
    while (v12);
  }
  long long v13 = objc_msgSend_componentConformingToProtocol_(v9, v8, (uint64_t)&unk_26BF61AF8);
  if (objc_msgSend_resetsTransform(v13, v14, v15) || !v13)
  {
    objc_msgSend_localTransformWithObject_atTime_(MDLTransformStack, v16, (uint64_t)v5, a1);
    long long v33 = v27;
  }
  else
  {
    objc_msgSend_globalTransformWithObject_atTime_(MDLTransformStack, v16, (uint64_t)v9, a1);
    float32x4_t v31 = v18;
    float32x4_t v32 = v17;
    float32x4_t v29 = v20;
    float32x4_t v30 = v19;
    objc_msgSend_localTransformWithObject_atTime_(MDLTransformStack, v21, (uint64_t)v5, a1);
    uint64_t v22 = 0;
    v34[0] = v23;
    v34[1] = v24;
    v34[2] = v25;
    v34[3] = v26;
    memset(v35, 0, sizeof(v35));
    do
    {
      v35[v22] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v34[v22])), v31, *(float32x2_t *)&v34[v22], 1), v30, (float32x4_t)v34[v22], 2), v29, (float32x4_t)v34[v22], 3);
      ++v22;
    }
    while (v22 != 4);
    long long v33 = v35[0];
  }

  return (__n128)v33;
}

- (void)clearTransformStack
{
  objc_msgSend_removeAllObjects(self->_transformOps, a2, v2);
  animatedValues = self->_animatedValues;

  objc_msgSend_removeAllObjects(animatedValues, v4, v5);
}

- (BOOL)isScaleRotateTransformOrder
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v2 = self->_transformOps;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v16, v20, 16);
  if (!v4) {
    goto LABEL_29;
  }
  unsigned int v5 = 0;
  uint64_t v6 = *(void *)v17;
  do
  {
    uint64_t v7 = 0;
    unsigned int v8 = v5;
    do
    {
      if (*(void *)v17 != v6) {
        objc_enumerationMutation(v2);
      }
      long long v9 = *(void **)(*((void *)&v16 + 1) + 8 * v7);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v5 = 1;
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (objc_msgSend_order(v9, v11, v12, (void)v16) != 1) {
          goto LABEL_22;
        }
LABEL_10:
        if (v8 > 5) {
          goto LABEL_30;
        }
LABEL_13:
        unsigned int v5 = 4;
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v5 = 3;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v5 = 2;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_10;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v5 = 5;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
LABEL_22:
              if (v8) {
                goto LABEL_30;
              }
              unsigned int v5 = 6;
              goto LABEL_24;
            }
            unsigned int v5 = 0;
          }
        }
      }
LABEL_24:
      if (v8 >= v5)
      {
LABEL_30:
        BOOL v14 = 0;
        goto LABEL_31;
      }
      ++v7;
      unsigned int v8 = v5;
    }
    while (v4 != v7);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v10, (uint64_t)&v16, v20, 16);
    uint64_t v4 = v13;
  }
  while (v13);
LABEL_29:
  BOOL v14 = 1;
LABEL_31:

  return v14;
}

- (id)decomposedTransformAnimation
{
  uint64_t v4 = objc_msgSend_keyTimes(self, a2, v2);
  if (!objc_msgSend_count(v4, v5, v6))
  {
    v147 = 0;
    goto LABEL_24;
  }
  long long v9 = (void *)MEMORY[0x263EFF980];
  uint64_t v10 = objc_msgSend_count(v4, v7, v8);
  uint64_t v12 = objc_msgSend_arrayWithCapacity_(v9, v11, v10);
  v161 = objc_msgSend_animation(MEMORY[0x263F157D8], v13, v14);
  objc_msgSend_setKeyPath_(v161, v15, @"position");
  long long v16 = (void *)MEMORY[0x263EFF980];
  uint64_t v19 = objc_msgSend_count(v4, v17, v18);
  v165 = objc_msgSend_arrayWithCapacity_(v16, v20, v19);
  v160 = objc_msgSend_animation(MEMORY[0x263F157D8], v21, v22);
  objc_msgSend_setKeyPath_(v160, v23, @"orientation");
  long long v24 = (void *)MEMORY[0x263EFF980];
  uint64_t v27 = objc_msgSend_count(v4, v25, v26);
  v164 = objc_msgSend_arrayWithCapacity_(v24, v28, v27);
  v159 = objc_msgSend_animation(MEMORY[0x263F157D8], v29, v30);
  objc_msgSend_setKeyPath_(v159, v31, @"scale");
  float32x4_t v32 = (void *)MEMORY[0x263EFF980];
  uint64_t v35 = objc_msgSend_count(v4, v33, v34);
  v163 = objc_msgSend_arrayWithCapacity_(v32, v36, v35);
  float64x2_t v38 = objc_msgSend_objectAtIndex_(v4, v37, 0);
  objc_msgSend_doubleValue(v38, v39, v40);
  double v42 = v41;

  uint64_t v45 = objc_msgSend_count(v4, v43, v44);
  uint64_t v47 = objc_msgSend_objectAtIndex_(v4, v46, v45 - 1);
  objc_msgSend_doubleValue(v47, v48, v49);
  double v51 = v50;

  unint64_t v54 = 0;
  double v55 = v51 - v42;
  __asm { FMOV            V1.4S, #1.0 }
  float32x4_t v162 = _Q1;
  while (v54 < objc_msgSend_count(v4, v52, v53))
  {
    float64x2_t v62 = objc_msgSend_objectAtIndex_(v4, v61, v54);
    objc_msgSend_doubleValue(v62, v63, v64);
    double v66 = v65;

    float64x2_t v69 = objc_msgSend_numberWithDouble_(NSNumber, v67, v68, (v66 - v42) * (1.0 / v55));
    objc_msgSend_localTransformAtTime_(self, v70, v71, v66);
    int32x4_t v79 = (int32x4_t)vmlaq_f32(vnegq_f32(vmulq_f32((float32x4_t)v75, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v76, v76), (int8x16_t)v76, 0xCuLL))), (float32x4_t)v76, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v75, v75), (int8x16_t)v75, 0xCuLL));
    int32x4_t v80 = (int32x4_t)vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v79, v79), (int8x16_t)v79, 0xCuLL), v74);
    if (vaddq_f32(vaddq_f32((float32x4_t)v80, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v80.i8, 1)), (float32x4_t)vdupq_laneq_s32(v80, 2)).f32[0] >= 0.0)float v81 = 1.0; {
    else
    }
      float v81 = -1.0;
    int32x4_t v82 = (int32x4_t)vmulq_f32(v74, v74);
    float32x4_t v83 = vaddq_f32(vaddq_f32((float32x4_t)v82, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v82.i8, 1)), (float32x4_t)vdupq_laneq_s32(v82, 2));
    int32x4_t v84 = (int32x4_t)vmulq_f32((float32x4_t)v75, (float32x4_t)v75);
    v83.f32[0] = sqrtf(v83.f32[0]);
    int32x4_t v85 = (int32x4_t)vmulq_f32((float32x4_t)v76, (float32x4_t)v76);
    v83.i32[1] = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v84, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v84.i8, 1)), (float32x4_t)vdupq_laneq_s32(v84, 2)).f32[0]);
    v83.i32[2] = sqrtf(vaddq_f32(vaddq_f32((float32x4_t)v85, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v85.i8, 1)), (float32x4_t)vdupq_laneq_s32(v85, 2)).f32[0]);
    int32x4_t v86 = (int32x4_t)vmulq_n_f32(v83, v81);
    int32x4_t v87 = (int32x4_t)vmulq_f32(v74, vdivq_f32(v162, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.i8, 0)));
    int32x4_t v88 = (int32x4_t)vmulq_f32((float32x4_t)v75, vdivq_f32(v162, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v86.i8, 1)));
    int32x4_t v166 = v86;
    int32x4_t v89 = (int32x4_t)vmulq_f32((float32x4_t)v76, vdivq_f32(v162, (float32x4_t)vdupq_laneq_s32(v86, 2)));
    float v90 = *(float *)v87.i32 + *(float *)&v88.i32[1];
    float v91 = (float)(*(float *)v87.i32 + *(float *)&v88.i32[1]) + *(float *)&v89.i32[2];
    if (v91 <= 0.0)
    {
      if (*(float *)v87.i32 > *(float *)&v88.i32[1] && *(float *)v87.i32 > *(float *)&v89.i32[2])
      {
        float v102 = *(float *)&v89.i32[2] + *(float *)&v88.i32[1];
        float32x4_t v103 = (float32x4_t)vextq_s8((int8x16_t)v88, (int8x16_t)vtrn1q_s32(v88, v89), 0xCuLL);
        float32x4_t v104 = vaddq_f32(v103, (float32x4_t)v87);
        v103.f32[0] = *(float *)v87.i32 + 1.0;
        *(float *)v87.i32 = v102;
        v87.i32[3] = v89.i32[1];
        float32x4_t v105 = vsubq_f32(v103, (float32x4_t)v87);
        v104.i32[0] = v105.i32[0];
        v104.i32[3] = v105.i32[3];
        float v167 = v105.f32[0];
        float32x4_t v168 = v104;
        goto LABEL_18;
      }
      if (*(float *)&v88.i32[1] <= *(float *)&v89.i32[2])
      {
        v106.i64[0] = v89.i64[0];
        v106.f32[2] = *(float *)&v89.i32[2] + 1.0;
        v106.i32[3] = v87.i32[1];
        int8x16_t v107 = (int8x16_t)vtrn1q_s32(v87, v88);
        float32x4_t v108 = (float32x4_t)vextq_s8(v107, v107, 8uLL);
        v109.i64[0] = vaddq_f32((float32x4_t)v89, v108).u64[0];
        v108.f32[2] = v90;
        v109.i64[1] = vsubq_f32(v106, v108).i64[1];
        float32x4_t v168 = v109;
        __int32 v95 = v109.i32[2];
      }
      else
      {
        float32_t v97 = *(float *)&v89.i32[2] + *(float *)v87.i32;
        int32x4_t v98 = vuzp1q_s32(v88, v87);
        v88.i64[1] = __PAIR64__(v89.u32[0], v89.u32[1]);
        float32x4_t v99 = (float32x4_t)vuzp2q_s32(v87, v98);
        int32x4_t v100 = (int32x4_t)vaddq_f32((float32x4_t)v88, v99);
        v99.f32[1] = v97;
        *(float *)&v88.i32[1] = *(float *)&v88.i32[1] + 1.0;
        int32x4_t v101 = (int32x4_t)vsubq_f32((float32x4_t)v88, v99);
        float32x4_t v168 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v100), v101);
        __int32 v95 = v101.i32[1];
      }
    }
    else
    {
      float32x4_t v92 = (float32x4_t)vzip2q_s32(v88, vuzp1q_s32(v88, v89));
      v92.i32[2] = v87.i32[1];
      float32x4_t v93 = (float32x4_t)vtrn2q_s32(v89, vzip2q_s32(v89, v87));
      v93.i32[2] = v88.i32[0];
      float32x4_t v94 = vsubq_f32(v92, v93);
      v93.i32[3] = 1.0;
      v92.f32[3] = v91;
      v94.i32[3] = vaddq_f32(v92, v93).i32[3];
      float32x4_t v168 = v94;
      __int32 v95 = v94.i32[3];
    }
    float v167 = *(float *)&v95;
LABEL_18:
    v110 = objc_msgSend_valueWithCGRect_(MEMORY[0x263F08D40], v72, v73, *(float *)&v77, *((float *)&v77 + 1), v78, 0.0);
    objc_msgSend_addObject_(v165, v111, (uint64_t)v110);
    float32x4_t v112 = vmulq_n_f32(v168, 0.5 / sqrtf(v167));
    v115 = objc_msgSend_valueWithCGRect_(MEMORY[0x263F08D40], v113, v114, v112.f32[0], v112.f32[1], v112.f32[2], v112.f32[3]);

    objc_msgSend_addObject_(v164, v116, (uint64_t)v115);
    v119 = objc_msgSend_valueWithCGRect_(MEMORY[0x263F08D40], v117, v118, *(float *)v166.i32, *(float *)&v166.i32[1], *(float *)&v166.i32[2], 0.0);

    objc_msgSend_addObject_(v163, v120, (uint64_t)v119);
    objc_msgSend_addObject_(v12, v121, (uint64_t)v69);

    ++v54;
  }
  v122 = objc_msgSend_arrayWithCapacity_(MEMORY[0x263EFF980], v61, 3);
  objc_msgSend_setValues_(v161, v123, (uint64_t)v165);
  objc_msgSend_addObject_(v122, v124, (uint64_t)v161);
  objc_msgSend_setValues_(v160, v125, (uint64_t)v164);
  objc_msgSend_addObject_(v122, v126, (uint64_t)v160);
  objc_msgSend_setValues_(v159, v127, (uint64_t)v163);
  objc_msgSend_addObject_(v122, v128, (uint64_t)v159);
  unint64_t v131 = 0;
  uint64_t v132 = *MEMORY[0x263F15AA8];
  while (v131 < objc_msgSend_count(v122, v129, v130))
  {
    v135 = objc_msgSend_objectAtIndex_(v122, v133, v131);
    objc_msgSend_setFillMode_(v135, v136, v132);
    objc_msgSend_setKeyTimes_(v135, v137, (uint64_t)v12);
    objc_msgSend_setBeginTime_(v135, v138, v139, v42);
    objc_msgSend_setDuration_(v135, v140, v141, v55);
    objc_msgSend_setAdditive_(v135, v142, 0);
    objc_msgSend_setRemovedOnCompletion_(v135, v143, 0);
    LODWORD(v144) = 1.0;
    objc_msgSend_setRepeatCount_(v135, v145, v146, v144);

    ++v131;
  }
  v147 = objc_msgSend_animation(MEMORY[0x263F15750], v133, v134);
  objc_msgSend_setAnimations_(v147, v148, (uint64_t)v122);
  objc_msgSend_setBeginTime_(v147, v149, v150, v42);
  objc_msgSend_setDuration_(v147, v151, v152, v55);
  objc_msgSend_setFillMode_(v147, v153, v132);
  objc_msgSend_setRemovedOnCompletion_(v147, v154, 0);
  LODWORD(v155) = 2139095039;
  objc_msgSend_setRepeatCount_(v147, v156, v157, v155);

LABEL_24:

  return v147;
}

- (CAAnimation)transformAnimation
{
  uint64_t v230 = *MEMORY[0x263EF8340];
  if ((objc_msgSend_isScaleRotateTransformOrder(self, a2, v2) & 1) == 0)
  {
    v190 = objc_msgSend_decomposedTransformAnimation(self, v4, v5);
    goto LABEL_81;
  }
  uint64_t v6 = (void *)MEMORY[0x263EFF980];
  uint64_t v7 = objc_msgSend_count(self->_transformOps, v4, v5);
  v219 = objc_msgSend_arrayWithCapacity_(v6, v8, v7);
  long long v227 = 0u;
  long long v228 = 0u;
  long long v225 = 0u;
  long long v226 = 0u;
  obj = self->_transformOps;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v225, v229, 16);
  if (!v10)
  {
    double v11 = 0.0;
    double v12 = 0.0;
    goto LABEL_71;
  }
  uint64_t v221 = *(void *)v226;
  uint64_t v218 = *MEMORY[0x263F15AA8];
  double v11 = 0.0;
  double v12 = 0.0;
  do
  {
    uint64_t v222 = v10;
    for (uint64_t i = 0; i != v222; ++i)
    {
      if (*(void *)v226 != v221) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v225 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v17 = objc_msgSend_animatedValue(v14, v15, v16);
        float32x4_t v20 = objc_msgSend_keyTimes(v17, v18, v19);

        long long v23 = @"position";
        if (!v20) {
          goto LABEL_64;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v26 = objc_msgSend_animatedValue(v14, v24, v25);
          float32x4_t v20 = objc_msgSend_keyTimes(v26, v27, v28);

          if (objc_msgSend_order(v14, v29, v30) == 1) {
            long long v23 = @"eulerAngles";
          }
          else {
            long long v23 = @"transform";
          }
          if (!v20) {
            goto LABEL_64;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v33 = objc_msgSend_animatedValue(v14, v31, v32);
            float32x4_t v20 = objc_msgSend_keyTimes(v33, v34, v35);

            long long v23 = @"eulerAngles.x";
            if (!v20) {
              goto LABEL_64;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              float64x2_t v38 = objc_msgSend_animatedValue(v14, v36, v37);
              float32x4_t v20 = objc_msgSend_keyTimes(v38, v39, v40);

              long long v23 = @"eulerAngles.y";
              if (!v20) {
                goto LABEL_64;
              }
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v43 = objc_msgSend_animatedValue(v14, v41, v42);
                float32x4_t v20 = objc_msgSend_keyTimes(v43, v44, v45);

                long long v23 = @"eulerAngles.z";
                if (!v20) {
                  goto LABEL_64;
                }
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v48 = objc_msgSend_animatedValue(v14, v46, v47);
                  float32x4_t v20 = objc_msgSend_keyTimes(v48, v49, v50);

                  long long v23 = @"orientation";
                  if (!v20) {
                    goto LABEL_64;
                  }
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v53 = objc_msgSend_animatedValue(v14, v51, v52);
                    float32x4_t v20 = objc_msgSend_keyTimes(v53, v54, v55);

                    long long v23 = @"scale";
                    if (!v20) {
                      goto LABEL_64;
                    }
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      float32x4_t v20 = 0;
                      goto LABEL_64;
                    }
                    float64x2_t v58 = objc_msgSend_animatedValue(v14, v56, v57);
                    float32x4_t v20 = objc_msgSend_keyTimes(v58, v59, v60);

                    long long v23 = @"transform";
                    if (!v20) {
                      goto LABEL_64;
                    }
                  }
                }
              }
            }
          }
        }
      }
      if (!objc_msgSend_count(v20, v21, v22)) {
        goto LABEL_64;
      }
      uint64_t v63 = objc_msgSend_animation(MEMORY[0x263F157D8], v61, v62);
      objc_msgSend_setKeyPath_(v63, v64, (uint64_t)v23);
      double v65 = (void *)MEMORY[0x263EFF980];
      uint64_t v68 = objc_msgSend_count(v20, v66, v67);
      uint64_t v70 = objc_msgSend_arrayWithCapacity_(v65, v69, v68);
      uint64_t v71 = (void *)MEMORY[0x263EFF980];
      uint64_t v74 = objc_msgSend_count(v20, v72, v73);
      int32x4_t v76 = objc_msgSend_arrayWithCapacity_(v71, v75, v74);
      float v78 = objc_msgSend_objectAtIndex_(v20, v77, 0);
      objc_msgSend_doubleValue(v78, v79, v80);
      double v82 = v81;

      uint64_t v85 = objc_msgSend_count(v20, v83, v84);
      int32x4_t v87 = objc_msgSend_objectAtIndex_(v20, v86, v85 - 1);
      objc_msgSend_doubleValue(v87, v88, v89);
      double v91 = v90;

      double v94 = v91 - v82;
      if (v94 == 0.0) {
        goto LABEL_63;
      }
      uint64_t v95 = objc_msgSend_count(v219, v92, v93);
      unint64_t v98 = 0;
      if (v12 > v82 || v95 == 0) {
        double v12 = v82;
      }
      if (v11 < v94) {
        double v11 = v94;
      }
      while (v98 < objc_msgSend_count(v20, v96, v97, *(_OWORD *)&v214, *(_OWORD *)&v215, *(_OWORD *)&v216, *(_OWORD *)&v217))
      {
        int32x4_t v101 = objc_msgSend_objectAtIndex_(v20, v100, v98);
        objc_msgSend_doubleValue(v101, v102, v103);
        double v105 = v104;

        float32x4_t v108 = objc_msgSend_numberWithDouble_(NSNumber, v106, v107, (v105 - v82) * (1.0 / v94));
        objc_msgSend_addObject_(v70, v109, (uint64_t)v108);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_44;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (objc_msgSend_order(v14, v122, v123) == 1)
          {
            v126 = objc_msgSend_animatedValue(v14, v124, v125);
            objc_msgSend_float3AtTime_(v126, v127, v128, v105);
            float v130 = v129 * 0.0174532925;
            float v132 = v131 * 0.0174532925;
            float v134 = v133 * 0.0174532925;
            v120 = objc_msgSend_valueWithCGRect_(MEMORY[0x263F08D40], v135, v136, v130, v132, v134, 0.0);
          }
          else
          {
            objc_msgSend_float4x4AtTime_(v14, v124, v125, v105);
            v224[0] = vcvtq_f64_f32(*(float32x2_t *)v140.f32);
            v224[1] = vcvt_hight_f64_f32(v140);
            v224[2] = vcvtq_f64_f32(*(float32x2_t *)v141.f32);
            v224[3] = vcvt_hight_f64_f32(v141);
            v224[4] = vcvtq_f64_f32(*(float32x2_t *)v142.f32);
            v224[5] = vcvt_hight_f64_f32(v142);
            v224[6] = vcvtq_f64_f32(*(float32x2_t *)v143.f32);
            v224[7] = vcvt_hight_f64_f32(v143);
            v120 = objc_msgSend_valueWithCATransform3D_(MEMORY[0x263F08D40], v144, (uint64_t)v224);
          }
          objc_msgSend_addObject_(v76, v137, (uint64_t)v120);
          goto LABEL_45;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v145 = NSNumber;
          uint64_t v146 = objc_msgSend_animatedValue(v14, v138, v139);
          objc_msgSend_floatAtTime_(v146, v147, v148, v105);
          double v150 = v149 * 0.0174532925;
          *(float *)&double v150 = v150;
          v120 = objc_msgSend_numberWithFloat_(v145, v151, v152, v150);

          objc_msgSend_addObject_(v76, v153, (uint64_t)v120);
          goto LABEL_45;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v156 = objc_msgSend_animatedValue(v14, v154, v155);
          objc_msgSend_floatQuaternionAtTime_(v156, v157, v158, v105);
          v120 = objc_msgSend_valueWithCGRect_(MEMORY[0x263F08D40], v163, v164, v162, v159, v160, v161);

          objc_msgSend_addObject_(v76, v165, (uint64_t)v120);
          goto LABEL_45;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
LABEL_44:
          float32x4_t v112 = objc_msgSend_animatedValue(v14, v110, v111);
          objc_msgSend_float3AtTime_(v112, v113, v114, v105);
          v120 = objc_msgSend_valueWithCGRect_(MEMORY[0x263F08D40], v118, v119, v117, v115, v116, 0.0);

          objc_msgSend_addObject_(v76, v121, (uint64_t)v120);
LABEL_45:

          goto LABEL_46;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          float32x4_t v168 = objc_msgSend_animatedValue(v14, v166, v167);
          objc_msgSend_float4x4AtTime_(v168, v169, v170, v105);
          float32x4_t v214 = v171;
          float32x4_t v215 = v172;
          float32x4_t v216 = v173;
          float32x4_t v217 = v174;

          v223[0] = vcvtq_f64_f32(*(float32x2_t *)v214.f32);
          v223[1] = vcvt_hight_f64_f32(v214);
          v223[2] = vcvtq_f64_f32(*(float32x2_t *)v215.f32);
          v223[3] = vcvt_hight_f64_f32(v215);
          v223[4] = vcvtq_f64_f32(*(float32x2_t *)v216.f32);
          v223[5] = vcvt_hight_f64_f32(v216);
          v223[6] = vcvtq_f64_f32(*(float32x2_t *)v217.f32);
          v223[7] = vcvt_hight_f64_f32(v217);
          v120 = objc_msgSend_valueWithCATransform3D_(MEMORY[0x263F08D40], v175, (uint64_t)v223);
          objc_msgSend_addObject_(v76, v176, (uint64_t)v120);
          goto LABEL_45;
        }
LABEL_46:

        ++v98;
      }
      objc_msgSend_setValues_(v63, v100, (uint64_t)v76);
      objc_msgSend_setFillMode_(v63, v177, v218);
      objc_msgSend_setKeyTimes_(v63, v178, (uint64_t)v70);
      objc_msgSend_setBeginTime_(v63, v179, v180, v82);
      objc_msgSend_setDuration_(v63, v181, v182, v94);
      objc_msgSend_setAdditive_(v63, v183, 0);
      objc_msgSend_setRemovedOnCompletion_(v63, v184, 0);
      LODWORD(v185) = 1.0;
      objc_msgSend_setRepeatCount_(v63, v186, v187, v185);
      objc_msgSend_addObject_(v219, v188, (uint64_t)v63);
LABEL_63:

LABEL_64:
    }
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v189, (uint64_t)&v225, v229, 16);
  }
  while (v10);
LABEL_71:

  if (objc_msgSend_count(v219, v191, v192))
  {
    if (objc_msgSend_count(v219, v193, v194) != 1) {
      goto LABEL_75;
    }
    v190 = objc_msgSend_objectAtIndex_(v219, v195, 0);
    objc_msgSend_beginTime(v190, v197, v198);
    if (v201 <= 0.0)
    {
      LODWORD(v201) = 2139095039;
      objc_msgSend_setRepeatCount_(v190, v199, v200, v201);
    }
    else
    {

LABEL_75:
      v190 = objc_msgSend_animation(MEMORY[0x263F15750], v195, v196);
      objc_msgSend_setAnimations_(v190, v202, (uint64_t)v219);
      double v205 = 0.0;
      if (v12 <= 0.0) {
        double v205 = v12;
      }
      objc_msgSend_setBeginTime_(v190, v203, v204, v205);
      objc_msgSend_setDuration_(v190, v206, v207, fmax(v12, -0.0) + v11);
      objc_msgSend_setFillMode_(v190, v208, *MEMORY[0x263F15AA8]);
      objc_msgSend_setRemovedOnCompletion_(v190, v209, 0);
      LODWORD(v210) = 2139095039;
      objc_msgSend_setRepeatCount_(v190, v211, v212, v210);
    }
  }
  else
  {
    v190 = 0;
  }

LABEL_81:

  return (CAAnimation *)v190;
}

- (BOOL)resetsTransform
{
  return self->_resetsTransform;
}

- (void)setResetsTransform:(BOOL)a3
{
  self->_resetsTransform = a3;
}

- (NSArray)transformOps
{
  return &self->_transformOps->super;
}

- (void)setTransformOps:(id)a3
{
}

- (NSMutableDictionary)animatedValues
{
  return self->_animatedValues;
}

- (void)setAnimatedValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedValues, 0);

  objc_storeStrong((id *)&self->_transformOps, 0);
}

@end