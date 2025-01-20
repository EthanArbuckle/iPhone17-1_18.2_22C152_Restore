@interface MessageUITipsManager
+ (void)donateHasSentEmailEvent;
+ (void)donateHasUsedAttachment;
+ (void)setShouldDisplayTo:(BOOL)a3;
- (_TtC9MessageUI20MessageUITipsManager)init;
- (_TtC9MessageUI20MessageUITipsManager)initWith:(id)a3;
- (void)controllerDidAppear;
- (void)controllerDidDisappear;
@end

@implementation MessageUITipsManager

- (_TtC9MessageUI20MessageUITipsManager)initWith:(id)a3
{
  id v3 = a3;
  return (_TtC9MessageUI20MessageUITipsManager *)MessageUITipsManager.init(with:)(a3);
}

- (void)controllerDidAppear
{
  v2 = self;
  sub_1AFA46144();
}

- (void)controllerDidDisappear
{
  v2 = self;
  sub_1AFA471C0();
}

+ (void)setShouldDisplayTo:(BOOL)a3
{
}

+ (void)donateHasUsedAttachment
{
}

+ (void)donateHasSentEmailEvent
{
}

- (_TtC9MessageUI20MessageUITipsManager)init
{
  return (_TtC9MessageUI20MessageUITipsManager *)MessageUITipsManager.init()();
}

- (void).cxx_destruct
{
}

@end