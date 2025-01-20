@interface CNClassKitServices
+ (id)objectsMatching:(id)a3 fromStore:(id)a4;
@end

@implementation CNClassKitServices

+ (id)objectsMatching:(id)a3 fromStore:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F5A4B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  v9 = [v8 completionHandlerAdapter];
  [v6 objectsMatching:v7 completion:v9];

  v10 = (void *)MEMORY[0x1E4F5A4E0];
  v11 = [v8 future];
  v12 = [v10 resultWithFuture:v11];

  return v12;
}

@end