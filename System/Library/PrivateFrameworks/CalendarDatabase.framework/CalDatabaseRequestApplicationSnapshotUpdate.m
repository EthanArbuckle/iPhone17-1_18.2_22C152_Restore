@interface CalDatabaseRequestApplicationSnapshotUpdate
@end

@implementation CalDatabaseRequestApplicationSnapshotUpdate

void ___CalDatabaseRequestApplicationSnapshotUpdate_block_invoke()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  v1 = (void *)_CalDatabaseRequestApplicationSnapshotUpdate_systemService;
  _CalDatabaseRequestApplicationSnapshotUpdate_systemService = v0;

  uint64_t v8 = *MEMORY[0x1E4F625F0];
  uint64_t v6 = *MEMORY[0x1E4F62508];
  uint64_t v7 = MEMORY[0x1E4F1CC08];
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v9[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  uint64_t v4 = [MEMORY[0x1E4F629C8] optionsWithDictionary:v3];
  v5 = (void *)_CalDatabaseRequestApplicationSnapshotUpdate_options;
  _CalDatabaseRequestApplicationSnapshotUpdate_options = v4;
}

void ___CalDatabaseRequestApplicationSnapshotUpdate_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    [a3 code];
    CFLog();
  }
}

@end