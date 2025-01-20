@interface HRProgressHUD
- (_TtC15HealthRecordsUI13HRProgressHUD)initWithCoder:(id)a3;
- (void)didMoveToSuperview;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation HRProgressHUD

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C2432F98(a3);
}

- (void)didMoveToSuperview
{
  v2 = self;
  sub_1C2433110();
}

- (_TtC15HealthRecordsUI13HRProgressHUD)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HRProgressHUD();
  return [(ProgressHUD *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end