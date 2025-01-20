@interface CKDetailsControllerLocationHelper
+ (id)mapURLFor:(id)a3 in:(id)a4;
+ (int64_t)cellTypeForRow:(int64_t)a3 conversation:(id)a4 isFMFEnabled:(BOOL)a5 shouldShowFMFView:(BOOL)a6;
+ (int64_t)numberOfCellsInLocationSectionWithConversation:(id)a3 isFMFEnabled:(BOOL)a4 isSharingLocation:(BOOL)a5 shouldShowFMFView:(BOOL)a6;
- (_TtC7ChatKit33CKDetailsControllerLocationHelper)init;
@end

@implementation CKDetailsControllerLocationHelper

+ (int64_t)numberOfCellsInLocationSectionWithConversation:(id)a3 isFMFEnabled:(BOOL)a4 isSharingLocation:(BOOL)a5 shouldShowFMFView:(BOOL)a6
{
  id v9 = a3;
  id v10 = _s7ChatKit33CKDetailsControllerLocationHelperC015numberOfCellsInE7Section12conversation12isFMFEnabled0m7SharingE017shouldShowFMFViewSiSo14CKConversationC_S3btFZ_0(v9, a4, a5, a6);

  return (int64_t)v10;
}

+ (int64_t)cellTypeForRow:(int64_t)a3 conversation:(id)a4 isFMFEnabled:(BOOL)a5 shouldShowFMFView:(BOOL)a6
{
  id v9 = a4;
  int64_t v10 = _s7ChatKit33CKDetailsControllerLocationHelperC8cellType6forRow12conversation12isFMFEnabled17shouldShowFMFViewAA021CKLocationSectionCellH0OSi_So14CKConversationCS2btFZ_0(a3, v9, a5, a6);

  return v10;
}

+ (id)mapURLFor:(id)a3 in:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922C1A0);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  id v10 = a4;
  static CKDetailsControllerLocationHelper.mapURL(for:in:)(v9, v10, (uint64_t)v8);

  uint64_t v11 = sub_18F7B60A0();
  uint64_t v12 = *(void *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
  {
    v13 = (void *)sub_18F7B6050();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
  }

  return v13;
}

- (_TtC7ChatKit33CKDetailsControllerLocationHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKDetailsControllerLocationHelper();
  return [(CKDetailsControllerLocationHelper *)&v3 init];
}

@end