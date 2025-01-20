@interface ML3Genre(MPMediaAdditions)
+ (id)propertyForMPMediaEntityProperty:()MPMediaAdditions;
@end

@implementation ML3Genre(MPMediaAdditions)

+ (id)propertyForMPMediaEntityProperty:()MPMediaAdditions
{
  id v4 = a3;
  if (propertyForMPMediaEntityProperty__once_29 != -1) {
    dispatch_once(&propertyForMPMediaEntityProperty__once_29, &__block_literal_global_31_26491);
  }
  v5 = [(id)propertyForMPMediaEntityProperty__ML3ForMP_28 objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&off_1EE779868;
    objc_msgSendSuper2(&v10, sel_propertyForMPMediaEntityProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

@end