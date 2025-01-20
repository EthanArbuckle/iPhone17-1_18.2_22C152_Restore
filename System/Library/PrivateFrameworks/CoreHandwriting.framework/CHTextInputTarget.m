@interface CHTextInputTarget
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInputTarget:(id)a3;
- (CGRect)frame;
- (CHTextInputTarget)initWithCoder:(id)a3;
- (CHTextInputTarget)initWithIdentifier:(id)a3 frame:(CGRect)a4;
- (NSNumber)inputTargetIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHTextInputTarget

- (CHTextInputTarget)initWithIdentifier:(id)a3 frame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHTextInputTarget;
  v15 = [(CHTextInputTarget *)&v19 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend_copy(v9, v10, v11, v12, v13, v14);
    inputTargetIdentifier = v15->_inputTargetIdentifier;
    v15->_inputTargetIdentifier = (NSNumber *)v16;

    v15->_frame.origin.CGFloat x = x;
    v15->_frame.origin.CGFloat y = y;
    v15->_frame.size.CGFloat width = width;
    v15->_frame.size.CGFloat height = height;
  }

  return v15;
}

- (id)description
{
  v10.receiver = self;
  v10.super_class = (Class)CHTextInputTarget;
  v3 = [(CHTextInputTarget *)&v10 description];
  v8 = objc_msgSend_stringByAppendingFormat_(v3, v4, @" ID: %@, frame: {x: %0.1f, y: %0.1f, width: %0.1f, height: %0.1f}", v5, v6, v7, self->_inputTargetIdentifier, *(void *)&self->_frame.origin.x, *(void *)&self->_frame.origin.y, *(void *)&self->_frame.size.width, *(void *)&self->_frame.size.height);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  inputTargetIdentifier = self->_inputTargetIdentifier;
  id v28 = a3;
  objc_msgSend_encodeObject_forKey_(v28, v5, (uint64_t)inputTargetIdentifier, @"inputTargetIdentifier", v6, v7);
  CGFloat x = self->_frame.origin.x;
  *(float *)&CGFloat x = x;
  objc_msgSend_encodeFloat_forKey_(v28, v9, @"frameXOrigin", v10, v11, v12, x);
  CGFloat y = self->_frame.origin.y;
  *(float *)&CGFloat y = y;
  objc_msgSend_encodeFloat_forKey_(v28, v14, @"frameYOrigin", v15, v16, v17, y);
  CGFloat width = self->_frame.size.width;
  *(float *)&CGFloat width = width;
  objc_msgSend_encodeFloat_forKey_(v28, v19, @"frameWidth", v20, v21, v22, width);
  CGFloat height = self->_frame.size.height;
  *(float *)&CGFloat height = height;
  objc_msgSend_encodeFloat_forKey_(v28, v24, @"frameHeight", v25, v26, v27, height);
}

- (CHTextInputTarget)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, @"inputTargetIdentifier", v7, v8);
  objc_msgSend_decodeFloatForKey_(v4, v10, @"frameXOrigin", v11, v12, v13);
  float v15 = v14;
  objc_msgSend_decodeFloatForKey_(v4, v16, @"frameYOrigin", v17, v18, v19);
  float v21 = v20;
  objc_msgSend_decodeFloatForKey_(v4, v22, @"frameWidth", v23, v24, v25);
  float v27 = v26;
  objc_msgSend_decodeFloatForKey_(v4, v28, @"frameHeight", v29, v30, v31);
  float v33 = v32;

  if (v9) {
    self = (CHTextInputTarget *)objc_msgSend_initWithIdentifier_frame_(self, v34, (uint64_t)v9, v35, v36, v37, v15, v21, v27, v33);
  }

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToInputTarget:(id)a3
{
  id v4 = (CHTextInputTarget *)a3;
  uint64_t v10 = v4;
  if (self == v4)
  {
    BOOL v30 = 1;
  }
  else
  {
    inputTargetIdentifier = self->_inputTargetIdentifier;
    objc_msgSend_inputTargetIdentifier(v4, v5, v6, v7, v8, v9);
    uint64_t v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (inputTargetIdentifier == v12)
    {
    }
    else
    {
      uint64_t v18 = v12;
      if (!self->_inputTargetIdentifier)
      {

LABEL_10:
        BOOL v30 = 0;
        goto LABEL_11;
      }
      uint64_t v19 = objc_msgSend_inputTargetIdentifier(v10, v13, v14, v15, v16, v17);
      int isEqualToNumber = objc_msgSend_isEqualToNumber_(v19, v20, (uint64_t)self->_inputTargetIdentifier, v21, v22, v23);

      if (!isEqualToNumber) {
        goto LABEL_10;
      }
    }
    objc_msgSend_frame(v10, v25, v26, v27, v28, v29);
    v36.origin.CGFloat x = v31;
    v36.origin.CGFloat y = v32;
    v36.size.CGFloat width = v33;
    v36.size.CGFloat height = v34;
    BOOL v30 = CGRectEqualToRect(self->_frame, v36);
  }
LABEL_11:

  return v30;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToInputTarget = objc_msgSend_isEqualToInputTarget_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToInputTarget;
  }
  else
  {

    return 0;
  }
}

- (NSNumber)inputTargetIdentifier
{
  return self->_inputTargetIdentifier;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
}

@end