@interface KVItem
+ (id)itemFromBuffer:(id)a3 error:(id *)a4;
+ (id)itemFromCascadeItem:(id)a3 error:(id *)a4;
- (BOOL)hasFieldWithType:(int64_t)a3 label:(id)a4 value:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToItem:(id)a3;
- (KVItem)init;
- (KVItem)initWithBuffer:(id)a3 verify:(BOOL)a4 copy:(BOOL)a5 error:(id *)a6;
- (NSData)buffer;
- (NSString)description;
- (id)JSONWithIndent:(unsigned __int8)a3;
- (id)fieldsWithType:(int64_t)a3;
- (id)firstFieldWithType:(int64_t)a3;
- (id)initFromDictionary:(id)a3 error:(id *)a4;
- (id)itemId;
- (id)toCascadeItem:(id *)a3;
- (int64_t)itemType;
- (unint64_t)fieldCount;
- (unint64_t)hash;
- (void)enumerateFieldsUsingBlock:(id)a3;
- (void)enumerateFieldsWithLocaleType:(int64_t)a3 usingBlock:(id)a4;
@end

@implementation KVItem

- (void).cxx_destruct
{
}

- (NSData)buffer
{
  return self->_buffer;
}

- (BOOL)hasFieldWithType:(int64_t)a3 label:(id)a4 value:(id)a5
{
  id v48 = a4;
  id v9 = a5;
  v45 = self;
  v10 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  v11 = &v10[*(unsigned int *)v10->var0];
  uint64_t v12 = *(unsigned int *)v11->var0;
  if (!v12)
  {
    BOOL v42 = 0;
    goto LABEL_33;
  }
  id v46 = v9;
  uint64_t v13 = 0;
  uint64_t v14 = 4 * v12;
  while (1)
  {
    uint64_t v15 = *(unsigned int *)v11[v13 + 4].var0;
    v16 = &v11[v13 + v15];
    v17 = &v11[v13 + v15 - *(int *)v16[4].var0];
    if (*(unsigned __int16 *)v17[4].var0 >= 5u && (uint64_t v18 = *(unsigned __int16 *)v17[8].var0) != 0) {
      uint64_t v19 = *(unsigned __int16 *)v11[v13 + 4 + v15 + v18].var0;
    }
    else {
      uint64_t v19 = 0;
    }
    if (v19 != a3) {
      goto LABEL_24;
    }
    v20 = [KVField alloc];
    v24 = objc_msgSend_initWithBuffer_root_(v20, v21, (uint64_t)v45->_buffer, (uint64_t)&v16[4], v22, v23);
    v30 = v24;
    uint64_t v31 = (uint64_t)v47;
    if (v48 || (objc_msgSend_label(v24, v25, v26, v27, v28, v29), (uint64_t v31 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v47 = (void *)v31;
      v5 = objc_msgSend_label(v30, v25, v26, v27, v28, v29);
      if ((objc_msgSend_isEqual_(v48, v32, (uint64_t)v5, v33, v34, v35) & 1) == 0)
      {

        if (!v48) {
        goto LABEL_24;
        }
      }
      LODWORD(v31) = 1;
    }
    else
    {
      v47 = 0;
    }
    if (v46
      || (objc_msgSend_value(v30, v25, v26, v27, v28, v29), (v44 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v36 = objc_msgSend_value(v30, v25, v26, v27, v28, v29);
      char isEqual = objc_msgSend_isEqual_(v46, v37, (uint64_t)v36, v38, v39, v40);

      if (v46)
      {
        if (!v31) {
          goto LABEL_21;
        }
LABEL_20:

        goto LABEL_21;
      }

      if (v31) {
        goto LABEL_20;
      }
    }
    else
    {
      v44 = 0;
      char isEqual = 1;
      if (v31) {
        goto LABEL_20;
      }
    }
LABEL_21:
    if (!v48) {

    }
    if (isEqual) {
      break;
    }
LABEL_24:
    v13 += 4;
    if (v14 == v13)
    {
      BOOL v42 = 0;
      goto LABEL_32;
    }
  }
  BOOL v42 = 1;
LABEL_32:
  id v9 = v46;
LABEL_33:

  return v42;
}

- (unint64_t)fieldCount
{
  v2 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  return *(unsigned int *)v2[*(unsigned int *)v2->var0].var0;
}

- (id)firstFieldWithType:(int64_t)a3
{
  v3 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  v4 = &v3[*(unsigned int *)v3->var0];
  uint64_t v5 = *(unsigned int *)v4->var0;
  if (v5)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 4 * v5;
    while (1)
    {
      uint64_t v9 = *(unsigned int *)v4[v7 + 4].var0;
      v10 = &v4[v7 + v9];
      v11 = &v4[v7 + v9 - *(int *)v10[4].var0];
      if (*(unsigned __int16 *)v11[4].var0 >= 5u && (uint64_t v12 = *(unsigned __int16 *)v11[8].var0) != 0) {
        uint64_t v13 = *(unsigned __int16 *)v4[v7 + 4 + v9 + v12].var0;
      }
      else {
        uint64_t v13 = 0;
      }
      if (v13 == a3) {
        break;
      }
      v7 += 4;
      if (v8 == v7) {
        goto LABEL_9;
      }
    }
    uint64_t v15 = (uint64_t)&v10[4];
    v16 = [KVField alloc];
    uint64_t v14 = objc_msgSend_initWithBuffer_root_(v16, v17, (uint64_t)self->_buffer, v15, v18, v19);
  }
  else
  {
LABEL_9:
    uint64_t v14 = 0;
  }
  return v14;
}

- (id)fieldsWithType:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  uint64_t v7 = &v6[*(unsigned int *)v6->var0];
  uint64_t v8 = *(unsigned int *)v7->var0;
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 4 * v8;
    do
    {
      uint64_t v11 = *(unsigned int *)v7[v9 + 4].var0;
      uint64_t v12 = &v7[v9 + v11];
      uint64_t v13 = &v7[v9 + v11 - *(int *)v12[4].var0];
      if (*(unsigned __int16 *)v13[4].var0 >= 5u && (uint64_t v14 = *(unsigned __int16 *)v13[8].var0) != 0) {
        uint64_t v15 = *(unsigned __int16 *)v7[v9 + 4 + v11 + v14].var0;
      }
      else {
        uint64_t v15 = 0;
      }
      if (v15 == a3)
      {
        v16 = [KVField alloc];
        v20 = objc_msgSend_initWithBuffer_root_(v16, v17, (uint64_t)self->_buffer, (uint64_t)&v12[4], v18, v19);
        objc_msgSend_addObject_(v5, v21, (uint64_t)v20, v22, v23, v24);
      }
      v9 += 4;
    }
    while (v10 != v9);
  }
  return v5;
}

- (void)enumerateFieldsWithLocaleType:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v11 = v6;
  if (a3)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1BC3C6ED0;
    v16[3] = &unk_1E62AD310;
    int64_t v18 = a3;
    id v17 = v6;
    objc_msgSend_enumerateFieldsUsingBlock_(self, v12, (uint64_t)v16, v13, v14, v15);
  }
  else
  {
    objc_msgSend_enumerateFieldsUsingBlock_(self, v7, (uint64_t)v6, v8, v9, v10);
  }
}

