@interface CSStateCaptureOptions
- (CSStateCaptureOptions)initWithMutableBuilder:(id)a3;
- (NSDictionary)stateData;
- (NSString)stateDataTitle;
@end

@implementation CSStateCaptureOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateData, 0);
  objc_storeStrong((id *)&self->_stateDataTitle, 0);
}

- (NSDictionary)stateData
{
  return self->_stateData;
}

- (NSString)stateDataTitle
{
  return self->_stateDataTitle;
}

- (CSStateCaptureOptions)initWithMutableBuilder:(id)a3
{
  v4 = (void (**)(id, CSStateCaptureOptionsMutable *))a3;
  v12.receiver = self;
  v12.super_class = (Class)CSStateCaptureOptions;
  v5 = [(CSStateCaptureOptions *)&v12 init];
  v6 = objc_alloc_init(CSStateCaptureOptionsMutable);
  if (v5)
  {
    if (v4) {
      v4[2](v4, v6);
    }
    uint64_t v7 = [(CSStateCaptureOptionsMutable *)v6 stateDataTitle];
    stateDataTitle = v5->_stateDataTitle;
    v5->_stateDataTitle = (NSString *)v7;

    uint64_t v9 = [(CSStateCaptureOptionsMutable *)v6 stateData];
    stateData = v5->_stateData;
    v5->_stateData = (NSDictionary *)v9;
  }
  return v5;
}

@end