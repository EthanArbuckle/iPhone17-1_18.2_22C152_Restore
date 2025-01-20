@interface PKViewPassController
- (_TtC17CoreSuggestionsUI20PKViewPassController)initWithCoder:(id)a3;
- (_TtC17CoreSuggestionsUI20PKViewPassController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissalPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKViewPassController

- (_TtC17CoreSuggestionsUI20PKViewPassController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1B5BB4220();
}

- (void)dismissalPressed:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B5BB47BC();
}

- (_TtC17CoreSuggestionsUI20PKViewPassController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B5BC9F40();
  }
  id v5 = a4;
  sub_1B5BB4868();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17CoreSuggestionsUI20PKViewPassController_passViewManager));
}

@end