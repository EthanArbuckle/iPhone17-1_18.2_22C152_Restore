@interface BLM3U8Parser
- (BLM3U8Parser)initWithData:(id)a3;
- (BLM3U8Parser)initWithURL:(id)a3;
- (BLM3U8ParserDelegate)delegate;
- (BOOL)collectForRewrite;
- (BOOL)parseWithError:(id *)a3;
- (BOOL)rewriteWithURL:(id)a3;
- (NSData)data;
- (NSError)error;
- (NSMutableData)bytes;
- (NSMutableData)collectedData;
- (id)parseAttributeList:(id)a3;
- (unint64_t)consumeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)processLine;
- (void)saveLine:(id)a3;
- (void)setBytes:(id)a3;
- (void)setCollectForRewrite:(BOOL)a3;
- (void)setCollectedData:(id)a3;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
@end

@implementation BLM3U8Parser

- (BLM3U8Parser)initWithURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v17 = 0;
  v4 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x263EFF8F8], a2, (uint64_t)a3, 8, &v17);
  id v7 = v17;
  if (!v4)
  {
    v8 = BLDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_ERROR, "Error reading playlist:  %@", buf, 0xCu);
    }

    id v9 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v18 = *MEMORY[0x263F08608];
    id v19 = v7;
    v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)&v19, (uint64_t)&v18, 1);
    v13 = (NSError *)objc_msgSend_initWithDomain_code_userInfo_(v9, v12, @"BLErrorDomain", 26, v11);
    error = self->_error;
    self->_error = v13;
  }
  v15 = (BLM3U8Parser *)objc_msgSend_initWithData_(self, v5, (uint64_t)v4, v6);

  return v15;
}

- (BLM3U8Parser)initWithData:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLM3U8Parser;
  uint64_t v6 = [(BLM3U8Parser *)&v14 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    uint64_t v11 = objc_msgSend_data(MEMORY[0x263EFF990], v8, v9, v10);
    bytes = v7->_bytes;
    v7->_bytes = (NSMutableData *)v11;
  }
  return v7;
}

- (BOOL)parseWithError:(id *)a3
{
  uint64_t v6 = objc_msgSend_error(self, a2, (uint64_t)a3, v3);

  if (v6)
  {
    objc_msgSend_error(self, v7, v8, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v11 = v10 != 0;
    if (a3 && v10)
    {
      id v10 = v10;
      *a3 = v10;
      BOOL v11 = 1;
    }
  }
  else
  {
    v12 = objc_msgSend_data(self, v7, v8, v9);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_21E032E68;
    v28[3] = &unk_26448CCC8;
    v28[4] = self;
    objc_msgSend_enumerateByteRangesUsingBlock_(v12, v13, (uint64_t)v28, v14);

    uint64_t v18 = objc_msgSend_bytes(self, v15, v16, v17);
    uint64_t v22 = objc_msgSend_length(v18, v19, v20, v21);

    if (v22) {
      objc_msgSend_processLine(self, v23, v24, v25);
    }
    BOOL v11 = 0;
    id v10 = 0;
  }
  BOOL v26 = !v11;

  return v26;
}

- (unint64_t)consumeBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v7 = 0;
    while (1)
    {
      int v8 = *((unsigned __int8 *)a3 + v7);
      if (v8 == 10)
      {
        uint64_t v11 = 1;
LABEL_11:
        v12 = objc_msgSend_bytes(self, a2, (uint64_t)a3, a4);
        objc_msgSend_appendBytes_length_(v12, v13, (uint64_t)a3, v7);

        objc_msgSend_processLine(self, v14, v15, v16);
        v7 += v11;
        return v7;
      }
      if (v8 == 13) {
        break;
      }
      if (a4 == ++v7) {
        goto LABEL_6;
      }
    }
    if (v7 + 1 < a4 && *((unsigned char *)a3 + v7 + 1) == 10)
    {
      uint64_t v11 = 2;
      goto LABEL_11;
    }
    uint64_t v17 = objc_msgSend_bytes(self, a2, (uint64_t)a3, a4);
    objc_msgSend_appendBytes_length_(v17, v18, (uint64_t)a3, v7 - 1);
  }
  else
  {
LABEL_6:
    uint64_t v9 = objc_msgSend_bytes(self, a2, (uint64_t)a3, a4);
    objc_msgSend_appendBytes_length_(v9, v10, (uint64_t)a3, a4);

    return a4;
  }
  return v7;
}

