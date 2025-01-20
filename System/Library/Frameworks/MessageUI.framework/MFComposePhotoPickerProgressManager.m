@interface MFComposePhotoPickerProgressManager
- (BOOL)hasAnyProgress;
- (MFComposePhotoPickerProgressManager)init;
- (id)progressFor:(id)a3;
- (void)cancelEverything;
- (void)cancelProgressFor:(id)a3;
- (void)setProgress:(id)a3 for:(id)a4;
@end

@implementation MFComposePhotoPickerProgressManager

- (BOOL)hasAnyProgress
{
  v2 = self;
  sub_1AFA4DCC8();

  return sub_1AFA53C88() & 1;
}

- (void)setProgress:(id)a3 for:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = self;
  uint64_t v9 = sub_1AFA53FC8();
  sub_1AFA4DD6C(a3, v9, v8);
  swift_bridgeObjectRelease();
}

- (id)progressFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = sub_1AFA53FC8();
  id v11 = (id)sub_1AFA4E0B8(v6, v7);
  swift_bridgeObjectRelease();

  return v11;
}

- (void)cancelProgressFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = sub_1AFA53FC8();
  sub_1AFA4E280(v6, v7);
  swift_bridgeObjectRelease();
}

- (void)cancelEverything
{
  v2 = self;
  sub_1AFA4E4DC();
}

- (MFComposePhotoPickerProgressManager)init
{
  return (MFComposePhotoPickerProgressManager *)PhotoPickerProgressManager.init()();
}

- (void).cxx_destruct
{
}

@end