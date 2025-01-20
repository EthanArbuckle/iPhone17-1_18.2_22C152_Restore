@interface MPCQueueControllerEdit
- (BOOL)allowsChangingCurrentItem;
- (MPCQueueController)queueController;
- (MPCQueueControllerEdit)initWithQueueController:(id)a3 label:(id)a4;
- (NSDictionary)suggestedContentItemIDsForDeletedContentItemIDs;
- (NSString)identifier;
- (NSString)label;
- (NSString)suggestedStartingContentItemID;
- (id)description;
- (void)commit;
- (void)dealloc;
- (void)rollback;
- (void)setSuggestedContentItemID:(id)a3 forDeletedContentItemID:(id)a4;
- (void)setSuggestedContentItemIDForStart:(id)a3;
@end

@implementation MPCQueueControllerEdit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedStartingContentItemID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_queueController, 0);

  objc_storeStrong((id *)&self->_suggestedContentItemIDs, 0);
}

- (NSString)suggestedStartingContentItemID
{
  return self->_suggestedStartingContentItemID;
}

- (BOOL)allowsChangingCurrentItem
{
  return self->_allowsChangingCurrentItem;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MPCQueueController)queueController
{
  return self->_queueController;
}

- (NSDictionary)suggestedContentItemIDsForDeletedContentItemIDs
{
  v2 = (void *)[(NSMutableDictionary *)self->_suggestedContentItemIDs copy];

  return (NSDictionary *)v2;
}

- (void)rollback
{
  if (self->_committed)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1741, @"Attempt to rollback an already committed edit: %@", self object file lineNumber description];
  }
  [(MPCQueueController *)self->_queueController _rollbackEdit:self];
  queueController = self->_queueController;
  self->_queueController = 0;

  self->_committed = 1;
}

- (void)commit
{
  if (self->_committed)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1733, @"Attempt to commit an already committed edit: %@", self object file lineNumber description];
  }
  [(MPCQueueController *)self->_queueController _commitEdit:self];
  queueController = self->_queueController;
  self->_queueController = 0;

  self->_committed = 1;
}

- (void)setSuggestedContentItemID:(id)a3 forDeletedContentItemID:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (v11)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1725, @"Invalid parameter not satisfying: %@", @"suggestedContentItemID != nil" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v9 = [MEMORY[0x263F08690] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1726, @"Invalid parameter not satisfying: %@", @"deletedContentItemID != nil" object file lineNumber description];

LABEL_3:
  if (self->_committed)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1727, @"Attempt to modify committed edit: %@", self object file lineNumber description];
  }
  [(NSMutableDictionary *)self->_suggestedContentItemIDs setObject:v11 forKeyedSubscript:v7];
}

- (void)setSuggestedContentItemIDForStart:(id)a3
{
  id v5 = a3;
  id v10 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1718, @"Invalid parameter not satisfying: %@", @"suggestedContentItemID != nil" object file lineNumber description];

    id v5 = 0;
  }
  if (self->_committed)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1719, @"Attempt to modify committed edit: %@", self object file lineNumber description];

    id v5 = v10;
  }
  v6 = (NSString *)[v5 copy];
  suggestedStartingContentItemID = self->_suggestedStartingContentItemID;
  self->_suggestedStartingContentItemID = v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p id=%@ label=\"%@\">", objc_opt_class(), self, self->_identifier, self->_label];
}

- (void)dealloc
{
  if (!self->_committed)
  {
    v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"MPCQueueController.m", 1710, @"Didn't call -commit/-rollback for edit: %@", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)MPCQueueControllerEdit;
  [(MPCQueueControllerEdit *)&v5 dealloc];
}

- (MPCQueueControllerEdit)initWithQueueController:(id)a3 label:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MPCQueueControllerEdit;
  v9 = [(MPCQueueControllerEdit *)&v18 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queueController, a3);
    uint64_t v11 = MSVNanoIDCreateTaggedPointer();
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    uint64_t v13 = [v8 copy];
    label = v10->_label;
    v10->_label = (NSString *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    suggestedContentItemIDs = v10->_suggestedContentItemIDs;
    v10->_suggestedContentItemIDs = v15;

    if (_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sOnceToken != -1) {
      dispatch_once(&_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sOnceToken, &__block_literal_global_838);
    }
    v10->_allowsChangingCurrentItem = pthread_getspecific(_MPCQueueControllerEditAllowsChangingCurrentItemPThreadKey_sThreadKey) != 0;
  }

  return v10;
}

@end