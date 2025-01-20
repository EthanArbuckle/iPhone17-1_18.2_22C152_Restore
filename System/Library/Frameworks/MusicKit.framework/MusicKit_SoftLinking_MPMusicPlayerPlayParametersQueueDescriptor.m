@interface MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor
- (MPMusicPlayerPlayParametersQueueDescriptor)_underlyingQueueDescriptor;
- (MusicKit_SoftLinking_MPMusicPlayerPlayParameters)containerPlayParameters;
- (MusicKit_SoftLinking_MPMusicPlayerPlayParameters)startItemPlayParameters;
- (MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor)initWithPlayParametersQueue:(id)a3;
- (NSData)playActivityRecommendationData;
- (NSString)playActivityFeatureName;
- (void)setContainerPlayParameters:(id)a3;
- (void)setEndTime:(double)a3 forItemWithPlayParameters:(id)a4;
- (void)setPlayActivityFeatureName:(id)a3;
- (void)setPlayActivityRecommendationData:(id)a3;
- (void)setStartItemPlayParameters:(id)a3;
- (void)setStartTime:(double)a3 forItemWithPlayParameters:(id)a4;
@end

@implementation MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor

- (MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor)initWithPlayParametersQueue:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor;
  v5 = [(MusicKit_SoftLinking_MPMusicPlayerPlayParametersQueueDescriptor *)&v22 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v10), "_underlyingPlayParameters", (void)v18);
          [v6 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v8);
    }

    v12 = (void *)[v6 copy];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v13 = (void *)getMPMusicPlayerPlayParametersQueueDescriptorClass_softClass;
    uint64_t v27 = getMPMusicPlayerPlayParametersQueueDescriptorClass_softClass;
    if (!getMPMusicPlayerPlayParametersQueueDescriptorClass_softClass)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __getMPMusicPlayerPlayParametersQueueDescriptorClass_block_invoke;
      v23[3] = &unk_26443F950;
      v23[4] = &v24;
      __getMPMusicPlayerPlayParametersQueueDescriptorClass_block_invoke((uint64_t)v23);
      v13 = (void *)v25[3];
    }
    v14 = v13;
    _Block_object_dispose(&v24, 8);
    uint64_t v15 = [[v14 alloc] initWithPlayParametersQueue:v12];
    underlyingQueueDescriptor = v5->_underlyingQueueDescriptor;
    v5->_underlyingQueueDescriptor = (MPMusicPlayerPlayParametersQueueDescriptor *)v15;
  }
  return v5;
}

- (MPMusicPlayerPlayParametersQueueDescriptor)_underlyingQueueDescriptor
{
  return self->_underlyingQueueDescriptor;
}

- (void)setPlayActivityFeatureName:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  id v4 = self->_playActivityFeatureName;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      playActivityFeatureName = self->_playActivityFeatureName;
      self->_playActivityFeatureName = v6;

      [(MPMusicPlayerPlayParametersQueueDescriptor *)self->_underlyingQueueDescriptor setPlayActivityFeatureName:v8];
    }
  }
}

- (void)setPlayActivityRecommendationData:(id)a3
{
  uint64_t v8 = (NSData *)a3;
  id v4 = self->_playActivityRecommendationData;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSData *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSData *)[(NSData *)v8 copy];
      playActivityRecommendationData = self->_playActivityRecommendationData;
      self->_playActivityRecommendationData = v6;

      [(MPMusicPlayerPlayParametersQueueDescriptor *)self->_underlyingQueueDescriptor setPlayActivityRecommendationData:v8];
    }
  }
}

- (void)setStartItemPlayParameters:(id)a3
{
  char v5 = (MusicKit_SoftLinking_MPMusicPlayerPlayParameters *)a3;
  p_startItemPlayParameters = &self->_startItemPlayParameters;
  if (self->_startItemPlayParameters != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_startItemPlayParameters, a3);
    id v7 = [(MusicKit_SoftLinking_MPMusicPlayerPlayParameters *)self->_startItemPlayParameters _underlyingPlayParameters];
    [(MPMusicPlayerPlayParametersQueueDescriptor *)self->_underlyingQueueDescriptor setStartItemPlayParameters:v7];

    char v5 = v8;
  }

  MEMORY[0x270F9A758](p_startItemPlayParameters, v5);
}

- (void)setContainerPlayParameters:(id)a3
{
  char v5 = (MusicKit_SoftLinking_MPMusicPlayerPlayParameters *)a3;
  p_containerPlayParameters = &self->_containerPlayParameters;
  if (self->_containerPlayParameters != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_containerPlayParameters, a3);
    id v7 = [(MusicKit_SoftLinking_MPMusicPlayerPlayParameters *)self->_containerPlayParameters _underlyingPlayParameters];
    [(MPMusicPlayerPlayParametersQueueDescriptor *)self->_underlyingQueueDescriptor setContainerPlayParameters:v7];

    char v5 = v8;
  }

  MEMORY[0x270F9A758](p_containerPlayParameters, v5);
}

- (void)setStartTime:(double)a3 forItemWithPlayParameters:(id)a4
{
  id v6 = [a4 _underlyingPlayParameters];
  [(MPMusicPlayerPlayParametersQueueDescriptor *)self->_underlyingQueueDescriptor setStartTime:v6 forItemWithPlayParameters:a3];
}

- (void)setEndTime:(double)a3 forItemWithPlayParameters:(id)a4
{
  id v6 = [a4 _underlyingPlayParameters];
  [(MPMusicPlayerPlayParametersQueueDescriptor *)self->_underlyingQueueDescriptor setEndTime:v6 forItemWithPlayParameters:a3];
}

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (NSData)playActivityRecommendationData
{
  return self->_playActivityRecommendationData;
}

- (MusicKit_SoftLinking_MPMusicPlayerPlayParameters)startItemPlayParameters
{
  return self->_startItemPlayParameters;
}

- (MusicKit_SoftLinking_MPMusicPlayerPlayParameters)containerPlayParameters
{
  return self->_containerPlayParameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPlayParameters, 0);
  objc_storeStrong((id *)&self->_startItemPlayParameters, 0);
  objc_storeStrong((id *)&self->_playActivityRecommendationData, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);

  objc_storeStrong((id *)&self->_underlyingQueueDescriptor, 0);
}

@end