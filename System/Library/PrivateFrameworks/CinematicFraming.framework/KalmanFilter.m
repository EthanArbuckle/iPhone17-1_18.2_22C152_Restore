@interface KalmanFilter
- (CGRect)estimatedBounds;
- (KalmanFilter)init;
- (int)oid;
- (void)addObservation:(id)a3;
@end

@implementation KalmanFilter

- (KalmanFilter)init
{
  v18.receiver = self;
  v18.super_class = (Class)KalmanFilter;
  v2 = [(KalmanFilter *)&v18 init];
  v3 = v2;
  if (!v2) {
    goto LABEL_9;
  }
  v2->_observationIdentifier = -1;
  v4 = objc_alloc_init(KalmanFilterPrivate);
  kalmanFilterX = v3->_kalmanFilterX;
  v3->_kalmanFilterX = v4;

  if (!v3->_kalmanFilterX) {
    goto LABEL_8;
  }
  v6 = objc_alloc_init(KalmanFilterPrivate);
  kalmanFilterY = v3->_kalmanFilterY;
  v3->_kalmanFilterY = v6;

  if (!v3->_kalmanFilterY) {
    goto LABEL_8;
  }
  v8 = objc_alloc_init(KalmanFilterPrivate);
  kalmanFilterWidth = v3->_kalmanFilterWidth;
  v3->_kalmanFilterWidth = v8;

  if (!v3->_kalmanFilterWidth
    || (v10 = objc_alloc_init(KalmanFilterPrivate),
        kalmanFilterHeight = v3->_kalmanFilterHeight,
        v3->_kalmanFilterHeight = v10,
        kalmanFilterHeight,
        !v3->_kalmanFilterHeight))
  {
LABEL_8:
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_9:
    v16 = 0;
    goto LABEL_7;
  }
  LODWORD(v12) = 1028443341;
  [(KalmanFilterPrivate *)v3->_kalmanFilterX setMeasurementNoise:v12];
  LODWORD(v13) = 1028443341;
  [(KalmanFilterPrivate *)v3->_kalmanFilterY setMeasurementNoise:v13];
  LODWORD(v14) = 1055286886;
  [(KalmanFilterPrivate *)v3->_kalmanFilterWidth setMeasurementNoise:v14];
  LODWORD(v15) = 1055286886;
  [(KalmanFilterPrivate *)v3->_kalmanFilterHeight setMeasurementNoise:v15];
  v3->_isFirstObservation = 1;
  v16 = v3;
LABEL_7:

  return v16;
}

- (void)addObservation:(id)a3
{
  id v4 = a3;
  id v17 = v4;
  if (self->_isFirstObservation)
  {
    self->_observationIdentifier = [v4 oid];
    id v4 = v17;
    self->_isFirstObservation = 0;
  }
  [v4 oid];
  [v17 bounds];
  float v6 = v5;
  [v17 bounds];
  float v8 = v7;
  [v17 bounds];
  float v10 = v9 + (float)(v6 * 0.5);
  [v17 bounds];
  double v12 = v11 + (float)(v8 * 0.5);
  float v13 = v12;
  *(float *)&double v12 = v10;
  [(KalmanFilterPrivate *)self->_kalmanFilterX addObservation:v12];
  *(float *)&double v14 = v13;
  [(KalmanFilterPrivate *)self->_kalmanFilterY addObservation:v14];
  *(float *)&double v15 = v6;
  [(KalmanFilterPrivate *)self->_kalmanFilterWidth addObservation:v15];
  *(float *)&double v16 = v8;
  [(KalmanFilterPrivate *)self->_kalmanFilterHeight addObservation:v16];
}

- (CGRect)estimatedBounds
{
  [(KalmanFilterPrivate *)self->_kalmanFilterWidth estimatedObservation];
  float v4 = v3;
  [(KalmanFilterPrivate *)self->_kalmanFilterHeight estimatedObservation];
  float v6 = v5;
  [(KalmanFilterPrivate *)self->_kalmanFilterX estimatedObservation];
  float v8 = v7 - (float)(v4 * 0.5);
  [(KalmanFilterPrivate *)self->_kalmanFilterY estimatedObservation];
  float v10 = v9 - (float)(v6 * 0.5);
  double v11 = v8;
  double v12 = v10;
  double v13 = v4;
  double v14 = v6;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (int)oid
{
  return self->_observationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kalmanFilterHeight, 0);
  objc_storeStrong((id *)&self->_kalmanFilterWidth, 0);
  objc_storeStrong((id *)&self->_kalmanFilterY, 0);

  objc_storeStrong((id *)&self->_kalmanFilterX, 0);
}

@end