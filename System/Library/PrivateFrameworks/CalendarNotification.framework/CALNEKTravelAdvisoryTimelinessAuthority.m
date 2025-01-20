@interface CALNEKTravelAdvisoryTimelinessAuthority
- (CALNEKTravelAdvisoryTimelinessAuthority)initWithTravelAdvisoryTimelinessAuthority:(id)a3;
- (EKTravelAdvisoryTimelinessAuthority)travelAdvisoryTimelinessAuthority;
- (id)startOfLeaveNowPeriodForHypothesis:(id)a3;
- (id)startOfRunningLatePeriodForHypothesis:(id)a3;
- (unint64_t)periodForHypothesis:(id)a3;
@end

@implementation CALNEKTravelAdvisoryTimelinessAuthority

- (CALNEKTravelAdvisoryTimelinessAuthority)initWithTravelAdvisoryTimelinessAuthority:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNEKTravelAdvisoryTimelinessAuthority;
  v6 = [(CALNEKTravelAdvisoryTimelinessAuthority *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_travelAdvisoryTimelinessAuthority, a3);
  }

  return v7;
}

- (unint64_t)periodForHypothesis:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNEKTravelAdvisoryTimelinessAuthority *)self travelAdvisoryTimelinessAuthority];
  [v5 updateWithHypothesis:v4];

  unint64_t v6 = [v5 period];
  return v6;
}

- (id)startOfLeaveNowPeriodForHypothesis:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNEKTravelAdvisoryTimelinessAuthority *)self travelAdvisoryTimelinessAuthority];
  [v5 updateWithHypothesis:v4];
  unint64_t v6 = [v5 startOfLeaveNowPeriod];
  if (!v6)
  {
    v7 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CALNEKTravelAdvisoryTimelinessAuthority startOfLeaveNowPeriodForHypothesis:]((uint64_t)v4, v7);
    }
  }
  return v6;
}

- (id)startOfRunningLatePeriodForHypothesis:(id)a3
{
  id v4 = a3;
  id v5 = [(CALNEKTravelAdvisoryTimelinessAuthority *)self travelAdvisoryTimelinessAuthority];
  [v5 updateWithHypothesis:v4];
  unint64_t v6 = [v5 startOfRunningLatePeriod];
  if (!v6)
  {
    v7 = +[CALNLogSubsystem calendar];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CALNEKTravelAdvisoryTimelinessAuthority startOfRunningLatePeriodForHypothesis:]((uint64_t)v4, v7);
    }
  }
  return v6;
}

- (EKTravelAdvisoryTimelinessAuthority)travelAdvisoryTimelinessAuthority
{
  return self->_travelAdvisoryTimelinessAuthority;
}

- (void).cxx_destruct
{
}

- (void)startOfLeaveNowPeriodForHypothesis:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not get start of leave now period for hypothesis = %@", (uint8_t *)&v2, 0xCu);
}

- (void)startOfRunningLatePeriodForHypothesis:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2216BB000, a2, OS_LOG_TYPE_ERROR, "Could not get start of running late period for hypothesis = %@", (uint8_t *)&v2, 0xCu);
}

@end