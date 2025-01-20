@interface ANAnnouncementContent
+ (BOOL)supportsSecureCoding;
+ (id)contentWithAudioFileURL:(id)a3;
- (ANAnnouncementContent)init;
- (ANAnnouncementContent)initWithCoder:(id)a3;
- (NSString)transcription;
- (NSURL)audioFileURL;
- (id)description;
- (id)endpointIdentifier;
- (id)homeKitUserIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioFileURL:(id)a3;
- (void)setEndpointIdentifier:(id)a3;
- (void)setHomeKitUserIdentifier:(id)a3;
- (void)setTranscription:(id)a3;
@end

@implementation ANAnnouncementContent

- (ANAnnouncementContent)init
{
  v3.receiver = self;
  v3.super_class = (Class)ANAnnouncementContent;
  return [(ANAnnouncementContent *)&v3 init];
}

+ (id)contentWithAudioFileURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setAudioFileURL:v3];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v4 = [(ANAnnouncementContent *)self audioFileURL];
  v5 = [(ANAnnouncementContent *)self transcription];
  uint64_t v6 = [v5 length];
  v7 = [(ANAnnouncementContent *)self endpointIdentifier];
  v8 = [(ANAnnouncementContent *)self homeKitUserIdentifier];
  v9 = [v3 stringWithFormat:@"Audio File = %@, Transcription Length = %lu, EndpointID = %@, HomeKitUserID = %@", v4, v6, v7, v8];

  return v9;
}

- (id)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
}

- (id)homeKitUserIdentifier
{
  return self->_homeKitUserIdentifier;
}

- (void)setHomeKitUserIdentifier:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  audioFileURL = self->_audioFileURL;
  id v5 = a3;
  [v5 encodeObject:audioFileURL forKey:@"AudioFileURL"];
  [v5 encodeObject:self->_transcription forKey:@"Transcription"];
  [v5 encodeObject:self->_endpointIdentifier forKey:@"EndpointIdentifier"];
  [v5 encodeObject:self->_homeKitUserIdentifier forKey:@"HomeKitUserIdentifier"];
}

- (ANAnnouncementContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ANAnnouncementContent;
  id v5 = [(ANAnnouncementContent *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AudioFileURL"];
    audioFileURL = v5->_audioFileURL;
    v5->_audioFileURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Transcription"];
    transcription = v5->_transcription;
    v5->_transcription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EndpointIdentifier"];
    endpointIdentifier = v5->_endpointIdentifier;
    v5->_endpointIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HomeKitUserIdentifier"];
    homeKitUserIdentifier = v5->_homeKitUserIdentifier;
    v5->_homeKitUserIdentifier = (NSUUID *)v12;
  }
  return v5;
}

- (NSURL)audioFileURL
{
  return self->_audioFileURL;
}

- (void)setAudioFileURL:(id)a3
{
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_audioFileURL, 0);
  objc_storeStrong((id *)&self->_homeKitUserIdentifier, 0);

  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
}

@end