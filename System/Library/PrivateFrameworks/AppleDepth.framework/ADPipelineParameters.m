@interface ADPipelineParameters
- (ADPipelineParameters)init;
- (NSString)deviceName;
- (id)initForDevice:(id)a3;
- (unint64_t)outputDepthUnits;
- (void)setOutputDepthUnits:(unint64_t)a3;
@end

@implementation ADPipelineParameters

- (void).cxx_destruct
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (ADPipelineParameters)init
{
  v3 = +[ADDeviceConfiguration getDeviceName];
  v4 = [(ADPipelineParameters *)self initForDevice:v3];

  return v4;
}

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADPipelineParameters;
  v6 = [(ADPipelineParameters *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceName, a3);
  }

  return v7;
}

- (unint64_t)outputDepthUnits
{
  return self->_outputDepthUnits;
}

- (void)setOutputDepthUnits:(unint64_t)a3
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "setting deprecated property. outputDepthUnits has no impact on pipeline's depth units", v3, 2u);
  }
}

@end