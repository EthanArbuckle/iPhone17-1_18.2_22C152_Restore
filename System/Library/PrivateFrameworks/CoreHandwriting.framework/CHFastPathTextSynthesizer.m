@interface CHFastPathTextSynthesizer
- (BOOL)shouldUsePersonalization;
- (CHFastPathTextSynthesizer)initWithStyleInventory:(id)a3;
- (id).cxx_construct;
- (id)generateDrawingForText:(id)a3 options:(id)a4;
- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7;
- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8;
- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4;
- (id)supportedCharacters;
- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6;
@end

@implementation CHFastPathTextSynthesizer

- (CHFastPathTextSynthesizer)initWithStyleInventory:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_init(self, v5, v6, v7, v8, v9)) {
    operator new();
  }

  return 0;
}

- (BOOL)shouldUsePersonalization
{
  uint64_t v6 = objc_msgSend_standardUserDefaults(MEMORY[0x1E4F1CB18], a2, v2, v3, v4, v5);
  v11 = objc_msgSend_dictionaryForKey_(v6, v7, @"com.apple.corehandwriting", v8, v9, v10);

  v16 = objc_msgSend_objectForKey_(v11, v12, @"CHDisablePersonalizedUseFastPathSynthesis", v13, v14, v15);
  char v22 = objc_msgSend_BOOLValue(v16, v17, v18, v19, v20, v21);

  return v22 ^ 1;
}

