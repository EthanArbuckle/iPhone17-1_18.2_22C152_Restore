@interface ANSTSmileEstimate
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (ANSTSmileEstimate)init;
- (ANSTSmileEstimate)initWithCoder:(id)a3;
- (ANSTSmileEstimate)initWithSmile:(int64_t)a3;
- (id)description;
- (int64_t)smile;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTSmileEstimate

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTSmileEstimate)init
{
  id result = (ANSTSmileEstimate *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTSmileEstimate)initWithSmile:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ANSTSmileEstimate;
  id result = [(ANSTSmileEstimate *)&v5 init];
  result->_smile = a3;
  return result;
}

- (ANSTSmileEstimate)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ANSTSmileEstimate;
  id v3 = a3;
  v4 = [(ANSTSmileEstimate *)&v8 init];
  BOOL v5 = sub_246D69F54(v3, &v4->_smile, sel_smile);

  if (v5) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendFormat_(v3, v4, @"<ANSTSmileEstimate %p> {\n", self);
  objc_msgSend_appendFormat_(v3, v5, @"    smile %ld\n", self->_smile);
  objc_msgSend_appendString_(v3, v6, @"}");
  v9 = objc_msgSend_copy(v3, v7, v8);

  return v9;
}

- (int64_t)smile
{
  return self->_smile;
}

@end