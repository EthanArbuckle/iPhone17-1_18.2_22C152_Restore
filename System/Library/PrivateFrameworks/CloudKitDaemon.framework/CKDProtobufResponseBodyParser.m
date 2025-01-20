@interface CKDProtobufResponseBodyParser
- (BOOL)_parseObjectFromData:(id)a3 rawData:(id)a4 group:(id)a5;
- (BOOL)_parseObjects:(BOOL)a3 group:(id)a4;
- (BOOL)isParsing;
- (BOOL)parsingStandaloneMessage;
- (CKDProtobufResponseBodyParser)initWithQoS:(int64_t)a3 messageClass:(Class)a4 parsingStandaloneMessage:(BOOL)a5;
- (Class)messageClass;
- (NSMutableData)tailParserData;
- (unint64_t)curObjectLength;
- (void)finishWithCompletion:(id)a3;
- (void)processData:(id)a3 completionHandler:(id)a4;
- (void)setCurObjectLength:(unint64_t)a3;
- (void)setIsParsing:(BOOL)a3;
- (void)setMessageClass:(Class)a3;
- (void)setParsingStandaloneMessage:(BOOL)a3;
- (void)setTailParserData:(id)a3;
@end

@implementation CKDProtobufResponseBodyParser

- (CKDProtobufResponseBodyParser)initWithQoS:(int64_t)a3 messageClass:(Class)a4 parsingStandaloneMessage:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CKDProtobufResponseBodyParser;
  v7 = [(CKDResponseBodyParser *)&v10 initWithQoS:a3];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_messageClass, a4);
    v8->_parsingStandaloneMessage = a5;
  }
  return v8;
}

- (BOOL)_parseObjectFromData:(id)a3 rawData:(id)a4 group:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = a5;
  id v12 = objc_alloc(MEMORY[0x1E4F94090]);
  v14 = objc_msgSend_initWithData_(v12, v13, (uint64_t)v9);
  if (!objc_msgSend_messageClass(self, v15, v16))
  {
    v49 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v17, v18);
    v50 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v50);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v49, v52, (uint64_t)a2, self, @"CKDProtobufResponseBodyParser.m", 38, @"You can't use %@ without setting a message class", v51);
  }
  id v19 = objc_alloc_init((Class)objc_msgSend_messageClass(self, v17, v18));
  int v23 = objc_msgSend_readFrom_(v19, v20, (uint64_t)v14);
  if (v23)
  {
    v24 = objc_msgSend_objectParsedBlock(self, v21, v22);

    v25 = (void *)*MEMORY[0x1E4F1A548];
    if (v24)
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v25);
      }
      v26 = (void *)*MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
      {
        v44 = v26;
        *(_DWORD *)buf = 138412546;
        uint64_t v58 = objc_msgSend_messageClass(self, v45, v46);
        __int16 v59 = 2048;
        uint64_t v60 = objc_msgSend_length(v9, v47, v48);
        _os_log_debug_impl(&dword_1C4CFF000, v44, OS_LOG_TYPE_DEBUG, "Successfully parsed message %@ (%tu)", buf, 0x16u);
      }
      dispatch_group_enter(v11);
      objc_msgSend_objectParsedBlock(self, v27, v28);
      v29 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = sub_1C4E5FD04;
      v55[3] = &unk_1E64F05C8;
      v30 = v11;
      v56 = v30;
      ((void (**)(void, id, id, void *))v29)[2](v29, v19, v10, v55);

      if (*MEMORY[0x1E4F1A4E0] && objc_msgSend_testRepeatedParseResults(self, v31, v32))
      {
        dispatch_group_enter(v30);
        objc_msgSend_objectParsedBlock(self, v33, v34);
        v35 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = sub_1C4E5FD0C;
        v53[3] = &unk_1E64F05C8;
        v54 = v30;
        ((void (**)(void, id, id, void *))v35)[2](v35, v19, v10, v53);
      }
    }
    else
    {
      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v25);
      }
      v42 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C4CFF000, v42, OS_LOG_TYPE_ERROR, "If an object is parsed in the woods and no one is there to hear it, was it really parsed? You're leaking objects on the floor. Set up a parser callback block", buf, 2u);
      }
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v36 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
    {
      v37 = v36;
      v40 = (objc_class *)objc_msgSend_messageClass(self, v38, v39);
      v41 = NSStringFromClass(v40);
      *(_DWORD *)buf = 138543875;
      uint64_t v58 = (uint64_t)v41;
      __int16 v59 = 2112;
      uint64_t v60 = (uint64_t)v9;
      __int16 v61 = 2113;
      id v62 = v10;
      _os_log_error_impl(&dword_1C4CFF000, v37, OS_LOG_TYPE_ERROR, "Error parsing message of class %{public}@ from data %@. Raw data is %{private}@", buf, 0x20u);
    }
  }

  return v23;
}

