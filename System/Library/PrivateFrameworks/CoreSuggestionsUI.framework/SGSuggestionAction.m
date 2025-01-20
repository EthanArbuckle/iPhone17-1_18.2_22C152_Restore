@interface SGSuggestionAction
+ (SGSuggestionAction)actionWithTitle:(id)a3 handler:(id)a4;
- (SGSuggestionAction)initWithTitle:(id)a3 handler:(id)a4;
- (id)title;
- (void)execute;
@end

@implementation SGSuggestionAction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)execute
{
}

- (id)title
{
  return self->_title;
}

- (SGSuggestionAction)initWithTitle:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SGSuggestionAction;
  v9 = [(SGSuggestionAction *)&v13 init];
  if (v9)
  {
    v10 = _Block_copy(v8);
    id handler = v9->_handler;
    v9->_id handler = v10;

    objc_storeStrong((id *)&v9->_title, a3);
  }

  return v9;
}

+ (SGSuggestionAction)actionWithTitle:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTitle:v7 handler:v6];

  return (SGSuggestionAction *)v8;
}

@end