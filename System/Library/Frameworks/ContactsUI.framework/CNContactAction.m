@interface CNContactAction
+ (id)contactActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5;
+ (id)contactActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 destructive:(BOOL)a6;
- (BOOL)canPerformAction;
- (BOOL)isDestructive;
- (BOOL)showBackgroundPlatter;
- (BOOL)wrapTitle;
- (CNContact)contact;
- (CNContactAction)init;
- (CNContactAction)initWithContact:(id)a3;
- (CNContactAction)initWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 destructive:(BOOL)a6;
- (CNContactActionDelegate)delegate;
- (CNMutableContact)mutableContact;
- (NSString)title;
- (SEL)selector;
- (UIColor)color;
- (UIColor)glyphColor;
- (id)addFriendsMenuProvider;
- (id)description;
- (id)target;
- (int64_t)transportType;
- (void)performActionWithSender:(id)a3;
- (void)setColor:(id)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestructive:(BOOL)a3;
- (void)setGlyphColor:(id)a3;
- (void)setShowBackgroundPlatter:(BOOL)a3;
- (void)setTransportType:(int64_t)a3;
- (void)setWrapTitle:(BOOL)a3;
@end

@implementation CNContactAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)canPerformAction
{
  return self->_canPerformAction;
}

- (void)setWrapTitle:(BOOL)a3
{
  self->_wrapTitle = a3;
}

- (BOOL)wrapTitle
{
  return self->_wrapTitle;
}

- (void)setShowBackgroundPlatter:(BOOL)a3
{
  self->_showBackgroundPlatter = a3;
}

- (BOOL)showBackgroundPlatter
{
  return self->_showBackgroundPlatter;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setGlyphColor:(id)a3
{
}

- (UIColor)glyphColor
{
  return self->_glyphColor;
}

- (void)setColor:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (id)target
{
  return self->_target;
}

- (NSString)title
{
  return self->_title;
}

- (void)setContact:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactActionDelegate *)WeakRetained;
}

- (id)addFriendsMenuProvider
{
  return 0;
}

- (id)description
{
  uint64_t v3 = [(CNContactAction *)self target];
  if (v3 && (v4 = (void *)v3, v5 = [(CNContactAction *)self selector], v4, v5))
  {
    v6 = NSString;
    uint64_t v7 = objc_opt_class();
    v8 = [(CNContactAction *)self title];
    v9 = [(CNContactAction *)self target];
    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector([(CNContactAction *)self selector]);
    v12 = [v6 stringWithFormat:@"<%@ %p> \"%@\": -[%@ %@]", v7, self, v8, v10, v11];
  }
  else
  {
    v13 = NSString;
    uint64_t v14 = objc_opt_class();
    v8 = [(CNContactAction *)self contact];
    v12 = [v13 stringWithFormat:@"<%@ %p> : %@", v14, self, v8];
  }

  return v12;
}

- (void)performActionWithSender:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(CNContactAction *)self target];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(CNContactAction *)self selector];

    if (v6)
    {
      uint64_t v7 = [(CNContactAction *)self target];
      objc_msgSend(v7, -[CNContactAction selector](self, "selector"), v9);
    }
  }
  v8 = [(CNContactAction *)self delegate];
  [v8 actionDidFinish:self];
}

- (CNMutableContact)mutableContact
{
  uint64_t v3 = [(CNContactAction *)self contact];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(CNContactAction *)self contact];
  }
  else
  {
    v5 = 0;
  }

  return (CNMutableContact *)v5;
}

- (CNContactAction)initWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 destructive:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNContactAction;
  v12 = [(CNContactAction *)&v17 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    title = v12->_title;
    v12->_title = (NSString *)v13;

    objc_storeStrong(&v12->_target, a4);
    if (a5) {
      SEL v15 = a5;
    }
    else {
      SEL v15 = 0;
    }
    v12->_selector = v15;
    v12->_destructive = a6;
    v12->_showBackgroundPlatter = 1;
  }

  return v12;
}

- (CNContactAction)initWithContact:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNContactAction;
  v6 = [(CNContactAction *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v7->_showBackgroundPlatter = 1;
  }

  return v7;
}

- (CNContactAction)init
{
  return [(CNContactAction *)self initWithTitle:0 target:0 selector:0 destructive:0];
}

+ (id)contactActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5 destructive:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[CNContactAction alloc] initWithTitle:v10 target:v9 selector:a5 destructive:v6];

  return v11;
}

+ (id)contactActionWithTitle:(id)a3 target:(id)a4 selector:(SEL)a5
{
  return (id)[a1 contactActionWithTitle:a3 target:a4 selector:a5 destructive:0];
}

@end