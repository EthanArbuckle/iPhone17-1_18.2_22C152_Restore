@interface KVItemBuilder
+ (id)buildFieldWithType:(int64_t)a3 label:(id)a4 value:(id)a5 error:(id *)a6;
+ (void)initialize;
- (KVItemBuilder)init;
- (id).cxx_construct;
- (id)_addFieldWithType:(int64_t)a3 localeType:(int64_t)a4 label:(id)a5 value:(id)a6 error:(id *)a7;
- (id)addFieldWithType:(int64_t)a3 label:(id)a4 value:(id)a5 error:(id *)a6;
- (id)addFieldWithType:(int64_t)a3 localeType:(int64_t)a4 label:(id)a5 value:(id)a6 error:(id *)a7;
- (id)addFieldWithType:(int64_t)a3 localeType:(int64_t)a4 value:(id)a5 error:(id *)a6;
- (id)addFieldWithType:(int64_t)a3 value:(id)a4 error:(id *)a5;
- (id)buildBufferWithError:(id *)a3;
- (id)buildItemWithError:(id *)a3;
- (id)setItemType:(int64_t)a3 itemId:(id)a4 error:(id *)a5;
- (void)_reset;
@end

@implementation KVItemBuilder

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((unsigned char *)self + 16) = 0;
  *(_OWORD *)((char *)self + 24) = xmmword_1BC3E47D0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 1;
  *((_WORD *)self + 44) = 256;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemId, 0);
  begin = self->_fields.__begin_;
  if (begin)
  {
    self->_fields.__end_ = begin;
    operator delete(begin);
  }
  sub_1BC3B9370(&self->_fbb.buf_.allocator_);
}

- (id)buildItemWithError:(id *)a3
{
  v7 = objc_msgSend_buildBufferWithError_(self, a2, (uint64_t)a3, v3, v4, v5);
  if (v7)
  {
    v8 = [KVItem alloc];
    v10 = objc_msgSend_initWithBuffer_verify_copy_error_(v8, v9, (uint64_t)v7, 0, 0, (uint64_t)a3);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)buildBufferWithError:(id *)a3
{
  v84[1] = *MEMORY[0x1E4F143B8];
  if (self->_itemType && (itemId = self->_itemId) != 0)
  {
    v9 = (const char *)objc_msgSend_UTF8String(itemId, a2, (uint64_t)a3, v3, v4, v5);
    size_t v10 = strlen(v9);
    unsigned int v11 = sub_1BC3B8D60((uint64_t)&self->_fbb, v9, v10);
    begin = self->_fields.__begin_;
    end = self->_fields.__end_;
    uint64_t v14 = end - begin;
    if (end == begin) {
      v15 = (char *)&unk_1BC3E4868;
    }
    else {
      v15 = (char *)self->_fields.__begin_;
    }
    uint64_t v16 = v14 >> 2;
    sub_1BC3BEAD0((uint64_t)&self->_fbb, v14 >> 2, 4uLL);
    if (begin == end)
    {
      LODWORD(v16) = 0;
    }
    else
    {
      v17 = v15 - 4;
      uint64_t v18 = v16;
      do
      {
        int v19 = sub_1BC3B9838(&self->_fbb, *(_DWORD *)&v17[4 * v18]);
        sub_1BC3B98A8((uint64_t)&self->_fbb, v19);
        --v18;
      }
      while (v18);
    }
    unsigned int v32 = sub_1BC3BEB3C((uint64_t)&self->_fbb, v16);
    sub_1BC3B8E08((uint64_t)&self->_fbb);
    self->_fbb.nested = 1;
    int reserved = self->_fbb.buf_.reserved_;
    int cur = (int)self->_fbb.buf_.cur_;
    int buf = (int)self->_fbb.buf_.buf_;
    sub_1BC3B8EBC((unint64_t)&self->_fbb, 6, LOWORD(self->_itemType));
    sub_1BC3B8E6C(&self->_fbb, 4, v11);
    if (v32)
    {
      int v36 = sub_1BC3B9838(&self->_fbb, v32);
      sub_1BC3B9980((unint64_t)&self->_fbb, 8, v36);
    }
    unsigned int v37 = sub_1BC3B8F6C((uint64_t)&self->_fbb, reserved - cur + buf);
    sub_1BC3B9208((uint64_t)&self->_fbb, v37, 0, 0);
    id v38 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v39 = sub_1BC3B930C((uint64_t)&self->_fbb);
    v43 = objc_msgSend_initWithBytes_length_(v38, v40, v39, (LODWORD(self->_fbb.buf_.reserved_)- LODWORD(self->_fbb.buf_.cur_)+ LODWORD(self->_fbb.buf_.buf_)), v41, v42);
    objc_msgSend__reset(self, v44, v45, v46, v47, v48);
    if ((unint64_t)objc_msgSend_length(v43, v49, v50, v51, v52, v53) < 0xC801)
    {
      id v31 = v43;
    }
    else
    {
      v59 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v81 = *MEMORY[0x1E4F28228];
      v60 = NSString;
      uint64_t v61 = objc_msgSend_length(v43, v54, v55, v56, v57, v58);
      v67 = KVItemTypeDescription(self->_itemType, v62, v63, v64, v65, v66);
      v72 = objc_msgSend_stringWithFormat_(v60, v68, @"Cannot build item with size: %lu exceeding the maximum allowed size: %lu. itemType: %@ itemId: %@", v69, v70, v71, v61, 51200, v67, self->_itemId);
      v82 = v72;
      v75 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v73, (uint64_t)&v82, (uint64_t)&v81, 1, v74);
      v78 = objc_msgSend_errorWithDomain_code_userInfo_(v59, v76, @"com.apple.koa.item.builder", 7, (uint64_t)v75, v77);
      v79 = v78;
      if (a3 && v78) {
        *a3 = v78;
      }

      id v31 = 0;
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v83 = *MEMORY[0x1E4F28228];
    v84[0] = @"required properties \"itemType\" and \"itemId\" are not set.";
    v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], a2, (uint64_t)v84, (uint64_t)&v83, 1, v5);
    v24 = objc_msgSend_errorWithDomain_code_userInfo_(v20, v22, @"com.apple.koa.item.builder", 8, (uint64_t)v21, v23);
    v25 = v24;
    if (a3 && v24) {
      *a3 = v24;
    }

    objc_msgSend__reset(self, v26, v27, v28, v29, v30);
    id v31 = 0;
  }
  return v31;
}

