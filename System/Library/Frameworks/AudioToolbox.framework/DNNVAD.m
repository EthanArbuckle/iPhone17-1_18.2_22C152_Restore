@interface DNNVAD
@end

@implementation DNNVAD

AudioComponent __DNNVAD_Initialize_block_invoke()
{
  *(_OWORD *)&v1.componentType = xmmword_1BB87B930;
  v1.componentFlagsMask = 0;
  AudioComponent result = AudioComponentFindNext(0, &v1);
  if (!result)
  {
    *(_OWORD *)&inDesc.componentType = *(_OWORD *)&v1.componentType;
    inDesc.componentFlagsMask = 0;
    return AudioComponentRegister(&inDesc, @"Apple: AUNeuralNetVAD", 0x10601u, (AudioComponentFactoryFunction)ausdk::APFactory<ausdk::AUBaseProcessMultipleLookup,AUNeuralNetVAD>::Factory);
  }
  return result;
}

@end