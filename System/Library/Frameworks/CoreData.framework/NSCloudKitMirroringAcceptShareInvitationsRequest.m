@interface NSCloudKitMirroringAcceptShareInvitationsRequest
- (NSCloudKitMirroringAcceptShareInvitationsRequest)initWithOptions:(id)a3 completionBlock:(id)a4;
- (id)description;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringAcceptShareInvitationsRequest

- (NSCloudKitMirroringAcceptShareInvitationsRequest)initWithOptions:(id)a3 completionBlock:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsRequest;
  v4 = [(NSCloudKitMirroringRequest *)&v6 initWithOptions:a3 completionBlock:a4];
  if (v4)
  {
    v4->_shareURLsToAccept = (NSArray *)(id)NSArray_EmptyArray;
    v4->_shareMetadatasToAccept = (NSArray *)(id)NSArray_EmptyArray;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsRequest;
  [(NSCloudKitMirroringRequest *)&v3 dealloc];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsRequest;
  objc_super v3 = objc_msgSend(-[NSCloudKitMirroringRequest description](&v5, sel_description), "mutableCopy");
  [v3 appendFormat:@"\nshareURLs: %@\nshareMetadatas: %@", self->_shareURLsToAccept, self->_shareMetadatasToAccept];
  return v3;
}

@end