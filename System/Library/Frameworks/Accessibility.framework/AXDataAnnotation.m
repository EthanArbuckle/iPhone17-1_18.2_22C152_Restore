@interface AXDataAnnotation
- (AXDataAnnotation)initWithLocation:(id)a3;
- (AXDataAnnotation)initWithLocation:(id)a3 label:(id)a4;
- (AXDataPoint)location;
- (BOOL)playsHaptic;
- (BOOL)speakDuringPlayback;
- (NSString)label;
- (void)setLabel:(id)a3;
- (void)setLocation:(id)a3;
- (void)setPlaysHaptic:(BOOL)a3;
- (void)setSpeakDuringPlayback:(BOOL)a3;
@end

@implementation AXDataAnnotation

- (AXDataAnnotation)initWithLocation:(id)a3 label:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXDataAnnotation;
  v7 = [(AXDataAnnotation *)&v10 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_location, a3);
  }

  return v8;
}

- (AXDataAnnotation)initWithLocation:(id)a3
{
  return [(AXDataAnnotation *)self initWithLocation:a3 label:0];
}

- (AXDataPoint)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)playsHaptic
{
  return self->_playsHaptic;
}

- (void)setPlaysHaptic:(BOOL)a3
{
  self->_playsHaptic = a3;
}

- (BOOL)speakDuringPlayback
{
  return self->_speakDuringPlayback;
}

- (void)setSpeakDuringPlayback:(BOOL)a3
{
  self->_speakDuringPlayback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end