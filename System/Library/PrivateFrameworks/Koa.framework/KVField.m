@interface KVField
+ (id)fieldWithBuffer:(id)a3 root:(const void *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToField:(id)a3;
- (KVField)init;
- (KVField)initWithBuffer:(id)a3 root:(const Field *)a4;
- (NSString)description;
- (id)JSONWithIndent:(unsigned __int8)a3;
- (id)label;
- (id)value;
- (int64_t)fieldType;
- (int64_t)localeType;
- (unint64_t)hash;
@end

@implementation KVField

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  v7 = NSNumber;
  uint64_t v8 = objc_msgSend_fieldType(self, a2, v2, v3, v4, v5);
  v13 = objc_msgSend_numberWithInteger_(v7, v9, v8, v10, v11, v12);
  uint64_t v19 = objc_msgSend_hash(v13, v14, v15, v16, v17, v18);
  v25 = objc_msgSend_value(self, v20, v21, v22, v23, v24);
  uint64_t v31 = objc_msgSend_hash(v25, v26, v27, v28, v29, v30);
  v37 = objc_msgSend_label(self, v32, v33, v34, v35, v36);
  unint64_t v43 = v31 ^ v19 ^ objc_msgSend_hash(v37, v38, v39, v40, v41, v42);

  return v43;
}