- (id)generateDrawingForText:(id)a3 options:(id)a4
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v55 = v7;
  if (objc_msgSend_shouldUsePersonalization(self, v8, v9, v10, v11, v12)) {
    int v18 = objc_msgSend_fastPathUseDefaultStyle(v7, v13, v14, v15, v16, v17) ^ 1;
  }
  else {
    int v18 = 0;
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v19 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = @"false";
    if (v18) {
      uint64_t v20 = @"true";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v20;
    _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_DEFAULT, "CHFastPathTextSynthesizer: usePersonalization is %@", buf, 0xCu);
  }

  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x4812000000;
  v74 = sub_1C4B1DCF0;
  v75 = sub_1C4B1DD2C;
  v76 = &unk_1C4CB5C62;
  v78[0] = 0;
  v78[1] = 0;
  v77 = v78;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  uint64_t v66 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  uint64_t v26 = objc_msgSend_length(v6, v21, v22, v23, v24, v25);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = sub_1C4B1DD3C;
  v57[3] = &unk_1E64E3CA8;
  char v58 = v18;
  v57[4] = self;
  v57[5] = &v71;
  v57[6] = &v63;
  v57[7] = &v59;
  v57[8] = &v67;
  objc_msgSend_enumerateCodepointsInRange_usingBlock_(v6, v27, 0, v26, (uint64_t)v57, v28);
  if (!v60[3])
  {
    v35 = @"NO";
    goto LABEL_34;
  }
  CoreHandwriting::synthesis::fast_path::CHFastPathCharacterInventory::collectFastPathCharactersFromHolders((uint64_t)&self->_inventory, 9633, 1, (char **)buf);
  uint64_t v29 = *(void *)buf;
  if (*(void *)&buf[8] == *(void *)buf)
  {
    v35 = @"NO";
    uint64_t v29 = *(void *)&buf[8];
    if (!*(void *)&buf[8]) {
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  v30 = v72;
  v32 = (uint64_t **)(v72 + 7);
  v31 = (uint64_t *)v72[7];
  if (!v31)
  {
    v33 = v72 + 7;
LABEL_23:
    v36 = (char *)operator new(0x40uLL);
    *((_DWORD *)v36 + 8) = 9633;
    *((void *)v36 + 6) = 0;
    *((void *)v36 + 7) = 0;
    *((void *)v36 + 5) = 0;
    *(void *)v36 = 0;
    *((void *)v36 + 1) = 0;
    *((void *)v36 + 2) = v33;
    *v32 = (uint64_t *)v36;
    uint64_t v37 = *(void *)v30[6];
    v38 = (uint64_t *)v36;
    if (v37)
    {
      v30[6] = v37;
      v38 = *v32;
    }
    sub_1C4949FD4((uint64_t *)v30[7], v38);
    ++v30[8];
    uint64_t v29 = *(void *)buf;
    v39 = (void **)(v36 + 40);
    if (v36 + 40 == buf) {
      goto LABEL_29;
    }
LABEL_26:
    sub_1C4B1ED78(v39, v29, *(uint64_t *)&buf[8], 0xAAAAAAAAAAAAAAABLL * ((*(void *)&buf[8] - v29) >> 3));
    v35 = @"YES";
    uint64_t v29 = *(void *)buf;
    if (!*(void *)buf) {
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  while (1)
  {
    while (1)
    {
      v33 = v31;
      unsigned int v34 = *((_DWORD *)v31 + 8);
      if (v34 < 0x25A2) {
        break;
      }
      v31 = (uint64_t *)*v33;
      v32 = (uint64_t **)v33;
      if (!*v33) {
        goto LABEL_23;
      }
    }
    if (v34 == 9633) {
      break;
    }
    v31 = (uint64_t *)v33[1];
    if (!v31)
    {
      v32 = (uint64_t **)(v33 + 1);
      goto LABEL_23;
    }
  }
  v39 = (void **)(v33 + 5);
  if (v33 + 5 != (uint64_t *)buf) {
    goto LABEL_26;
  }
LABEL_29:
  v35 = @"YES";
  if (!v29) {
    goto LABEL_34;
  }
LABEL_30:
  uint64_t v40 = *(void *)&buf[8];
  v41 = (void *)v29;
  if (*(void *)&buf[8] != v29)
  {
    do
    {
      v42 = *(void **)(v40 - 24);
      v40 -= 24;
    }
    while (v40 != v29);
    v41 = *(void **)buf;
  }
  *(void *)&buf[8] = v29;
  operator delete(v41);
LABEL_34:
  if (qword_1EA3CA000 == -1)
  {
    v43 = (id)qword_1EA3C9FD8;
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  v43 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
LABEL_36:
    uint64_t v44 = v68[3];
    uint64_t v45 = v64[3];
    uint64_t v46 = v60[3];
    *(_DWORD *)buf = 134218754;
    *(void *)&buf[4] = v44;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v45;
    *(_WORD *)&buf[22] = 2048;
    *(void *)v80 = v46;
    *(_WORD *)&v80[8] = 2112;
    *(void *)&v80[10] = v35;
    _os_log_impl(&dword_1C492D000, v43, OS_LOG_TYPE_DEFAULT, "CHFastPathTextSynthesizer: statistics of collected codepoints. USER_STYLE %ld, DEFAULT_STYLE %ld, MISSED %ld, NOTDEF_LOADED %@", buf, 0x2Au);
  }
LABEL_37:

  (**(void (***)(unsigned char *__return_ptr))self->_stitchingStrategy.__ptr_.__value_)(buf);
  v47 = [CHSynthesisResult alloc];
  v49 = objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(v47, v48, (uint64_t)v6, *(uint64_t *)buf, (uint64_t)v86, (uint64_t)v87, v89 + v88);
  v56[4] = v82;
  v56[5] = v83;
  v56[6] = v84;
  v56[7] = v85;
  v56[0] = *(_OWORD *)&buf[8];
  v56[1] = *(_OWORD *)v80;
  v56[2] = *(_OWORD *)&v80[16];
  v56[3] = v81;
  objc_msgSend_setPrincipalLines_(v49, v50, (uint64_t)v56, v51, v52, v53);
  if (__p)
  {
    v91 = __p;
    operator delete(__p);
  }

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  sub_1C4A23B3C((uint64_t)&v77, v78[0]);

  return v49;
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v10 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v10, OS_LOG_TYPE_DEFAULT, "CHFastPathTextSynthesizer: start synthesizeDrawingForString", buf, 2u);
  }

  if (!objc_msgSend_length(v8, v11, v12, v13, v14, v15))
  {
    id v56 = 0;
    goto LABEL_19;
  }
  uint64_t v19 = objc_msgSend_supportedCharacterIndexesForString_options_(self, v16, (uint64_t)v8, (uint64_t)v9, v17, v18);
  uint64_t v25 = objc_msgSend_count(v19, v20, v21, v22, v23, v24);
  if (v25 != objc_msgSend_length(v8, v26, v27, v28, v29, v30))
  {
    if (qword_1EA3CA000 == -1)
    {
      v35 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        *(void *)buf = 0;
        uint64_t v66 = buf;
        uint64_t v67 = 0x3032000000;
        v68 = sub_1C4B1E59C;
        uint64_t v69 = sub_1C4B1E5AC;
        id v70 = objc_alloc_init(NSString);
        uint64_t v41 = objc_msgSend_length(v8, v36, v37, v38, v39, v40);
        uint64_t v59 = MEMORY[0x1E4F143A8];
        uint64_t v60 = 3221225472;
        uint64_t v61 = sub_1C4B1E5B4;
        uint64_t v62 = &unk_1E64E2AB0;
        id v63 = v19;
        v64 = buf;
        objc_msgSend_enumerateCodepointsInRange_usingBlock_(v8, v42, 0, v41, (uint64_t)&v59, v43);
        id v44 = *((id *)v66 + 5);

        _Block_object_dispose(buf, 8);
        id v8 = v44;
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v35 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v35, OS_LOG_TYPE_DEFAULT, "CHFastPathTextSynthesizer: not all characters in the string have native support. Decompose unsupported unicode characters.", buf, 2u);
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v45 = objc_msgSend_synthesisOptionsWithDictionary_(CHSynthesisRequestOptions, v31, (uint64_t)v9, v32, v33, v34, v59, v60, v61, v62);
  v49 = objc_msgSend_generateDrawingForText_options_(self, v46, (uint64_t)v8, (uint64_t)v45, v47, v48);
  v55 = objc_msgSend_drawing(v49, v50, v51, v52, v53, v54);

  if (!v55)
  {
    if (qword_1EA3CA000 == -1)
    {
      v57 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
LABEL_17:

        id v56 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      v57 = (id)qword_1EA3C9FD8;
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v57, OS_LOG_TYPE_ERROR, "CHFastPathTextSynthesizer: result drawing is nil", buf, 2u);
    goto LABEL_17;
  }
  id v56 = v49;
LABEL_18:

LABEL_19:
  return v56;
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v7 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_FAULT, "CHFastPathTextSynthesizer doesn't support refineDrawing!", v9, 2u);
  }

  return 0;
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v8 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_1C492D000, v8, OS_LOG_TYPE_FAULT, "CHFastPathTextSynthesizer doesn't support replacementDrawing!", v10, 2u);
  }

  return 0;
}

