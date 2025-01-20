@interface CKSuggestedReplyButton
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isHighlighted;
- (_TtC7ChatKit22CKSuggestedReplyButton)initWithCoder:(id)a3;
- (_TtC7ChatKit22CKSuggestedReplyButton)initWithFrame:(CGRect)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CKSuggestedReplyButton

- (_TtC7ChatKit22CKSuggestedReplyButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit22CKSuggestedReplyButton____lazy_storage___titleLabel) = 0;
  id v4 = a3;

  result = (_TtC7ChatKit22CKSuggestedReplyButton *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  return [(CKSuggestedReplyButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_18F772170(a3);
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  [(CKSuggestedReplyButton *)v8 setHighlighted:1];
  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  BOOL v9 = [(CKSuggestedReplyButton *)&v11 beginTrackingWithTouch:v6 withEvent:v7];

  return v9;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  [(CKSuggestedReplyButton *)v8 setHighlighted:0];
  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  [(CKSuggestedReplyButton *)&v9 endTrackingWithTouch:v6 withEvent:v7];
}

- (void)cancelTrackingWithEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  [(CKSuggestedReplyButton *)v5 setHighlighted:0];
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for CKSuggestedReplyButton();
  [(CKSuggestedReplyButton *)&v6 cancelTrackingWithEvent:v4];
}

- (_TtC7ChatKit22CKSuggestedReplyButton)initWithFrame:(CGRect)a3
{
  result = (_TtC7ChatKit22CKSuggestedReplyButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit22CKSuggestedReplyButton____lazy_storage___titleLabel));
}

@end