- (id)_addFieldWithType:(int64_t)a3 localeType:(int64_t)a4 label:(id)a5 value:(id)a6 error:(id *)a7
{
  v164[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v15 = a6;
  int64_t itemType = self->_itemType;
  if (!itemType || !self->_itemId)
  {
    uint64_t v47 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v163 = *MEMORY[0x1E4F28228];
    v164[0] = @"Cannot add field before setting required fields item type and itemId.";
    uint64_t v48 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v13, (uint64_t)v164, (uint64_t)&v163, 1, v14);
    uint64_t v51 = objc_msgSend_errorWithDomain_code_userInfo_(v47, v49, @"com.apple.koa.item.builder", 8, (uint64_t)v48, v50);
    id v52 = v51;
    if (a7 && v51)
    {
      id v52 = v51;
      *a7 = v52;
    }
    goto LABEL_27;
  }
  if (KVItemTypeFromFieldType(a3) != itemType)
  {
    uint64_t v53 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v161 = *MEMORY[0x1E4F28228];
    v54 = NSString;
    uint64_t v48 = KVFieldTypeDescription(a3);
    KVItemTypeDescription(self->_itemType, v55, v56, v57, v58, v59);
    id v52 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = objc_msgSend_stringWithFormat_(v54, v60, @"Cannot add field with invalid type: %@ to item of type: %@ itemId: %@", v61, v62, v63, v48, v52, self->_itemId);
    v162 = v64;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v65, (uint64_t)&v162, (uint64_t)&v161, 1, v66);
    id v67 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v53, v68, @"com.apple.koa.item.builder", 4, (uint64_t)v67, v69);
    id v70 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v71 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v159 = *MEMORY[0x1E4F28228];
      v72 = NSString;
      v73 = (objc_class *)objc_opt_class();
      uint64_t v48 = NSStringFromClass(v73);
      KVItemTypeDescription(self->_itemType, v74, v75, v76, v77, v78);
      id v52 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v64 = objc_msgSend_stringWithFormat_(v72, v79, @"Cannot add field label of unsupported class: %@ to item of type: %@ with itemId: %@", v80, v81, v82, v48, v52, self->_itemId);
      v160 = v64;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v83, (uint64_t)&v160, (uint64_t)&v159, 1, v84);
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v71, v85, @"com.apple.koa.item.builder", 3, (uint64_t)v67, v86);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v98 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v157 = *MEMORY[0x1E4F28228];
      v99 = NSString;
      v100 = (objc_class *)objc_opt_class();
      uint64_t v48 = NSStringFromClass(v100);
      KVItemTypeDescription(self->_itemType, v101, v102, v103, v104, v105);
      id v52 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v64 = objc_msgSend_stringWithFormat_(v99, v106, @"Cannot add field value of unsupported class: %@ to item of type: %@ with itemId: %@", v107, v108, v109, v48, v52, self->_itemId);
      v158 = v64;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v110, (uint64_t)&v158, (uint64_t)&v157, 1, v111);
      id v67 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v98, v112, @"com.apple.koa.item.builder", 3, (uint64_t)v67, v113);
      id v70 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:
      if (a7 && v70)
      {
        id v70 = v70;
        *a7 = v70;
      }

      goto LABEL_26;
    }
  }
  if ((unint64_t)a4 >= 0x2D)
  {
    v87 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v155 = *MEMORY[0x1E4F28228];
    v88 = NSString;
    uint64_t v48 = KVLocaleTypeDescription(a4, v17, v18, v19, v20, v21);
    objc_msgSend_stringWithFormat_(v88, v89, @"Cannot add field with invalid locale type: %@ itemId: %@", v90, v91, v92, v48, self->_itemId);
    id v52 = (id)objc_claimAutoreleasedReturnValue();
    id v156 = v52;
    uint64_t v64 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v93, (uint64_t)&v156, (uint64_t)&v155, 1, v94);
    v97 = objc_msgSend_errorWithDomain_code_userInfo_(v87, v95, @"com.apple.koa.item.builder", 9, (uint64_t)v64, v96);
    id v67 = v97;
    if (a7 && v97)
    {
      id v67 = v97;
      *a7 = v67;
    }
