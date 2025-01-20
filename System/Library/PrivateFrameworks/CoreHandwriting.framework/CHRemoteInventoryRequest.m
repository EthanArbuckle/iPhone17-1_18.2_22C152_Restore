@interface CHRemoteInventoryRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldResetInventory;
- (CHDrawing)drawing;
- (CHRemoteInventoryRequest)initWithCoder:(id)a3;
- (CHRemoteInventoryRequest)initWithRemovedStrokeIdentifiers:(id)a3;
- (CHRemoteInventoryRequest)initWithTokenizedResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5;
- (CHTokenizedResult)tokenizedResult;
- (NSArray)strokeIdentifiers;
- (NSSet)removedStrokeIdentifiers;
- (id)initResetInventoryRequest;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHRemoteInventoryRequest

- (CHRemoteInventoryRequest)initWithTokenizedResult:(id)a3 drawing:(id)a4 strokeIdentifiers:(id)a5
{
  return (CHRemoteInventoryRequest *)sub_1C4A55454(self, a3, a4, a5, 0, 0);
}

- (CHRemoteInventoryRequest)initWithRemovedStrokeIdentifiers:(id)a3
{
  return (CHRemoteInventoryRequest *)sub_1C4A55454(self, 0, 0, 0, a3, 0);
}

- (id)initResetInventoryRequest
{
  return sub_1C4A55454(self, 0, 0, 0, 0, 1);
}

- (CHRemoteInventoryRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"tokenizedResult", v7, v8);
  v9 = (CHTokenizedResult *)objc_claimAutoreleasedReturnValue();
  tokenizedResult = self->_tokenizedResult;
  self->_tokenizedResult = v9;

  uint64_t v11 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"drawing", v13, v14);
  v15 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
  drawing = self->_drawing;
  self->_drawing = v15;

  uint64_t v17 = objc_opt_class();
  objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v18, v17, @"strokeIdentifiers", v19, v20);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  strokeIdentifiers = self->_strokeIdentifiers;
  self->_strokeIdentifiers = v21;

  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  v30 = objc_msgSend_setWithObjects_(v23, v26, v24, v27, v28, v29, v25, 0);
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v31, (uint64_t)v30, @"removedStrokeIdentifiers", v32, v33);
  v34 = (NSSet *)objc_claimAutoreleasedReturnValue();
  removedStrokeIdentifiers = self->_removedStrokeIdentifiers;
  self->_removedStrokeIdentifiers = v34;

  LOBYTE(v24) = objc_msgSend_decodeBoolForKey_(v4, v36, @"shouldResetInventory", v37, v38, v39);
  self->_shouldResetInventory = v24;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  tokenizedResult = self->_tokenizedResult;
  id v20 = a3;
  objc_msgSend_encodeObject_forKey_(v20, v5, (uint64_t)tokenizedResult, @"tokenizedResult", v6, v7);
  objc_msgSend_encodeObject_forKey_(v20, v8, (uint64_t)self->_drawing, @"drawing", v9, v10);
  objc_msgSend_encodeObject_forKey_(v20, v11, (uint64_t)self->_strokeIdentifiers, @"strokeIdentifiers", v12, v13);
  objc_msgSend_encodeObject_forKey_(v20, v14, (uint64_t)self->_removedStrokeIdentifiers, @"removedStrokeIdentifiers", v15, v16);
  objc_msgSend_encodeBool_forKey_(v20, v17, self->_shouldResetInventory, @"shouldResetInventory", v18, v19);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (CHTokenizedResult)tokenizedResult
{
  return self->_tokenizedResult;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (NSSet)removedStrokeIdentifiers
{
  return self->_removedStrokeIdentifiers;
}

- (BOOL)shouldResetInventory
{
  return self->_shouldResetInventory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_tokenizedResult, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end