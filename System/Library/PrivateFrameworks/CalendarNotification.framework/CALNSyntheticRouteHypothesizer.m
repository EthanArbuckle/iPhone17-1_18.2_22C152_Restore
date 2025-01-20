@interface CALNSyntheticRouteHypothesizer
- (CADRouteHypothesis)currentCADRouteHypothesis;
- (EKTravelEngineHypothesis)currentHypothesis;
- (id)updateHandler;
- (unint64_t)state;
- (void)setCurrentCADRouteHypothesis:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)startHypothesizingWithUpdateHandler:(id)a3;
- (void)stopHypothesizing;
@end

@implementation CALNSyntheticRouteHypothesizer

- (unint64_t)state
{
  return 1;
}

- (EKTravelEngineHypothesis)currentHypothesis
{
  v2 = [(CALNSyntheticRouteHypothesizer *)self currentCADRouteHypothesis];
  v3 = +[CALNRouteHypothesisMapper ekTravelEngineHypothesisFromCADRouteHypothesis:v2];

  return (EKTravelEngineHypothesis *)v3;
}

- (void)startHypothesizingWithUpdateHandler:(id)a3
{
  id v4 = (id)[a3 copy];
  [(CALNSyntheticRouteHypothesizer *)self setUpdateHandler:v4];
}

- (void)stopHypothesizing
{
}

- (CADRouteHypothesis)currentCADRouteHypothesis
{
  return self->currentCADRouteHypothesis;
}

- (void)setCurrentCADRouteHypothesis:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->currentCADRouteHypothesis, 0);
}

@end