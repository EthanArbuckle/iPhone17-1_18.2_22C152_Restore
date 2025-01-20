@interface AXUIAlertContext
- (AXDispatchTimer)showOrHideTimer;
- (AXUIAlert)alertView;
- (AXUIService)service;
- (NSDictionary)userInfo;
- (NSString)identifier;
- (NSString)subtitleText;
- (NSString)text;
- (UIImage)iconImage;
- (double)creationTimeInterval;
- (double)duration;
- (double)fadeAnimationDuration;
- (id)description;
- (unint64_t)priority;
- (unint64_t)type;
- (void)setAlertView:(id)a3;
- (void)setCreationTimeInterval:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFadeAnimationDuration:(double)a3;
- (void)setIconImage:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setService:(id)a3;
- (void)setShowOrHideTimer:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setText:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AXUIAlertContext

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(AXUIAlertContext *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@: %p identifier = \"%@\">", v5, self, v6];;

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)creationTimeInterval
{
  return self->_creationTimeInterval;
}

- (void)setCreationTimeInterval:(double)a3
{
  self->_creationTimeInterval = a3;
}

- (double)fadeAnimationDuration
{
  return self->_fadeAnimationDuration;
}

- (void)setFadeAnimationDuration:(double)a3
{
  self->_fadeAnimationDuration = a3;
}

- (AXDispatchTimer)showOrHideTimer
{
  return self->_showOrHideTimer;
}

- (void)setShowOrHideTimer:(id)a3
{
}

- (AXUIAlert)alertView
{
  return self->_alertView;
}

- (void)setAlertView:(id)a3
{
}

- (AXUIService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (void)setSubtitleText:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_showOrHideTimer, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end