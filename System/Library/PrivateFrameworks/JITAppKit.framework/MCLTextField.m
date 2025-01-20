@interface MCLTextField
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (CGRect)borderRectForBounds:(CGRect)a3;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation MCLTextField

- (CGRect)borderRectForBounds:(CGRect)a3
{
  CGRect v21 = a3;
  v20 = self;
  SEL v19 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField borderRectForBounds:](&v18, sel_borderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(void *)&long long v22 = v3;
  *((void *)&v22 + 1) = v4;
  *(void *)&long long v23 = v5;
  *((void *)&v23 + 1) = v6;
  id location = (id)[(MCLTextField *)v20 delegate];
  if (([location conformsToProtocol:&unk_26DD921E8] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:borderRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(void *)&long long v15 = v7;
    *((void *)&v15 + 1) = v8;
    *(void *)&long long v16 = v9;
    *((void *)&v16 + 1) = v10;
    long long v22 = v15;
    long long v23 = v16;
  }
  objc_storeStrong(&location, 0);
  double v12 = *((double *)&v22 + 1);
  double v11 = *(double *)&v22;
  double v14 = *((double *)&v23 + 1);
  double v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGRect v21 = a3;
  v20 = self;
  SEL v19 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField textRectForBounds:](&v18, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(void *)&long long v22 = v3;
  *((void *)&v22 + 1) = v4;
  *(void *)&long long v23 = v5;
  *((void *)&v23 + 1) = v6;
  id location = (id)[(MCLTextField *)v20 delegate];
  if (([location conformsToProtocol:&unk_26DD921E8] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:textRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(void *)&long long v15 = v7;
    *((void *)&v15 + 1) = v8;
    *(void *)&long long v16 = v9;
    *((void *)&v16 + 1) = v10;
    long long v22 = v15;
    long long v23 = v16;
  }
  objc_storeStrong(&location, 0);
  double v12 = *((double *)&v22 + 1);
  double v11 = *(double *)&v22;
  double v14 = *((double *)&v23 + 1);
  double v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  CGRect v21 = a3;
  v20 = self;
  SEL v19 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField placeholderRectForBounds:](&v18, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(void *)&long long v22 = v3;
  *((void *)&v22 + 1) = v4;
  *(void *)&long long v23 = v5;
  *((void *)&v23 + 1) = v6;
  id location = (id)[(MCLTextField *)v20 delegate];
  if (([location conformsToProtocol:&unk_26DD921E8] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:placeholderRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(void *)&long long v15 = v7;
    *((void *)&v15 + 1) = v8;
    *(void *)&long long v16 = v9;
    *((void *)&v16 + 1) = v10;
    long long v22 = v15;
    long long v23 = v16;
  }
  objc_storeStrong(&location, 0);
  double v12 = *((double *)&v22 + 1);
  double v11 = *(double *)&v22;
  double v14 = *((double *)&v23 + 1);
  double v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  CGRect v21 = a3;
  v20 = self;
  SEL v19 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField editingRectForBounds:](&v18, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(void *)&long long v22 = v3;
  *((void *)&v22 + 1) = v4;
  *(void *)&long long v23 = v5;
  *((void *)&v23 + 1) = v6;
  id location = (id)[(MCLTextField *)v20 delegate];
  if (([location conformsToProtocol:&unk_26DD921E8] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:editingRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(void *)&long long v15 = v7;
    *((void *)&v15 + 1) = v8;
    *(void *)&long long v16 = v9;
    *((void *)&v16 + 1) = v10;
    long long v22 = v15;
    long long v23 = v16;
  }
  objc_storeStrong(&location, 0);
  double v12 = *((double *)&v22 + 1);
  double v11 = *(double *)&v22;
  double v14 = *((double *)&v23 + 1);
  double v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  CGRect v21 = a3;
  v20 = self;
  SEL v19 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField clearButtonRectForBounds:](&v18, sel_clearButtonRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(void *)&long long v22 = v3;
  *((void *)&v22 + 1) = v4;
  *(void *)&long long v23 = v5;
  *((void *)&v23 + 1) = v6;
  id location = (id)[(MCLTextField *)v20 delegate];
  if (([location conformsToProtocol:&unk_26DD921E8] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:clearButtonRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(void *)&long long v15 = v7;
    *((void *)&v15 + 1) = v8;
    *(void *)&long long v16 = v9;
    *((void *)&v16 + 1) = v10;
    long long v22 = v15;
    long long v23 = v16;
  }
  objc_storeStrong(&location, 0);
  double v12 = *((double *)&v22 + 1);
  double v11 = *(double *)&v22;
  double v14 = *((double *)&v23 + 1);
  double v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  CGRect v21 = a3;
  v20 = self;
  SEL v19 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField leftViewRectForBounds:](&v18, sel_leftViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(void *)&long long v22 = v3;
  *((void *)&v22 + 1) = v4;
  *(void *)&long long v23 = v5;
  *((void *)&v23 + 1) = v6;
  id location = (id)[(MCLTextField *)v20 delegate];
  if (([location conformsToProtocol:&unk_26DD921E8] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:leftViewRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(void *)&long long v15 = v7;
    *((void *)&v15 + 1) = v8;
    *(void *)&long long v16 = v9;
    *((void *)&v16 + 1) = v10;
    long long v22 = v15;
    long long v23 = v16;
  }
  objc_storeStrong(&location, 0);
  double v12 = *((double *)&v22 + 1);
  double v11 = *(double *)&v22;
  double v14 = *((double *)&v23 + 1);
  double v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  CGRect v21 = a3;
  v20 = self;
  SEL v19 = a2;
  long long v22 = 0u;
  long long v23 = 0u;
  v18.receiver = self;
  v18.super_class = (Class)MCLTextField;
  -[MCLTextField rightViewRectForBounds:](&v18, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(void *)&long long v22 = v3;
  *((void *)&v22 + 1) = v4;
  *(void *)&long long v23 = v5;
  *((void *)&v23 + 1) = v6;
  id location = (id)[(MCLTextField *)v20 delegate];
  if (([location conformsToProtocol:&unk_26DD921E8] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(location, "textField:rightViewRect:bounds:", v20, v22, v23, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
    *(void *)&long long v15 = v7;
    *((void *)&v15 + 1) = v8;
    *(void *)&long long v16 = v9;
    *((void *)&v16 + 1) = v10;
    long long v22 = v15;
    long long v23 = v16;
  }
  objc_storeStrong(&location, 0);
  double v12 = *((double *)&v22 + 1);
  double v11 = *(double *)&v22;
  double v14 = *((double *)&v23 + 1);
  double v13 = *(double *)&v23;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  double v13 = self;
  SEL v12 = a2;
  SEL v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  char v9 = 0;
  v8.receiver = v13;
  v8.super_class = (Class)MCLTextField;
  char v9 = [(MCLTextField *)&v8 canPerformAction:v11 withSender:location];
  id v7 = (id)[(MCLTextField *)v13 delegate];
  if ([v7 conformsToProtocol:&unk_26DD921E8] & 1) != 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v5 = v13;
    uint64_t v6 = NSStringFromSelector(v11);
    char v14 = objc_msgSend(v7, "textField:canPerformAction:withSender:defaultValue:", v5) & 1;
  }
  else
  {
    char v14 = v9 & 1;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
  return v14 & 1;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  char v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  if ([v12 isEqualToString:@"enablesReturnKeyAutomatically"])
  {
    char v4 = [location[0] BOOLValue];
    [(MCLTextField *)v14 setEnablesReturnKeyAutomatically:v4 & 1];
  }
  else if ([v12 isEqualToString:@"returnKeyType"])
  {
    uint64_t v5 = [location[0] integerValue];
    [(MCLTextField *)v14 setReturnKeyType:v5];
  }
  else if ([v12 isEqualToString:@"keyboardType"])
  {
    uint64_t v6 = [location[0] integerValue];
    [(MCLTextField *)v14 setKeyboardType:v6];
  }
  else if ([v12 isEqualToString:@"autocorrectionType"])
  {
    uint64_t v7 = [location[0] integerValue];
    [(MCLTextField *)v14 setAutocorrectionType:v7];
  }
  else if ([v12 isEqualToString:@"autocapitalizationType"])
  {
    uint64_t v8 = [location[0] integerValue];
    [(MCLTextField *)v14 setAutocapitalizationType:v8];
  }
  else if ([v12 isEqualToString:@"spellCheckingType"])
  {
    uint64_t v9 = [location[0] integerValue];
    [(MCLTextField *)v14 setSpellCheckingType:v9];
  }
  else
  {
    v11.receiver = v14;
    v11.super_class = (Class)MCLTextField;
    [(MCLTextField *)&v11 setValue:location[0] forUndefinedKey:v12];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

@end