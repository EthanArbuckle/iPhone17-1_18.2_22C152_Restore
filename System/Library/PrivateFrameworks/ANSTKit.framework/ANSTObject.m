@interface ANSTObject
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (ANSTObject)init;
- (ANSTObject)initWithAcObject:(id *)a3;
- (ANSTObject)initWithCoder:(id)a3;
- (ANSTObject)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7;
- (CGRect)boundingBox;
- (NSString)category;
- (id)debugJSONDictionary;
- (id)description;
- (unint64_t)confidence;
- (unint64_t)groupID;
- (unint64_t)objectID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTObject

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTObject)init
{
  id result = (ANSTObject *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTObject)initWithAcObject:(id *)a3
{
  uint64_t var0 = a3->var0;
  uint64_t var1 = a3->var1;
  v7 = ANSTObjectCategoryFromAcDetCategory(a3->var2);
  v9 = (ANSTObject *)objc_msgSend_initWithObjectID_groupID_category_boundingBox_confidence_(self, v8, var0, var1, v7, a3->var4, a3->var3.var0, a3->var3.var1, a3->var3.var2, a3->var3.var3);

  return v9;
}

- (ANSTObject)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)ANSTObject;
  id v14 = a5;
  v15 = [(ANSTObject *)&v21 init];
  v15->_objectID = a3;
  uint64_t v18 = objc_msgSend_copy(v14, v16, v17, v21.receiver, v21.super_class);

  categorCGFloat y = v15->_category;
  v15->_categorCGFloat y = (NSString *)v18;

  v15->_boundingBox.origin.CGFloat x = x;
  v15->_boundingBox.origin.CGFloat y = y;
  v15->_boundingBox.size.CGFloat width = width;
  v15->_boundingBox.size.CGFloat height = height;
  v15->_confidence = a7;
  v15->_groupID = a4;
  return v15;
}

- (ANSTObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ANSTObject;
  v5 = [(ANSTObject *)&v14 init];
  if (!sub_246D69480(v4, (uint64_t *)&v5->_objectID, sel_objectID)) {
    goto LABEL_7;
  }
  if (!sub_246D69480(v4, (uint64_t *)&v5->_groupID, sel_groupID)) {
    goto LABEL_7;
  }
  if (!sub_246D69480(v4, (uint64_t *)&v5->_confidence, sel_confidence)) {
    goto LABEL_7;
  }
  if (!sub_246D69520(v4, (uint64_t)&v5->_boundingBox, sel_boundingBox)) {
    goto LABEL_7;
  }
  id v6 = v4;
  uint64_t v7 = objc_opt_class();
  v8 = NSStringFromSelector(sel_category);
  uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v6, v9, v7, v8);

  categorCGFloat y = v5->_category;
  v5->_categorCGFloat y = (NSString *)v10;

  if (v5->_category) {
    v12 = v5;
  }
  else {
LABEL_7:
  }
    v12 = 0;

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  sub_246D696D0(v4, self->_objectID, sel_objectID);
  categorCGFloat y = self->_category;
  id v9 = v4;
  id v6 = category;
  uint64_t v7 = NSStringFromSelector(sel_category);
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)v6, v7);

  sub_246D69764(v9, sel_boundingBox, self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  sub_246D696D0(v9, self->_confidence, sel_confidence);
  sub_246D696D0(v9, self->_groupID, sel_groupID);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendFormat_(v3, v4, @"<ANSTObject %p> {\n", self);
  objc_msgSend_appendFormat_(v3, v5, @"    objectID    %lu\n", self->_objectID);
  objc_msgSend_appendFormat_(v3, v6, @"    groupID     %lu\n", self->_groupID);
  objc_msgSend_appendFormat_(v3, v7, @"    category    %@\n", self->_category);
  v8 = sub_246D6990C(self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
  objc_msgSend_appendFormat_(v3, v9, @"    boundingBox %@\n", v8);

  objc_msgSend_appendFormat_(v3, v10, @"    confidence  %lu\n", self->_confidence);
  objc_msgSend_appendString_(v3, v11, @"}");
  objc_super v14 = objc_msgSend_copy(v3, v12, v13);

  return v14;
}

- (id)debugJSONDictionary
{
  id v3 = objc_opt_new();
  v5 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v4, self->_objectID);
  id v6 = NSStringFromSelector(sel_objectID);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v7, (uint64_t)v5, v6);

  id v9 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v8, self->_groupID);
  uint64_t v10 = NSStringFromSelector(sel_groupID);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v11, (uint64_t)v9, v10);

  categorCGFloat y = self->_category;
  uint64_t v13 = NSStringFromSelector(sel_category);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v14, (uint64_t)category, v13);

  uint64_t v18 = sub_246D69BE8(self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height, v15, v16, v17);
  v19 = NSStringFromSelector(sel_boundingBox);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v20, (uint64_t)v18, v19);

  v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v21, self->_confidence);
  v23 = NSStringFromSelector(sel_confidence);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v22, v23);

  v27 = objc_msgSend_copy(v3, v25, v26);
  return v27;
}

- (unint64_t)objectID
{
  return self->_objectID;
}

- (unint64_t)groupID
{
  return self->_groupID;
}

- (NSString)category
{
  return self->_category;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
}

@end