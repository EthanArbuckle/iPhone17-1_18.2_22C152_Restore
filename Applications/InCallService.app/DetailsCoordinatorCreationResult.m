@interface DetailsCoordinatorCreationResult
- (CNKCallDetailsCoordinatorProtocol)coordinator;
- (_TtC13InCallService32DetailsCoordinatorCreationResult)init;
- (_TtC13InCallService32DetailsCoordinatorCreationResult)initWithOutcome:(int64_t)a3 coordinator:(id)a4;
- (int64_t)outcome;
@end

@implementation DetailsCoordinatorCreationResult

- (int64_t)outcome
{
  return sub_10012F138();
}

- (CNKCallDetailsCoordinatorProtocol)coordinator
{
  v2 = (void *)sub_10012F17C();

  return (CNKCallDetailsCoordinatorProtocol *)v2;
}

- (_TtC13InCallService32DetailsCoordinatorCreationResult)initWithOutcome:(int64_t)a3 coordinator:(id)a4
{
  return (_TtC13InCallService32DetailsCoordinatorCreationResult *)sub_10012F18C(a3, (uint64_t)a4);
}

- (_TtC13InCallService32DetailsCoordinatorCreationResult)init
{
}

- (void).cxx_destruct
{
}

@end