@interface MSTriageChangeAction
- (BOOL)flagState;
- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4;
- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4 flagColors:(id)a5;
- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4 flagColors:(id)a5 readLaterDate:(id)a6;
- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4 readLaterDate:(id)a5;
- (NSDate)readLaterDate;
- (NSIndexSet)flagColors;
- (NSString)ef_publicDescription;
- (int64_t)action;
@end

@implementation MSTriageChangeAction

- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4
{
  return [(MSTriageChangeAction *)self initWithChangeAction:a3 flagState:a4 flagColors:0 readLaterDate:0];
}

- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4 flagColors:(id)a5
{
  return [(MSTriageChangeAction *)self initWithChangeAction:a3 flagState:a4 flagColors:a5 readLaterDate:0];
}

- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4 readLaterDate:(id)a5
{
  return [(MSTriageChangeAction *)self initWithChangeAction:a3 flagState:a4 flagColors:0 readLaterDate:a5];
}

- (MSTriageChangeAction)initWithChangeAction:(int64_t)a3 flagState:(BOOL)a4 flagColors:(id)a5 readLaterDate:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MSTriageChangeAction;
  v12 = [(MSTriageChangeAction *)&v17 init];
  v13 = v12;
  if (v12)
  {
    v12->_action = a3;
    v12->_flagState = a4;
    uint64_t v14 = [v10 copy];
    flagColors = v13->_flagColors;
    v13->_flagColors = (NSIndexSet *)v14;

    objc_storeStrong((id *)&v13->_readLaterDate, a6);
  }

  return v13;
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  int64_t v4 = [(MSTriageChangeAction *)self action];
  BOOL v5 = [(MSTriageChangeAction *)self flagState];
  v6 = [(MSTriageChangeAction *)self flagColors];
  v7 = [(MSTriageChangeAction *)self readLaterDate];
  v8 = [v3 stringWithFormat:@"Action: %ld, flagState: %d, flagColors: %@, readLaterDate: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (int64_t)action
{
  return self->_action;
}

- (BOOL)flagState
{
  return self->_flagState;
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readLaterDate, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
}

@end