LABEL_26:

LABEL_27:
    objc_msgSend__reset(self, v114, v115, v116, v117, v118);
    v119 = 0;
    goto LABEL_28;
  }
  v22 = objc_msgSend_copy(v12, v17, v18, v19, v20, v21);
  uint64_t v28 = objc_msgSend_copy(v15, v23, v24, v25, v26, v27);
  if (objc_msgSend_length(v22, v29, v30, v31, v32, v33) || objc_msgSend_length(v28, v34, v35, v36, v37, v38))
  {
    v153 = v28;
    v154 = v22;
    if (objc_msgSend_length(v28, v34, v35, v36, v37, v38))
    {
      v44 = (const char *)objc_msgSend_UTF8String(v28, v39, v40, v41, v42, v43);
      size_t v45 = strlen(v44);
      unsigned int v46 = sub_1BC3B8D60((uint64_t)&self->_fbb, v44, v45);
    }
    else
    {
      unsigned int v46 = 0;
    }
    if (objc_msgSend_length(v22, v39, v40, v41, v42, v43))
    {
      v126 = (const char *)objc_msgSend_UTF8String(v22, v121, v122, v123, v124, v125);
      size_t v127 = strlen(v126);
      unsigned int v128 = sub_1BC3B8D60((uint64_t)&self->_fbb, v126, v127);
    }
    else
    {
      unsigned int v128 = 0;
    }
    sub_1BC3B8E08((uint64_t)&self->_fbb);
    self->_fbb.nested = 1;
    int reserved = self->_fbb.buf_.reserved_;
    int cur = (int)self->_fbb.buf_.cur_;
    int buf = (int)self->_fbb.buf_.buf_;
    sub_1BC3B8EBC((unint64_t)&self->_fbb, 4, (unsigned __int16)a3);
    sub_1BC3B8E6C(&self->_fbb, 6, v46);
    sub_1BC3B8E6C(&self->_fbb, 8, v128);
    if ((_BYTE)a4 || self->_fbb.force_defaults_)
    {
      sub_1BC3B98FC((uint64_t)&self->_fbb, 1uLL);
      sub_1BC3B9660((uint64_t *)&self->_fbb, 1uLL);
      v131 = self->_fbb.buf_.cur_;
      self->_fbb.buf_.cur_ = v131 - 1;
      *(v131 - 1) = a4;
      v132 = self->_fbb.buf_.buf_;
      v133 = self->_fbb.buf_.cur_;
      unint64_t v134 = self->_fbb.buf_.reserved_;
      sub_1BC3B9660((uint64_t *)&self->_fbb, 8uLL);
      *(void *)self->_fbb.buf_.scratch_ = (v134 - v133 + v132) | 0xA00000000;
      self->_fbb.buf_.scratch_ += 8;
      ++self->_fbb.num_field_loc;
      unsigned int max_voffset = self->_fbb.max_voffset_;
      if (max_voffset <= 0xA) {
        LOWORD(max_voffset) = 10;
      }
      self->_fbb.max_voffset_ = max_voffset;
    }
    int v136 = reserved - cur + buf;
    uint64_t v28 = v153;
    v22 = v154;
    int v137 = sub_1BC3B8F6C((uint64_t)&self->_fbb, v136);
    int v138 = v137;
    end = (char *)self->_fields.__end_;
    value = (char *)self->_fields.__end_cap_.__value_;
    if (end >= value)
    {
      begin = (char *)self->_fields.__begin_;
      uint64_t v143 = (end - begin) >> 2;
      unint64_t v144 = v143 + 1;
      if ((unint64_t)(v143 + 1) >> 62) {
        sub_1BC3BF378();
      }
      uint64_t v145 = value - begin;
      if (v145 >> 1 > v144) {
        unint64_t v144 = v145 >> 1;
      }
      BOOL v146 = (unint64_t)v145 >= 0x7FFFFFFFFFFFFFFCLL;
      unint64_t v147 = 0x3FFFFFFFFFFFFFFFLL;
      if (!v146) {
        unint64_t v147 = v144;
      }
      if (v147)
      {
        unint64_t v147 = (unint64_t)sub_1BC3BF390(v147);
        begin = (char *)self->_fields.__begin_;
        end = (char *)self->_fields.__end_;
      }
      else
      {
        uint64_t v148 = 0;
      }
      v149 = (_DWORD *)(v147 + 4 * v143);
      v150 = (void *)(v147 + 4 * v148);
      _DWORD *v149 = v138;
      v141 = v149 + 1;
      while (end != begin)
      {
        int v151 = *((_DWORD *)end - 1);
        end -= 4;
        *--v149 = v151;
      }
      self->_fields.__begin_ = v149;
      self->_fields.__end_ = v141;
      self->_fields.__end_cap_.__value_ = v150;
      if (begin) {
        operator delete(begin);
      }
    }
    else
    {
      *(_DWORD *)end = v137;
      v141 = end + 4;
    }
    self->_fields.__end_ = v141;
  }
  v119 = self;

