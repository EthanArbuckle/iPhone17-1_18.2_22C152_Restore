@interface CKBannerViewFactory
+ (id)bannerWithTitle:(id)a3 subtitleString:(id)a4 avatarImages:(id)a5 contacts:(id)a6 customImage:(id)a7 actionButtonObjects:(id)a8 forceImageCentering:(BOOL)a9 xButtonHandler:(id)aBlock;
+ (id)unexpectedlyLoggedOutBanner;
+ (id)updateAppleIDSettingsBanner;
+ (id)waitingForCloudBanner;
- (_TtC7ChatKit19CKBannerViewFactory)init;
@end

@implementation CKBannerViewFactory

+ (id)bannerWithTitle:(id)a3 subtitleString:(id)a4 avatarImages:(id)a5 contacts:(id)a6 customImage:(id)a7 actionButtonObjects:(id)a8 forceImageCentering:(BOOL)a9 xButtonHandler:(id)aBlock
{
  v15 = _Block_copy(aBlock);
  if (a3)
  {
    uint64_t v16 = sub_18F7B97E0();
    a3 = v17;
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if (a4)
    {
LABEL_3:
      uint64_t v18 = sub_18F7B97E0();
      a4 = v19;
      if (!a5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  uint64_t v18 = 0;
  if (a5)
  {
LABEL_4:
    sub_18EF3528C(0, &qword_1E923A1B0);
    a5 = (id)sub_18F7B99C0();
  }
LABEL_5:
  if (a6)
  {
    sub_18EF3528C(0, (unint64_t *)&qword_1E922B6E0);
    a6 = (id)sub_18F7B99C0();
  }
  id v20 = a7;
  sub_18EF3528C(0, &qword_1E922AB00);
  unint64_t v21 = sub_18F7B99C0();
  if (v15)
  {
    uint64_t v22 = swift_allocObject();
    *(void *)(v22 + 16) = v15;
    v15 = sub_18F4C1E94;
  }
  else
  {
    uint64_t v22 = 0;
  }
  id v23 = sub_18F5674BC(v16, (uint64_t)a3, v18, (uint64_t)a4, 1, (unint64_t)a5, (uint64_t)a6, v20, 0, v21, a9, (uint64_t)v15, v22);
  sub_18EF6E880((uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v23;
}

+ (id)unexpectedlyLoggedOutBanner
{
  id v2 = sub_18F5682A4();

  return v2;
}

+ (id)updateAppleIDSettingsBanner
{
  id v2 = sub_18F568908();

  return v2;
}

+ (id)waitingForCloudBanner
{
  id v2 = sub_18F568E2C();

  return v2;
}

- (_TtC7ChatKit19CKBannerViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKBannerViewFactory();
  return [(CKBannerViewFactory *)&v3 init];
}

@end