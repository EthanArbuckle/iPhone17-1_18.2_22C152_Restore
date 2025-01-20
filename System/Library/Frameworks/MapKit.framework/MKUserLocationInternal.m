@interface MKUserLocationInternal
- (BOOL)isUpdating;
- (CLHeading)heading;
- (CLLocation)fixedLocation;
- (CLLocation)predictedLocation;
- (MKAnnotationPrivate)annotation;
- (NSString)subtitle;
- (NSString)title;
- (double)course;
- (double)timestamp;
- (void)setCourse:(double)a3;
- (void)setFixedLocation:(id)a3;
- (void)setHeading:(id)a3;
- (void)setPredictedLocation:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTitle:(id)a3;
- (void)setUpdating:(BOOL)a3;
@end

@implementation MKUserLocationInternal

- (void)setPredictedLocation:(id)a3
{
}

- (CLHeading)heading
{
  return self->heading;
}

- (void)setHeading:(id)a3
{
}

- (void)setUpdating:(BOOL)a3
{
  self->updating = a3;
}

- (BOOL)isUpdating
{
  return self->updating;
}

- (CLLocation)fixedLocation
{
  return self->fixedLocation;
}

- (void)setFixedLocation:(id)a3
{
}

- (CLLocation)predictedLocation
{
  return self->predictedLocation;
}

- (MKAnnotationPrivate)annotation
{
  return self->annotation;
}

- (double)timestamp
{
  return self->timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->timestamp = a3;
}

- (NSString)title
{
  return self->title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (double)course
{
  return self->course;
}

- (void)setCourse:(double)a3
{
  self->course = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->annotation, 0);
  objc_storeStrong((id *)&self->_annotation, 0);
  objc_storeStrong((id *)&self->subtitle, 0);
  objc_storeStrong((id *)&self->title, 0);
  objc_storeStrong((id *)&self->heading, 0);
  objc_storeStrong((id *)&self->predictedLocation, 0);

  objc_storeStrong((id *)&self->fixedLocation, 0);
}

@end