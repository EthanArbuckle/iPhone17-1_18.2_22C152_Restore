@interface IATextInputActionsSessionKeyboardDockItemButtonPressAction
+ (BOOL)supportsSecureCoding;
- (CGPoint)touchDownPoint;
- (CGPoint)touchUpPoint;
- (CGSize)buttonSize;
- (IATextInputActionsSessionKeyboardDockItemButtonPressAction)initWithCoder:(id)a3;
- (double)touchDuration;
- (id)description;
- (int64_t)inputActionCount;
- (int64_t)uiOrientation;
- (unint64_t)buttonPressResult;
- (unint64_t)buttonType;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonPressResult:(unint64_t)a3;
- (void)setButtonSize:(CGSize)a3;
- (void)setButtonType:(unint64_t)a3;
- (void)setTouchDownPoint:(CGPoint)a3;
- (void)setTouchDuration:(double)a3;
- (void)setTouchUpPoint:(CGPoint)a3;
- (void)setUiOrientation:(int64_t)a3;
@end

@implementation IATextInputActionsSessionKeyboardDockItemButtonPressAction

- (id)description
{
  v51.receiver = self;
  v51.super_class = (Class)IATextInputActionsSessionKeyboardDockItemButtonPressAction;
  v3 = [(IATextInputActionsSessionAction *)&v51 description];
  v7 = objc_msgSend_array(MEMORY[0x263EFF980], v4, v5, v6);
  v8 = NSString;
  uint64_t v12 = objc_msgSend_buttonType(self, v9, v10, v11);
  v15 = objc_msgSend_stringForKeyboardDockItemButtonType_(IATextInputActionsUtils, v13, v12, v14);
  v18 = objc_msgSend_stringWithFormat_(v8, v16, @"buttonType=%@", v17, v15);
  objc_msgSend_addObject_(v7, v19, (uint64_t)v18, v20);

  v21 = NSString;
  uint64_t v25 = objc_msgSend_buttonPressResult(self, v22, v23, v24);
  v28 = objc_msgSend_stringForKeyboardDockItemButtonPressResult_(IATextInputActionsUtils, v26, v25, v27);
  v31 = objc_msgSend_stringWithFormat_(v21, v29, @"buttonPressResult=%@", v30, v28);
  objc_msgSend_addObject_(v7, v32, (uint64_t)v31, v33);

  v34 = NSString;
  uint64_t v38 = objc_msgSend_uiOrientation(self, v35, v36, v37);
  v41 = objc_msgSend_stringWithFormat_(v34, v39, @"uiOrientation=%lu", v40, v38);
  objc_msgSend_addObject_(v7, v42, (uint64_t)v41, v43);

  v46 = objc_msgSend_componentsJoinedByString_(v7, v44, @", ", v45);
  v49 = objc_msgSend_stringByAppendingFormat_(v3, v47, @", %@", v48, v46);

  return v49;
}

- (int64_t)inputActionCount
{
  uint64_t v5 = objc_msgSend_buttonPressResult(self, a2, v2, v3);
  int64_t result = objc_msgSend_inputActionCountFromMergedActions(self, v6, v7, v8);
  if (v5 != 2) {
    ++result;
  }
  return result;
}

- (unint64_t)buttonPressResult
{
  return self->_buttonPressResult;
}

