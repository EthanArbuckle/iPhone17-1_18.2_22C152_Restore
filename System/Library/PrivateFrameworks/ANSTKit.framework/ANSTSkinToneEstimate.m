@interface ANSTSkinToneEstimate
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (ANSTSkinToneEstimate)init;
- (ANSTSkinToneEstimate)initWithCoder:(id)a3;
- (ANSTSkinToneEstimate)initWithTypeIConfidence:(int64_t)a3 typeIIConfidence:(int64_t)a4 typeIIIConfidence:(int64_t)a5 typeIVConfidence:(int64_t)a6 typeVConfidence:(int64_t)a7 typeVIConfidence:(int64_t)a8;
- (id)description;
- (int64_t)typeIConfidence;
- (int64_t)typeIIConfidence;
- (int64_t)typeIIIConfidence;
- (int64_t)typeIVConfidence;
- (int64_t)typeVConfidence;
- (int64_t)typeVIConfidence;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTSkinToneEstimate

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTSkinToneEstimate)init
{
  id result = (ANSTSkinToneEstimate *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTSkinToneEstimate)initWithTypeIConfidence:(int64_t)a3 typeIIConfidence:(int64_t)a4 typeIIIConfidence:(int64_t)a5 typeIVConfidence:(int64_t)a6 typeVConfidence:(int64_t)a7 typeVIConfidence:(int64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)ANSTSkinToneEstimate;
  id result = [(ANSTSkinToneEstimate *)&v15 init];
  result->_typeIConfidence = a3;
  result->_typeIIConfidence = a4;
  result->_typeIIIConfidence = a5;
  result->_typeIVConfidence = a6;
  result->_typeVConfidence = a7;
  result->_typeVIConfidence = a8;
  return result;
}

- (ANSTSkinToneEstimate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ANSTSkinToneEstimate;
  v5 = [(ANSTSkinToneEstimate *)&v8 init];
  if (sub_246D69F54(v4, &v5->_typeIConfidence, sel_typeIConfidence)
    && sub_246D69F54(v4, &v5->_typeIIConfidence, sel_typeIIConfidence)
    && sub_246D69F54(v4, &v5->_typeIIIConfidence, sel_typeIIIConfidence)
    && sub_246D69F54(v4, &v5->_typeIVConfidence, sel_typeIVConfidence)
    && sub_246D69F54(v4, &v5->_typeVConfidence, sel_typeVConfidence)
    && sub_246D69F54(v4, &v5->_typeVIConfidence, sel_typeVIConfidence))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t typeIConfidence = self->_typeIConfidence;
  id v5 = a3;
  sub_246D6A070(v5, typeIConfidence, sel_typeIConfidence);
  sub_246D6A070(v5, self->_typeIIConfidence, sel_typeIIConfidence);
  sub_246D6A070(v5, self->_typeIIIConfidence, sel_typeIIIConfidence);
  sub_246D6A070(v5, self->_typeIVConfidence, sel_typeIVConfidence);
  sub_246D6A070(v5, self->_typeVConfidence, sel_typeVConfidence);
  sub_246D6A070(v5, self->_typeVIConfidence, sel_typeVIConfidence);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendFormat_(v3, v4, @"<ANSTSkinToneEstimate %p> {\n", self);
  objc_msgSend_appendFormat_(v3, v5, @"    typeIConf   %ld\n", self->_typeIConfidence);
  objc_msgSend_appendFormat_(v3, v6, @"    typeIIConf  %ld\n", self->_typeIIConfidence);
  objc_msgSend_appendFormat_(v3, v7, @"    typeIIIConf %ld\n", self->_typeIIIConfidence);
  objc_msgSend_appendFormat_(v3, v8, @"    typeIVConf  %ld\n", self->_typeIVConfidence);
  objc_msgSend_appendFormat_(v3, v9, @"    typeVConf   %ld\n", self->_typeVConfidence);
  objc_msgSend_appendFormat_(v3, v10, @"    typeVIConf  %ld\n", self->_typeVIConfidence);
  objc_msgSend_appendString_(v3, v11, @"}");
  v14 = objc_msgSend_copy(v3, v12, v13);

  return v14;
}

- (int64_t)typeIConfidence
{
  return self->_typeIConfidence;
}

- (int64_t)typeIIConfidence
{
  return self->_typeIIConfidence;
}

- (int64_t)typeIIIConfidence
{
  return self->_typeIIIConfidence;
}

- (int64_t)typeIVConfidence
{
  return self->_typeIVConfidence;
}

- (int64_t)typeVConfidence
{
  return self->_typeVConfidence;
}

- (int64_t)typeVIConfidence
{
  return self->_typeVIConfidence;
}

@end