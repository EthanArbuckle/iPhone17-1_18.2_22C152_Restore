@interface DOCSourceListInterface_Default
- (BOOL)iconForSourceRequireHierarchicalColors:(id)a3;
- (UIImage)iconForCompletedSync;
- (UIImage)iconForRecents;
- (UIImage)iconForShared;
- (UIImage)iconForSyncError;
- (id)ejectIconFor:(int64_t)a3 iconColor:(id)a4;
- (id)iconForSource:(id)a3;
- (id)nonThumbnailedIconForItem:(id)a3;
@end

@implementation DOCSourceListInterface_Default

- (UIImage)iconForRecents
{
  return (UIImage *)sub_10035D074((uint64_t)self, (uint64_t)a2, 0x6B636F6C63, 0xE500000000000000);
}

- (UIImage)iconForShared
{
  return (UIImage *)sub_10035D074((uint64_t)self, (uint64_t)a2, 0xD000000000000018, 0x8000000100503030);
}

- (UIImage)iconForSyncError
{
  return (UIImage *)sub_10035D074((uint64_t)self, (uint64_t)a2, 0xD00000000000002BLL, 0x8000000100524580);
}

- (UIImage)iconForCompletedSync
{
  return (UIImage *)sub_10035D074((uint64_t)self, (uint64_t)a2, 0xD000000000000010, 0x8000000100515580);
}

- (id)ejectIconFor:(int64_t)a3 iconColor:(id)a4
{
  v5 = self;
  id v6 = a4;
  swift_retain();
  id v7 = [v5 configurationWithTextStyle:UIFontTextStyleBody scale:2];
  id v8 = sub_10035E754(0x69632E7463656A65, 0xEC000000656C6372, 0, 1);
  id v9 = [v8 imageWithConfiguration:v7];

  id v10 = [v9 imageWithTintColor:v6 renderingMode:1];
  swift_release();

  return v10;
}

- (id)iconForSource:(id)a3
{
  id v3 = [a3 iconPreferingSymbolImages];
  return v3;
}

- (BOOL)iconForSourceRequireHierarchicalColors:(id)a3
{
  return [a3 iconPreferingSymbolImagesRequiresHierarchicalColors];
}

- (id)nonThumbnailedIconForItem:(id)a3
{
  id v3 = a3;
  swift_retain();
  id v4 = sub_10035E568(v3);

  swift_release();
  return v4;
}

@end