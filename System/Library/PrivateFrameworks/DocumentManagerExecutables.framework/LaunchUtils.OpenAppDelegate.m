@interface LaunchUtils.OpenAppDelegate
- (_TtCV26DocumentManagerExecutables11LaunchUtilsP33_785CBA6FF492D1A84D3A93B2D10ABBAB15OpenAppDelegate)init;
- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4;
- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4;
- (void)openResourceOperationDidComplete:(id)a3;
@end

@implementation LaunchUtils.OpenAppDelegate

- (void)openResourceOperation:(id)a3 didFinishCopyingResource:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AEFFB10);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_22BE92168();
    uint64_t v10 = sub_22BE92198();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_22BE92198();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  sub_22BE74354(a3, (uint64_t)v9);

  sub_22BE035C8((uint64_t)v9, (uint64_t *)&unk_26AEFFB10);
}

- (void)openResourceOperationDidComplete:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22BE6C77C(a3);
}

- (void)openResourceOperation:(id)a3 didFailWithError:(id)a4
{
  id v7 = a3;
  uint64_t v8 = self;
  id v9 = a4;
  sub_22BE6C97C(a3, (uint64_t)a4);
}

- (_TtCV26DocumentManagerExecutables11LaunchUtilsP33_785CBA6FF492D1A84D3A93B2D10ABBAB15OpenAppDelegate)init
{
  result = (_TtCV26DocumentManagerExecutables11LaunchUtilsP33_785CBA6FF492D1A84D3A93B2D10ABBAB15OpenAppDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end