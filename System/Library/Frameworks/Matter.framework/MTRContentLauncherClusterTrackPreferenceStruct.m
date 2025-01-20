@interface MTRContentLauncherClusterTrackPreferenceStruct
- (MTRContentLauncherClusterTrackPreferenceStruct)init;
- (NSArray)characteristics;
- (NSNumber)audioOutputIndex;
- (NSString)languageCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioOutputIndex:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setLanguageCode:(id)a3;
@end

@implementation MTRContentLauncherClusterTrackPreferenceStruct

- (MTRContentLauncherClusterTrackPreferenceStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRContentLauncherClusterTrackPreferenceStruct;
  v2 = [(MTRContentLauncherClusterTrackPreferenceStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    languageCode = v2->_languageCode;
    v2->_languageCode = (NSString *)&stru_26F969DC8;

    characteristics = v3->_characteristics;
    v3->_characteristics = 0;

    audioOutputIndex = v3->_audioOutputIndex;
    v3->_audioOutputIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentLauncherClusterTrackPreferenceStruct);
  v7 = objc_msgSend_languageCode(self, v5, v6);
  objc_msgSend_setLanguageCode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_characteristics(self, v9, v10);
  objc_msgSend_setCharacteristics_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_audioOutputIndex(self, v13, v14);
  objc_msgSend_setAudioOutputIndex_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: languageCode:%@; characteristics:%@; audioOutputIndex:%@; >",
    v5,
    self->_languageCode,
    self->_characteristics,
  v7 = self->_audioOutputIndex);

  return v7;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
}

- (NSNumber)audioOutputIndex
{
  return self->_audioOutputIndex;
}

- (void)setAudioOutputIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioOutputIndex, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);

  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end