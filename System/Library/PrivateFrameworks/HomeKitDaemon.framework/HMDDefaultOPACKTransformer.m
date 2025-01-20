@interface HMDDefaultOPACKTransformer
+ (Class)valueClass;
+ (id)OPACKFromValue:(id)a3 error:(id *)a4;
+ (id)description;
+ (id)valueFromOPACK:(id)a3 error:(id *)a4;
@end

@implementation HMDDefaultOPACKTransformer

+ (id)valueFromOPACK:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

+ (id)OPACKFromValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  return v4;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

+ (id)description
{
  v2 = objc_opt_class();
  return (id)[v2 description];
}

@end