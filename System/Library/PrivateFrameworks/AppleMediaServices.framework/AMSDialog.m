@interface AMSDialog
+ (id)dialogWithTitle:(id)a3 message:(id)a4;
+ (id)dialogWithTitle:(id)a3 message:(id)a4 style:(int64_t)a5;
- (AMSDialog)initWithTitle:(id)a3 message:(id)a4 style:(int64_t)a5;
- (NSArray)buttons;
- (NSArray)textFields;
- (NSImage)icon;
- (NSString)message;
- (NSString)title;
- (id)completionHandler;
- (int64_t)selectedButtonIndex;
- (int64_t)style;
- (void)addButton:(id)a3;
- (void)addTextField:(id)a3;
- (void)setButtons:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setIcon:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSelectedButtonIndex:(int64_t)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTextFields:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AMSDialog

- (AMSDialog)initWithTitle:(id)a3 message:(id)a4 style:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AMSDialog;
  v11 = [(AMSDialog *)&v15 init];
  if (v11)
  {
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AMSDialog.systemDialogs", 0);
    systemDialogQueue = v11->_systemDialogQueue;
    v11->_systemDialogQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v11->_title, a3);
    objc_storeStrong((id *)&v11->_message, a4);
    v11->_style = a5;
  }

  return v11;
}

+ (id)dialogWithTitle:(id)a3 message:(id)a4
{
  return (id)[a1 dialogWithTitle:a3 message:a4 style:0];
}

+ (id)dialogWithTitle:(id)a3 message:(id)a4 style:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[AMSDialog alloc] initWithTitle:v8 message:v7 style:a5];

  return v9;
}

- (void)addButton:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDialog *)self buttons];
  v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v9 = v8;

  [v9 addObject:v4];
  [(AMSDialog *)self setButtons:v9];
}

- (void)addTextField:(id)a3
{
  id v4 = a3;
  v5 = [(AMSDialog *)self textFields];
  v6 = (void *)[v5 mutableCopy];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v9 = v8;

  [v9 addObject:v4];
  [(AMSDialog *)self setTextFields:v9];
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)selectedButtonIndex
{
  return self->_selectedButtonIndex;
}

- (void)setSelectedButtonIndex:(int64_t)a3
{
  self->_selectedButtonIndex = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSArray)textFields
{
  return self->_textFields;
}

- (void)setTextFields:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_systemDialogQueue, 0);
}

@end