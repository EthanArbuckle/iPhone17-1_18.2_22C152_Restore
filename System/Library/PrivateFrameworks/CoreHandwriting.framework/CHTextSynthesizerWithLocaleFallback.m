@interface CHTextSynthesizerWithLocaleFallback
- (CHTextSynthesizerWithLocaleFallback)initWithLocales:(id)a3 baseSynthesizer:(id)a4;
- (NSArray)locales;
- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7;
- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8;
- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4;
- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6;
- (id)synthesizeExpressionEvaluationResultWithBlock:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6;
@end

@implementation CHTextSynthesizerWithLocaleFallback

- (CHTextSynthesizerWithLocaleFallback)initWithLocales:(id)a3 baseSynthesizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CHTextSynthesizerWithLocaleFallback;
  v13 = [(CHTextSynthesizerWithLocaleFallback *)&v17 init];
  if (v13)
  {
    uint64_t v14 = objc_msgSend_copy(v6, v8, v9, v10, v11, v12);
    locales = v13->_locales;
    v13->_locales = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_synthesizer, a4);
  }

  return v13;
}

- (id)supportedCharacterIndexesForString:(id)a3 options:(id)a4
{
  id v6 = objc_msgSend_supportedCharacterIndexesForString_options_(self->_synthesizer, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  return v6;
}

- (id)synthesizeDrawingForString:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  id v6 = objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_synthesizer, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6);
  return v6;
}

- (id)refineDrawing:(id)a3 transcription:(id)a4 options:(id)a5 shouldCancel:(id)a6 error:(id *)a7
{
  id v7 = objc_msgSend_refineDrawing_transcription_options_shouldCancel_error_(self->_synthesizer, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7);
  return v7;
}

- (id)replaceDrawing:(id)a3 originalTranscription:(id)a4 replacementTranscription:(id)a5 options:(id)a6 shouldCancel:(id)a7 error:(id *)a8
{
  v8 = objc_msgSend_replaceDrawing_originalTranscription_replacementTranscription_options_shouldCancel_error_(self->_synthesizer, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8);
  return v8;
}

- (id)synthesizeExpressionEvaluationResultWithBlock:(id)a3 options:(id)a4 shouldCancel:(id)a5 error:(id *)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void (**)(id, void *))a3;
  id v55 = a4;
  id v56 = a5;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obj = self->_locales;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v57, (uint64_t)v67, 16, v12);
  if (v13)
  {
    uint64_t v14 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v58 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        objc_super v17 = v10[2](v10, v16);
        v19 = objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_synthesizer, v18, (uint64_t)v17, (uint64_t)v55, (uint64_t)v56, (uint64_t)a6);
        v25 = v19;
        if (v19 && !objc_msgSend_numberOfNotSynthesizedCharacters(v19, v20, v21, v22, v23, v24))
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          v40 = (id)qword_1EA3C9FD8;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend_localeIdentifier(v16, v41, v42, v43, v44, v45);
            v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
            uint64_t v52 = objc_msgSend_length(v17, v47, v48, v49, v50, v51);
            *(_DWORD *)buf = 138412803;
            v62 = v46;
            __int16 v63 = 2117;
            uint64_t v64 = (uint64_t)v17;
            __int16 v65 = 2048;
            uint64_t v66 = v52;
            _os_log_impl(&dword_1C492D000, v40, OS_LOG_TYPE_DEFAULT, "SynthesizerWithLocalFallback: Synthesizing expression evaluation result with %@ transcription=\"%{sensitive}@\" (length=%lu)", buf, 0x20u);
          }
          goto LABEL_19;
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v57, (uint64_t)v67, 16, v27);
      if (v13) {
        continue;
      }
      break;
    }
  }

  v32 = objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E4F1CA20], v28, @"en_US", v29, v30, v31);
  v10[2](v10, v32);
  obj = (NSArray *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(self->_synthesizer, v33, (uint64_t)obj, (uint64_t)v55, (uint64_t)v56, (uint64_t)a6);
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  objc_super v17 = (id)qword_1EA3C9FD8;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = objc_msgSend_length(obj, v34, v35, v36, v37, v38);
    *(_DWORD *)buf = 138740227;
    v62 = obj;
    __int16 v63 = 2048;
    uint64_t v64 = v39;
    _os_log_impl(&dword_1C492D000, v17, OS_LOG_TYPE_DEFAULT, "SynthesizerWithLocalFallback: Synthesizing expression evaluation result in en_US locale with transcription=\"%{sensitive}@\" (length=%lu)", buf, 0x16u);
  }
LABEL_19:

  return v25;
}

- (NSArray)locales
{
  return self->_locales;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_synthesizer, 0);
}

@end