- (BOOL)_parseObjects:(BOOL)a3 group:(id)a4
{
  BOOL v4 = a3;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v4)
  {
    unint64_t v9 = 1;
  }
  else if (objc_msgSend_parsingStandaloneMessage(self, v6, v7))
  {
    unint64_t v9 = 0x7FFFFFFFLL;
  }
  else
  {
    unint64_t v9 = 10;
  }
  id v10 = objc_msgSend_parserData(self, v6, v7);
  unint64_t v13 = objc_msgSend_length(v10, v11, v12);
  uint64_t v16 = objc_msgSend_bytes(v10, v14, v15);
  id v19 = (void *)MEMORY[0x1C8789E70]();
  if (v13 > 0x7FFFFFFE)
  {
    v20 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v17, *MEMORY[0x1E4F19DD8], 1005, @"_parserData has insane length %lu", v13);
    objc_msgSend_setParserError_(self, v21, (uint64_t)v20);
LABEL_8:

LABEL_38:
    if (!v13) {
      goto LABEL_35;
    }
LABEL_39:
    id v63 = objc_alloc(MEMORY[0x1E4F1CA58]);
    v65 = objc_msgSend_initWithBytes_length_(v63, v64, v16, v13);
    objc_msgSend_setTailParserData_(self, v66, (uint64_t)v65);

    objc_msgSend_setParserData_(self, v67, 0);
    if (v4)
    {
      v68 = objc_msgSend_parserError(self, v55, v56);

      if (!v68)
      {
        v69 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v55, *MEMORY[0x1E4F19DD8], 1005, @"Parser had %lu additional unparsed bytes remaining", v13);
        objc_msgSend_setParserError_(self, v70, (uint64_t)v69);
      }
    }
    goto LABEL_42;
  }
  BOOL v99 = v4;
  while (1)
  {
    if (v13 < v9 || objc_msgSend_curObjectLength(self, v17, v18)) {
      goto LABEL_14;
    }
    if (objc_msgSend_parsingStandaloneMessage(self, v17, v18))
    {
      objc_msgSend_setCurObjectLength_(self, v22, v13);
LABEL_14:
      v20 = 0;
      goto LABEL_15;
    }
    uint64_t v101 = 0;
    *(void *)buf = 0;
    if ((PBReaderReadVarIntBuf() & 1) == 0)
    {
      v89 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v49, *MEMORY[0x1E4F19DD8], 1005, @"Couldn't read the size of the next object from the server");
      objc_msgSend_setParserError_(self, v90, (uint64_t)v89);

      if (*MEMORY[0x1E4F1A550] != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
      }
      v91 = *MEMORY[0x1E4F1A500];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v100 = 0;
        _os_log_impl(&dword_1C4CFF000, v91, OS_LOG_TYPE_INFO, "Warn: Couldn't read length from input stream", v100, 2u);
      }
      goto LABEL_38;
    }
    objc_msgSend_setCurObjectLength_(self, v49, v101);
    if ((unint64_t)objc_msgSend_curObjectLength(self, v50, v51) >= 0x7FFFFFFF)
    {
      v92 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v93 = *MEMORY[0x1E4F19DD8];
      uint64_t v97 = objc_msgSend_curObjectLength(self, v52, v53);
      objc_msgSend_errorWithDomain_code_format_(v92, v94, v93, 1005, @"_curObjectLength has insane length %lu", v97);
      goto LABEL_62;
    }
    if (v13 < *(void *)buf)
    {
      objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v52, *MEMORY[0x1E4F19DD8], 1005, @"ParserData length %lu isn't greater than varIntLen of %lu (objectLength %llu)", v13, *(void *)buf, v101);
      v20 = LABEL_62:;
      objc_msgSend_setParserError_(self, v95, (uint64_t)v20);
LABEL_37:

      goto LABEL_38;
    }
    v20 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1CA58], v52, v16);
    v16 += *(void *)buf;
    v13 -= *(void *)buf;
