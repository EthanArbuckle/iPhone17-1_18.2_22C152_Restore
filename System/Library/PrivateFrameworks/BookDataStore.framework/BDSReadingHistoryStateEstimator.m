@interface BDSReadingHistoryStateEstimator
- (BDSReadingHistoryStateEstimator)init;
- (id)estimateCurrentStateInfoWithExistingStateInfo:(id)a3;
@end

@implementation BDSReadingHistoryStateEstimator

- (BDSReadingHistoryStateEstimator)init
{
  return (BDSReadingHistoryStateEstimator *)ReadingHistoryStateEstimator.init()();
}

- (id)estimateCurrentStateInfoWithExistingStateInfo:(id)a3
{
  uint64_t v5 = sub_236126188(&qword_26AD74158);
  uint64_t v6 = v5 - 8;
  uint64_t v7 = MEMORY[0x270FA5388](v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v11 = (char *)&v24 - v10;
  uint64_t v12 = sub_2361FD748();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v25 = a3;
  v16 = self;
  sub_2361FD738();
  uint64_t v17 = (uint64_t)&v11[*(int *)(v6 + 56)];
  sub_23618430C(v11, v17, (uint64_t)v15);
  uint64_t v18 = (uint64_t)&v9[*(int *)(v6 + 56)];
  v19 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v19(v9, v11, v12);
  v19((char *)v18, (char *)v17, v12);
  v20 = v25;
  v21 = (void *)sub_23618482C((uint64_t)v9, v18, v25);
  sub_23613491C((uint64_t)v11, &qword_26AD74158);
  v22 = *(void (**)(char *, uint64_t))(v13 + 8);
  v22(v15, v12);
  v22((char *)v18, v12);
  v22(v9, v12);

  return v21;
}

- (void).cxx_destruct
{
}

@end