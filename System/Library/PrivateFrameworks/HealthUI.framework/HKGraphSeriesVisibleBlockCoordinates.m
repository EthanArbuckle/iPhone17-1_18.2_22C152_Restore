@interface HKGraphSeriesVisibleBlockCoordinates
- (HKGraphSeriesBlockCoordinate)last;
- (HKGraphSeriesBlockCoordinate)maximum;
- (HKGraphSeriesBlockCoordinate)minimum;
- (HKGraphSeriesVisibleBlockCoordinates)initWithMinimum:(id)a3 maximum:(id)a4 last:(id)a5;
@end

@implementation HKGraphSeriesVisibleBlockCoordinates

- (HKGraphSeriesVisibleBlockCoordinates)initWithMinimum:(id)a3 maximum:(id)a4 last:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKGraphSeriesVisibleBlockCoordinates;
  v12 = [(HKGraphSeriesVisibleBlockCoordinates *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_minimum, a3);
    objc_storeStrong((id *)&v13->_maximum, a4);
    objc_storeStrong((id *)&v13->_last, a5);
  }

  return v13;
}

- (HKGraphSeriesBlockCoordinate)minimum
{
  return self->_minimum;
}

- (HKGraphSeriesBlockCoordinate)maximum
{
  return self->_maximum;
}

- (HKGraphSeriesBlockCoordinate)last
{
  return self->_last;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_last, 0);
  objc_storeStrong((id *)&self->_maximum, 0);
  objc_storeStrong((id *)&self->_minimum, 0);
}

@end