@interface FASwiftUIHostingControllerProvider
+ (id)familyMemberAccountChangePasswordControllerWithMainAccount:(id)a3 memberToShow:(id)a4 familyCircle:(id)a5;
+ (id)getCheckListControllerWithSpecifiers:(id)a3;
+ (id)getFamilyChecklistHeaderView;
+ (id)getFamilySettingsViewControllerWithViewModel:(id)a3 locationModel:(id)a4 pictureStore:(id)a5 appleAccount:(id)a6 accountManager:(id)a7 delegate:(id)a8 appleCardFamilySettingsViewModel:(id)a9;
+ (id)getLoadingControllerWithCancelAction:(id)a3;
+ (id)getLocationViewControllerWithViewModel:(id)a3 pictureStore:(id)a4 hackfromObjC:(BOOL)a5;
+ (id)getSettingsViewControllerWithResourceDictionary:(id)a3;
- (_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider)init;
@end

@implementation FASwiftUIHostingControllerProvider

+ (id)getFamilySettingsViewControllerWithViewModel:(id)a3 locationModel:(id)a4 pictureStore:(id)a5 appleAccount:(id)a6 accountManager:(id)a7 delegate:(id)a8 appleCardFamilySettingsViewModel:(id)a9
{
  swift_getObjectType();
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  swift_unknownObjectRetain();
  id v20 = a9;
  id v21 = sub_218C799E0(v15, v16, v17, v19, (uint64_t)a8, v20);

  swift_unknownObjectRelease();
  return v21;
}

+ (id)getLocationViewControllerWithViewModel:(id)a3 pictureStore:(id)a4 hackfromObjC:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  id v10 = v8;
  sub_218C84190(v9, v10, a5, (uint64_t)v14);
  id v11 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_267BF0B70));
  id v12 = sub_218C79B38((uint64_t)v14);
  sub_218C79C74((uint64_t)v14);

  return v12;
}

+ (id)familyMemberAccountChangePasswordControllerWithMainAccount:(id)a3 memberToShow:(id)a4 familyCircle:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = _s14FamilyCircleUI34FASwiftUIHostingControllerProviderC033familyMemberAccountChangePasswordF004mainJ012memberToShow0hB0So06UIViewF0CSo08FAFamilyI0C_AKSo0rB0CtFZ_0(v7, v8, v9);

  return v10;
}

+ (id)getFamilyChecklistHeaderView
{
  type metadata accessor for FamilyNetworkMonitor();
  sub_218AE1EF4();
  sub_218CAD9B8();
  id v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BF0B80));
  v3 = (void *)sub_218CADE18();
  return v3;
}

+ (id)getCheckListControllerWithSpecifiers:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267BEF480);
  sub_218CAF018();
  id v3 = objc_allocWithZone((Class)type metadata accessor for CheckListHostController());
  uint64_t v4 = swift_bridgeObjectRetain();
  id v5 = sub_218C202D0(v4);
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)getLoadingControllerWithCancelAction:(id)a3
{
  id v3 = _Block_copy(a3);
  if (v3) {
    *(void *)(swift_allocObject() + 16) = v3;
  }
  id v4 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_267BF0B88));
  id v5 = (void *)sub_218CADE18();
  return v5;
}

+ (id)getSettingsViewControllerWithResourceDictionary:(id)a3
{
  id v3 = (void *)_s14FamilyCircleUI34FASwiftUIHostingControllerProviderC015getSettingsViewF018resourceDictionarySo06UIViewF0CSDys11AnyHashableVypG_tFZ_0();
  return v3;
}

- (_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FASwiftUIHostingControllerProvider();
  return [(FASwiftUIHostingControllerProvider *)&v3 init];
}

@end