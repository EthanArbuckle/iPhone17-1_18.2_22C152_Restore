@interface CNPropertyNameForResult
@end

@implementation CNPropertyNameForResult

void ___CNPropertyNameForResult_block_invoke()
{
  v12[9] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F1B7C8];
  uint64_t v1 = *MEMORY[0x1E4F5EF88];
  v11[0] = *MEMORY[0x1E4F5F0B0];
  v11[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1B798];
  v12[0] = v0;
  v12[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1B7B0];
  uint64_t v4 = *MEMORY[0x1E4F5F0A8];
  v11[2] = *MEMORY[0x1E4F5F110];
  v11[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1B7C0];
  v12[2] = v3;
  v12[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4F1B7A0];
  uint64_t v7 = *MEMORY[0x1E4F5EFA0];
  v11[4] = *MEMORY[0x1E4F5EFD0];
  v11[5] = v7;
  v12[4] = v6;
  v12[5] = &stru_1EF5023D8;
  uint64_t v8 = *MEMORY[0x1E4F5F078];
  v11[6] = *MEMORY[0x1E4F5EF90];
  v11[7] = v8;
  v12[6] = &stru_1EF5023D8;
  v12[7] = &stru_1EF5023D8;
  v11[8] = *MEMORY[0x1E4F5F058];
  v12[8] = &stru_1EF5023D8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:9];
  v10 = (void *)_CNPropertyNameForResult_mapping;
  _CNPropertyNameForResult_mapping = v9;
}

@end