- (id)parseAttributeList:(id)a3
{
  id v3 = a3;
  unint64_t v7 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v4, v5, v6);
  if (objc_msgSend_length(v3, v8, v9, v10))
  {
    unint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = objc_msgSend_length(v3, v11, v12, v13);
      uint64_t v17 = objc_msgSend_rangeOfString_options_range_(v3, v16, @"=", 0, v14, v15 - v14);
      if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_20;
      }
      uint64_t v18 = v17;
      id v19 = objc_msgSend_substringWithRange_(v3, v11, v14, v17 - v14);
      uint64_t v20 = v18 + 1;
      uint64_t v24 = ~v18;
      uint64_t v25 = objc_msgSend_length(v3, v21, v22, v23) + ~v18;
      unint64_t v27 = objc_msgSend_rangeOfString_options_range_(v3, v26, @"\"", 0, v18 + 1, v25);
      unint64_t v29 = objc_msgSend_rangeOfString_options_range_(v3, v28, @",", 0, v20, v25);
      uint64_t v33 = v29;
      if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v29 != 0x7FFFFFFFFFFFFFFFLL && v29 <= v27) {
        goto LABEL_9;
      }
      uint64_t v41 = objc_msgSend_length(v3, v30, v31, v32);
      uint64_t v43 = objc_msgSend_rangeOfString_options_range_(v3, v42, @"\"", 0, v27 + 1, v41 - (v27 + 1));
      if (v43 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v37 = objc_msgSend_substringFromIndex_(v3, v44, v27 + 1, v45);
      }
      else
      {
        uint64_t v46 = v43;
        v37 = objc_msgSend_substringWithRange_(v3, v44, v27 + 1, v43 + ~v27);
        uint64_t v50 = objc_msgSend_length(v3, v47, v48, v49);
        uint64_t v33 = objc_msgSend_rangeOfString_options_range_(v3, v51, @",", 0, v46 + 1, v50 - (v46 + 1));
      }
      if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_18;
      }
LABEL_10:
      unint64_t v14 = v33 + 1;
      if (v19) {
        goto LABEL_11;
      }
LABEL_12:

      if (v14 >= objc_msgSend_length(v3, v38, v39, v40)) {
        goto LABEL_20;
      }
    }
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v37 = objc_msgSend_substringFromIndex_(v3, v30, v20, v32);
LABEL_18:
      unint64_t v14 = objc_msgSend_length(v3, v34, v35, v36);
      if (!v19) {
        goto LABEL_12;
      }
LABEL_11:
      objc_msgSend_setObject_forKeyedSubscript_(v7, v34, (uint64_t)v37, (uint64_t)v19);
      goto LABEL_12;
    }
LABEL_9:
    v37 = objc_msgSend_substringWithRange_(v3, v30, v20, v29 + v24);
    goto LABEL_10;
  }
LABEL_20:
  v52 = objc_msgSend_copy(v7, v11, v12, v13);

  return v52;
}

