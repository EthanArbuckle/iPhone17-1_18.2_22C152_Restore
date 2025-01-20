@interface ASDNullStream
- (id)readInputBlock;
- (id)writeMixBlock;
@end

@implementation ASDNullStream

- (id)readInputBlock
{
  v2 = [(ASDStream *)self physicalFormat];
  int v3 = [v2 bytesPerFrame];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__ASDNullStream_readInputBlock__block_invoke;
  v6[3] = &__block_descriptor_36_e195_i40__0I8r__AudioServerPlugInIOCycleInfo_QI_AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II__AudioTimeStamp_dQdQ_SMPTETime_ssIIIssss_II____dd_d_12_v20_v28I36l;
  int v7 = v3;
  v4 = (void *)MEMORY[0x22A63F100](v6);
  return v4;
}

uint64_t __31__ASDNullStream_readInputBlock__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  return 0;
}

- (id)writeMixBlock
{
  return &__block_literal_global;
}

uint64_t __30__ASDNullStream_writeMixBlock__block_invoke()
{
  return 0;
}

@end