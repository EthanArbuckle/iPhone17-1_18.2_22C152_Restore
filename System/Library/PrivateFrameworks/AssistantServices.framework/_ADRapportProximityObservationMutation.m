@interface _ADRapportProximityObservationMutation
- (BOOL)isDirty;
- (_ADRapportProximityObservationMutation)initWithBase:(id)a3;
- (id)getDeviceIDPair;
- (id)getObservationDate;
- (int)getProximity;
- (void)setDeviceIDPair:(id)a3;
- (void)setObservationDate:(id)a3;
- (void)setProximity:(int)a3;
@end

@implementation _ADRapportProximityObservationMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationDate, 0);
  objc_storeStrong((id *)&self->_deviceIDPair, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setObservationDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getObservationDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_observationDate;
  }
  else
  {
    v2 = [(ADRapportProximityObservation *)self->_base observationDate];
  }
  return v2;
}

- (void)setProximity:(int)a3
{
  self->_proximity = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int)getProximity
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_proximity;
  }
  else {
    return [(ADRapportProximityObservation *)self->_base proximity];
  }
}

- (void)setDeviceIDPair:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getDeviceIDPair
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_deviceIDPair;
  }
  else
  {
    v2 = [(ADRapportProximityObservation *)self->_base deviceIDPair];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_ADRapportProximityObservationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ADRapportProximityObservationMutation;
  v6 = [(_ADRapportProximityObservationMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end