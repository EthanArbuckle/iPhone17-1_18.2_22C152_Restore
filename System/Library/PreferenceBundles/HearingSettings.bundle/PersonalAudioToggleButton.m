@interface PersonalAudioToggleButton
+ (id)linkWithTitle:(id)a3;
- (CAShapeLayer)border;
- (NSString)title;
- (void)buttonPressed:(id)a3;
- (void)setBorder:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PersonalAudioToggleButton

+ (id)linkWithTitle:(id)a3
{
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___PersonalAudioToggleButton;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v13, "buttonWithType:", 0);
  objc_msgSend(v4, "setTitle:forState:", v3, 0, v13.receiver, v13.super_class);

  v5 = [v4 layer];
  id v6 = +[UIColor systemBlueColor];
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

  v7 = [v4 layer];
  [v7 setBorderWidth:2.0];

  v8 = +[UIColor clearColor];
  [v4 setTintColor:v8];

  [v4 setClipsToBounds:1];
  [v4 _setContinuousCornerRadius:5.0];
  v9 = +[UIColor systemBlueColor];
  [v4 setTitleColor:v9 forState:0];

  v10 = [v4 titleLabel];
  [v10 setLineBreakMode:0];

  v11 = [[TapOffGestureRecognizer alloc] initWithTarget:v4 action:"buttonPressed:"];
  [(TapOffGestureRecognizer *)v11 setCancelsTouchesInView:0];
  [v4 addGestureRecognizer:v11];

  return v4;
}

- (void)buttonPressed:(id)a3
{
  id v14 = a3;
  if ((uint64_t)[v14 state] < 1 || (uint64_t)objc_msgSend(v14, "state") > 2)
  {
    v11 = +[UIColor whiteColor];
    [(PersonalAudioToggleButton *)self setBackgroundColor:v11];

    v12 = [(PersonalAudioToggleButton *)self layer];
    [v12 setBorderWidth:2.0];

    objc_super v13 = +[UIColor systemBlueColor];
    [(PersonalAudioToggleButton *)self setTitleColor:v13 forState:0];

    v8 = +[PASettings sharedInstance];
    v9 = v8;
    uint64_t v10 = 1;
  }
  else
  {
    v4 = [(PersonalAudioToggleButton *)self layer];
    [v4 setBorderWidth:0.0];

    v5 = +[UIColor systemBlueColor];
    [(PersonalAudioToggleButton *)self setBackgroundColor:v5];

    id v6 = +[UIColor whiteColor];
    [(PersonalAudioToggleButton *)self setTitleColor:v6 forState:0];

    v7 = +[PASettings sharedInstance];
    LODWORD(v6) = [v7 personalMediaEnabled];

    if (!v6) {
      goto LABEL_7;
    }
    v8 = +[PASettings sharedInstance];
    v9 = v8;
    uint64_t v10 = 0;
  }
  [v8 setPersonalMediaEnabled:v10];

LABEL_7:
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (CAShapeLayer)border
{
  return self->_border;
}

- (void)setBorder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_border, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end