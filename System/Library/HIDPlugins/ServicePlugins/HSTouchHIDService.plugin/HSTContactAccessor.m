@interface HSTContactAccessor
- (Position)position;
- (float)zdensity;
- (float)zsignal;
- (int)force;
- (int)majorRadius;
- (int)minorRadius;
- (unint64_t)flags;
- (unsigned)contactID;
- (unsigned)finger;
- (unsigned)stage;
- (void)setContactID:(unsigned __int8)a3;
- (void)setFinger:(unsigned __int8)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setForce:(int)a3;
- (void)setMajorRadius:(int)a3;
- (void)setMinorRadius:(int)a3;
- (void)setPosition:(Position)a3;
- (void)setStage:(unsigned __int8)a3;
- (void)setZdensity:(float)a3;
- (void)setZsignal:(float)a3;
@end

@implementation HSTContactAccessor

- (unsigned)contactID
{
  return self->frame->contacts.__begin_[self->idx].contactID;
}

- (void)setContactID:(unsigned __int8)a3
{
  self->frame->contacts.__begin_[self->idx].contactID = a3;
}

- (unsigned)stage
{
  return self->frame->contacts.__begin_[self->idx].stage;
}

- (void)setStage:(unsigned __int8)a3
{
  self->frame->contacts.__begin_[self->idx].stage = a3;
}

- (unsigned)finger
{
  return self->frame->contacts.__begin_[self->idx].finger;
}

- (void)setFinger:(unsigned __int8)a3
{
  self->frame->contacts.__begin_[self->idx].finger = a3;
}

- (unint64_t)flags
{
  return self->frame->contacts.__begin_[self->idx].flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->frame->contacts.__begin_[self->idx].flags = a3;
}

- (Position)position
{
  return self->frame->contacts.__begin_[self->idx].position;
}

- (void)setPosition:(Position)a3
{
  self->frame->contacts.__begin_[self->idx].position = a3;
}

- (int)force
{
  return self->frame->contacts.__begin_[self->idx].force;
}

- (void)setForce:(int)a3
{
  self->frame->contacts.__begin_[self->idx].force = a3;
}

- (int)majorRadius
{
  return self->frame->contacts.__begin_[self->idx].majorRadius;
}

- (void)setMajorRadius:(int)a3
{
  self->frame->contacts.__begin_[self->idx].majorRadius = a3;
}

- (int)minorRadius
{
  return self->frame->contacts.__begin_[self->idx].minorRadius;
}

- (void)setMinorRadius:(int)a3
{
  self->frame->contacts.__begin_[self->idx].minorRadius = a3;
}

- (float)zsignal
{
  return self->frame->contacts.__begin_[self->idx].zsignal;
}

- (void)setZsignal:(float)a3
{
  self->frame->contacts.__begin_[self->idx].zsignal = a3;
}

- (float)zdensity
{
  return self->frame->contacts.__begin_[self->idx].zdensity;
}

- (void)setZdensity:(float)a3
{
  self->frame->contacts.__begin_[self->idx].zdensity = a3;
}

- (void).cxx_destruct
{
}

@end