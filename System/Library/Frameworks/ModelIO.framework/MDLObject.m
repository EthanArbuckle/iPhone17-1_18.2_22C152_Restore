@interface MDLObject
- (BOOL)hidden;
- (MDLAxisAlignedBoundingBox)boundingBoxAtTime:(SEL)a3;
- (MDLObject)init;
- (MDLObject)instance;
- (MDLObject)objectAtPath:(NSString *)path;
- (MDLObject)parent;
- (NSArray)components;
- (NSString)name;
- (NSString)path;
- (id)children;
- (id)componentConformingToProtocol:(Protocol *)protocol;
- (id)description;
- (id)objectForKeyedSubscript:(Protocol *)key;
- (id)recursiveDescription;
- (id)transform;
- (void)addChild:(MDLObject *)child;
- (void)enumerateChildObjectsOfClass:(Class)objectClass root:(MDLObject *)root usingBlock:(void *)block stopPointer:(BOOL *)stopPointer;
- (void)setChildren:(id)children;
- (void)setComponent:(id)component forProtocol:(Protocol *)protocol;
- (void)setHidden:(BOOL)hidden;
- (void)setInstance:(MDLObject *)instance;
- (void)setName:(id)a3;
- (void)setParent:(MDLObject *)parent;
- (void)setTransform:(id)transform;
@end

@implementation MDLObject

- (MDLObject)init
{
  v12.receiver = self;
  v12.super_class = (Class)MDLObject;
  v4 = [(MDLObject *)&v12 init];
  if (v4)
  {
    uint64_t v5 = dword_26ACF4730++;
    uint64_t v6 = objc_msgSend_stringWithFormat_(NSString, v2, @"Obj%d", v5);
    name = v4->name;
    v4->name = (NSString *)v6;
  }
  v8 = objc_msgSend_children(v4, v2, v3);

  if (!v8)
  {
    v9 = objc_opt_new();
    objc_msgSend_setChildren_(v4, v10, (uint64_t)v9);
  }
  return v4;
}

- (void)setComponent:(id)component forProtocol:(Protocol *)protocol
{
  id v11 = component;
  v7 = protocol;
  components = self->_components;
  if (!components)
  {
    v9 = (NSMapTable *)objc_opt_new();
    v10 = self->_components;
    self->_components = v9;

    components = self->_components;
  }
  objc_msgSend_setObject_forKey_(components, v6, (uint64_t)v11, v7);
}

- (id)componentConformingToProtocol:(Protocol *)protocol
{
  uint64_t v3 = objc_msgSend_objectForKey_(self->_components, a2, (uint64_t)protocol);

  return v3;
}

- (id)objectForKeyedSubscript:(Protocol *)key
{
  uint64_t v3 = objc_msgSend_componentConformingToProtocol_(self, a2, (uint64_t)key);

  return v3;
}

- (NSArray)components
{
  uint64_t v3 = objc_msgSend_objectEnumerator(self->_components, a2, v2);
  uint64_t v6 = objc_msgSend_allObjects(v3, v4, v5);

  return (NSArray *)v6;
}

- (MDLObject)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (MDLObject *)WeakRetained;
}

- (void)setParent:(MDLObject *)parent
{
}

