@interface ML3AlbumArtist(MPMediaAdditions)
+ (id)propertyForMPMediaEntityProperty:()MPMediaAdditions;
@end

@implementation ML3AlbumArtist(MPMediaAdditions)

+ (id)propertyForMPMediaEntityProperty:()MPMediaAdditions
{
  id v4 = a3;
  if (propertyForMPMediaEntityProperty__once_19 != -1) {
    dispatch_once(&propertyForMPMediaEntityProperty__once_19, &__block_literal_global_21_26499);
  }
  v5 = [(id)propertyForMPMediaEntityProperty__ML3ForMP_18 objectForKeyedSubscript:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&off_1EE779620;
    objc_msgSendSuper2(&v10, sel_propertyForMPMediaEntityProperty_, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

@end