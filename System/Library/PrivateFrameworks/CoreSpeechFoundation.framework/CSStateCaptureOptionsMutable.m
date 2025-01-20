@interface CSStateCaptureOptionsMutable
- (NSDictionary)stateData;
- (NSString)stateDataTitle;
- (void)setStateData:(id)a3;
- (void)setStateDataTitle:(id)a3;
@end

@implementation CSStateCaptureOptionsMutable

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

- (void)setStateData:(id)a3
{
}

- (void)setStateDataTitle:(id)a3
{
}

@end