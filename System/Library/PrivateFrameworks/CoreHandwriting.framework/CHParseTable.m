@interface CHParseTable
- (CHParseTable)initWithInputLength:(int64_t)a3 grammarSize:(int64_t)a4;
- (id)cellWithLength:(int64_t)a3 range:(_NSRange)a4 nonTerminal:(id)a5;
- (id)cellsByRangeForLength:(int64_t)a3;
- (id)cellsOfLength:(int64_t)a3;
- (id)startCellsWithLength:(int64_t)a3 inRange:(_NSRange)a4 startSymbol:(id)a5;
- (int64_t)grammarSize;
- (int64_t)inputLength;
- (void)addCell:(id)a3;
- (void)clear:(int64_t)a3;
- (void)setGrammarSize:(int64_t)a3;
- (void)setInputLength:(int64_t)a3;
@end

@implementation CHParseTable

- (CHParseTable)initWithInputLength:(int64_t)a3 grammarSize:(int64_t)a4
{
  int64_t v7 = a3;
  uint64_t v8 = objc_msgSend_init(self, a2, a3, a4, v4, v5);
  v9 = (CHParseTable *)v8;
  if (v8)
  {
    *(void *)(v8 + 16) = v7;
    *(void *)(v8 + 24) = a4;
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = objc_msgSend_initWithCapacity_(v10, v11, v7, v12, v13, v14);
    table = v9->_table;
    v9->_table = (NSMutableArray *)v15;

    if (v7 >= 1)
    {
      do
      {
        v22 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v17, v18, v19, v20, v21);
        objc_msgSend_addObject_(v9->_table, v23, (uint64_t)v22, v24, v25, v26);

        --v7;
      }
      while (v7);
    }
  }
  return v9;
}

- (void)clear:(int64_t)a3
{
  objc_msgSend_objectAtIndexedSubscript_(self->_table, a2, a3 - 1, v3, v4, v5);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v11, v6, v7, v8, v9, v10);
}

- (void)addCell:(id)a3
{
  id v4 = a3;
  table = self->_table;
  id v50 = v4;
  uint64_t v11 = objc_msgSend_length(v4, v6, v7, v8, v9, v10);
  v16 = objc_msgSend_objectAtIndexedSubscript_(table, v12, v11 - 1, v13, v14, v15);
  uint64_t v22 = objc_msgSend_inputRange(v50, v17, v18, v19, v20, v21);
  uint64_t v26 = objc_msgSend_stringForRange_(CHParseTableCell, v23, v22, (uint64_t)v23, v24, v25);
  v36 = objc_msgSend_objectForKeyedSubscript_(v16, v27, (uint64_t)v26, v28, v29, v30);
  if (!v36)
  {
    v36 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v31, v32, v33, v34, v35);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v37, (uint64_t)v36, (uint64_t)v26, v38, v39);
  }
  v40 = objc_msgSend_nonTerminal(v50, v31, v32, v33, v34, v35);
  v46 = objc_msgSend_name(v40, v41, v42, v43, v44, v45);
  objc_msgSend_setObject_forKeyedSubscript_(v36, v47, (uint64_t)v50, (uint64_t)v46, v48, v49);
}

- (id)cellWithLength:(int64_t)a3 range:(_NSRange)a4 nonTerminal:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(self->_table, v10, a3 - 1, v11, v12, v13);
  uint64_t v18 = objc_msgSend_stringForRange_(CHParseTableCell, v15, location, length, v16, v17);
  v23 = objc_msgSend_objectForKeyedSubscript_(v14, v19, (uint64_t)v18, v20, v21, v22);
  uint64_t v28 = v23;
  if (v23)
  {
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v9, v25, v26, v27);
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

- (id)cellsOfLength:(int64_t)a3
{
  uint64_t v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, v3, v4, v5);
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(self->_table, v9, a3 - 1, v10, v11, v12);
  uint64_t v19 = objc_msgSend_allValues(v13, v14, v15, v16, v17, v18);

  for (unint64_t i = 0; i < objc_msgSend_count(v19, v20, v21, v22, v23, v24); ++i)
  {
    uint64_t v30 = objc_msgSend_objectAtIndexedSubscript_(v19, v26, i, v27, v28, v29);
    v36 = objc_msgSend_allValues(v30, v31, v32, v33, v34, v35);

    objc_msgSend_addObjectsFromArray_(v8, v37, (uint64_t)v36, v38, v39, v40);
  }

  return v8;
}

- (id)cellsByRangeForLength:(int64_t)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, v3, v4, v5);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(self->_table, v9, a3 - 1, v10, v11, v12, 0);
  uint64_t v19 = objc_msgSend_allValues(v13, v14, v15, v16, v17, v18);

  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v36, (uint64_t)v40, 16, v21);
  if (v27)
  {
    uint64_t v28 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v37 != v28) {
          objc_enumerationMutation(v19);
        }
        uint64_t v30 = objc_msgSend_allValues(*(void **)(*((void *)&v36 + 1) + 8 * i), v22, v23, v24, v25, v26);
        objc_msgSend_addObject_(v8, v31, (uint64_t)v30, v32, v33, v34);
      }
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v36, (uint64_t)v40, 16, v26);
    }
    while (v27);
  }

  return v8;
}

- (id)startCellsWithLength:(int64_t)a3 inRange:(_NSRange)a4 startSymbol:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  uint64_t v14 = objc_msgSend_cellsOfLength_(self, v10, a3, v11, v12, v13);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1C4B051A8;
  v27[3] = &unk_1E64E3BA8;
  id v15 = v9;
  id v28 = v15;
  NSUInteger v29 = location;
  NSUInteger v30 = length;
  uint64_t v20 = objc_msgSend_indexesOfObjectsPassingTest_(v14, v16, (uint64_t)v27, v17, v18, v19);
  uint64_t v25 = objc_msgSend_objectsAtIndexes_(v14, v21, (uint64_t)v20, v22, v23, v24);

  return v25;
}

- (int64_t)inputLength
{
  return self->_inputLength;
}

- (void)setInputLength:(int64_t)a3
{
  self->_inputLength = a3;
}

- (int64_t)grammarSize
{
  return self->_grammarSize;
}

- (void)setGrammarSize:(int64_t)a3
{
  self->_grammarSize = a3;
}

- (void).cxx_destruct
{
}

@end