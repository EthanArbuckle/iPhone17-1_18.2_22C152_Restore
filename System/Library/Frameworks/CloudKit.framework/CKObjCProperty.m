@interface CKObjCProperty
- (CKObjCType)type;
- (NSString)name;
- (SEL)getterSelector;
- (SEL)setterSelector;
- (id)description;
- (int64_t)compare:(id)a3;
@end

@implementation CKObjCProperty

- (id)description
{
  v3 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)CKObjCProperty;
  v4 = [(CKObjCProperty *)&v21 description];
  v8 = objc_msgSend_name(self, v5, v6, v7);
  v12 = objc_msgSend_type(self, v9, v10, v11);
  v16 = objc_msgSend_name(v12, v13, v14, v15);
  v19 = objc_msgSend_stringWithFormat_(v3, v17, @"<%@: %@ (%@)>", v18, v4, v8, v16);

  return v19;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self)
    {
      id v5 = v4;
      v9 = objc_msgSend_name(self, v6, v7, v8);
      v13 = objc_msgSend_name(v5, v10, v11, v12);

      self = (CKObjCProperty *)objc_msgSend_compare_(v9, v14, (uint64_t)v13, v15);
    }
  }
  else
  {
    self = (CKObjCProperty *)-1;
  }

  return (int64_t)self;
}

- (CKObjCType)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (SEL)getterSelector
{
  return self->_getterSelector;
}

- (SEL)setterSelector
{
  return self->_setterSelector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceVariableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_classHandle, 0);
}

@end