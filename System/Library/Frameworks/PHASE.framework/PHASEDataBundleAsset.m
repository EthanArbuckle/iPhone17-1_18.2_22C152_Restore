@interface PHASEDataBundleAsset
+ (id)new;
- (NSURL)url;
- (PHASEDataBundleAsset)init;
- (PHASEDataBundleAsset)initWithUID:(id)a3 assetRegistry:(id)a4;
- (PHASEDataBundleAsset)initWithURL:(id)a3 uid:(id)a4 dataBundle:()unique_ptr<Phase:(std:(id)a6 :default_delete<Phase::DataBundle>>)a5 :DataBundle assetRegistry:;
- (const)getDataBundle;
- (id).cxx_construct;
- (unint64_t)sizeInBytes;
@end

@implementation PHASEDataBundleAsset

- (PHASEDataBundleAsset)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEDataBundleAsset)initWithUID:(id)a3 assetRegistry:(id)a4
{
  return 0;
}

- (PHASEDataBundleAsset)initWithURL:(id)a3 uid:(id)a4 dataBundle:()unique_ptr<Phase:(std:(id)a6 :default_delete<Phase::DataBundle>>)a5 :DataBundle assetRegistry:
{
  id v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHASEDataBundleAsset;
  v12 = [(PHASEAsset *)&v17 initWithUID:a4 assetRegistry:a6];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    v14 = *(DataBundle **)a5.__ptr_.__value_;
    *(void *)a5.__ptr_.__value_ = 0;
    value = v13->_dataBundle.__ptr_.__value_;
    v13->_dataBundle.__ptr_.__value_ = v14;
    if (value) {
      std::default_delete<Phase::DataBundle>::operator()[abi:ne180100]((uint64_t)&v13->_dataBundle, value);
    }
  }

  return v13;
}

- (const)getDataBundle
{
  return self->_dataBundle.__ptr_.__value_;
}

- (unint64_t)sizeInBytes
{
  v2 = [(PHASEDataBundleAsset *)self getDataBundle];
  uint64_t v3 = v2[1];
  if (v3)
  {
    v4 = (unsigned int *)(v2[2] + 64);
    uint64_t v5 = 72;
    do
    {
      v5 += 4 * *(v4 - 6)
          + 8 * (*(v4 - 10) + (unint64_t)*(v4 - 14) + *(v4 - 6))
          + 464 * *v4
          + v4[4]
          + 5944 * v4[8]
          + 120;
      v4 += 30;
      --v3;
    }
    while (v3);
  }
  else
  {
    uint64_t v5 = 72;
  }
  return v5 + 1064 * v2[3] + 1176 * v2[5] + 464 * v2[7];
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  value = self->_dataBundle.__ptr_.__value_;
  self->_dataBundle.__ptr_.__value_ = 0;
  if (value)
  {
    std::default_delete<Phase::DataBundle>::operator()[abi:ne180100]((uint64_t)&self->_dataBundle, value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end