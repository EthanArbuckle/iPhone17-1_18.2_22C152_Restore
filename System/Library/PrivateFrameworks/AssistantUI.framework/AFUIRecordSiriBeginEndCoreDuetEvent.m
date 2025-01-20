@interface AFUIRecordSiriBeginEndCoreDuetEvent
@end

@implementation AFUIRecordSiriBeginEndCoreDuetEvent

void ___AFUIRecordSiriBeginEndCoreDuetEvent_block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF910] date];
  v3 = [MEMORY[0x263F35098] eventStreamWithName:@"/siri/ui"];
  v4 = [MEMORY[0x263F35088] eventWithStream:v3 startDate:v2 endDate:v2 identifierStringValue:*(void *)(a1 + 32) metadata:*(void *)(a1 + 40)];
  if (v4)
  {
    v5 = [MEMORY[0x263F350B8] knowledgeStore];
    v7[0] = v4;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
    [v5 saveObjects:v6 error:0];
  }
}

@end