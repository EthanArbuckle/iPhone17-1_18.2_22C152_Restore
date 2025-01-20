@interface __ASCLayoutProxy
+ (CGRect)rectWithLayoutDirectionForRect:(CGRect)a3 inTraitEnvironment:(id)a4 relativeTo:(CGRect)a5;
+ (CGRect)rectWithLayoutDirectionForRect:(CGRect)a3 layoutDirection:(int64_t)a4 relativeTo:(CGRect)a5;
+ (CGSize)estimatedMediaContentSizeFor:(id)a3 screenshots:(id)a4 trailers:(id)a5 fitting:(CGSize)a6 in:(id)a7;
+ (CGSize)lockupMediaPreferredMediaSizeWithFitting:(CGSize)a3 for:(id)a4 with:(id)a5 and:(id)a6 in:(id)a7;
+ (CGSize)mediumLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4;
+ (CGSize)mediumOfferButtonLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4;
+ (CGSize)miniLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4;
+ (CGSize)miniProductPagePreferredArtworkSize;
+ (CGSize)smallLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4;
+ (CGSize)smallOfferButtonLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4;
+ (UIEdgeInsets)layoutMarginsFor:(id)a3 existingLayoutMargins:(UIEdgeInsets)a4;
+ (double)adTransparencyButtonScaledCapInset:(double)a3 in:(id)a4;
+ (double)adTransparencyButtonTitlePointSizeProvider:(id)a3;
+ (double)adTransparencyDeveloperNamePointSizeProvider:(id)a3;
+ (double)axOfferButtonHeightForSize:(id)a3;
+ (double)containerViewRotationAngleFor:(id)a3 screenshots:(id)a4 trailers:(id)a5;
+ (double)lockupHeadingPointSizeProvider:(id)a3;
+ (double)lockupSubtitlePointSizeProvider:(id)a3;
+ (double)lockupTitlePointSizeProvider:(id)a3;
+ (double)offerButtonFixedHeightForSize:(id)a3;
+ (double)offerButtonHeightForSize:(id)a3;
+ (double)offerButtonRegularWidthForSize:(id)a3;
+ (double)offerProgressDiameterForSize:(id)a3;
+ (id)adLockupLayoutWithTraitCollection:(id)a3 artworkView:(id)a4 headingText:(id)a5 titleText:(id)a6 subtitleText:(id)a7 offerText:(id)a8 offerButton:(id)a9 starRatingView:(id)a10 ratingCountLabel:(id)a11 adTransparencyButton:(id)a12 editorsChoiceView:(id)a13 descriptionLabel:(id)a14;
+ (id)artworkFrom:(id)a3 and:(id)a4;
+ (id)lockupLayoutOfSize:(id)a3 traitCollection:(id)a4 artworkView:(id)a5 headingText:(id)a6 titleText:(id)a7 subtitleText:(id)a8 offerText:(id)a9 offerButton:(id)a10 badge:(id)a11;
+ (id)lockupMediaLayoutFor:(id)a3 screenshots:(id)a4 trailers:(id)a5 containerView:(id)a6 mediaViews:(id)a7;
+ (id)lockupMediaSizingLayoutFor:(id)a3 screenshots:(id)a4 trailers:(id)a5 containerView:(id)a6 mediaViews:(id)a7;
+ (id)miniProductPageLayoutWithTraitCollection:(id)a3 iconArtwork:(id)a4 title:(id)a5 subtitle:(id)a6 metadata:(id)a7 description:(id)a8 screenshots:(id)a9;
+ (id)offerDisclosureLayoutWithDisclosureIndicator:(id)a3;
+ (id)offerEmptyLayoutWithImageView:(id)a3 titleView:(id)a4 subtitleView:(id)a5;
+ (id)offerIconLayoutForSize:(id)a3 imageView:(id)a4 titleView:(id)a5 subtitleView:(id)a6 hasTrailingSubtitle:(BOOL)a7 shouldTopAlign:(BOOL)a8 topPadding:(double)a9 shouldTrailingAlign:(BOOL)a10;
+ (id)offerTextLayoutForSize:(id)a3 titleBackgroundView:(id)a4 titleView:(id)a5 subtitleView:(id)a6 hasTrailingSubtitle:(BOOL)a7 shouldTopAlign:(BOOL)a8 topPadding:(double)a9 shouldExpandBackground:(BOOL)a10;
+ (id)traitEnvironmentWithTraitCollection:(id)a3;
+ (id)tvTextPillOverlayWithBackgroundView:(id)a3 textView:(id)a4;
+ (int64_t)numberOfViewsInLockupMediaLayoutFor:(id)a3 with:(id)a4 and:(id)a5;
- (CGSize)measuredSizeFittingSize:(CGSize)a3 inTraitEnvironment:(id)a4;
- (NSString)description;
- (UIEdgeInsets)alignmentInsetsInTraitEnvironment:(id)a3;
- (__ASCLayoutProxy)init;
- (void)placeChildrenRelativeToRect:(CGRect)a3 inTraitEnvironment:(id)a4;
@end

