@interface SGDPurgeDeletionBox
- (BOOL)shouldRunHandlerImmediately;
- (NSMutableDictionary)deleteDomainIds;
- (NSMutableDictionary)deleteUniqueIds;
- (NSMutableDictionary)purgeUniqueIds;
- (SGDPurgeDeletionBox)init;
- (void)addDeletion:(id)a3 domainSelection:(id)a4;
- (void)addDeletion:(id)a3 uniqueIds:(id)a4;
- (void)addPurge:(id)a3 uniqueIds:(id)a4;
- (void)setDeleteDomainIds:(id)a3;
- (void)setDeleteUniqueIds:(id)a3;
- (void)setPurgeUniqueIds:(id)a3;
@end

@implementation SGDPurgeDeletionBox

- (void)addDeletion:(id)a3 domainSelection:(id)a4
{
  deleteDomainIds = self->_deleteDomainIds;
  id v7 = a4;
  id v8 = a3;
  v9 = [(NSMutableDictionary *)deleteDomainIds objectForKey:v8];
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  [v12 addDomainsFromSelection:v7];
  [(NSMutableDictionary *)self->_deleteDomainIds setObject:v12 forKeyedSubscript:v8];
}

- (SGDPurgeDeletionBox)init
{
  v10.receiver = self;
  v10.super_class = (Class)SGDPurgeDeletionBox;
  v2 = [(SGDPurgeDeletionBox *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    deleteUniqueIds = v2->_deleteUniqueIds;
    v2->_deleteUniqueIds = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    purgeUniqueIds = v2->_purgeUniqueIds;
    v2->_purgeUniqueIds = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    deleteDomainIds = v2->_deleteDomainIds;
    v2->_deleteDomainIds = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (BOOL)shouldRunHandlerImmediately
{
  return (unint64_t)[(NSMutableDictionary *)self->_deleteUniqueIds count] > 0x1388
      || (unint64_t)[(NSMutableDictionary *)self->_deleteDomainIds count] > 0x1388;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteDomainIds, 0);
  objc_storeStrong((id *)&self->_purgeUniqueIds, 0);
  objc_storeStrong((id *)&self->_deleteUniqueIds, 0);
}

- (void)setDeleteDomainIds:(id)a3
{
}

- (NSMutableDictionary)deleteDomainIds
{
  return self->_deleteDomainIds;
}

- (void)setPurgeUniqueIds:(id)a3
{
}

- (NSMutableDictionary)purgeUniqueIds
{
  return self->_purgeUniqueIds;
}

- (void)setDeleteUniqueIds:(id)a3
{
}

- (NSMutableDictionary)deleteUniqueIds
{
  return self->_deleteUniqueIds;
}

- (void)addPurge:(id)a3 uniqueIds:(id)a4
{
  id v14 = a3;
  deleteUniqueIds = self->_deleteUniqueIds;
  id v7 = a4;
  id v8 = [(NSMutableDictionary *)deleteUniqueIds objectForKey:v14];
  v9 = [(NSMutableDictionary *)self->_purgeUniqueIds objectForKey:v14];
  objc_super v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  v13 = [v7 allObjects];

  [v12 addObjectsFromArray:v13];
  if (v8) {
    [v12 minusSet:v8];
  }
  [(NSMutableDictionary *)self->_purgeUniqueIds setObject:v12 forKeyedSubscript:v14];
}

- (void)addDeletion:(id)a3 uniqueIds:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_purgeUniqueIds objectForKey:v14];
  id v8 = v7;
  if (v7) {
    [v7 minusSet:v6];
  }
  v9 = [(NSMutableDictionary *)self->_deleteUniqueIds objectForKey:v14];
  objc_super v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  id v12 = v11;

  v13 = [v6 allObjects];
  [v12 addObjectsFromArray:v13];

  [(NSMutableDictionary *)self->_deleteUniqueIds setObject:v12 forKeyedSubscript:v14];
}

@end