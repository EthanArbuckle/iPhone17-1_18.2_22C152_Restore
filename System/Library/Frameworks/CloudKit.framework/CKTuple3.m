@interface CKTuple3
- (BOOL)isEqual:(id)a3;
- (CKTuple3)initWithObject1:(id)a3 object2:(id)a4 object3:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)v1;
- (id)v2;
- (id)v3;
- (unint64_t)hash;
- (void)setV1:(id)a3;
- (void)setV2:(id)a3;
- (void)setV3:(id)a3;
@end

@implementation CKTuple3

- (CKTuple3)initWithObject1:(id)a3 object2:(id)a4 object3:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CKTuple3;
  v11 = [(CKTuple3 *)&v20 init];
  v14 = v11;
  if (v11)
  {
    objc_msgSend_setV1_(v11, v12, (uint64_t)v8, v13);
    objc_msgSend_setV2_(v14, v15, (uint64_t)v9, v16);
    objc_msgSend_setV3_(v14, v17, (uint64_t)v10, v18);
  }

  return v14;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (a3 == 2)
  {
    v4 = objc_msgSend_v3(self, a2, 2, v3);
  }
  else if (a3 == 1)
  {
    v4 = objc_msgSend_v2(self, a2, 1, v3);
  }
  else
  {
    if (a3)
    {
      v7 = [CKException alloc];
      id v9 = (id)objc_msgSend_initWithCode_format_(v7, v8, 12, @"Invalid tuple index: %lu", a3);
      objc_exception_throw(v9);
    }
    v4 = objc_msgSend_v1(self, a2, 0, v3);
  }

  return v4;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_v1(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_v2(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  v21 = objc_msgSend_v3(self, v18, v19, v20);
  unint64_t v25 = v17 ^ objc_msgSend_hash(v21, v22, v23, v24);

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKTuple3 *)a3;
  if (self == v4)
  {
    char v32 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v9 = objc_msgSend_v1(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_v1(v5, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14
        && (objc_msgSend_v2(self, v15, v16, v17),
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_v2(v5, v19, v20, v21),
            v22 = objc_claimAutoreleasedReturnValue(),
            int v23 = CKObjectsAreBothNilOrEqual(v18, v22),
            v22,
            v18,
            v23))
      {
        v27 = objc_msgSend_v3(self, v24, v25, v26);
        v31 = objc_msgSend_v3(v5, v28, v29, v30);
        char v32 = CKObjectsAreBothNilOrEqual(v27, v31);
      }
      else
      {
        char v32 = 0;
      }
    }
    else
    {
      char v32 = 0;
    }
  }

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_v1(self, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_conformsToProtocol_(v5, v6, (uint64_t)&unk_1ED848860, v7)) {
    goto LABEL_6;
  }
  uint64_t v11 = objc_msgSend_v2(self, v8, v9, v10);
  if ((objc_msgSend_conformsToProtocol_(v11, v12, (uint64_t)&unk_1ED848860, v13) & 1) == 0)
  {

LABEL_6:
LABEL_7:
    v49 = [CKException alloc];
    id v51 = (id)objc_msgSend_initWithCode_format_(v49, v50, 12, @"Tuple value does not conform to NSCopying");
    objc_exception_throw(v51);
  }
  uint64_t v17 = objc_msgSend_v3(self, v14, v15, v16);
  int v20 = objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_1ED848860, v19);

  if (!v20) {
    goto LABEL_7;
  }
  id v21 = objc_alloc((Class)objc_opt_class());
  uint64_t v25 = objc_msgSend_v1(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_copy(v25, v26, v27, v28);
  v33 = objc_msgSend_v2(self, v30, v31, v32);
  v37 = objc_msgSend_copy(v33, v34, v35, v36);
  v41 = objc_msgSend_v3(self, v38, v39, v40);
  v45 = objc_msgSend_copy(v41, v42, v43, v44);
  v47 = objc_msgSend_initWithObject1_object2_object3_(v21, v46, (uint64_t)v29, (uint64_t)v37, v45);

  return v47;
}

- (id)v1
{
  return self->_v1;
}

- (void)setV1:(id)a3
{
}

- (id)v2
{
  return self->_v2;
}

- (void)setV2:(id)a3
{
}

- (id)v3
{
  return self->_v3;
}

- (void)setV3:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_v3, 0);
  objc_storeStrong(&self->_v2, 0);

  objc_storeStrong(&self->_v1, 0);
}

@end