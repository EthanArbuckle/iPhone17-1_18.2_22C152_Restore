@interface CHRemoteTextSynthesizer
- (BOOL)populateStyleInventoryWithTokenizedResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5 error:(id *)a6;
- (BOOL)resetStyleInventory:(id *)a3;
- (BOOL)updateStyleInventoryWithRemovedStrokeIdentifiers:(id)a3 error:(id *)a4;
- (CHRemoteTextSynthesizer)init;
- (CHRemoteTextSynthesizer)initWithShouldSkipInventoryLookup:(BOOL)a3 shouldSaveStyleSample:(BOOL)a4;
- (id)cachedStyleInventoryStatus;
- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7;
- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8;
- (id)styleInventoryStatus;
- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4;
- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6;
- (void)dealloc;
@end

@implementation CHRemoteTextSynthesizer

- (CHRemoteTextSynthesizer)initWithShouldSkipInventoryLookup:(BOOL)a3 shouldSaveStyleSample:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHRemoteTextSynthesizer;
  result = [(CHRemoteTextSynthesizer *)&v7 init];
  if (result)
  {
    result->_shouldSkipStyleInventoryLookup = a3;
    result->_shouldSaveStyleSample = a4;
  }
  return result;
}

- (CHRemoteTextSynthesizer)init
{
  return (CHRemoteTextSynthesizer *)((uint64_t (*)(CHRemoteTextSynthesizer *, char *, void, void))MEMORY[0x1F4181798])(self, sel_initWithShouldSkipInventoryLookup_shouldSaveStyleSample_, 0, 0);
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (uint64_t (**)(void))a5;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v13 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_DEFAULT, "Remote Synthesis Request for synthesize drawing", buf, 2u);
  }

  v14 = sub_1C4BE3718((uint64_t)self, v11);
  v15 = [CHRemoteSynthesisRequest alloc];
  v17 = objc_msgSend_initWithString_drawing_options_requestType_(v15, v16, (uint64_t)v10, 0, (uint64_t)v14, 0);
  if (v12 && (v12[2](v12) & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    id v22 = 0;
    v18 = sub_1C4BE39BC(self, v17, &v22);
    id v19 = v22;
    v20 = v19;
    if (a6) {
      *a6 = v19;
    }
  }
  return v18;
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (uint64_t (**)(void))a6;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v16 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v16, OS_LOG_TYPE_DEFAULT, "Remote Synthesis Request for refine drawing", buf, 2u);
  }

  v17 = sub_1C4BE3718((uint64_t)self, v14);
  v18 = [CHRemoteSynthesisRequest alloc];
  v20 = objc_msgSend_initWithString_drawing_options_requestType_(v18, v19, (uint64_t)v13, (uint64_t)v12, (uint64_t)v17, 1);
  if (v15 && (v15[2](v15) & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    id v25 = 0;
    v21 = sub_1C4BE39BC(self, v20, &v25);
    id v22 = v25;
    v23 = v22;
    if (a7) {
      *a7 = v22;
    }
  }
  return v21;
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = (uint64_t (**)(void))a7;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v19 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_DEFAULT, "Remote Synthesis Request for replace drawing", buf, 2u);
  }

  v20 = sub_1C4BE3718((uint64_t)self, v17);
  objc_msgSend_setStyleDrawing_(v20, v21, (uint64_t)v14, v22, v23, v24);
  objc_msgSend_setStyleContent_(v20, v25, (uint64_t)v15, v26, v27, v28);
  v29 = [CHRemoteSynthesisRequest alloc];
  v31 = objc_msgSend_initWithString_drawing_options_requestType_(v29, v30, (uint64_t)v16, (uint64_t)v14, (uint64_t)v20, 2);
  if (v18 && (v18[2](v18) & 1) != 0)
  {
    v32 = 0;
  }
  else
  {
    id v36 = 0;
    v32 = sub_1C4BE39BC(self, v31, &v36);
    id v33 = v36;
    v34 = v33;
    if (a8) {
      *a8 = v33;
    }
  }
  return v32;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  id v4 = a3;
  if (CHHasPersonalizedSynthesisModelReady((uint64_t)v4, v5, v6, v7, v8, v9)) {
    indicesWithPersonalizedSynthesisSupport(v4, 1);
  }
  else {
  id v15 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v10, v11, v12, v13, v14);
  }

  return v15;
}

- (void)dealloc
{
  sub_1C4BE46E0(self);
  v3.receiver = self;
  v3.super_class = (Class)CHRemoteTextSynthesizer;
  [(CHRemoteTextSynthesizer *)&v3 dealloc];
}

- (BOOL)populateStyleInventoryWithTokenizedResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [CHRemoteInventoryRequest alloc];
  id v16 = objc_msgSend_initWithTokenizedResult_drawing_strokeIdentifiers_(v13, v14, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v15);
  id v21 = 0;
  BOOL v17 = sub_1C4BE59F8(self, v16, &v21);
  id v18 = v21;
  id v19 = v18;
  if (a6) {
    *a6 = v18;
  }

  return v17;
}

- (BOOL)updateStyleInventoryWithRemovedStrokeIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [CHRemoteInventoryRequest alloc];
  id v12 = objc_msgSend_initWithRemovedStrokeIdentifiers_(v7, v8, (uint64_t)v6, v9, v10, v11);
  id v17 = 0;
  BOOL v13 = sub_1C4BE59F8(self, v12, &v17);
  id v14 = v17;
  uint64_t v15 = v14;
  if (a4) {
    *a4 = v14;
  }

  return v13;
}

- (BOOL)resetStyleInventory:(id *)a3
{
  v5 = [CHRemoteInventoryRequest alloc];
  inited = objc_msgSend_initResetInventoryRequest(v5, v6, v7, v8, v9, v10);
  id v16 = 0;
  BOOL v12 = sub_1C4BE59F8(self, inited, &v16);
  id v13 = v16;
  id v14 = v13;
  if (a3) {
    *a3 = v13;
  }

  return v12;
}

- (id)styleInventoryStatus
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  objc_super v3 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_DEBUG, "Remote Inventory Status Request", v6, 2u);
  }

  id v4 = sub_1C4BE62C8(self, 1);
  return v4;
}

- (id)cachedStyleInventoryStatus
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  objc_super v3 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_DEBUG, "Remote Cached Inventory Status Request", v6, 2u);
  }

  id v4 = sub_1C4BE62C8(self, 0);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong((id *)&self->_cachedStyleInventoryStatus, 0);
}

@end