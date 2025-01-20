@interface ActivityConfigViewModel.FocusAssertionListener
- (_TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22FocusAssertionListener)init;
- (void)didUpdateActiveModesForActivationManager:(id)a3 assertion:(id)a4;
@end

@implementation ActivityConfigViewModel.FocusAssertionListener

- (void)didUpdateActiveModesForActivationManager:(id)a3 assertion:(id)a4
{
  v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22FocusAssertionListener_modeActivationDidChange);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  swift_retain();
  v6(a4);

  swift_release();
}

- (_TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22FocusAssertionListener)init
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22FocusAssertionListener_modeActivationDidChange);
  void *v2 = nullsub_1;
  v2[1] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ActivityConfigViewModel.FocusAssertionListener();
  return [(ActivityConfigViewModel.FocusAssertionListener *)&v4 init];
}

- (void).cxx_destruct
{
}

@end