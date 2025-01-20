@interface CHBottomUpStrokeGroupingResult
+ (BOOL)supportsSecureCoding;
- (CHBottomUpStrokeGroupingResult)initWithCoder:(id)a3;
- (CHBottomUpStrokeGroupingResult)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5 substrokePlacementsByStrokeIdentifier:(id)a6;
- (NSDictionary)substrokePlacementsByStrokeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)groupingResultUpdatedWithGroupReplacements:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHBottomUpStrokeGroupingResult

- (CHBottomUpStrokeGroupingResult)initWithStrokeGroups:(id)a3 createdStrokeGroups:(id)a4 deletedStrokeGroups:(id)a5 substrokePlacementsByStrokeIdentifier:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CHBottomUpStrokeGroupingResult;
  v12 = [(CHStrokeGroupingResult *)&v15 initWithStrokeGroups:a3 createdStrokeGroups:a4 deletedStrokeGroups:a5];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_substrokePlacementsByStrokeIdentifier, a6);
  }

  return v13;
}

- (id)groupingResultUpdatedWithGroupReplacements:(id)a3
{
  v4 = self;
  v34.receiver = v4;
  v34.super_class = (Class)CHBottomUpStrokeGroupingResult;
  v5 = [(CHStrokeGroupingResult *)&v34 groupingResultUpdatedWithGroupReplacements:a3];
  if (v5 != v4)
  {
    v6 = [CHBottomUpStrokeGroupingResult alloc];
    v12 = objc_msgSend_strokeGroups(v5, v7, v8, v9, v10, v11);
    v18 = objc_msgSend_createdStrokeGroups(v5, v13, v14, v15, v16, v17);
    v24 = objc_msgSend_deletedStrokeGroups(v5, v19, v20, v21, v22, v23);
    v30 = objc_msgSend_substrokePlacementsByStrokeIdentifier(v4, v25, v26, v27, v28, v29);
    uint64_t v32 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v6, v31, (uint64_t)v12, (uint64_t)v18, (uint64_t)v24, (uint64_t)v30);

    v4 = (CHBottomUpStrokeGroupingResult *)v32;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v11 = objc_msgSend_substrokePlacementsByStrokeIdentifier(self, v6, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_initWithDictionary_copyItems_(v5, v12, (uint64_t)v11, 1, v13, v14);

  uint64_t v20 = objc_msgSend_allocWithZone_(CHBottomUpStrokeGroupingResult, v16, (uint64_t)a3, v17, v18, v19);
  uint64_t v26 = objc_msgSend_strokeGroups(self, v21, v22, v23, v24, v25);
  uint64_t v32 = objc_msgSend_createdStrokeGroups(self, v27, v28, v29, v30, v31);
  v38 = objc_msgSend_deletedStrokeGroups(self, v33, v34, v35, v36, v37);
  v40 = objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(v20, v39, (uint64_t)v26, (uint64_t)v32, (uint64_t)v38, (uint64_t)v15);

  return v40;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  uint64_t v9 = objc_msgSend_strokeGroups(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v16, v10, (uint64_t)v9, @"strokeGroups", v11, v12);

  objc_msgSend_encodeObject_forKey_(v16, v13, (uint64_t)self->_substrokePlacementsByStrokeIdentifier, @"substrokePlacementsByStrokeIdentifier", v14, v15);
}

- (CHBottomUpStrokeGroupingResult)initWithCoder:(id)a3
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  v40[2] = objc_opt_class();
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v40, 3, v7, v8);
  uint64_t v14 = objc_msgSend_setWithArray_(v5, v10, (uint64_t)v9, v11, v12, v13);
  uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, @"strokeGroups", v16, v17);

  uint64_t v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v20, (uint64_t)&v36, 4, v21, v22);
  uint64_t v28 = objc_msgSend_setWithArray_(v19, v24, (uint64_t)v23, v25, v26, v27, v36, v37, v38);
  uint64_t v32 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v29, (uint64_t)v28, @"substrokePlacementsByStrokeIdentifier", v30, v31);

  uint64_t v34 = (CHBottomUpStrokeGroupingResult *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_substrokePlacementsByStrokeIdentifier_(self, v33, (uint64_t)v18, (uint64_t)v18, 0, (uint64_t)v32);
  return v34;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)substrokePlacementsByStrokeIdentifier
{
  return self->_substrokePlacementsByStrokeIdentifier;
}

- (void).cxx_destruct
{
}

@end