- (void)enumerateFieldsUsingBlock:(id)a3
{
  v4 = (void (**)(id, void *, uint64_t, char *))a3;
  char v17 = 0;
  id v5 = &self->_item[*(unsigned __int16 *)self->_item[-*(int *)self->_item + 8].var0];
  uint64_t v6 = *(unsigned int *)v5->var0;
  uint64_t v8 = &v5[v6 + 4];
  uint64_t v7 = *(unsigned int *)v5[v6].var0;
  if (v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 4 * v7;
    do
    {
      if (v17) {
        break;
      }
      uint64_t v11 = *(unsigned int *)v8->var0;
      uint64_t v12 = [KVField alloc];
      v16 = objc_msgSend_initWithBuffer_root_(v12, v13, (uint64_t)self->_buffer, (uint64_t)&v8[v11], v14, v15);
      v4[2](v4, v16, v9++, &v17);

      v8 += 4;
      v10 -= 4;
    }
    while (v10);
  }
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_buffer, a2, v2, v3, v4, v5);
}

- (BOOL)isEqualToItem:(id)a3
{
  id v4 = a3;
  uint64_t v10 = v4;
  if (v4)
  {
    buffer = self->_buffer;
    uint64_t v12 = objc_msgSend_buffer(v4, v5, v6, v7, v8, v9);
    char isEqual = objc_msgSend_isEqual_(buffer, v13, (uint64_t)v12, v14, v15, v16);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (KVItem *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToItem = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToItem = objc_msgSend_isEqualToItem_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToItem = 0;
  }

  return isEqualToItem;
}

- (id)initFromDictionary:(id)a3 error:(id *)a4
{
  v91 = self;
  v105[1] = *MEMORY[0x1E4F143B8];
  id v95 = a3;
  v96 = objc_alloc_init(KVItemBuilder);
  uint64_t v9 = objc_msgSend_objectForKey_(v95, v5, @"itemType", v6, v7, v8);
  uint64_t v10 = KVItemTypeFromName(v9);

  v92 = objc_msgSend_objectForKey_(v95, v11, @"itemId", v12, v13, v14);
  char v17 = objc_msgSend_setItemType_itemId_error_(v96, v15, v10, (uint64_t)v92, (uint64_t)a4, v16);

  if (v17)
  {
    v93 = objc_msgSend_objectForKey_(v95, v18, @"fields", v19, v20, v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id obj = v93;
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v97, (uint64_t)v103, 16, v27);
      if (v28)
      {
        uint64_t v29 = *(void *)v98;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v98 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void **)(*((void *)&v97 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v83 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v101 = *MEMORY[0x1E4F28568];
              uint64_t v40 = objc_msgSend_stringWithFormat_(NSString, v32, @"Unexpected field dictionary: %@ in item: %@", v33, v34, v35, v31, v95, v91);
              v102 = v40;
              v82 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v84, (uint64_t)&v102, (uint64_t)&v101, 1, v85);
              v88 = objc_msgSend_errorWithDomain_code_userInfo_(v83, v86, @"com.apple.koa.item.builder", 6, (uint64_t)v82, v87);
              v89 = v88;
              if (a4 && v88) {
                *a4 = v88;
              }

              goto LABEL_23;
            }
            uint64_t v40 = objc_msgSend_objectForKey_(v31, v32, @"localeType", v33, v34, v35);
            if (v40)
            {
              v41 = objc_msgSend_objectForKey_(v31, v36, @"fieldType", v37, v38, v39);
              uint64_t v42 = KVFieldTypeFromName(v41);
              uint64_t v43 = KVLocaleTypeFromName(v40);
              id v48 = objc_msgSend_objectForKey_(v31, v44, @"label", v45, v46, v47);
              v53 = objc_msgSend_objectForKey_(v31, v49, @"value", v50, v51, v52);
              v55 = objc_msgSend_addFieldWithType_localeType_label_value_error_(v96, v54, v42, v43, (uint64_t)v48, (uint64_t)v53, a4);
              LOBYTE(v42) = v55 == 0;

              if (v42) {
                goto LABEL_24;
              }
            }
            else
            {
              v56 = objc_msgSend_objectForKey_(v31, v36, @"fieldType", v37, v38, v39);
              uint64_t v57 = KVFieldTypeFromName(v56);
              v62 = objc_msgSend_objectForKey_(v31, v58, @"label", v59, v60, v61);
              v67 = objc_msgSend_objectForKey_(v31, v63, @"value", v64, v65, v66);
              v69 = objc_msgSend_addFieldWithType_label_value_error_(v96, v68, v57, (uint64_t)v62, (uint64_t)v67, (uint64_t)a4);
              LOBYTE(v57) = v69 == 0;

              if (v57)
              {
                uint64_t v40 = 0;
                goto LABEL_24;
              }
            }
          }
          uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v97, (uint64_t)v103, 16, v71);
          if (v28) {
            continue;
          }
          break;
        }
      }

      char v17 = objc_msgSend_buildItemWithError_(v96, v72, (uint64_t)a4, v73, v74, v75);
    }
    else
    {
      v76 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v104 = *MEMORY[0x1E4F28568];
      objc_msgSend_stringWithFormat_(NSString, v22, @"Unexpected fields array in item: %@", v23, v24, v25, v95);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      v105[0] = obj;
      uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v77, (uint64_t)v105, (uint64_t)&v104, 1, v78);
      v81 = objc_msgSend_errorWithDomain_code_userInfo_(v76, v79, @"com.apple.koa.item.builder", 6, (uint64_t)v40, v80);
      v82 = v81;
      if (a4 && v81) {
        *a4 = v81;
      }
