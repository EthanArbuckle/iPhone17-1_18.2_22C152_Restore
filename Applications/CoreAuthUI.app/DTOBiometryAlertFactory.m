@interface DTOBiometryAlertFactory
- (id)biometryRequiredAlertWithBiometryType:(int64_t)a3;
@end

@implementation DTOBiometryAlertFactory

- (id)biometryRequiredAlertWithBiometryType:(int64_t)a3
{
  if (LACBiometryTypeFaceID == a3 || LACBiometryTypeTouchID == a3)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006CE4;
    v14[3] = &unk_100085FB8;
    v14[4] = self;
    v14[5] = a3;
    v12 = sub_100006CE4((uint64_t)v14);
    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"DTO_IS_ACTIVE" value:&stru_100088CF0 table:@"MobileUI-Ratchet"];
    [v12 setMessage:v5];

    [v12 setPreferredStyle:1];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"OK" value:&stru_100088CF0 table:@"MobileUI"];
    v8 = +[UIAlertAction actionWithTitle:v7 style:0 handler:&stru_100085FF8];
    [v12 addAction:v8];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"LEARN_MORE" value:&stru_100088CF0 table:@"MobileUI"];
    v11 = +[UIAlertAction actionWithTitle:v10 style:0 handler:&stru_100086018];
    [v12 addAction:v11];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end