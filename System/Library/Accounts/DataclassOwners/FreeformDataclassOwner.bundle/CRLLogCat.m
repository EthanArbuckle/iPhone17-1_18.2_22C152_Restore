@interface CRLLogCat
@end

@implementation CRLLogCat

void __CRLLogCat_SetCategoryEnabled_block_invoke(uint64_t a1)
{
  v2 = +[NSNotificationCenter defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  CFStringRef v5 = @"CRLLogCatCategoryKey";
  uint64_t v6 = v3;
  v4 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  [v2 postNotificationName:@"CRLLogCatCategoryToggled" object:0 userInfo:v4];
}

@end