LABEL_28:
  return v119;
}

- (id)addFieldWithType:(int64_t)a3 localeType:(int64_t)a4 label:(id)a5 value:(id)a6 error:(id *)a7
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v18 = a6;
  if (a4)
  {
    uint64_t v19 = objc_msgSend__addFieldWithType_localeType_label_value_error_(self, v13, a3, a4, (uint64_t)v12, (uint64_t)v18, a7);
  }
  else
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28228];
    uint64_t v21 = NSString;
    v22 = KVLocaleTypeDescription(0, v13, v14, v15, v16, v17);
    uint64_t v27 = objc_msgSend_stringWithFormat_(v21, v23, @"Cannot add field with invalid locale type: %@ itemId: %@", v24, v25, v26, v22, self->_itemId);
    v42[0] = v27;
    uint64_t v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v28, (uint64_t)v42, (uint64_t)&v41, 1, v29);
    uint64_t v33 = objc_msgSend_errorWithDomain_code_userInfo_(v20, v31, @"com.apple.koa.item.builder", 9, (uint64_t)v30, v32);
    v34 = v33;
    if (a7 && v33) {
      *a7 = v33;
    }

    objc_msgSend__reset(self, v35, v36, v37, v38, v39);
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)addFieldWithType:(int64_t)a3 label:(id)a4 value:(id)a5 error:(id *)a6
{
  v6 = objc_msgSend__addFieldWithType_localeType_label_value_error_(self, a2, a3, 0, (uint64_t)a4, (uint64_t)a5, a6);
  return v6;
}

- (id)addFieldWithType:(int64_t)a3 localeType:(int64_t)a4 value:(id)a5 error:(id *)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  if (a4)
  {
    uint64_t v16 = objc_msgSend__addFieldWithType_localeType_label_value_error_(self, v10, a3, a4, 0, (uint64_t)v15, a6);
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28228];
    id v18 = NSString;
    uint64_t v19 = KVLocaleTypeDescription(0, v10, v11, v12, v13, v14);
    uint64_t v24 = objc_msgSend_stringWithFormat_(v18, v20, @"Cannot add field with invalid locale type: %@ itemId: %@", v21, v22, v23, v19, self->_itemId);
    v39[0] = v24;
    uint64_t v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v25, (uint64_t)v39, (uint64_t)&v38, 1, v26);
    uint64_t v30 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v28, @"com.apple.koa.item.builder", 9, (uint64_t)v27, v29);
    uint64_t v31 = v30;
    if (a6 && v30) {
      *a6 = v30;
    }

    objc_msgSend__reset(self, v32, v33, v34, v35, v36);
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)addFieldWithType:(int64_t)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v5 = objc_msgSend__addFieldWithType_localeType_label_value_error_(self, a2, a3, 0, 0, (uint64_t)a4, a5);
  return v5;
}