- (void)processLine
{
  objc_msgSend_delegate(self, a2, v2, v3);
  id v78 = (id)objc_claimAutoreleasedReturnValue();
  int v8 = objc_msgSend_bytes(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_length(v8, v9, v10, v11);

  if (v12)
  {
    id v16 = [NSString alloc];
    uint64_t v20 = objc_msgSend_bytes(self, v17, v18, v19);
    uint64_t v22 = objc_msgSend_initWithData_encoding_(v16, v21, (uint64_t)v20, 4);

    if (objc_msgSend_length(v22, v23, v24, v25))
    {
      if (objc_msgSend_hasPrefix_(v22, v26, @"#EXT", v28))
      {
        id v31 = v22;
        uint64_t v34 = objc_msgSend_rangeOfString_(v31, v32, @":", v33);
        if (v34 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v37 = 0;
          v38 = &stru_26CED4330;
          uint64_t v39 = v31;
          objc_msgSend_parser_lineIsTag_value_attributeList_(v78, v35, (uint64_t)self, (uint64_t)v31, &stru_26CED4330, 0);
        }
        else
        {
          uint64_t v51 = v34;
          uint64_t v39 = objc_msgSend_substringToIndex_(v31, v35, v34, v36);

          objc_msgSend_substringFromIndex_(v31, v52, v51 + 1, v53);
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_length(v38, v54, v55, v56))
          {
            v37 = objc_msgSend_parseAttributeList_(self, v57, (uint64_t)v38, v58);
            objc_msgSend_parser_lineIsTag_value_attributeList_(v78, v59, (uint64_t)self, (uint64_t)v39, v38, v37);
          }
          else
          {
            v37 = 0;
            objc_msgSend_parser_lineIsTag_value_attributeList_(v78, v57, (uint64_t)self, (uint64_t)v39, v38, 0);
          }
        }
        if (objc_msgSend_collectForRewrite(self, v40, v41, v42)
          && objc_msgSend_parserShouldCollectLine_(v78, v64, (uint64_t)self, v65))
        {
          objc_msgSend_saveLine_(self, v66, (uint64_t)v31, v67);
        }
      }
      else if (objc_msgSend_hasPrefix_(v22, v29, @"#", v30))
      {
        objc_msgSend_parser_lineIsComment_(v78, v45, (uint64_t)self, (uint64_t)v22);
        if (objc_msgSend_collectForRewrite(self, v48, v49, v50)
          && objc_msgSend_parserShouldCollectLine_(v78, v26, (uint64_t)self, v28))
        {
          objc_msgSend_saveLine_(self, v26, (uint64_t)v22, v28);
        }
      }
      else
      {
        if (objc_msgSend_collectForRewrite(self, v45, v46, v47)
          && objc_msgSend_parserShouldCollectLine_(v78, v60, (uint64_t)self, v61))
        {
          objc_msgSend_saveLine_(self, v60, (uint64_t)v22, v61);
        }
        v62 = objc_msgSend_URLWithString_(NSURL, v60, (uint64_t)v22, v61);
        objc_msgSend_parser_lineIsURL_(v78, v63, (uint64_t)self, (uint64_t)v62);
      }
    }
    v68 = objc_msgSend_bytes(self, v26, v27, v28);
    v72 = objc_msgSend_bytes(self, v69, v70, v71);
    uint64_t v76 = objc_msgSend_length(v72, v73, v74, v75);
    objc_msgSend_replaceBytesInRange_withBytes_length_(v68, v77, 0, v76, 0, 0);
  }
  else if (objc_msgSend_collectForRewrite(self, v13, v14, v15))
  {
    objc_msgSend_saveLine_(self, v43, (uint64_t)&stru_26CED4330, v44);
  }
}

- (void)saveLine:(id)a3
{
  id v4 = a3;
  int v8 = objc_msgSend_collectedData(self, v5, v6, v7);

  if (!v8)
  {
    uint64_t v12 = objc_msgSend_data(MEMORY[0x263EFF990], v9, v10, v11);
    objc_msgSend_setCollectedData_(self, v13, (uint64_t)v12, v14);
  }
  uint64_t v15 = objc_msgSend_collectedData(self, v9, v10, v11);
  id v16 = v4;
  uint64_t v20 = objc_msgSend_UTF8String(v16, v17, v18, v19);
  id v21 = v16;
  uint64_t v25 = (const char *)objc_msgSend_UTF8String(v21, v22, v23, v24);

  size_t v26 = strlen(v25);
  objc_msgSend_appendBytes_length_(v15, v27, v20, v26);

  objc_msgSend_collectedData(self, v28, v29, v30);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendBytes_length_(v32, v31, (uint64_t)"\n", 1);
}

- (BOOL)rewriteWithURL:(id)a3
{
  id v4 = a3;
  int v8 = objc_msgSend_collectedData(self, v5, v6, v7);
  char v10 = objc_msgSend_writeToURL_atomically_(v8, v9, (uint64_t)v4, 1);

  return v10;
}

- (BLM3U8ParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BLM3U8ParserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)collectForRewrite
{
  return self->_collectForRewrite;
}

- (void)setCollectForRewrite:(BOOL)a3
{
  self->_collectForRewrite = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSMutableData)bytes
{
  return self->_bytes;
}

- (void)setBytes:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSMutableData)collectedData
{
  return self->_collectedData;
}

- (void)setCollectedData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectedData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bytes, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end