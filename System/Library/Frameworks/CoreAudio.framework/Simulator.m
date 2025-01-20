@interface Simulator
@end

@implementation Simulator

uint64_t __Simulator_SetPropertyData_block_invoke(uint64_t result)
{
  if (ADS::Simulator::sHost)
  {
    uint64_t v1 = *(unsigned int *)(result + 56);
    uint64_t v2 = *(unsigned int *)(result + 60);
    uint64_t v3 = *(void *)(result + 32);
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))ADS::Simulator::sHost;
    pthread_once(&ADS::Simulator::sStaticInitializer, (void (*)(void))ADS::Simulator::StaticInitializer);
    return v4(ADS::Simulator::sHost, v1, v2, v3);
  }
  return result;
}

@end