LABEL_23:

LABEL_24:
      char v17 = 0;
    }
  }
  return v17;
}

- (id)JSONWithIndent:(unsigned __int8)a3
{
  uint64_t v5 = sub_1BC3D4D78(a3);
  uint64_t v6 = sub_1BC3D4D78(a3 + 1);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendFormat_(v7, v8, @"%@{\n", v9, v10, v11, v5);
  unsigned __int16 v17 = objc_msgSend_itemType(self, v12, v13, v14, v15, v16);
  if (v17 - 1 >= 0x1A) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = v17;
  }
  uint64_t v22 = objc_msgSend_stringWithCString_encoding_(NSString, v18, (uint64_t)off_1E62AD038[v21], 4, v19, v20);
  objc_msgSend_appendFormat_(v7, v23, @"%@\"%@\": \"%@\",\n", v24, v25, v26, v6, @"itemType", v22);

  v32 = objc_msgSend_itemId(self, v27, v28, v29, v30, v31);
  uint64_t v38 = sub_1BC3D4E00((uint64_t)v32, v33, v34, v35, v36, v37);
  objc_msgSend_appendFormat_(v7, v39, @"%@\"%@\": %@,\n", v40, v41, v42, v6, @"itemId", v38);

  objc_msgSend_appendFormat_(v7, v43, @"%@\"%@\": [\n", v44, v45, v46, v6, @"fields");
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = sub_1BC3C7964;
  v57[3] = &unk_1E62AD2E8;
  id v47 = v7;
  id v58 = v47;
  unsigned __int8 v59 = a3;
  objc_msgSend_enumerateFieldsUsingBlock_(self, v48, (uint64_t)v57, v49, v50, v51);
  objc_msgSend_appendFormat_(v47, v52, @"\n%@]\n%@}", v53, v54, v55, v6, v5);

  return v47;
}

