@interface AVTAvatarActionsRecordUpdate
+ (id)recordUpdateForDeletingRecord:(id)a3 withDataSource:(id)a4;
- (AVTAvatarActionsRecordUpdate)initWithAvatarRecord:(id)a3 fromLeft:(BOOL)a4;
- (AVTAvatarRecord)avatarRecord;
- (BOOL)fromLeft;
@end

@implementation AVTAvatarActionsRecordUpdate

- (AVTAvatarActionsRecordUpdate)initWithAvatarRecord:(id)a3 fromLeft:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVTAvatarActionsRecordUpdate;
  v8 = [(AVTAvatarActionsRecordUpdate *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_avatarRecord, a3);
    v9->_fromLeft = a4;
  }

  return v9;
}

+ (id)recordUpdateForDeletingRecord:(id)a3 withDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v7 numberOfRecords] < 2)
  {
    v15 = 0;
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __77__AVTAvatarActionsRecordUpdate_recordUpdateForDeletingRecord_withDataSource___block_invoke;
    v17[3] = &unk_263FF0DB8;
    id v18 = v6;
    uint64_t v8 = [v7 indexOfRecordPassingTest:v17];
    v9 = [v7 indexSetForEditableRecords];
    v10 = (void *)[v9 mutableCopy];

    [v10 removeIndex:v8];
    if ([v10 count])
    {
      uint64_t v11 = [v10 closestIndexToIndex:v8 greaterIndexesFirst:1];
      BOOL v12 = v11 < v8;
      id v13 = objc_alloc((Class)a1);
      v14 = [v7 recordAtIndex:v11];
      v15 = (void *)[v13 initWithAvatarRecord:v14 fromLeft:v12];
    }
    else
    {
      v15 = 0;
    }
  }
  return v15;
}

uint64_t __77__AVTAvatarActionsRecordUpdate_recordUpdateForDeletingRecord_withDataSource___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 identifier];
  v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (BOOL)fromLeft
{
  return self->_fromLeft;
}

- (void).cxx_destruct
{
}

@end