@interface EKInviteeTimeSpan
- (EKInviteeTimeSpan)init;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSMutableArray)conflictedParticipants;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setConflictedParticipants:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation EKInviteeTimeSpan

- (EKInviteeTimeSpan)init
{
  v5.receiver = self;
  v5.super_class = (Class)EKInviteeTimeSpan;
  v2 = [(EKInviteeTimeSpan *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(EKInviteeTimeSpan *)v2 setConflictedParticipants:v3];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_super v5 = [(EKInviteeTimeSpan *)self startDate];
  v6 = (void *)[v5 copy];
  [v4 setStartDate:v6];

  v7 = [(EKInviteeTimeSpan *)self endDate];
  v8 = (void *)[v7 copy];
  [v4 setEndDate:v8];

  v9 = [(EKInviteeTimeSpan *)self conflictedParticipants];
  v10 = (void *)[v9 copy];
  [v4 setConflictedParticipants:v10];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)EKInviteeTimeSpan;
  id v4 = [(EKInviteeTimeSpan *)&v16 description];
  objc_super v5 = [(EKInviteeTimeSpan *)self startDate];
  v6 = [(EKInviteeTimeSpan *)self endDate];
  v7 = NSNumber;
  v8 = [(EKInviteeTimeSpan *)self endDate];
  v9 = [(EKInviteeTimeSpan *)self startDate];
  [v8 timeIntervalSinceDate:v9];
  v10 = objc_msgSend(v7, "numberWithDouble:");
  v11 = NSNumber;
  v12 = [(EKInviteeTimeSpan *)self conflictedParticipants];
  v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v14 = [v3 stringWithFormat:@"[%@] startDate: [%@] endDate: [%@] duration: [%@ seconds] conflictedParticipants count: [%@]", v4, v5, v6, v10, v13];

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

- (NSMutableArray)conflictedParticipants
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