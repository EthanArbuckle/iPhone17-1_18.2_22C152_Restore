@interface GEOSearchSessionData
- (GEOPDSSearchSessionData)searchSessionData;
- (GEOSearchSessionData)init;
- (GEOSearchSessionData)initWithSearchSessionData:(id)a3;
- (id)updateWithSearchSessionData:(id)a3;
@end

@implementation GEOSearchSessionData

- (GEOSearchSessionData)init
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSearchSessionData;
  v2 = [(GEOSearchSessionData *)&v7 init];
  if (v2)
  {
    v3 = +[GEOUserSession sharedInstance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __28__GEOSearchSessionData_init__block_invoke;
    v5[3] = &unk_1E53DC588;
    v6 = v2;
    [v3 shortSessionValues:v5];
  }
  return v2;
}

uint64_t __28__GEOSearchSessionData_init__block_invoke(uint64_t result, double a2, double a3)
{
  *(double *)(*(void *)(result + 32) + 8) = a3;
  return result;
}

- (GEOSearchSessionData)initWithSearchSessionData:(id)a3
{
  id v5 = a3;
  v6 = [(GEOSearchSessionData *)self init];
  objc_super v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchSessionData, a3);
  }

  return v7;
}

- (GEOPDSSearchSessionData)searchSessionData
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v3 = +[GEOUserSession sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__GEOSearchSessionData_searchSessionData__block_invoke;
  v6[3] = &unk_1E53DC5B0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 shortSessionValues:v6];

  if (*((unsigned char *)v8 + 24)) {
    v4 = self->_searchSessionData;
  }
  else {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__GEOSearchSessionData_searchSessionData__block_invoke(uint64_t result, double a2, double a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(double *)(*(void *)(result + 32) + 8) == a3;
  return result;
}

- (id)updateWithSearchSessionData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v5 = +[GEOUserSession sharedInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52__GEOSearchSessionData_updateWithSearchSessionData___block_invoke;
  v9[3] = &unk_1E53DC5B0;
  v9[4] = self;
  v9[5] = &v10;
  [v5 shortSessionValues:v9];

  if (*((unsigned char *)v11 + 24)) {
    v6 = [[GEOSearchSessionData alloc] initWithSearchSessionData:v4];
  }
  else {
    v6 = objc_alloc_init(GEOSearchSessionData);
  }
  uint64_t v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __52__GEOSearchSessionData_updateWithSearchSessionData___block_invoke(uint64_t result, double a2, double a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(double *)(*(void *)(result + 32) + 8) == a3;
  return result;
}

- (void).cxx_destruct
{
}

@end