@interface WDMedicalRecordPagingContext
+ (id)sortDateComponentsOfDate:(id)a3;
+ (id)sortDateComponentsOfDateComponents:(id)a3 withDayOffset:(int64_t)a4;
- (BOOL)fetchingCurrentPage;
- (BOOL)hasMoreData;
- (BOOL)pagingContextReady;
- (BOOL)shouldClearDisplayItemGroups;
- (BOOL)shouldQueryForNextBatch;
- (NSMutableArray)contextDependentBlockQueue;
- (NSMutableArray)removedRecords;
- (NSMutableArray)unprocessedRecords;
- (NSMutableSet)computingDaySummaries;
- (WDMedicalRecordPagingContext)init;
- (void)resetPagingContext;
- (void)setComputingDaySummaries:(id)a3;
- (void)setContextDependentBlockQueue:(id)a3;
- (void)setFetchingCurrentPage:(BOOL)a3;
- (void)setHasMoreData:(BOOL)a3;
- (void)setPagingContextReady:(BOOL)a3;
- (void)setRemovedRecords:(id)a3;
- (void)setShouldClearDisplayItemGroups:(BOOL)a3;
- (void)setUnprocessedRecords:(id)a3;
@end

@implementation WDMedicalRecordPagingContext

- (WDMedicalRecordPagingContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)WDMedicalRecordPagingContext;
  v2 = [(WDMedicalRecordPagingContext *)&v5 init];
  v3 = v2;
  if (v2) {
    [(WDMedicalRecordPagingContext *)v2 resetPagingContext];
  }
  return v3;
}

- (BOOL)shouldQueryForNextBatch
{
  if (![(WDMedicalRecordPagingContext *)self hasMoreData]
    || [(WDMedicalRecordPagingContext *)self fetchingCurrentPage])
  {
    return 0;
  }
  return [(WDMedicalRecordPagingContext *)self pagingContextReady];
}

- (void)resetPagingContext
{
  *(_DWORD *)&self->_shouldClearDisplayItemGroups = 257;
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  computingDaySummaries = self->_computingDaySummaries;
  self->_computingDaySummaries = v3;

  objc_super v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unprocessedRecords = self->_unprocessedRecords;
  self->_unprocessedRecords = v5;

  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  contextDependentBlockQueue = self->_contextDependentBlockQueue;
  self->_contextDependentBlockQueue = v7;

  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  removedRecords = self->_removedRecords;
  self->_removedRecords = v9;
}

+ (id)sortDateComponentsOfDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  objc_super v5 = objc_msgSend(v3, "hk_gregorianCalendarWithLocalTimeZone");
  v6 = [v5 components:30 fromDate:v4];

  return v6;
}

+ (id)sortDateComponentsOfDateComponents:(id)a3 withDayOffset:(int64_t)a4
{
  objc_super v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a3;
  v7 = objc_msgSend(v5, "hk_gregorianCalendarWithLocalTimeZone");
  v8 = [v7 dateFromComponents:v6];

  v9 = [v7 dateByAddingUnit:16 value:a4 toDate:v8 options:0];
  v10 = [v7 components:30 fromDate:v9];

  return v10;
}

- (BOOL)shouldClearDisplayItemGroups
{
  return self->_shouldClearDisplayItemGroups;
}

- (void)setShouldClearDisplayItemGroups:(BOOL)a3
{
  self->_shouldClearDisplayItemGroups = a3;
}

- (BOOL)hasMoreData
{
  return self->_hasMoreData;
}

- (void)setHasMoreData:(BOOL)a3
{
  self->_hasMoreData = a3;
}

- (BOOL)fetchingCurrentPage
{
  return self->_fetchingCurrentPage;
}

- (void)setFetchingCurrentPage:(BOOL)a3
{
  self->_fetchingCurrentPage = a3;
}

- (BOOL)pagingContextReady
{
  return self->_pagingContextReady;
}

- (void)setPagingContextReady:(BOOL)a3
{
  self->_pagingContextReady = a3;
}

- (NSMutableSet)computingDaySummaries
{
  return self->_computingDaySummaries;
}

- (void)setComputingDaySummaries:(id)a3
{
}

- (NSMutableArray)unprocessedRecords
{
  return self->_unprocessedRecords;
}

- (void)setUnprocessedRecords:(id)a3
{
}

- (NSMutableArray)contextDependentBlockQueue
{
  return self->_contextDependentBlockQueue;
}

- (void)setContextDependentBlockQueue:(id)a3
{
}

- (NSMutableArray)removedRecords
{
  return self->_removedRecords;
}

- (void)setRemovedRecords:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedRecords, 0);
  objc_storeStrong((id *)&self->_contextDependentBlockQueue, 0);
  objc_storeStrong((id *)&self->_unprocessedRecords, 0);
  objc_storeStrong((id *)&self->_computingDaySummaries, 0);
}

@end