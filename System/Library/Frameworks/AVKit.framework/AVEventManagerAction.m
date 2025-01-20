@interface AVEventManagerAction
+ (id)actionWithBlock:(id)a3 event:(id)a4;
+ (id)actionWithTarget:(id)a3 selector:(SEL)a4 event:(id)a5;
- (AVEventManagerAction)initWithEvent:(id)a3;
- (BOOL)hasMatchingEvent:(id)a3;
- (BOOL)hasMatchingTarget:(id)a3 withSelector:(SEL)a4 forEvent:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)event;
- (void)sendAction:(id)a3;
@end

@implementation AVEventManagerAction

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AVEventManagerAction *)a3;
  if (v4 == self) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  event = self->_event;
  if (event == v4->_event) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSString isEqualToString:](event, "isEqualToString:");
  }
LABEL_7:

  return v6;
}

+ (id)actionWithTarget:(id)a3 selector:(SEL)a4 event:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[AVEventManagerSelectorAction alloc] initWithTarget:v8 selector:a4 event:v7];

  return v9;
}

- (AVEventManagerAction)initWithEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVEventManagerAction;
  char v6 = [(AVEventManagerAction *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_event, a3);
  }

  return v7;
}

- (NSString)event
{
  return self->_event;
}

- (void)sendAction:(id)a3
{
}

- (BOOL)hasMatchingTarget:(id)a3 withSelector:(SEL)a4 forEvent:(id)a5
{
  return 0;
}

- (BOOL)hasMatchingEvent:(id)a3
{
  event = self->_event;
  return event == a3 || -[NSString isEqualToString:](event, "isEqualToString:");
}

+ (id)actionWithBlock:(id)a3 event:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[AVEventManagerBlockAction alloc] initWithBlock:v6 event:v5];

  return v7;
}

@end