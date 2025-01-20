@interface HDQuantitySeriesEditorTaskServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)configurationClass;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (HDQuantitySeriesEditorTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)remote_commitRemovedDatums:(id)a3 completion:(id)a4;
@end

@implementation HDQuantitySeriesEditorTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F2A5B8];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (HDQuantitySeriesEditorTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  if (v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)HDQuantitySeriesEditorTaskServer;
    v11 = [(HDStandardTaskServer *)&v16 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
    if (v11)
    {
      uint64_t v12 = [v10 quantitySample];
      quantitySample = v11->_quantitySample;
      v11->_quantitySample = (HKQuantitySample *)v12;
    }
    self = v11;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)remote_commitRemovedDatums:(id)a3 completion:(id)a4
{
  quantitySample = self->_quantitySample;
  v7 = (void (**)(id, void *, id))a4;
  id v8 = a3;
  v9 = [(HDStandardTaskServer *)self profile];
  id v12 = 0;
  id v10 = +[HDQuantitySampleSeriesEntity removeValues:v8 fromQuantitySeriesSample:quantitySample profile:v9 error:&v12];

  id v11 = v12;
  v7[2](v7, v10, v11);
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2B3A0] serverInterface];
}

- (id)remoteInterface
{
  return 0;
}

- (void).cxx_destruct
{
}

@end