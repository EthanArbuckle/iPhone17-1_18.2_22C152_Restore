@interface CoreKnowledgeXPCUtils
+ (id)CKServiceXPCInterface;
- (_TtC13CoreKnowledge21CoreKnowledgeXPCUtils)init;
@end

@implementation CoreKnowledgeXPCUtils

- (_TtC13CoreKnowledge21CoreKnowledgeXPCUtils)init
{
  return (_TtC13CoreKnowledge21CoreKnowledgeXPCUtils *)CoreKnowledgeXPCUtils.init()();
}

+ (id)CKServiceXPCInterface
{
  v2 = (void *)static CoreKnowledgeXPCUtils.CKServiceXPCInterface()();
  return v2;
}

@end