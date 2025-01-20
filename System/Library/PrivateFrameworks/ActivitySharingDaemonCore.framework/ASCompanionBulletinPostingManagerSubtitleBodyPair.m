@interface ASCompanionBulletinPostingManagerSubtitleBodyPair
- (ASCompanionBulletinPostingManagerSubtitleBodyPair)initWithSubtitle:(id)a3 body:(id)a4;
- (NSString)body;
- (NSString)subtitle;
- (void)setBody:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation ASCompanionBulletinPostingManagerSubtitleBodyPair

- (ASCompanionBulletinPostingManagerSubtitleBodyPair)initWithSubtitle:(id)a3 body:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASCompanionBulletinPostingManagerSubtitleBodyPair;
  v9 = [(ASCompanionBulletinPostingManagerSubtitleBodyPair *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subtitle, a3);
    objc_storeStrong((id *)&v10->_body, a4);
  }

  return v10;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end