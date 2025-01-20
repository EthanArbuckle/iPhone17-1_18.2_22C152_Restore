@interface LSRecordBuilder
+ (id)recordBuilderForType:(unint64_t)a3;
- (BOOL)parseInfoPlist:(id)a3;
- (BOOL)parseInstallationInfo:(id)a3;
- (unsigned)registerBundleRecord:(id)a3 error:(id *)a4;
- (void)setDatabase:(id)a3;
@end

@implementation LSRecordBuilder

+ (id)recordBuilderForType:(unint64_t)a3
{
  if (a3)
  {
    if (a3 - 1 < 2) {
      abort();
    }
  }
  else
  {
    a1 = objc_alloc_init(LSBundleRecordBuilder);
  }

  return a1;
}

- (void)setDatabase:(id)a3
{
}

- (unsigned)registerBundleRecord:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)parseInfoPlist:(id)a3
{
  return 0;
}

- (BOOL)parseInstallationInfo:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end