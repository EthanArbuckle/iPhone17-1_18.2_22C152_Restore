@interface EKUIAlarm
- (BOOL)isDefaultAlarm;
- (BOOL)isEqualToUIAlarm:(id)a3;
- (BOOL)isLeaveNowAlarm;
- (EKAlarm)alarm;
- (EKUIAlarm)initWithAlarm:(id)a3;
- (id)description;
- (id)initDefaultAlarm;
- (id)initLeaveNowAlarm;
- (id)localizedDescriptionAllDay:(BOOL)a3;
@end

@implementation EKUIAlarm

- (EKUIAlarm)initWithAlarm:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKUIAlarm;
  v6 = [(EKUIAlarm *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_isLeaveNowAlarm = 0;
    v6->_isDefaultAlarm = [v5 isDefaultAlarm];
    objc_storeStrong((id *)&v7->_alarm, a3);
  }

  return v7;
}

- (id)initDefaultAlarm
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIAlarm;
  v2 = [(EKUIAlarm *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isLeaveNowAlarm = 256;
    alarm = v2->_alarm;
    v2->_alarm = 0;
  }
  return v3;
}

- (id)initLeaveNowAlarm
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIAlarm;
  v2 = [(EKUIAlarm *)&v6 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isLeaveNowAlarm = 1;
    alarm = v2->_alarm;
    v2->_alarm = 0;
  }
  return v3;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v8.receiver = self;
  v8.super_class = (Class)EKUIAlarm;
  v4 = [(EKUIAlarm *)&v8 description];
  id v5 = (void *)[v3 initWithSuperclassDescription:v4];

  [v5 setKey:@"_isLeaveNowAlarm" withBoolean:self->_isLeaveNowAlarm];
  [v5 setKey:@"_isDefaultAlarm" withBoolean:self->_isDefaultAlarm];
  [v5 setKey:@"_alarm" withObject:self->_alarm];
  objc_super v6 = [v5 build];

  return v6;
}

- (id)localizedDescriptionAllDay:(BOOL)a3
{
  if (self->_isLeaveNowAlarm)
  {
    id v3 = EventKitUIBundle();
    v4 = [v3 localizedStringForKey:@"Time to Leave" value:&stru_1F0CC2140 table:0];
  }
  else
  {
    alarm = self->_alarm;
    if (a3) {
      [(EKAlarm *)alarm localizedAllDayDescription];
    }
    else {
    v4 = [(EKAlarm *)alarm localizedDescription];
    }
  }

  return v4;
}

- (BOOL)isEqualToUIAlarm:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(EKUIAlarm *)self isDefaultAlarm];
    if (v5 == [v4 isDefaultAlarm])
    {
      int v6 = [(EKUIAlarm *)self isLeaveNowAlarm];
      if (v6 == [v4 isLeaveNowAlarm])
      {
        if (-[EKUIAlarm isLeaveNowAlarm](self, "isLeaveNowAlarm") && ([v4 isLeaveNowAlarm] & 1) != 0)
        {
          char v7 = 1;
          goto LABEL_5;
        }
        objc_super v9 = [(EKUIAlarm *)self alarm];
        v10 = [v4 alarm];
        v11 = v10;
        if (v9)
        {
          v10 = v9;
          v12 = v11;
        }
        else
        {
          if (!v10)
          {
            char v7 = 1;
            goto LABEL_14;
          }
          v12 = 0;
        }
        char v7 = [v10 isTopographicallyEqualToAlarm:v12];
LABEL_14:

        goto LABEL_5;
      }
    }
  }
  char v7 = 0;
LABEL_5:

  return v7;
}

- (BOOL)isLeaveNowAlarm
{
  return self->_isLeaveNowAlarm;
}

- (BOOL)isDefaultAlarm
{
  return self->_isDefaultAlarm;
}

- (EKAlarm)alarm
{
  return self->_alarm;
}

- (void).cxx_destruct
{
}

@end