- (NSString)path
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  name = self->name;
  if (!name)
  {
    uint64_t v4 = dword_26ACF4730++;
    objc_msgSend_stringWithFormat_(NSString, a2, @"Obj%d", v4);
    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->name;
    self->name = v5;

    name = self->name;
  }
  uint64_t v43 = 0;
  v44 = 0;
  unint64_t v45 = 0;
  v7 = (char *)objc_msgSend_cStringUsingEncoding_(name, a2, 4);
  sub_20B07F8E0(v40, v7);
  sub_20B1AA084((uint64_t)v40, (unsigned __int8 **)&__p);
  v8 = v44;
  if ((unint64_t)v44 >= v45)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v44[-v43] >> 3);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_20B05D0BC();
    }
    if (0x5555555555555556 * ((uint64_t)(v45 - v43) >> 3) > v11) {
      unint64_t v11 = 0x5555555555555556 * ((uint64_t)(v45 - v43) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v45 - v43) >> 3) >= 0x555555555555555) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    v48 = &v45;
    if (v12) {
      v13 = (char *)sub_20B07D5B8((uint64_t)&v45, v12);
    }
    else {
      v13 = 0;
    }
    std::string::size_type v14 = (std::string::size_type)&v13[24 * v10];
    v46.__r_.__value_.__r.__words[0] = (std::string::size_type)v13;
    v46.__r_.__value_.__l.__size_ = v14;
    v47 = &v13[24 * v12];
    long long v15 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(v14 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)std::string::size_type v14 = v15;
    memset(&__p, 0, sizeof(__p));
    v46.__r_.__value_.__r.__words[2] = v14 + 24;
    sub_20B1AB468(&v43, &v46);
    v16 = v44;
    sub_20B1AB600((uint64_t)&v46);
    v44 = v16;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    long long v9 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((void *)v44 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)v8 = v9;
    memset(&__p, 0, sizeof(__p));
    v44 = v8 + 24;
  }
  if (v41 < 0) {
    operator delete(v40[0]);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    do
    {
      memset(&__p, 0, sizeof(__p));
      objc_msgSend_name(WeakRetained, v17, v18);
      id v20 = objc_claimAutoreleasedReturnValue();
      v22 = (char *)objc_msgSend_cStringUsingEncoding_(v20, v21, 4);
      sub_20B07F8E0(&__p, v22);

      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      if (!size)
      {
        bzero(&v46, 0x400uLL);
        int v24 = dword_267691140++;
        sprintf((char *)&v46, "mdl%d", v24);
        MEMORY[0x210532310](&__p, &v46);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          objc_msgSend_stringWithCString_encoding_(NSString, v25, (uint64_t)&__p, 4);
        }
        else {
        v26 = objc_msgSend_stringWithCString_encoding_(NSString, v25, (uint64_t)__p.__r_.__value_.__l.__data_, 4);
        }
        objc_msgSend_setName_(WeakRetained, v27, (uint64_t)v26);
      }
      sub_20B1AA084((uint64_t)&__p, (unsigned __int8 **)&v46);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      std::string __p = v46;
      v28 = v44;
      if ((unint64_t)v44 >= v45)
      {
        v30 = (unsigned char *)sub_20B1AB690(&v43, (long long *)&__p);
      }
      else
      {
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_20B07F994(v44, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v29 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *((void *)v44 + 2) = *((void *)&__p.__r_.__value_.__l + 2);
          _OWORD *v28 = v29;
        }
        v30 = (char *)v28 + 24;
      }
      v44 = v30;
      v31 = (id *)objc_loadWeakRetained(WeakRetained + 1);

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      id WeakRetained = v31;
    }
    while (v31);
  }
  memset(&v46, 0, sizeof(v46));
  v32 = v44;
  while (v32 != (unsigned char *)v43)
  {
    std::string::append(&v46, "/");
    v34 = (const std::string::value_type *)*((void *)v32 - 3);
    v32 -= 24;
    v33 = v34;
    int v35 = (char)v32[23];
    if (v35 >= 0) {
      v36 = v32;
    }
    else {
      v36 = v33;
    }
    if (v35 >= 0) {
      std::string::size_type v37 = v32[23];
    }
    else {
      std::string::size_type v37 = *((void *)v32 + 1);
    }
    std::string::append(&v46, v36, v37);
  }
  if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    objc_msgSend_stringWithCString_encoding_(NSString, v17, (uint64_t)&v46, 4);
  }
  else {
  v38 = objc_msgSend_stringWithCString_encoding_(NSString, v17, (uint64_t)v46.__r_.__value_.__l.__data_, 4);
  }
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v46.__r_.__value_.__l.__data_);
  }
  v46.__r_.__value_.__r.__words[0] = (std::string::size_type)&v43;
  sub_20B0AF458((void ***)&v46);

  return (NSString *)v38;
}

- (void)enumerateChildObjectsOfClass:(Class)objectClass root:(MDLObject *)root usingBlock:(void *)block stopPointer:(BOOL *)stopPointer
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unint64_t v11 = block;
  char v25 = 0;
  if (stopPointer) {
    unint64_t v12 = stopPointer;
  }
  else {
    unint64_t v12 = (BOOL *)&v25;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v13 = objc_msgSend_children(root, v9, v10, 0);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v21, v26, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
LABEL_6:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v22 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v21 + 1) + 8 * v17);
      if (objc_opt_isKindOfClass()) {
        v11[2](v11, v18, v12);
      }
      if (*v12) {
        break;
      }
      objc_msgSend_enumerateChildObjectsOfClass_root_usingBlock_stopPointer_(v18, v19, (uint64_t)objectClass, v18, v11, v12);
      if (*v12) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v20, (uint64_t)&v21, v26, 16);
        if (v15) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

