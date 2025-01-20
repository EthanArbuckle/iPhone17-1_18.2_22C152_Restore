@interface CLTripSegmentProcessorOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)createSparseDataFromOneHzData;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isSimulatedSparseProcessing;
- (BOOL)runInertialIntegrator;
- (BOOL)runLinearInterpolator;
- (BOOL)runMapIntegrator;
- (BOOL)shouldRecordDataInFileForReplay;
- (BOOL)useParticleMapMatcherForSnappingInMapIntegrator;
- (BOOL)useXPCServiceForMapQuery;
- (CLTripSegmentProcessorOptions)init;
- (CLTripSegmentProcessorOptions)initWithCoder:(id)a3;
- (NSString)tripSegmentRecorderLoggingDirectory;
- (double)timeBetweenReconstructedPointsSeconds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCreateSparseDataFromOneHzData:(BOOL)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setRunInertialIntegrator:(BOOL)a3;
- (void)setRunLinearInterpolator:(BOOL)a3;
- (void)setRunMapIntegrator:(BOOL)a3;
- (void)setSimulatedSparseProcessing:(BOOL)a3;
- (void)setTimeBetweenReconstructedPointsSeconds:(double)a3;
- (void)setTripSegmentRecorderLoggingDirectory:(id)a3;
- (void)setUseParticleMapMatcherForSnappingInMapIntegrator:(BOOL)a3;
- (void)setUseXPCService:(BOOL)a3;
- (void)setshouldRecordDataInFileForReplay:(BOOL)a3;
@end

@implementation CLTripSegmentProcessorOptions

- (CLTripSegmentProcessorOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentProcessorOptions;
  result = [(CLTripSegmentProcessorOptions *)&v3 init];
  if (result)
  {
    result->_shouldRecordDataInFileForReplay = 1;
    *(_DWORD *)&result->_runLinearInterpolator = 16843009;
    *(_DWORD *)&result->_createSparseDataFromOneHzData = 16842752;
    result->_timeBetweenReconstructedPointsSeconds = 1.0;
    result->_tripSegmentRecorderLoggingDirectory = (NSString *)@"/var/mobile/Library/Caches/com.apple.routined/tripSegments/";
  }
  return result;
}

- (void)setRunLinearInterpolator:(BOOL)a3
{
  self->_runLinearInterpolator = a3;
}

- (void)setRunInertialIntegrator:(BOOL)a3
{
  self->_runInertialIntegrator = a3;
}

- (void)setRunMapIntegrator:(BOOL)a3
{
  self->_runMapIntegrator = a3;
}

- (void)setUseXPCService:(BOOL)a3
{
  self->_useXPCServiceForMapQuery = a3;
}

- (void)setshouldRecordDataInFileForReplay:(BOOL)a3
{
  self->_shouldRecordDataInFileForReplay = a3;
}

- (void)setCreateSparseDataFromOneHzData:(BOOL)a3
{
  self->_createSparseDataFromOneHzData = a3;
}

- (void)setSimulatedSparseProcessing:(BOOL)a3
{
  self->_isSimulatedSparseProcessing = a3;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_isNetworkAccessAllowed = a3;
}

- (void)setTimeBetweenReconstructedPointsSeconds:(double)a3
{
  self->_timeBetweenReconstructedPointsSeconds = a3;
}

- (void)setUseParticleMapMatcherForSnappingInMapIntegrator:(BOOL)a3
{
  self->_useParticleMapMatcherForSnappingInMapIntegrator = a3;
}

- (void)setTripSegmentRecorderLoggingDirectory:(id)a3
{
  self->_tripSegmentRecorderLoggingDirectory = (NSString *)a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setRunLinearInterpolator:", -[CLTripSegmentProcessorOptions runLinearInterpolator](self, "runLinearInterpolator"));
  objc_msgSend(v4, "setRunInertialIntegrator:", -[CLTripSegmentProcessorOptions runInertialIntegrator](self, "runInertialIntegrator"));
  objc_msgSend(v4, "setRunMapIntegrator:", -[CLTripSegmentProcessorOptions runMapIntegrator](self, "runMapIntegrator"));
  objc_msgSend(v4, "setUseXPCService:", -[CLTripSegmentProcessorOptions useXPCServiceForMapQuery](self, "useXPCServiceForMapQuery"));
  objc_msgSend(v4, "setshouldRecordDataInFileForReplay:", -[CLTripSegmentProcessorOptions shouldRecordDataInFileForReplay](self, "shouldRecordDataInFileForReplay"));
  objc_msgSend(v4, "setCreateSparseDataFromOneHzData:", -[CLTripSegmentProcessorOptions createSparseDataFromOneHzData](self, "createSparseDataFromOneHzData"));
  objc_msgSend(v4, "setSimulatedSparseProcessing:", -[CLTripSegmentProcessorOptions isSimulatedSparseProcessing](self, "isSimulatedSparseProcessing"));
  objc_msgSend(v4, "setNetworkAccessAllowed:", -[CLTripSegmentProcessorOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  [(CLTripSegmentProcessorOptions *)self timeBetweenReconstructedPointsSeconds];
  objc_msgSend(v4, "setTimeBetweenReconstructedPointsSeconds:");
  objc_msgSend(v4, "setUseParticleMapMatcherForSnappingInMapIntegrator:", -[CLTripSegmentProcessorOptions useParticleMapMatcherForSnappingInMapIntegrator](self, "useParticleMapMatcherForSnappingInMapIntegrator"));
  objc_msgSend(v4, "setTripSegmentRecorderLoggingDirectory:", -[CLTripSegmentProcessorOptions tripSegmentRecorderLoggingDirectory](self, "tripSegmentRecorderLoggingDirectory"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLTripSegmentProcessorOptions;
  [(CLTripSegmentProcessorOptions *)&v2 dealloc];
}

- (id)description
{
  objc_super v2 = NSString;
  objc_super v3 = (objc_class *)objc_opt_class();
  return (id)[v2 stringWithFormat:@"%@", NSStringFromClass(v3)];
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentProcessorOptions runLinearInterpolator](self, "runLinearInterpolator"), @"runLinearInterpolator");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentProcessorOptions runInertialIntegrator](self, "runInertialIntegrator"), @"runInertialIntegrator");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentProcessorOptions runMapIntegrator](self, "runMapIntegrator"), @"runMapIntegrator");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentProcessorOptions useXPCServiceForMapQuery](self, "useXPCServiceForMapQuery"), @"useXPCServiceForMapQuery");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentProcessorOptions shouldRecordDataInFileForReplay](self, "shouldRecordDataInFileForReplay"), @"shouldRecordDataInFileForReplay");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentProcessorOptions createSparseDataFromOneHzData](self, "createSparseDataFromOneHzData"), @"createSparseDataFromOneHzData");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentProcessorOptions isSimulatedSparseProcessing](self, "isSimulatedSparseProcessing"), @"isSimulatedSparseProcessing");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentProcessorOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"), @"isNetworkAccessAllowed");
  [(CLTripSegmentProcessorOptions *)self timeBetweenReconstructedPointsSeconds];
  objc_msgSend(a3, "encodeDouble:forKey:", @"timeBetweenReconstructedPointsSeconds");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentProcessorOptions useParticleMapMatcherForSnappingInMapIntegrator](self, "useParticleMapMatcherForSnappingInMapIntegrator"), @"useParticleMapMatcherForSnappingInMapIntegrator");
  v5 = [(CLTripSegmentProcessorOptions *)self tripSegmentRecorderLoggingDirectory];

  [a3 encodeObject:v5 forKey:@"tripSegmentRecorderLoggingDirectory"];
}

