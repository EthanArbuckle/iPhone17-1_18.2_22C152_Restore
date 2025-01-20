@interface PHASEGlobalMetaParameterAsset
+ (PHASEGlobalMetaParameterAsset)new;
- (PHASEGlobalMetaParameterAsset)init;
- (PHASEGlobalMetaParameterAsset)initWithUID:(id)a3 assetRegistry:(id)a4;
- (PHASEGlobalMetaParameterAsset)initWithUID:(id)a3 metaParameterWeakReference:(const void *)a4 assetRegistry:(id)a5;
- (PHASEGlobalMetaParameterAsset)initWithUID:(id)a3 ownedMetaParameter:()unique_ptr<Phase:(std:(id)a5 :default_delete<Phase::MetaParameter>>)a4 :MetaParameter assetRegistry:;
- (const)getMetaParameter;
- (id).cxx_construct;
- (unint64_t)sizeInBytes;
- (void)getMetaParamState;
@end

@implementation PHASEGlobalMetaParameterAsset

- (PHASEGlobalMetaParameterAsset)init
{
  return 0;
}

+ (PHASEGlobalMetaParameterAsset)new
{
  return 0;
}

- (PHASEGlobalMetaParameterAsset)initWithUID:(id)a3 assetRegistry:(id)a4
{
  return 0;
}

- (PHASEGlobalMetaParameterAsset)initWithUID:(id)a3 ownedMetaParameter:()unique_ptr<Phase:(std:(id)a5 :default_delete<Phase::MetaParameter>>)a4 :MetaParameter assetRegistry:
{
  v6 = [(PHASEGlobalMetaParameterAsset *)self initWithUID:a3 metaParameterWeakReference:*(void *)a4.__ptr_.__value_ assetRegistry:a5];
  v7 = v6;
  if (v6)
  {
    v8 = *(MetaParameter **)a4.__ptr_.__value_;
    *(void *)a4.__ptr_.__value_ = 0;
    value = v6->_metaParamOwnedAsset.__ptr_.__value_;
    v7->_metaParamOwnedAsset.__ptr_.__value_ = v8;
    if (value) {
      MEMORY[0x223C938A0](value, 0x1000C40D9B47DDELL);
    }
    v10 = v7;
  }

  return v7;
}

- (PHASEGlobalMetaParameterAsset)initWithUID:(id)a3 metaParameterWeakReference:(const void *)a4 assetRegistry:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PHASEGlobalMetaParameterAsset;
  v6 = [(PHASEAsset *)&v10 initWithUID:a3 assetRegistry:a5];
  v7 = v6;
  if (v6)
  {
    v6->_metaParamReference = a4;
    v8 = v6;
  }

  return v7;
}

- (const)getMetaParameter
{
  return self->_metaParamReference;
}

- (void)getMetaParamState
{
  return &self->_metaParamState;
}

- (unint64_t)sizeInBytes
{
  return 464;
}

- (void).cxx_destruct
{
  p_mFader = &self->_metaParamState.mFader;
  std::vector<Phase::Envelope<double>::SegmentInternal,std::allocator<Phase::Envelope<double>::SegmentInternal>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_mFader);
  value = self->_metaParamOwnedAsset.__ptr_.__value_;
  self->_metaParamOwnedAsset.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x223C938A0](value, 0x1000C40D9B47DDELL);
  }
}

- (id).cxx_construct
{
  self->_metaParamOwnedAsset.__ptr_.__value_ = 0;
  Phase::Fader<double>::Fader((Phase::Logger *)&self->_metaParamState.mFader, 0.0);
  return self;
}

@end