- (NSString)description
{
  return (NSString *)objc_msgSend_JSONWithIndent_(self, a2, 0, v2, v3, v4);
}

- (id)itemId
{
  uint64_t v2 = &self->_item[-*(int *)self->_item];
  if (*(unsigned __int16 *)v2->var0 >= 5u && *(_WORD *)v2[4].var0)
  {
    id v4 = [NSString alloc];
    item = self->_item;
    uint64_t v7 = *(int *)item->var0;
    uint64_t v8 = *(unsigned __int16 *)item[-v7 + 4].var0;
    if (*(_WORD *)item[-v7 + 4].var0)
    {
      uint64_t v9 = *(unsigned int *)item[v8].var0;
      uint64_t v10 = &item[v8 + v9];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = *(unsigned int *)item->var0;
    }
    uint64_t v11 = (__CFString *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)item[v8 + v9].var0, 4, 0);
  }
  else
  {
    uint64_t v11 = &stru_1F15F1CC8;
  }
  return v11;
}

- (int64_t)itemType
{
  item = self->_item;
  uint64_t v3 = &item[-*(int *)item->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (uint64_t v4 = *(unsigned __int16 *)v3[6].var0) != 0) {
    return *(unsigned __int16 *)item[v4].var0;
  }
  else {
    return 0;
  }
}

