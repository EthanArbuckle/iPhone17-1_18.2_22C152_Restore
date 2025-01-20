@interface AVTAvatarRecordDataSource
+ (id)defaultUIDataSourceWithDomainIdentifier:(id)a3;
- (AVTAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4;
- (AVTAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 environment:(id)a5;
- (AVTAvatarStore)avatarStore;
- (AVTAvatarStore)observableWrappedAvatarStore;
- (AVTPAvatarRecordDataSource)persistenceAvatarRecordDataSource;
- (id)indexSetForEditableRecords;
- (id)indexesOfRecordsPassingTest:(id)a3;
- (id)internalRecordStore;
- (id)recordAtIndex:(unint64_t)a3;
- (id)recordStore;
- (unint64_t)indexOfRecordPassingTest:(id)a3;
- (unint64_t)numberOfRecords;
- (void)addObserver:(id)a3;
- (void)addPriorityObserver:(id)a3;
- (void)flushRecordsForEnteringBackground;
- (void)removeObserver:(id)a3;
- (void)setAvatarStore:(id)a3;
- (void)setObservableWrappedAvatarStore:(id)a3;
- (void)setPersistenceAvatarRecordDataSource:(id)a3;
@end

@implementation AVTAvatarRecordDataSource

- (AVTAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[AVTUIEnvironment defaultEnvironment];
  v9 = [(AVTAvatarRecordDataSource *)self initWithRecordStore:v7 fetchRequest:v6 environment:v8];

  return v9;
}

- (AVTAvatarRecordDataSource)initWithRecordStore:(id)a3 fetchRequest:(id)a4 environment:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVTAvatarRecordDataSource;
  v12 = [(AVTAvatarRecordDataSource *)&v19 init];
  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x263F29750]);
    v14 = [v9 internalStore];
    v15 = [v11 coreEnvironment];
    uint64_t v16 = [v13 initWithRecordStore:v14 fetchRequest:v10 environment:v15];
    persistenceAvatarRecordDataSource = v12->_persistenceAvatarRecordDataSource;
    v12->_persistenceAvatarRecordDataSource = (AVTPAvatarRecordDataSource *)v16;

    objc_storeStrong((id *)&v12->_avatarStore, a3);
  }

  return v12;
}

- (id)internalRecordStore
{
  v3 = [(AVTAvatarRecordDataSource *)self observableWrappedAvatarStore];

  if (!v3)
  {
    v4 = [AVTAvatarStore alloc];
    v5 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
    id v6 = [v5 internalRecordStore];
    id v7 = [(AVTAvatarStore *)v4 initWithPersistenceAvatarStore:v6];

    [(AVTAvatarRecordDataSource *)self setObservableWrappedAvatarStore:v7];
  }
  return [(AVTAvatarRecordDataSource *)self observableWrappedAvatarStore];
}

- (void)addPriorityObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  [v5 addPriorityObserver:v4];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  [v5 removeObserver:v4];
}

- (void)flushRecordsForEnteringBackground
{
  id v2 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  [v2 flushRecordsForEnteringBackground];
}

- (unint64_t)numberOfRecords
{
  id v2 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  unint64_t v3 = [v2 numberOfRecords];

  return v3;
}

- (id)recordAtIndex:(unint64_t)a3
{
  id v4 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  id v5 = [v4 recordAtIndex:a3];

  return v5;
}

- (id)recordStore
{
  id v2 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  unint64_t v3 = [v2 recordStore];

  return v3;
}

- (id)indexesOfRecordsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  id v6 = [v5 indexesOfRecordsPassingTest:v4];

  return v6;
}

- (unint64_t)indexOfRecordPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  unint64_t v6 = [v5 indexOfRecordPassingTest:v4];

  return v6;
}

- (id)indexSetForEditableRecords
{
  id v2 = [(AVTAvatarRecordDataSource *)self persistenceAvatarRecordDataSource];
  unint64_t v3 = [v2 indexSetForEditableRecords];

  return v3;
}

- (AVTPAvatarRecordDataSource)persistenceAvatarRecordDataSource
{
  return self->_persistenceAvatarRecordDataSource;
}

- (void)setPersistenceAvatarRecordDataSource:(id)a3
{
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (void)setAvatarStore:(id)a3
{
}

- (AVTAvatarStore)observableWrappedAvatarStore
{
  return self->_observableWrappedAvatarStore;
}

- (void)setObservableWrappedAvatarStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observableWrappedAvatarStore, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_persistenceAvatarRecordDataSource, 0);
}

+ (id)defaultUIDataSourceWithDomainIdentifier:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F29758]);
  id v5 = [[AVTAvatarStore alloc] initWithPersistenceAvatarStore:v4];
  unint64_t v6 = [MEMORY[0x263F29718] requestForAllAvatars];
  id v7 = (void *)[objc_alloc((Class)a1) initWithRecordStore:v5 fetchRequest:v6];

  return v7;
}

@end