- (id)supportedCharacters
{
  id v7 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, v2, v3, v4, v5);
  CoreHandwriting::synthesis::fast_path::CHFastPathCharacterInventory::getSupportedCharacters((CoreHandwriting::synthesis::fast_path::CHAbstractFastPathCharacterHolder ****)&self->_inventory, (uint64_t)&__p);
  uint64_t v13 = v26;
  if (v26)
  {
    do
    {
      uint64_t v14 = unicodeToNSString(*((_DWORD *)v13 + 4), v8, v9, v10, v11, v12);
      objc_msgSend_addObject_(v7, v15, (uint64_t)v14, v16, v17, v18);

      uint64_t v13 = (void *)*v13;
    }
    while (v13);
    uint64_t v19 = v26;
    id v20 = v7;
    if (v19)
    {
      do
      {
        uint64_t v21 = (void *)*v19;
        operator delete(v19);
        uint64_t v19 = v21;
      }
      while (v21);
    }
    uint64_t v22 = __p;
    __p = 0;
    if (v22) {
      goto LABEL_6;
    }
  }
  else
  {
    id v24 = v7;
    uint64_t v22 = __p;
    __p = 0;
    if (v22) {
LABEL_6:
    }
      operator delete(v22);
  }

  return v7;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  id v5 = a3;
  uint64_t v11 = objc_msgSend_supportedCharacters(self, v6, v7, v8, v9, v10);
  uint64_t v17 = objc_msgSend_allObjects(v11, v12, v13, v14, v15, v16);
  uint64_t v22 = objc_msgSend_componentsJoinedByString_(v17, v18, (uint64_t)&stru_1F20141C8, v19, v20, v21);

  uint64_t v27 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x1E4F28B88], v23, (uint64_t)v22, v24, v25, v26);
  uint64_t v32 = objc_msgSend_indexesOfCharacters_(v5, v28, (uint64_t)v27, v29, v30, v31);

  return v32;
}

- (void).cxx_destruct
{
  value = self->_stitchingStrategy.__ptr_.__value_;
  self->_stitchingStrategy.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(CHAbstractFastPathStitchingStrategy *, SEL))(*(void *)value + 16))(value, a2);
  }
  sub_1C4B1EC44(&self->_inventory._holders.__begin_);
}

- (id).cxx_construct
{
  self->_stitchingStrategy.__ptr_.__value_ = 0;
  return self;
}

@end