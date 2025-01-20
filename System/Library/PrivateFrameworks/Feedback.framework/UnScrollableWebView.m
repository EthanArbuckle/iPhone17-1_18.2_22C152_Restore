@interface UnScrollableWebView
- (_TtC8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D19UnScrollableWebView)initWithCoder:(id)a3;
- (_TtC8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D19UnScrollableWebView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UnScrollableWebView

- (_TtC8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D19UnScrollableWebView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for UnScrollableWebView();
  id v9 = a4;
  v10 = -[UnScrollableWebView initWithFrame:configuration:](&v13, sel_initWithFrame_configuration_, v9, x, y, width, height);
  id v11 = [(UnScrollableWebView *)v10 scrollView];
  objc_msgSend(v11, sel_setBouncesVertically_, 0);

  return v10;
}

- (_TtC8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D19UnScrollableWebView)initWithCoder:(id)a3
{
  result = (_TtC8FeedbackP33_A8ABDB21747C1062E707FA1890A6718D19UnScrollableWebView *)sub_23D0060A8();
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

@end