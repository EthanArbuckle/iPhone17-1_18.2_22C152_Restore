@interface CalendarSeparationSharedResource
- (NSMutableArray)csParticipants;
- (NSString)displayDetail;
- (NSString)displayName;
- (int64_t)visibility;
- (void)makePrivateWithCompletion:(id)a3;
- (void)setCsParticipants:(id)a3;
- (void)stopSharingWithCompletion:(id)a3;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
@end

@implementation CalendarSeparationSharedResource

- (void)stopSharingWithCompletion:(id)a3
{
}

- (void)makePrivateWithCompletion:(id)a3
{
  NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
  CFStringRef v8 = @"Not supported on this resource type";
  id v4 = a3;
  v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v6 = +[NSError errorWithDomain:@"CalendarSeparationErrorDomain" code:0 userInfo:v5];
  (*((void (**)(id, void, void *))a3 + 2))(v4, 0, v6);
}

- (NSString)displayDetail
{
  return self->displayDetail;
}

- (NSString)displayName
{
  return self->displayName;
}

- (int64_t)visibility
{
  return self->visibility;
}

- (NSMutableArray)csParticipants
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCsParticipants:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csParticipants, 0);
  objc_storeStrong((id *)&self->displayName, 0);

  objc_storeStrong((id *)&self->displayDetail, 0);
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  uint64_t v6 = objc_opt_class();

  _NSRequestConcreteImplementation(self, a2, v6);
}

@end