- (CLTripSegmentProcessorOptions)initWithCoder:(id)a3
{
  v4 = objc_alloc_init(CLTripSegmentProcessorOptions);
  -[CLTripSegmentProcessorOptions setRunLinearInterpolator:](v4, "setRunLinearInterpolator:", [a3 decodeBoolForKey:@"runLinearInterpolator"]);
  -[CLTripSegmentProcessorOptions setRunInertialIntegrator:](v4, "setRunInertialIntegrator:", [a3 decodeBoolForKey:@"runInertialIntegrator"]);
  -[CLTripSegmentProcessorOptions setRunMapIntegrator:](v4, "setRunMapIntegrator:", [a3 decodeBoolForKey:@"runMapIntegrator"]);
  -[CLTripSegmentProcessorOptions setUseXPCService:](v4, "setUseXPCService:", [a3 decodeBoolForKey:@"useXPCServiceForMapQuery"]);
  -[CLTripSegmentProcessorOptions setshouldRecordDataInFileForReplay:](v4, "setshouldRecordDataInFileForReplay:", [a3 decodeBoolForKey:@"shouldRecordDataInFileForReplay"]);
  -[CLTripSegmentProcessorOptions setCreateSparseDataFromOneHzData:](v4, "setCreateSparseDataFromOneHzData:", [a3 decodeBoolForKey:@"createSparseDataFromOneHzData"]);
  -[CLTripSegmentProcessorOptions setSimulatedSparseProcessing:](v4, "setSimulatedSparseProcessing:", [a3 decodeBoolForKey:@"isSimulatedSparseProcessing"]);
  -[CLTripSegmentProcessorOptions setNetworkAccessAllowed:](v4, "setNetworkAccessAllowed:", [a3 decodeBoolForKey:@"isNetworkAccessAllowed"]);
  [a3 decodeDoubleForKey:@"timeBetweenReconstructedPointsSeconds"];
  -[CLTripSegmentProcessorOptions setTimeBetweenReconstructedPointsSeconds:](v4, "setTimeBetweenReconstructedPointsSeconds:");
  -[CLTripSegmentProcessorOptions setUseParticleMapMatcherForSnappingInMapIntegrator:](v4, "setUseParticleMapMatcherForSnappingInMapIntegrator:", [a3 decodeBoolForKey:@"useParticleMapMatcherForSnappingInMapIntegrator"]);
  -[CLTripSegmentProcessorOptions setTripSegmentRecorderLoggingDirectory:](v4, "setTripSegmentRecorderLoggingDirectory:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"tripSegmentRecorderLoggingDirectory"]);
  return v4;
}

- (BOOL)runLinearInterpolator
{
  return self->_runLinearInterpolator;
}

- (BOOL)runInertialIntegrator
{
  return self->_runInertialIntegrator;
}

- (BOOL)runMapIntegrator
{
  return self->_runMapIntegrator;
}

- (BOOL)useXPCServiceForMapQuery
{
  return self->_useXPCServiceForMapQuery;
}

- (BOOL)shouldRecordDataInFileForReplay
{
  return self->_shouldRecordDataInFileForReplay;
}

- (BOOL)createSparseDataFromOneHzData
{
  return self->_createSparseDataFromOneHzData;
}

- (BOOL)isSimulatedSparseProcessing
{
  return self->_isSimulatedSparseProcessing;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_isNetworkAccessAllowed;
}

- (double)timeBetweenReconstructedPointsSeconds
{
  return self->_timeBetweenReconstructedPointsSeconds;
}

- (BOOL)useParticleMapMatcherForSnappingInMapIntegrator
{
  return self->_useParticleMapMatcherForSnappingInMapIntegrator;
}

- (NSString)tripSegmentRecorderLoggingDirectory
{
  return self->_tripSegmentRecorderLoggingDirectory;
}

@end