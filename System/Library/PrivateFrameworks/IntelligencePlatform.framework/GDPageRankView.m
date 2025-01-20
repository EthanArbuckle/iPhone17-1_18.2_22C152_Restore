@interface GDPageRankView
- (GDPageRankView)initWithAccessAssertion:(id)a3 database:(id)a4;
- (id)pageRanksWithError:(id *)a3;
@end

@implementation GDPageRankView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);

  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

- (id)pageRanksWithError:(id *)a3
{
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, a2, @"ViewEngine.Serving.Query", (uint64_t)&unk_1F0AE1CF0, v3);
  v6 = objc_opt_new();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1B2E60360;
  v20 = sub_1B2E60370;
  id v21 = 0;
  db = self->_db;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B2E60378;
  v14[3] = &unk_1E60139C0;
  id v8 = v6;
  id v15 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B2E60404;
  v13[3] = &unk_1E60139E8;
  v13[4] = &v16;
  objc_msgSend_prepAndRunQuery_onPrep_onRow_onError_(db, v9, @"SELECT MD_ID, CAST(page_rank AS REAL) AS rank FROM page_rank", (uint64_t)&unk_1F0AE1D10, (uint64_t)v14, v13);
  if (a3 && (v10 = (void *)v17[5]) != 0)
  {
    id v11 = 0;
    *a3 = v10;
  }
  else
  {
    id v11 = v8;
  }

  _Block_object_dispose(&v16, 8);

  return v11;
}

- (GDPageRankView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDPageRankView;
  v9 = [(GDPageRankView *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessAssertion, a3);
    objc_storeStrong((id *)&v10->_db, a4);
  }

  return v10;
}

@end