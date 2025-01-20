@interface KnowledgeConstructionXPC.Server
- (_TtCC24IntelligencePlatformCore24KnowledgeConstructionXPC6Server)init;
- (void)checkInWithCompletion:(id)a3;
- (void)runFastpassPipelineWithReason:(unint64_t)a3 completion:(id)a4;
- (void)runFullPipelineWithReason:(unint64_t)a3 completion:(id)a4;
- (void)stopPipelineWithCompletion:(id)a3;
@end

@implementation KnowledgeConstructionXPC.Server

- (void)runFullPipelineWithReason:(unint64_t)a3 completion:(id)a4
{
}

- (void)runFastpassPipelineWithReason:(unint64_t)a3 completion:(id)a4
{
}

- (void)stopPipelineWithCompletion:(id)a3
{
}

- (void)checkInWithCompletion:(id)a3
{
}

- (_TtCC24IntelligencePlatformCore24KnowledgeConstructionXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore24KnowledgeConstructionXPC6Server *)KnowledgeConstructionXPC.Server.init()();
}

@end