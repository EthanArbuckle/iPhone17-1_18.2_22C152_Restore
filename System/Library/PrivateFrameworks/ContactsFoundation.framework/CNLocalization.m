@interface CNLocalization
+ (id)localizedStringForInteger:(int64_t)a3;
+ (id)localizedStringForString:(id)a3 bundle:(id)a4 table:(id)a5 lookupBlock:(id)a6 returningNilIfNotFound:(BOOL)a7;
+ (id)localizedStringForString:(id)a3 bundle:(id)a4 table:(id)a5 returningNilIfNotFound:(BOOL)a6;
+ (id)localizedStringForString:(id)a3 class:(Class)a4 lookupBlock:(id)a5 returningNilIfNotFound:(BOOL)a6;
+ (id)localizedStringForString:(id)a3 class:(Class)a4 returningNilIfNotFound:(BOOL)a5;
@end

@implementation CNLocalization

+ (id)localizedStringForString:(id)a3 bundle:(id)a4 table:(id)a5 returningNilIfNotFound:(BOOL)a6
{
  return (id)[a1 localizedStringForString:a3 bundle:a4 table:a5 lookupBlock:0 returningNilIfNotFound:a6];
}

+ (id)localizedStringForString:(id)a3 bundle:(id)a4 table:(id)a5 lookupBlock:(id)a6 returningNilIfNotFound:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (v14) {
    (*((void (**)(id, id, id, id))v14 + 2))(v14, v12, v11, v13);
  }
  else {
  v16 = [v12 localizedStringForKey:v11 value:@"__ABUnlocalizedString" table:v13];
  }
  if ([v16 isEqualToString:@"__ABUnlocalizedString"])
  {
    if (a7) {
      id v17 = 0;
    }
    else {
      id v17 = v11;
    }

    v16 = v17;
  }

  return v16;
}

+ (id)localizedStringForString:(id)a3 class:(Class)a4 lookupBlock:(id)a5 returningNilIfNotFound:(BOOL)a6
{
  BOOL v6 = a6;
  v10 = (void *)MEMORY[0x1E4F28B50];
  id v11 = a5;
  id v12 = a3;
  id v13 = [v10 bundleForClass:a4];
  id v14 = NSStringFromClass(a4);
  v15 = [a1 localizedStringForString:v12 bundle:v13 table:v14 lookupBlock:v11 returningNilIfNotFound:v6];

  return v15;
}

+ (id)localizedStringForString:(id)a3 class:(Class)a4 returningNilIfNotFound:(BOOL)a5
{
  return (id)[a1 localizedStringForString:a3 class:a4 lookupBlock:0 returningNilIfNotFound:a5];
}

+ (id)localizedStringForInteger:(int64_t)a3
{
  v3 = (void *)MEMORY[0x1E4F28EE0];
  v4 = [NSNumber numberWithInteger:a3];
  v5 = [v3 localizedStringFromNumber:v4 numberStyle:1];

  return v5;
}

@end