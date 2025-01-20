@interface INCExtensionTransactionState
- (INCExtensionTransactionState)initWithType:(int64_t)a3 intent:(id)a4 intentResponse:(id)a5 userActivities:(id)a6;
- (INIntent)intent;
- (INIntentResponse)intentResponse;
- (NSSet)userActivities;
- (id)description;
- (int64_t)type;
@end

@implementation INCExtensionTransactionState

- (INCExtensionTransactionState)initWithType:(int64_t)a3 intent:(id)a4 intentResponse:(id)a5 userActivities:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)INCExtensionTransactionState;
  v14 = [(INCExtensionTransactionState *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_intent, a4);
    objc_storeStrong((id *)&v15->_intentResponse, a5);
    objc_storeStrong((id *)&v15->_userActivities, a6);
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)INCExtensionTransactionState;
  v4 = [(INCExtensionTransactionState *)&v13 description];
  unint64_t type = self->_type;
  if (type > 5) {
    v6 = 0;
  }
  else {
    v6 = off_1E62BB248[type];
  }
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  id v11 = [v3 stringWithFormat:@"%@ {type = %ld (%@), intent = %@, intentResponse = %@, userActivities = %@}", v4, type, v6, v8, v10, self->_userActivities];

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

- (NSSet)userActivities
{
  return self->_userActivities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivities, 0);
  objc_storeStrong((id *)&self->_intentResponse, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

@end