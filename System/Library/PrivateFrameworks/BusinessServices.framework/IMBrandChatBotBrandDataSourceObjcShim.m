@interface IMBrandChatBotBrandDataSourceObjcShim
- (BSOpaqueWrapper)opaqueWrapper;
- (IMBrandChatBotBrandDataSourceObjcShim)init;
@end

@implementation IMBrandChatBotBrandDataSourceObjcShim

- (BSOpaqueWrapper)opaqueWrapper
{
  return (BSOpaqueWrapper *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___IMBrandChatBotBrandDataSourceObjcShim_opaqueWrapper));
}

- (IMBrandChatBotBrandDataSourceObjcShim)init
{
  return (IMBrandChatBotBrandDataSourceObjcShim *)RCSChatBotBrandDataSourceObjcShim.init()();
}

- (void).cxx_destruct
{
}

@end