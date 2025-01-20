@interface MTRScenesManagementClusterSceneInfoStruct
- (MTRScenesManagementClusterSceneInfoStruct)init;
- (NSNumber)currentGroup;
- (NSNumber)currentScene;
- (NSNumber)fabricIndex;
- (NSNumber)remainingCapacity;
- (NSNumber)sceneCount;
- (NSNumber)sceneValid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCurrentGroup:(id)a3;
- (void)setCurrentScene:(id)a3;
- (void)setFabricIndex:(id)a3;
- (void)setRemainingCapacity:(id)a3;
- (void)setSceneCount:(id)a3;
- (void)setSceneValid:(id)a3;
@end

@implementation MTRScenesManagementClusterSceneInfoStruct

- (MTRScenesManagementClusterSceneInfoStruct)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRScenesManagementClusterSceneInfoStruct;
  v2 = [(MTRScenesManagementClusterSceneInfoStruct *)&v11 init];
  v3 = v2;
  if (v2)
  {
    sceneCount = v2->_sceneCount;
    v2->_sceneCount = (NSNumber *)&unk_26F9C8620;

    currentScene = v3->_currentScene;
    v3->_currentScene = (NSNumber *)&unk_26F9C8620;

    currentGroup = v3->_currentGroup;
    v3->_currentGroup = (NSNumber *)&unk_26F9C8620;

    sceneValid = v3->_sceneValid;
    v3->_sceneValid = (NSNumber *)&unk_26F9C8620;

    remainingCapacity = v3->_remainingCapacity;
    v3->_remainingCapacity = (NSNumber *)&unk_26F9C8620;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRScenesManagementClusterSceneInfoStruct);
  v7 = objc_msgSend_sceneCount(self, v5, v6);
  objc_msgSend_setSceneCount_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_currentScene(self, v9, v10);
  objc_msgSend_setCurrentScene_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_currentGroup(self, v13, v14);
  objc_msgSend_setCurrentGroup_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_sceneValid(self, v17, v18);
  objc_msgSend_setSceneValid_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_remainingCapacity(self, v21, v22);
  objc_msgSend_setRemainingCapacity_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_fabricIndex(self, v25, v26);
  objc_msgSend_setFabricIndex_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: sceneCount:%@; currentScene:%@; currentGroup:%@; sceneValid:%@; remainingCapacity:%@; fabricIndex:%@; >",
    v5,
    self->_sceneCount,
    self->_currentScene,
    self->_currentGroup,
    self->_sceneValid,
    self->_remainingCapacity,
  v7 = self->_fabricIndex);

  return v7;
}

- (NSNumber)sceneCount
{
  return self->_sceneCount;
}

- (void)setSceneCount:(id)a3
{
}

- (NSNumber)currentScene
{
  return self->_currentScene;
}

- (void)setCurrentScene:(id)a3
{
}

- (NSNumber)currentGroup
{
  return self->_currentGroup;
}

- (void)setCurrentGroup:(id)a3
{
}

- (NSNumber)sceneValid
{
  return self->_sceneValid;
}

- (void)setSceneValid:(id)a3
{
}

- (NSNumber)remainingCapacity
{
  return self->_remainingCapacity;
}

- (void)setRemainingCapacity:(id)a3
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_remainingCapacity, 0);
  objc_storeStrong((id *)&self->_sceneValid, 0);
  objc_storeStrong((id *)&self->_currentGroup, 0);
  objc_storeStrong((id *)&self->_currentScene, 0);

  objc_storeStrong((id *)&self->_sceneCount, 0);
}

@end