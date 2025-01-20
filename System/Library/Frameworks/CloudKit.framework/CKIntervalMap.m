@interface CKIntervalMap
- (BOOL)containsIndex:(unint64_t)a3;
- (BOOL)containsIndexes:(id)a3;
- (BOOL)dirty;
- (CKIntervalMap)init;
- (CKIntervalMapRangeMapContainer)rangeMap;
- (id)allIndexes;
- (id)description;
- (void)enumerateObjectsForIndexes:(id)a3 usingBlock:(id)a4;
- (void)maintainInvariants;
- (void)setDirty:(BOOL)a3;
@end

@implementation CKIntervalMap

- (CKIntervalMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKIntervalMap;
  v2 = [(CKIntervalMap *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    rangeMap = v2->_rangeMap;
    v2->_rangeMap = (CKIntervalMapRangeMapContainer *)v3;
  }
  return v2;
}

- (void)maintainInvariants
{
  if (objc_msgSend_dirty(self, a2, v2, v3))
  {
    v8 = objc_msgSend_rangeMap(self, v5, v6, v7);
    v9 = (__n128 *)v8[1];
    v10 = (__n128 *)v8[2];
    uint64_t v11 = (char *)v10 - (char *)v9;
    if ((unint64_t)((char *)v10 - (char *)v9) >= 0x21)
    {
      unint64_t v12 = v11 >> 5;
      if (v11 < 1)
      {
LABEL_7:
        v17 = 0;
        unint64_t v14 = 0;
      }
      else
      {
        v13 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
        unint64_t v14 = v11 >> 5;
        while (1)
        {
          v15 = (__n128 *)operator new(32 * v14, v13);
          if (v15) {
            break;
          }
          BOOL v16 = v14 > 1;
          v14 >>= 1;
          if (!v16) {
            goto LABEL_7;
          }
        }
        v17 = v15;
      }
      sub_18B06A1D8(v9, v10, v12, v17, v14);
      if (v17) {
        operator delete(v17);
      }
      v9 = (__n128 *)v8[1];
      v10 = (__n128 *)v8[2];
    }
    if (v9 != v10) {
      sub_18B06A144(v8 + 1, 0, ((char *)v10 - (char *)v9) >> 5);
    }

    uint64_t v21 = objc_msgSend_rangeMap(self, v18, v19, v20);
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)(v21 + 8);
    v24 = *(unint64_t **)(v21 + 16);
    if ((unint64_t *)v23 != v24)
    {
      v25 = *(unint64_t **)(v21 + 16);
      v26 = *(unint64_t **)(v21 + 8);
      while (1)
      {
        if (v25 != v24)
        {
          BOOL v27 = *v25 <= v26[1] + *v26 && v25[1] + *v25 >= *v26;
          if (v27 && v25[2] == v26[2]) {
            break;
          }
        }
        v25 = v26;
        v26 += 4;
        if (v26 == v24) {
          goto LABEL_56;
        }
      }
      int64x2_t v51 = 0uLL;
      unint64_t v52 = 0;
      v28 = v24;
      do
      {
        if (v28 != v24
          && ((unint64_t v29 = *(void *)(v23 + 8) + *(void *)v23, *v28 <= v29)
            ? (BOOL v30 = v28[1] + *v28 >= *(void *)v23)
            : (BOOL v30 = 0),
              v30 && v28[2] == *(void *)(v23 + 16)))
        {
          unint64_t v44 = *(void *)(v51.i64[1] - 32);
          BOOL v27 = v29 >= v44;
          unint64_t v45 = v29 - v44;
          if (!v27) {
            unint64_t v45 = 0;
          }
          *(void *)(v51.i64[1] - 24) = v45;
        }
        else
        {
          uint64_t v31 = v51.i64[1];
          if (v51.i64[1] >= v52)
          {
            uint64_t v33 = (v51.i64[1] - v51.i64[0]) >> 5;
            if ((unint64_t)(v33 + 1) >> 59) {
              sub_18B06B0C0();
            }
            unint64_t v34 = (uint64_t)(v52 - v51.i64[0]) >> 4;
            if (v34 <= v33 + 1) {
              unint64_t v34 = v33 + 1;
            }
            if (v52 - v51.i64[0] >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v35 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v35 = v34;
            }
            v56 = &v52;
            if (v35) {
              unint64_t v35 = (unint64_t)sub_18B06B160(v35);
            }
            else {
              uint64_t v36 = 0;
            }
            unint64_t v37 = v35 + 32 * v33;
            v53 = (int64x2_t *)v35;
            v54.i64[0] = v37;
            unint64_t v55 = v35 + 32 * v36;
            *(_OWORD *)unint64_t v37 = *(_OWORD *)v23;
            *(void *)(v37 + 16) = *(id *)(v23 + 16);
            *(void *)(v37 + 24) = *(void *)(v23 + 24);
            unint64_t v32 = v37 + 32;
            v54.i64[1] = v32;
            uint64_t v38 = v51.i64[1];
            uint64_t v39 = v51.i64[0];
            uint64_t v40 = v54.i64[0];
            if (v51.i64[1] == v51.i64[0])
            {
              int64x2_t v42 = vdupq_n_s64(v51.u64[1]);
            }
            else
            {
              do
              {
                *(_OWORD *)(v40 - 32) = *(_OWORD *)(v38 - 32);
                uint64_t v41 = *(void *)(v38 - 16);
                *(void *)(v38 - 16) = 0;
                *(void *)(v40 - 16) = v41;
                *(void *)(v40 - 8) = *(void *)(v38 - 8);
                v40 -= 32;
                v38 -= 32;
              }
              while (v38 != v39);
              int64x2_t v42 = v51;
              unint64_t v32 = v54.u64[1];
            }
            v51.i64[0] = v40;
            v51.i64[1] = v32;
            int64x2_t v54 = v42;
            unint64_t v43 = v52;
            unint64_t v52 = v55;
            unint64_t v55 = v43;
            v53 = (int64x2_t *)v42.i64[0];
            sub_18B06B1CC((uint64_t)&v53);
          }
          else
          {
            *(_OWORD *)v51.i64[1] = *(_OWORD *)v23;
            *(void *)(v31 + 16) = *(id *)(v23 + 16);
            *(void *)(v31 + 24) = *(void *)(v23 + 24);
            unint64_t v32 = v31 + 32;
          }
          v51.i64[1] = v32;
        }
        v28 = (unint64_t *)v23;
        v23 += 32;
      }
      while ((unint64_t *)v23 != v24);
      unint64_t v46 = v52;
      int64x2_t v47 = *(int64x2_t *)(v22 + 8);
      *(int64x2_t *)(v22 + 8) = v51;
      int64x2_t v51 = v47;
      unint64_t v48 = *(void *)(v22 + 24);
      *(void *)(v22 + 24) = v46;
      unint64_t v52 = v48;
      v53 = &v51;
      sub_18B06A0BC((void ***)&v53);
    }
LABEL_56:

    objc_msgSend_setDirty_(self, v49, 0, v50);
  }
}

