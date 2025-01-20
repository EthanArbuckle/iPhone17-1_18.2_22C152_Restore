@interface _MFDelayedNotification
- (BOOL)isInvalidated;
- (BOOL)isProcessing;
- (MFNotificationMessage)notificationMessage;
- (NSString)identifier;
- (_MFDelayedNotification)initWithNotificationMessage:(id)a3 identifier:(id)a4 submissionDate:(double)a5 context:(id)a6;
- (double)submissionDate;
- (id)context;
- (void)invalidate;
- (void)process;
- (void)setContext:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setNotificationMessage:(id)a3;
- (void)setSubmissionDate:(double)a3;
@end

@implementation _MFDelayedNotification

- (_MFDelayedNotification)initWithNotificationMessage:(id)a3 identifier:(id)a4 submissionDate:(double)a5 context:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_MFDelayedNotification;
  v14 = [(_MFDelayedNotification *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_notificationMessage, a3);
    v16 = (NSString *)[v12 copy];
    identifier = v15->_identifier;
    v15->_identifier = v16;

    v15->_submissionDate = a5;
    objc_storeStrong(&v15->_context, a6);
    atomic_store(0, (unsigned __int8 *)&v15->_invalidated);
    atomic_store(0, (unsigned __int8 *)&v15->_processing);
    v18 = v15;
  }

  return v15;
}

- (BOOL)isInvalidated
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_invalidated);
  return v2 & 1;
}

- (void)invalidate
{
}

- (BOOL)isProcessing
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_processing);
  return v2 & 1;
}

- (void)process
{
}

- (MFNotificationMessage)notificationMessage
{
  return self->_notificationMessage;
}

- (void)setNotificationMessage:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)submissionDate
{
  return self->_submissionDate;
}

- (void)setSubmissionDate:(double)a3
{
  self->_submissionDate = a3;
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_notificationMessage, 0);
}

@end