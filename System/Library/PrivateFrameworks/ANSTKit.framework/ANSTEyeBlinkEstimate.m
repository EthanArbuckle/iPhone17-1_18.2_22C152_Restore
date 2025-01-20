@interface ANSTEyeBlinkEstimate
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (ANSTEyeBlinkEstimate)init;
- (ANSTEyeBlinkEstimate)initWithBlinkLeft:(int64_t)a3 blinkRight:(int64_t)a4;
- (ANSTEyeBlinkEstimate)initWithCoder:(id)a3;
- (id)description;
- (int64_t)blinkLeft;
- (int64_t)blinkRight;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTEyeBlinkEstimate

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTEyeBlinkEstimate)init
{
  id result = (ANSTEyeBlinkEstimate *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTEyeBlinkEstimate)initWithBlinkLeft:(int64_t)a3 blinkRight:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ANSTEyeBlinkEstimate;
  id result = [(ANSTEyeBlinkEstimate *)&v7 init];
  result->_blinkLeft = a3;
  result->_blinkRight = a4;
  return result;
}

- (ANSTEyeBlinkEstimate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ANSTEyeBlinkEstimate;
  v5 = [(ANSTEyeBlinkEstimate *)&v8 init];
  if (sub_246D69F54(v4, &v5->_blinkLeft, sel_blinkLeft) && sub_246D69F54(v4, &v5->_blinkRight, sel_blinkRight)) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t blinkLeft = self->_blinkLeft;
  id v5 = a3;
  sub_246D6A070(v5, blinkLeft, sel_blinkLeft);
  sub_246D6A070(v5, self->_blinkRight, sel_blinkRight);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendFormat_(v3, v4, @"<ANSTEyeBlinkEstimate %p> {\n", self);
  objc_msgSend_appendFormat_(v3, v5, @"    blinkLeft  %ld\n", self->_blinkLeft);
  objc_msgSend_appendFormat_(v3, v6, @"    blinkRight %ld\n", self->_blinkRight);
  objc_msgSend_appendString_(v3, v7, @"}");
  v10 = objc_msgSend_copy(v3, v8, v9);

  return v10;
}

- (int64_t)blinkLeft
{
  return self->_blinkLeft;
}

- (int64_t)blinkRight
{
  return self->_blinkRight;
}

@end