LABEL_15:
    if ((unint64_t)objc_msgSend_curObjectLength(self, v17, v18) >= 0x7FFFFFFF)
    {
      v57 = (void *)MEMORY[0x1E4F1A280];
      uint64_t v58 = *MEMORY[0x1E4F19DD8];
      uint64_t v59 = objc_msgSend_curObjectLength(self, v23, v24);
      __int16 v61 = objc_msgSend_errorWithDomain_code_format_(v57, v60, v58, 1005, @"_curObjectLength has insane length %lu", v59);
      objc_msgSend_setParserError_(self, v62, (uint64_t)v61);

      goto LABEL_37;
    }
    if (objc_msgSend_curObjectLength(self, v23, v24) && v13 >= objc_msgSend_curObjectLength(self, v25, v26))
    {
      id v27 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      uint64_t v30 = objc_msgSend_curObjectLength(self, v28, v29);
      uint64_t v32 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v27, v31, v16, v30, 0);
      objc_msgSend_appendData_(v20, v33, (uint64_t)v32);
      if (objc_msgSend__parseObjectFromData_rawData_group_(self, v34, (uint64_t)v32, v20, v8))
      {
        if ((unint64_t)objc_msgSend_curObjectLength(self, v35, v36) >= 0x7FFFFFFF)
        {
          v81 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v82 = *MEMORY[0x1E4F19DD8];
          uint64_t v96 = objc_msgSend_curObjectLength(self, v37, v38);
          objc_msgSend_errorWithDomain_code_format_(v81, v83, v82, 1005, @"_curObjectLength has insane length %lu", v96);
        }
        else
        {
          if (v13 >= objc_msgSend_curObjectLength(self, v37, v38))
          {
            v16 += objc_msgSend_curObjectLength(self, v39, v40);
            unint64_t v43 = objc_msgSend_curObjectLength(self, v41, v42);
            if (v13 >= v43) {
              v13 -= v43;
            }
            else {
              unint64_t v13 = 0;
            }
            objc_msgSend_setCurObjectLength_(self, v44, 0);

            goto LABEL_25;
          }
          v84 = (void *)MEMORY[0x1E4F1A280];
          uint64_t v85 = *MEMORY[0x1E4F19DD8];
          uint64_t v98 = objc_msgSend_curObjectLength(self, v39, v40);
          objc_msgSend_errorWithDomain_code_format_(v84, v86, v85, 1005, @"ParserData length %lu isn't greater than self.curObjectLength of %lu", v13, v98);
        v87 = };
        objc_msgSend_setParserError_(self, v88, (uint64_t)v87);

        BOOL v4 = v99;
      }
      else
      {
        v78 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v35, *MEMORY[0x1E4F19DD8], 1005, @"Couldn't parse an object from the server");
        objc_msgSend_setParserError_(self, v79, (uint64_t)v78);

        if (*MEMORY[0x1E4F1A550] != -1) {
          dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
        }
        v80 = *MEMORY[0x1E4F1A500];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C4CFF000, v80, OS_LOG_TYPE_ERROR, "Failed to parse object from input stream", buf, 2u);
        }
      }

      goto LABEL_8;
    }
LABEL_25:

    if ((v13 < v9 || objc_msgSend_curObjectLength(self, v45, v46))
      && (!objc_msgSend_curObjectLength(self, v45, v46) || v13 < objc_msgSend_curObjectLength(self, v47, v48)))
    {
      break;
    }
    id v19 = (void *)MEMORY[0x1C8789E70]();
  }
  if (v13) {
    goto LABEL_39;
  }
LABEL_35:
  objc_msgSend_setTailParserData_(self, v47, 0);
  objc_msgSend_setParserData_(self, v54, 0);
LABEL_42:
  v71 = objc_msgSend_parserError(self, v55, v56);

  if (v71)
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v72 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v73 = v72;
      v76 = objc_msgSend_parserError(self, v74, v75);
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v76;
      _os_log_impl(&dword_1C4CFF000, v73, OS_LOG_TYPE_INFO, "Warn: Parser encountered an error: %@", buf, 0xCu);
    }
  }

  return v71 == 0;
}

- (void)processData:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11 = objc_msgSend_parseQueue(self, v9, v10);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1C4E60538;
  v14[3] = &unk_1E64F1A10;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  SEL v17 = a2;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v11, v14);
}

- (void)finishWithCompletion:(id)a3
{
  id v4 = a3;
  id v7 = objc_msgSend_parseQueue(self, v5, v6);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4E60850;
  v9[3] = &unk_1E64F0E18;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

- (Class)messageClass
{
  return self->_messageClass;
}

- (void)setMessageClass:(Class)a3
{
}

- (BOOL)parsingStandaloneMessage
{
  return self->_parsingStandaloneMessage;
}

- (void)setParsingStandaloneMessage:(BOOL)a3
{
  self->_parsingStandaloneMessage = a3;
}

- (NSMutableData)tailParserData
{
  return self->_tailParserData;
}

- (void)setTailParserData:(id)a3
{
}

- (unint64_t)curObjectLength
{
  return self->_curObjectLength;
}

- (void)setCurObjectLength:(unint64_t)a3
{
  self->_curObjectLength = a3;
}

- (BOOL)isParsing
{
  return self->_isParsing;
}

- (void)setIsParsing:(BOOL)a3
{
  self->_isParsing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailParserData, 0);
  objc_storeStrong((id *)&self->_messageClass, 0);
}

@end