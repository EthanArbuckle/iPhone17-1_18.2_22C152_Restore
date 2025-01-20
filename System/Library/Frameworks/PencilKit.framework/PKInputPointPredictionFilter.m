@interface PKInputPointPredictionFilter
- (void)addInputPoint:(id *)a3;
- (void)resetFilter;
@end

@implementation PKInputPointPredictionFilter

- (void)addInputPoint:(id *)a3
{
  if (self)
  {
    p_halfPredictionTimeIntervalPoint = (long long *)a3;
    double predictionTimeInterval = self->_predictionTimeInterval;
    if (predictionTimeInterval != 0.0)
    {
      ++self->super._numInputPoints;
      double var7 = a3->var7;
      double v7 = predictionTimeInterval * 0.5 + var7;
      double v8 = predictionTimeInterval + var7;
      predictor = self->_predictor;
      if (!predictor)
      {
        v10 = objc_alloc_init(PKInputPointPredictor);
        v11 = self->_predictor;
        self->_predictor = v10;

        predictor = self->_predictor;
      }
      long long v12 = p_halfPredictionTimeIntervalPoint[5];
      v30[4] = p_halfPredictionTimeIntervalPoint[4];
      v30[5] = v12;
      long long v13 = p_halfPredictionTimeIntervalPoint[7];
      v30[6] = p_halfPredictionTimeIntervalPoint[6];
      v30[7] = v13;
      long long v14 = p_halfPredictionTimeIntervalPoint[1];
      v30[0] = *p_halfPredictionTimeIntervalPoint;
      v30[1] = v14;
      long long v15 = p_halfPredictionTimeIntervalPoint[3];
      v30[2] = p_halfPredictionTimeIntervalPoint[2];
      v30[3] = v15;
      [(PKInputPointPredictor *)(uint64_t)predictor predictedPointForPoint:&v31 timestamp:v7];
      long long v16 = v36;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.timestamp = v35;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.estimationUpdateIndex = v16;
      long long v17 = v38;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.hasEstimatedAltitudeAndAzimuth = v37;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.estimatedActiveInputProperties = v17;
      long long v18 = v32;
      self->_halfPredictionTimeIntervalPoint.var0 = v31;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.force = v18;
      long long v19 = v34;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.altitude = v33;
      *(_OWORD *)&self->_halfPredictionTimeIntervalPoint.directionAngle = v19;
      v20 = self->_predictor;
      long long v21 = p_halfPredictionTimeIntervalPoint[5];
      v29[4] = p_halfPredictionTimeIntervalPoint[4];
      v29[5] = v21;
      long long v22 = p_halfPredictionTimeIntervalPoint[7];
      v29[6] = p_halfPredictionTimeIntervalPoint[6];
      v29[7] = v22;
      long long v23 = p_halfPredictionTimeIntervalPoint[1];
      v29[0] = *p_halfPredictionTimeIntervalPoint;
      v29[1] = v23;
      long long v24 = p_halfPredictionTimeIntervalPoint[3];
      v29[2] = p_halfPredictionTimeIntervalPoint[2];
      v29[3] = v24;
      [(PKInputPointPredictor *)(uint64_t)v20 predictedPointAtTimestamp:&v31 defaultPoint:v8];
      long long v25 = v36;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.timestamp = v35;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.estimationUpdateIndex = v25;
      long long v26 = v38;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.hasEstimatedAltitudeAndAzimuth = v37;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.estimatedActiveInputProperties = v26;
      long long v27 = v32;
      self->_fullPredictionTimeIntervalPoint.var0 = v31;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.force = v27;
      long long v28 = v34;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.altitude = v33;
      *(_OWORD *)&self->_fullPredictionTimeIntervalPoint.directionAngle = v28;
      if (self->_useHalfPredictionTimeInterval) {
        p_halfPredictionTimeIntervalPoint = (long long *)&self->_halfPredictionTimeIntervalPoint;
      }
      else {
        p_halfPredictionTimeIntervalPoint = (long long *)&self->_fullPredictionTimeIntervalPoint;
      }
    }
    memmove(&self->super._filteredPoint, p_halfPredictionTimeIntervalPoint, 0x80uLL);
  }
}

- (void)resetFilter
{
  v4.receiver = self;
  v4.super_class = (Class)PKInputPointPredictionFilter;
  [(PKInputPointBaseFilter *)&v4 resetFilter];
  predictor = self->_predictor;
  if (predictor) {
    predictor->_numPoints = 0;
  }
}

- (void).cxx_destruct
{
}

@end