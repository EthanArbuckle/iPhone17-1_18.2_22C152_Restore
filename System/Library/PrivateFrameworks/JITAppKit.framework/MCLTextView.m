@interface MCLTextView
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (MCLTextView)initWithFrame:(CGRect)a3;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (void)onLongPress:(id)a3;
- (void)onTap:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation MCLTextView

- (MCLTextView)initWithFrame:(CGRect)a3
{
  CGRect v14 = a3;
  SEL v12 = a2;
  v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)MCLTextView;
  v13 = -[MCLTextView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    id v3 = objc_alloc(MEMORY[0x263F82CB0]);
    uint64_t v4 = [v3 initWithTarget:v13 action:sel_onTap_];
    tapGestureRecognizer = v13->_tapGestureRecognizer;
    v13->_tapGestureRecognizer = (UITapGestureRecognizer *)v4;

    [(MCLTextView *)v13 addGestureRecognizer:v13->_tapGestureRecognizer];
    id v6 = objc_alloc(MEMORY[0x263F82938]);
    uint64_t v7 = [v6 initWithTarget:v13 action:sel_onLongPress_];
    longPressGestureRecognizer = v13->_longPressGestureRecognizer;
    v13->_longPressGestureRecognizer = (UILongPressGestureRecognizer *)v7;

    [(MCLTextView *)v13 addGestureRecognizer:v13->_longPressGestureRecognizer];
    [(MCLTextView *)v13 setSelectable:0];
  }
  v10 = v13;
  objc_storeStrong((id *)&v13, 0);
  return v10;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v13 = self;
  SEL v12 = a2;
  SEL v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  char v9 = 0;
  v8.receiver = v13;
  v8.super_class = (Class)MCLTextView;
  char v9 = [(MCLTextView *)&v8 canPerformAction:v11 withSender:location];
  id v7 = (id)[(MCLTextView *)v13 delegate];
  if ([v7 conformsToProtocol:&unk_26DD92188] & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v5 = v13;
    id v6 = NSStringFromSelector(v11);
    char v14 = objc_msgSend(v7, "textView:canPerformAction:withSender:defaultValue:", v5) & 1;
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
    [(MCLTextView *)v14 setEnablesReturnKeyAutomatically:v4 & 1];
  }
  else if ([v12 isEqualToString:@"returnKeyType"])
  {
    uint64_t v5 = [location[0] integerValue];
    [(MCLTextView *)v14 setReturnKeyType:v5];
  }
  else if ([v12 isEqualToString:@"keyboardType"])
  {
    uint64_t v6 = [location[0] integerValue];
    [(MCLTextView *)v14 setKeyboardType:v6];
  }
  else if ([v12 isEqualToString:@"autocorrectionType"])
  {
    uint64_t v7 = [location[0] integerValue];
    [(MCLTextView *)v14 setAutocorrectionType:v7];
  }
  else if ([v12 isEqualToString:@"autocapitalizationType"])
  {
    uint64_t v8 = [location[0] integerValue];
    [(MCLTextView *)v14 setAutocapitalizationType:v8];
  }
  else if ([v12 isEqualToString:@"spellCheckingType"])
  {
    uint64_t v9 = [location[0] integerValue];
    [(MCLTextView *)v14 setSpellCheckingType:v9];
  }
  else
  {
    v11.receiver = v14;
    v11.super_class = (Class)MCLTextView;
    [(MCLTextView *)&v11 setValue:location[0] forUndefinedKey:v12];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)onTap:(id)a3
{
  uint64_t v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = (id)[(MCLTextView *)v8 delegate];
  if (objc_opt_respondsToSelector())
  {
    [location[0] locationInView:v8];
    v5[1] = v3;
    v5[2] = v4;
    v5[0] = 0;
    objc_storeStrong(v5, 0);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)onLongPress:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void).cxx_destruct
{
}

@end