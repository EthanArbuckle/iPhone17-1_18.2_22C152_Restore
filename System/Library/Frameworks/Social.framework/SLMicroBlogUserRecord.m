@interface SLMicroBlogUserRecord
+ (BOOL)supportsSecureCoding;
+ (SLMicroBlogUserRecord)userRecordWithDictionaryRepresentation:(id)a3;
- (NSString)name;
- (NSString)profile_image_url;
- (NSString)screen_name;
- (SLMicroBlogUserRecord)initWithCoder:(id)a3;
- (UIImage)profileImageCache;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setProfileImageCache:(id)a3;
- (void)setProfile_image_url:(id)a3;
- (void)setScreen_name:(id)a3;
- (void)setValuesWithUserDictionary:(id)a3;
@end

@implementation SLMicroBlogUserRecord

+ (SLMicroBlogUserRecord)userRecordWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(SLMicroBlogUserRecord);
  v5 = v4;
  if (v3) {
    [(SLMicroBlogUserRecord *)v4 setValuesWithUserDictionary:v3];
  }

  return v5;
}

- (void)setValuesWithUserDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"name"];
  [(SLMicroBlogUserRecord *)self setName:v5];

  v6 = [v4 objectForKey:@"screen_name"];
  [(SLMicroBlogUserRecord *)self setScreen_name:v6];

  id v7 = [v4 objectForKey:@"profile_image_url"];

  [(SLMicroBlogUserRecord *)self setProfile_image_url:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SLMicroBlogUserRecord *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(SLMicroBlogUserRecord *)self screen_name];
  [v4 encodeObject:v6 forKey:@"screen_name"];

  id v7 = [(SLMicroBlogUserRecord *)self profile_image_url];
  [v4 encodeObject:v7 forKey:@"profile_image_url"];
}

- (SLMicroBlogUserRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SLMicroBlogUserRecord;
  v5 = [(SLMicroBlogUserRecord *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(SLMicroBlogUserRecord *)v5 setName:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"screen_name"];
    [(SLMicroBlogUserRecord *)v5 setScreen_name:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profile_image_url"];
    [(SLMicroBlogUserRecord *)v5 setProfile_image_url:v8];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SLMicroBlogUserRecord;
  id v4 = [(SLMicroBlogUserRecord *)&v9 description];
  v5 = [(SLMicroBlogUserRecord *)self screen_name];
  v6 = [(SLMicroBlogUserRecord *)self name];
  id v7 = [v3 stringWithFormat:@"%@ screenName: %@ name: %@", v4, v5, v6];

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)screen_name
{
  return self->_screen_name;
}

- (void)setScreen_name:(id)a3
{
}

- (NSString)profile_image_url
{
  return self->_profile_image_url;
}

- (void)setProfile_image_url:(id)a3
{
}

- (UIImage)profileImageCache
{
  return (UIImage *)objc_getProperty(self, a2, 32, 1);
}

- (void)setProfileImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileImageCache, 0);
  objc_storeStrong((id *)&self->_profile_image_url, 0);
  objc_storeStrong((id *)&self->_screen_name, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end