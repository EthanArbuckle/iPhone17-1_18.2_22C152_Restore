@interface DURequestStrategyObjC
- (BOOL)preprocess;
- (DURequestContentTypeObjC)contentType;
- (DURequestStrategyObjC)initWithContentType:(id)a3 preferredModelIdentifier:(id)a4 preprocess:(BOOL)a5;
- (NSString)modelIdentifier;
- (void)setContentType:(id)a3;
- (void)setModelIdentifier:(id)a3;
@end

@implementation DURequestStrategyObjC

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objCContentType, 0);
  objc_storeStrong((id *)&self->_underlyingStrategy, 0);
}

- (BOOL)preprocess
{
  return self->_preprocess;
}

- (NSString)modelIdentifier
{
  return (NSString *)objc_msgSend_modelIdentifier(self->_underlyingStrategy, a2, v2, v3, v4);
}

- (void)setModelIdentifier:(id)a3
{
  id v9 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3, v4);
  objc_msgSend_setModelIdentifier_(self->_underlyingStrategy, v6, (uint64_t)v9, v7, v8);
}

- (DURequestContentTypeObjC)contentType
{
  return self->_objCContentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_objCContentType, a3);
  id v5 = a3;
  objc_msgSend_typeForObjCType_(DUObjCCompatibilityUtils, v6, (uint64_t)v5, v7, v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentType_(self->_underlyingStrategy, v9, (uint64_t)v12, v10, v11);
}

- (DURequestStrategyObjC)initWithContentType:(id)a3 preferredModelIdentifier:(id)a4 preprocess:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)DURequestStrategyObjC;
  uint64_t v11 = [(DURequestStrategyObjC *)&v23 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_objCContentType, a3);
    v13 = [_TtC21DocumentUnderstanding17DURequestStrategy alloc];
    v17 = objc_msgSend_typeForObjCType_(DUObjCCompatibilityUtils, v14, (uint64_t)v9, v15, v16);
    uint64_t v19 = objc_msgSend_initWithContentType_preferredModelIdentifier_preprocess_(v13, v18, (uint64_t)v17, (uint64_t)v10, v5);
    underlyingStrategy = v12->_underlyingStrategy;
    v12->_underlyingStrategy = (_TtC21DocumentUnderstanding17DURequestStrategy *)v19;

    v21 = v12;
  }

  return v12;
}

@end