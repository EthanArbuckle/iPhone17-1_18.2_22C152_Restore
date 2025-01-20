@interface CHScriptClassificationRawResult
+ (BOOL)supportsSecureCoding;
+ (id)changeableTextMathScriptClassifications;
+ (id)validFallbackScriptClassificationsForNontext;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScriptClassificationRawResult:(id)a3;
- (BOOL)isValidScriptClassificationForShapeStroke;
- (CHScriptClassificationRawResult)initWithCoder:(id)a3;
- (CHScriptClassificationRawResult)initWithProbabilityByScriptClassifications:(id)a3;
- (NSArray)orderedScriptClassification;
- (NSDictionary)probabilityByScriptClassifications;
- (double)mathScriptProbability;
- (id)fallbackScriptClassificationForWeakLabel;
- (id)scriptClassificationAtIndex:(int64_t)a3;
- (id)scriptProbabilityAtIndex:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHScriptClassificationRawResult

- (CHScriptClassificationRawResult)initWithProbabilityByScriptClassifications:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CHScriptClassificationRawResult;
  v6 = [(CHScriptClassificationRawResult *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_probabilityByScriptClassifications, a3);
    v13 = objc_msgSend_probabilityByScriptClassifications(v7, v8, v9, v10, v11, v12);
    uint64_t v18 = objc_msgSend_keysSortedByValueUsingComparator_(v13, v14, (uint64_t)&unk_1F20134F0, v15, v16, v17);
    orderedScriptClassification = v7->_orderedScriptClassification;
    v7->_orderedScriptClassification = (NSArray *)v18;
  }
  return v7;
}

- (id)scriptClassificationAtIndex:(int64_t)a3
{
  v7 = objc_msgSend_orderedScriptClassification(self, a2, a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(v7, v8, a3, v9, v10, v11);

  return v12;
}

- (id)scriptProbabilityAtIndex:(int64_t)a3
{
  v8 = objc_msgSend_orderedScriptClassification(self, a2, a3, v3, v4, v5);
  v13 = objc_msgSend_objectAtIndexedSubscript_(v8, v9, a3, v10, v11, v12);

  v19 = objc_msgSend_probabilityByScriptClassifications(self, v14, v15, v16, v17, v18);
  v24 = objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)v13, v21, v22, v23);

  return v24;
}

- (double)mathScriptProbability
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v3 = self->_probabilityByScriptClassifications;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v37, (uint64_t)v41, 16, v5);
  if (v11)
  {
    uint64_t v12 = *(void *)v38;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v3);
        }
        uint64_t v15 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_integerValue(v15, v6, v7, v8, v9, v10, (void)v37);
        uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(self->_probabilityByScriptClassifications, v17, (uint64_t)v15, v18, v19, v20);
        objc_msgSend_floatValue(v21, v22, v23, v24, v25, v26);
        float v28 = v27;

        int isScriptClassificationMath = objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v29, v16, v30, v31, v32);
        double v34 = v28;
        if (v16 == 11) {
          int v35 = 1;
        }
        else {
          int v35 = isScriptClassificationMath;
        }
        if (!v35) {
          double v34 = -0.0;
        }
        double v13 = v13 + v34;
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v37, (uint64_t)v41, 16, v10);
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (id)fallbackScriptClassificationForWeakLabel
{
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v8 = objc_msgSend_orderedScriptClassification(self, a2, v2, v3, v4, v5);
    unint64_t v14 = objc_msgSend_count(v8, v9, v10, v11, v12, v13);

    if (v14 <= i) {
      break;
    }
    uint64_t v20 = objc_msgSend_orderedScriptClassification(self, v15, v16, v17, v18, v19);
    uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, i, v22, v23, v24);

    if ((objc_msgSend_containsObject_(&unk_1F203D9C8, v26, (uint64_t)v25, v27, v28, v29) & 1) == 0) {
      goto LABEL_6;
    }
  }
  uint64_t v25 = &unk_1F203E328;
LABEL_6:
  return v25;
}

