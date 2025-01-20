@interface BLSHEnvironmentDatesEnumerator
+ (id)createWithInitialSpecifier:(id)a3 enumerator:(id)a4 dateInterval:(id)a5 environment:(id)a6 sourceModel:(id)a7;
- (BLSAlwaysOnDateSpecifier)specifier;
- (BLSHBacklightSceneHostEnvironment)environment;
- (BLSHEnvironmentDatesModel)sourceModel;
- (NSDateInterval)dateInterval;
- (NSEnumerator)enumerator;
- (id)description;
- (id)initWithInitialSpecifier:(void *)a3 enumerator:(void *)a4 dateInterval:(void *)a5 environment:(void *)a6 sourceModel:;
- (void)setSpecifier:(id)a3;
@end

@implementation BLSHEnvironmentDatesEnumerator

+ (id)createWithInitialSpecifier:(id)a3 enumerator:(id)a4 dateInterval:(id)a5 environment:(id)a6 sourceModel:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = -[BLSHEnvironmentDatesEnumerator initWithInitialSpecifier:enumerator:dateInterval:environment:sourceModel:]((id *)[BLSHEnvironmentDatesEnumerator alloc], v15, v14, v13, v12, v11);

  return v16;
}

- (id)initWithInitialSpecifier:(void *)a3 enumerator:(void *)a4 dateInterval:(void *)a5 environment:(void *)a6 sourceModel:
{
  id v18 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)BLSHEnvironmentDatesEnumerator;
    v16 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (BLSAlwaysOnDateSpecifier)specifier
{
  specifier = self->_specifier;
  if (specifier)
  {
    v3 = specifier;
  }
  else
  {
    id v4 = objc_alloc(MEMORY[0x263F29940]);
    v5 = [MEMORY[0x263EFF910] distantFuture];
    v3 = (BLSAlwaysOnDateSpecifier *)[v4 initWithDate:v5 fidelity:0];
  }

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(BLSHBacklightSceneHostEnvironment *)self->_environment identifier];
  [v3 appendString:v4 withName:@"environment"];

  v5 = [(BLSAlwaysOnDateSpecifier *)self->_specifier bls_shortLoggingString];
  [v3 appendString:v5 withName:@"next"];

  v6 = [v3 build];

  return v6;
}

- (void)setSpecifier:(id)a3
{
}

- (NSEnumerator)enumerator
{
  return self->_enumerator;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (BLSHBacklightSceneHostEnvironment)environment
{
  return self->_environment;
}

- (BLSHEnvironmentDatesModel)sourceModel
{
  return self->_sourceModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceModel, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);

  objc_storeStrong((id *)&self->_specifier, 0);
}

@end