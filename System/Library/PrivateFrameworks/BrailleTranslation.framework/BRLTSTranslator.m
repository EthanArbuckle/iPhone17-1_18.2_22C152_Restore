@interface BRLTSTranslator
- (BRLTSTranslator)initWithBundle:(id)a3;
- (BRLTTranslatorProtocol)translator;
- (NSBundle)bundle;
- (id)brailleForText:(id)a3 parameters:(id)a4 locations:(id *)a5;
- (id)textForBraille:(id)a3 parameters:(id)a4 locations:(id *)a5;
- (void)translator;
@end

@implementation BRLTSTranslator

- (BRLTSTranslator)initWithBundle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BRLTSTranslator;
  v6 = [(BRLTSTranslator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundle, a3);
    translator = v7->_translator;
    v7->_translator = 0;
  }
  return v7;
}

- (BRLTTranslatorProtocol)translator
{
  translator = self->_translator;
  if (translator)
  {
LABEL_2:
    v3 = translator;
    goto LABEL_19;
  }
  id v5 = [(BRLTSTranslator *)self bundle];
  v6 = (void *)[v5 principalClass];

  if (v6)
  {
    if ((BRLTTranslatorClassIsValid(v6) & 1) == 0)
    {
      v12 = BRLTLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(BRLTSTranslator *)(uint64_t)v6 translator];
      }

      goto LABEL_18;
    }
    v7 = objc_alloc_init((Class)v6);
    uint64_t v8 = [v7 interfaceVersion];
    v9 = BRLTLog();
    objc_super v10 = v9;
    if (v8 == 7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        [(BRLTSTranslator *)(uint64_t)v7 translator];
      }

      v11 = self->_translator;
      self->_translator = (BRLTTranslatorProtocol *)v7;

      translator = self->_translator;
      goto LABEL_2;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(BRLTSTranslator *)v7 translator];
    }
  }
  else
  {
    v7 = BRLTLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(BRLTSTranslator *)self translator];
    }
  }

LABEL_18:
  v3 = 0;
LABEL_19:
  return v3;
}

- (id)brailleForText:(id)a3 parameters:(id)a4 locations:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = [(BRLTSTranslator *)self translator];
  v11 = [v9 language];
  [v10 setActiveTable:v11];

  if (v8)
  {
    v12 = [(BRLTSTranslator *)self translator];
    uint64_t v13 = [v9 mode];
    uint64_t v14 = [v9 textPositionsRange];
    uint64_t v16 = v15;
    v17 = [v9 textFormattingRanges];
    v18 = objc_msgSend(v12, "printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:", v8, v13, a5, v14, v16, v17);
  }
  else
  {
    v18 = 0;
  }
  v19 = BRLTLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = [v9 language];
    v22 = (void *)v21;
    if (a5) {
      id v23 = *a5;
    }
    else {
      id v23 = 0;
    }
    int v24 = 138413058;
    id v25 = v8;
    __int16 v26 = 2112;
    v27 = v18;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    __int16 v30 = 2112;
    id v31 = v23;
    _os_log_debug_impl(&dword_21C554000, v19, OS_LOG_TYPE_DEBUG, "Translated text:'%@' -> '%@' lang:%@ positions:%@", (uint8_t *)&v24, 0x2Au);
  }
  return v18;
}

- (id)textForBraille:(id)a3 parameters:(id)a4 locations:(id *)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = [(BRLTSTranslator *)self translator];
  v11 = [v9 language];
  [v10 setActiveTable:v11];

  if (v8)
  {
    v12 = [(BRLTSTranslator *)self translator];
    uint64_t v13 = objc_msgSend(v12, "textForPrintBraille:mode:locations:", v8, objc_msgSend(v9, "mode"), a5);
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = BRLTLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [v9 language];
    v17 = (void *)v16;
    if (a5) {
      id v18 = *a5;
    }
    else {
      id v18 = 0;
    }
    int v19 = 138413058;
    id v20 = v8;
    __int16 v21 = 2112;
    v22 = v13;
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    id v26 = v18;
    _os_log_debug_impl(&dword_21C554000, v14, OS_LOG_TYPE_DEBUG, "Translated braille: '%@' -> '%@' lang:%@ positions:%@", (uint8_t *)&v19, 0x2Au);
  }
  return v13;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_translator, 0);
}

- (void)translator
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C554000, a2, OS_LOG_TYPE_ERROR, "%@ does not conform to translator protocol", (uint8_t *)&v2, 0xCu);
}

@end