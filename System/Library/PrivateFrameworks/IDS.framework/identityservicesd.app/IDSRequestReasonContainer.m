@interface IDSRequestReasonContainer
+ (id)initialRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4;
+ (id)pushRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4;
+ (id)repairRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4;
+ (id)retryRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4;
+ (id)scheduledRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4;
+ (id)unknownReasonContainer;
+ (id)userRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4;
- (IDSRequestReasonContainer)initWithReason:(unint64_t)a3 subreason:(unint64_t)a4 pathID:(unint64_t)a5;
- (id)requestReasonString;
- (unint64_t)pathID;
- (unint64_t)reason;
- (unint64_t)subreason;
- (void)setPathID:(unint64_t)a3;
- (void)setReason:(unint64_t)a3;
- (void)setSubreason:(unint64_t)a3;
@end

@implementation IDSRequestReasonContainer

- (IDSRequestReasonContainer)initWithReason:(unint64_t)a3 subreason:(unint64_t)a4 pathID:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)IDSRequestReasonContainer;
  result = [(IDSRequestReasonContainer *)&v9 init];
  if (result)
  {
    result->_reason = a3;
    result->_subreason = a4;
    result->_pathID = a5;
  }
  return result;
}

+ (id)unknownReasonContainer
{
  id v2 = [objc_alloc((Class)a1) initWithReason:1 subreason:1 pathID:0];

  return v2;
}

+ (id)scheduledRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) initWithReason:2 subreason:a3 pathID:a4];

  return v4;
}

+ (id)initialRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) initWithReason:3 subreason:a3 pathID:a4];

  return v4;
}

+ (id)userRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) initWithReason:4 subreason:a3 pathID:a4];

  return v4;
}

+ (id)pushRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) initWithReason:5 subreason:a3 pathID:a4];

  return v4;
}

+ (id)repairRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) initWithReason:6 subreason:a3 pathID:a4];

  return v4;
}

+ (id)retryRequestWithSubreason:(unint64_t)a3 pathID:(unint64_t)a4
{
  id v4 = [objc_alloc((Class)a1) initWithReason:7 subreason:a3 pathID:a4];

  return v4;
}

- (id)requestReasonString
{
  return +[NSString stringWithFormat:@"v1:[%lu.%lu.%lu]", [(IDSRequestReasonContainer *)self reason], [(IDSRequestReasonContainer *)self subreason], [(IDSRequestReasonContainer *)self pathID]];
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (unint64_t)subreason
{
  return self->_subreason;
}

- (void)setSubreason:(unint64_t)a3
{
  self->_subreason = a3;
}

- (unint64_t)pathID
{
  return self->_pathID;
}

- (void)setPathID:(unint64_t)a3
{
  self->_pathID = a3;
}

@end