- (id)setItemType:(int64_t)a3 itemId:(id)a4 error:(id *)a5
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v15 = v9;
  if ((unsigned __int16)a3 - 1 >= 0x1A)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v50 = *MEMORY[0x1E4F28228];
    uint64_t v22 = NSString;
    uint64_t v23 = KVItemTypeDescription(a3, v10, v11, v12, v13, v14);
    uint64_t v28 = objc_msgSend_stringWithFormat_(v22, v24, @"Cannot set invalid item type: %@", v25, v26, v27, v23);
    v51[0] = v28;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v29, (uint64_t)v51, (uint64_t)&v50, 1, v30);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = objc_msgSend_errorWithDomain_code_userInfo_(v21, v32, @"com.apple.koa.item.builder", 1, (uint64_t)v31, v33);
    uint64_t v35 = v34;
    if (a5 && v34) {
      *a5 = v34;
    }
  }
  else
  {
    if (objc_msgSend_length(v9, v10, v11, v12, v13, v14))
    {
      self->_int64_t itemType = a3;
      objc_storeStrong((id *)&self->_itemId, a4);
      uint64_t v20 = self;
      goto LABEL_9;
    }
    uint64_t v42 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = objc_msgSend_stringWithFormat_(NSString, v16, @"Cannot set invalid itemId: %@", v17, v18, v19, v15, *MEMORY[0x1E4F28228]);
    v49 = v23;
    uint64_t v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v43, (uint64_t)&v49, (uint64_t)&v48, 1, v44);
    uint64_t v47 = objc_msgSend_errorWithDomain_code_userInfo_(v42, v45, @"com.apple.koa.item.builder", 2, (uint64_t)v28, v46);
    id v31 = v47;
    if (a5 && v47)
    {
      id v31 = v47;
      *a5 = v31;
    }
  }

  objc_msgSend__reset(self, v36, v37, v38, v39, v40);
  uint64_t v20 = 0;
LABEL_9:

  return v20;
}

- (void)_reset
{
  self->_fbb.num_field_loc = 0;
  self->_fbb.max_voffset_ = 0;
  int buf = self->_fbb.buf_.buf_;
  if (buf)
  {
    uint64_t v4 = &buf[self->_fbb.buf_.reserved_];
  }
  else
  {
    uint64_t v4 = 0;
    self->_fbb.buf_.reserved_ = 0;
  }
  self->_fbb.buf_.cur_ = v4;
  self->_fbb.buf_.scratch_ = buf;
  *(_WORD *)&self->_fbb.nested = 0;
  self->_fbb.minalign_ = 1;
  string_pool = (char *)self->_fbb.string_pool;
  if (string_pool)
  {
    sub_1BC3B947C(*((void **)string_pool + 1));
    *(void *)string_pool = string_pool + 8;
    *((void *)string_pool + 2) = 0;
    *((void *)string_pool + 1) = 0;
  }
  self->_fields.__end_ = self->_fields.__begin_;
  itemId = self->_itemId;
  self->_int64_t itemType = 0;
  self->_itemId = 0;
}

- (KVItemBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)KVItemBuilder;
  result = [(KVItemBuilder *)&v3 init];
  if (result) {
    result->_int64_t itemType = 0;
  }
  return result;
}

