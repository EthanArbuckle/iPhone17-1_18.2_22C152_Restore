@interface ODRApplicationImportTask
- (void)main;
@end

@implementation ODRApplicationImportTask

- (void)main
{
  v3 = sub_1003F9F04();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10035FF90;
  v4[3] = &unk_100521388;
  v4[4] = self;
  sub_1003FAC78(v3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_application, 0);
}

@end