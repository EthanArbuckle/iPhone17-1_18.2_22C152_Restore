@interface EKUIConferenceRoom
- (BOOL)availabilityRequestInProgress;
- (BOOL)supportsAvailability;
- (EKDirectoryLocation)location;
- (EKUIConferenceRoom)init;
- (int64_t)availability;
- (void)setAvailability:(int64_t)a3;
- (void)setAvailabilityRequestInProgress:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setSupportsAvailability:(BOOL)a3;
@end

@implementation EKUIConferenceRoom

- (EKUIConferenceRoom)init
{
  v3.receiver = self;
  v3.super_class = (Class)EKUIConferenceRoom;
  result = [(EKUIConferenceRoom *)&v3 init];
  if (result) {
    result->_availability = 0;
  }
  return result;
}

- (EKDirectoryLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (BOOL)supportsAvailability
{
  return self->_supportsAvailability;
}

- (void)setSupportsAvailability:(BOOL)a3
{
  self->_supportsAvailability = a3;
}

- (BOOL)availabilityRequestInProgress
{
  return self->_availabilityRequestInProgress;
}

- (void)setAvailabilityRequestInProgress:(BOOL)a3
{
  self->_availabilityRequestInProgress = a3;
}

- (int64_t)availability
{
  return self->_availability;
}

- (void)setAvailability:(int64_t)a3
{
  self->_availability = a3;
}

- (void).cxx_destruct
{
}

@end