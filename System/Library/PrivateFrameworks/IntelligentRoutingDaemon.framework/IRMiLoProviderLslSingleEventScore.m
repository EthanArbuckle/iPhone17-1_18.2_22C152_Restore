@interface IRMiLoProviderLslSingleEventScore
- (NSNumber)score;
- (NSUUID)eventId;
- (void)setEventId:(id)a3;
- (void)setScore:(id)a3;
@end

@implementation IRMiLoProviderLslSingleEventScore

- (NSUUID)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);

  objc_storeStrong((id *)&self->_eventId, 0);
}

@end