@implementation __ASCLayoutProxy

+ (id)adLockupLayoutWithTraitCollection:(id)a3 artworkView:(id)a4 headingText:(id)a5 titleText:(id)a6 subtitleText:(id)a7 offerText:(id)a8 offerButton:(id)a9 starRatingView:(id)a10 ratingCountLabel:(id)a11 adTransparencyButton:(id)a12 editorsChoiceView:(id)a13 descriptionLabel:(id)a14
{
  id v33 = a3;
  id v19 = a4;
  id v32 = a5;
  id v20 = a6;
  id v21 = a7;
  id v31 = a8;
  id v22 = a9;
  id v30 = a10;
  id v29 = a11;
  id v28 = a12;
  id v27 = a13;
  id v23 = a14;
  id v24 = sub_1C2BFE9B8(v19, a5, v20, v21, a8, v22, a10, a11, a12, a13, v23);

  return v24;
}

+ (int64_t)numberOfViewsInLockupMediaLayoutFor:(id)a3 with:(id)a4 and:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = _s18AppStoreComponents14ASCLayoutProxyC32numberOfViewsInLockupMediaLayout3for4with3andSiSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgtFZ_0((uint64_t)a3, (uint64_t)a4, a5);

  return v11;
}

+ (id)lockupMediaSizingLayoutFor:(id)a3 screenshots:(id)a4 trailers:(id)a5 containerView:(id)a6 mediaViews:(id)a7
{
  sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  unint64_t v11 = sub_1C2C26E58();
  swift_getObjCClassMetadata();
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = static ASCLayoutProxy.lockupMediaSizingLayout(for:screenshots:trailers:containerView:mediaViews:)((uint64_t)a3, (uint64_t)a4, a5, v15, v11);

  swift_bridgeObjectRelease();

  return v16;
}

+ (id)lockupMediaLayoutFor:(id)a3 screenshots:(id)a4 trailers:(id)a5 containerView:(id)a6 mediaViews:(id)a7
{
  sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  unint64_t v11 = sub_1C2C26E58();
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = _s18AppStoreComponents14ASCLayoutProxyC17lockupMediaLayout3for11screenshots8trailers13containerView10mediaViewsACSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgSo6UIViewCSayATGtFZ_0((uint64_t)a3, (uint64_t)a4, a5, v15, v11);

  swift_bridgeObjectRelease();

  return v16;
}

+ (CGSize)lockupMediaPreferredMediaSizeWithFitting:(CGSize)a3 for:(id)a4 with:(id)a5 and:(id)a6 in:(id)a7
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v13 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1F4188790](v13 - 8);
  id v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjCClassMetadata();
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  swift_unknownObjectRetain();
  sub_1C2BFD2F8((uint64_t)a4, (uint64_t)a5, a6, (uint64_t)v15);
  double v19 = sub_1C2C12044((uint64_t)v15, (uint64_t)a7, width, height);
  double v21 = v20;
  sub_1C2C01790((uint64_t)v15, type metadata accessor for LockupMediaLayout.Metrics);

  swift_unknownObjectRelease();
  double v22 = v19;
  double v23 = v21;
  result.double height = v23;
  result.double width = v22;
  return result;
}

+ (id)artworkFrom:(id)a3 and:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_1C2C0D4C8((uint64_t)a3, a4, 0, 1);

  sub_1C2C0191C(0, &qword_1EA330BF0);
  id v8 = (void *)sub_1C2C26E48();
  swift_bridgeObjectRelease();

  return v8;
}

