@interface WDEmptyUserActivityResponder
+ (id)emptyUserActivityResponder;
@end

@implementation WDEmptyUserActivityResponder

+ (id)emptyUserActivityResponder
{
  if (emptyUserActivityResponder_onceToken != -1) {
    dispatch_once(&emptyUserActivityResponder_onceToken, &__block_literal_global);
  }
  v2 = (void *)emptyUserActivityResponder__emptyUserActivityResponder;

  return v2;
}

uint64_t __58__WDEmptyUserActivityResponder_emptyUserActivityResponder__block_invoke()
{
  emptyUserActivityResponder__emptyUserActivityResponder = objc_alloc_init(WDEmptyUserActivityResponder);

  return MEMORY[0x270F9A758]();
}

@end