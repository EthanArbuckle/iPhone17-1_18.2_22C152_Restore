@interface GKPlayerGroupView
+ (id)create;
- (GKDashboardPlayerPhotoView)playerView1;
- (GKDashboardPlayerPhotoView)playerView2;
- (GKDashboardPlayerPhotoView)playerView3;
- (GKDashboardPlayerPhotoView)playerView4;
- (GKDashboardPlayerPhotoView)playerView5;
- (GKDashboardPlayerPhotoView)playerView6;
- (GKDashboardPlayerPhotoView)playerView7;
- (NSLayoutConstraint)playerView1LeadingConstraint;
- (NSLayoutConstraint)playerView1TopConstraint;
- (NSLayoutConstraint)playerView1WidthContraint;
- (NSLayoutConstraint)playerView2BottomConstraint;
- (NSLayoutConstraint)playerView2TrailingConstraint;
- (NSLayoutConstraint)playerView2WidthContraint;
- (NSLayoutConstraint)playerView3BottomConstraint;
- (NSLayoutConstraint)playerView3LeadingConstraint;
- (NSLayoutConstraint)playerView3WidthContraint;
- (NSLayoutConstraint)playerView4TopConstraint;
- (NSLayoutConstraint)playerView4TrailingConstraint;
- (NSLayoutConstraint)playerView4WidthContraint;
- (NSLayoutConstraint)playerView5BottomConstraint;
- (NSLayoutConstraint)playerView5LeadingConstraint;
- (NSLayoutConstraint)playerView5WidthContraint;
- (NSLayoutConstraint)playerView6LeadingConstraint;
- (NSLayoutConstraint)playerView6TopConstraint;
- (NSLayoutConstraint)playerView6WidthContraint;
- (NSLayoutConstraint)playerView7BottomConstraint;
- (NSLayoutConstraint)playerView7LeadingConstraint;
- (NSLayoutConstraint)playerView7WidthContraint;
- (UIView)iconContainer;
- (_TtC12GameCenterUI17GKPlayerGroupView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI17GKPlayerGroupView)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)configureWithPlayers:(id)a3 messagesGroupIdentifier:(id)a4 playerSelectionProxy:(id)a5;
- (void)layoutSubviews;
- (void)setIconContainer:(id)a3;
- (void)setPlayerView1:(id)a3;
- (void)setPlayerView1LeadingConstraint:(id)a3;
- (void)setPlayerView1TopConstraint:(id)a3;
- (void)setPlayerView1WidthContraint:(id)a3;
- (void)setPlayerView2:(id)a3;
- (void)setPlayerView2BottomConstraint:(id)a3;
- (void)setPlayerView2TrailingConstraint:(id)a3;
- (void)setPlayerView2WidthContraint:(id)a3;
- (void)setPlayerView3:(id)a3;
- (void)setPlayerView3BottomConstraint:(id)a3;
- (void)setPlayerView3LeadingConstraint:(id)a3;
- (void)setPlayerView3WidthContraint:(id)a3;
- (void)setPlayerView4:(id)a3;
- (void)setPlayerView4TopConstraint:(id)a3;
- (void)setPlayerView4TrailingConstraint:(id)a3;
- (void)setPlayerView4WidthContraint:(id)a3;
- (void)setPlayerView5:(id)a3;
- (void)setPlayerView5BottomConstraint:(id)a3;
- (void)setPlayerView5LeadingConstraint:(id)a3;
- (void)setPlayerView5WidthContraint:(id)a3;
- (void)setPlayerView6:(id)a3;
- (void)setPlayerView6LeadingConstraint:(id)a3;
- (void)setPlayerView6TopConstraint:(id)a3;
- (void)setPlayerView6WidthContraint:(id)a3;
- (void)setPlayerView7:(id)a3;
- (void)setPlayerView7BottomConstraint:(id)a3;
- (void)setPlayerView7LeadingConstraint:(id)a3;
- (void)setPlayerView7WidthContraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GKPlayerGroupView

- (UIView)iconContainer
{
}

- (void)setIconContainer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CECC4();
}

- (GKDashboardPlayerPhotoView)playerView1
{
}

- (void)setPlayerView1:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CEDA4();
}

- (GKDashboardPlayerPhotoView)playerView2
{
}

- (void)setPlayerView2:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CEE84();
}

- (GKDashboardPlayerPhotoView)playerView3
{
}

- (void)setPlayerView3:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CEF64();
}

- (GKDashboardPlayerPhotoView)playerView4
{
}

- (void)setPlayerView4:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF044();
}

- (GKDashboardPlayerPhotoView)playerView5
{
}