+ (CGSize)estimatedMediaContentSizeFor:(id)a3 screenshots:(id)a4 trailers:(id)a5 fitting:(CGSize)a6 in:(id)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  swift_unknownObjectRetain();
  double v16 = _s18AppStoreComponents14ASCLayoutProxyC25estimatedMediaContentSize3for11screenshots8trailers7fitting2inSo6CGSizeVSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgAKSo18UITraitEnvironment_ptFZ_0((uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a7, width, height);
  double v18 = v17;

  swift_unknownObjectRelease();
  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

+ (double)containerViewRotationAngleFor:(id)a3 screenshots:(id)a4 trailers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _s18AppStoreComponents14ASCLayoutProxyC26containerViewRotationAngle3for11screenshots8trailers12CoreGraphics7CGFloatVSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgtFZ_0((uint64_t)a3, (uint64_t)a4, a5);
  double v12 = v11;

  return v12;
}

+ (UIEdgeInsets)layoutMarginsFor:(id)a3 existingLayoutMargins:(UIEdgeInsets)a4
{
  double top = a4.top;
  id v6 = a3;
  double v7 = _s18AppStoreComponents14ASCLayoutProxyC13layoutMargins3for014existingLayoutG0So12UIEdgeInsetsVSo16ASCLockupContextaSg_AHtFZ_0(a3, top);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.double top = v14;
  return result;
}

+ (double)lockupTitlePointSizeProvider:(id)a3
{
  id v3 = a3;
  double v4 = _s18AppStoreComponents14ASCLayoutProxyC28lockupTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0();

  return v4;
}

+ (double)lockupSubtitlePointSizeProvider:(id)a3
{
  id v3 = a3;
  double v4 = _s18AppStoreComponents14ASCLayoutProxyC31lockupSubtitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0();

  return v4;
}

+ (double)lockupHeadingPointSizeProvider:(id)a3
{
  id v3 = a3;
  double v4 = _s18AppStoreComponents14ASCLayoutProxyC30lockupHeadingPointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0();

  return v4;
}

+ (double)adTransparencyButtonTitlePointSizeProvider:(id)a3
{
  id v3 = a3;
  double v4 = _s18AppStoreComponents14ASCLayoutProxyC42adTransparencyButtonTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0();

  return v4;
}

+ (double)adTransparencyButtonScaledCapInset:(double)a3 in:(id)a4
{
  uint64_t v5 = sub_1C2C263F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  double v8 = (char *)&v18[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = qword_1EA3307B0;
  id v10 = a4;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1C2C26598();
  uint64_t v12 = __swift_project_value_buffer(v11, (uint64_t)qword_1EA330BC8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v8, v12, v11);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F71998], v5);
  v18[3] = v5;
  v18[4] = MEMORY[0x1E4F719A8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, char *, uint64_t))(v6 + 16))(boxed_opaque_existential_1, v8, v5);
  sub_1C2C263D8();
  double v15 = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v15;
}

+ (double)adTransparencyDeveloperNamePointSizeProvider:(id)a3
{
  id v3 = a3;
  double v4 = _s18AppStoreComponents14ASCLayoutProxyC44adTransparencyDeveloperNamePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0();

  return v4;
}

+ (CGSize)miniLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  double width = a3.width;
  id v5 = a4;
  double v6 = _s18AppStoreComponents14ASCLayoutProxyC23miniLockupEstimatedSize7fitting14compatibleWithSo6CGSizeVAH_So17UITraitCollectionCtFZ_0((uint64_t)v5, width);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (CGSize)smallOfferButtonLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  double width = a3.width;
  id v5 = a4;
  double v6 = sub_1C2C053AC(v5, &qword_1EB681110, (uint64_t)&unk_1EB6811B0, width);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (CGSize)mediumOfferButtonLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  double width = a3.width;
  id v5 = a4;
  double v6 = sub_1C2C053AC(v5, &qword_1EA3307F8, (uint64_t)&unk_1EA330E10, width);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (CGSize)smallLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  uint64_t v4 = qword_1EB6812C8;
  id v5 = a4;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for SmallLockupLayout.Metrics(0);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EB6812B0);
  sub_1C2C26BF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB681948);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1C2C2FB10;
  *(void *)(v8 + 32) = v5;
  sub_1C2C26E68();
  id v9 = v5;
  double v10 = (void *)sub_1C2C26C08();
  double v11 = sub_1C2C04840(v7, v10);
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

