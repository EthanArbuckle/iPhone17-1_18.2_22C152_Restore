@interface HUStringInLabelTapGestureRecognizer
- (BOOL)_didTapAttributedTextInLabel:(id)a3 targetRange:(_NSRange)a4 event:(id)a5;
- (BOOL)shouldReceiveEvent:(id)a3;
- (HUStringInLabelTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 hitBoxString:(id)a5 userInfo:(id)a6;
- (NSDictionary)userInfo;
- (NSString)hitboxString;
- (void)setHitboxString:(id)a3;
@end

@implementation HUStringInLabelTapGestureRecognizer

- (HUStringInLabelTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 hitBoxString:(id)a5 userInfo:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HUStringInLabelTapGestureRecognizer;
  v13 = [(HUStringInLabelTapGestureRecognizer *)&v17 initWithTarget:a3 action:a4];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_hitboxString, a5);
    if (v12) {
      v15 = v12;
    }
    else {
      v15 = (void *)MEMORY[0x1E4F1CC08];
    }
    objc_storeStrong((id *)&v14->_userInfo, v15);
  }

  return v14;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [(HUStringInLabelTapGestureRecognizer *)self view];
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [v7 attributedText];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 string];
      id v11 = [(HUStringInLabelTapGestureRecognizer *)self hitboxString];
      uint64_t v12 = [v10 rangeOfString:v11 options:4];
      uint64_t v14 = v13;

      BOOL v15 = -[HUStringInLabelTapGestureRecognizer _didTapAttributedTextInLabel:targetRange:event:](self, "_didTapAttributedTextInLabel:targetRange:event:", v7, v12, v14, v4);
    }
    else
    {
      objc_super v17 = HFLogForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1BE345000, v17, OS_LOG_TYPE_ERROR, "This class currently only supports search in label.attributedText, feel free to add label.text support too!", v19, 2u);
      }

      NSLog(&cfstr_ThisClassCurre_0.isa);
      BOOL v15 = 0;
    }
  }
  else
  {
    v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v16, OS_LOG_TYPE_ERROR, "This class currently only supports UILabel", buf, 2u);
    }

    NSLog(&cfstr_ThisClassCurre.isa);
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_didTapAttributedTextInLabel:(id)a3 targetRange:(_NSRange)a4 event:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F42668]);
  id v11 = objc_alloc(MEMORY[0x1E4F426A0]);
  uint64_t v12 = objc_msgSend(v11, "initWithSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  uint64_t v13 = [v8 attributedText];
  if (v13)
  {
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F426A8]) initWithAttributedString:v13];
    [v10 addTextContainer:v12];
    [v14 addLayoutManager:v10];
    [v12 setLineFragmentPadding:0.0];
    objc_msgSend(v12, "setLineBreakMode:", objc_msgSend(v8, "lineBreakMode"));
    objc_msgSend(v12, "setMaximumNumberOfLines:", objc_msgSend(v8, "numberOfLines"));
    [v8 bounds];
    double v16 = v15;
    double v18 = v17;
    objc_msgSend(v12, "setSize:", v15, v17);
    v19 = [v9 allTouches];
    v20 = [v19 anyObject];
    [v20 locationInView:v8];
    double v22 = v21;
    double v24 = v23;

    [v10 usedRectForTextContainer:v12];
    unint64_t v29 = objc_msgSend(v10, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v12, 0, v22 - -(v26 - (v16 - v25) * 0.5), v24 - -(v28 - (v18 - v27) * 0.5));
    BOOL v31 = v29 >= location && v29 - location < length;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)hitboxString
{
  return self->_hitboxString;
}

- (void)setHitboxString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitboxString, 0);

  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end