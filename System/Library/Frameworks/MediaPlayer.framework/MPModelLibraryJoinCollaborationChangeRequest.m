@interface MPModelLibraryJoinCollaborationChangeRequest
- (MPModelPlaylist)collaborationToJoin;
- (NSURL)invitationURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)performWithResponseHandler:(id)a3;
- (void)setCollaborationToJoin:(id)a3;
- (void)setInvitationURL:(id)a3;
@end

@implementation MPModelLibraryJoinCollaborationChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationURL, 0);

  objc_storeStrong((id *)&self->_collaborationToJoin, 0);
}

- (void)setInvitationURL:(id)a3
{
}

- (NSURL)invitationURL
{
  return self->_invitationURL;
}

- (void)setCollaborationToJoin:(id)a3
{
}

- (MPModelPlaylist)collaborationToJoin
{
  return self->_collaborationToJoin;
}

- (void)performWithResponseHandler:(id)a3
{
  id v4 = [(MPModelLibraryJoinCollaborationChangeRequest *)self newOperationWithResponseHandler:a3];
  v3 = +[MPModelLibraryChangeRequest sharedOperationQueue];
  [v3 addOperation:v4];
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPModelLibraryJoinCollaborationChangeRequestOperation);
  [(MPModelLibraryJoinCollaborationChangeRequestOperation *)v5 setRequest:self];
  [(MPModelLibraryJoinCollaborationChangeRequestOperation *)v5 setResponseHandler:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 1, self->_collaborationToJoin);
    objc_storeStrong(v5 + 2, self->_invitationURL);
  }
  return v5;
}

@end