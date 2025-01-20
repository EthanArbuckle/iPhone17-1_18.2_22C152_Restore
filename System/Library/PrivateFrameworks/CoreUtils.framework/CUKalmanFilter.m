@interface CUKalmanFilter
- (CUKalmanFilter)initWithConfiguration:(id)a3;
- (double)stateU;
- (double)stateX;
- (double)updateWithValue:(double)a3;
- (double)updateWithValue:(double)a3 control:(double)a4;
@end

@implementation CUKalmanFilter

- (void).cxx_destruct
{
}

- (double)stateU
{
  return self->_stateU;
}

- (double)stateX
{
  return self->_stateX;
}

- (double)updateWithValue:(double)a3 control:(double)a4
{
  [(CUKalmanConfiguration *)self->_config paramA];
  double v8 = v7;
  double stateX = self->_stateX;
  [(CUKalmanConfiguration *)self->_config paramB];
  double v11 = v10 * a4 + v8 * stateX;
  double v12 = v8 * self->_stateU;
  [(CUKalmanConfiguration *)self->_config paramR];
  double v14 = v13 + v12 * v8;
  [(CUKalmanConfiguration *)self->_config paramC];
  double v16 = v15;
  double v17 = v14 * v15;
  [(CUKalmanConfiguration *)self->_config paramQ];
  double v19 = v17 * (1.0 / (v18 + v17 * v16));
  double result = v11 + v19 * (a3 - v16 * v11);
  self->_double stateX = result;
  self->_stateU = v14 + -(v19 * v16) * v14;
  return result;
}

- (double)updateWithValue:(double)a3
{
  [(CUKalmanFilter *)self updateWithValue:a3 control:0.0];
  return result;
}

- (CUKalmanFilter)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CUKalmanFilter;
  v6 = [(CUKalmanFilter *)&v10 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    *(int64x2_t *)&v7->_double stateX = vdupq_n_s64(0x7FF8000000000000uLL);
    double v8 = v7;
  }

  return v7;
}

@end