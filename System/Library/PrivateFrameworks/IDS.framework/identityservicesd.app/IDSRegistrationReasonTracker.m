@interface IDSRegistrationReasonTracker
+ (id)sharedInstance;
- (IDSRegistrationReasonTracker)init;
- (IDSRequestReasonContainer)requestReasonContainer;
- (NSMutableDictionary)PNRReasonByUserID;
- (id)registrationRequestReasonString;
- (int64_t)getMostRecentIDSRegistrationReason;
- (int64_t)getPNRReasonForUserUniqueIdentifier:(id)a3;
- (int64_t)mostRecentIDSRegistrationReason;
- (void)clearPNRReasonForUserUniqueIdentifier:(id)a3;
- (void)clearRegistrationRequestReason;
- (void)setMostRecentIDSRegistrationReason:(int64_t)a3;
- (void)setPNRReason:(int64_t)a3 forUserUniqueIdentifier:(id)a4;
- (void)setPNRReasonByUserID:(id)a3;
- (void)setRegistrationRequestReason:(id)a3;
- (void)setRequestReasonContainer:(id)a3;
@end

@implementation IDSRegistrationReasonTracker

+ (id)sharedInstance
{
  if (qword_100A4A7F8 != -1) {
    dispatch_once(&qword_100A4A7F8, &stru_100983B38);
  }
  v2 = (void *)qword_100A4A800;

  return v2;
}

- (IDSRegistrationReasonTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)IDSRegistrationReasonTracker;
  v2 = [(IDSRegistrationReasonTracker *)&v8 init];
  if (v2)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10014AD9C;
    v5[3] = &unk_100981DF0;
    objc_copyWeak(&v6, &location);
    v3 = im_primary_queue();
    sub_1003319E8(v5, @"Recent-Registration-Reasons", (uint64_t)v3);

    v2->_mostRecentIDSRegistrationReason = 0;
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setPNRReason:(int64_t)a3 forUserUniqueIdentifier:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    v7 = [(IDSRegistrationReasonTracker *)self PNRReasonByUserID];

    if (!v7)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      [(IDSRegistrationReasonTracker *)self setPNRReasonByUserID:Mutable];
    }
    id v10 = +[NSNumber numberWithInteger:a3];
    v9 = [(IDSRegistrationReasonTracker *)self PNRReasonByUserID];
    [v9 setObject:v10 forKeyedSubscript:v6];
  }
}

- (void)clearPNRReasonForUserUniqueIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = [(IDSRegistrationReasonTracker *)self PNRReasonByUserID];
    [v5 setObject:0 forKeyedSubscript:v8];

    id v6 = [(IDSRegistrationReasonTracker *)self PNRReasonByUserID];
    id v7 = [v6 count];

    id v4 = v8;
    if (!v7)
    {
      [(IDSRegistrationReasonTracker *)self setPNRReasonByUserID:0];
      id v4 = v8;
    }
  }
}

- (int64_t)getPNRReasonForUserUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(IDSRegistrationReasonTracker *)self PNRReasonByUserID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (v6) {
    id v7 = [v6 integerValue];
  }
  else {
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (void)setMostRecentIDSRegistrationReason:(int64_t)a3
{
  self->_mostRecentIDSRegistrationReason = a3;
}

- (int64_t)getMostRecentIDSRegistrationReason
{
  return self->_mostRecentIDSRegistrationReason;
}

- (void)setRegistrationRequestReason:(id)a3
{
}

- (void)clearRegistrationRequestReason
{
  self->_requestReasonContainer = 0;
  _objc_release_x1();
}

- (id)registrationRequestReasonString
{
  requestReasonContainer = self->_requestReasonContainer;
  if (requestReasonContainer)
  {
    v3 = [(IDSRequestReasonContainer *)requestReasonContainer requestReasonString];
  }
  else
  {
    id v4 = +[IDSRequestReasonContainer unknownReasonContainer];
    v3 = [v4 requestReasonString];
  }

  return v3;
}

- (NSMutableDictionary)PNRReasonByUserID
{
  return self->_PNRReasonByUserID;
}

- (void)setPNRReasonByUserID:(id)a3
{
}

- (int64_t)mostRecentIDSRegistrationReason
{
  return self->_mostRecentIDSRegistrationReason;
}

- (IDSRequestReasonContainer)requestReasonContainer
{
  return self->_requestReasonContainer;
}

- (void)setRequestReasonContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestReasonContainer, 0);

  objc_storeStrong((id *)&self->_PNRReasonByUserID, 0);
}

@end