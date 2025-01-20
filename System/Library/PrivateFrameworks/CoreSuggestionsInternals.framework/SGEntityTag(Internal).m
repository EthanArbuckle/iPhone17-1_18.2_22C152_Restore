@interface SGEntityTag(Internal)
+ (id)identity:()Internal;
+ (id)messageWithEmailKey:()Internal;
@end

@implementation SGEntityTag(Internal)

+ (id)messageWithEmailKey:()Internal
{
  id v4 = a3;
  v5 = [v4 messageId];
  v6 = [v4 source];

  v7 = [a1 messageWithMessageId:v5 fromSource:v6];

  return v7;
}

+ (id)identity:()Internal
{
  v3 = (void *)MEMORY[0x1E4F5D9F0];
  id v4 = [a3 serialize];
  v5 = [v3 tagForLabel:@"ID" value:v4];

  return v5;
}

@end