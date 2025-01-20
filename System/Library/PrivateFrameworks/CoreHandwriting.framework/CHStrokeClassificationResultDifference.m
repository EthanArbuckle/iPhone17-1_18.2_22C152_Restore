@interface CHStrokeClassificationResultDifference
- (BOOL)hasChanges;
- (CHStrokeClassificationResultDifference)initWithStrokeIdentifiersForAddedText:(id)a3 removedText:(id)a4 addedNonText:(id)a5 removedNonText:(id)a6 transitionedText:(id)a7 transitionedNonText:(id)a8;
- (NSSet)addedNonTextStrokeIdentifiers;
- (NSSet)addedStrokeIdentifiers;
- (NSSet)addedTextStrokeIdentifiers;
- (NSSet)removedNonTextStrokeIdentifiers;
- (NSSet)removedStrokeIdentifiers;
- (NSSet)removedTextStrokeIdentifiers;
- (NSSet)transitionedNonTextStrokeIdentifiers;
- (NSSet)transitionedStrokeIdentifiers;
- (NSSet)transitionedTextStrokeIdentifiers;
@end

@implementation CHStrokeClassificationResultDifference

- (CHStrokeClassificationResultDifference)initWithStrokeIdentifiersForAddedText:(id)a3 removedText:(id)a4 addedNonText:(id)a5 removedNonText:(id)a6 transitionedText:(id)a7 transitionedNonText:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CHStrokeClassificationResultDifference;
  v18 = [(CHStrokeClassificationResultDifference *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_addedTextStrokeIdentifiers, a3);
    objc_storeStrong((id *)&v19->_removedTextStrokeIdentifiers, a4);
    objc_storeStrong((id *)&v19->_addedNonTextStrokeIdentifiers, a5);
    objc_storeStrong((id *)&v19->_removedNonTextStrokeIdentifiers, a6);
    objc_storeStrong((id *)&v19->_transitionedTextStrokeIdentifiers, a7);
    objc_storeStrong((id *)&v19->_transitionedNonTextStrokeIdentifiers, a8);
  }

  return v19;
}

- (BOOL)hasChanges
{
  uint64_t v7 = objc_msgSend_count(self->_addedTextStrokeIdentifiers, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_count(self->_addedNonTextStrokeIdentifiers, v8, v9, v10, v11, v12) + v7;
  uint64_t v19 = objc_msgSend_count(self->_removedTextStrokeIdentifiers, v14, v15, v16, v17, v18);
  uint64_t v25 = v13 + v19 + objc_msgSend_count(self->_removedNonTextStrokeIdentifiers, v20, v21, v22, v23, v24);
  uint64_t v31 = v25 + objc_msgSend_count(self->_transitionedTextStrokeIdentifiers, v26, v27, v28, v29, v30);
  return v31 + objc_msgSend_count(self->_transitionedNonTextStrokeIdentifiers, v32, v33, v34, v35, v36) != 0;
}

- (NSSet)addedStrokeIdentifiers
{
  uint64_t v7 = objc_msgSend_mutableCopy(self->_addedTextStrokeIdentifiers, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_setByAddingObjectsFromSet_(v7, v8, (uint64_t)self->_addedNonTextStrokeIdentifiers, v9, v10, v11);

  return (NSSet *)v12;
}

- (NSSet)removedStrokeIdentifiers
{
  uint64_t v7 = objc_msgSend_mutableCopy(self->_removedTextStrokeIdentifiers, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_setByAddingObjectsFromSet_(v7, v8, (uint64_t)self->_removedNonTextStrokeIdentifiers, v9, v10, v11);

  return (NSSet *)v12;
}

- (NSSet)transitionedStrokeIdentifiers
{
  uint64_t v7 = objc_msgSend_mutableCopy(self->_transitionedTextStrokeIdentifiers, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend_setByAddingObjectsFromSet_(v7, v8, (uint64_t)self->_transitionedNonTextStrokeIdentifiers, v9, v10, v11);

  return (NSSet *)v12;
}

- (NSSet)addedTextStrokeIdentifiers
{
  return self->_addedTextStrokeIdentifiers;
}

- (NSSet)removedTextStrokeIdentifiers
{
  return self->_removedTextStrokeIdentifiers;
}

- (NSSet)addedNonTextStrokeIdentifiers
{
  return self->_addedNonTextStrokeIdentifiers;
}

- (NSSet)removedNonTextStrokeIdentifiers
{
  return self->_removedNonTextStrokeIdentifiers;
}

- (NSSet)transitionedTextStrokeIdentifiers
{
  return self->_transitionedTextStrokeIdentifiers;
}

- (NSSet)transitionedNonTextStrokeIdentifiers
{
  return self->_transitionedNonTextStrokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionedNonTextStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_transitionedTextStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_removedNonTextStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedNonTextStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_removedTextStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedTextStrokeIdentifiers, 0);
}

@end