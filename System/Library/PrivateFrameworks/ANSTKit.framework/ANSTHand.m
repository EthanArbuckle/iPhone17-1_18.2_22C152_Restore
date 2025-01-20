@interface ANSTHand
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (ANSTHand)init;
- (ANSTHand)initWithAcObject:(id *)a3;
- (ANSTHand)initWithCoder:(id)a3;
- (ANSTHand)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7;
- (ANSTHand)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7 chirality:(int64_t)a8;
- (id)debugJSONDictionary;
- (id)description;
- (int64_t)chirality;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTHand

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTHand)init
{
  id result = (ANSTHand *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTHand)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7
{
  id v9 = a5;
  id result = (ANSTHand *)objc_msgSend_doesNotRecognizeSelector_(self, v10, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTHand)initWithAcObject:(id *)a3
{
  uint64_t var1 = a3->var1;
  unsigned int var2 = a3->var2;
  if (var2 == 10) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2 * (var2 == 11);
  }
  uint64_t var0 = a3->var0;
  id v9 = ANSTObjectCategoryFromAcDetCategory(var2);
  v11 = (ANSTHand *)objc_msgSend_initWithObjectID_groupID_category_boundingBox_confidence_chirality_(self, v10, var0, var1, v9, a3->var4, v7, a3->var3.var0, a3->var3.var1, a3->var3.var2, a3->var3.var3);

  return v11;
}

- (ANSTHand)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7 chirality:(int64_t)a8
{
  v10.receiver = self;
  v10.super_class = (Class)ANSTHand;
  id result = -[ANSTObject initWithObjectID:groupID:category:boundingBox:confidence:](&v10, sel_initWithObjectID_groupID_category_boundingBox_confidence_, a3, a4, a5, a7, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  result->_chirality = a8;
  return result;
}

- (ANSTHand)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ANSTHand;
  v5 = [(ANSTObject *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5 && sub_246D69F54(v4, &v5->_chirality, sel_chirality)) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ANSTHand;
  id v4 = a3;
  [(ANSTObject *)&v5 encodeWithCoder:v4];
  sub_246D6A070(v4, self->_chirality, sel_chirality);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendFormat_(v3, v4, @"<ANSTHand %p> {\n", self);
  uint64_t v7 = objc_msgSend_objectID(self, v5, v6);
  objc_msgSend_appendFormat_(v3, v8, @"    objectID    %lu\n", v7);
  v11 = objc_msgSend_category(self, v9, v10);
  objc_msgSend_appendFormat_(v3, v12, @"    category    %@\n", v11);

  objc_msgSend_boundingBox(self, v13, v14);
  v19 = sub_246D6990C(v15, v16, v17, v18);
  objc_msgSend_appendFormat_(v3, v20, @"    boundingBox %@\n", v19);

  uint64_t v23 = objc_msgSend_confidence(self, v21, v22);
  objc_msgSend_appendFormat_(v3, v24, @"    confidence  %lu\n", v23);
  objc_msgSend_appendFormat_(v3, v25, @"    chirality   %ld\n", self->_chirality);
  objc_msgSend_appendString_(v3, v26, @"}");
  v29 = objc_msgSend_copy(v3, v27, v28);

  return v29;
}

- (id)debugJSONDictionary
{
  v15.receiver = self;
  v15.super_class = (Class)ANSTHand;
  id v3 = [(ANSTObject *)&v15 debugJSONDictionary];
  uint64_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  unint64_t chirality = self->_chirality;
  if (chirality > 2) {
    v8 = @"ERROR";
  }
  else {
    v8 = off_265203020[chirality];
  }
  objc_super v9 = NSStringFromSelector(sel_chirality);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v10, (uint64_t)v8, v9);

  v13 = objc_msgSend_copy(v6, v11, v12);
  return v13;
}

- (int64_t)chirality
{
  return self->_chirality;
}

@end