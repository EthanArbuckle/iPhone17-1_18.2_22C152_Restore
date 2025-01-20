@interface HMDVisitTuple
- (CLVisit)visit;
- (HMDVisitMonitoringDelegate)delegate;
- (HMDVisitTuple)initWithVisit:(id)a3 delegate:(id)a4;
@end

@implementation HMDVisitTuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_visit, 0);
}

- (HMDVisitMonitoringDelegate)delegate
{
  return self->_delegate;
}

- (CLVisit)visit
{
  return self->_visit;
}

- (HMDVisitTuple)initWithVisit:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDVisitTuple;
  v9 = [(HMDVisitTuple *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_visit, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
  }

  return v10;
}

@end