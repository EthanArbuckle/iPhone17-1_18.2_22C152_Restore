@interface CHStrokeGroupQueryItem
+ (id)descriptionForStrokeGroupQueryItemType:(int64_t)a3;
- (CHTokenizedMathResult)mathResult;
- (NSArray)strokeIdentifiers;
- (NSLocale)preferredLocale;
- (NSNumber)strokeGroupIdentifier;
- (NSNumber)strokeGroupStableIdentifier;
- (id)description;
- (id)textRecognitionResultForLocale:(id)a3 error:(id *)a4;
- (int64_t)strokeClassification;
- (int64_t)strokeGroupType;
@end

@implementation CHStrokeGroupQueryItem

+ (id)descriptionForStrokeGroupQueryItemType:(int64_t)a3
{
  v3 = &stru_1F20141C8;
  if (a3 == 1) {
    v3 = @"Handwriting";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Unknown";
  }
}

- (id)textRecognitionResultForLocale:(id)a3 error:(id *)a4
{
  id v10 = a3;
  if (self)
  {
    v11 = objc_msgSend_objectForKeyedSubscript_(self->__tokenizedTextResultsByLocale, v6, (uint64_t)v10, v7, v8, v9);
    if (a4)
    {
LABEL_3:
      if (self) {
        errorsByLocale = self->__errorsByLocale;
      }
      else {
        errorsByLocale = 0;
      }
      v13 = errorsByLocale;
      objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)v10, v15, v16, v17);
      id v18 = (id)objc_claimAutoreleasedReturnValue();

      *a4 = v18;
    }
  }
  else
  {
    v11 = objc_msgSend_objectForKeyedSubscript_(0, v6, (uint64_t)v10, v7, v8, v9);
    if (a4) {
      goto LABEL_3;
    }
  }

  return v11;
}

- (int64_t)strokeClassification
{
  return self->__strokeClassification;
}

- (id)description
{
  v3 = objc_opt_class();
  uint64_t v8 = objc_msgSend_descriptionForStrokeGroupQueryItemType_(v3, v4, self->_strokeGroupType, v5, v6, v7);
  v24.receiver = self;
  v24.super_class = (Class)CHStrokeGroupQueryItem;
  uint64_t v9 = [(CHStrokeGroupQueryItem *)&v24 description];
  strokeGroupIdentifier = self->_strokeGroupIdentifier;
  strokeGroupStableIdentifier = self->_strokeGroupStableIdentifier;
  uint64_t v17 = objc_msgSend_count(self->_strokeIdentifiers, v12, v13, v14, v15, v16);
  v22 = objc_msgSend_stringByAppendingFormat_(v9, v18, @" ID: %@, StableID: %@, Stroke count: %ld, type: %@", v19, v20, v21, strokeGroupIdentifier, strokeGroupStableIdentifier, v17, v8);

  return v22;
}

- (NSNumber)strokeGroupIdentifier
{
  return self->_strokeGroupIdentifier;
}

- (NSNumber)strokeGroupStableIdentifier
{
  return self->_strokeGroupStableIdentifier;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (int64_t)strokeGroupType
{
  return self->_strokeGroupType;
}

- (NSLocale)preferredLocale
{
  return self->_preferredLocale;
}

- (CHTokenizedMathResult)mathResult
{
  return self->_mathResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__errorsByLocale, 0);
  objc_storeStrong((id *)&self->__tokenizedTextResultsByLocale, 0);
  objc_storeStrong((id *)&self->_mathResult, 0);
  objc_storeStrong((id *)&self->_preferredLocale, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeGroupStableIdentifier, 0);
  objc_storeStrong((id *)&self->_strokeGroupIdentifier, 0);
}

@end