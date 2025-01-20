@interface LARatchetState
- (BOOL)isEqual:(id)a3;
- (LARatchetState)initWithRawValue:(int64_t)a3 value:(id)a4 uuid:(id)a5;
- (LARatchetState)initWithState:(id)a3;
- (LARatchetStateValue)value;
- (NSString)uuid;
- (double)duration;
- (id)description;
- (int64_t)rawValue;
@end

@implementation LARatchetState

- (LARatchetState)initWithRawValue:(int64_t)a3 value:(id)a4 uuid:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)LARatchetState;
  v11 = [(LARatchetState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_rawValue = a3;
    objc_storeStrong((id *)&v11->_value, a4);
    objc_storeStrong((id *)&v12->_uuid, a5);
  }

  return v12;
}

- (double)duration
{
  v2 = [(LARatchetState *)self value];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (LARatchetState)initWithState:(id)a3
{
  id v4 = a3;
  if (objc_opt_class())
  {
    switch([v4 rawValue])
    {
      case 1:
        id v10 = [LARatchetStateValueWaitingForCoolOff alloc];
        [v4 duration];
        v5 = -[LARatchetStateValue initWithDuration:](v10, "initWithDuration:");
        v6 = [v4 uuid];
        v7 = self;
        uint64_t v8 = 1;
        break;
      case 2:
        v11 = [LARatchetStateValueWaitingForSecondAuthentication alloc];
        [v4 duration];
        v5 = -[LARatchetStateValue initWithDuration:](v11, "initWithDuration:");
        v6 = [v4 uuid];
        v7 = self;
        uint64_t v8 = 2;
        break;
      case 3:
        v12 = [LARatchetStateValueReady alloc];
        [v4 duration];
        v5 = -[LARatchetStateValue initWithDuration:](v12, "initWithDuration:");
        v6 = [v4 uuid];
        v7 = self;
        uint64_t v8 = 3;
        break;
      case 4:
        v13 = [LARatchetStateValueCollapsed alloc];
        [v4 duration];
        v5 = -[LARatchetStateValue initWithDuration:](v13, "initWithDuration:");
        v6 = [v4 uuid];
        v7 = self;
        uint64_t v8 = 4;
        break;
      default:
        v5 = [[LARatchetStateValueNotStarted alloc] initInternal];
        v6 = [v4 uuid];
        v7 = self;
        uint64_t v8 = 0;
        break;
    }
    self = [(LARatchetState *)v7 initWithRawValue:v8 value:v5 uuid:v6];

    id v9 = self;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)description
{
  v20[3] = *MEMORY[0x1E4F143B8];
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSString;
  unint64_t v6 = [(LARatchetState *)self rawValue];
  if (v6 > 4) {
    v7 = &stru_1F19E1C60;
  }
  else {
    v7 = off_1E63C55C0[v6];
  }
  uint64_t v8 = [v5 stringWithFormat:@"rawValue: %@", v7];
  v20[0] = v8;
  id v9 = NSString;
  [(LARatchetState *)self duration];
  v11 = NSStringFromLARatchetStateDuration(v10);
  v12 = [v9 stringWithFormat:@"duration: %@", v11];
  v20[1] = v12;
  v13 = NSString;
  objc_super v14 = [(LARatchetState *)self uuid];
  v15 = [v13 stringWithFormat:@"uuid: %@", v14];
  v20[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v17 = [v16 componentsJoinedByString:@"; "];
  v18 = [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v17];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 rawValue];
    if (v6 == [(LARatchetState *)self rawValue])
    {
      v7 = [v5 value];
      uint64_t v8 = [(LARatchetState *)self value];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        double v10 = [v5 value];
        v11 = [(LARatchetState *)self value];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      objc_super v14 = [v5 uuid];
      uint64_t v15 = [(LARatchetState *)self uuid];
      if (v14 == (void *)v15)
      {
        char v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        v17 = [v5 uuid];
        v18 = [(LARatchetState *)self uuid];
        char v13 = [v17 isEqualToString:v18];
      }
      goto LABEL_12;
    }
LABEL_5:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 0;
LABEL_13:

  return v13;
}

- (int64_t)rawValue
{
  return self->_rawValue;
}

- (LARatchetStateValue)value
{
  return self->_value;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end