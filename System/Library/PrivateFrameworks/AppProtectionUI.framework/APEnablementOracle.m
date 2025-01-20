@interface APEnablementOracle
+ (id)sharedInstance;
- (APEnablementOracle)init;
- (BOOL)canEnablementAction:(unint64_t)a3 bePerformedForFeature:(unint64_t)a4 ofSubject:(id)a5;
- (BOOL)getPreferredEnablementAction:(unint64_t *)a3 preferredEnableableFeature:(unint64_t *)a4 forSubject:(id)a5 error:(id *)a6;
@end

@implementation APEnablementOracle

+ (id)sharedInstance
{
  if (qword_26B13A238 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B13A230;

  return v2;
}

- (BOOL)canEnablementAction:(unint64_t)a3 bePerformedForFeature:(unint64_t)a4 ofSubject:(id)a5
{
  id v8 = a5;
  v9 = self;
  LOBYTE(a4) = sub_247E197E4(a3, a4, v8);

  return a4 & 1;
}

- (BOOL)getPreferredEnablementAction:(unint64_t *)a3 preferredEnableableFeature:(unint64_t *)a4 forSubject:(id)a5 error:(id *)a6
{
  id v9 = a5;
  v10 = self;
  sub_247E199E8((uint64_t *)a3, a4, v9);

  return 1;
}

- (APEnablementOracle)init
{
  v3.receiver = self;
  v3.super_class = (Class)APEnablementOracle;
  return [(APEnablementOracle *)&v3 init];
}

@end