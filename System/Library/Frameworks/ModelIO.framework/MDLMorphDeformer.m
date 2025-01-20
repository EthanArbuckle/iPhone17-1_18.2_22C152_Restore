@interface MDLMorphDeformer
- (MDLAnimatedScalarArray)weights;
- (MDLMorphDeformer)initWithOther:(id)a3;
- (MDLMorphDeformer)initWithTargetShapes:(id)a3 shapeSetTargetWeights:(const float *)a4 count:(unint64_t)a5 shapeSetTargetCounts:(const unsigned int *)a6 count:(unint64_t)a7;
- (MDLMorphDeformer)initWithTargetShapes:(id)a3 shapeSetTargetWeights:(id)a4 shapeSetTargetCounts:(id)a5;
- (NSArray)shapeSetTargetCounts;
- (NSArray)shapeSetTargetWeights;
- (NSArray)targetShapes;
- (NSData)targetCounts;
- (NSData)targetWeights;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)copyShapeSetTargetCountsInto:(unsigned int *)a3 maxCount:(unint64_t)a4;
- (unint64_t)copyShapeSetTargetWeightsInto:(float *)a3 maxCount:(unint64_t)a4;
- (void)setTargetCounts:(id)a3;
- (void)setTargetWeights:(id)a3;
- (void)setWeights:(id)a3;
@end

@implementation MDLMorphDeformer

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend_allocWithZone_(MDLMorphDeformer, a2, (uint64_t)a3);

  return (id)MEMORY[0x270F9A6D0](v4, sel_initWithOther_, self);
}

- (MDLMorphDeformer)initWithOther:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MDLMorphDeformer;
  v7 = [(MDLMorphDeformer *)&v36 init];
  if (v7)
  {
    v8 = objc_msgSend_targetShapes(v4, v5, v6);
    uint64_t v11 = objc_msgSend_copy(v8, v9, v10);
    targetShapes = v7->_targetShapes;
    v7->_targetShapes = (NSArray *)v11;

    v15 = objc_msgSend_shapeSetTargetWeights(v4, v13, v14);
    uint64_t v18 = objc_msgSend_copy(v15, v16, v17);
    targetWeights = v7->_targetWeights;
    v7->_targetWeights = (NSData *)v18;

    v22 = objc_msgSend_shapeSetTargetCounts(v4, v20, v21);
    uint64_t v25 = objc_msgSend_copy(v22, v23, v24);
    v26 = v7->_targetWeights;
    v7->_targetWeights = (NSData *)v25;

    v29 = objc_msgSend_weights(v4, v27, v28);
    uint64_t v32 = objc_msgSend_copy(v29, v30, v31);
    weights = v7->_weights;
    v7->_weights = (MDLAnimatedScalarArray *)v32;

    v34 = v7;
  }

  return v7;
}

