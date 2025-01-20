@interface MTRMediaPlaybackClusterTrackStruct
- (MTRMediaPlaybackClusterTrackAttributesStruct)trackAttributes;
- (MTRMediaPlaybackClusterTrackStruct)init;
- (NSString)id;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setId:(id)a3;
- (void)setTrackAttributes:(id)a3;
@end

@implementation MTRMediaPlaybackClusterTrackStruct

- (MTRMediaPlaybackClusterTrackStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRMediaPlaybackClusterTrackStruct;
  v2 = [(MTRMediaPlaybackClusterTrackStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    id = v2->_id;
    v2->_id = (NSString *)&stru_26F969DC8;

    trackAttributes = v3->_trackAttributes;
    v3->_trackAttributes = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMediaPlaybackClusterTrackStruct);
  objc_super v7 = objc_msgSend_id(self, v5, v6);
  objc_msgSend_setId_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_trackAttributes(self, v9, v10);
  objc_msgSend_setTrackAttributes_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: id:%@; trackAttributes:%@; >",
    v5,
    self->_id,
  objc_super v7 = self->_trackAttributes);

  return v7;
}

- (NSString)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (MTRMediaPlaybackClusterTrackAttributesStruct)trackAttributes
{
  return self->_trackAttributes;
}

- (void)setTrackAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackAttributes, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end