- (MDLObject)objectAtPath:(NSString *)path
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v4 = path;
  v32 = v4;
  if (v4 && objc_msgSend_length(v4, v5, v6))
  {
    v8 = objc_msgSend_componentsSeparatedByString_(v32, v7, @"/");
    unint64_t v11 = v8;
    if (v8 && objc_msgSend_count(v8, v9, v10))
    {
      unint64_t v12 = self;
      uint64_t v15 = 0;
      while (1)
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v33 = v12;
        uint64_t v16 = objc_msgSend_children(v12, v13, v14, v32);
        v19 = (MDLObject *)objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v34, v38, 16);
        if (!v19) {
          break;
        }
        uint64_t v20 = *(void *)v35;
LABEL_8:
        uint64_t v21 = 0;
        while (1)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v16);
          }
          long long v22 = *(void **)(*((void *)&v34 + 1) + 8 * v21);
          long long v23 = objc_msgSend_objectAtIndexedSubscript_(v11, v18, v15);
          v26 = objc_msgSend_name(v22, v24, v25);
          int isEqualToString = objc_msgSend_isEqualToString_(v23, v27, (uint64_t)v26);

          if (isEqualToString) {
            break;
          }
          if (v19 == (MDLObject *)++v21)
          {
            v19 = (MDLObject *)objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v34, v38, 16);
            if (v19) {
              goto LABEL_8;
            }
            goto LABEL_20;
          }
        }
        uint64_t v30 = objc_msgSend_count(v11, v18, v29) - 1;
        v19 = v22;
        if (v30 == v15) {
          break;
        }

        ++v15;
        unint64_t v12 = v19;
        if (!v19) {
          goto LABEL_21;
        }
      }
LABEL_20:
    }
    else
    {
      v19 = 0;
    }
LABEL_21:
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)setTransform:(id)transform
{
}

- (id)transform
{
  return (id)objc_msgSend_componentConformingToProtocol_(self, a2, (uint64_t)&unk_26BF61AF8);
}

- (void)addChild:(MDLObject *)child
{
  uint64_t v14 = child;
  if (v14)
  {
    uint64_t v6 = objc_msgSend_children(self, v4, v5);

    if (!v6)
    {
      long long v9 = objc_opt_new();
      objc_msgSend_setChildren_(self, v10, (uint64_t)v9);
    }
    unint64_t v11 = objc_msgSend_children(self, v7, v8);
    objc_msgSend_addObject_(v11, v12, (uint64_t)v14);

    objc_msgSend_setParent_(v14, v13, (uint64_t)self);
  }
}

- (id)description
{
  uint64_t v17 = self;
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v7 = objc_msgSend_name(self, v5, v6);
  uint64_t v10 = objc_msgSend_children(v17, v8, v9);
  uint64_t v13 = objc_msgSend_count(v10, v11, v12);
  uint64_t v15 = objc_msgSend_initWithFormat_(v3, v14, @"<<%@: 0x%lx>, Name: %@, Children: %d>", v4, &v17, v7, v13);

  return v15;
}

- (id)recursiveDescription
{
  uint64_t v4 = objc_msgSend_string(MEMORY[0x263F089D8], a2, v2);
  objc_msgSend_appendFormat_(v4, v5, @"%@\n", self);
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v9 = objc_msgSend_children(self, v6, v7);
    unint64_t v12 = objc_msgSend_count(v9, v10, v11);

    if (i >= v12) {
      break;
    }
    uint64_t v15 = objc_msgSend_children(self, v13, v14);
    uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v15, v16, i);
    uint64_t v20 = objc_msgSend_recursiveDescription(v17, v18, v19);

    long long v23 = objc_msgSend_children(self, v21, v22);
    uint64_t v26 = objc_msgSend_count(v23, v24, v25);
    uint64_t v27 = @"    ";
    if (i < v26 - 1) {
      uint64_t v27 = @" |  ";
    }
    v28 = v27;

    v32 = objc_msgSend_componentsSeparatedByString_(v20, v29, @"\n");
    char v33 = 0;
    unsigned int v34 = 0;
    while (1)
    {
      uint64_t v36 = v34;
      if (objc_msgSend_count(v32, v30, v31) <= (unint64_t)v34) {
        break;
      }
      long long v37 = objc_msgSend_objectAtIndexedSubscript_(v32, v35, v34);
      uint64_t v40 = objc_msgSend_length(v37, v38, v39);

      if (!v40) {
        break;
      }
      uint64_t v43 = objc_msgSend_objectAtIndexedSubscript_(v32, v41, v36);
      if (v33) {
        objc_msgSend_appendFormat_(v4, v42, @"%@%@\n", v28, v43);
      }
      else {

      }
      unsigned int v34 = v36 + 1;
      char v33 = 1;
    }
  }

  return v4;
}

- (MDLAxisAlignedBoundingBox)boundingBoxAtTime:(SEL)a3
{
  float32x4_t v4 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
  v8[0] = *(float32x4_t *)MEMORY[0x263EF89A8];
  v8[1] = v4;
  float32x4_t v5 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
  v8[2] = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
  v8[3] = v5;
  sub_20B1AAF90(self, v8, (uint64_t)&v7);
  return result;
}

- (MDLObject)instance
{
  return self->_instance;
}

- (void)setInstance:(MDLObject *)instance
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
}

- (id)children
{
  return self->_children;
}

- (void)setChildren:(id)children
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_components, 0);

  objc_destroyWeak((id *)&self->_parent);
}

@end