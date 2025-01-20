@interface EMPKeyboardViewController
+ (id)createKeyboardViewController;
@end

@implementation EMPKeyboardViewController

+ (id)createKeyboardViewController
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F828D8]) initWithServiceRole:0];
  v3 = [v2 traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1) {
    [v2 setResizable:1];
  }
  return v2;
}

@end