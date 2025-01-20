@interface CKSyndicationOnboardingLinkBalloonView
+ (id)musicSpecialization;
+ (id)podcastSpecialization;
+ (id)tvSpecialization;
- (CKSyndicationOnboardingLinkBalloonView)initWithFrame:(CGRect)a3 withURL:(id)a4;
- (LPLinkMetadata)linkMetadata;
- (LPLinkView)linkView;
- (void)setLinkMetadata:(id)a3;
- (void)setLinkView:(id)a3;
- (void)setPluginViewToURL:(id)a3;
@end

@implementation CKSyndicationOnboardingLinkBalloonView

- (CKSyndicationOnboardingLinkBalloonView)initWithFrame:(CGRect)a3 withURL:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKSyndicationOnboardingLinkBalloonView;
  v10 = -[CKTranscriptPluginBalloonView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(CKSyndicationOnboardingLinkBalloonView *)v10 setPluginViewToURL:v9];
    [(CKTranscriptPluginBalloonView *)v11 setIsSyndicationOnboarding:1];
  }

  return v11;
}

- (void)setPluginViewToURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F30A78];
  id v5 = a3;
  id v10 = objc_alloc_init(v4);
  [v10 setOriginalURL:v5];
  [v10 setURL:v5];
  v6 = [v5 absoluteString];

  if ([v6 hasPrefix:@"https://tv"])
  {
    uint64_t v7 = +[CKSyndicationOnboardingLinkBalloonView tvSpecialization];
  }
  else
  {
    if ([v6 hasPrefix:@"https://podcasts"]) {
      +[CKSyndicationOnboardingLinkBalloonView podcastSpecialization];
    }
    else {
    uint64_t v7 = +[CKSyndicationOnboardingLinkBalloonView musicSpecialization];
    }
  }
  v8 = (void *)v7;
  [v10 setSpecialization:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F30A98]) initWithMetadata:v10];
  [(CKTranscriptPluginBalloonView *)self setPluginView:v9];
}

+ (id)tvSpecialization
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F30A00]);
  v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"WHATS_NEW_SYNDICATION_TV_HEADER" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v2 setTitle:v4];

  id v5 = CKFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"WHATS_NEW_SYNDICATION_TV_SUBTITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v2 setSubtitle:v6];

  uint64_t v7 = [MEMORY[0x1E4F42A80] ckImageNamed:@"HighlightTV"];
  v8 = UIImagePNGRepresentation(v7);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v8 MIMEType:@"image/png"];
  [v2 setArtwork:v9];

  return v2;
}

+ (id)podcastSpecialization
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F30B18]);
  v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"WHATS_NEW_SYNDICATION_PODCAST_HEADER" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v2 setEpisodeName:v4];

  id v5 = CKFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"WHATS_NEW_SYNDICATION_PODCAST_SUBTITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v2 setPodcastName:v6];

  uint64_t v7 = [MEMORY[0x1E4F42A80] ckImageNamed:@"HighlightPodcast"];
  v8 = UIImagePNGRepresentation(v7);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v8 MIMEType:@"image/png"];
  [v2 setArtwork:v9];

  return v2;
}

+ (id)musicSpecialization
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F30B28]);
  v3 = CKFrameworkBundle();
  v4 = [v3 localizedStringForKey:@"WHATS_NEW_SYNDICATION_MUSIC_HEADER" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v2 setName:v4];

  id v5 = CKFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"WHATS_NEW_SYNDICATION_MUSIC_SUBTITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [v2 setArtist:v6];

  uint64_t v7 = [MEMORY[0x1E4F42A80] ckImageNamed:@"HighlightMusic"];
  v8 = UIImagePNGRepresentation(v7);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithData:v8 MIMEType:@"image/png"];
  [v2 setArtwork:v9];

  return v2;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);

  objc_storeStrong((id *)&self->_linkView, 0);
}

@end