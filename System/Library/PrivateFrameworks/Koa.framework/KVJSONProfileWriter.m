@interface KVJSONProfileWriter
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BOOL)finishDataset:(id *)a3;
- (BOOL)finishProfile:(id *)a3;
- (BOOL)startDataset:(id)a3 error:(id *)a4;
- (BOOL)startProfile:(id)a3 error:(id *)a4;
- (KVJSONProfileWriter)initWithOutputStream:(id)a3;
@end

@implementation KVJSONProfileWriter

- (void).cxx_destruct
{
}

- (BOOL)finishProfile:(id *)a3
{
  v8 = objc_msgSend_stringWithFormat_(NSString, a2, @"\n%@]\n}", v3, v4, v5, @"  ");
  v13 = objc_msgSend_dataUsingEncoding_(v8, v9, 4, v10, v11, v12);
  uint64_t v19 = objc_msgSend_length(v13, v14, v15, v16, v17, v18);
  stream = self->_stream;
  id v21 = v13;
  uint64_t v27 = objc_msgSend_bytes(v21, v22, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_length(v21, v28, v29, v30, v31, v32);
  uint64_t v41 = objc_msgSend_write_maxLength_(stream, v34, v27, v33, v35, v36);
  if (v19 != v41)
  {
    v42 = objc_msgSend_stringWithFormat_(NSString, v37, @"dataset footer: %@ data: %@", v38, v39, v40, v8, v21);
    sub_1BC3D855C(a3, v42, self->_stream, 3u);
  }
  return v19 == v41;
}

- (BOOL)finishDataset:(id *)a3
{
  v8 = objc_msgSend_stringWithFormat_(NSString, a2, @"\n%@]\n%@}", v3, v4, v5, @"      ", @"    ");
  v13 = objc_msgSend_dataUsingEncoding_(v8, v9, 4, v10, v11, v12);
  uint64_t v19 = objc_msgSend_length(v13, v14, v15, v16, v17, v18);
  stream = self->_stream;
  id v21 = v13;
  uint64_t v27 = objc_msgSend_bytes(v21, v22, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_length(v21, v28, v29, v30, v31, v32);
  uint64_t v41 = objc_msgSend_write_maxLength_(stream, v34, v27, v33, v35, v36);
  if (v19 == v41)
  {
    self->_itemIdx = 0;
  }
  else
  {
    v42 = objc_msgSend_stringWithFormat_(NSString, v37, @"dataset footer: %@ data: %@", v38, v39, v40, v8, v21);
    sub_1BC3D855C(a3, v42, self->_stream, 3u);
  }
  return v19 == v41;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unsigned int v11 = self->_itemIdx + 1;
  self->_itemIdx = v11;
  if (v11 < 2)
  {
LABEL_4:
    uint64_t v40 = sub_1BC3D4D78(5u);
    id v41 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    objc_msgSend_appendFormat_(v41, v42, @"%@{\n", v43, v44, v45, @"        ");
    v50 = objc_msgSend_JSONWithIndent_(v10, v46, 5, v47, v48, v49);
    objc_msgSend_appendFormat_(v41, v51, @"%@\"%@\":\n%@,\n", v52, v53, v54, v40, @"item", v50);

    objc_msgSend_appendFormat_(v41, v55, @"%@}", v56, v57, v58, @"        ");
    v63 = objc_msgSend_dataUsingEncoding_(v41, v59, 4, v60, v61, v62);
    if (objc_msgSend_length(v63, v64, v65, v66, v67, v68))
    {
      uint64_t v74 = objc_msgSend_length(v63, v69, v70, v71, v72, v73);
      stream = self->_stream;
      id v76 = v63;
      uint64_t v82 = objc_msgSend_bytes(v76, v77, v78, v79, v80, v81);
      uint64_t v88 = objc_msgSend_length(v76, v83, v84, v85, v86, v87);
      if (v74 == objc_msgSend_write_maxLength_(stream, v89, v82, v88, v90, v91))
      {
        BOOL v96 = 1;
LABEL_14:

        goto LABEL_15;
      }
      v107 = objc_msgSend_stringWithFormat_(NSString, v92, @"item: %@ data: %@", v93, v94, v95, v10, v76);
      sub_1BC3D855C(a4, v107, self->_stream, 3u);
    }
    else
    {
      v97 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v109 = *MEMORY[0x1E4F28568];
      v98 = objc_msgSend_stringWithFormat_(NSString, v69, @"Invalid item %@", v71, v72, v73, v10);
      v110[0] = v98;
      v101 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v99, (uint64_t)v110, (uint64_t)&v109, 1, v100);
      v104 = objc_msgSend_errorWithDomain_code_userInfo_(v97, v102, @"com.apple.koa.profile", 7, (uint64_t)v101, v103);
      v105 = v104;
      if (a4 && v104) {
        *a4 = v104;
      }
    }
    BOOL v96 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = objc_msgSend_dataUsingEncoding_(@",\n", v6, 4, v7, v8, v9);
  uint64_t v18 = objc_msgSend_length(v12, v13, v14, v15, v16, v17);
  uint64_t v19 = self->_stream;
  id v20 = v12;
  uint64_t v26 = objc_msgSend_bytes(v20, v21, v22, v23, v24, v25);
  uint64_t v32 = objc_msgSend_length(v20, v27, v28, v29, v30, v31);
  if (v18 == objc_msgSend_write_maxLength_(v19, v33, v26, v32, v34, v35))
  {

    goto LABEL_4;
  }
  v106 = objc_msgSend_stringWithFormat_(NSString, v36, @"item separator: %@", v37, v38, v39, v20);
  sub_1BC3D855C(a4, v106, self->_stream, 3u);

  BOOL v96 = 0;
LABEL_15:

  return v96;
}

- (BOOL)startDataset:(id)a3 error:(id *)a4
{
  id v10 = a3;
  unsigned int v11 = self->_datasetIdx + 1;
  self->_datasetIdx = v11;
  if (v11 >= 2)
  {
    uint64_t v12 = objc_msgSend_dataUsingEncoding_(@",\n", v6, 4, v7, v8, v9);
    uint64_t v18 = objc_msgSend_length(v12, v13, v14, v15, v16, v17);
    stream = self->_stream;
    id v20 = v12;
    uint64_t v26 = objc_msgSend_bytes(v20, v21, v22, v23, v24, v25);
    uint64_t v32 = objc_msgSend_length(v20, v27, v28, v29, v30, v31);
    if (v18 != objc_msgSend_write_maxLength_(stream, v33, v26, v32, v34, v35))
    {
      objc_msgSend_stringWithFormat_(NSString, v36, @"dataset separator: %@", v37, v38, v39, v20);
      v92 = (__CFString *)objc_claimAutoreleasedReturnValue();
      sub_1BC3D855C(a4, v92, self->_stream, 3u);
      BOOL v90 = 0;
      goto LABEL_8;
    }
  }
  id v40 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend_appendFormat_(v40, v41, @"%@{\n", v42, v43, v44, @"    ");
  uint64_t v49 = objc_msgSend_JSONWithIndent_(v10, v45, 4, v46, v47, v48);
  objc_msgSend_appendFormat_(v40, v50, @"%@\"%@\":\n%@,\n", v51, v52, v53, @"      ", @"datasetInfo", v49);

  objc_msgSend_appendFormat_(v40, v54, @"%@\"%@\": [\n", v55, v56, v57, @"      ", @"items");
  uint64_t v62 = objc_msgSend_dataUsingEncoding_(v40, v58, 4, v59, v60, v61);
  uint64_t v68 = objc_msgSend_length(v62, v63, v64, v65, v66, v67);
  v69 = self->_stream;
  id v70 = v62;
  uint64_t v76 = objc_msgSend_bytes(v70, v71, v72, v73, v74, v75);
  uint64_t v82 = objc_msgSend_length(v70, v77, v78, v79, v80, v81);
  BOOL v90 = v68 == objc_msgSend_write_maxLength_(v69, v83, v76, v82, v84, v85);
  if (!v90)
  {
    uint64_t v91 = objc_msgSend_stringWithFormat_(NSString, v86, @"dataset header: %@ data: %@", v87, v88, v89, v40, v70);
    sub_1BC3D855C(a4, v91, self->_stream, 3u);
  }
  id v20 = @"    ";
  v92 = @"      ";
LABEL_8:

  return v90;
}

- (BOOL)startProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v12 = objc_msgSend_initWithString_(v7, v8, @"{\n", v9, v10, v11);
  uint64_t v17 = objc_msgSend_JSONWithIndent_(v6, v13, 1, v14, v15, v16);
  objc_msgSend_appendFormat_(v12, v18, @"%@\"%@\":\n%@,\n", v19, v20, v21, @"  ", @"profileInfo", v17);

  objc_msgSend_appendFormat_(v12, v22, @"%@\"%@\": [\n", v23, v24, v25, @"  ", @"datasets");
  uint64_t v30 = objc_msgSend_dataUsingEncoding_(v12, v26, 4, v27, v28, v29);
  uint64_t v36 = objc_msgSend_length(v30, v31, v32, v33, v34, v35);
  stream = self->_stream;
  id v38 = v30;
  uint64_t v44 = objc_msgSend_bytes(v38, v39, v40, v41, v42, v43);
  uint64_t v50 = objc_msgSend_length(v38, v45, v46, v47, v48, v49);
  uint64_t v58 = objc_msgSend_write_maxLength_(stream, v51, v44, v50, v52, v53);
  if (v36 != v58)
  {
    uint64_t v59 = objc_msgSend_stringWithFormat_(NSString, v54, @"profile header: %@ data: %@", v55, v56, v57, v12, v38);
    sub_1BC3D855C(a4, v59, self->_stream, 3u);
  }
  return v36 == v58;
}

- (KVJSONProfileWriter)initWithOutputStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVJSONProfileWriter;
  id v6 = [(KVJSONProfileWriter *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stream, a3);
    *(void *)&v7->_datasetIdx = 0;
  }

  return v7;
}

@end