@interface WFPrescriptionRecordCollector
- (CRXFLitePrescriptionRecordCollector)collector;
- (WFPrescriptionRecordCollector)initWithTimeout:(double)a3;
- (void)fetchPrescriptionRecordsWithCompletion:(id)a3;
- (void)setCollector:(id)a3;
@end

@implementation WFPrescriptionRecordCollector

- (WFPrescriptionRecordCollector)initWithTimeout:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFPrescriptionRecordCollector;
  v4 = [(WFPrescriptionRecordCollector *)&v7 init];
  if (v4)
  {
    id v5 = [objc_alloc((Class)CRXFLitePrescriptionRecordCollector) initWithTimeout:a3];
    [(WFPrescriptionRecordCollector *)v4 setCollector:v5];
  }
  return v4;
}

- (void)fetchPrescriptionRecordsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(WFPrescriptionRecordCollector *)self collector];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004C74;
  v7[3] = &unk_10003D1D0;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchPrescriptionRecordsWithCompletion:v7];
}

- (CRXFLitePrescriptionRecordCollector)collector
{
  return self->_collector;
}

- (void)setCollector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end