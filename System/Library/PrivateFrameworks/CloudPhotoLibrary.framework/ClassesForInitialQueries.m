@interface ClassesForInitialQueries
@end

@implementation ClassesForInitialQueries

void ___ClassesForInitialQueries_block_invoke()
{
  v5[8] = *MEMORY[0x1E4F143B8];
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  v5[3] = objc_opt_class();
  v5[4] = objc_opt_class();
  v5[5] = objc_opt_class();
  v5[6] = objc_opt_class();
  v5[7] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:8];
  v1 = (void *)_ClassesForInitialQueries_classesForInitialQueriesInLibrary;
  _ClassesForInitialQueries_classesForInitialQueriesInLibrary = v0;

  uint64_t v4 = objc_opt_class();
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:1];
  v3 = (void *)_ClassesForInitialQueries_classesForInitialQueriesInMomentShare;
  _ClassesForInitialQueries_classesForInitialQueriesInMomentShare = v2;
}

@end