+ (CGSize)mediumLockupEstimatedSizeFittingSize:(CGSize)a3 compatibleWithTraitCollection:(id)a4
{
  double width = a3.width;
  id v5 = a4;
  double v6 = _s18AppStoreComponents14ASCLayoutProxyC25mediumLockupEstimatedSize7fitting14compatibleWithSo6CGSizeVAH_So17UITraitCollectionCtFZ_0(v5, width);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (id)lockupLayoutOfSize:(id)a3 traitCollection:(id)a4 artworkView:(id)a5 headingText:(id)a6 titleText:(id)a7 subtitleText:(id)a8 offerText:(id)a9 offerButton:(id)a10 badge:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v26 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  uint64_t v24 = (void *)_s18AppStoreComponents14ASCLayoutProxyC12lockupLayout6ofSize15traitCollection11artworkView11headingText05titleO008subtitleO005offerO00R6Button5badgeACSo09ASCLockupmI0a_So07UITraitK0CSo6UIViewCSo7UILabelCSgA2uv2SSgtFZ_0((uint64_t)v16, v17, v18, a6, v19, v20, a9, v22);

  return v24;
}

+ (CGSize)miniProductPagePreferredArtworkSize
{
  if (qword_1EA330818 != -1) {
    swift_once();
  }
  double v3 = *((double *)&xmmword_1EA3312A0 + 1);
  double v2 = *(double *)&xmmword_1EA3312A0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (id)miniProductPageLayoutWithTraitCollection:(id)a3 iconArtwork:(id)a4 title:(id)a5 subtitle:(id)a6 metadata:(id)a7 description:(id)a8 screenshots:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = sub_1C2C07EE0();

  return v21;
}

+ (double)offerButtonHeightForSize:(id)a3
{
  sub_1C2C26E08();
  swift_getObjCClassMetadata();
  sub_1C2C0987C((uint64_t)v5);
  double v3 = *(double *)&v5[9];
  sub_1C2C07B1C((uint64_t)v5);
  swift_bridgeObjectRelease();
  return v3;
}

+ (double)offerProgressDiameterForSize:(id)a3
{
  sub_1C2C26E08();
  swift_getObjCClassMetadata();
  sub_1C2C09AB8((uint64_t)v5);
  double v3 = v6;
  sub_1C2C08638((uint64_t)v5);
  swift_bridgeObjectRelease();
  return v3;
}

+ (double)axOfferButtonHeightForSize:(id)a3
{
  sub_1C2C26E08();
  swift_getObjCClassMetadata();
  double v3 = static ASCLayoutProxy.axOfferButtonHeightForSize(_:)();
  swift_bridgeObjectRelease();
  return v3;
}

+ (double)offerButtonRegularWidthForSize:(id)a3
{
  sub_1C2C26E08();
  swift_getObjCClassMetadata();
  sub_1C2C09CF4((uint64_t)v5);
  double v3 = *(double *)v5;
  sub_1C2C08638((uint64_t)v5);
  swift_bridgeObjectRelease();
  return v3;
}

+ (double)offerButtonFixedHeightForSize:(id)a3
{
  sub_1C2C26E08();
  swift_getObjCClassMetadata();
  double v3 = static ASCLayoutProxy.axOfferButtonHeightForSize(_:)();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)offerEmptyLayoutWithImageView:(id)a3 titleView:(id)a4 subtitleView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _s18AppStoreComponents14ASCLayoutProxyC16offerEmptyLayout9imageView05titleJ008subtitleJ0ACSo6UIViewC_AISgAJtFZ_0(v7, a4, a5);

  return v10;
}

+ (id)offerIconLayoutForSize:(id)a3 imageView:(id)a4 titleView:(id)a5 subtitleView:(id)a6 hasTrailingSubtitle:(BOOL)a7 shouldTopAlign:(BOOL)a8 topPadding:(double)a9 shouldTrailingAlign:(BOOL)a10
{
  uint64_t v15 = sub_1C2C26E08();
  uint64_t v17 = v16;
  swift_getObjCClassMetadata();
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = static ASCLayoutProxy.offerIconLayoutForSize(_:imageView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldTrailingAlign:)(a9, v15, v17, v18, a5, a6, a7, a8, a10);

  swift_bridgeObjectRelease();

  return v21;
}

