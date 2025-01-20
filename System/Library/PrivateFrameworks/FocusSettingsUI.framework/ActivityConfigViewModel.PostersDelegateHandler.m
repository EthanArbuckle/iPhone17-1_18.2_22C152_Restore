@interface ActivityConfigViewModel.PostersDelegateHandler
- (_TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler)init;
- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4;
- (void)modalController:(id)a3 willDismissSheetWithResponse:(id)a4;
@end

@implementation ActivityConfigViewModel.PostersDelegateHandler

- (void)modalController:(id)a3 willDismissSheetWithResponse:(id)a4
{
}

- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4
{
}

- (_TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerWillDismissHandler);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerDidDismissHandler);
  v5 = (objc_class *)type metadata accessor for ActivityConfigViewModel.PostersDelegateHandler();
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(ActivityConfigViewModel.PostersDelegateHandler *)&v7 init];
}

- (void).cxx_destruct
{
  sub_220D67630(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerWillDismissHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC15FocusSettingsUI23ActivityConfigViewModelP33_69469D27B0511CD91350E3DC9D01628B22PostersDelegateHandler_modalControllerDidDismissHandler);
  sub_220D67630(v3);
}

@end