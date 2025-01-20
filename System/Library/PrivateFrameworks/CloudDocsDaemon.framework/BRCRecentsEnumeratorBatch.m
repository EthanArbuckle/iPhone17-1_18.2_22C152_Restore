@interface BRCRecentsEnumeratorBatch
- (BRCRecentsEnumeratorBatch)initWithBatchSize:(unint64_t)a3;
- (id)description;
- (unint64_t)batchCount;
- (unint64_t)rank;
- (void)addDeletionOfFileObjectID:(id)a3 rank:(unint64_t)a4;
- (void)addIndexOfItem:(id)a3;
- (void)listItems:(id)a3;
- (void)setRank:(unint64_t)a3;
@end

@implementation BRCRecentsEnumeratorBatch

- (BRCRecentsEnumeratorBatch)initWithBatchSize:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BRCRecentsEnumeratorBatch;
  v4 = [(BRCRecentsEnumeratorBatch *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    toIndexItems = v4->_toIndexItems;
    v4->_toIndexItems = (NSFileProviderItem *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    deletedItemIDs = v4->_deletedItemIDs;
    v4->_deletedItemIDs = (NSMutableArray *)v7;
  }
  return v4;
}

- (void)addIndexOfItem:(id)a3
{
  id v12 = a3;
  v4 = +[BRCNotification notificationGatheredFromItem:v12];
  uint64_t v5 = [v12 itemID];
  int v6 = [v5 isDocumentsFolder];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F59518];
    v8 = [v12 appLibrary];
    v9 = [v8 containerMetadata];
    uint64_t v10 = [v7 containerItemForContainer:v9 withRepresentativeItem:v4];

    v4 = (void *)v10;
  }
  v11 = [v4 asFileProviderItem];
  if (v11)
  {
    [(NSFileProviderItem *)self->_toIndexItems addObject:v11];
    -[BRCRecentsEnumeratorBatch setRank:](self, "setRank:", [v12 notifsRank]);
  }
}

- (void)addDeletionOfFileObjectID:(id)a3 rank:(unint64_t)a4
{
  [(NSMutableArray *)self->_deletedItemIDs addObject:a3];
  [(BRCRecentsEnumeratorBatch *)self setRank:a4];
}

- (unint64_t)batchCount
{
  uint64_t v3 = [(NSFileProviderItem *)self->_toIndexItems count];
  return [(NSMutableArray *)self->_deletedItemIDs count] + v3;
}

- (void)setRank:(unint64_t)a3
{
  if (self->_rank > a3)
  {
    uint64_t v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCRecentsEnumeratorBatch setRank:]();
    }
  }
  self->_rank = a3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, %lu indexed, %lu deleted>", objc_opt_class(), self, -[NSFileProviderItem count](self->_toIndexItems, "count"), -[NSMutableArray count](self->_deletedItemIDs, "count")];
}

- (void)listItems:(id)a3
{
  if (a3) {
    (*((void (**)(id, NSFileProviderItem *, NSMutableArray *))a3 + 2))(a3, self->_toIndexItems, self->_deletedItemIDs);
  }
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
  objc_storeStrong((id *)&self->_toIndexItems, 0);
}

- (void)setRank:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: rank >= _rank%@", v1, 0xCu);
}

@end