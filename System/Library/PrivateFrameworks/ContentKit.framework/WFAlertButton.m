@interface WFAlertButton
+ (id)buttonWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
+ (id)buttonWithTitle:(id)a3 style:(int64_t)a4 preferred:(BOOL)a5 handler:(id)a6;
+ (id)cancelButtonWithHandler:(id)a3;
+ (id)cancelButtonWithTarget:(id)a3 action:(SEL)a4;
+ (id)okButtonWithHandler:(id)a3;
+ (id)okButtonWithTarget:(id)a3 action:(SEL)a4;
- (BOOL)isPreferred;
- (NSArray)alternativeSpeakableMatches;
- (NSString)title;
- (WFAlert)alert;
- (WFAlertButton)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5 preferred:(BOOL)a6;
- (id)handler;
- (int64_t)style;
- (void)setAlert:(id)a3;
- (void)setAlternativeSpeakableMatches:(id)a3;
@end

@implementation WFAlertButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeSpeakableMatches, 0);
  objc_destroyWeak((id *)&self->_alert);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setAlternativeSpeakableMatches:(id)a3
{
}

- (NSArray)alternativeSpeakableMatches
{
  return self->_alternativeSpeakableMatches;
}

- (void)setAlert:(id)a3
{
}

- (WFAlert)alert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alert);
  return (WFAlert *)WeakRetained;
}

- (id)handler
{
  return self->_handler;
}

- (BOOL)isPreferred
{
  return self->_preferred;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)title
{
  return self->_title;
}

- (WFAlertButton)initWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5 preferred:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WFAlertButton;
  v12 = [(WFAlertButton *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    title = v12->_title;
    v12->_title = (NSString *)v13;

    v12->_style = a4;
    uint64_t v15 = [v11 copy];
    id handler = v12->_handler;
    v12->_id handler = (id)v15;

    v12->_preferred = a6;
    v17 = v12;
  }

  return v12;
}

+ (id)buttonWithTitle:(id)a3 style:(int64_t)a4 preferred:(BOOL)a5 handler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  v12 = (void *)[objc_alloc((Class)a1) initWithTitle:v11 style:a4 handler:v10 preferred:v6];

  return v12;
}

+ (id)buttonWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithTitle:v9 style:a4 handler:v8 preferred:0];

  return v10;
}

+ (id)okButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v7 = WFLocalizedString(@"OK");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__WFAlertButton_Convenience__okButtonWithTarget_action___block_invoke;
  v11[3] = &unk_26428A000;
  id v12 = v6;
  SEL v13 = a4;
  id v8 = v6;
  id v9 = [a1 buttonWithTitle:v7 style:0 handler:v11];

  return v9;
}

uint64_t __56__WFAlertButton_Convenience__okButtonWithTarget_action___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 40)];
}

+ (id)cancelButtonWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v7 = WFLocalizedString(@"Cancel");
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__WFAlertButton_Convenience__cancelButtonWithTarget_action___block_invoke;
  v11[3] = &unk_26428A000;
  id v12 = v6;
  SEL v13 = a4;
  id v8 = v6;
  id v9 = [a1 buttonWithTitle:v7 style:1 handler:v11];

  return v9;
}

uint64_t __60__WFAlertButton_Convenience__cancelButtonWithTarget_action___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 40)];
}

+ (id)okButtonWithHandler:(id)a3
{
  id v4 = a3;
  v5 = WFLocalizedString(@"OK");
  id v6 = [a1 buttonWithTitle:v5 style:0 handler:v4];

  return v6;
}

+ (id)cancelButtonWithHandler:(id)a3
{
  id v4 = a3;
  v5 = WFLocalizedString(@"Cancel");
  id v6 = [a1 buttonWithTitle:v5 style:1 handler:v4];

  return v6;
}

@end