- (MDLMorphDeformer)initWithTargetShapes:(id)a3 shapeSetTargetWeights:(id)a4 shapeSetTargetCounts:(id)a5
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v8 = a3;
  *((void *)&v81 + 1) = a4;
  *(void *)&long long v81 = a5;
  v97.receiver = self;
  v97.super_class = (Class)MDLMorphDeformer;
  v82 = [(MDLMorphDeformer *)&v97 init];
  if (v82)
  {
    if (*((void *)&v81 + 1) && (void)v81)
    {
      uint64_t v11 = objc_msgSend_count(v8, v9, v10);
      if (v11 == objc_msgSend_count(*((void **)&v81 + 1), v12, v13))
      {
        __p = 0;
        v95 = 0;
        v96 = 0;
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v14 = *((id *)&v81 + 1);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v90, v99, 16);
        if (v18)
        {
          uint64_t v19 = *(void *)v91;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v91 != v19) {
                objc_enumerationMutation(v14);
              }
              objc_msgSend_floatValue(*(void **)(*((void *)&v90 + 1) + 8 * i), (const char *)v16, v17);
              int v22 = v21;
              v23 = v95;
              if (v95 >= v96)
              {
                uint64_t v25 = (char *)__p;
                uint64_t v26 = (v95 - (unsigned char *)__p) >> 2;
                unint64_t v27 = v26 + 1;
                if ((unint64_t)(v26 + 1) >> 62) {
                  sub_20B05D0BC();
                }
                uint64_t v28 = v96 - (unsigned char *)__p;
                if ((v96 - (unsigned char *)__p) >> 1 > v27) {
                  unint64_t v27 = v28 >> 1;
                }
                if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v16 = v27;
                }
                if (v16)
                {
                  v29 = (char *)sub_20B05D1AC((uint64_t)&v96, v16);
                  uint64_t v25 = (char *)__p;
                  v23 = v95;
                }
                else
                {
                  v29 = 0;
                }
                v30 = &v29[4 * v26];
                *(_DWORD *)v30 = v22;
                uint64_t v24 = v30 + 4;
                while (v23 != v25)
                {
                  int v31 = *((_DWORD *)v23 - 1);
                  v23 -= 4;
                  *((_DWORD *)v30 - 1) = v31;
                  v30 -= 4;
                }
                __p = v30;
                v95 = v24;
                v96 = &v29[4 * v16];
                if (v25) {
                  operator delete(v25);
                }
              }
              else
              {
                *(_DWORD *)v95 = v21;
                uint64_t v24 = v23 + 4;
              }
              v95 = v24;
            }
            uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, (const char *)v16, (uint64_t)&v90, v99, 16);
          }
          while (v18);
        }

        v87 = 0;
        v88 = 0;
        v89 = 0;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v32 = (id)v81;
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v83, v98, 16);
        if (v36)
        {
          LODWORD(v37) = 0;
          uint64_t v38 = *(void *)v84;
          do
          {
            for (uint64_t j = 0; j != v36; ++j)
            {
              if (*(void *)v84 != v38) {
                objc_enumerationMutation(v32);
              }
              int v40 = objc_msgSend_unsignedIntValue(*(void **)(*((void *)&v83 + 1) + 8 * j), (const char *)v34, v35);
              int v41 = v40;
              v42 = v88;
              if (v88 >= v89)
              {
                v44 = (char *)v87;
                uint64_t v45 = (v88 - (unsigned char *)v87) >> 2;
                unint64_t v46 = v45 + 1;
                if ((unint64_t)(v45 + 1) >> 62) {
                  sub_20B05D0BC();
                }
                uint64_t v47 = v89 - (unsigned char *)v87;
                if ((v89 - (unsigned char *)v87) >> 1 > v46) {
                  unint64_t v46 = v47 >> 1;
                }
                if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v34 = v46;
                }
                if (v34)
                {
                  v48 = (char *)sub_20B05D1AC((uint64_t)&v89, v34);
                  v44 = (char *)v87;
                  v42 = v88;
                }
                else
                {
                  v48 = 0;
                }
                v49 = &v48[4 * v45];
                *(_DWORD *)v49 = v41;
                v43 = v49 + 4;
                while (v42 != v44)
                {
                  int v50 = *((_DWORD *)v42 - 1);
                  v42 -= 4;
                  *((_DWORD *)v49 - 1) = v50;
                  v49 -= 4;
                }
                v87 = v49;
                v88 = v43;
                v89 = &v48[4 * v34];
                if (v44) {
                  operator delete(v44);
                }
              }
              else
              {
                *(_DWORD *)v88 = v40;
                v43 = v42 + 4;
              }
              uint64_t v37 = (v41 + v37);
              v88 = v43;
            }
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, (const char *)v34, (uint64_t)&v83, v98, 16);
          }
          while (v36);
        }
        else
        {
          uint64_t v37 = 0;
        }

        uint64_t v65 = objc_msgSend_count(v8, v61, v62);
        if (v65 == v37)
        {
          uint64_t v66 = objc_msgSend_copy(v8, v63, v64);
          targetShapes = v82->_targetShapes;
          v82->_targetShapes = (NSArray *)v66;

          id v68 = objc_alloc(MEMORY[0x263EFF8F8]);
          uint64_t v70 = objc_msgSend_initWithBytes_length_(v68, v69, (uint64_t)__p, v95 - (unsigned char *)__p);
          targetWeights = v82->_targetWeights;
          v82->_targetWeights = (NSData *)v70;

          id v72 = objc_alloc(MEMORY[0x263EFF8F8]);
          uint64_t v74 = objc_msgSend_initWithBytes_length_(v72, v73, (uint64_t)v87, v88 - (unsigned char *)v87);
          targetCounts = v82->_targetCounts;
          v82->_targetCounts = (NSData *)v74;

          v76 = [MDLAnimatedScalarArray alloc];
          uint64_t v78 = objc_msgSend_initWithElementCount_(v76, v77, ((unint64_t)(v88 - (unsigned char *)v87) >> 2));
          weights = v82->_weights;
          v82->_weights = (MDLAnimatedScalarArray *)v78;
        }
        else
        {
          NSLog(&cfstr_TargetshapesCo_0.isa);
        }
        if (v87)
        {
          v88 = (char *)v87;
          operator delete(v87);
        }
        if (__p)
        {
          v95 = (char *)__p;
          operator delete(__p);
        }
        if (v65 == v37) {
          goto LABEL_66;
        }
      }
      else
      {
        NSLog(&cfstr_TargetshapesCo.isa);
      }
    }
    else
    {
      if (v81 == 0)
      {
        uint64_t v51 = objc_msgSend_copy(v8, v9, v10);
        v52 = v82->_targetShapes;
        v82->_targetShapes = (NSArray *)v51;

        v53 = [MDLAnimatedScalarArray alloc];
        unsigned int v56 = objc_msgSend_count(v8, v54, v55);
        uint64_t v58 = objc_msgSend_initWithElementCount_(v53, v57, v56);
        v59 = v82->_weights;
        v82->_weights = (MDLAnimatedScalarArray *)v58;

LABEL_66:
        v60 = v82;
        goto LABEL_67;
      }
      NSLog(&cfstr_Shapesettarget.isa);
    }
  }
  v60 = 0;
