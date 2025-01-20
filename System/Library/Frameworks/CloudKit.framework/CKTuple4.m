@interface CKTuple4
- (BOOL)isEqual:(id)a3;
- (CKTuple4)initWithObject1:(id)a3 object2:(id)a4 object3:(id)a5 object4:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)v1;
- (id)v2;
- (id)v3;
- (id)v4;
- (unint64_t)hash;
- (void)setV1:(id)a3;
- (void)setV2:(id)a3;
- (void)setV3:(id)a3;
- (void)setV4:(id)a3;
@end

@implementation CKTuple4

- (CKTuple4)initWithObject1:(id)a3 object2:(id)a4 object3:(id)a5 object4:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)CKTuple4;
  v14 = [(CKTuple4 *)&v25 init];
  v17 = v14;
  if (v14)
  {
    objc_msgSend_setV1_(v14, v15, (uint64_t)v10, v16);
    objc_msgSend_setV2_(v17, v18, (uint64_t)v11, v19);
    objc_msgSend_setV3_(v17, v20, (uint64_t)v12, v21);
    objc_msgSend_setV4_(v17, v22, (uint64_t)v13, v23);
  }

  return v17;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      v4 = objc_msgSend_v1(self, a2, a3, v3);
      break;
    case 1uLL:
      v4 = objc_msgSend_v2(self, a2, a3, v3);
      break;
    case 2uLL:
      v4 = objc_msgSend_v3(self, a2, a3, v3);
      break;
    case 3uLL:
      v4 = objc_msgSend_v4(self, a2, a3, v3);
      break;
    default:
      v7 = [CKException alloc];
      id v9 = (id)objc_msgSend_initWithCode_format_(v7, v8, 12, @"Invalid tuple index: %lu", a3);
      objc_exception_throw(v9);
  }

  return v4;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_v1(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  id v13 = objc_msgSend_v2(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;
  uint64_t v21 = objc_msgSend_v3(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);
  v29 = objc_msgSend_v4(self, v26, v27, v28);
  unint64_t v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKTuple4 *)a3;
  if (self == v4)
  {
    char v41 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v9 = objc_msgSend_v1(self, v6, v7, v8);
      id v13 = objc_msgSend_v1(v5, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (!v14) {
        goto LABEL_9;
      }
      v18 = objc_msgSend_v2(self, v15, v16, v17);
      v22 = objc_msgSend_v2(v5, v19, v20, v21);
      int v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23) {
        goto LABEL_9;
      }
      uint64_t v27 = objc_msgSend_v3(self, v24, v25, v26);
      uint64_t v31 = objc_msgSend_v3(v5, v28, v29, v30);
      int v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (v32)
      {
        v36 = objc_msgSend_v4(self, v33, v34, v35);
        v40 = objc_msgSend_v4(v5, v37, v38, v39);
        char v41 = CKObjectsAreBothNilOrEqual(v36, v40);
      }
      else
      {
LABEL_9:
        char v41 = 0;
      }
    }
    else
    {
      char v41 = 0;
    }
  }

  return v41;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_v1(self, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_conformsToProtocol_(v5, v6, (uint64_t)&unk_1ED848860, v7)) {
    goto LABEL_8;
  }
  uint64_t v11 = objc_msgSend_v2(self, v8, v9, v10);
  if (!objc_msgSend_conformsToProtocol_(v11, v12, (uint64_t)&unk_1ED848860, v13))
  {
LABEL_7:

LABEL_8:
LABEL_9:
    v63 = [CKException alloc];
    id v65 = (id)objc_msgSend_initWithCode_format_(v63, v64, 12, @"Tuple value does not conform to NSCopying");
    objc_exception_throw(v65);
  }
  uint64_t v17 = objc_msgSend_v3(self, v14, v15, v16);
  if ((objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_1ED848860, v19) & 1) == 0)
  {

    goto LABEL_7;
  }
  int v23 = objc_msgSend_v4(self, v20, v21, v22);
  int v26 = objc_msgSend_conformsToProtocol_(v23, v24, (uint64_t)&unk_1ED848860, v25);

  if (!v26) {
    goto LABEL_9;
  }
  id v27 = objc_alloc((Class)objc_opt_class());
  uint64_t v31 = objc_msgSend_v1(self, v28, v29, v30);
  uint64_t v35 = objc_msgSend_copy(v31, v32, v33, v34);
  uint64_t v39 = objc_msgSend_v2(self, v36, v37, v38);
  v43 = objc_msgSend_copy(v39, v40, v41, v42);
  v47 = objc_msgSend_v3(self, v44, v45, v46);
  v51 = objc_msgSend_copy(v47, v48, v49, v50);
  v55 = objc_msgSend_v4(self, v52, v53, v54);
  v59 = objc_msgSend_copy(v55, v56, v57, v58);
  v61 = objc_msgSend_initWithObject1_object2_object3_object4_(v27, v60, (uint64_t)v35, (uint64_t)v43, v51, v59);

  return v61;
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

- (id)v4
{
  return self->_v4;
}

- (void)setV4:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_v4, 0);
  objc_storeStrong(&self->_v3, 0);
  objc_storeStrong(&self->_v2, 0);

  objc_storeStrong(&self->_v1, 0);
}

@end