- (BOOL)containsIndex:(unint64_t)a3
{
  objc_msgSend_maintainInvariants(self, a2, a3, v3);
  v9 = objc_msgSend_rangeMap(self, v6, v7, v8);
  v10 = (unint64_t *)v9[1];
  uint64_t v11 = (unint64_t *)v9[2];
  if (v10 == v11) {
    goto LABEL_28;
  }
  unint64_t v12 = ((char *)v11 - (char *)v10) >> 5;
  v13 = (unint64_t *)v9[1];
  do
  {
    unint64_t v14 = v12 >> 1;
    v15 = &v13[4 * (v12 >> 1)];
    unint64_t v17 = *v15;
    BOOL v16 = v15 + 4;
    v12 += ~(v12 >> 1);
    if (v17 < a3) {
      v13 = v16;
    }
    else {
      unint64_t v12 = v14;
    }
  }
  while (v12);
  unint64_t v18 = a3 + 1;
  while (v13 != v10)
  {
    uint64_t v19 = v13;
    unint64_t v21 = *(v13 - 4);
    v13 -= 4;
    unint64_t v20 = v21;
    if (v21 <= a3)
    {
      unint64_t v22 = *(v19 - 3) + v20;
      BOOL v23 = v22 <= a3 || v20 > v18;
      if (!v23 && v22 >= v18) {
        continue;
      }
    }
    goto LABEL_19;
  }
  uint64_t v19 = (unint64_t *)v9[1];
LABEL_19:
  if (v19 == v11
    || (unint64_t v25 = *v19, *v19 > a3)
    || ((v26 = v19[1] + v25, v26 > a3) ? (BOOL v27 = v25 > v18) : (BOOL v27 = 1), !v27 ? (v28 = v26 >= v18) : (v28 = 0), !v28))
  {
LABEL_28:
    uint64_t v19 = (unint64_t *)v9[2];
  }
  BOOL v30 = v19 != v11 && v19 != 0;

  return v30;
}