- (BOOL)isValidScriptClassificationForShapeStroke
{
  v6 = objc_msgSend_scriptClassificationAtIndex_(self, a2, 0, v2, v3, v4);
  uint64_t v12 = objc_msgSend_integerValue(v6, v7, v8, v9, v10, v11);

  BOOL result = 0;
  if (objc_msgSend_isScriptClassificationMath_(CHStrokeUtilities, v13, v12, v14, v15, v16))
  {
    if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 0xE) {
      return 1;
    }
    uint64_t v21 = objc_msgSend_scriptProbabilityAtIndex_(self, v17, 0, v18, v19, v20);
    objc_msgSend_floatValue(v21, v22, v23, v24, v25, v26);
    float v28 = v27;

    if (v28 >= 0.9) {
      return 1;
    }
  }
  return result;
}

+ (id)validFallbackScriptClassificationsForNontext
{
  if (qword_1EA3C9150 == -1)
  {
    uint64_t v2 = (void *)qword_1EA3C9148;
  }
  else
  {
    dispatch_once(&qword_1EA3C9150, &unk_1F2013510);
    uint64_t v2 = (void *)qword_1EA3C9148;
  }
  return v2;
}

+ (id)changeableTextMathScriptClassifications
{
  if (qword_1EA3C9160 == -1)
  {
    uint64_t v2 = (void *)qword_1EA3C9158;
  }
  else
  {
    dispatch_once(&qword_1EA3C9160, &unk_1F2013530);
    uint64_t v2 = (void *)qword_1EA3C9158;
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  uint64_t v9 = objc_msgSend_probabilityByScriptClassifications(self, v4, v5, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v13, v10, (uint64_t)v9, @"scriptClassificationRawResultsProbability", v11, v12);
}

- (CHScriptClassificationRawResult)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)&v25, 3, v7, v8);
  uint64_t v14 = objc_msgSend_setWithArray_(v5, v10, (uint64_t)v9, v11, v12, v13, v25, v26);
  uint64_t v18 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, @"scriptClassificationRawResultsProbability", v16, v17);

  uint64_t v23 = (CHScriptClassificationRawResult *)objc_msgSend_initWithProbabilityByScriptClassifications_(self, v19, (uint64_t)v18, v20, v21, v22);
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToScriptClassificationRawResult:(id)a3
{
  id v4 = (CHScriptClassificationRawResult *)a3;
  uint64_t v10 = v4;
  if (self == v4)
  {
    char isEqualToArray = 1;
    goto LABEL_11;
  }
  probabilityByScriptClassifications = self->_probabilityByScriptClassifications;
  objc_msgSend_probabilityByScriptClassifications(v4, v5, v6, v7, v8, v9);
  uint64_t v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (probabilityByScriptClassifications == v17)
  {
  }
  else
  {
    uint64_t v18 = self->_probabilityByScriptClassifications;
    uint64_t v19 = objc_msgSend_probabilityByScriptClassifications(v10, v12, v13, v14, v15, v16);
    LODWORD(v18) = objc_msgSend_isEqualToDictionary_(v18, v20, (uint64_t)v19, v21, v22, v23);

    if (!v18)
    {
      char isEqualToArray = 0;
      goto LABEL_11;
    }
  }
  orderedScriptClassification = self->_orderedScriptClassification;
  objc_msgSend_orderedScriptClassification(v10, v24, v25, v26, v27, v28);
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (orderedScriptClassification == v36)
  {
    char isEqualToArray = 1;
  }
  else
  {
    long long v37 = self->_orderedScriptClassification;
    long long v38 = objc_msgSend_orderedScriptClassification(v10, v31, v32, v33, v34, v35);
    char isEqualToArray = objc_msgSend_isEqualToArray_(v37, v39, (uint64_t)v38, v40, v41, v42);
  }
LABEL_11:

  return isEqualToArray;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToScriptClassificationRawResult = objc_msgSend_isEqualToScriptClassificationRawResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToScriptClassificationRawResult;
  }
  else
  {

    return 0;
  }
}

- (NSArray)orderedScriptClassification
{
  return self->_orderedScriptClassification;
}

- (NSDictionary)probabilityByScriptClassifications
{
  return self->_probabilityByScriptClassifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probabilityByScriptClassifications, 0);
  objc_storeStrong((id *)&self->_orderedScriptClassification, 0);
}

@end