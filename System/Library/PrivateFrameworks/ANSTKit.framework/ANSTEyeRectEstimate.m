@interface ANSTEyeRectEstimate
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (ANSTEyeRectEstimate)init;
- (ANSTEyeRectEstimate)initWithCoder:(id)a3;
- (ANSTEyeRectEstimate)initWithEyeRectLeft:(CGRect)a3 eyeRectRight:(CGRect)a4;
- (CGRect)eyeRectLeft;
- (CGRect)eyeRectRight;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTEyeRectEstimate

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTEyeRectEstimate)init
{
  id result = (ANSTEyeRectEstimate *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTEyeRectEstimate)initWithEyeRectLeft:(CGRect)a3 eyeRectRight:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)ANSTEyeRectEstimate;
  id result = [(ANSTEyeRectEstimate *)&v13 init];
  result->_eyeRectLeft.origin.CGFloat x = v11;
  result->_eyeRectLeft.origin.CGFloat y = v10;
  result->_eyeRectLeft.size.CGFloat width = v9;
  result->_eyeRectLeft.size.CGFloat height = v8;
  result->_eyeRectRight.origin.CGFloat x = x;
  result->_eyeRectRight.origin.CGFloat y = y;
  result->_eyeRectRight.size.CGFloat width = width;
  result->_eyeRectRight.size.CGFloat height = height;
  return result;
}

- (ANSTEyeRectEstimate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ANSTEyeRectEstimate;
  v5 = [(ANSTEyeRectEstimate *)&v8 init];
  if (sub_246D69520(v4, (uint64_t)&v5->_eyeRectLeft, sel_eyeRectLeft)
    && sub_246D69520(v4, (uint64_t)&v5->_eyeRectRight, sel_eyeRectRight))
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
  double x = self->_eyeRectLeft.origin.x;
  double y = self->_eyeRectLeft.origin.y;
  double width = self->_eyeRectLeft.size.width;
  double height = self->_eyeRectLeft.size.height;
  id v8 = a3;
  sub_246D69764(v8, sel_eyeRectLeft, x, y, width, height);
  sub_246D69764(v8, sel_eyeRectRight, self->_eyeRectRight.origin.x, self->_eyeRectRight.origin.y, self->_eyeRectRight.size.width, self->_eyeRectRight.size.height);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendFormat_(v3, v4, @"<ANSTEyeRectEstimate %p> {\n", self);
  v5 = sub_246D6990C(self->_eyeRectLeft.origin.x, self->_eyeRectLeft.origin.y, self->_eyeRectLeft.size.width, self->_eyeRectLeft.size.height);
  objc_msgSend_appendFormat_(v3, v6, @"    eyeRectLeft  %@\n", v5);

  v7 = sub_246D6990C(self->_eyeRectRight.origin.x, self->_eyeRectRight.origin.y, self->_eyeRectRight.size.width, self->_eyeRectRight.size.height);
  objc_msgSend_appendFormat_(v3, v8, @"    eyeRectRight %@\n", v7);

  objc_msgSend_appendString_(v3, v9, @"}");
  v12 = objc_msgSend_copy(v3, v10, v11);

  return v12;
}

- (CGRect)eyeRectLeft
{
  double x = self->_eyeRectLeft.origin.x;
  double y = self->_eyeRectLeft.origin.y;
  double width = self->_eyeRectLeft.size.width;
  double height = self->_eyeRectLeft.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)eyeRectRight
{
  double x = self->_eyeRectRight.origin.x;
  double y = self->_eyeRectRight.origin.y;
  double width = self->_eyeRectRight.size.width;
  double height = self->_eyeRectRight.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end