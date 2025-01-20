@interface HPSBetaEnrollmentModelCoder
- (BOOL)deserialize:(id)a3 withElement:(id)a4 error:(id *)a5;
- (HPSBetaEnrollmentModelCoder)init;
- (id)serialize:(id)a3 error:(id *)a4;
@end

@implementation HPSBetaEnrollmentModelCoder

- (BOOL)deserialize:(id)a3 withElement:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  uint64_t v10 = sub_23D244708();
  unint64_t v12 = v11;

  sub_23D1A5FBC(v10, v12, v8);
  sub_23D165FE8(v10, v12);
  return 1;
}

- (id)serialize:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_23D1A6244(v5);
  unint64_t v9 = v8;

  uint64_t v10 = (void *)sub_23D2446D8();
  sub_23D165FE8((uint64_t)v7, v9);
  return v10;
}

- (HPSBetaEnrollmentModelCoder)init
{
  return (HPSBetaEnrollmentModelCoder *)BetaEnrollment.ModelCoder.init()();
}

@end