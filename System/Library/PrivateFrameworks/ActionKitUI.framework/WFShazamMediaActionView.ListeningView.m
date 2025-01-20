@interface WFShazamMediaActionView.ListeningView
+ (Class)layerClass;
- (SHListeningLayer)layer;
- (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView)initWithCoder:(id)a3;
- (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView)initWithFrame:(CGRect)a3;
@end

@implementation WFShazamMediaActionView.ListeningView

+ (Class)layerClass
{
  swift_getObjCClassMetadata();
  sub_22BF23070();
  return (Class)swift_getObjCClassFromMetadata();
}

- (SHListeningLayer)layer
{
  v2 = self;
  v3 = (void *)sub_22BF230E0();

  return (SHListeningLayer *)v3;
}

- (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView)initWithFrame:(CGRect)a3
{
  return (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView *)sub_22BF23150(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView)initWithCoder:(id)a3
{
  return (_TtCC11ActionKitUI23WFShazamMediaActionViewP33_6EAF142696076E68A50FC830706E4C9D13ListeningView *)sub_22BF231DC(a3);
}

@end