+ (id)offerTextLayoutForSize:(id)a3 titleBackgroundView:(id)a4 titleView:(id)a5 subtitleView:(id)a6 hasTrailingSubtitle:(BOOL)a7 shouldTopAlign:(BOOL)a8 topPadding:(double)a9 shouldExpandBackground:(BOOL)a10
{
  uint64_t v16 = sub_1C2C26E08();
  uint64_t v18 = v17;
  swift_getObjCClassMetadata();
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = static ASCLayoutProxy.offerTextLayoutForSize(_:titleBackgroundView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldExpandBackground:)(a9, v16, v18, v19, v20, a6, a7, a8, a10);

  swift_bridgeObjectRelease();

  return v22;
}

+ (id)offerDisclosureLayoutWithDisclosureIndicator:(id)a3
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v11[3] = &type metadata for OfferDisclosureLayout;
  v11[4] = sub_1C2C096E8();
  v11[0] = swift_allocObject();
  sub_1C2C0191C(0, (unint64_t *)&qword_1EB681808);
  id v5 = a3;
  sub_1C2C26508();
  v10[3] = &type metadata for PlaceableLayoutProxy;
  v10[4] = sub_1C2C0798C();
  v10[5] = sub_1C2C079E0();
  v10[0] = swift_allocObject();
  sub_1C2C07A6C((uint64_t)v11, v10[0] + 16);
  id v6 = objc_allocWithZone(ObjCClassMetadata);
  sub_1C2BFF010((uint64_t)v10, (uint64_t)v6 + OBJC_IVAR_____ASCLayoutProxy_base);
  v9.receiver = v6;
  v9.super_class = ObjCClassMetadata;
  id v7 = objc_msgSendSuper2(&v9, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  sub_1C2C07AC8((uint64_t)v11);

  return v7;
}

+ (id)tvTextPillOverlayWithBackgroundView:(id)a3 textView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _s18AppStoreComponents14ASCLayoutProxyC17tvTextPillOverlay14backgroundView04textK0ACSo6UIViewC_AHtFZ_0(v5, v6);

  return v7;
}

+ (id)traitEnvironmentWithTraitCollection:(id)a3
{
  id v4 = objc_allocWithZone((Class)sub_1C2C26BF8());
  id v5 = a3;
  id v6 = (void *)sub_1C2C26BE8();

  return v6;
}

+ (CGRect)rectWithLayoutDirectionForRect:(CGRect)a3 inTraitEnvironment:(id)a4 relativeTo:(CGRect)a5
{
  swift_unknownObjectRetain();
  id v6 = objc_msgSend(a4, sel_traitCollection);
  objc_msgSend(v6, sel_layoutDirection);

  sub_1C2C26F08();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (CGRect)rectWithLayoutDirectionForRect:(CGRect)a3 layoutDirection:(int64_t)a4 relativeTo:(CGRect)a5
{
  sub_1C2C26F08();
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGSize)measuredSizeFittingSize:(CGSize)a3 inTraitEnvironment:(id)a4
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR_____ASCLayoutProxy_base), *(void *)&self->base[OBJC_IVAR_____ASCLayoutProxy_base + 16]);
  swift_unknownObjectRetain();
  double v5 = self;
  sub_1C2C264F8();
  double v7 = v6;
  double v9 = v8;
  swift_unknownObjectRelease();

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (UIEdgeInsets)alignmentInsetsInTraitEnvironment:(id)a3
{
  swift_unknownObjectRetain();
  double v5 = self;
  double v6 = ASCLayoutProxy.alignmentInsets(in:)((uint64_t)a3);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.double top = v13;
  return result;
}

- (void)placeChildrenRelativeToRect:(CGRect)a3 inTraitEnvironment:(id)a4
{
  uint64_t v5 = sub_1C2C26478();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  double v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR_____ASCLayoutProxy_base), *(void *)&self->base[OBJC_IVAR_____ASCLayoutProxy_base + 16]);
  swift_unknownObjectRetain();
  double v9 = self;
  sub_1C2C26C88();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_unknownObjectRelease();
}

- (NSString)description
{
  double v2 = self;
  sub_1C2C26F68();
  sub_1C2C26E28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6817F8);
  sub_1C2C26FA8();
  sub_1C2C26E28();

  double v3 = (void *)sub_1C2C26DD8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (__ASCLayoutProxy)init
{
  UIEdgeInsets result = (__ASCLayoutProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end