- (BOOL)containsIndexes:(id)a3
{
  id v4 = a3;
  objc_msgSend_maintainInvariants(self, v5, v6, v7);
  uint64_t v8 = objc_opt_new();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B0698E4;
  v14[3] = &unk_1E54626F0;
  id v9 = v8;
  id v15 = v9;
  objc_msgSend_enumerateObjectsForIndexes_usingBlock_(self, v10, (uint64_t)v4, (uint64_t)v14);
  LOBYTE(self) = objc_msgSend_containsIndexes_(v9, v11, (uint64_t)v4, v12);

  return (char)self;
}

- (id)allIndexes
{
  objc_msgSend_maintainInvariants(self, a2, v2, v3);
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v11 = objc_msgSend_rangeMap(self, v5, v6, v7);
    uint64_t v12 = v11[2] - v11[1];

    if (i >= v12 >> 5) {
      break;
    }
    BOOL v16 = objc_msgSend_rangeMap(self, v13, v14, v15);
    uint64_t v17 = v16[1] + v9;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    id v20 = *(id *)(v17 + 16);

    objc_msgSend_addIndexesInRange_(v8, v21, v18, v19);
    v9 += 32;
  }

  return v8;
}

- (void)enumerateObjectsForIndexes:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_msgSend_maintainInvariants(self, v8, v9, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B069AC8;
  v14[3] = &unk_1E5462718;
  void v14[4] = self;
  id v11 = v7;
  id v15 = v11;
  objc_msgSend_enumerateRangesUsingBlock_(v6, v12, (uint64_t)v14, v13);
}

- (id)description
{
  objc_msgSend_maintainInvariants(self, a2, v2, v3);
  v5 = objc_opt_new();
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  objc_msgSend_appendFormat_(v5, v8, @"<%@", v9, v7);

  uint64_t v13 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    id v15 = objc_msgSend_rangeMap(self, v10, v11, v12);
    uint64_t v16 = v15[2] - v15[1];

    if (i >= v16 >> 5) {
      break;
    }
    id v20 = objc_msgSend_rangeMap(self, v17, v18, v19);
    unint64_t v21 = (uint64_t *)(v20[1] + v13);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    id v24 = (id)v21[2];

    if (i) {
      objc_msgSend_appendFormat_(v5, v25, @", ", v26);
    }
    else {
      objc_msgSend_appendFormat_(v5, v25, @" ", v26);
    }
    if (v23 == 1)
    {
      objc_msgSend_appendFormat_(v5, v27, @"%lu:%@", v28, v22, v24);
    }
    else if (v23)
    {
      objc_msgSend_appendFormat_(v5, v27, @"%lu-%lu:%@", v28, v22, v22 + v23 - 1, v24);
    }
    else
    {
      objc_msgSend_appendFormat_(v5, v27, @"%lu(0)", v28, v22);
    }

    v13 += 32;
  }
  objc_msgSend_appendFormat_(v5, v17, @">", v19);

  return v5;
}

- (CKIntervalMapRangeMapContainer)rangeMap
{
  return self->_rangeMap;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
}

@end