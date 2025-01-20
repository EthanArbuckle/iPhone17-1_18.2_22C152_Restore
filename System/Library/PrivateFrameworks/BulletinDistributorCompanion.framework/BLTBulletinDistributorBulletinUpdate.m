@interface BLTBulletinDistributorBulletinUpdate
+ (id)bulletinUpdateWithType:(unint64_t)a3 bulletin:(id)a4 feed:(unint64_t)a5;
- (BBBulletin)bulletin;
- (unint64_t)feed;
- (unint64_t)updateType;
- (void)setBulletin:(id)a3;
- (void)setFeed:(unint64_t)a3;
- (void)setUpdateType:(unint64_t)a3;
@end

@implementation BLTBulletinDistributorBulletinUpdate

+ (id)bulletinUpdateWithType:(unint64_t)a3 bulletin:(id)a4 feed:(unint64_t)a5
{
  id v7 = a4;
  v8 = objc_alloc_init(BLTBulletinDistributorBulletinUpdate);
  [(BLTBulletinDistributorBulletinUpdate *)v8 setUpdateType:a3];
  [(BLTBulletinDistributorBulletinUpdate *)v8 setBulletin:v7];

  [(BLTBulletinDistributorBulletinUpdate *)v8 setFeed:a5];
  return v8;
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (void)setUpdateType:(unint64_t)a3
{
  self->_updateType = a3;
}

- (BBBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
}

- (unint64_t)feed
{
  return self->_feed;
}

- (void)setFeed:(unint64_t)a3
{
  self->_feed = a3;
}

- (void).cxx_destruct
{
}

@end