- (id)toCascadeItem:(id *)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, KVItem *, id *))MEMORY[0x1F4181798])(KVItemConverter, sel_cascadeItemFromItem_error_, self, a3);
}

- (KVItem)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (KVItem)initWithBuffer:(id)a3 verify:(BOOL)a4 copy:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  v162[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v150.receiver = self;
  v150.super_class = (Class)KVItem;
  id v15 = [(KVItem *)&v150 init];
  if (!v15) {
    goto LABEL_70;
  }
  if (v8)
  {
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v50 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v159 = *MEMORY[0x1E4F28568];
        uint64_t v51 = NSString;
        uint64_t v52 = (objc_class *)objc_opt_class();
        uint64_t v53 = NSStringFromClass(v52);
        id v58 = objc_msgSend_stringWithFormat_(v51, v54, @"Buffer has unexpected class: %@ expected: NSData", v55, v56, v57, v53);
        v160 = v58;
        uint64_t v61 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v59, (uint64_t)&v160, (uint64_t)&v159, 1, v60);
        uint64_t v64 = objc_msgSend_errorWithDomain_code_userInfo_(v50, v62, @"com.apple.koa.item.builder", 6, (uint64_t)v61, v63);
        uint64_t v65 = v64;
        if (a6 && v64) {
          *a6 = v64;
        }

        goto LABEL_83;
      }
      if (objc_msgSend_length(v10, v16, v17, v18, v19, v20)) {
        goto LABEL_6;
      }
      uint64_t v66 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v157 = *MEMORY[0x1E4F28568];
      v158 = @"Buffer has length of zero";
      uint64_t v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)&v158, (uint64_t)&v157, 1, v14);
      v69 = objc_msgSend_errorWithDomain_code_userInfo_(v66, v67, @"com.apple.koa.item.builder", 6, (uint64_t)v45, v68);
      uint64_t v49 = v69;
      if (a6 && v69) {
        *a6 = v69;
      }
    }
    else
    {
      uint64_t v44 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v161 = *MEMORY[0x1E4F28568];
      v162[0] = @"Buffer is nil";
      uint64_t v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v162, (uint64_t)&v161, 1, v14);
      id v48 = objc_msgSend_errorWithDomain_code_userInfo_(v44, v46, @"com.apple.koa.item.builder", 6, (uint64_t)v45, v47);
      uint64_t v49 = v48;
      if (a6 && v48) {
        *a6 = v48;
      }
    }

LABEL_83:
    v109 = 0;
    goto LABEL_84;
  }
