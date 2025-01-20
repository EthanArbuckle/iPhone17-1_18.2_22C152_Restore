@interface ATXRootOfAppData
- (id)initInternal;
- (unint64_t)docFreqForBundleId:(id)a3 withAction:(id)a4;
- (unint64_t)sessionCountForBundleId:(id)a3;
- (unint64_t)sessionCountForBundleId:(id)a3 firstAction:(id)a4;
- (void)recordDocFreqWithBundleId:(id)a3 hasAction:(id)a4;
- (void)recordSessionWithBundleId:(id)a3 firstAction:(id)a4;
@end

@implementation ATXRootOfAppData

- (id)initInternal
{
  v3.receiver = self;
  v3.super_class = (Class)ATXRootOfAppData;
  return [(ATXRootOfAppData *)&v3 init];
}

- (unint64_t)sessionCountForBundleId:(id)a3
{
  unint64_t result = (unint64_t)a3;
  __break(1u);
  return result;
}

- (unint64_t)sessionCountForBundleId:(id)a3 firstAction:(id)a4
{
  id v5 = a3;
  unint64_t result = (unint64_t)a4;
  __break(1u);
  return result;
}

- (void)recordSessionWithBundleId:(id)a3 firstAction:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __break(1u);
}

- (unint64_t)docFreqForBundleId:(id)a3 withAction:(id)a4
{
  id v6 = a4;
  v7 = [@"DocFreq_" stringByAppendingString:a3];
  unint64_t v8 = [(ATXRootOfAppData *)self sessionCountForBundleId:v7 firstAction:v6];

  return v8;
}

- (void)recordDocFreqWithBundleId:(id)a3 hasAction:(id)a4
{
  id v6 = a4;
  id v7 = [@"DocFreq_" stringByAppendingString:a3];
  [(ATXRootOfAppData *)self recordSessionWithBundleId:v7 firstAction:v6];
}

@end