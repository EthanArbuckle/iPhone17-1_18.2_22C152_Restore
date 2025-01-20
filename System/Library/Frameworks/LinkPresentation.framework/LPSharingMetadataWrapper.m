@interface LPSharingMetadataWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCompletedFetch;
- (BOOL)hasFetchedSubresources;
- (LPLinkMetadata)metadata;
- (LPSharingMetadataWrapper)initWithCoder:(id)a3;
- (id)dataRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setHasCompletedFetch:(BOOL)a3;
- (void)setHasFetchedSubresources:(BOOL)a3;
- (void)setMetadata:(id)a3;
@end

@implementation LPSharingMetadataWrapper

- (id)dataRepresentation
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
  v4 = [v3 encodedData];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPSharingMetadataWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPSharingMetadataWrapper;
  v5 = [(LPSharingMetadataWrapper *)&v10 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), @"metadata");
    metadata = v5->_metadata;
    v5->_metadata = (LPLinkMetadata *)v6;

    v5->_hasFetchedSubresources = [v4 decodeBoolForKey:@"hasFetchedSubresources"];
    v5->_hasCompletedFetch = [v4 decodeBoolForKey:@"hasCompletedFetch"];
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_metadata forKey:@"metadata"];
  [v4 encodeBool:self->_hasFetchedSubresources forKey:@"hasFetchedSubresources"];
  [v4 encodeBool:self->_hasCompletedFetch forKey:@"hasCompletedFetch"];
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
  id v5 = a3;
  BOOL v6 = [(LPLinkMetadata *)self->_metadata _isCurrentlyLoadingOrIncomplete];

  self->_hasCompletedFetch = !v6;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (BOOL)hasFetchedSubresources
{
  return self->_hasFetchedSubresources;
}

- (void)setHasFetchedSubresources:(BOOL)a3
{
  self->_hasFetchedSubresources = a3;
}

- (BOOL)hasCompletedFetch
{
  return self->_hasCompletedFetch;
}

- (void)setHasCompletedFetch:(BOOL)a3
{
  self->_hasCompletedFetch = a3;
}

- (void).cxx_destruct
{
}

@end