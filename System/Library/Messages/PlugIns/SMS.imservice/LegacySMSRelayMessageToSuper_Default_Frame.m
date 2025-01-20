@interface LegacySMSRelayMessageToSuper_Default_Frame
- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5;
@end

@implementation LegacySMSRelayMessageToSuper_Default_Frame

- (void)parser:(id)a3 context:(id)a4 foundCharacters:(id)a5
{
  v5.receiver = self;
  v5.super_class = (Class)LegacySMSRelayMessageToSuper_Default_Frame;
  -[LegacySMSRelayMessageToSuper_Default_Frame parser:context:foundCharacters:](&v5, "parser:context:foundCharacters:", a3, a4, objc_msgSend(a5, "stringByRemovingCharactersFromSet:", +[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet")));
}

@end