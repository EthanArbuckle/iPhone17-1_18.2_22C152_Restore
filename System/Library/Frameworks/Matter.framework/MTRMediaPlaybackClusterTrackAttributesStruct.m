@interface MTRMediaPlaybackClusterTrackAttributesStruct
- (MTRMediaPlaybackClusterTrackAttributesStruct)init;
- (NSString)displayName;
- (NSString)languageCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDisplayName:(id)a3;
- (void)setLanguageCode:(id)a3;
@end

@implementation MTRMediaPlaybackClusterTrackAttributesStruct

- (MTRMediaPlaybackClusterTrackAttributesStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRMediaPlaybackClusterTrackAttributesStruct;
  v2 = [(MTRMediaPlaybackClusterTrackAttributesStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    languageCode = v2->_languageCode;
    v2->_languageCode = (NSString *)&stru_26F969DC8;

    displayName = v3->_displayName;
    v3->_displayName = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMediaPlaybackClusterTrackAttributesStruct);
  objc_super v7 = objc_msgSend_languageCode(self, v5, v6);
  objc_msgSend_setLanguageCode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_displayName(self, v9, v10);
  objc_msgSend_setDisplayName_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: languageCode:%@; displayName:%@; >",
    v5,
    self->_languageCode,
  objc_super v7 = self->_displayName);

  return v7;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end