+ (id)buildFieldWithType:(int64_t)a3 label:(id)a4 value:(id)a5 error:(id *)a6
{
  v121[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (KVItemTypeFromFieldType(a3))
  {
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      size_t v45 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v118 = *MEMORY[0x1E4F28228];
      uint64_t v46 = NSString;
      uint64_t v47 = (objc_class *)objc_opt_class();
      uint64_t v48 = NSStringFromClass(v47);
      uint64_t v53 = objc_msgSend_stringWithFormat_(v46, v49, @"Cannot build field with label of unsupported class: %@", v50, v51, v52, v48);
      v119 = v53;
      uint64_t v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v54, (uint64_t)&v119, (uint64_t)&v118, 1, v55);
      uint64_t v59 = objc_msgSend_errorWithDomain_code_userInfo_(v45, v57, @"com.apple.koa.item.builder", 3, (uint64_t)v56, v58);
      v60 = v59;
      if (a6 && v59) {
        *a6 = v59;
      }
    }
    else
    {
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v107 = 0;
        char v108 = 0;
        long long v109 = xmmword_1BC3E47D0;
        long long v110 = 0u;
        long long v111 = 0u;
        uint64_t v112 = 0;
        uint64_t v113 = 1;
        __int16 v114 = 256;
        uint64_t v115 = 0;
        if (objc_msgSend_length(v10, v11, v12, v13, v14, v15))
        {
          id v21 = v10;
          uint64_t v27 = (const char *)objc_msgSend_UTF8String(v21, v22, v23, v24, v25, v26);
          size_t v28 = strlen(v27);
          unsigned int v29 = sub_1BC3B8D60((uint64_t)&v107, v27, v28);
        }
        else
        {
          unsigned int v29 = 0;
        }
        if (objc_msgSend_length(v9, v16, v17, v18, v19, v20))
        {
          id v78 = v9;
          uint64_t v84 = (const char *)objc_msgSend_UTF8String(v78, v79, v80, v81, v82, v83);
          size_t v85 = strlen(v84);
          unsigned int v86 = sub_1BC3B8D60((uint64_t)&v107, v84, v85);
        }
        else
        {
          unsigned int v86 = 0;
        }
        sub_1BC3B8E08((uint64_t)&v107);
        BYTE6(v112) = 1;
        int v87 = v111;
        int v88 = v110;
        int v89 = DWORD2(v110);
        sub_1BC3B8EBC((unint64_t)&v107, 4, (unsigned __int16)a3);
        sub_1BC3B8E6C(&v107, 6, v29);
        sub_1BC3B8E6C(&v107, 8, v86);
        unsigned int v90 = sub_1BC3B8F6C((uint64_t)&v107, v88 - v87 + v89);
        sub_1BC3B9208((uint64_t)&v107, v90, 0, 0);
        id v91 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        uint64_t v92 = sub_1BC3B930C((uint64_t)&v107);
        id v96 = objc_msgSend_initWithBytes_length_(v91, v93, v92, (v110 - v111 + DWORD2(v110)), v94, v95);
        uint64_t v102 = (unsigned int *)objc_msgSend_bytes(v96, v97, v98, v99, v100, v101);
        uint64_t v77 = objc_msgSend_fieldWithBuffer_root_(KVField, v103, (uint64_t)v96, (uint64_t)v102 + *v102, v104, v105);

        sub_1BC3B9370(&v107);
        goto LABEL_26;
      }
      uint64_t v61 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v116 = *MEMORY[0x1E4F28228];
      uint64_t v62 = NSString;
      uint64_t v63 = (objc_class *)objc_opt_class();
      uint64_t v64 = NSStringFromClass(v63);
      uint64_t v69 = objc_msgSend_stringWithFormat_(v62, v65, @"Cannot build field with value of unsupported class: %@", v66, v67, v68, v64);
      uint64_t v117 = v69;
      v72 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v70, (uint64_t)&v117, (uint64_t)&v116, 1, v71);
      uint64_t v75 = objc_msgSend_errorWithDomain_code_userInfo_(v61, v73, @"com.apple.koa.item.builder", 3, (uint64_t)v72, v74);
      uint64_t v76 = v75;
      if (a6 && v75) {
        *a6 = v75;
      }
    }
  }
  else
  {
    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v120 = *MEMORY[0x1E4F28228];
    id v31 = NSString;
    uint64_t v32 = KVFieldTypeDescription(a3);
    uint64_t v37 = objc_msgSend_stringWithFormat_(v31, v33, @"Cannot build field with invalid type: %@", v34, v35, v36, v32);
    v121[0] = v37;
    uint64_t v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v38, (uint64_t)v121, (uint64_t)&v120, 1, v39);
    uint64_t v43 = objc_msgSend_errorWithDomain_code_userInfo_(v30, v41, @"com.apple.koa.item.builder", 4, (uint64_t)v40, v42);
    uint64_t v44 = v43;
    if (a6 && v43) {
      *a6 = v43;
    }
  }
  uint64_t v77 = 0;
LABEL_26:

  return v77;
}

+ (void)initialize
{
  if (qword_1EB5EE450 != -1) {
    dispatch_once(&qword_1EB5EE450, &unk_1F15F18C8);
  }
}

@end