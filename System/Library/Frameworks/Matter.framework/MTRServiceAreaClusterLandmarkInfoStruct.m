@interface MTRServiceAreaClusterLandmarkInfoStruct
- (MTRServiceAreaClusterLandmarkInfoStruct)init;
- (NSNumber)landmarkTag;
- (NSNumber)relativePositionTag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLandmarkTag:(id)a3;
- (void)setRelativePositionTag:(id)a3;
@end

@implementation MTRServiceAreaClusterLandmarkInfoStruct

- (MTRServiceAreaClusterLandmarkInfoStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRServiceAreaClusterLandmarkInfoStruct;
  v2 = [(MTRServiceAreaClusterLandmarkInfoStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    landmarkTag = v2->_landmarkTag;
    v2->_landmarkTag = (NSNumber *)&unk_26F9C8620;

    relativePositionTag = v3->_relativePositionTag;
    v3->_relativePositionTag = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRServiceAreaClusterLandmarkInfoStruct);
  objc_super v7 = objc_msgSend_landmarkTag(self, v5, v6);
  objc_msgSend_setLandmarkTag_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_relativePositionTag(self, v9, v10);
  objc_msgSend_setRelativePositionTag_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: landmarkTag:%@; relativePositionTag:%@; >",
    v5,
    self->_landmarkTag,
  objc_super v7 = self->_relativePositionTag);

  return v7;
}

- (NSNumber)landmarkTag
{
  return self->_landmarkTag;
}

- (void)setLandmarkTag:(id)a3
{
}

- (NSNumber)relativePositionTag
{
  return self->_relativePositionTag;
}

- (void)setRelativePositionTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePositionTag, 0);

  objc_storeStrong((id *)&self->_landmarkTag, 0);
}

@end