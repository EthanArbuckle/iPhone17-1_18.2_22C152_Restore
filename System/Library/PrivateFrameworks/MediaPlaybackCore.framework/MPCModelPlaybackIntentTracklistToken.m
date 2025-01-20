@interface MPCModelPlaybackIntentTracklistToken
+ (BOOL)supportsSecureCoding;
+ (MPPropertySet)requiredPropertiesForStaticMediaClips;
- (MPCModelPlaybackIntentTracklistToken)initWithCoder:(id)a3;
- (MPIdentifierSet)startItemIdentifiers;
- (MPModelRequest)request;
- (void)encodeWithCoder:(id)a3;
- (void)setRequest:(id)a3;
- (void)setStartItemIdentifiers:(id)a3;
@end

@implementation MPCModelPlaybackIntentTracklistToken

- (void)setStartItemIdentifiers:(id)a3
{
}

- (void)setRequest:(id)a3
{
}

+ (MPPropertySet)requiredPropertiesForStaticMediaClips
{
  return (MPPropertySet *)+[MPCModelMediaClipAVItem requiredMediaClipProperties];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startItemIdentifiers, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (MPIdentifierSet)startItemIdentifiers
{
  return self->_startItemIdentifiers;
}

- (MPModelRequest)request
{
  return self->_request;
}

- (void)encodeWithCoder:(id)a3
{
  request = self->_request;
  id v5 = a3;
  [v5 encodeObject:request forKey:@"MPCModelPlaybackIntentTracklistTokenRequest"];
  [v5 encodeObject:self->_startItemIdentifiers forKey:@"MPCModelPlaybackIntentTracklistTokenStartItemIdentifiers"];
}

- (MPCModelPlaybackIntentTracklistToken)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MPCModelPlaybackIntentTracklistToken *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelPlaybackIntentTracklistTokenRequest"];
    request = v5->_request;
    v5->_request = (MPModelRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCModelPlaybackIntentTracklistTokenStartItemIdentifiers"];
    startItemIdentifiers = v5->_startItemIdentifiers;
    v5->_startItemIdentifiers = (MPIdentifierSet *)v8;
  }
  return v5;
}

@end