@interface ENUIExposureDetailHeaderConfiguration
- (NSString)message;
- (NSString)name;
- (NSString)title;
- (NSURL)learnMoreURL;
- (void)setLearnMoreURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)setName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ENUIExposureDetailHeaderConfiguration

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSURL)learnMoreURL
{
  return self->_learnMoreURL;
}

- (void)setLearnMoreURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreURL, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end