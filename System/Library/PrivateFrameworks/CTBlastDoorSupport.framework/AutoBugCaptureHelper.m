@interface AutoBugCaptureHelper
- (AutoBugCaptureHelper)init;
- (void)reportWithDomain:(id)a3 type:(id)a4 subtype:(id)a5 subtypeContext:(id)a6;
@end

@implementation AutoBugCaptureHelper

- (void)reportWithDomain:(id)a3 type:(id)a4 subtype:(id)a5 subtypeContext:(id)a6
{
  sub_2495B8670();
  sub_2495B8670();
  sub_2495B8670();
  sub_2495B8670();
  v7 = self;
  sub_2495794B4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (AutoBugCaptureHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)AutoBugCaptureHelper;
  return [(AutoBugCaptureHelper *)&v3 init];
}

@end