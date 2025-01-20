@interface KVItemMapper
- (KVItemMapper)init;
- (KVItemMapper)initWithObjectClass:(Class)a3 error:(id *)a4;
- (id)mapObject:(id)a3 additionalFields:(id)a4 error:(id *)a5;
- (id)mapObject:(id)a3 error:(id *)a4;
- (int64_t)targetItemType;
@end

@implementation KVItemMapper

- (void).cxx_destruct
{
}

- (id)mapObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  return (id)((uint64_t (*)(KMItemMapper *, char *, id, id, id *))MEMORY[0x1F4181798])(self->_mapper, sel_itemsFromExternalObject_additionalFields_error_, a3, a4, a5);
}

- (id)mapObject:(id)a3 error:(id *)a4
{
  return (id)((uint64_t (*)(KMItemMapper *, char *, id, void, id *))MEMORY[0x1F4181798])(self->_mapper, sel_itemsFromExternalObject_additionalFields_error_, a3, 0, a4);
}

- (int64_t)targetItemType
{
  return ((uint64_t (*)(KMItemMapper *, char *))MEMORY[0x1F4181798])(self->_mapper, sel_targetItemType);
}

- (KVItemMapper)initWithObjectClass:(Class)a3 error:(id *)a4
{
  v17.receiver = self;
  v17.super_class = (Class)KVItemMapper;
  v6 = [(KVItemMapper *)&v17 init];
  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v7 = (void *)qword_1EB5EE428;
  uint64_t v22 = qword_1EB5EE428;
  if (!qword_1EB5EE428)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1BC3D54F4;
    v18[3] = &unk_1E62AD708;
    v18[4] = &v19;
    sub_1BC3D54F4((uint64_t)v18);
    v7 = (void *)v20[3];
  }
  v8 = v7;
  _Block_object_dispose(&v19, 8);
  id v9 = [v8 alloc];
  uint64_t v13 = objc_msgSend_initWithObjectClass_error_(v9, v10, (uint64_t)a3, (uint64_t)a4, v11, v12);
  mapper = v6->_mapper;
  v6->_mapper = (KMItemMapper *)v13;

  if (!v6->_mapper) {
    v15 = 0;
  }
  else {
LABEL_5:
  }
    v15 = v6;

  return v15;
}

- (KVItemMapper)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

@end