LABEL_67:

  return v60;
}

- (MDLMorphDeformer)initWithTargetShapes:(id)a3 shapeSetTargetWeights:(const float *)a4 count:(unint64_t)a5 shapeSetTargetCounts:(const unsigned int *)a6 count:(unint64_t)a7
{
  id v12 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MDLMorphDeformer;
  v15 = [(MDLMorphDeformer *)&v45 init];
  if (v15)
  {
    if (a4 && a6)
    {
      if (objc_msgSend_count(v12, v13, v14) == a5)
      {
        if (a7)
        {
          uint64_t v18 = 0;
          LODWORD(v19) = 0;
          do
            uint64_t v19 = a6[v18++] + v19;
          while (a7 > v18);
        }
        else
        {
          uint64_t v19 = 0;
        }
        if (objc_msgSend_count(v12, v16, v17) == v19)
        {
          uint64_t v31 = objc_msgSend_copy(v12, v29, v30);
          targetShapes = v15->_targetShapes;
          v15->_targetShapes = (NSArray *)v31;

          id v33 = objc_alloc(MEMORY[0x263EFF8F8]);
          uint64_t v35 = objc_msgSend_initWithBytes_length_(v33, v34, (uint64_t)a4, 4 * a5);
          targetWeights = v15->_targetWeights;
          v15->_targetWeights = (NSData *)v35;

          id v37 = objc_alloc(MEMORY[0x263EFF8F8]);
          uint64_t v39 = objc_msgSend_initWithBytes_length_(v37, v38, (uint64_t)a6, 4 * a7);
          targetCounts = v15->_targetCounts;
          v15->_targetCounts = (NSData *)v39;

          int v41 = [MDLAnimatedScalarArray alloc];
          uint64_t v27 = objc_msgSend_initWithElementCount_(v41, v42, a7);
          goto LABEL_17;
        }
        NSLog(&cfstr_TargetshapesCo_0.isa);
      }
      else
      {
        NSLog(&cfstr_TargetshapesCo.isa);
      }
    }
    else
    {
      if (!((unint64_t)a4 | (unint64_t)a6))
      {
        uint64_t v20 = objc_msgSend_copy(v12, v13, v14);
        int v21 = v15->_targetShapes;
        v15->_targetShapes = (NSArray *)v20;

        int v22 = [MDLAnimatedScalarArray alloc];
        unsigned int v25 = objc_msgSend_count(v12, v23, v24);
        uint64_t v27 = objc_msgSend_initWithElementCount_(v22, v26, v25);
LABEL_17:
        weights = v15->_weights;
        v15->_weights = (MDLAnimatedScalarArray *)v27;

        uint64_t v28 = v15;
        goto LABEL_18;
      }
      NSLog(&cfstr_Shapesettarget.isa);
    }
  }
  uint64_t v28 = 0;
LABEL_18:

  return v28;
}

