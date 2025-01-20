@interface EKDirectoryGroup
+ (id)recordFromSearchResult:(id)a3;
@end

@implementation EKDirectoryGroup

+ (id)recordFromSearchResult:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___EKDirectoryGroup;
  id v3 = a3;
  v4 = objc_msgSendSuper2(&v7, sel_recordFromSearchResult_, v3);
  v5 = objc_msgSend(v3, "principalPath", v7.receiver, v7.super_class);

  [v4 setPrincipalPath:v5];

  return v4;
}

@end