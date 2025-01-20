@interface CKTuple5
- (BOOL)isEqual:(id)a3;
- (CKTuple5)initWithObject1:(id)a3 object2:(id)a4 object3:(id)a5 object4:(id)a6 object5:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)v1;
- (id)v2;
- (id)v3;
- (id)v4;
- (id)v5;
- (unint64_t)hash;
- (void)setV1:(id)a3;
- (void)setV2:(id)a3;
- (void)setV3:(id)a3;
- (void)setV4:(id)a3;
- (void)setV5:(id)a3;
@end

@implementation CKTuple5

- (CKTuple5)initWithObject1:(id)a3 object2:(id)a4 object3:(id)a5 object4:(id)a6 object5:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)CKTuple5;
  v17 = [(CKTuple5 *)&v30 init];
  v20 = v17;
  if (v17)
  {
    objc_msgSend_setV1_(v17, v18, (uint64_t)v12, v19);
    objc_msgSend_setV2_(v20, v21, (uint64_t)v13, v22);
    objc_msgSend_setV3_(v20, v23, (uint64_t)v14, v24);
    objc_msgSend_setV4_(v20, v25, (uint64_t)v15, v26);
    objc_msgSend_setV5_(v20, v27, (uint64_t)v16, v28);
  }

  return v20;
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
    case 4uLL:
      v4 = objc_msgSend_v5(self, a2, a3, v3);
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
  v21 = objc_msgSend_v3(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_hash(v21, v22, v23, v24);
  v29 = objc_msgSend_v4(self, v26, v27, v28);
  uint64_t v33 = v17 ^ v25 ^ objc_msgSend_hash(v29, v30, v31, v32);
  v37 = objc_msgSend_v5(self, v34, v35, v36);
  unint64_t v41 = v33 ^ objc_msgSend_hash(v37, v38, v39, v40);

  return v41;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKTuple5 *)a3;
  if (self == v4)
  {
    char v50 = 1;
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
        goto LABEL_10;
      }
      v18 = objc_msgSend_v2(self, v15, v16, v17);
      uint64_t v22 = objc_msgSend_v2(v5, v19, v20, v21);
      int v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23) {
        goto LABEL_10;
      }
      uint64_t v27 = objc_msgSend_v3(self, v24, v25, v26);
      uint64_t v31 = objc_msgSend_v3(v5, v28, v29, v30);
      int v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (!v32) {
        goto LABEL_10;
      }
      uint64_t v36 = objc_msgSend_v4(self, v33, v34, v35);
      uint64_t v40 = objc_msgSend_v4(v5, v37, v38, v39);
      int v41 = CKObjectsAreBothNilOrEqual(v36, v40);

      if (v41)
      {
        v45 = objc_msgSend_v5(self, v42, v43, v44);
        v49 = objc_msgSend_v5(v5, v46, v47, v48);
        char v50 = CKObjectsAreBothNilOrEqual(v45, v49);
      }
      else
      {
LABEL_10:
        char v50 = 0;
      }
    }
    else
    {
      char v50 = 0;
    }
  }

  return v50;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_v1(self, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_conformsToProtocol_(v5, v6, (uint64_t)&unk_1ED848860, v7)) {
    goto LABEL_10;
  }
  uint64_t v11 = objc_msgSend_v2(self, v8, v9, v10);
  if (!objc_msgSend_conformsToProtocol_(v11, v12, (uint64_t)&unk_1ED848860, v13))
  {
LABEL_9:

LABEL_10:
LABEL_11:
    v76 = [CKException alloc];
    id v78 = (id)objc_msgSend_initWithCode_format_(v76, v77, 12, @"Tuple value does not conform to NSCopying");
    objc_exception_throw(v78);
  }
  uint64_t v17 = objc_msgSend_v3(self, v14, v15, v16);
  if (!objc_msgSend_conformsToProtocol_(v17, v18, (uint64_t)&unk_1ED848860, v19))
  {
LABEL_8:

    goto LABEL_9;
  }
  int v23 = objc_msgSend_v4(self, v20, v21, v22);
  if (!objc_msgSend_conformsToProtocol_(v23, v24, (uint64_t)&unk_1ED848860, v25))
  {

    goto LABEL_8;
  }
  uint64_t v29 = objc_msgSend_v5(self, v26, v27, v28);
  int v32 = objc_msgSend_conformsToProtocol_(v29, v30, (uint64_t)&unk_1ED848860, v31);

  if (!v32) {
    goto LABEL_11;
  }
  id v33 = objc_alloc((Class)objc_opt_class());
  v79 = objc_msgSend_v1(self, v34, v35, v36);
  uint64_t v40 = objc_msgSend_copy(v79, v37, v38, v39);
  uint64_t v44 = objc_msgSend_v2(self, v41, v42, v43);
  uint64_t v48 = objc_msgSend_copy(v44, v45, v46, v47);
  v52 = objc_msgSend_v3(self, v49, v50, v51);
  v56 = objc_msgSend_copy(v52, v53, v54, v55);
  v60 = objc_msgSend_v4(self, v57, v58, v59);
  v64 = objc_msgSend_copy(v60, v61, v62, v63);
  v68 = objc_msgSend_v5(self, v65, v66, v67);
  v72 = objc_msgSend_copy(v68, v69, v70, v71);
  v74 = objc_msgSend_initWithObject1_object2_object3_object4_object5_(v33, v73, (uint64_t)v40, (uint64_t)v48, v56, v64, v72);

  return v74;
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

- (id)v5
{
  return self->_v5;
}

- (void)setV5:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_v5, 0);
  objc_storeStrong(&self->_v4, 0);
  objc_storeStrong(&self->_v3, 0);
  objc_storeStrong(&self->_v2, 0);

  objc_storeStrong(&self->_v1, 0);
}

@end