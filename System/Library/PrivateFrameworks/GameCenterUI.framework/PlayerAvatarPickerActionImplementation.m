@interface PlayerAvatarPickerActionImplementation
- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5;
- (void)photoPickerDidCancel:(id)a3;
@end

@implementation PlayerAvatarPickerActionImplementation

- (void)photoPickerDidCancel:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1AF5AF7A4(v3);

  swift_release();
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  swift_retain();
  sub_1AF5AF870(v7, (uint64_t)v8, (uint64_t)v9);

  swift_release();
}

@end