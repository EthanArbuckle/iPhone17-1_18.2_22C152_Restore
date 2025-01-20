@interface ControlsIconModelLoader
- (BOOL)iconModel:(id)a3 listsAllowRotatedLayoutForFolderClass:(Class)a4;
- (SBHIconGridSize)iconModel:(id)a3 listGridSizeForFolderClass:(Class)a4;
- (_TtC15ControlCenterUI23ControlsIconModelLoader)init;
- (id)archiveVersionForIconModel:;
- (id)gridSizeClassDomainForIconModel:;
- (id)gridSizeClassSizesForIconModel:(id)a3;
- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4;
- (id)iconModel:(id)a3 iconDataSourceForArchiveRepresentation:(id)a4;
- (id)iconModel:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4;
- (id)iconModel:(void *)a3 archiveRepresentationForIconDataSource:;
- (id)listRotatedLayoutClusterGridSizeClassForIconModel:(id)a3;
- (id)rotatedGridSizeClassSizesForIconModel:(id)a3;
- (int64_t)iconModel:(id)a3 listsFixedIconLocationBehaviorForFolderClass:(Class)a4;
- (unint64_t)iconModel:(id)a3 listsIconLayoutBehaviorForFolderClass:(Class)a4;
- (unint64_t)iconModel:(id)a3 maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4;
- (unint64_t)iconModel:(id)a3 maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4;
- (unint64_t)maxListCountForFoldersForIconModel:(id)a3;
@end

@implementation ControlsIconModelLoader

- (_TtC15ControlCenterUI23ControlsIconModelLoader)init
{
  result = (_TtC15ControlCenterUI23ControlsIconModelLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleSettingsManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUI23ControlsIconModelLoader_moduleInstanceManager));

  swift_unknownObjectRelease();
}

- (unint64_t)maxListCountForFoldersForIconModel:(id)a3
{
  return 15;
}

- (SBHIconGridSize)iconModel:(id)a3 listGridSizeForFolderClass:(Class)a4
{
  id v5 = a3;
  v6 = self;
  SBHIconGridSize v7 = (SBHIconGridSize)sub_1D7BB4260();
  v9 = v8;
  v11 = v10;
  v13 = v12;

  return v7;
}

- (unint64_t)iconModel:(id)a3 maxRowCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  BOOL IsPortrait = UIInterfaceOrientationIsPortrait(a4);
  id v7 = a3;
  v8 = self;
  unsigned int v9 = sub_1D7BB4260();
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (IsPortrait) {
    return HIWORD(v9);
  }
  else {
    return (unsigned __int16)v9;
  }
}

- (unint64_t)iconModel:(id)a3 maxColumnCountForListInRootFolderWithInterfaceOrientation:(int64_t)a4
{
  BOOL IsPortrait = UIInterfaceOrientationIsPortrait(a4);
  id v7 = a3;
  v8 = self;
  unsigned int v9 = sub_1D7BB4260();
  v11 = v10;
  v13 = v12;
  v15 = v14;

  if (IsPortrait) {
    return (unsigned __int16)v9;
  }
  else {
    return HIWORD(v9);
  }
}

- (id)gridSizeClassSizesForIconModel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D7BB4260();
  id v7 = v6;
  unsigned int v9 = v8;
  v11 = v10;

  return v7;
}

- (BOOL)iconModel:(id)a3 listsAllowRotatedLayoutForFolderClass:(Class)a4
{
  return 1;
}

- (id)listRotatedLayoutClusterGridSizeClassForIconModel:(id)a3
{
  id v3 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();

  return v3;
}

- (id)rotatedGridSizeClassSizesForIconModel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1D7BB4260();
  id v7 = v6;
  unsigned int v9 = v8;
  v11 = v10;

  return v9;
}

- (id)iconModel:(id)a3 allowedGridSizeClassesForFolderClass:(Class)a4
{
  id v5 = a3;
  v6 = self;
  sub_1D7BB4260();
  v8 = v7;
  v10 = v9;
  v12 = v11;

  return v12;
}

- (int64_t)iconModel:(id)a3 listsFixedIconLocationBehaviorForFolderClass:(Class)a4
{
  return 4;
}

- (unint64_t)iconModel:(id)a3 listsIconLayoutBehaviorForFolderClass:(Class)a4
{
  return 3;
}

- (id)iconModel:(id)a3 localizedFolderNameForDefaultDisplayName:(id)a4
{
  sub_1D7BB7258();
  id v4 = (void *)sub_1D7BB7228();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)iconModel:(id)a3 iconDataSourceForArchiveRepresentation:(id)a4
{
  uint64_t v6 = sub_1D7BB71F8();
  id v7 = a3;
  v8 = self;
  id v9 = sub_1D7BB230C(v6);

  swift_bridgeObjectRelease();

  return v9;
}

- (id)gridSizeClassDomainForIconModel:
{
  id v0 = objc_msgSend(self, sel_controlCenterDomain);

  return v0;
}

- (id)iconModel:(void *)a3 archiveRepresentationForIconDataSource:
{
  id v4 = a3;
  swift_unknownObjectRetain();
  id v5 = a1;
  uint64_t v6 = sub_1D7BB5028();

  swift_unknownObjectRelease();
  if (v6)
  {
    id v7 = (void *)sub_1D7BB71E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)archiveVersionForIconModel:
{
  id v0 = objc_msgSend(objc_allocWithZone(NSNumber), sel_initWithUnsignedInteger_, 1000);

  return v0;
}

@end