@interface GTTelemetryLayerObject
+ (BOOL)supportsSecureCoding;
- (GTTelemetryLayerObject)initWithCoder:(id)a3;
- (GTTelemetryRecordObject)fps;
- (id)description;
- (unint64_t)frames;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
- (void)setFps:(id)a3;
- (void)setFrames:(unint64_t)a3;
- (void)setStreamRef:(unint64_t)a3;
@end

@implementation GTTelemetryLayerObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryLayerObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTTelemetryLayerObject;
  v5 = [(GTTelemetryLayerObject *)&v9 init];
  if (v5)
  {
    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    v5->_frames = [v4 decodeInt64ForKey:@"frames"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fps"];
    fps = v5->_fps;
    v5->_fps = (GTTelemetryRecordObject *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t streamRef = self->_streamRef;
  id v5 = a3;
  [v5 encodeInt64:streamRef forKey:@"streamRef"];
  [v5 encodeInt64:self->_frames forKey:@"frames"];
  [v5 encodeObject:self->_fps forKey:@"fps"];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)GTTelemetryLayerObject;
  v2 = [(GTTelemetryLayerObject *)&v4 description];
  return v2;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_unint64_t streamRef = a3;
}

- (unint64_t)frames
{
  return self->_frames;
}

- (void)setFrames:(unint64_t)a3
{
  self->_frames = a3;
}

- (GTTelemetryRecordObject)fps
{
  return self->_fps;
}

- (void)setFps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end