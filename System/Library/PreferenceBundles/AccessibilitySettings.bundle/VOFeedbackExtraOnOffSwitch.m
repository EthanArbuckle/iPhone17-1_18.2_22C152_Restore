@interface VOFeedbackExtraOnOffSwitch
- (VOFeedbackExtraOnOffSwitch)initWithTitle:(id)a3 setter:(id)a4 getter:(id)a5;
- (id)getter;
- (id)setter;
- (id)title;
- (void)setGetter:(id)a3;
- (void)setSetter:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VOFeedbackExtraOnOffSwitch

- (VOFeedbackExtraOnOffSwitch)initWithTitle:(id)a3 setter:(id)a4 getter:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)VOFeedbackExtraOnOffSwitch;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(VOFeedbackExtraOnOffSwitch *)&v12 init];
  -[VOFeedbackExtraOnOffSwitch setTitle:](v10, "setTitle:", v9, v12.receiver, v12.super_class);

  [(VOFeedbackExtraOnOffSwitch *)v10 setSetter:v8];
  [(VOFeedbackExtraOnOffSwitch *)v10 setGetter:v7];

  return v10;
}

- (id)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)setter
{
  return self->_setter;
}

- (void)setSetter:(id)a3
{
}

- (id)getter
{
  return self->_getter;
}

- (void)setGetter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_getter, 0);
  objc_storeStrong(&self->_setter, 0);

  objc_storeStrong(&self->_title, 0);
}

@end