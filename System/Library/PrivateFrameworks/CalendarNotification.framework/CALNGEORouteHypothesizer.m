@interface CALNGEORouteHypothesizer
- (CADRouteHypothesis)currentCADRouteHypothesis;
- (CALNGEORouteHypothesizer)initWithRouteHypothesizer:(id)a3;
- (EKTravelEngineHypothesis)currentHypothesis;
- (GEORouteHypothesizer)routeHypothesizer;
- (id)updateHandler;
- (unint64_t)state;
- (void)didPostUINotification:(unint64_t)a3;
- (void)requestRefresh;
- (void)setCurrentCADRouteHypothesis:(id)a3;
- (void)startHypothesizingWithUpdateHandler:(id)a3;
- (void)stopHypothesizing;
@end

@implementation CALNGEORouteHypothesizer

- (CALNGEORouteHypothesizer)initWithRouteHypothesizer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNGEORouteHypothesizer;
  v6 = [(CALNGEORouteHypothesizer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_routeHypothesizer, a3);
  }

  return v7;
}

- (unint64_t)state
{
  v2 = [(CALNGEORouteHypothesizer *)self routeHypothesizer];
  unint64_t v3 = [v2 state];

  return v3;
}

- (EKTravelEngineHypothesis)currentHypothesis
{
  v2 = [(CALNGEORouteHypothesizer *)self routeHypothesizer];
  unint64_t v3 = [v2 currentHypothesis];

  v4 = +[CALNRouteHypothesisMapper ekTravelEngineHypothesisFromGEORouteHypothesis:v3];

  return (EKTravelEngineHypothesis *)v4;
}

- (id)updateHandler
{
  return 0;
}

- (void)startHypothesizingWithUpdateHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNGEORouteHypothesizer *)self routeHypothesizer];
  [v5 startHypothesizingWithUpdateHandler:v4];
}

- (void)requestRefresh
{
  id v2 = [(CALNGEORouteHypothesizer *)self routeHypothesizer];
  [v2 requestRefresh];
}

- (void)stopHypothesizing
{
  id v2 = [(CALNGEORouteHypothesizer *)self routeHypothesizer];
  [v2 stopHypothesizing];
}

- (void)didPostUINotification:(unint64_t)a3
{
  id v4 = [(CALNGEORouteHypothesizer *)self routeHypothesizer];
  [v4 didPostUINotification:a3];
}

- (CADRouteHypothesis)currentCADRouteHypothesis
{
  return self->currentCADRouteHypothesis;
}

- (void)setCurrentCADRouteHypothesis:(id)a3
{
}

- (GEORouteHypothesizer)routeHypothesizer
{
  return self->_routeHypothesizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeHypothesizer, 0);
  objc_storeStrong((id *)&self->currentCADRouteHypothesis, 0);
}

@end