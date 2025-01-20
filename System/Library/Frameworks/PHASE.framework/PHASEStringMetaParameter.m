@interface PHASEStringMetaParameter
+ (PHASEStringMetaParameter)new;
- (PHASEStringMetaParameter)init;
- (PHASEStringMetaParameter)initWithUID:(id)a3 delegate:(id)a4;
- (PHASEStringMetaParameter)initWithUID:(id)a3 value:(id)a4 delegate:(id)a5;
@end

@implementation PHASEStringMetaParameter

- (PHASEStringMetaParameter)init
{
  return 0;
}

+ (PHASEStringMetaParameter)new
{
  return 0;
}

- (PHASEStringMetaParameter)initWithUID:(id)a3 delegate:(id)a4
{
  return 0;
}

- (PHASEStringMetaParameter)initWithUID:(id)a3 value:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHASEStringMetaParameter;
  v11 = [(PHASEMetaParameter *)&v15 initWithUID:v8 delegate:v10];
  v12 = v11;
  if (v11)
  {
    [(PHASEMetaParameter *)v11 setValue:v9];
    v13 = v12;
  }

  return v12;
}

@end