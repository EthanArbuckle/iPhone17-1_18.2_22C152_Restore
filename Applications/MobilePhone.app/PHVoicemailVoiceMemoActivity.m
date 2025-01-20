@interface PHVoicemailVoiceMemoActivity
+ (LSApplicationProxy)applicationProxy;
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (CNContactStore)contactStore;
- (MPMessage)voicemail;
- (PHVoicemailVoiceMemoActivity)initWithVoicemail:(id)a3 contactStore:(id)a4;
- (id)URLItemWithExportedURL:(id)a3 localizedTitle:(id)a4;
- (id)_bundleIdentifierForActivityImageCreation;
- (id)activityTitle;
- (id)activityType;
- (void)performActivity;
@end

@implementation PHVoicemailVoiceMemoActivity

- (PHVoicemailVoiceMemoActivity)initWithVoicemail:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHVoicemailVoiceMemoActivity;
  v9 = [(PHVoicemailVoiceMemoActivity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_voicemail, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
  }

  return v10;
}

- (id)activityType
{
  return @"Voice Memos";
}

- (id)activityTitle
{
  v2 = [(id)objc_opt_class() applicationProxy];
  v3 = [v2 localizedName];

  return v3;
}

+ (int64_t)activityCategory
{
  return 1;
}

- (id)_bundleIdentifierForActivityImageCreation
{
  return @"com.apple.VoiceMemos";
}

+ (LSApplicationProxy)applicationProxy
{
  return (LSApplicationProxy *)+[LSApplicationProxy applicationProxyForIdentifier:@"com.apple.VoiceMemos"];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() applicationProxy];
  v5 = [v4 appState];
  if ([v5 isInstalled] && objc_msgSend(v3, "count") == (id)1)
  {
    v6 = [v3 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v3 objectAtIndexedSubscript:0];
      id v8 = [v7 pathExtension];
      unsigned __int8 v9 = [v8 isEqualToString:@"m4a"];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)performActivity
{
  id v3 = [(PHVoicemailVoiceMemoActivity *)self voicemail];
  v4 = [v3 dataURL];

  v5 = [(PHVoicemailVoiceMemoActivity *)self voicemail];
  v6 = [(PHVoicemailVoiceMemoActivity *)self contactStore];
  id v7 = [v5 displayNameUsingContactStore:v6];

  if (!v7)
  {
    id v8 = +[NSBundle mainBundle];
    id v7 = [v8 localizedStringForKey:@"UNKNOWN_CALLER" value:&stru_100285990 table:@"General"];
  }
  unsigned __int8 v9 = +[NSBundle bundleWithPath:@"/Applications/MobilePhone.app"];
  v10 = [v9 localizedStringForKey:@"VOICEMAIL_SHARE_MESSAGE_%@" value:&stru_100285990 table:@"Voicemail"];
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v7);

  objc_super v12 = (void *)CUTWeakLinkClass();
  v13 = [(PHVoicemailVoiceMemoActivity *)self voicemail];
  v14 = [v13 date];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __47__PHVoicemailVoiceMemoActivity_performActivity__block_invoke;
  v15[3] = &unk_10027E200;
  v15[4] = self;
  [v12 importRecordingWithSourceAudioURL:v4 name:v11 date:v14 completionHandler:v15];
}

id __47__PHVoicemailVoiceMemoActivity_performActivity__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:1];
}

- (id)URLItemWithExportedURL:(id)a3 localizedTitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [PHVoicemailVoiceMemoURLItem alloc];
  unsigned __int8 v9 = [(PHVoicemailVoiceMemoActivity *)self voicemail];
  v10 = [v9 date];
  v11 = [(PHVoicemailVoiceMemoURLItem *)v8 initWithVoiceMemoURL:v7 voiceMemoName:v6 voiceMemoDate:v10];

  return v11;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (MPMessage)voicemail
{
  return self->_voicemail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicemail, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end