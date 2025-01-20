@interface CCMutableSetChange
- (BOOL)containsChanges;
- (BOOL)containsContentHash:(id)a3;
- (CCMutableSetChange)initWithSharedItem:(id)a3 changeType:(unsigned __int16)a4;
- (CCSharedItem)sharedItem;
- (NSMutableOrderedSet)addedDevices;
- (NSMutableOrderedSet)addedLocalInstances;
- (NSMutableOrderedSet)allDevices;
- (NSMutableOrderedSet)allLocalInstances;
- (NSMutableOrderedSet)removedDevices;
- (NSMutableOrderedSet)removedLocalInstances;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)sharedItemChangeType;
- (void)setSharedItemChangeType:(unsigned __int16)a3;
@end

@implementation CCMutableSetChange

- (CCMutableSetChange)initWithSharedItem:(id)a3 changeType:(unsigned __int16)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CCMutableSetChange;
  v8 = [(CCMutableSetChange *)&v23 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sharedItem, a3);
    v9->_sharedItemChangeType = a4;
    uint64_t v10 = objc_opt_new();
    allDevices = v9->_allDevices;
    v9->_allDevices = (NSMutableOrderedSet *)v10;

    uint64_t v12 = objc_opt_new();
    addedDevices = v9->_addedDevices;
    v9->_addedDevices = (NSMutableOrderedSet *)v12;

    uint64_t v14 = objc_opt_new();
    removedDevices = v9->_removedDevices;
    v9->_removedDevices = (NSMutableOrderedSet *)v14;

    uint64_t v16 = objc_opt_new();
    allLocalInstances = v9->_allLocalInstances;
    v9->_allLocalInstances = (NSMutableOrderedSet *)v16;

    uint64_t v18 = objc_opt_new();
    addedLocalInstances = v9->_addedLocalInstances;
    v9->_addedLocalInstances = (NSMutableOrderedSet *)v18;

    uint64_t v20 = objc_opt_new();
    removedLocalInstances = v9->_removedLocalInstances;
    v9->_removedLocalInstances = (NSMutableOrderedSet *)v20;
  }
  return v9;
}

- (BOOL)containsChanges
{
  return [(NSMutableOrderedSet *)self->_addedDevices count]
      || [(NSMutableOrderedSet *)self->_removedDevices count]
      || [(NSMutableOrderedSet *)self->_addedLocalInstances count]
      || [(NSMutableOrderedSet *)self->_removedLocalInstances count] != 0;
}

- (BOOL)containsContentHash:(id)a3
{
  if (!a3) {
    return 0;
  }
  sharedItem = self->_sharedItem;
  id v4 = a3;
  v5 = [(CCSharedItem *)sharedItem sharedIdentifier];
  char v6 = [v5 isEqualToNumber:v4];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CCSetChange alloc];
  uint64_t sharedItemChangeType = self->_sharedItemChangeType;
  sharedItem = self->_sharedItem;
  id v7 = [(NSMutableOrderedSet *)self->_allDevices array];
  v8 = [(NSMutableOrderedSet *)self->_addedDevices array];
  v9 = [(NSMutableOrderedSet *)self->_removedDevices array];
  uint64_t v10 = [(NSMutableOrderedSet *)self->_allLocalInstances array];
  v11 = [(NSMutableOrderedSet *)self->_addedLocalInstances array];
  uint64_t v12 = [(NSMutableOrderedSet *)self->_removedLocalInstances array];
  v13 = [(CCSetChange *)v4 initWithSharedItem:sharedItem sharedItemChangeType:sharedItemChangeType allDevices:v7 addedDevices:v8 removedDevices:v9 allLocalInstances:v10 addedLocalInstances:v11 removedLocalInstances:v12];

  return v13;
}

- (CCSharedItem)sharedItem
{
  return self->_sharedItem;
}

- (unsigned)sharedItemChangeType
{
  return self->_sharedItemChangeType;
}

- (void)setSharedItemChangeType:(unsigned __int16)a3
{
  self->_uint64_t sharedItemChangeType = a3;
}

- (NSMutableOrderedSet)allDevices
{
  return self->_allDevices;
}

- (NSMutableOrderedSet)addedDevices
{
  return self->_addedDevices;
}

- (NSMutableOrderedSet)removedDevices
{
  return self->_removedDevices;
}

- (NSMutableOrderedSet)allLocalInstances
{
  return self->_allLocalInstances;
}

- (NSMutableOrderedSet)addedLocalInstances
{
  return self->_addedLocalInstances;
}

- (NSMutableOrderedSet)removedLocalInstances
{
  return self->_removedLocalInstances;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedLocalInstances, 0);
  objc_storeStrong((id *)&self->_addedLocalInstances, 0);
  objc_storeStrong((id *)&self->_allLocalInstances, 0);
  objc_storeStrong((id *)&self->_removedDevices, 0);
  objc_storeStrong((id *)&self->_addedDevices, 0);
  objc_storeStrong((id *)&self->_allDevices, 0);

  objc_storeStrong((id *)&self->_sharedItem, 0);
}

@end