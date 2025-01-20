@interface MIGroupContainer
+ (id)groupContainerWithIdentifier:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 error:(id *)a6;
@end

@implementation MIGroupContainer

+ (id)groupContainerWithIdentifier:(id)a3 forPersona:(id)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  char v14 = 0;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() containerWithIdentifier:v10 forPersona:v9 ofContentClass:7 createIfNeeded:v7 created:&v14 error:a6];

  if ([v11 makeContainerLiveWithError:a6]) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

@end