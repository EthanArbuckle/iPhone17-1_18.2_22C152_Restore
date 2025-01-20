@interface GDPersonRankingService
- (GDPersonRankingService)initWithConfig:(id)a3;
- (id)rankedPersonsWithMaxCount:(int64_t)a3 error:(id *)a4;
@end

@implementation GDPersonRankingService

- (void).cxx_destruct
{
}

- (id)rankedPersonsWithMaxCount:(int64_t)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend_rankedPersonsForObjCWithMaxCount_error_(self->_innerService, a2, a3, (uint64_t)a4, v4);
  if (!v6)
  {
    v7 = GDLifeEventLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = *a4;
      int v10 = 138412290;
      id v11 = v9;
      _os_log_error_impl(&dword_1B2996000, v7, OS_LOG_TYPE_ERROR, "Failed to retrieve ranked persons with error: %@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v6;
}

- (GDPersonRankingService)initWithConfig:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GDPersonRankingService;
  v5 = [(GDPersonRankingService *)&v13 init];
  if (v5)
  {
    v6 = [_TtC20IntelligencePlatform20PersonRankingService alloc];
    uint64_t v10 = objc_msgSend_initWithConfig_(v6, v7, (uint64_t)v4, v8, v9);
    innerService = v5->_innerService;
    v5->_innerService = (_TtC20IntelligencePlatform20PersonRankingService *)v10;
  }
  return v5;
}

@end