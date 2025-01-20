@interface FBAExpandingTextView
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)resignFirstResponder;
- (FBAExpandingTextView)initWithFrame:(CGRect)a3;
- (NSAttributedString)placeholderAttributedText;
- (NSString)placeholderText;
- (UILabel)placeholderLabel;
- (_TtC18Feedback_Assistant20FBAExpandingTextView)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant20FBAExpandingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (double)heightNeededForContentWidth:(double)a3;
- (void)dealloc;
- (void)didChange:(id)a3;
- (void)layoutSubviews;
- (void)setContentSize:(CGSize)a3;
- (void)setPlaceholderAttributedText:(id)a3;
- (void)setPlaceholderLabel:(id)a3;
- (void)setPlaceholderText:(id)a3;
@end

@implementation FBAExpandingTextView

- (FBAExpandingTextView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)FBAExpandingTextView;
  v3 = -[FBAExpandingTextView initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(FBAExpandingTextView *)v3 setScrollEnabled:0];
    [(FBAExpandingTextView *)v4 setShowsVerticalScrollIndicator:0];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"didChange:" name:UITextViewTextDidChangeNotification object:0];

    id v6 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(FBAExpandingTextView *)v4 setPlaceholderLabel:v6];

    v7 = [(FBAExpandingTextView *)v4 placeholderLabel];
    v8 = +[UIColor secondaryLabelColor];
    [v7 setTextColor:v8];

    v9 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:0];
    v10 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
    v20[0] = v9;
    v11 = +[UIColor systemBackgroundColor];
    v20[1] = v10;
    v21[0] = v11;
    v12 = +[UIColor secondarySystemBackgroundColor];
    v21[1] = v12;
    v13 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    v14 = +[UIColor _dynamicColorWithColorsByTraitCollection:v13];
    [(FBAExpandingTextView *)v4 setBackgroundColor:v14];

    v15 = [(FBAExpandingTextView *)v4 placeholderLabel];
    [v15 setLineBreakMode:0];

    v16 = [(FBAExpandingTextView *)v4 placeholderLabel];
    [v16 setNumberOfLines:0];

    v17 = [(FBAExpandingTextView *)v4 placeholderLabel];
    [(FBAExpandingTextView *)v4 addSubview:v17];
  }
  return v4;
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for FBAExpandingTextView();
  [(FBAExpandingTextView *)&v6 dealloc];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("paste:" != a3) {
    goto LABEL_5;
  }
  v7 = [(FBAExpandingTextView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_5:
    v10.receiver = self;
    v10.super_class = (Class)FBAExpandingTextView;
    unsigned __int8 v8 = [(FBAExpandingTextView *)&v10 canPerformAction:a3 withSender:v6];
    goto LABEL_6;
  }
  unsigned __int8 v8 = [v7 canPerformPaste];

LABEL_6:
  return v8;
}

- (void)didChange:(id)a3
{
  [(FBAExpandingTextView *)self frame];
  double v5 = v4;
  [(FBAExpandingTextView *)self heightNeededForContentWidth:v4];
  -[FBAExpandingTextView setContentSize:](self, "setContentSize:", v5, v6);
  id v8 = [(FBAExpandingTextView *)self placeholderLabel];
  v7 = [(FBAExpandingTextView *)self textStorage];
  [v8 setHidden:[v7 length] != 0];
}

- (double)heightNeededForContentWidth:(double)a3
{
  if (!qword_100124138)
  {
    id v5 = objc_alloc((Class)UITextView);
    [(FBAExpandingTextView *)self frame];
    id v6 = [v5 initWithFrame:];
    v7 = (void *)qword_100124138;
    qword_100124138 = (uint64_t)v6;
  }
  id v8 = [(FBAExpandingTextView *)self text];
  [(id)qword_100124138 setText:v8];

  v9 = [(FBAExpandingTextView *)self font];
  [(id)qword_100124138 setFont:v9];

  [(FBAExpandingTextView *)self textContainerInset];
  [qword_100124138 setTextContainerInset:];
  [qword_100124138 sizeThatFits:a3, 1.79769313e308];
  return v10 + 8.0;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(FBAExpandingTextView *)self contentSize];
  double v7 = v6;
  v9.receiver = self;
  v9.super_class = (Class)FBAExpandingTextView;
  -[FBAExpandingTextView setContentSize:](&v9, "setContentSize:", width, height);
  if (v7 != height)
  {
    id v8 = [(FBAExpandingTextView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 textViewDidChangeContentHeight:self];
    }
  }
}

- (void)setPlaceholderText:(id)a3
{
  id v7 = a3;
  double v4 = [(FBAExpandingTextView *)self placeholderLabel];
  id v5 = [v4 text];
  unsigned __int8 v6 = [v5 isEqualToString:v7];

  if ((v6 & 1) == 0)
  {
    [v4 setText:v7];
    [v4 sizeToFit];
    [(FBAExpandingTextView *)self setNeedsLayout];
  }
}

- (void)setPlaceholderAttributedText:(id)a3
{
  id v9 = a3;
  double v4 = [(FBAExpandingTextView *)self placeholderLabel];
  id v5 = [v4 attributedText];
  unsigned __int8 v6 = [v5 isEqualToAttributedString:v9];

  if ((v6 & 1) == 0)
  {
    id v7 = [(FBAExpandingTextView *)self placeholderLabel];
    [v7 setAttributedText:v9];

    id v8 = [(FBAExpandingTextView *)self placeholderLabel];
    [v8 sizeToFit];

    [(FBAExpandingTextView *)self setNeedsLayout];
  }
}

- (NSString)placeholderText
{
  v2 = [(FBAExpandingTextView *)self placeholderLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)FBAExpandingTextView;
  [(FBAExpandingTextView *)&v15 layoutSubviews];
  v3 = [(FBAExpandingTextView *)self placeholderLabel];
  double v4 = [(FBAExpandingTextView *)self textStorage];
  [v3 setHidden:[v4 length] != 0];

  [(FBAExpandingTextView *)self bounds];
  double v6 = v5 + 10.0;
  double v8 = v7 + 5.0;
  double v10 = v9 + -20.0;
  double v12 = v11 + -10.0;
  v13 = [(FBAExpandingTextView *)self placeholderLabel];
  [v13 setFrame:v6, v8, v10, v12];

  v14 = [(FBAExpandingTextView *)self placeholderLabel];
  [v14 sizeToFit];
}

- (NSAttributedString)placeholderAttributedText
{
  return self->_placeholderAttributedText;
}

- (UILabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)setPlaceholderLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant20FBAExpandingTextView_log));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_100053964();

  return v3 & 1;
}

- (_TtC18Feedback_Assistant20FBAExpandingTextView)initWithCoder:(id)a3
{
  return (_TtC18Feedback_Assistant20FBAExpandingTextView *)sub_100054208(a3);
}

- (_TtC18Feedback_Assistant20FBAExpandingTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4 = a4;
  result = (_TtC18Feedback_Assistant20FBAExpandingTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end