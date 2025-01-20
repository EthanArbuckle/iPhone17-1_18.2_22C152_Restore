@interface MTRMediaPlaybackClusterPlaybackPositionStruct
- (MTRMediaPlaybackClusterPlaybackPositionStruct)init;
- (NSNumber)position;
- (NSNumber)updatedAt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPosition:(NSNumber *)position;
- (void)setUpdatedAt:(NSNumber *)updatedAt;
@end

@implementation MTRMediaPlaybackClusterPlaybackPositionStruct

- (MTRMediaPlaybackClusterPlaybackPositionStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRMediaPlaybackClusterPlaybackPositionStruct;
  v2 = [(MTRMediaPlaybackClusterPlaybackPositionStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    updatedAt = v2->_updatedAt;
    v2->_updatedAt = (NSNumber *)&unk_26F9C8620;

    position = v3->_position;
    v3->_position = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMediaPlaybackClusterPlaybackPositionStruct);
  objc_super v7 = objc_msgSend_updatedAt(self, v5, v6);
  objc_msgSend_setUpdatedAt_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_position(self, v9, v10);
  objc_msgSend_setPosition_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: updatedAt:%@; position:%@; >",
    v5,
    self->_updatedAt,
  objc_super v7 = self->_position);

  return v7;
}

- (NSNumber)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(NSNumber *)updatedAt
{
}

- (NSNumber)position
{
  return self->_position;
}

- (void)setPosition:(NSNumber *)position
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);

  objc_storeStrong((id *)&self->_updatedAt, 0);
}

@end