@interface _AFLocationSnapshotMutation
- (BOOL)getPreciseLocationEnabled;
- (BOOL)isDirty;
- (_AFLocationSnapshotMutation)initWithBase:(id)a3;
- (id)getAltitude;
- (id)getDirection;
- (id)getHorizontalAccuracy;
- (id)getLatitude;
- (id)getLongitude;
- (id)getSpeed;
- (id)getVerticalAccuracy;
- (int64_t)getAccessState;
- (void)setAccessState:(int64_t)a3;
- (void)setAltitude:(id)a3;
- (void)setDirection:(id)a3;
- (void)setHorizontalAccuracy:(id)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setPreciseLocationEnabled:(BOOL)a3;
- (void)setSpeed:(id)a3;
- (void)setVerticalAccuracy:(id)a3;
@end

@implementation _AFLocationSnapshotMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalAccuracy, 0);
  objc_storeStrong((id *)&self->_verticalAccuracy, 0);
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->_direction, 0);
  objc_storeStrong((id *)&self->_altitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setAccessState:(int64_t)a3
{
  self->_accessState = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (int64_t)getAccessState
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0) {
    return self->_accessState;
  }
  else {
    return [(AFLocationSnapshot *)self->_base accessState];
  }
}

- (void)setPreciseLocationEnabled:(BOOL)a3
{
  self->_preciseLocationEnabled = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (BOOL)getPreciseLocationEnabled
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_preciseLocationEnabled;
  }
  else {
    return [(AFLocationSnapshot *)self->_base preciseLocationEnabled];
  }
}

- (void)setHorizontalAccuracy:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getHorizontalAccuracy
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_horizontalAccuracy;
  }
  else
  {
    v2 = [(AFLocationSnapshot *)self->_base horizontalAccuracy];
  }
  return v2;
}

- (void)setVerticalAccuracy:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getVerticalAccuracy
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_verticalAccuracy;
  }
  else
  {
    v2 = [(AFLocationSnapshot *)self->_base verticalAccuracy];
  }
  return v2;
}

- (void)setSpeed:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getSpeed
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_speed;
  }
  else
  {
    v2 = [(AFLocationSnapshot *)self->_base speed];
  }
  return v2;
}

- (void)setDirection:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (id)getDirection
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_direction;
  }
  else
  {
    v2 = [(AFLocationSnapshot *)self->_base direction];
  }
  return v2;
}

- (void)setAltitude:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getAltitude
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_altitude;
  }
  else
  {
    v2 = [(AFLocationSnapshot *)self->_base altitude];
  }
  return v2;
}

- (void)setLongitude:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (id)getLongitude
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_longitude;
  }
  else
  {
    v2 = [(AFLocationSnapshot *)self->_base longitude];
  }
  return v2;
}

- (void)setLatitude:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getLatitude
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_latitude;
  }
  else
  {
    v2 = [(AFLocationSnapshot *)self->_base latitude];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFLocationSnapshotMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFLocationSnapshotMutation;
  v6 = [(_AFLocationSnapshotMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end