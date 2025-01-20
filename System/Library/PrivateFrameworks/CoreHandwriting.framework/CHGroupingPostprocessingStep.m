@interface CHGroupingPostprocessingStep
+ (id)remappedStrokeIndexes:(id)a3 originalStrokeIdentifiersOrdering:(id)a4 newStrokeIdentifiersOrdering:(id)a5;
- (BOOL)saveInputDrawings;
- (CHStrokeGroupingManager)groupingManager;
- (id)process:(id)a3 options:(id)a4;
- (void)setGroupingManager:(id)a3;
- (void)setSaveInputDrawings:(BOOL)a3;
@end

@implementation CHGroupingPostprocessingStep

- (id)process:(id)a3 options:(id)a4
{
  id v4 = a3;
  return v4;
}

+ (id)remappedStrokeIndexes:(id)a3 originalStrokeIdentifiersOrdering:(id)a4 newStrokeIdentifiersOrdering:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v10, v11, v12, v13, v14);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1C4B59508;
  v30[3] = &unk_1E64E2F58;
  id v16 = v8;
  id v31 = v16;
  id v17 = v9;
  id v32 = v17;
  id v18 = v15;
  id v33 = v18;
  objc_msgSend_enumerateIndexesUsingBlock_(v7, v19, (uint64_t)v30, v20, v21, v22);
  v28 = objc_msgSend_copy(v18, v23, v24, v25, v26, v27);

  return v28;
}

- (BOOL)saveInputDrawings
{
  return self->_saveInputDrawings;
}

- (void)setSaveInputDrawings:(BOOL)a3
{
  self->_saveInputDrawings = a3;
}

- (CHStrokeGroupingManager)groupingManager
{
  return self->_groupingManager;
}

- (void)setGroupingManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end