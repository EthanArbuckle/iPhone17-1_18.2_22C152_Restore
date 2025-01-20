@interface PHASESoundAsset
+ (PHASESoundAsset)new;
- (NSData)data;
- (NSURL)url;
- (PHASEAssetType)type;
- (PHASESoundAsset)init;
- (PHASESoundAsset)initWithData:(id)a3 uid:(id)a4 normalizationMode:(int64_t)a5 soundAssetInfo:()unique_ptr<Phase:(std:(id)a7 :default_delete<Phase::Controller::SoundAssetInfo>>)a6 :Controller::SoundAssetInfo assetRegistry:;
- (PHASESoundAsset)initWithUID:(id)a3 assetRegistry:(id)a4;
- (PHASESoundAsset)initWithURL:(id)a3 uid:(id)a4 assetType:(int64_t)a5 normalizationMode:(int64_t)a6 soundAssetInfo:()unique_ptr<Phase:(std:(id)a8 :default_delete<Phase::Controller::SoundAssetInfo>>)a7 :Controller::SoundAssetInfo assetRegistry:;
- (SoundAssetInfo)getAssetInfo;
- (id).cxx_construct;
- (int64_t)normalizationMode;
- (unint64_t)sizeInBytes;
@end

@implementation PHASESoundAsset

- (PHASESoundAsset)init
{
  return 0;
}

+ (PHASESoundAsset)new
{
  return 0;
}

- (PHASESoundAsset)initWithUID:(id)a3 assetRegistry:(id)a4
{
  return 0;
}

- (PHASESoundAsset)initWithURL:(id)a3 uid:(id)a4 assetType:(int64_t)a5 normalizationMode:(int64_t)a6 soundAssetInfo:()unique_ptr<Phase:(std:(id)a8 :default_delete<Phase::Controller::SoundAssetInfo>>)a7 :Controller::SoundAssetInfo assetRegistry:
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PHASESoundAsset;
  v18 = [(PHASEAsset *)&v24 initWithUID:v16 assetRegistry:v17];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_url, a3);
    data = v19->_data;
    v19->_data = 0;

    v19->_type = a5;
    v19->_normalizationMode = a6;
    var0 = a7.__ptr_.__value_->var0;
    a7.__ptr_.__value_->var0 = 0;
    value = v19->_soundAssetInfo.__ptr_.__value_;
    v19->_soundAssetInfo.__ptr_.__value_ = (SoundAssetInfo *)var0;
    if (value) {
      (*((void (**)(SoundAssetInfo *))value->var0 + 1))(value);
    }
  }

  return v19;
}

- (PHASESoundAsset)initWithData:(id)a3 uid:(id)a4 normalizationMode:(int64_t)a5 soundAssetInfo:()unique_ptr<Phase:(std:(id)a7 :default_delete<Phase::Controller::SoundAssetInfo>>)a6 :Controller::SoundAssetInfo assetRegistry:
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)PHASESoundAsset;
  id v16 = [(PHASEAsset *)&v22 initWithUID:v14 assetRegistry:v15];
  id v17 = v16;
  if (v16)
  {
    url = v16->_url;
    v16->_url = 0;

    objc_storeStrong((id *)&v17->_data, a3);
    v17->_type = 0;
    v17->_normalizationMode = a5;
    var0 = a6.__ptr_.__value_->var0;
    a6.__ptr_.__value_->var0 = 0;
    value = v17->_soundAssetInfo.__ptr_.__value_;
    v17->_soundAssetInfo.__ptr_.__value_ = (SoundAssetInfo *)var0;
    if (value) {
      (*((void (**)(SoundAssetInfo *))value->var0 + 1))(value);
    }
  }

  return v17;
}

- (SoundAssetInfo)getAssetInfo
{
  return self->_soundAssetInfo.__ptr_.__value_;
}

- (unint64_t)sizeInBytes
{
  return (*((uint64_t (**)(void))self->_soundAssetInfo.__ptr_.__value_->var0 + 4))();
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (PHASEAssetType)type
{
  return self->_type;
}

- (int64_t)normalizationMode
{
  return self->_normalizationMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_owningDataBundleIdentifer, 0);
  value = self->_soundAssetInfo.__ptr_.__value_;
  self->_soundAssetInfo.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = (void (*)(void))*((void *)value->var0 + 1);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end