LABEL_6:
  if (v7)
  {
    objc_msgSend_dataWithData_(MEMORY[0x1E4F1C9B8], v11, (uint64_t)v10, v12, v13, v14);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = v10;
  }
  uint64_t v22 = (void *)*((void *)v15 + 2);
  *((void *)v15 + 2) = v21;

  uint64_t v33 = (char *)objc_msgSend_bytes(*((void **)v15 + 2), v23, v24, v25, v26, v27);
  *((void *)v15 + 1) = &v33[*(unsigned int *)v33];
  if (!v8) {
    goto LABEL_70;
  }
  unint64_t v34 = objc_msgSend_length(*((void **)v15 + 2), v28, v29, v30, v31, v32);
  v145 = v33;
  unint64_t v146 = v34;
  long long v147 = xmmword_1BC3E47C0;
  uint64_t v148 = 0;
  char v149 = 1;
  if (v34 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  uint64_t v40 = (int *)*((void *)v15 + 1);
  if (v40)
  {
    if (sub_1BC3B88C8((uint64_t *)&v145, *((int **)v15 + 1)) && sub_1BC3B8980(v40, &v145, 4u))
    {
      uint64_t v41 = (unsigned __int16 *)((char *)v40 - *v40);
      if (*v41 >= 5u && (uint64_t v42 = v41[2]) != 0) {
        uint64_t v43 = (unsigned int *)((char *)v40 + v42 + *(unsigned int *)((char *)v40 + v42));
      }
      else {
        uint64_t v43 = 0;
      }
      if (sub_1BC3B89D8(&v145, v43))
      {
        uint64_t v70 = *v40;
        uint64_t v71 = (char *)v40 - v70;
        unsigned int v72 = *(unsigned __int16 *)((char *)v40 - v70);
        if ((v72 < 7
           || !*((_WORD *)v71 + 3)
           || v146 >= 3 && v146 - 2 >= (char *)v40 + *((unsigned __int16 *)v71 + 3) - v145)
          && sub_1BC3B8980(v40, &v145, 8u))
        {
          if (v72 < 9) {
            goto LABEL_67;
          }
          if (!*((_WORD *)v71 + 4))
          {
            uint64_t v74 = -v70;
            goto LABEL_42;
          }
          if (sub_1BC3B8A54((uint64_t)&v145, (unsigned int *)((char *)v40+ *((unsigned __int16 *)v71 + 4)+ *(unsigned int *)((char *)v40 + *((unsigned __int16 *)v71 + 4))), 4uLL, 0))
          {
            uint64_t v73 = *v40;
            if (*(unsigned __int16 *)((char *)v40 - v73) >= 9u)
            {
              uint64_t v74 = -v73;
LABEL_42:
              uint64_t v75 = *(unsigned __int16 *)((char *)v40 + v74 + 8);
              if (v75)
              {
                v76 = (unsigned int *)((char *)v40 + v75);
                uint64_t v77 = *v76;
                v142 = v76;
                if (*(unsigned int *)((char *)v76 + v77))
                {
                  unint64_t v78 = 0;
                  v79 = v76;
                  v143 = v76 + 1;
                  do
                  {
                    uint64_t v80 = (char *)v79 + v77;
                    uint64_t v81 = *(unsigned int *)((char *)v79 + v77 + 4);
                    v82 = (int *)((char *)v79 + v77 + v81 + 4);
                    if (!sub_1BC3B88C8((uint64_t *)&v145, v82)) {
                      goto LABEL_71;
                    }
                    v144 = &v80[v81];
                    uint64_t v83 = v81 - *(int *)&v80[v81 + 4];
                    unsigned int v84 = *(unsigned __int16 *)&v80[v83 + 4];
                    if (v84 >= 5
                      && *(_WORD *)((char *)v79 + v77 + v83 + 8)
                      && (v146 < 3
                       || v146 - 2 < (unint64_t)v143
                                   + v77
                                   + v81
                                   + *(unsigned __int16 *)((char *)v79 + v77 + v83 + 8)
                                   - (void)v145))
                    {
                      goto LABEL_71;
                    }
                    if (!sub_1BC3B8980(v82, &v145, 6u)) {
                      goto LABEL_71;
                    }
                    if (v84 >= 7 && *(_WORD *)((char *)v79 + v77 + v83 + 10))
                    {
                      uint64_t v85 = v81 + *(unsigned __int16 *)((char *)v79 + v77 + v83 + 10);
                      v86 = (unsigned int *)((char *)v79 + v77
                                                         + v85
                                                         + *(unsigned int *)((char *)v79 + v77 + v85 + 4)
                                                         + 4);
                    }
                    else
                    {
                      v86 = 0;
                    }
                    if (!sub_1BC3B89D8(&v145, v86) || !sub_1BC3B8980(v82, &v145, 8u)) {
                      goto LABEL_71;
                    }
                    uint64_t v87 = (char *)v79 + v77 + v81 - *((int *)v144 + 1);
                    if (*((unsigned __int16 *)v87 + 2) >= 9u && (uint64_t v88 = *((unsigned __int16 *)v87 + 6)) != 0) {
                      v89 = (unsigned int *)((char *)v79
                    }
                                           + v77
                                           + v81
                                           + v88
                                           + *(unsigned int *)((char *)v79 + v77 + v81 + v88 + 4)
                                           + 4);
                    else {
                      v89 = 0;
                    }
                    if (!sub_1BC3B89D8(&v145, v89)) {
                      goto LABEL_71;
                    }
                    v90 = (char *)v79 + v77 + v81 - *((int *)v144 + 1);
                    if (*((unsigned __int16 *)v90 + 2) >= 0xBu)
                    {
                      uint64_t v91 = *((unsigned __int16 *)v90 + 7);
                      if (v91)
                      {
                        if (v146 < 2 || v146 - 1 < (unint64_t)v143 + v77 + v81 + v91 - (void)v145) {
                          goto LABEL_71;
                        }
                      }
                    }
                    LODWORD(v147) = v147 - 1;
                    ++v78;
                    ++v143;
                    ++v79;
                  }
                  while (v78 < *(unsigned int *)((char *)v142 + v77));
                }
              }
            }
LABEL_67:
            LODWORD(v147) = v147 - 1;
            goto LABEL_68;
          }
        }
      }
    }
LABEL_71:
    v110 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v155 = *MEMORY[0x1E4F28568];
    v156 = @"Buffer failed validation";
    v111 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v35, (uint64_t)&v156, (uint64_t)&v155, 1, v39);
    v114 = objc_msgSend_errorWithDomain_code_userInfo_(v110, v112, @"com.apple.koa.item.builder", 6, (uint64_t)v111, v113);
    id v115 = v114;
    if (a6 && v114)
    {
      id v115 = v114;
      *a6 = v115;
    }
    goto LABEL_82;
  }
