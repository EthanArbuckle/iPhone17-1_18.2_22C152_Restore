@interface MusicKit_SoftLinking_MPMusicPlayerPlayParameters
- (MPMusicPlayerPlayParameters)_underlyingPlayParameters;
- (MusicKit_SoftLinking_MPMusicPlayerPlayParameters)initWithDictionary:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPMusicPlayerPlayParameters

- (MusicKit_SoftLinking_MPMusicPlayerPlayParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicKit_SoftLinking_MPMusicPlayerPlayParameters;
  v5 = [(MusicKit_SoftLinking_MPMusicPlayerPlayParameters *)&v11 init];
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v6 = (void *)getMPMusicPlayerPlayParametersClass_softClass;
    uint64_t v16 = getMPMusicPlayerPlayParametersClass_softClass;
    if (!getMPMusicPlayerPlayParametersClass_softClass)
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __getMPMusicPlayerPlayParametersClass_block_invoke;
      v12[3] = &unk_26443F950;
      v12[4] = &v13;
      __getMPMusicPlayerPlayParametersClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = v6;
    _Block_object_dispose(&v13, 8);
    uint64_t v8 = [[v7 alloc] initWithDictionary:v4];
    underlyingPlayParameters = v5->_underlyingPlayParameters;
    v5->_underlyingPlayParameters = (MPMusicPlayerPlayParameters *)v8;

    if (!v5->_underlyingPlayParameters)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (MPMusicPlayerPlayParameters)_underlyingPlayParameters
{
  return self->_underlyingPlayParameters;
}

- (void).cxx_destruct
{
}

@end