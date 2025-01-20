@interface CKTapbackClassicAsset
- (CKTapbackClassicAsset)init;
- (id)stillImageByApplyingSelectionFilter:(BOOL)a3;
@end

@implementation CKTapbackClassicAsset

- (id)stillImageByApplyingSelectionFilter:(BOOL)a3
{
  v4 = self;
  sub_18F73C8C8();
  v6 = v5;
  if (*(Class *)((char *)&v4->super.isa + OBJC_IVAR___CKTapbackClassicAsset_primarySelectionColorFilterValueMatrix)
    && a3
    && v5)
  {
    v7 = (void *)sub_18F7B6CA0();
    sub_18F73CA80(v7);
    v9 = v8;

    swift_bridgeObjectRelease();
    v6 = v9;
  }
  else
  {
  }

  return v6;
}

- (CKTapbackClassicAsset)init
{
  result = (CKTapbackClassicAsset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTapbackClassicAsset____lazy_storage___stillImage);

  sub_18F609E48(v3);
}

@end