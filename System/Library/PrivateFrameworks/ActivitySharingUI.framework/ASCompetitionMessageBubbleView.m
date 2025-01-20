@interface ASCompetitionMessageBubbleView
- (ASCompetitionMessageBubbleView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)result;
- (void)layoutSubviews;
@end

@implementation ASCompetitionMessageBubbleView

- (ASCompetitionMessageBubbleView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ASCompetitionMessageBubbleView;
  v3 = -[ASCompetitionMessageBubbleView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = MessageBubbleBackgroundPlatter();
    uint64_t v5 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v4];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIImageView *)v5;

    [(ASCompetitionMessageBubbleView *)v3 addSubview:v3->_backgroundView];
    v7 = [MEMORY[0x263F827E8] _systemImageNamed:@"message.fill"];
    v8 = [v7 imageWithRenderingMode:2];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
    messageBubbleView = v3->_messageBubbleView;
    v3->_messageBubbleView = (UIImageView *)v9;

    v11 = objc_msgSend(MEMORY[0x263F825C8], "as_lightCompetitionGold");
    [(UIImageView *)v3->_messageBubbleView setTintColor:v11];

    [(ASCompetitionMessageBubbleView *)v3 addSubview:v3->_messageBubbleView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 30.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)ASCompetitionMessageBubbleView;
  [(ASCompetitionMessageBubbleView *)&v4 layoutSubviews];
  -[UIImageView setFrame:](self->_backgroundView, "setFrame:", 0.0, 0.0, 30.0, 30.0);
  -[UIImageView setFrame:](self->_messageBubbleView, "setFrame:", 0.0, 0.0, 23.0, 18.5);
  [(UIImageView *)self->_backgroundView frame];
  double MidX = CGRectGetMidX(v5);
  [(UIImageView *)self->_backgroundView frame];
  -[UIImageView setCenter:](self->_messageBubbleView, "setCenter:", MidX, CGRectGetMidY(v6) + 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBubbleView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end