@interface CHAutoRefineQueryItem
- (BOOL)q_doesQueryResultDependOnDeclaredVariables;
- (CHAutoRefineQueryItem)initWithAutoRefineResult:(id)a3;
- (CHTokenizedTextResult)textResult;
- (NSArray)strokeIdentifiers;
- (NSIndexSet)refinedTokenColumns;
- (NSLocale)locale;
- (id)debugDescription;
@end

@implementation CHAutoRefineQueryItem

- (CHAutoRefineQueryItem)initWithAutoRefineResult:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CHAutoRefineQueryItem;
  v6 = [(CHAutoRefineQueryItem *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_autoRefineResult, a3);
    uint64_t v13 = objc_msgSend_refinedTokenColumns(v5, v8, v9, v10, v11, v12);
    refinedTokenColumns = v7->_refinedTokenColumns;
    v7->_refinedTokenColumns = (NSIndexSet *)v13;
  }
  return v7;
}

- (CHTokenizedTextResult)textResult
{
  return (CHTokenizedTextResult *)objc_msgSend_textResult(self->_autoRefineResult, a2, v2, v3, v4, v5);
}

- (NSArray)strokeIdentifiers
{
  return (NSArray *)objc_msgSend_strokeIdentifiers(self->_autoRefineResult, a2, v2, v3, v4, v5);
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (NSLocale)locale
{
  v6 = objc_msgSend_textResult(self->_autoRefineResult, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_locale(v6, v7, v8, v9, v10, v11);

  return (NSLocale *)v12;
}

- (id)debugDescription
{
  v7 = objc_msgSend_strokeIdentifiers(self, a2, v2, v3, v4, v5);
  uint64_t v8 = NSString;
  uint64_t v14 = objc_msgSend_count(v7, v9, v10, v11, v12, v13);
  v20 = objc_msgSend_textResult(self, v15, v16, v17, v18, v19);
  v26 = objc_msgSend_topTranscription(v20, v21, v22, v23, v24, v25);
  v32 = objc_msgSend_textResult(self, v27, v28, v29, v30, v31);
  uint64_t v38 = objc_msgSend_tokenColumnCount(v32, v33, v34, v35, v36, v37);
  v43 = objc_msgSend_stringWithFormat_(v8, v39, @"AutoRefineItem with %ld strokes, transcription = %@ across %ld token columns", v40, v41, v42, v14, v26, v38);

  return v43;
}

- (NSIndexSet)refinedTokenColumns
{
  return self->_refinedTokenColumns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinedTokenColumns, 0);
  objc_storeStrong((id *)&self->_autoRefineResult, 0);
}

@end