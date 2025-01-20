@interface BWPointCloudDensificationNodeConfiguration
- ($2825F4736939C4A6D3AD43837233062D)depthOutputDimensions;
- (BOOL)filteringEnabled;
- (BWPointCloudDensificationNodeConfiguration)initWithRGBSensorConfiguration:(id)a3 timeOfFlightSensorConfiguration:(id)a4 rgbCameraHorizontalSensorBinningFactor:(int)a5 rgbCameraVerticalSensorBinningFactor:(int)a6 filteringEnabled:(BOOL)a7 depthPixelFormat:(unsigned int)a8 depthOutputDimensions:(id)a9 timeOfFlightCameraType:(int)a10;
- (BWSensorConfiguration)rgbSensorConfiguration;
- (BWSensorConfiguration)timeOfFlightSensorConfiguration;
- (int)rgbCameraHorizontalSensorBinningFactor;
- (int)rgbCameraVerticalSensorBinningFactor;
- (int)timeOfFlightCameraType;
- (unsigned)depthPixelFormat;
- (void)dealloc;
@end

@implementation BWPointCloudDensificationNodeConfiguration

- (BWPointCloudDensificationNodeConfiguration)initWithRGBSensorConfiguration:(id)a3 timeOfFlightSensorConfiguration:(id)a4 rgbCameraHorizontalSensorBinningFactor:(int)a5 rgbCameraVerticalSensorBinningFactor:(int)a6 filteringEnabled:(BOOL)a7 depthPixelFormat:(unsigned int)a8 depthOutputDimensions:(id)a9 timeOfFlightCameraType:(int)a10
{
  v18.receiver = self;
  v18.super_class = (Class)BWPointCloudDensificationNodeConfiguration;
  v16 = [(BWPointCloudDensificationNodeConfiguration *)&v18 init];
  if (v16)
  {
    v16->_rgbSensorConfiguration = (BWSensorConfiguration *)a3;
    v16->_timeOfFlightSensorConfiguration = (BWSensorConfiguration *)a4;
    v16->_rgbCameraHorizontalSensorBinningFactor = a5;
    v16->_rgbCameraVerticalSensorBinningFactor = a6;
    v16->_filteringEnabled = a7;
    v16->_depthPixelFormat = a8;
    v16->_depthOutputDimensions = ($470D365275581EF16070F5A11344F73E)a9;
    v16->_timeOfFlightCameraType = a10;
  }
  return v16;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPointCloudDensificationNodeConfiguration;
  [(BWPointCloudDensificationNodeConfiguration *)&v3 dealloc];
}

- (BWSensorConfiguration)rgbSensorConfiguration
{
  return self->_rgbSensorConfiguration;
}

- (BWSensorConfiguration)timeOfFlightSensorConfiguration
{
  return self->_timeOfFlightSensorConfiguration;
}

- (int)rgbCameraHorizontalSensorBinningFactor
{
  return self->_rgbCameraHorizontalSensorBinningFactor;
}

- (int)rgbCameraVerticalSensorBinningFactor
{
  return self->_rgbCameraVerticalSensorBinningFactor;
}

- (BOOL)filteringEnabled
{
  return self->_filteringEnabled;
}

- (unsigned)depthPixelFormat
{
  return self->_depthPixelFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)depthOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_depthOutputDimensions;
}

- (int)timeOfFlightCameraType
{
  return self->_timeOfFlightCameraType;
}

@end