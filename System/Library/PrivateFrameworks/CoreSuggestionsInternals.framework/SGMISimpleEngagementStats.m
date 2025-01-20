@interface SGMISimpleEngagementStats
- (NSNumber)negativeEngagement;
- (NSNumber)noEngagement;
- (NSNumber)positiveEngagement;
- (SGMISimpleEngagementStats)initWithPositiveEngagement:(id)a3 noEngagement:(id)a4 negativeEngagement:(id)a5;
@end

@implementation SGMISimpleEngagementStats

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeEngagement, 0);
  objc_storeStrong((id *)&self->_noEngagement, 0);
  objc_storeStrong((id *)&self->_positiveEngagement, 0);
}

- (NSNumber)negativeEngagement
{
  return self->_negativeEngagement;
}

- (NSNumber)noEngagement
{
  return self->_noEngagement;
}

- (NSNumber)positiveEngagement
{
  return self->_positiveEngagement;
}

- (SGMISimpleEngagementStats)initWithPositiveEngagement:(id)a3 noEngagement:(id)a4 negativeEngagement:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SGMISimpleEngagementStats;
  v12 = [(SGMISimpleEngagementStats *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_positiveEngagement, a3);
    objc_storeStrong((id *)&v13->_noEngagement, a4);
    objc_storeStrong((id *)&v13->_negativeEngagement, a5);
  }

  return v13;
}

@end