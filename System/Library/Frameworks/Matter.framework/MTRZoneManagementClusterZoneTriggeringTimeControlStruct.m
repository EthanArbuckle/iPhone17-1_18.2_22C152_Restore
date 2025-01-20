@interface MTRZoneManagementClusterZoneTriggeringTimeControlStruct
- (MTRZoneManagementClusterZoneTriggeringTimeControlStruct)init;
- (NSNumber)augmentationDuration;
- (NSNumber)blindDuration;
- (NSNumber)initialDuration;
- (NSNumber)maxDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAugmentationDuration:(id)a3;
- (void)setBlindDuration:(id)a3;
- (void)setInitialDuration:(id)a3;
- (void)setMaxDuration:(id)a3;
@end

@implementation MTRZoneManagementClusterZoneTriggeringTimeControlStruct

- (MTRZoneManagementClusterZoneTriggeringTimeControlStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRZoneManagementClusterZoneTriggeringTimeControlStruct;
  v2 = [(MTRZoneManagementClusterZoneTriggeringTimeControlStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    initialDuration = v2->_initialDuration;
    v2->_initialDuration = (NSNumber *)&unk_26F9C8620;

    augmentationDuration = v3->_augmentationDuration;
    v3->_augmentationDuration = (NSNumber *)&unk_26F9C8620;

    maxDuration = v3->_maxDuration;
    v3->_maxDuration = (NSNumber *)&unk_26F9C8620;

    blindDuration = v3->_blindDuration;
    v3->_blindDuration = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRZoneManagementClusterZoneTriggeringTimeControlStruct);
  v7 = objc_msgSend_initialDuration(self, v5, v6);
  objc_msgSend_setInitialDuration_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_augmentationDuration(self, v9, v10);
  objc_msgSend_setAugmentationDuration_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_maxDuration(self, v13, v14);
  objc_msgSend_setMaxDuration_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_blindDuration(self, v17, v18);
  objc_msgSend_setBlindDuration_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: initialDuration:%@; augmentationDuration:%@; maxDuration:%@; blindDuration:%@; >",
    v5,
    self->_initialDuration,
    self->_augmentationDuration,
    self->_maxDuration,
  v7 = self->_blindDuration);

  return v7;
}

- (NSNumber)initialDuration
{
  return self->_initialDuration;
}

- (void)setInitialDuration:(id)a3
{
}

- (NSNumber)augmentationDuration
{
  return self->_augmentationDuration;
}

- (void)setAugmentationDuration:(id)a3
{
}

- (NSNumber)maxDuration
{
  return self->_maxDuration;
}

- (void)setMaxDuration:(id)a3
{
}

- (NSNumber)blindDuration
{
  return self->_blindDuration;
}

- (void)setBlindDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blindDuration, 0);
  objc_storeStrong((id *)&self->_maxDuration, 0);
  objc_storeStrong((id *)&self->_augmentationDuration, 0);

  objc_storeStrong((id *)&self->_initialDuration, 0);
}

@end