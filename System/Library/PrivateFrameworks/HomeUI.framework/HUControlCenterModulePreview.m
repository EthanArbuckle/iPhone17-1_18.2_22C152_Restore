@interface HUControlCenterModulePreview
+ (id)emptyPreviewForGridSize:(HUGridSize)a3;
+ (id)previewWithPackage:(id)a3 forGridSize:(HUGridSize)a4;
+ (id)previewWithSystemIcon:(id)a3 forGridSize:(HUGridSize)a4;
+ (id)previewWithTemplate:(id)a3 tintColor:(id)a4 title:(id)a5 subtitle:(id)a6 forGridSize:(HUGridSize)a7;
- (HUControlCenterModulePreview)init;
@end

@implementation HUControlCenterModulePreview

+ (id)previewWithPackage:(id)a3 forGridSize:(HUGridSize)a4
{
  int64_t columnsAcross = a4.columnsAcross;
  int64_t rowsDown = a4.rowsDown;
  swift_getObjCClassMetadata();
  id v7 = a3;
  v8 = (void *)static HUControlCenterModulePreview.preview(package:size:)(v7, rowsDown, columnsAcross);

  return v8;
}

+ (id)previewWithSystemIcon:(id)a3 forGridSize:(HUGridSize)a4
{
  int64_t columnsAcross = a4.columnsAcross;
  int64_t rowsDown = a4.rowsDown;
  uint64_t v6 = sub_1BE9C49F8();
  uint64_t v8 = v7;
  swift_getObjCClassMetadata();
  v9 = (void *)static HUControlCenterModulePreview.preview(systemIcon:size:)(v6, v8, rowsDown, columnsAcross);
  swift_bridgeObjectRelease();

  return v9;
}

+ (id)previewWithTemplate:(id)a3 tintColor:(id)a4 title:(id)a5 subtitle:(id)a6 forGridSize:(HUGridSize)a7
{
  int64_t columnsAcross = a7.columnsAcross;
  int64_t rowsDown = a7.rowsDown;
  uint64_t v12 = sub_1BE9C49F8();
  uint64_t v14 = v13;
  if (a6)
  {
    uint64_t v15 = sub_1BE9C49F8();
    a6 = v16;
  }
  else
  {
    uint64_t v15 = 0;
  }
  swift_getObjCClassMetadata();
  id v17 = a3;
  id v18 = a4;
  v19 = (void *)static HUControlCenterModulePreview.preview(templateIcon:tint:title:subtitle:size:)(v17, v18, v12, v14, v15, (uint64_t)a6, rowsDown, columnsAcross);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v19;
}

+ (id)emptyPreviewForGridSize:(HUGridSize)a3
{
  int64_t columnsAcross = a3.columnsAcross;
  int64_t rowsDown = a3.rowsDown;
  swift_getObjCClassMetadata();
  v5 = (void *)static HUControlCenterModulePreview.empty(size:)(rowsDown, columnsAcross);

  return v5;
}

- (HUControlCenterModulePreview)init
{
  v2 = (char *)self + OBJC_IVAR___HUControlCenterModulePreview_configuration;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *((void *)v2 + 6) = 255;
  *((void *)v2 + 7) = 0;
  *((void *)v2 + 8) = 0;
  v4.receiver = self;
  v4.super_class = (Class)HUControlCenterModulePreview;
  return [(HUControlCenterModulePreview *)&v4 init];
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___HUControlCenterModulePreview_configuration;
  sub_1BE5610C8(*(void **)((char *)&self->super.isa + OBJC_IVAR___HUControlCenterModulePreview_configuration), *((void **)v2 + 1), *((void *)v2 + 2), *((void *)v2 + 3), *((void *)v2 + 4), *((void *)v2 + 5), *((void *)v2 + 6));
}

@end