- (NSArray)shapeSetTargetWeights
{
  v3 = objc_opt_new();
  unint64_t v6 = objc_msgSend_length(self->_targetWeights, v4, v5);
  uint64_t v9 = objc_msgSend_bytes(self->_targetWeights, v7, v8);
  if (v6 >= 4)
  {
    uint64_t v13 = v9;
    uint64_t v14 = 0;
    unint64_t v15 = v6 >> 2;
    unsigned int v16 = 1;
    do
    {
      LODWORD(v12) = *(_DWORD *)(v13 + 4 * v14);
      uint64_t v17 = objc_msgSend_numberWithFloat_(NSNumber, v10, v11, v12);
      objc_msgSend_addObject_(v3, v18, (uint64_t)v17);

      uint64_t v14 = v16;
    }
    while (v15 > v16++);
  }
  uint64_t v20 = objc_msgSend_copy(v3, v10, v11);

  return (NSArray *)v20;
}

- (NSArray)shapeSetTargetCounts
{
  v3 = objc_opt_new();
  unint64_t v6 = objc_msgSend_length(self->_targetCounts, v4, v5);
  uint64_t v9 = objc_msgSend_bytes(self->_targetCounts, v7, v8);
  if (v6 >= 4)
  {
    uint64_t v12 = v9;
    uint64_t v13 = 0;
    unint64_t v14 = v6 >> 2;
    unsigned int v15 = 1;
    do
    {
      unsigned int v16 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v10, *(unsigned int *)(v12 + 4 * v13));
      objc_msgSend_addObject_(v3, v17, (uint64_t)v16);

      uint64_t v13 = v15;
    }
    while (v14 > v15++);
  }
  uint64_t v19 = objc_msgSend_copy(v3, v10, v11);

  return (NSArray *)v19;
}

- (MDLAnimatedScalarArray)weights
{
  return self->_weights;
}

- (unint64_t)copyShapeSetTargetWeightsInto:(float *)a3 maxCount:(unint64_t)a4
{
  unint64_t v7 = objc_msgSend_length(self->_targetWeights, a2, (uint64_t)a3);
  unint64_t v10 = v7 >> 2;
  if (v7 >> 2 <= a4)
  {
    uint64_t v11 = (const void *)objc_msgSend_bytes(self->_targetWeights, v8, v9);
    size_t v14 = objc_msgSend_length(self->_targetWeights, v12, v13);
    memcpy(a3, v11, v14);
  }
  else
  {
    NSLog(&cfstr_Targetweightsa.isa, a4, v7 >> 2);
    return 0;
  }
  return v10;
}

- (unint64_t)copyShapeSetTargetCountsInto:(unsigned int *)a3 maxCount:(unint64_t)a4
{
  unint64_t v7 = objc_msgSend_length(self->_targetCounts, a2, (uint64_t)a3);
  unint64_t v10 = v7 >> 1;
  if (v7 >> 1 <= a4)
  {
    uint64_t v11 = (const void *)objc_msgSend_bytes(self->_targetCounts, v8, v9);
    size_t v14 = objc_msgSend_length(self->_targetCounts, v12, v13);
    memcpy(a3, v11, v14);
  }
  else
  {
    NSLog(&cfstr_Targetcountsar.isa, a4, v7 >> 1);
    return 0;
  }
  return v10;
}

- (NSArray)targetShapes
{
  return self->_targetShapes;
}

- (void)setWeights:(id)a3
{
}

- (NSData)targetWeights
{
  return self->_targetWeights;
}

- (void)setTargetWeights:(id)a3
{
}

- (NSData)targetCounts
{
  return self->_targetCounts;
}

- (void)setTargetCounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetCounts, 0);
  objc_storeStrong((id *)&self->_targetWeights, 0);
  objc_storeStrong((id *)&self->_weights, 0);

  objc_storeStrong((id *)&self->_targetShapes, 0);
}

@end