@interface PhotosSeparationSharedResource
- (NSArray)participants;
- (NSString)uuid;
- (PhotosSeparationSharedResource)initWithParticipants:(id)a3;
- (void)stopSharingToParticipant:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithCompletion:(id)a3;
- (void)updateVisibility:(int64_t)a3 completion:(id)a4;
@end

@implementation PhotosSeparationSharedResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_participants, 0);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)updateVisibility:(int64_t)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)stopSharingToParticipant:(id)a3 withCompletion:(id)a4
{
  id v6 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PhotosSeparationSharedResource.m", 37, @"%s is an abstract method and requires a subclass to implement it", "-[PhotosSeparationSharedResource stopSharingToParticipant:withCompletion:]");
}

- (void)stopSharingWithCompletion:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PhotosSeparationSharedResource.m", 33, @"%s is an abstract method and requires a subclass to implement it", "-[PhotosSeparationSharedResource stopSharingWithCompletion:]");
}

- (PhotosSeparationSharedResource)initWithParticipants:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PhotosSeparationSharedResource;
  id v6 = [(PhotosSeparationSharedResource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_participants, a3);
  }

  return v7;
}

@end