- (BOOL)isEqualToField:(id)a3
{
  id v8 = a3;
  uint64_t v14 = objc_msgSend_fieldType(self, v9, v10, v11, v12, v13);
  if (v14 == objc_msgSend_fieldType(v8, v15, v16, v17, v18, v19))
  {
    uint64_t v25 = objc_msgSend_localeType(self, v20, v21, v22, v23, v24);
    if (v25 == objc_msgSend_localeType(v8, v26, v27, v28, v29, v30))
    {
      uint64_t v41 = objc_msgSend_value(self, v31, v32, v33, v34, v35);
      if (v41
        || (objc_msgSend_value(v8, v36, v37, v38, v39, v40), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v3 = objc_msgSend_value(self, v36, v37, v38, v39, v40);
        uint64_t v4 = objc_msgSend_value(v8, v42, v43, v44, v45, v46);
        if (!objc_msgSend_isEqual_(v3, v47, (uint64_t)v4, v48, v49, v50))
        {
          char isEqual = 0;
          goto LABEL_15;
        }
        int v51 = 1;
      }
      else
      {
        int v51 = 0;
      }
      v71 = v5;
      v58 = objc_msgSend_label(self, v36, v37, v38, v39, v40);
      if (v58
        || (objc_msgSend_label(v8, v53, v54, v55, v56, v57), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v59 = objc_msgSend_label(self, v53, v54, v55, v56, v57);
        v65 = objc_msgSend_label(v8, v60, v61, v62, v63, v64);
        char isEqual = objc_msgSend_isEqual_(v59, v66, (uint64_t)v65, v67, v68, v69);

        if (v58)
        {

          if (v51)
          {
LABEL_14:
            uint64_t v5 = v71;
LABEL_15:

            if (v41)
            {
LABEL_17:

              goto LABEL_18;
            }
LABEL_16:

            goto LABEL_17;
          }
LABEL_21:
          uint64_t v5 = v71;
          if (v41) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
      }
      else
      {
        char isEqual = 1;
      }

      if (v51) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  char isEqual = 0;
LABEL_18:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (KVField *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char isEqualToField = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isEqualToField = objc_msgSend_isEqualToField_(self, v6, (uint64_t)v5, v7, v8, v9);
  }
  else
  {
    char isEqualToField = 0;
  }

  return isEqualToField;
}

- (id)JSONWithIndent:(unsigned __int8)a3
{
  uint64_t v5 = sub_1BC3D4D78(a3);
  v6 = sub_1BC3D4D78(a3 + 1);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendFormat_(v7, v8, @"%@{\n", v9, v10, v11, v5);
  unsigned __int16 v17 = objc_msgSend_fieldType(self, v12, v13, v14, v15, v16);
  uint64_t v18 = KVFieldTypeName(v17);
  objc_msgSend_appendFormat_(v7, v19, @"%@\"%@\": \"%@\",\n", v20, v21, v22, v6, @"fieldType", v18);

  unint64_t v28 = objc_msgSend_localeType(self, v23, v24, v25, v26, v27);
  if (v28)
  {
    if (v28 >= 0x2D) {
      unsigned __int8 v34 = 0;
    }
    else {
      unsigned __int8 v34 = v28;
    }
    if (v34 <= 0x2Cu) {
      objc_msgSend_stringWithCString_encoding_(NSString, v29, (uint64_t)off_1E62AD118[v34], 4, v32, v33);
    }
    else {
    uint64_t v35 = objc_msgSend_stringWithCString_encoding_(NSString, v29, (uint64_t)"", 4, v32, v33);
    }
    objc_msgSend_appendFormat_(v7, v36, @"%@\"%@\": \"%@\",\n", v37, v38, v39, v6, @"localeType", v35);
  }
  uint64_t v40 = objc_msgSend_label(self, v29, v30, v31, v32, v33);
  if (objc_msgSend_length(v40, v41, v42, v43, v44, v45))
  {
    int v51 = sub_1BC3D4E00((uint64_t)v40, v46, v47, v48, v49, v50);
    objc_msgSend_appendFormat_(v7, v52, @"%@\"%@\": %@,\n", v53, v54, v55, v6, @"label", v51);
  }
  uint64_t v56 = objc_msgSend_value(self, v46, v47, v48, v49, v50);
  if (objc_msgSend_length(v56, v57, v58, v59, v60, v61))
  {
    uint64_t v67 = sub_1BC3D4E00((uint64_t)v56, v62, v63, v64, v65, v66);
    objc_msgSend_appendFormat_(v7, v68, @"%@\"%@\": %@,\n", v69, v70, v71, v6, @"value", v67);
  }
  objc_msgSend_appendFormat_(v7, v62, @"%@}", v64, v65, v66, v5);

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend_JSONWithIndent_(self, a2, 0, v2, v3, v4);
}

- (int64_t)localeType
{
  field = self->_field;
  uint64_t v3 = &field[-*(int *)field->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (uint64_t v4 = *(unsigned __int16 *)v3[10].var0) != 0) {
    return field[v4].var0[0];
  }
  else {
    return 0;
  }
}

- (id)value
{
  uint64_t v2 = &self->_field[-*(int *)self->_field];
  if (*(unsigned __int16 *)v2->var0 >= 7u && *(_WORD *)v2[6].var0)
  {
    id v4 = [NSString alloc];
    field = self->_field;
    uint64_t v7 = *(int *)field->var0;
    uint64_t v8 = *(unsigned __int16 *)field[-v7 + 6].var0;
    if (*(_WORD *)field[-v7 + 6].var0)
    {
      uint64_t v9 = *(unsigned int *)field[v8].var0;
      uint64_t v10 = &field[v8 + v9];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = *(unsigned int *)field->var0;
    }
    uint64_t v11 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)field[v8 + v9].var0, 4, 0);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)label
{
  uint64_t v2 = &self->_field[-*(int *)self->_field];
  if (*(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0)
  {
    id v4 = [NSString alloc];
    field = self->_field;
    uint64_t v7 = *(int *)field->var0;
    uint64_t v8 = *(unsigned __int16 *)field[-v7 + 8].var0;
    if (*(_WORD *)field[-v7 + 8].var0)
    {
      uint64_t v9 = *(unsigned int *)field[v8].var0;
      uint64_t v10 = &field[v8 + v9];
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v10 = 0;
      uint64_t v9 = *(unsigned int *)field->var0;
    }
    uint64_t v11 = objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v4, v5, (uint64_t)&v10[4], *(unsigned int *)field[v8 + v9].var0, 4, 0);
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (int64_t)fieldType
{
  field = self->_field;
  uint64_t v3 = &field[-*(int *)field->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (uint64_t v4 = *(unsigned __int16 *)v3[4].var0) != 0) {
    return *(unsigned __int16 *)field[v4].var0;
  }
  else {
    return 0;
  }
}

- (KVField)initWithBuffer:(id)a3 root:(const Field *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KVField;
  uint64_t v8 = [(KVField *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_buffer, a3);
    v9->_field = a4;
  }

  return v9;
}

- (KVField)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], a2, *MEMORY[0x1E4F1C3B8], @"init unsupported", MEMORY[0x1E4F1CC08], v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (id)fieldWithBuffer:(id)a3 root:(const void *)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v10 = objc_msgSend_initWithBuffer_root_(v6, v7, (uint64_t)v5, (uint64_t)a4, v8, v9);

  return v10;
}

@end