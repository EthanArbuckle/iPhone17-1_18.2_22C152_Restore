@interface HFAccessoryDiagnosticItem
- (BOOL)isEligibleForUpload;
- (HFAccessoryDiagnosticItem)initWithLogMetadata:(id)a3 accessory:(id)a4;
- (HMAccessoryDiagnosticsMetadata)metadata;
- (NSString)filename;
- (NSString)manufacturer;
- (NSString)path;
- (NSURL)fileURL;
- (NSURL)privacyPolicyURL;
- (id)_subclass_updateWithOptions:(id)a3;
- (int64_t)consentVersion;
- (int64_t)uploadType;
@end

@implementation HFAccessoryDiagnosticItem

- (HFAccessoryDiagnosticItem)initWithLogMetadata:(id)a3 accessory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFAccessoryDiagnosticItem;
  v9 = [(HFAccessoryDiagnosticItem *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metadata, a3);
    v11 = [v7 snapshotPath];
    uint64_t v12 = [v11 lastPathComponent];
    filename = v10->_filename;
    v10->_filename = (NSString *)v12;

    v14 = [v8 manufacturer];
    uint64_t v15 = [v14 copy];
    manufacturer = v10->_manufacturer;
    v10->_manufacturer = (NSString *)v15;
  }
  return v10;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  v9[0] = @"title";
  v3 = [(HFAccessoryDiagnosticItem *)self filename];
  v9[1] = @"hidden";
  v10[0] = v3;
  v10[1] = MEMORY[0x263EFFA80];
  v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];

  v5 = (void *)MEMORY[0x263F58190];
  v6 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  id v7 = [v5 futureWithResult:v6];

  return v7;
}

- (NSURL)privacyPolicyURL
{
  v2 = [(HFAccessoryDiagnosticItem *)self metadata];
  v3 = [v2 privacyPolicyURL];

  return (NSURL *)v3;
}

- (int64_t)consentVersion
{
  v2 = [(HFAccessoryDiagnosticItem *)self metadata];
  v3 = [v2 consentVersion];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (int64_t)uploadType
{
  v2 = [(HFAccessoryDiagnosticItem *)self metadata];
  v3 = [v2 uploadType];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (NSString)path
{
  v2 = [(HFAccessoryDiagnosticItem *)self metadata];
  v3 = [v2 snapshotPath];

  return (NSString *)v3;
}

- (BOOL)isEligibleForUpload
{
  v3 = [(HFAccessoryDiagnosticItem *)self metadata];
  int64_t v4 = [v3 uploadDestination];

  v5 = [v4 absoluteString];
  BOOL v6 = [v5 length]
    && [(HFAccessoryDiagnosticItem *)self consentVersion] == 1
    && [(HFAccessoryDiagnosticItem *)self uploadType] == 0;

  return v6;
}

- (NSURL)fileURL
{
  v2 = [(HFAccessoryDiagnosticItem *)self metadata];
  v3 = [v2 snapshotPath];

  int64_t v4 = [NSURL fileURLWithPath:v3];

  return (NSURL *)v4;
}

- (HMAccessoryDiagnosticsMetadata)metadata
{
  return self->_metadata;
}

- (NSString)filename
{
  return self->_filename;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end