LABEL_68:
  if ((unsigned __int16)objc_msgSend_itemType(v15, v35, v36, v37, v38, v39) - 1 >= 0x1A)
  {
    v116 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v153 = *MEMORY[0x1E4F28568];
    v117 = NSString;
    unsigned __int16 v118 = objc_msgSend_itemType(v15, v92, v93, v94, v95, v96);
    v111 = objc_msgSend_stringWithFormat_(v117, v119, @"Buffer has invalid itemType: %u", v120, v121, v122, v118);
    v154 = v111;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v123, (uint64_t)&v154, (uint64_t)&v153, 1, v124);
    id v115 = (id)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend_errorWithDomain_code_userInfo_(v116, v125, @"com.apple.koa.item.builder", 1, (uint64_t)v115, v126);
    id v128 = v127;
    if (a6 && v127)
    {
      id v128 = v127;
      *a6 = v128;
    }
    goto LABEL_81;
  }
  long long v97 = objc_msgSend_itemId(v15, v92, v93, v94, v95, v96);
  BOOL v103 = objc_msgSend_length(v97, v98, v99, v100, v101, v102) == 0;

  if (v103)
  {
    v129 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v151 = *MEMORY[0x1E4F28568];
    v130 = NSString;
    v111 = objc_msgSend_itemId(v15, v104, v105, v106, v107, v108);
    objc_msgSend_stringWithFormat_(v130, v131, @"Buffer has invalid itemId: %@", v132, v133, v134, v111);
    id v115 = (id)objc_claimAutoreleasedReturnValue();
    id v152 = v115;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v135, (uint64_t)&v152, (uint64_t)&v151, 1, v136);
    id v128 = (id)objc_claimAutoreleasedReturnValue();
    v139 = objc_msgSend_errorWithDomain_code_userInfo_(v129, v137, @"com.apple.koa.item.builder", 2, (uint64_t)v128, v138);
    v140 = v139;
    if (a6 && v139) {
      *a6 = v139;
    }

LABEL_81:
LABEL_82:

    goto LABEL_83;
  }
LABEL_70:
  v109 = (KVItem *)v15;
LABEL_84:

  return v109;
}

+ (id)itemFromCascadeItem:(id)a3 error:(id *)a4
{
  uint64_t v6 = objc_msgSend_itemFromCascadeItem_error_(KVItemConverter, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  return v6;
}

+ (id)itemFromBuffer:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  BOOL v8 = objc_msgSend_initWithBuffer_verify_copy_error_(v6, v7, (uint64_t)v5, 1, 1, (uint64_t)a4);

  return v8;
}

@end