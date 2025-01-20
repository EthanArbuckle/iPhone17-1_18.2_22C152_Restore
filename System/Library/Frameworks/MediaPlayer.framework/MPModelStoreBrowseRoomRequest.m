@interface MPModelStoreBrowseRoomRequest
+ (BOOL)supportsSecureCoding;
+ (id)allSupportedItemProperties;
+ (id)allSupportedSectionProperties;
- (MPModelStoreBrowseResponse)previousResponse;
- (MPModelStoreBrowseResponse)previousRetrievedNestedResponse;
- (MPModelStoreBrowseRoomRequest)initWithCoder:(id)a3;
- (NSString)roomID;
- (NSURL)loadAdditionalContentURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newOperationWithResponseHandler:(id)a3;
- (void)configureWithParentSection:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLoadAdditionalContentURL:(id)a3;
- (void)setPreviousResponse:(id)a3;
- (void)setPreviousRetrievedNestedResponse:(id)a3;
- (void)setRoomID:(id)a3;
@end

@implementation MPModelStoreBrowseRoomRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousResponse, 0);
  objc_storeStrong((id *)&self->_previousRetrievedNestedResponse, 0);
  objc_storeStrong((id *)&self->_roomID, 0);

  objc_storeStrong((id *)&self->_loadAdditionalContentURL, 0);
}

- (void)setPreviousResponse:(id)a3
{
}

- (MPModelStoreBrowseResponse)previousResponse
{
  return self->_previousResponse;
}

- (void)setPreviousRetrievedNestedResponse:(id)a3
{
}

- (MPModelStoreBrowseResponse)previousRetrievedNestedResponse
{
  return self->_previousRetrievedNestedResponse;
}

- (void)setRoomID:(id)a3
{
}

- (NSString)roomID
{
  return self->_roomID;
}

- (void)setLoadAdditionalContentURL:(id)a3
{
}

- (NSURL)loadAdditionalContentURL
{
  return self->_loadAdditionalContentURL;
}

- (void)configureWithParentSection:(id)a3
{
  id v4 = a3;
  v5 = [v4 loadAdditionalContentURL];
  [(MPModelStoreBrowseRoomRequest *)self setLoadAdditionalContentURL:v5];

  id v6 = [v4 previouslyRetrievedNestedResponse];

  [(MPModelStoreBrowseRoomRequest *)self setPreviousRetrievedNestedResponse:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPModelStoreBrowseRoomRequest;
  id v4 = [(MPStoreModelRequest *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 14, self->_loadAdditionalContentURL);
    objc_storeStrong(v5 + 16, self->_previousRetrievedNestedResponse);
    objc_storeStrong(v5 + 17, self->_previousResponse);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelStoreBrowseRoomRequest;
  id v4 = a3;
  [(MPStoreModelRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_loadAdditionalContentURL, @"MPModelStoreBrowseRequestLoadAdditionalContentURL", v5.receiver, v5.super_class);
}

- (MPModelStoreBrowseRoomRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPModelStoreBrowseRoomRequest;
  objc_super v5 = [(MPStoreModelRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPModelStoreBrowseRequestLoadAdditionalContentURL"];
    loadAdditionalContentURL = v5->_loadAdditionalContentURL;
    v5->_loadAdditionalContentURL = (NSURL *)v6;
  }
  return v5;
}

- (id)newOperationWithResponseHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MPModelStoreBrowseRoomMusicKitRequestOperation alloc];
  uint64_t v6 = (void *)[(MPModelStoreBrowseRoomRequest *)self copy];
  objc_super v7 = [(MPStoreModelRequestOperation *)v5 initWithRequest:v6 responseHandler:v4];

  return v7;
}

+ (id)allSupportedSectionProperties
{
  return +[MPModelStoreBrowseSectionBuilder allSupportedPropertiesIncludingInternalOnlyProperties:0];
}

+ (id)allSupportedItemProperties
{
  return +[MPModelStoreBrowseContentItemBuilder allSupportedProperties];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end