@interface PHVoicemailVoiceMemoURLItem
- (NSDate)voiceMemoDate;
- (NSString)voiceMemoName;
- (NSURL)voiceMemoURL;
- (PHVoicemailVoiceMemoURLItem)init;
- (PHVoicemailVoiceMemoURLItem)initWithVoiceMemoURL:(id)a3 voiceMemoName:(id)a4 voiceMemoDate:(id)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
@end

@implementation PHVoicemailVoiceMemoURLItem

- (PHVoicemailVoiceMemoURLItem)init
{
  [(PHVoicemailVoiceMemoURLItem *)self doesNotRecognizeSelector:a2];
  v3 = +[NSURL URLWithString:&stru_100285990];
  v4 = +[NSDate date];
  v5 = [(PHVoicemailVoiceMemoURLItem *)self initWithVoiceMemoURL:v3 voiceMemoName:&stru_100285990 voiceMemoDate:v4];

  return v5;
}

- (PHVoicemailVoiceMemoURLItem)initWithVoiceMemoURL:(id)a3 voiceMemoName:(id)a4 voiceMemoDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHVoicemailVoiceMemoURLItem;
  v12 = [(PHVoicemailVoiceMemoURLItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_voiceMemoURL, a3);
    objc_storeStrong((id *)&v13->_voiceMemoName, a4);
    objc_storeStrong((id *)&v13->_voiceMemoDate, a5);
  }

  return v13;
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4 = objc_alloc_init((Class)LPFileMetadata);
  v5 = [(PHVoicemailVoiceMemoURLItem *)self voiceMemoName];
  [v4 setName:v5];

  [v4 setType:AVFileTypeAppleM4A];
  v6 = [(PHVoicemailVoiceMemoURLItem *)self voiceMemoDate];
  [v4 setCreationDate:v6];

  id v7 = objc_alloc_init((Class)LPLinkMetadata);
  [v7 setSpecialization:v4];

  return v7;
}

- (NSURL)voiceMemoURL
{
  return self->_voiceMemoURL;
}

- (NSString)voiceMemoName
{
  return self->_voiceMemoName;
}

- (NSDate)voiceMemoDate
{
  return self->_voiceMemoDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceMemoDate, 0);
  objc_storeStrong((id *)&self->_voiceMemoName, 0);

  objc_storeStrong((id *)&self->_voiceMemoURL, 0);
}

@end