@interface CKTuple2
- (BOOL)isEqual:(id)a3;
- (CKTuple2)initWithObject1:(id)a3 object2:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)v1;
- (id)v2;
- (unint64_t)hash;
- (void)setV1:(id)a3;
- (void)setV2:(id)a3;
@end

@implementation CKTuple2

- (void).cxx_destruct
{
  objc_storeStrong(&self->_v2, 0);

  objc_storeStrong(&self->_v1, 0);
}

- (CKTuple2)initWithObject1:(id)a3 object2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKTuple2;
  v8 = [(CKTuple2 *)&v15 init];
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setV1_(v8, v9, (uint64_t)v6, v10);
    objc_msgSend_setV2_(v11, v12, (uint64_t)v7, v13);
  }

  return v11;
}

- (void)setV2:(id)a3
{
}

- (void)setV1:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CKTuple2 *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v9 = objc_msgSend_v1(self, v6, v7, v8);
      uint64_t v13 = objc_msgSend_v1(v5, v10, v11, v12);
      int v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (v14)
      {
        v18 = objc_msgSend_v2(self, v15, v16, v17);
        v22 = objc_msgSend_v2(v5, v19, v20, v21);
        char v23 = CKObjectsAreBothNilOrEqual(v18, v22);
      }
      else
      {
        char v23 = 0;
      }
    }
    else
    {
      char v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  v5 = objc_msgSend_v1(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_v2(self, v10, v11, v12);
  unint64_t v17 = objc_msgSend_hash(v13, v14, v15, v16) ^ v9;

  return v17;
}

- (id)v2
{
  return self->_v2;
}

- (id)v1
{
  return self->_v1;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if (a3 == 1)
  {
    v4 = objc_msgSend_v2(self, a2, 1, v3);
  }
  else
  {
    if (a3)
    {
      uint64_t v7 = [CKException alloc];
      id v9 = (id)objc_msgSend_initWithCode_format_(v7, v8, 12, @"Invalid tuple index: %lu", a3);
      objc_exception_throw(v9);
    }
    v4 = objc_msgSend_v1(self, a2, 0, v3);
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend_v1(self, a2, (uint64_t)a3, v3);
  if ((objc_msgSend_conformsToProtocol_(v5, v6, (uint64_t)&unk_1ED848860, v7) & 1) == 0)
  {

LABEL_5:
    v35 = [CKException alloc];
    id v37 = (id)objc_msgSend_initWithCode_format_(v35, v36, 12, @"Tuple value does not conform to NSCopying");
    objc_exception_throw(v37);
  }
  uint64_t v11 = objc_msgSend_v2(self, v8, v9, v10);
  int v14 = objc_msgSend_conformsToProtocol_(v11, v12, (uint64_t)&unk_1ED848860, v13);

  if (!v14) {
    goto LABEL_5;
  }
  id v15 = objc_alloc((Class)objc_opt_class());
  v19 = objc_msgSend_v1(self, v16, v17, v18);
  char v23 = objc_msgSend_copy(v19, v20, v21, v22);
  v27 = objc_msgSend_v2(self, v24, v25, v26);
  v31 = objc_msgSend_copy(v27, v28, v29, v30);
  v33 = objc_msgSend_initWithObject1_object2_(v15, v32, (uint64_t)v23, (uint64_t)v31);

  return v33;
}

@end