- (void)setButtonPressResult:(unint64_t)a3
{
  self->_buttonPressResult = a3;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (int64_t)uiOrientation
{
  return self->_uiOrientation;
}

- (void)setUiOrientation:(int64_t)a3
{
  self->_uiOrientation = a3;
}

- (CGSize)buttonSize
{
  double width = self->_buttonSize.width;
  double height = self->_buttonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setButtonSize:(CGSize)a3
{
  self->_buttonSize = a3;
}

- (CGPoint)touchDownPoint
{
  double x = self->_touchDownPoint.x;
  double y = self->_touchDownPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchDownPoint:(CGPoint)a3
{
  self->_touchDownPoint = a3;
}

- (CGPoint)touchUpPoint
{
  double x = self->_touchUpPoint.x;
  double y = self->_touchUpPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTouchUpPoint:(CGPoint)a3
{
  self->_touchUpPoint = a3;
}

- (double)touchDuration
{
  return self->_touchDuration;
}

- (void)setTouchDuration:(double)a3
{
  self->_touchDuration = a3;
}

- (IATextInputActionsSessionKeyboardDockItemButtonPressAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v77.receiver = self;
  v77.super_class = (Class)IATextInputActionsSessionKeyboardDockItemButtonPressAction;
  uint64_t v5 = [(IATextInputActionsSessionAction *)&v77 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"buttonPressResult");
    v5->_buttonPressResult = objc_msgSend_unsignedLongValue(v8, v9, v10, v11);

    uint64_t v12 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, @"buttonType");
    v5->_buttonType = objc_msgSend_unsignedLongValue(v14, v15, v16, v17);

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"uiOrientation");
    v5->_uiOrientation = objc_msgSend_longValue(v20, v21, v22, v23);

    uint64_t v24 = objc_opt_class();
    v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, @"buttonSize_width");
    objc_msgSend_doubleValue(v26, v27, v28, v29);
    CGFloat v31 = v30;
    uint64_t v32 = objc_opt_class();
    v34 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, @"buttonSize_height");
    objc_msgSend_doubleValue(v34, v35, v36, v37);
    v5->_buttonSize.double width = v31;
    v5->_buttonSize.double height = v38;

    uint64_t v39 = objc_opt_class();
    v41 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, @"touchDownPoint_x");
    objc_msgSend_doubleValue(v41, v42, v43, v44);
    CGFloat v46 = v45;
    uint64_t v47 = objc_opt_class();
    v49 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v47, @"touchDownPoint_y");
    objc_msgSend_doubleValue(v49, v50, v51, v52);
    v5->_touchDownPoint.double x = v46;
    v5->_touchDownPoint.double y = v53;

    uint64_t v54 = objc_opt_class();
    v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"touchUpPoint_x");
    objc_msgSend_doubleValue(v56, v57, v58, v59);
    CGFloat v61 = v60;
    uint64_t v62 = objc_opt_class();
    v64 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v62, @"touchUpPoint_y");
    objc_msgSend_doubleValue(v64, v65, v66, v67);
    v5->_touchUpPoint.double x = v61;
    v5->_touchUpPoint.double y = v68;

    uint64_t v69 = objc_opt_class();
    v71 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v70, v69, @"touchDuration");
    objc_msgSend_doubleValue(v71, v72, v73, v74);
    v5->_touchDuration = v75;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v52.receiver = self;
  v52.super_class = (Class)IATextInputActionsSessionKeyboardDockItemButtonPressAction;
  id v4 = a3;
  [(IATextInputActionsSessionAction *)&v52 encodeWithCoder:v4];
  uint64_t v7 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v5, self->_buttonPressResult, v6, v52.receiver, v52.super_class);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"buttonPressResult");

  uint64_t v11 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v9, self->_buttonType, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"buttonType");

  v15 = objc_msgSend_numberWithLong_(NSNumber, v13, self->_uiOrientation, v14);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, @"uiOrientation");

  uint64_t v20 = objc_msgSend_numberWithDouble_(NSNumber, v17, v18, v19, self->_buttonSize.width);
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, @"buttonSize_width");

  uint64_t v25 = objc_msgSend_numberWithDouble_(NSNumber, v22, v23, v24, self->_buttonSize.height);
  objc_msgSend_encodeObject_forKey_(v4, v26, (uint64_t)v25, @"buttonSize_height");

  double v30 = objc_msgSend_numberWithDouble_(NSNumber, v27, v28, v29, self->_touchDownPoint.x);
  objc_msgSend_encodeObject_forKey_(v4, v31, (uint64_t)v30, @"touchDownPoint_x");

  v35 = objc_msgSend_numberWithDouble_(NSNumber, v32, v33, v34, self->_touchDownPoint.y);
  objc_msgSend_encodeObject_forKey_(v4, v36, (uint64_t)v35, @"touchDownPoint_y");

  uint64_t v40 = objc_msgSend_numberWithDouble_(NSNumber, v37, v38, v39, self->_touchUpPoint.x);
  objc_msgSend_encodeObject_forKey_(v4, v41, (uint64_t)v40, @"touchUpPoint_x");

  double v45 = objc_msgSend_numberWithDouble_(NSNumber, v42, v43, v44, self->_touchUpPoint.y);
  objc_msgSend_encodeObject_forKey_(v4, v46, (uint64_t)v45, @"touchUpPoint_y");

  v50 = objc_msgSend_numberWithDouble_(NSNumber, v47, v48, v49, self->_touchDuration);
  objc_msgSend_encodeObject_forKey_(v4, v51, (uint64_t)v50, @"touchDuration");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end