- (void)setPlayerView5:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF124();
}

- (GKDashboardPlayerPhotoView)playerView6
{
}

- (void)setPlayerView6:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF204();
}

- (GKDashboardPlayerPhotoView)playerView7
{
}

- (void)setPlayerView7:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF2E4();
}

- (NSLayoutConstraint)playerView1WidthContraint
{
}

- (void)setPlayerView1WidthContraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF3C4();
}

- (NSLayoutConstraint)playerView2WidthContraint
{
}

- (void)setPlayerView2WidthContraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF4A4();
}

- (NSLayoutConstraint)playerView3WidthContraint
{
}

- (void)setPlayerView3WidthContraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF584();
}

- (NSLayoutConstraint)playerView4WidthContraint
{
}

- (void)setPlayerView4WidthContraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF664();
}

- (NSLayoutConstraint)playerView5WidthContraint
{
}

- (void)setPlayerView5WidthContraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF744();
}

- (NSLayoutConstraint)playerView6WidthContraint
{
}

- (void)setPlayerView6WidthContraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF824();
}

- (NSLayoutConstraint)playerView7WidthContraint
{
}

- (void)setPlayerView7WidthContraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF904();
}

- (NSLayoutConstraint)playerView1LeadingConstraint
{
}

- (void)setPlayerView1LeadingConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CF9E4();
}

- (NSLayoutConstraint)playerView1TopConstraint
{
}

- (void)setPlayerView1TopConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CFAC4();
}

- (NSLayoutConstraint)playerView2TrailingConstraint
{
}

- (void)setPlayerView2TrailingConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CFBA4();
}

- (NSLayoutConstraint)playerView2BottomConstraint
{
}

- (void)setPlayerView2BottomConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CFC84();
}

- (NSLayoutConstraint)playerView3LeadingConstraint
{
}

- (void)setPlayerView3LeadingConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CFD64();
}

- (NSLayoutConstraint)playerView3BottomConstraint
{
}

- (void)setPlayerView3BottomConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CFE44();
}

- (NSLayoutConstraint)playerView4TrailingConstraint
{
}

- (void)setPlayerView4TrailingConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4CFF24();
}

- (NSLayoutConstraint)playerView4TopConstraint
{
}

- (void)setPlayerView4TopConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4D0004();
}

- (NSLayoutConstraint)playerView5LeadingConstraint
{
}

- (void)setPlayerView5LeadingConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4D00E4();
}

- (NSLayoutConstraint)playerView5BottomConstraint
{
}

- (void)setPlayerView5BottomConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4D01C4();
}

- (NSLayoutConstraint)playerView6LeadingConstraint
{
}

- (void)setPlayerView6LeadingConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4D02A4();
}

- (NSLayoutConstraint)playerView6TopConstraint
{
}

- (void)setPlayerView6TopConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4D0384();
}

- (NSLayoutConstraint)playerView7LeadingConstraint
{
}

- (void)setPlayerView7LeadingConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4D0464();
}

- (NSLayoutConstraint)playerView7BottomConstraint
{
}

- (void)setPlayerView7BottomConstraint:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4D0544();
}

- (void)awakeFromNib
{
  v2 = self;
  GKPlayerGroupView.awakeFromNib()();
}

- (void)configureWithPlayers:(id)a3 messagesGroupIdentifier:(id)a4 playerSelectionProxy:(id)a5
{
  sub_1AF378DB4();
  unint64_t v8 = sub_1AF7AE2B0();
  if (a4)
  {
    uint64_t v9 = sub_1AF7AE0E0();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v11 = self;
  swift_unknownObjectRetain();
  GKPlayerGroupView.configure(players:messagesGroupIdentifier:playerSelectionProxy:)(v8, v9, (uint64_t)a4, (uint64_t)a5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  GKPlayerGroupView.traitCollectionDidChange(_:)(v9);
}

- (void)layoutSubviews
{
  v2 = self;
  GKPlayerGroupView.layoutSubviews()();
}

+ (id)create
{
  swift_getObjCClassMetadata();
  static GKPlayerGroupView.create()();

  return v2;
}

- (_TtC12GameCenterUI17GKPlayerGroupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17GKPlayerGroupView *)GKPlayerGroupView.init(frame:)();
}

- (_TtC12GameCenterUI17GKPlayerGroupView)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI17GKPlayerGroupView *)GKPlayerGroupView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1AF3E32DC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI17GKPlayerGroupView_playerSelectionProxy);
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI17GKPlayerGroupView_groupImageView);
}

@end