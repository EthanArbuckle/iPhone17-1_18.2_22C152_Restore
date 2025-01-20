@interface HKAVPlayerViewController
- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)init;
- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)initWithCoder:(id)a3;
- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)initWithPlayerLayerView:(id)a3;
- (void)dealloc;
- (void)didBecomeActive;
- (void)willResignActive;
@end

@implementation HKAVPlayerViewController

- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)init
{
  v2 = (char *)self
     + OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground;
  *(void *)v2 = 0;
  v2[8] = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HKAVPlayerViewController();
  v3 = [(HKAVPlayerViewController *)&v9 initWithNibName:0 bundle:0];
  v4 = self;
  v5 = v3;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v5, sel_didBecomeActive, *MEMORY[0x1E4FB2628], 0);

  id v7 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v7, sel_addObserver_selector_name_object_, v5, sel_willResignActive, *MEMORY[0x1E4FB2738], 0);

  return v5;
}

- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)initWithCoder:(id)a3
{
  v4 = (char *)self
     + OBJC_IVAR____TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController_timeControlStatusBeforeBackground;
  *(void *)v4 = 0;
  v4[8] = 1;
  id v5 = a3;

  result = (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *)sub_1C2921060();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for HKAVPlayerViewController();
  [(HKAVPlayerViewController *)&v6 dealloc];
}

- (void)didBecomeActive
{
  v2 = self;
  sub_1C291E87C();
}

- (void)willResignActive
{
  v2 = self;
  sub_1C291E940();
}

- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3 = a3;
  result = (_TtC16HealthArticlesUIP33_5654D5C4E01B31C9F970FE0D4B22B66D24HKAVPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end