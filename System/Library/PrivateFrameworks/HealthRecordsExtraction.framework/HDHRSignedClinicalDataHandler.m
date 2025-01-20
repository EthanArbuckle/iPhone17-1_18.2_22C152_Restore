@interface HDHRSignedClinicalDataHandler
- (id)preprocessDataInSource:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)preprocessFHIRResourceObject:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)reprocessOriginalRecords:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (void)processContextCollection:(id)a3 completion:(id)a4;
- (void)processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5;
@end

@implementation HDHRSignedClinicalDataHandler

- (id)preprocessDataInSource:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  v9 = [(HDHRSignedClinicalDataProcessor *)v8 preprocessDataInSource:v7 options:a4 error:a5];

  return v9;
}

- (id)preprocessFHIRResourceObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  v9 = [(HDHRSignedClinicalDataProcessor *)v8 preprocessFHIRResourceObject:v7 options:a4 error:a5];

  return v9;
}

- (void)processOriginalSignedClinicalDataRecords:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  [(HDHRSignedClinicalDataProcessor *)v9 processOriginalSignedClinicalDataRecords:v8 options:a4 completion:v7];
}

- (void)processContextCollection:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  [(HDHRSignedClinicalDataProcessor *)v7 processContextCollection:v6 completion:v5];
}

- (id)reprocessOriginalRecords:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = objc_alloc_init(HDHRSignedClinicalDataProcessor);
  v9 = [(HDHRSignedClinicalDataProcessor *)v8 reprocessOriginalRecords:v7 options:a4 error:a5];

  return v9;
}

@end