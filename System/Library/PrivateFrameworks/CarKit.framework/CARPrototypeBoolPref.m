@interface CARPrototypeBoolPref
+ (CARPrototypeBoolPref)prefWithDomain:(id)a3 key:(id)a4 title:(id)a5 invertValueForState:(BOOL)a6 valueChangedBlock:(id)a7;
- (BOOL)cachedState;
- (BOOL)cachedValueBool;
- (BOOL)invertValueForState;
- (BOOL)state;
- (BOOL)valueBool;
- (id)description;
- (void)setCachedState:(BOOL)a3;
- (void)setState:(BOOL)a3;
@end

@implementation CARPrototypeBoolPref

+ (CARPrototypeBoolPref)prefWithDomain:(id)a3 key:(id)a4 title:(id)a5 invertValueForState:(BOOL)a6 valueChangedBlock:(id)a7
{
  BOOL v7 = a6;
  v12 = NSNumber;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 numberWithBool:v7];
  v18 = [a1 prefWithDomain:v16 key:v15 title:v14 defaultValue:v17 valueChangedBlock:v13];

  return (CARPrototypeBoolPref *)v18;
}

- (BOOL)invertValueForState
{
  v2 = [(CARPrototypePref *)self defaultValue];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)valueBool
{
  v2 = [(CARPrototypePref *)self valueOrDefault];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)cachedValueBool
{
  v2 = [(CARPrototypePref *)self cachedValueOrDefault];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)state
{
  BOOL v3 = [(CARPrototypeBoolPref *)self valueBool];
  return v3 ^ [(CARPrototypeBoolPref *)self invertValueForState];
}

- (void)setState:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CARPrototypeBoolPref *)self invertValueForState];
  id v6 = [NSNumber numberWithBool:v5 ^ v3];
  [(CARPrototypePref *)self setValue:v6];
}

- (BOOL)cachedState
{
  BOOL v3 = [(CARPrototypeBoolPref *)self cachedValueBool];
  return v3 ^ [(CARPrototypeBoolPref *)self invertValueForState];
}

- (void)setCachedState:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CARPrototypeBoolPref *)self invertValueForState];
  id v6 = [NSNumber numberWithBool:v5 ^ v3];
  [(CARPrototypePref *)self setCachedValue:v6];
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CARPrototypePref *)self domain];
  id v6 = [(CARPrototypePref *)self key];
  if ([(CARPrototypeBoolPref *)self valueBool]) {
    BOOL v7 = @"YES";
  }
  else {
    BOOL v7 = @"NO";
  }
  if ([(CARPrototypeBoolPref *)self invertValueForState]) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if ([(CARPrototypeBoolPref *)self state]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = [v3 stringWithFormat:@"<%@: %p %@-%@=%@ invertValueForState=%@ state=%@>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

@end