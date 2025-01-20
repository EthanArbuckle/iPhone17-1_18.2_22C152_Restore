@interface EKInviteeAlternativeTime
- (EKInviteeAlternativeTime)initWithStartDate:(id)a3 endDate:(id)a4 conflictedParticipants:(id)a5;
- (NSArray)conflictedParticipants;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)description;
- (void)setConflictedParticipants:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation EKInviteeAlternativeTime

- (EKInviteeAlternativeTime)initWithStartDate:(id)a3 endDate:(id)a4 conflictedParticipants:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKInviteeAlternativeTime;
  v11 = [(EKInviteeAlternativeTime *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(EKInviteeAlternativeTime *)v11 setStartDate:v8];
    [(EKInviteeAlternativeTime *)v12 setEndDate:v9];
    [(EKInviteeAlternativeTime *)v12 setConflictedParticipants:v10];
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)EKInviteeAlternativeTime;
  v4 = [(EKInviteeAlternativeTime *)&v16 description];
  v5 = [(EKInviteeAlternativeTime *)self startDate];
  v6 = [(EKInviteeAlternativeTime *)self endDate];
  v7 = NSNumber;
  id v8 = [(EKInviteeAlternativeTime *)self endDate];
  id v9 = [(EKInviteeAlternativeTime *)self startDate];
  [v8 timeIntervalSinceDate:v9];
  id v10 = objc_msgSend(v7, "numberWithDouble:");
  v11 = NSNumber;
  v12 = [(EKInviteeAlternativeTime *)self conflictedParticipants];
  v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  objc_super v14 = [v3 stringWithFormat:@"[%@] startDate: [%@] endDate: [%@] duration: [%@ seconds] conflictedParticipants count: [%@]", v4, v5, v6, v10, v13];

  return v14;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSArray)conflictedParticipants
{
  return self->_conflictedParticipants;
}

- (void)setConflictedParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictedParticipants, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end