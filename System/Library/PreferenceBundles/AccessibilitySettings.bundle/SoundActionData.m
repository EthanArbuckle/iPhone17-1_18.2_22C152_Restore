@interface SoundActionData
- (NSString)name;
- (NSString)tip;
- (NSURL)soundURL;
- (SoundActionData)initWithName:(id)a3 tip:(id)a4 url:(id)a5 usage:(int64_t)a6;
- (int64_t)usage;
- (void)setName:(id)a3;
- (void)setSoundURL:(id)a3;
- (void)setTip:(id)a3;
- (void)setUsage:(int64_t)a3;
@end

@implementation SoundActionData

- (SoundActionData)initWithName:(id)a3 tip:(id)a4 url:(id)a5 usage:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SoundActionData;
  v13 = [(SoundActionData *)&v18 init];
  if (v13)
  {
    id v14 = [v10 copy];
    [(SoundActionData *)v13 setName:v14];

    id v15 = [v11 copy];
    [(SoundActionData *)v13 setTip:v15];

    id v16 = [v12 copy];
    [(SoundActionData *)v13 setSoundURL:v16];

    [(SoundActionData *)v13 setUsage:a6];
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)tip
{
  return self->_tip;
}

- (void)setTip:(id)a3
{
}

- (NSURL)soundURL
{
  return self->_soundURL;
}

- (void)setSoundURL:(id)a3
{
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundURL, 0);
  objc_storeStrong((id *)&self->_tip, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end