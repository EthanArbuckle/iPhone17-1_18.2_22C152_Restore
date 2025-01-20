@interface GKLeaderboardSummary
- (GKLeaderboardSummary)initWithInternalRepresentation:(id)a3;
- (GKLeaderboardSummaryInternal)internal;
- (void)setInternal:(id)a3;
@end

@implementation GKLeaderboardSummary

- (GKLeaderboardSummary)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKLeaderboardSummary;
  v5 = [(GKLeaderboardSummary *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GKLeaderboardSummary *)v5 setInternal:v4];
  }

  return v6;
}

- (GKLeaderboardSummaryInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end