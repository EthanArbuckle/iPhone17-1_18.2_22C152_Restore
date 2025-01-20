@interface NSOperationQueue(VSAdditions)
+ (id)queueWithName:()VSAdditions;
@end

@implementation NSOperationQueue(VSAdditions)

+ (id)queueWithName:()VSAdditions
{
  v3 = (objc_class *)MEMORY[0x1E4F28F08];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setName:v4];

  return v5;
}

@end